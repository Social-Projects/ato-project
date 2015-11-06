/**
 * Compiled inline version. (Library mode)
 */

/*jshint smarttabs:true, undef:true, latedef:true, curly:true, bitwise:true, camelcase:true */
/*globals $code */

(function(exports, undefined) {
	"use strict";

	var modules = {};

	function require(ids, callback) {
		var module, defs = [];

		for (var i = 0; i < ids.length; ++i) {
			module = modules[ids[i]] || resolve(ids[i]);
			if (!module) {
				throw 'module definition dependecy not found: ' + ids[i];
			}

			defs.push(module);
		}

		callback.apply(null, defs);
	}

	function define(id, dependencies, definition) {
		if (typeof id !== 'string') {
			throw 'invalid module definition, module id must be defined and be a string';
		}

		if (dependencies === undefined) {
			throw 'invalid module definition, dependencies must be specified';
		}

		if (definition === undefined) {
			throw 'invalid module definition, definition function must be specified';
		}

		require(dependencies, function() {
			modules[id] = definition.apply(null, arguments);
		});
	}

	function defined(id) {
		return !!modules[id];
	}

	function resolve(id) {
		var target = exports;
		var fragments = id.split(/[.\/]/);

		for (var fi = 0; fi < fragments.length; ++fi) {
			if (!target[fragments[fi]]) {
				return;
			}

			target = target[fragments[fi]];
		}

		return target;
	}

	function expose(ids) {
		var i, target, id, fragments, privateModules;

		for (i = 0; i < ids.length; i++) {
			target = exports;
			id = ids[i];
			fragments = id.split(/[.\/]/);

			for (var fi = 0; fi < fragments.length - 1; ++fi) {
				if (target[fragments[fi]] === undefined) {
					target[fragments[fi]] = {};
				}

				target = target[fragments[fi]];
			}

			target[fragments[fragments.length - 1]] = modules[id];
		}
		
		// Expose private modules for unit tests
		if (exports.AMDLC_TESTS) {
			privateModules = exports.privateModules || {};

			for (id in modules) {
				privateModules[id] = modules[id];
			}

			for (i = 0; i < ids.length; i++) {
				delete privateModules[ids[i]];
			}

			exports.privateModules = privateModules;
		}
	}

// Included from: js/tinymce/plugins/paste/classes/Utils.js

/**
 * Utils.js
 *
 * Released under LGPL License.
 * Copyright (c) 1999-2015 Ephox Corp. All rights reserved
 *
 * License: http://www.tinymce.com/license
 * Contributing: http://www.tinymce.com/contributing
 */

/**
 * This class contails various utility functions for the paste plugin.
 *
 * @class tinymce.pasteplugin.Utils
 */
define("tinymce/pasteplugin/Utils", [
	"tinymce/util/Tools",
	"tinymce/html/DomParser",
	"tinymce/html/Schema"
], function(Tools, DomParser, Schema) {
	function filter(content, items) {
		Tools.each(items, function(v) {
			if (v.constructor == RegExp) {
				content = content.replace(v, '');
			} else {
				content = content.replace(v[0], v[1]);
			}
		});

		return content;
	}

	/**
	 * Gets the innerText of the specified element. It will handle edge cases
	 * and works better than textContent on Gecko.
	 *
	 * @param {String} html HTML string to get text from.
	 * @return {String} String of text with line feeds.
	 */
	function innerText(html) {
		var schema = new Schema(), domParser = new DomParser({}, schema), text = '';
		var shortEndedElements = schema.getShortEndedElements();
		var ignoreElements = Tools.makeMap('script noscript style textarea video audio iframe object', ' ');
		var blockElements = schema.getBlockElements();

		function walk(node) {
			var name = node.name, currentNode = node;

			if (name === 'br') {
				text += '\n';
				return;
			}

			// img/input/hr
			if (shortEndedElements[name]) {
				text += ' ';
			}

			// Ingore script, video contents
			if (ignoreElements[name]) {
				text += ' ';
				return;
			}

			if (node.type == 3) {
				text += node.value;
			}

			// Walk all children
			if (!node.shortEnded) {
				if ((node = node.firstChild)) {
					do {
						walk(node);
					} while ((node = node.next));
				}
			}

			// Add \n or \n\n for blocks or P
			if (blockElements[name] && currentNode.next) {
				text += '\n';

				if (name == 'p') {
					text += '\n';
				}
			}
		}

		html = filter(html, [
			/<!\[[^\]]+\]>/g // Conditional comments
		]);

		walk(domParser.parse(html));

		return text;
	}

	/**
	 * Trims the specified HTML by removing all WebKit fragments, all elements wrapping the body trailing BR elements etc.
	 *
	 * @param {String} html Html string to trim contents on.
	 * @return {String} Html contents that got trimmed.
	 */
	function trimHtml(html) {
		function trimSpaces(all, s1, s2) {
			// WebKit &nbsp; meant to preserve multiple spaces but instead inserted around all inline tags,
			// including the spans with inline styles created on paste
			if (!s1 && !s2) {
				return ' ';
			}

			return '\u00a0';
		}

		html = filter(html, [
			/^[\s\S]*<body[^>]*>\s*|\s*<\/body[^>]*>[\s\S]*$/g, // Remove anything but the contents within the BODY element
			/<!--StartFragment-->|<!--EndFragment-->/g, // Inner fragments (tables from excel on mac)
			[/( ?)<span class="Apple-converted-space">\u00a0<\/span>( ?)/g, trimSpaces],
			/<br>$/i // Trailing BR elements
		]);

		return html;
	}

	return {
		filter: filter,
		innerText: innerText,
		trimHtml: trimHtml
	};
});

// Included from: js/tinymce/plugins/paste/classes/Clipboard.js

/**
 * Clipboard.js
 *
 * Released under LGPL License.
 * Copyright (c) 1999-2015 Ephox Corp. All rights reserved
 *
 * License: http://www.tinymce.com/license
 * Contributing: http://www.tinymce.com/contributing
 */

/**
 * This class contains logic for getting HTML contents out of the clipboard.
 *
 * We need to make a lot of ugly hacks to get the contents out of the clipboard since
 * the W3C Clipboard API is broken in all browsers that have it: Gecko/WebKit/Blink.
 * We might rewrite this the way those API:s stabilize. Browsers doesn't handle pasting
 * from applications like Word the same way as it does when pasting into a contentEditable area
 * so we need to do lots of extra work to try to get to this clipboard data.
 *
 * Current implementation steps:
 *  1. On keydown with paste keys Ctrl+V or Shift+Insert create
 *     a paste bin element and move focus to that element.
 *  2. Wait for the browser to fire a "paste" event and get the contents out of the paste bin.
 *  3. Check if the paste was successful if true, process the HTML.
 *  (4). If the paste was unsuccessful use IE execCommand, Clipboard API, document.dataTransfer old WebKit API etc.
 *
 * @class tinymce.pasteplugin.Clipboard
 * @private
 */
define("tinymce/pasteplugin/Clipboard", [
	"tinymce/Env",
	"tinymce/dom/RangeUtils",
	"tinymce/util/VK",
	"tinymce/pasteplugin/Utils"
], function(Env, RangeUtils, VK, Utils) {
	return function(editor) {
		var self = this, pasteBinElm, lastRng, keyboardPasteTimeStamp = 0, draggingInternally = false;
		var pasteBinDefaultContent = '%MCEPASTEBIN%', keyboardPastePlainTextState;
		var mceInternalUrlPrefix = 'data:text/mce-internal,';

		/**
		 * Pastes the specified HTML. This means that the HTML is filtered and then
		 * inserted at the current selection in the editor. It will also fire paste events
		 * for custom user filtering.
		 *
		 * @param {String} html HTML code to paste into the current selection.
		 */
		function pasteHtml(html) {
			var args, dom = editor.dom;

			args = editor.fire('BeforePastePreProcess', {content: html}); // Internal event used by Quirks
			args = editor.fire('PastePreProcess', args);
			html = args.content;

			if (!args.isDefaultPrevented()) {
				// User has bound PastePostProcess events then we need to pass it through a DOM node
				// This is not ideal but we don't want to let the browser mess up the HTML for example
				// some browsers add &nbsp; to P tags etc
				if (editor.hasEventListeners('PastePostProcess') && !args.isDefaultPrevented()) {
					// We need to attach the element to the DOM so Sizzle selectors work on the contents
					var tempBody = dom.add(editor.getBody(), 'div', {style: 'display:none'}, html);
					args = editor.fire('PastePostProcess', {node: tempBody});
					dom.remove(tempBody);
					html = args.node.innerHTML;
				}

				if (!args.isDefaultPrevented()) {
					editor.insertContent(html, {merge: editor.settings.paste_merge_formats !== false, data: {paste: true}});
				}
			}
		}

		/**
		 * Pastes the specified text. This means that the plain text is processed
		 * and converted into BR and P elements. It will fire paste events for custom filtering.
		 *
		 * @param {String} text Text to paste as the current selection location.
		 */
		function pasteText(text) {
			text = editor.dom.encode(text).replace(/\r\n/g, '\n');

			var startBlock = editor.dom.getParent(editor.selection.getStart(), editor.dom.isBlock);

			// Create start block html for example <p attr="value">
			var forcedRootBlockName = editor.settings.forced_root_block;
			var forcedRootBlockStartHtml;
			if (forcedRootBlockName) {
				forcedRootBlockStartHtml = editor.dom.createHTML(forcedRootBlockName, editor.settings.forced_root_block_attrs);
				forcedRootBlockStartHtml = forcedRootBlockStartHtml.substr(0, forcedRootBlockStartHtml.length - 3) + '>';
			}

			if ((startBlock && /^(PRE|DIV)$/.test(startBlock.nodeName)) || !forcedRootBlockName) {
				text = Utils.filter(text, [
					[/\n/g, "<br>"]
				]);
			} else {
				text = Utils.filter(text, [
					[/\n\n/g, "</p>" + forcedRootBlockStartHtml],
					[/^(.*<\/p>)(<p>)$/, forcedRootBlockStartHtml + '$1'],
					[/\n/g, "<br />"]
				]);

				if (text.indexOf('<p>') != -1) {
					text = forcedRootBlockStartHtml + text;
				}
			}

			pasteHtml(text);
		}

		/**
		 * Creates a paste bin element as close as possible to the current caret location and places the focus inside that element
		 * so that when the real paste event occurs the contents gets inserted into this element
		 * instead of the current editor selection element.
		 */
		function createPasteBin() {
			var dom = editor.dom, body = editor.getBody();
			var viewport = editor.dom.getViewPort(editor.getWin()), scrollTop = viewport.y, top = 20;
			var scrollContainer;

			lastRng = editor.selection.getRng();

			if (editor.inline) {
				scrollContainer = editor.selection.getScrollContainer();

				// Can't always rely on scrollTop returning a useful value.
				// It returns 0 if the browser doesn't support scrollTop for the element or is non-scrollable
				if (scrollContainer && scrollContainer.scrollTop > 0) {
					scrollTop = scrollContainer.scrollTop;
				}
			}

			/**
			 * Returns the rect of the current caret if the caret is in an empty block before a
			 * BR we insert a temporary invisible character that we get the rect this way we always get a proper rect.
			 *
			 * TODO: This might be useful in core.
			 */
			function getCaretRect(rng) {
				var rects, textNode, node, container = rng.startContainer;

				rects = rng.getClientRects();
				if (rects.length) {
					return rects[0];
				}

				if (!rng.collapsed || container.nodeType != 1) {
					return;
				}

				node = container.childNodes[lastRng.startOffset];

				// Skip empty whitespace nodes
				while (node && node.nodeType == 3 && !node.data.length) {
					node = node.nextSibling;
				}

				if (!node) {
					return;
				}

				// Check if the location is |<br>
				// TODO: Might need to expand this to say |<table>
				if (node.tagName == 'BR') {
					textNode = dom.doc.createTextNode('\uFEFF');
					node.parentNode.insertBefore(textNode, node);

					rng = dom.createRng();
					rng.setStartBefore(textNode);
					rng.setEndAfter(textNode);

					rects = rng.getClientRects();
					dom.remove(textNode);
				}

				if (rects.length) {
					return rects[0];
				}
			}

			// Calculate top cordinate this is needed to avoid scrolling to top of document
			// We want the paste bin to be as close to the caret as possible to avoid scrolling
			if (lastRng.getClientRects) {
				var rect = getCaretRect(lastRng);

				if (rect) {
					// Client rects gets us closes to the actual
					// caret location in for example a wrapped paragraph block
					top = scrollTop + (rect.top - dom.getPos(body).y);
				} else {
					top = scrollTop;

					// Check if we can find a closer location by checking the range element
					var container = lastRng.startContainer;
					if (container) {
						if (container.nodeType == 3 && container.parentNode != body) {
							container = container.parentNode;
						}

						if (container.nodeType == 1) {
							top = dom.getPos(container, scrollContainer || body).y;
						}
					}
				}
			}

			// Create a pastebin
			pasteBinElm = dom.add(editor.getBody(), 'div', {
				id: "mcepastebin",
				contentEditable: true,
				"data-mce-bogus": "all",
				style: 'position: absolute; top: ' + top + 'px;' +
					'width: 10px; height: 10px; overflow: hidden; opacity: 0'
			}, pasteBinDefaultContent);

			// Move paste bin out of sight since the controlSelection rect gets displayed otherwise on IE and Gecko
			if (Env.ie || Env.gecko) {
				dom.setStyle(pasteBinElm, 'left', dom.getStyle(body, 'direction', true) == 'rtl' ? 0xFFFF : -0xFFFF);
			}

			// Prevent focus events from bubbeling fixed FocusManager issues
			dom.bind(pasteBinElm, 'beforedeactivate focusin focusout', function(e) {
				e.stopPropagation();
			});

			pasteBinElm.focus();
			editor.selection.select(pasteBinElm, true);
		}

		/**
		 * Removes the paste bin if it exists.
		 */
		function removePasteBin() {
			if (pasteBinElm) {
				var pasteBinClone;

				// WebKit/Blink might clone the div so
				// lets make sure we remove all clones
				// TODO: Man o man is this ugly. WebKit is the new IE! Remove this if they ever fix it!
				while ((pasteBinClone = editor.dom.get('mcepastebin'))) {
					editor.dom.remove(pasteBinClone);
					editor.dom.unbind(pasteBinClone);
				}

				if (lastRng) {
					editor.selection.setRng(lastRng);
				}
			}

			pasteBinElm = lastRng = null;
		}

		/**
		 * Returns the contents of the paste bin as a HTML string.
		 *
		 * @return {String} Get the contents of the paste bin.
		 */
		function getPasteBinHtml() {
			var html = '', pasteBinClones, i, clone, cloneHtml;

			// Since WebKit/Chrome might clone the paste bin when pasting
			// for example: <img style="float: right"> we need to check if any of them contains some useful html.
			// TODO: Man o man is this ugly. WebKit is the new IE! Remove this if they ever fix it!
			pasteBinClones = editor.dom.select('div[id=mcepastebin]');
			for (i = 0; i < pasteBinClones.length; i++) {
				clone = pasteBinClones[i];

				// Pasting plain text produces pastebins in pastebinds makes sence right!?
				if (clone.firstChild && clone.firstChild.id == 'mcepastebin') {
					clone = clone.firstChild;
				}

				cloneHtml = clone.innerHTML;
				if (html != pasteBinDefaultContent) {
					html += cloneHtml;
				}
			}

			return html;
		}

		/**
		 * Gets various content types out of a datatransfer object.
		 *
		 * @param {DataTransfer} dataTransfer Event fired on paste.
		 * @return {Object} Object with mime types and data for those mime types.
		 */
		function getDataTransferItems(dataTransfer) {
			var data = {};

			if (dataTransfer) {
				// Use old WebKit/IE API
				if (dataTransfer.getData) {
					var legacyText = dataTransfer.getData('Text');
					if (legacyText && legacyText.length > 0) {
						if (legacyText.indexOf(mceInternalUrlPrefix) == -1) {
							data['text/plain'] = legacyText;
						}
					}
				}

				if (dataTransfer.types) {
					for (var i = 0; i < dataTransfer.types.length; i++) {
						var contentType = dataTransfer.types[i];
						data[contentType] = dataTransfer.getData(contentType);
					}
				}
			}

			return data;
		}

		/**
		 * Gets various content types out of the Clipboard API. It will also get the
		 * plain text using older IE and WebKit API:s.
		 *
		 * @param {ClipboardEvent} clipboardEvent Event fired on paste.
		 * @return {Object} Object with mime types and data for those mime types.
		 */
		function getClipboardContent(clipboardEvent) {
			return getDataTransferItems(clipboardEvent.clipboardData || editor.getDoc().dataTransfer);
		}

		/**
		 * Checks if the clipboard contains image data if it does it will take that data
		 * and convert it into a data url image and paste that image at the caret location.
		 *
		 * @param  {ClipboardEvent} e Paste/drop event object.
		 * @param  {DOMRange} rng Optional rng object to move selection to.
		 * @return {Boolean} true/false if the image data was found or not.
		 */
		function pasteImageData(e, rng) {
			var dataTransfer = e.clipboardData || e.dataTransfer;

			function processItems(items) {
				var i, item, reader, hadImage = false;

				function pasteImage(reader) {
					if (rng) {
						editor.selection.setRng(rng);
						rng = null;
					}

					pasteHtml('<img src="' + reader.result + '">');
				}

				if (items) {
					for (i = 0; i < items.length; i++) {
						item = items[i];

						if (/^image\/(jpeg|png|gif|bmp)$/.test(item.type)) {
							reader = new FileReader();
							reader.onload = pasteImage.bind(null, reader);
							reader.readAsDataURL(item.getAsFile ? item.getAsFile() : item);

							e.preventDefault();
							hadImage = true;
						}
					}
				}

				return hadImage;
			}

			if (editor.settings.paste_data_images && dataTransfer) {
				return processItems(dataTransfer.items) || processItems(dataTransfer.files);
			}
		}

		/**
		 * Chrome on Android doesn't support proper clipboard access so we have no choice but to allow the browser default behavior.
		 *
		 * @param {Event} e Paste event object to check if it contains any data.
		 * @return {Boolean} true/false if the clipboard is empty or not.
		 */
		function isBrokenAndroidClipboardEvent(e) {
			var clipboardData = e.clipboardData;

			return navigator.userAgent.indexOf('Android') != -1 && clipboardData && clipboardData.items && clipboardData.items.length === 0;
		}

		function getCaretRangeFromEvent(e) {
			return RangeUtils.getCaretRangeFromPoint(e.clientX, e.clientY, editor.getDoc());
		}

		function hasContentType(clipboardContent, mimeType) {
			return mimeType in clipboardContent && clipboardContent[mimeType].length > 0;
		}

		function isKeyboardPasteEvent(e) {
			return (VK.metaKeyPressed(e) && e.keyCode == 86) || (e.shiftKey && e.keyCode == 45);
		}

		function registerEventHandlers() {
			editor.on('keydown', function(e) {
				function removePasteBinOnKeyUp(e) {
					// Ctrl+V or Shift+Insert
					if (isKeyboardPasteEvent(e) && !e.isDefaultPrevented()) {
						removePasteBin();
					}
				}

				// Ctrl+V or Shift+Insert
				if (isKeyboardPasteEvent(e) && !e.isDefaultPrevented()) {
					keyboardPastePlainTextState = e.shiftKey && e.keyCode == 86;

					// Edge case on Safari on Mac where it doesn't handle Cmd+Shift+V correctly
					// it fires the keydown but no paste or keyup so we are left with a paste bin
					if (keyboardPastePlainTextState && Env.webkit && navigator.userAgent.indexOf('Version/') != -1) {
						return;
					}

					// Prevent undoManager keydown handler from making an undo level with the pastebin in it
					e.stopImmediatePropagation();

					keyboardPasteTimeStamp = new Date().getTime();

					// IE doesn't support Ctrl+Shift+V and it doesn't even produce a paste event
					// so lets fake a paste event and let IE use the execCommand/dataTransfer methods
					if (Env.ie && keyboardPastePlainTextState) {
						e.preventDefault();
						editor.fire('paste', {ieFake: true});
						return;
					}

					removePasteBin();
					createPasteBin();

					// Remove pastebin if we get a keyup and no paste event
					// For example pasting a file in IE 11 will not produce a paste event
					editor.once('keyup', removePasteBinOnKeyUp);
					editor.once('paste', function() {
						editor.off('keyup', removePasteBinOnKeyUp);
					});
				}
			});

			editor.on('paste', function(e) {
				// Getting content from the Clipboard can take some time
				var clipboardTimer = new Date().getTime();
				var clipboardContent = getClipboardContent(e);
				var clipboardDelay = new Date().getTime() - clipboardTimer;

				var isKeyBoardPaste = (new Date().getTime() - keyboardPasteTimeStamp - clipboardDelay) < 1000;
				var plainTextMode = self.pasteFormat == "text" || keyboardPastePlainTextState;

				keyboardPastePlainTextState = false;
