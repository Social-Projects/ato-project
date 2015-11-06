=== OSM Contact Info Widget ===
Contributors: pablolopezmestre
Donate link: https://www.paypal.com/cgi-bin/webscr?cmd=_donations&business=6JYWV644JYL7Q&lc=ES&item_name=OSM%20Widgets&currency_code=EUR&bn=PP%2dDonationsBF%3abtn_donate_LG%2egif%3aNonHosted

Tags: widget, contact info, hcard, vcard
Requires at least: 3.6
Tested up to: 4.3
Stable tag: 1.0
License: GPLv2 or later
License URI: http://www.gnu.org/licenses/gpl-2.0.html

This plugin allows you to create a contact info card in a widget. You can add your contact information in plain text, hCard format or fontAwesome icons...

== Description ==

This plugin allows you to create a contact info card in a widget. You can add your contact information in plain text, hCard format or fontAwesome icons...

You can add your contact information to the sidebar. You can choose between 3 types of formats: plain text, hcard, or font-awesome icons.

The plugin add classes to the div tags, so you can create your own styles in your stylesheet

== Installation ==

Extract the zip file and just drop the contents in the <code>wp-content/plugins/</code> directory of your WordPress installation (or install it directly from your dashboard) and then activate it from Plugins page.

== Screenshots ==

1. Widget fields

== Frequently Asked Questions ==

= Can I change the styles of the widgets in hCard format? =

Of course. You can use your own styles, just add this classes in your stylesheet:

<h2 class="widget-title">Contact Information</h2>
<div id="osm-contact-info-widget-wrapper">
  <div id="hcard-Company Name" class="vcard">
    <div class="fn org">Company Name</div>
    <div class="adr">
      <span class="street-address">Address</span><br />
      <span class="postal-code">Postal Code</span> <span class="locality">City</span>, <span class="region">Province</span> (<span class="country-name">Country</span>)
    </div>
    <a href="mailto:email@email.com" class="email">email@email.com</a>
    <div class="tel">
      <span class="type">work</span>: <span class="value">555 555 555</span>
    </div>
    <div class="tel">
      <span class="type">work</span>: <span class="value">777 777 777</span>
    </div>
    <div class="tel">
      <span class="type">fax</span>: <span class="value">999 999 999</span>
    </div>
  </div><!-- vcard -->
  <p>lorem ipsum dolor sit amet</p>
</div><!-- osm-contact-info-widget-wrapper -->


= Can I change the styles of the widgets in plain text format? =

Of course. You can use your own styles, just add this classes in your stylesheet

<h2 class="widget-title">Contact Information</h2>
<div id="osm-contact-info-widget-wrapper">
  <div class="contactinfo-company">
    Company Name
  </div>
  <div class="contactinfo-address">
    Address<br />
    Postal Code City, Province (Country)
  </div><!-- contactinfo-address -->
  <div class="contactinfo-phones">
    Teléfono 1: 555 555 555<br />
    Teléfono 2: 777 777 777<br />
    Fax: 999 999 999<br />
  </div><!-- contactinfo-phones -->
  <div class="contactinfo-email">
    <a href="mailto:email@email.com" class="email">email@email.com</a>
  </div><!-- contactinfo-email -->
  <p class="contactinfo-text">lorem ipsum dolor sit amet</p>
</div><!-- osm-contact-info-widget-wrapper -->


= Can I change the styles of the widgets in font awesome icons format? =

Of course. You can use your own styles, just add this classes in your stylesheet

<h2 class="widget-title">Contact Information</h2>
<div id="osm-contact-info-widget-wrapper">
  <div class="contactinfo-company">
    <i class="fa fa-list"></i> Company Name
  </div>
  <div class="contactinfo-address">
    <i class="fa fa-map-marker"></i> Address<br />
    Postal Code City, Province (Country)
  </div><!-- contactinfo-address -->
  <div class="contactinfo-phones">
    <i class="fa fa-phone"></i> 555 555 555<br />
    <i class="fa fa-phone"></i> 777 777 777<br />
    <i class="fa fa-fax"></i> 999 999 999<br />
  </div><!-- contactinfo-phones -->
  <div class="contactinfo-email">
    <i class="fa fa-envelope"></i> <a href="mailto:email@email.com">email@email.com</a>
  </div><!-- contactinfo-email -->
  <p class="contactinfo-text">lorem ipsum dolor sit amet</p>
</div><!-- osm-contact-info-widget-wrapper -->


== Changelog ==

= 1.0 =
*First public release