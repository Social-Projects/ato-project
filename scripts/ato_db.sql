-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: ato
-- ------------------------------------------------------
-- Server version	5.5.44-0ubuntu0.14.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `wp_bwg_album`
--

DROP TABLE IF EXISTS `wp_bwg_album`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_album` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `preview_image` mediumtext NOT NULL,
  `random_preview_image` mediumtext NOT NULL,
  `order` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_album`
--

LOCK TABLES `wp_bwg_album` WRITE;
/*!40000 ALTER TABLE `wp_bwg_album` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwg_album` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_album_gallery`
--

DROP TABLE IF EXISTS `wp_bwg_album_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_album_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `album_id` bigint(20) NOT NULL,
  `is_album` tinyint(1) NOT NULL,
  `alb_gal_id` bigint(20) NOT NULL,
  `order` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_album_gallery`
--

LOCK TABLES `wp_bwg_album_gallery` WRITE;
/*!40000 ALTER TABLE `wp_bwg_album_gallery` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwg_album_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_gallery`
--

DROP TABLE IF EXISTS `wp_bwg_gallery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_gallery` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` mediumtext NOT NULL,
  `page_link` mediumtext NOT NULL,
  `preview_image` mediumtext NOT NULL,
  `random_preview_image` mediumtext NOT NULL,
  `order` bigint(20) NOT NULL,
  `author` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `gallery_type` varchar(32) NOT NULL,
  `gallery_source` varchar(256) NOT NULL,
  `autogallery_image_number` int(4) NOT NULL,
  `update_flag` varchar(32) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_gallery`
--

LOCK TABLES `wp_bwg_gallery` WRITE;
/*!40000 ALTER TABLE `wp_bwg_gallery` DISABLE KEYS */;
INSERT INTO `wp_bwg_gallery` VALUES (1,'Demo','demo','','','','/thumb/1.jpg',1,1,1,'','',12,'');
/*!40000 ALTER TABLE `wp_bwg_gallery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_image`
--

DROP TABLE IF EXISTS `wp_bwg_image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_image` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `gallery_id` bigint(20) NOT NULL,
  `slug` longtext NOT NULL,
  `filename` varchar(255) NOT NULL,
  `image_url` mediumtext NOT NULL,
  `thumb_url` mediumtext NOT NULL,
  `description` mediumtext NOT NULL,
  `alt` mediumtext NOT NULL,
  `date` varchar(128) NOT NULL,
  `size` varchar(128) NOT NULL,
  `filetype` varchar(128) NOT NULL,
  `resolution` varchar(128) NOT NULL,
  `author` bigint(20) NOT NULL,
  `order` bigint(20) NOT NULL,
  `published` tinyint(1) NOT NULL,
  `comment_count` bigint(20) NOT NULL,
  `avg_rating` float NOT NULL,
  `rate_count` bigint(20) NOT NULL,
  `hit_count` bigint(20) NOT NULL,
  `redirect_url` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_image`
--

LOCK TABLES `wp_bwg_image` WRITE;
/*!40000 ALTER TABLE `wp_bwg_image` DISABLE KEYS */;
INSERT INTO `wp_bwg_image` VALUES (1,1,'1','1','/1.jpg','/thumb/1.jpg','Aperture: 2.6\nCamera: WT19i\nIso: 800\nOrientation: 1\n','1','28 October 2015, 09:03','676 KB','JPG','1200 x 900 px',1,5,1,0,0,0,0,''),(2,1,'2','2','/2.jpg','/thumb/2.jpg','Camera: Canon MF3200 Series\nOrientation: 1\n','2','28 October 2015, 09:03','273 KB','JPG','600 x 636 px',1,4,1,0,0,0,0,''),(3,1,'3','3','/3.jpg','/thumb/3.jpg','Aperture: 2.6\nCamera: WT19i\nIso: 320\nOrientation: 1\n','3','28 October 2015, 09:03','730 KB','JPG','900 x 1200 px',1,3,1,0,0,0,0,''),(4,1,'Expenses_UseCase','Expenses_UseCase','/Expenses_UseCase.png','/thumb/Expenses_UseCase.png','','Expenses_UseCase','28 October 2015, 09:03','44 KB','PNG','588 x 443 px',1,2,1,0,0,0,0,''),(5,1,'s79334748','s79334748','/s79334748.jpg','/thumb/s79334748.jpg','','s79334748','28 October 2015, 09:03','30 KB','JPG','361 x 500 px',1,1,1,0,0,0,0,'');
/*!40000 ALTER TABLE `wp_bwg_image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_image_comment`
--

DROP TABLE IF EXISTS `wp_bwg_image_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_image_comment` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `date` varchar(64) NOT NULL,
  `comment` mediumtext NOT NULL,
  `url` mediumtext NOT NULL,
  `mail` mediumtext NOT NULL,
  `published` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_image_comment`
--

LOCK TABLES `wp_bwg_image_comment` WRITE;
/*!40000 ALTER TABLE `wp_bwg_image_comment` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwg_image_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_image_rate`
--

DROP TABLE IF EXISTS `wp_bwg_image_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_image_rate` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `image_id` bigint(20) NOT NULL,
  `rate` float NOT NULL,
  `ip` varchar(64) NOT NULL,
  `date` varchar(64) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_image_rate`
--

LOCK TABLES `wp_bwg_image_rate` WRITE;
/*!40000 ALTER TABLE `wp_bwg_image_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwg_image_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_image_tag`
--

DROP TABLE IF EXISTS `wp_bwg_image_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_image_tag` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `tag_id` bigint(20) NOT NULL,
  `image_id` bigint(20) NOT NULL,
  `gallery_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_image_tag`
--

LOCK TABLES `wp_bwg_image_tag` WRITE;
/*!40000 ALTER TABLE `wp_bwg_image_tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_bwg_image_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_option`
--

DROP TABLE IF EXISTS `wp_bwg_option`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_option` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `images_directory` mediumtext NOT NULL,
  `masonry` varchar(255) NOT NULL,
  `mosaic` varchar(255) NOT NULL,
  `resizable_mosaic` tinyint(1) NOT NULL,
  `mosaic_total_width` int(4) NOT NULL,
  `image_column_number` int(4) NOT NULL,
  `images_per_page` int(4) NOT NULL,
  `thumb_width` int(4) NOT NULL,
  `thumb_height` int(4) NOT NULL,
  `upload_thumb_width` int(4) NOT NULL,
  `upload_thumb_height` int(4) NOT NULL,
  `image_enable_page` tinyint(1) NOT NULL,
  `image_title_show_hover` varchar(20) NOT NULL,
  `album_column_number` int(4) NOT NULL,
  `albums_per_page` int(4) NOT NULL,
  `album_title_show_hover` varchar(8) NOT NULL,
  `album_thumb_width` int(4) NOT NULL,
  `album_thumb_height` int(4) NOT NULL,
  `album_enable_page` tinyint(1) NOT NULL,
  `extended_album_height` int(4) NOT NULL,
  `extended_album_description_enable` tinyint(1) NOT NULL,
  `image_browser_width` int(4) NOT NULL,
  `image_browser_title_enable` tinyint(1) NOT NULL,
  `image_browser_description_enable` tinyint(1) NOT NULL,
  `blog_style_width` int(4) NOT NULL,
  `blog_style_title_enable` tinyint(1) NOT NULL,
  `blog_style_images_per_page` int(4) NOT NULL,
  `blog_style_enable_page` tinyint(1) NOT NULL,
  `slideshow_type` varchar(16) NOT NULL,
  `slideshow_interval` int(4) NOT NULL,
  `slideshow_width` int(4) NOT NULL,
  `slideshow_height` int(4) NOT NULL,
  `slideshow_enable_autoplay` tinyint(1) NOT NULL,
  `slideshow_enable_shuffle` tinyint(1) NOT NULL,
  `slideshow_enable_ctrl` tinyint(1) NOT NULL,
  `slideshow_enable_filmstrip` tinyint(1) NOT NULL,
  `slideshow_filmstrip_height` int(4) NOT NULL,
  `slideshow_enable_title` tinyint(1) NOT NULL,
  `slideshow_title_position` varchar(16) NOT NULL,
  `slideshow_enable_description` tinyint(1) NOT NULL,
  `slideshow_description_position` varchar(16) NOT NULL,
  `slideshow_enable_music` tinyint(1) NOT NULL,
  `slideshow_audio_url` varchar(255) NOT NULL,
  `popup_width` int(4) NOT NULL,
  `popup_height` int(4) NOT NULL,
  `popup_type` varchar(16) NOT NULL,
  `popup_interval` int(4) NOT NULL,
  `popup_enable_filmstrip` tinyint(1) NOT NULL,
  `popup_filmstrip_height` int(4) NOT NULL,
  `popup_enable_ctrl_btn` tinyint(1) NOT NULL,
  `popup_enable_fullscreen` tinyint(1) NOT NULL,
  `popup_enable_info` tinyint(1) NOT NULL,
  `popup_info_always_show` tinyint(1) NOT NULL,
  `popup_enable_rate` tinyint(1) NOT NULL,
  `popup_enable_comment` tinyint(1) NOT NULL,
  `popup_enable_email` tinyint(1) NOT NULL,
  `popup_enable_captcha` tinyint(1) NOT NULL,
  `popup_enable_download` tinyint(1) NOT NULL,
  `popup_enable_fullsize_image` tinyint(1) NOT NULL,
  `popup_enable_facebook` tinyint(1) NOT NULL,
  `popup_enable_twitter` tinyint(1) NOT NULL,
  `popup_enable_google` tinyint(1) NOT NULL,
  `watermark_type` varchar(8) NOT NULL,
  `watermark_position` varchar(16) NOT NULL,
  `watermark_width` int(4) NOT NULL,
  `watermark_height` int(4) NOT NULL,
  `watermark_url` mediumtext NOT NULL,
  `watermark_text` mediumtext NOT NULL,
  `watermark_link` mediumtext NOT NULL,
  `watermark_font_size` int(4) NOT NULL,
  `watermark_font` varchar(16) NOT NULL,
  `watermark_color` varchar(8) NOT NULL,
  `watermark_opacity` int(4) NOT NULL,
  `built_in_watermark_type` varchar(16) NOT NULL,
  `built_in_watermark_position` varchar(16) NOT NULL,
  `built_in_watermark_size` int(4) NOT NULL,
  `built_in_watermark_url` mediumtext NOT NULL,
  `built_in_watermark_text` mediumtext NOT NULL,
  `built_in_watermark_font_size` int(4) NOT NULL,
  `built_in_watermark_font` varchar(16) NOT NULL,
  `built_in_watermark_color` varchar(8) NOT NULL,
  `built_in_watermark_opacity` int(4) NOT NULL,
  `image_right_click` tinyint(1) NOT NULL,
  `popup_fullscreen` tinyint(1) NOT NULL,
  `gallery_role` tinyint(1) NOT NULL,
  `album_role` tinyint(1) NOT NULL,
  `image_role` tinyint(1) NOT NULL,
  `popup_autoplay` tinyint(1) NOT NULL,
  `album_view_type` varchar(16) NOT NULL,
  `popup_enable_pinterest` tinyint(1) NOT NULL,
  `popup_enable_tumblr` tinyint(1) NOT NULL,
  `show_search_box` tinyint(1) NOT NULL,
  `search_box_width` int(4) NOT NULL,
  `preload_images` tinyint(1) NOT NULL,
  `preload_images_count` int(4) NOT NULL,
  `thumb_click_action` varchar(16) NOT NULL,
  `thumb_link_target` tinyint(1) NOT NULL,
  `comment_moderation` tinyint(1) NOT NULL,
  `popup_hit_counter` tinyint(1) NOT NULL,
  `enable_ML_import` tinyint(1) NOT NULL,
  `showthumbs_name` tinyint(1) NOT NULL,
  `show_album_name` tinyint(1) NOT NULL,
  `show_image_counts` tinyint(1) NOT NULL,
  `upload_img_width` int(4) NOT NULL,
  `upload_img_height` int(4) NOT NULL,
  `play_icon` tinyint(1) NOT NULL,
  `show_masonry_thumb_description` tinyint(1) NOT NULL,
  `slideshow_title_full_width` tinyint(1) NOT NULL,
  `popup_info_full_width` tinyint(1) NOT NULL,
  `show_sort_images` tinyint(1) NOT NULL,
  `autoupdate_interval` int(4) NOT NULL,
  `instagram_client_id` varchar(40) NOT NULL,
  `description_tb` tinyint(1) NOT NULL,
  `enable_seo` tinyint(1) NOT NULL,
  `autohide_lightbox_navigation` tinyint(1) NOT NULL,
  `autohide_slideshow_navigation` tinyint(1) NOT NULL,
  `read_metadata` tinyint(1) NOT NULL,
  `enable_loop` tinyint(1) NOT NULL,
  `enable_addthis` tinyint(1) NOT NULL,
  `addthis_profile_id` varchar(66) NOT NULL,
  `carousel_interval` int(4) NOT NULL,
  `carousel_width` int(4) NOT NULL,
  `carousel_height` int(4) NOT NULL,
  `carousel_image_column_number` int(4) NOT NULL,
  `carousel_image_par` varchar(32) NOT NULL,
  `carousel_enable_title` tinyint(1) NOT NULL,
  `carousel_enable_autoplay` tinyint(1) NOT NULL,
  `carousel_r_width` int(4) NOT NULL,
  `carousel_fit_containerWidth` tinyint(1) NOT NULL,
  `carousel_prev_next_butt` tinyint(1) NOT NULL,
  `carousel_play_pause_butt` tinyint(1) NOT NULL,
  `permissions` varchar(20) NOT NULL,
  `facebook_app_id` varchar(64) NOT NULL,
  `facebook_app_secret` varchar(64) NOT NULL,
  `show_tag_box` tinyint(1) NOT NULL,
  `show_hide_custom_post` tinyint(1) NOT NULL,
  `show_hide_post_meta` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_option`
--

LOCK TABLES `wp_bwg_option` WRITE;
/*!40000 ALTER TABLE `wp_bwg_option` DISABLE KEYS */;
INSERT INTO `wp_bwg_option` VALUES (1,'wp-content/uploads','vertical','vertical',0,100,5,30,180,90,300,300,1,'none',5,30,'hover',120,90,1,150,1,800,1,1,800,1,5,1,'fade',5,800,500,0,0,1,1,90,0,'top-right',0,'bottom-right',0,'',800,500,'fade',5,1,70,1,1,1,0,0,1,0,0,0,0,1,1,1,'none','bottom-left',90,90,'http://localhost/ato-project/wp-content/plugins/photo-gallery/images/watermark.png','web-dorado.com','https://web-dorado.com',20,'arial','FFFFFF',30,'none','middle-center',15,'http://localhost/ato-project/wp-content/plugins/photo-gallery/images/watermark.png','web-dorado.com',20,'arial','FFFFFF',30,0,0,0,0,0,0,'thumbnail',0,0,0,180,0,10,'open_lightbox',1,0,0,0,0,0,0,1200,1200,1,0,0,0,0,30,'',0,1,1,1,1,1,0,'',5,300,300,5,'0.75',0,0,800,1,1,1,'manage_options','','',0,0,0);
/*!40000 ALTER TABLE `wp_bwg_option` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_shortcode`
--

DROP TABLE IF EXISTS `wp_bwg_shortcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_shortcode` (
  `id` bigint(20) NOT NULL,
  `tagtext` mediumtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_shortcode`
--

LOCK TABLES `wp_bwg_shortcode` WRITE;
/*!40000 ALTER TABLE `wp_bwg_shortcode` DISABLE KEYS */;
INSERT INTO `wp_bwg_shortcode` VALUES (1,' gallery_type=\"thumbnails\" theme_id=\"1\" gallery_id=\"0\" sort_by=\"order\" order_by=\"asc\" show_search_box=\"0\" show_sort_images=\"0\" search_box_width=\"180\" image_column_number=\"5\" images_per_page=\"30\" image_title=\"none\" image_enable_page=\"1\" thumb_width=\"180\" thumb_height=\"90\" load_more_image_count=\"30\" show_tag_box=\"0\" thumb_click_action=\"open_lightbox\" thumb_link_target=\"1\" popup_fullscreen=\"0\" popup_autoplay=\"0\" popup_width=\"800\" popup_height=\"500\" popup_effect=\"fade\" popup_interval=\"5\" popup_enable_filmstrip=\"1\" popup_filmstrip_height=\"70\" popup_enable_ctrl_btn=\"1\" popup_enable_fullscreen=\"1\" popup_enable_info=\"1\" popup_info_always_show=\"0\" popup_info_full_width=\"0\" popup_enable_rate=\"0\" popup_enable_comment=\"1\" popup_hit_counter=\"0\" popup_enable_facebook=\"1\" popup_enable_twitter=\"1\" popup_enable_google=\"1\" popup_enable_pinterest=\"0\" popup_enable_tumblr=\"0\" show_tag_box=\"0\" watermark_type=\"none\" watermark_link=\"https%3A%2F%2Fweb-dorado.com\"'),(2,' gallery_type=\"slideshow\" theme_id=\"1\" gallery_id=\"0\" sort_by=\"order\" order_by=\"asc\" slideshow_effect=\"fade\" slideshow_interval=\"5\" slideshow_width=\"800\" slideshow_height=\"500\" enable_slideshow_autoplay=\"0\" enable_slideshow_shuffle=\"0\" enable_slideshow_ctrl=\"1\" enable_slideshow_filmstrip=\"1\" slideshow_filmstrip_height=\"90\" slideshow_enable_title=\"0\" slideshow_title_position=\"top-right\" slideshow_title_full_width=\"0\" slideshow_enable_description=\"0\" slideshow_description_position=\"bottom-right\" enable_slideshow_music=\"0\" slideshow_music_url=\"\" watermark_type=\"none\" watermark_link=\"https%3A%2F%2Fweb-dorado.com\"'),(3,' gallery_type=\"thumbnails\" theme_id=\"1\" gallery_id=\"0\" sort_by=\"order\" order_by=\"asc\" show_search_box=\"0\" show_sort_images=\"0\" search_box_width=\"180\" image_column_number=\"5\" images_per_page=\"30\" image_title=\"none\" image_enable_page=\"1\" thumb_width=\"180\" thumb_height=\"90\" load_more_image_count=\"30\" show_tag_box=\"0\" thumb_click_action=\"open_lightbox\" thumb_link_target=\"1\" popup_fullscreen=\"0\" popup_autoplay=\"0\" popup_width=\"800\" popup_height=\"500\" popup_effect=\"fade\" popup_interval=\"5\" popup_enable_filmstrip=\"1\" popup_filmstrip_height=\"70\" popup_enable_ctrl_btn=\"1\" popup_enable_fullscreen=\"1\" popup_enable_info=\"1\" popup_info_always_show=\"0\" popup_info_full_width=\"0\" popup_enable_rate=\"0\" popup_enable_comment=\"1\" popup_hit_counter=\"0\" popup_enable_facebook=\"1\" popup_enable_twitter=\"1\" popup_enable_google=\"1\" popup_enable_pinterest=\"0\" popup_enable_tumblr=\"0\" show_tag_box=\"0\" watermark_type=\"none\" watermark_link=\"https%3A%2F%2Fweb-dorado.com\"');
/*!40000 ALTER TABLE `wp_bwg_shortcode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_bwg_theme`
--

DROP TABLE IF EXISTS `wp_bwg_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_bwg_theme` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `thumb_margin` int(4) NOT NULL,
  `thumb_padding` int(4) NOT NULL,
  `thumb_border_radius` varchar(32) NOT NULL,
  `thumb_border_width` int(4) NOT NULL,
  `thumb_border_style` varchar(16) NOT NULL,
  `thumb_border_color` varchar(8) NOT NULL,
  `thumb_bg_color` varchar(8) NOT NULL,
  `thumbs_bg_color` varchar(8) NOT NULL,
  `thumb_bg_transparent` int(4) NOT NULL,
  `thumb_box_shadow` varchar(32) NOT NULL,
  `thumb_transparent` int(4) NOT NULL,
  `thumb_align` varchar(8) NOT NULL,
  `thumb_hover_effect` varchar(128) NOT NULL,
  `thumb_hover_effect_value` varchar(128) NOT NULL,
  `thumb_transition` tinyint(1) NOT NULL,
  `thumb_title_font_color` varchar(8) NOT NULL,
  `thumb_title_font_style` varchar(16) NOT NULL,
  `thumb_title_pos` varchar(8) NOT NULL,
  `thumb_title_font_size` int(4) NOT NULL,
  `thumb_title_font_weight` varchar(8) NOT NULL,
  `thumb_title_margin` varchar(32) NOT NULL,
  `thumb_title_shadow` varchar(32) NOT NULL,
  `page_nav_position` varchar(8) NOT NULL,
  `page_nav_align` varchar(8) NOT NULL,
  `page_nav_number` tinyint(1) NOT NULL,
  `page_nav_font_size` int(4) NOT NULL,
  `page_nav_font_style` varchar(32) NOT NULL,
  `page_nav_font_color` varchar(8) NOT NULL,
  `page_nav_font_weight` varchar(8) NOT NULL,
  `page_nav_border_width` int(4) NOT NULL,
  `page_nav_border_style` varchar(16) NOT NULL,
  `page_nav_border_color` varchar(8) NOT NULL,
  `page_nav_border_radius` varchar(32) NOT NULL,
  `page_nav_margin` varchar(32) NOT NULL,
  `page_nav_padding` varchar(32) NOT NULL,
  `page_nav_button_bg_color` varchar(8) NOT NULL,
  `page_nav_button_bg_transparent` int(4) NOT NULL,
  `page_nav_box_shadow` varchar(32) NOT NULL,
  `page_nav_button_transition` tinyint(1) NOT NULL,
  `page_nav_button_text` tinyint(1) NOT NULL,
  `lightbox_overlay_bg_color` varchar(8) NOT NULL,
  `lightbox_overlay_bg_transparent` int(4) NOT NULL,
  `lightbox_bg_color` varchar(8) NOT NULL,
  `lightbox_ctrl_btn_pos` varchar(8) NOT NULL,
  `lightbox_ctrl_btn_align` varchar(8) NOT NULL,
  `lightbox_ctrl_btn_height` int(4) NOT NULL,
  `lightbox_ctrl_btn_margin_top` int(4) NOT NULL,
  `lightbox_ctrl_btn_margin_left` int(4) NOT NULL,
  `lightbox_ctrl_btn_transparent` int(4) NOT NULL,
  `lightbox_ctrl_btn_color` varchar(8) NOT NULL,
  `lightbox_toggle_btn_height` int(4) NOT NULL,
  `lightbox_toggle_btn_width` int(4) NOT NULL,
  `lightbox_ctrl_cont_bg_color` varchar(8) NOT NULL,
  `lightbox_ctrl_cont_transparent` int(4) NOT NULL,
  `lightbox_ctrl_cont_border_radius` int(4) NOT NULL,
  `lightbox_close_btn_transparent` int(4) NOT NULL,
  `lightbox_close_btn_bg_color` varchar(8) NOT NULL,
  `lightbox_close_btn_border_width` int(4) NOT NULL,
  `lightbox_close_btn_border_radius` varchar(32) NOT NULL,
  `lightbox_close_btn_border_style` varchar(16) NOT NULL,
  `lightbox_close_btn_border_color` varchar(8) NOT NULL,
  `lightbox_close_btn_box_shadow` varchar(32) NOT NULL,
  `lightbox_close_btn_color` varchar(8) NOT NULL,
  `lightbox_close_btn_size` int(4) NOT NULL,
  `lightbox_close_btn_width` int(4) NOT NULL,
  `lightbox_close_btn_height` int(4) NOT NULL,
  `lightbox_close_btn_top` varchar(8) NOT NULL,
  `lightbox_close_btn_right` varchar(8) NOT NULL,
  `lightbox_close_btn_full_color` varchar(8) NOT NULL,
  `lightbox_rl_btn_bg_color` varchar(8) NOT NULL,
  `lightbox_rl_btn_transparent` int(4) NOT NULL,
  `lightbox_rl_btn_border_radius` varchar(32) NOT NULL,
  `lightbox_rl_btn_border_width` int(4) NOT NULL,
  `lightbox_rl_btn_border_style` varchar(32) NOT NULL,
  `lightbox_rl_btn_border_color` varchar(8) NOT NULL,
  `lightbox_rl_btn_box_shadow` varchar(32) NOT NULL,
  `lightbox_rl_btn_color` varchar(8) NOT NULL,
  `lightbox_rl_btn_height` int(4) NOT NULL,
  `lightbox_rl_btn_width` int(4) NOT NULL,
  `lightbox_rl_btn_size` int(4) NOT NULL,
  `lightbox_close_rl_btn_hover_color` varchar(8) NOT NULL,
  `lightbox_comment_pos` varchar(8) NOT NULL,
  `lightbox_comment_width` int(4) NOT NULL,
  `lightbox_comment_bg_color` varchar(8) NOT NULL,
  `lightbox_comment_font_color` varchar(8) NOT NULL,
  `lightbox_comment_font_style` varchar(16) NOT NULL,
  `lightbox_comment_font_size` int(4) NOT NULL,
  `lightbox_comment_button_bg_color` varchar(8) NOT NULL,
  `lightbox_comment_button_border_color` varchar(8) NOT NULL,
  `lightbox_comment_button_border_width` int(4) NOT NULL,
  `lightbox_comment_button_border_style` varchar(16) NOT NULL,
  `lightbox_comment_button_border_radius` varchar(32) NOT NULL,
  `lightbox_comment_button_padding` varchar(32) NOT NULL,
  `lightbox_comment_input_bg_color` varchar(8) NOT NULL,
  `lightbox_comment_input_border_color` varchar(8) NOT NULL,
  `lightbox_comment_input_border_width` int(4) NOT NULL,
  `lightbox_comment_input_border_style` varchar(16) NOT NULL,
  `lightbox_comment_input_border_radius` varchar(32) NOT NULL,
  `lightbox_comment_input_padding` varchar(32) NOT NULL,
  `lightbox_comment_separator_width` int(4) NOT NULL,
  `lightbox_comment_separator_style` varchar(16) NOT NULL,
  `lightbox_comment_separator_color` varchar(8) NOT NULL,
  `lightbox_comment_author_font_size` int(4) NOT NULL,
  `lightbox_comment_date_font_size` int(4) NOT NULL,
  `lightbox_comment_body_font_size` int(4) NOT NULL,
  `lightbox_comment_share_button_color` varchar(8) NOT NULL,
  `lightbox_filmstrip_pos` varchar(8) NOT NULL,
  `lightbox_filmstrip_rl_bg_color` varchar(8) NOT NULL,
  `lightbox_filmstrip_rl_btn_size` int(4) NOT NULL,
  `lightbox_filmstrip_rl_btn_color` varchar(8) NOT NULL,
  `lightbox_filmstrip_thumb_margin` varchar(32) NOT NULL,
  `lightbox_filmstrip_thumb_border_width` int(4) NOT NULL,
  `lightbox_filmstrip_thumb_border_style` varchar(16) NOT NULL,
  `lightbox_filmstrip_thumb_border_color` varchar(8) NOT NULL,
  `lightbox_filmstrip_thumb_border_radius` varchar(32) NOT NULL,
  `lightbox_filmstrip_thumb_deactive_transparent` int(4) NOT NULL,
  `lightbox_filmstrip_thumb_active_border_width` int(4) NOT NULL,
  `lightbox_filmstrip_thumb_active_border_color` varchar(8) NOT NULL,
  `lightbox_rl_btn_style` varchar(16) NOT NULL,
  `album_compact_back_font_color` varchar(8) NOT NULL,
  `album_compact_back_font_style` varchar(16) NOT NULL,
  `album_compact_back_font_size` int(4) NOT NULL,
  `album_compact_back_font_weight` varchar(8) NOT NULL,
  `album_compact_back_padding` varchar(32) NOT NULL,
  `album_compact_title_font_color` varchar(8) NOT NULL,
  `album_compact_title_font_style` varchar(16) NOT NULL,
  `album_compact_thumb_title_pos` varchar(8) NOT NULL,
  `album_compact_title_font_size` int(4) NOT NULL,
  `album_compact_title_font_weight` varchar(8) NOT NULL,
  `album_compact_title_margin` varchar(32) NOT NULL,
  `album_compact_title_shadow` varchar(32) NOT NULL,
  `album_compact_thumb_margin` int(4) NOT NULL,
  `album_compact_thumb_padding` int(4) NOT NULL,
  `album_compact_thumb_border_radius` varchar(32) NOT NULL,
  `album_compact_thumb_border_width` int(4) NOT NULL,
  `album_compact_thumb_border_style` varchar(8) NOT NULL,
  `album_compact_thumb_border_color` varchar(8) NOT NULL,
  `album_compact_thumb_bg_color` varchar(8) NOT NULL,
  `album_compact_thumbs_bg_color` varchar(8) NOT NULL,
  `album_compact_thumb_bg_transparent` int(4) NOT NULL,
  `album_compact_thumb_box_shadow` varchar(32) NOT NULL,
  `album_compact_thumb_transparent` int(4) NOT NULL,
  `album_compact_thumb_align` varchar(8) NOT NULL,
  `album_compact_thumb_hover_effect` varchar(64) NOT NULL,
  `album_compact_thumb_hover_effect_value` varchar(64) NOT NULL,
  `album_compact_thumb_transition` tinyint(1) NOT NULL,
  `album_extended_thumb_margin` int(4) NOT NULL,
  `album_extended_thumb_padding` int(4) NOT NULL,
  `album_extended_thumb_border_radius` varchar(32) NOT NULL,
  `album_extended_thumb_border_width` int(4) NOT NULL,
  `album_extended_thumb_border_style` varchar(8) NOT NULL,
  `album_extended_thumb_border_color` varchar(8) NOT NULL,
  `album_extended_thumb_bg_color` varchar(8) NOT NULL,
  `album_extended_thumbs_bg_color` varchar(8) NOT NULL,
  `album_extended_thumb_bg_transparent` int(4) NOT NULL,
  `album_extended_thumb_box_shadow` varchar(32) NOT NULL,
  `album_extended_thumb_transparent` int(4) NOT NULL,
  `album_extended_thumb_align` varchar(8) NOT NULL,
  `album_extended_thumb_hover_effect` varchar(64) NOT NULL,
  `album_extended_thumb_hover_effect_value` varchar(64) NOT NULL,
  `album_extended_thumb_transition` tinyint(1) NOT NULL,
  `album_extended_back_font_color` varchar(8) NOT NULL,
  `album_extended_back_font_style` varchar(16) NOT NULL,
  `album_extended_back_font_size` int(4) NOT NULL,
  `album_extended_back_font_weight` varchar(8) NOT NULL,
  `album_extended_back_padding` varchar(32) NOT NULL,
  `album_extended_div_bg_color` varchar(8) NOT NULL,
  `album_extended_div_bg_transparent` int(4) NOT NULL,
  `album_extended_div_border_radius` varchar(32) NOT NULL,
  `album_extended_div_margin` varchar(32) NOT NULL,
  `album_extended_div_padding` int(4) NOT NULL,
  `album_extended_div_separator_width` int(4) NOT NULL,
  `album_extended_div_separator_style` varchar(8) NOT NULL,
  `album_extended_div_separator_color` varchar(8) NOT NULL,
  `album_extended_thumb_div_bg_color` varchar(8) NOT NULL,
  `album_extended_thumb_div_border_radius` varchar(32) NOT NULL,
  `album_extended_thumb_div_border_width` int(4) NOT NULL,
  `album_extended_thumb_div_border_style` varchar(8) NOT NULL,
  `album_extended_thumb_div_border_color` varchar(8) NOT NULL,
  `album_extended_thumb_div_padding` varchar(32) NOT NULL,
  `album_extended_text_div_bg_color` varchar(8) NOT NULL,
  `album_extended_text_div_border_radius` varchar(32) NOT NULL,
  `album_extended_text_div_border_width` int(4) NOT NULL,
  `album_extended_text_div_border_style` varchar(8) NOT NULL,
  `album_extended_text_div_border_color` varchar(8) NOT NULL,
  `album_extended_text_div_padding` varchar(32) NOT NULL,
  `album_extended_title_span_border_width` int(4) NOT NULL,
  `album_extended_title_span_border_style` varchar(8) NOT NULL,
  `album_extended_title_span_border_color` varchar(8) NOT NULL,
  `album_extended_title_font_color` varchar(8) NOT NULL,
  `album_extended_title_font_style` varchar(16) NOT NULL,
  `album_extended_title_font_size` int(4) NOT NULL,
  `album_extended_title_font_weight` varchar(8) NOT NULL,
  `album_extended_title_margin_bottom` int(4) NOT NULL,
  `album_extended_title_padding` varchar(32) NOT NULL,
  `album_extended_desc_span_border_width` int(4) NOT NULL,
  `album_extended_desc_span_border_style` varchar(8) NOT NULL,
  `album_extended_desc_span_border_color` varchar(8) NOT NULL,
  `album_extended_desc_font_color` varchar(8) NOT NULL,
  `album_extended_desc_font_style` varchar(16) NOT NULL,
  `album_extended_desc_font_size` int(4) NOT NULL,
  `album_extended_desc_font_weight` varchar(8) NOT NULL,
  `album_extended_desc_padding` varchar(32) NOT NULL,
  `album_extended_desc_more_color` varchar(8) NOT NULL,
  `album_extended_desc_more_size` int(4) NOT NULL,
  `masonry_thumb_padding` int(4) NOT NULL,
  `masonry_thumb_border_radius` varchar(32) NOT NULL,
  `masonry_thumb_border_width` int(4) NOT NULL,
  `masonry_thumb_border_style` varchar(8) NOT NULL,
  `masonry_thumb_border_color` varchar(8) NOT NULL,
  `masonry_thumbs_bg_color` varchar(8) NOT NULL,
  `masonry_thumb_bg_transparent` int(4) NOT NULL,
  `masonry_thumb_transparent` int(4) NOT NULL,
  `masonry_thumb_align` varchar(8) NOT NULL,
  `masonry_thumb_hover_effect` varchar(64) NOT NULL,
  `masonry_thumb_hover_effect_value` varchar(64) NOT NULL,
  `masonry_thumb_transition` tinyint(1) NOT NULL,
  `mosaic_thumb_padding` int(4) NOT NULL,
  `mosaic_thumb_border_radius` varchar(32) NOT NULL,
  `mosaic_thumb_border_width` int(4) NOT NULL,
  `mosaic_thumb_border_style` varchar(8) NOT NULL,
  `mosaic_thumb_border_color` varchar(8) NOT NULL,
  `mosaic_thumbs_bg_color` varchar(8) NOT NULL,
  `mosaic_thumb_bg_transparent` int(4) NOT NULL,
  `mosaic_thumb_transparent` int(4) NOT NULL,
  `mosaic_thumb_align` varchar(8) NOT NULL,
  `mosaic_thumb_hover_effect` varchar(64) NOT NULL,
  `mosaic_thumb_hover_effect_value` varchar(64) NOT NULL,
  `mosaic_thumb_title_font_color` varchar(8) NOT NULL,
  `mosaic_thumb_title_font_style` varchar(16) NOT NULL,
  `mosaic_thumb_title_font_size` int(4) NOT NULL,
  `mosaic_thumb_title_font_weight` varchar(8) NOT NULL,
  `mosaic_thumb_title_margin` varchar(32) NOT NULL,
  `mosaic_thumb_title_shadow` varchar(32) NOT NULL,
  `slideshow_cont_bg_color` varchar(8) NOT NULL,
  `slideshow_close_btn_transparent` int(4) NOT NULL,
  `slideshow_rl_btn_bg_color` varchar(8) NOT NULL,
  `slideshow_rl_btn_border_radius` varchar(32) NOT NULL,
  `slideshow_rl_btn_border_width` int(4) NOT NULL,
  `slideshow_rl_btn_border_style` varchar(8) NOT NULL,
  `slideshow_rl_btn_border_color` varchar(8) NOT NULL,
  `slideshow_rl_btn_box_shadow` varchar(32) NOT NULL,
  `slideshow_rl_btn_color` varchar(8) NOT NULL,
  `slideshow_rl_btn_height` int(4) NOT NULL,
  `slideshow_rl_btn_size` int(4) NOT NULL,
  `slideshow_rl_btn_width` int(4) NOT NULL,
  `slideshow_close_rl_btn_hover_color` varchar(8) NOT NULL,
  `slideshow_filmstrip_pos` varchar(8) NOT NULL,
  `slideshow_filmstrip_thumb_border_width` int(4) NOT NULL,
  `slideshow_filmstrip_thumb_border_style` varchar(8) NOT NULL,
  `slideshow_filmstrip_thumb_border_color` varchar(8) NOT NULL,
  `slideshow_filmstrip_thumb_border_radius` varchar(32) NOT NULL,
  `slideshow_filmstrip_thumb_margin` varchar(32) NOT NULL,
  `slideshow_filmstrip_thumb_active_border_width` int(4) NOT NULL,
  `slideshow_filmstrip_thumb_active_border_color` varchar(8) NOT NULL,
  `slideshow_filmstrip_thumb_deactive_transparent` int(4) NOT NULL,
  `slideshow_filmstrip_rl_bg_color` varchar(8) NOT NULL,
  `slideshow_filmstrip_rl_btn_color` varchar(8) NOT NULL,
  `slideshow_filmstrip_rl_btn_size` int(4) NOT NULL,
  `slideshow_title_font_size` int(4) NOT NULL,
  `slideshow_title_font` varchar(16) NOT NULL,
  `slideshow_title_color` varchar(8) NOT NULL,
  `slideshow_title_opacity` int(4) NOT NULL,
  `slideshow_title_border_radius` varchar(32) NOT NULL,
  `slideshow_title_background_color` varchar(8) NOT NULL,
  `slideshow_title_padding` varchar(32) NOT NULL,
  `slideshow_description_font_size` int(4) NOT NULL,
  `slideshow_description_font` varchar(16) NOT NULL,
  `slideshow_description_color` varchar(8) NOT NULL,
  `slideshow_description_opacity` int(4) NOT NULL,
  `slideshow_description_border_radius` varchar(32) NOT NULL,
  `slideshow_description_background_color` varchar(8) NOT NULL,
  `slideshow_description_padding` varchar(32) NOT NULL,
  `slideshow_dots_width` int(4) NOT NULL,
  `slideshow_dots_height` int(4) NOT NULL,
  `slideshow_dots_border_radius` varchar(32) NOT NULL,
  `slideshow_dots_background_color` varchar(8) NOT NULL,
  `slideshow_dots_margin` int(4) NOT NULL,
  `slideshow_dots_active_background_color` varchar(8) NOT NULL,
  `slideshow_dots_active_border_width` int(4) NOT NULL,
  `slideshow_dots_active_border_color` varchar(8) NOT NULL,
  `slideshow_play_pause_btn_size` int(4) NOT NULL,
  `slideshow_rl_btn_style` varchar(16) NOT NULL,
  `blog_style_margin` varchar(32) NOT NULL,
  `blog_style_padding` varchar(32) NOT NULL,
  `blog_style_border_radius` varchar(32) NOT NULL,
  `blog_style_border_width` int(4) NOT NULL,
  `blog_style_border_style` varchar(16) NOT NULL,
  `blog_style_border_color` varchar(8) NOT NULL,
  `blog_style_bg_color` varchar(8) NOT NULL,
  `blog_style_box_shadow` varchar(32) NOT NULL,
  `blog_style_transparent` int(4) NOT NULL,
  `blog_style_align` varchar(8) NOT NULL,
  `blog_style_share_buttons_bg_color` varchar(8) NOT NULL,
  `blog_style_share_buttons_margin` varchar(32) NOT NULL,
  `blog_style_share_buttons_border_radius` varchar(32) NOT NULL,
  `blog_style_share_buttons_border_width` int(4) NOT NULL,
  `blog_style_share_buttons_border_style` varchar(16) NOT NULL,
  `blog_style_share_buttons_border_color` varchar(8) NOT NULL,
  `blog_style_share_buttons_align` varchar(8) NOT NULL,
  `blog_style_img_font_size` int(4) NOT NULL,
  `blog_style_img_font_family` varchar(16) NOT NULL,
  `blog_style_img_font_color` varchar(8) NOT NULL,
  `blog_style_share_buttons_color` varchar(8) NOT NULL,
  `blog_style_share_buttons_bg_transparent` int(4) NOT NULL,
  `blog_style_share_buttons_font_size` int(4) NOT NULL,
  `image_browser_margin` varchar(32) NOT NULL,
  `image_browser_padding` varchar(32) NOT NULL,
  `image_browser_border_radius` varchar(32) NOT NULL,
  `image_browser_border_width` int(4) NOT NULL,
  `image_browser_border_style` varchar(16) NOT NULL,
  `image_browser_border_color` varchar(8) NOT NULL,
  `image_browser_bg_color` varchar(8) NOT NULL,
  `image_browser_box_shadow` varchar(32) NOT NULL,
  `image_browser_transparent` int(4) NOT NULL,
  `image_browser_align` varchar(8) NOT NULL,
  `image_browser_image_description_margin` varchar(32) NOT NULL,
  `image_browser_image_description_padding` varchar(32) NOT NULL,
  `image_browser_image_description_border_radius` varchar(32) NOT NULL,
  `image_browser_image_description_border_width` int(4) NOT NULL,
  `image_browser_image_description_border_style` varchar(16) NOT NULL,
  `image_browser_image_description_border_color` varchar(8) NOT NULL,
  `image_browser_image_description_bg_color` varchar(8) NOT NULL,
  `image_browser_image_description_align` varchar(8) NOT NULL,
  `image_browser_img_font_size` int(4) NOT NULL,
  `image_browser_img_font_family` varchar(16) NOT NULL,
  `image_browser_img_font_color` varchar(8) NOT NULL,
  `image_browser_full_padding` varchar(32) NOT NULL,
  `image_browser_full_border_radius` varchar(32) NOT NULL,
  `image_browser_full_border_width` int(4) NOT NULL,
  `image_browser_full_border_style` varchar(16) NOT NULL,
  `image_browser_full_border_color` varchar(8) NOT NULL,
  `image_browser_full_bg_color` varchar(8) NOT NULL,
  `image_browser_full_transparent` int(4) NOT NULL,
  `lightbox_info_pos` varchar(8) NOT NULL,
  `lightbox_info_align` varchar(8) NOT NULL,
  `lightbox_info_bg_color` varchar(8) NOT NULL,
  `lightbox_info_bg_transparent` int(4) NOT NULL,
  `lightbox_info_border_width` int(4) NOT NULL,
  `lightbox_info_border_style` varchar(16) NOT NULL,
  `lightbox_info_border_color` varchar(8) NOT NULL,
  `lightbox_info_border_radius` varchar(32) NOT NULL,
  `lightbox_info_padding` varchar(32) NOT NULL,
  `lightbox_info_margin` varchar(32) NOT NULL,
  `lightbox_title_color` varchar(8) NOT NULL,
  `lightbox_title_font_style` varchar(16) NOT NULL,
  `lightbox_title_font_weight` varchar(8) NOT NULL,
  `lightbox_title_font_size` int(4) NOT NULL,
  `lightbox_description_color` varchar(8) NOT NULL,
  `lightbox_description_font_style` varchar(16) NOT NULL,
  `lightbox_description_font_weight` varchar(8) NOT NULL,
  `lightbox_description_font_size` int(4) NOT NULL,
  `lightbox_rate_pos` varchar(8) NOT NULL,
  `lightbox_rate_align` varchar(8) NOT NULL,
  `lightbox_rate_icon` varchar(16) NOT NULL,
  `lightbox_rate_color` varchar(8) NOT NULL,
  `lightbox_rate_size` int(4) NOT NULL,
  `lightbox_rate_stars_count` int(4) NOT NULL,
  `lightbox_rate_padding` varchar(32) NOT NULL,
  `lightbox_rate_hover_color` varchar(8) NOT NULL,
  `lightbox_hit_pos` varchar(8) NOT NULL,
  `lightbox_hit_align` varchar(8) NOT NULL,
  `lightbox_hit_bg_color` varchar(8) NOT NULL,
  `lightbox_hit_bg_transparent` int(4) NOT NULL,
  `lightbox_hit_border_width` int(4) NOT NULL,
  `lightbox_hit_border_style` varchar(16) NOT NULL,
  `lightbox_hit_border_color` varchar(8) NOT NULL,
  `lightbox_hit_border_radius` varchar(32) NOT NULL,
  `lightbox_hit_padding` varchar(32) NOT NULL,
  `lightbox_hit_margin` varchar(32) NOT NULL,
  `lightbox_hit_color` varchar(8) NOT NULL,
  `lightbox_hit_font_style` varchar(16) NOT NULL,
  `lightbox_hit_font_weight` varchar(8) NOT NULL,
  `lightbox_hit_font_size` int(4) NOT NULL,
  `masonry_description_font_size` int(4) NOT NULL,
  `masonry_description_color` varchar(8) NOT NULL,
  `masonry_description_font_style` varchar(16) NOT NULL,
  `album_masonry_back_font_color` varchar(8) NOT NULL,
  `album_masonry_back_font_style` varchar(16) NOT NULL,
  `album_masonry_back_font_size` int(4) NOT NULL,
  `album_masonry_back_font_weight` varchar(8) NOT NULL,
  `album_masonry_back_padding` varchar(32) NOT NULL,
  `album_masonry_title_font_color` varchar(8) NOT NULL,
  `album_masonry_title_font_style` varchar(16) NOT NULL,
  `album_masonry_thumb_title_pos` varchar(8) NOT NULL,
  `album_masonry_title_font_size` int(4) NOT NULL,
  `album_masonry_title_font_weight` varchar(8) NOT NULL,
  `album_masonry_title_margin` varchar(32) NOT NULL,
  `album_masonry_title_shadow` varchar(32) NOT NULL,
  `album_masonry_thumb_margin` int(4) NOT NULL,
  `album_masonry_thumb_padding` int(4) NOT NULL,
  `album_masonry_thumb_border_radius` varchar(32) NOT NULL,
  `album_masonry_thumb_border_width` int(4) NOT NULL,
  `album_masonry_thumb_border_style` varchar(8) NOT NULL,
  `album_masonry_thumb_border_color` varchar(8) NOT NULL,
  `album_masonry_thumb_bg_color` varchar(8) NOT NULL,
  `album_masonry_thumbs_bg_color` varchar(8) NOT NULL,
  `album_masonry_thumb_bg_transparent` int(4) NOT NULL,
  `album_masonry_thumb_box_shadow` varchar(32) NOT NULL,
  `album_masonry_thumb_transparent` int(4) NOT NULL,
  `album_masonry_thumb_align` varchar(8) NOT NULL,
  `album_masonry_thumb_hover_effect` varchar(64) NOT NULL,
  `album_masonry_thumb_hover_effect_value` varchar(64) NOT NULL,
  `album_masonry_thumb_transition` tinyint(1) NOT NULL,
  `carousel_cont_bg_color` varchar(8) NOT NULL,
  `carousel_cont_btn_transparent` int(4) NOT NULL,
  `carousel_close_btn_transparent` int(4) NOT NULL,
  `carousel_rl_btn_bg_color` varchar(8) NOT NULL,
  `carousel_rl_btn_border_radius` varchar(32) NOT NULL,
  `carousel_rl_btn_border_width` int(4) NOT NULL,
  `carousel_rl_btn_border_style` varchar(8) NOT NULL,
  `carousel_rl_btn_border_color` varchar(8) NOT NULL,
  `carousel_rl_btn_color` varchar(8) NOT NULL,
  `carousel_rl_btn_height` int(4) NOT NULL,
  `carousel_rl_btn_size` int(4) NOT NULL,
  `carousel_play_pause_btn_size` int(4) NOT NULL,
  `carousel_rl_btn_width` int(4) NOT NULL,
  `carousel_close_rl_btn_hover_color` varchar(8) NOT NULL,
  `carousel_rl_btn_style` varchar(16) NOT NULL,
  `carousel_mergin_bottom` varchar(8) NOT NULL,
  `carousel_font_family` varchar(8) NOT NULL,
  `carousel_feature_border_width` int(4) NOT NULL,
  `carousel_feature_border_style` varchar(8) NOT NULL,
  `carousel_feature_border_color` varchar(8) NOT NULL,
  `carousel_caption_background_color` varchar(8) NOT NULL,
  `carousel_caption_bottom` int(4) NOT NULL,
  `carousel_caption_p_mergin` int(4) NOT NULL,
  `carousel_caption_p_pedding` int(4) NOT NULL,
  `carousel_caption_p_font_weight` varchar(8) NOT NULL,
  `carousel_caption_p_font_size` int(4) NOT NULL,
  `carousel_caption_p_color` varchar(8) NOT NULL,
  `carousel_title_opacity` int(4) NOT NULL,
  `carousel_title_border_radius` varchar(8) NOT NULL,
  `default_theme` tinyint(1) NOT NULL,
  `mosaic_thumb_transition` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_bwg_theme`
--

LOCK TABLES `wp_bwg_theme` WRITE;
/*!40000 ALTER TABLE `wp_bwg_theme` DISABLE KEYS */;
INSERT INTO `wp_bwg_theme` VALUES (1,'Theme 1',4,0,'0',0,'none','CCCCCC','FFFFFF','FFFFFF',0,'0px 0px 0px #888888',100,'center','scale','1.1',1,'CCCCCC','segoe ui','bottom',16,'bold','2px','0px 0px 0px #888888','bottom','center',0,12,'segoe ui','666666','bold',1,'solid','E3E3E3','0','0','3px 6px','FFFFFF',100,'0',1,0,'000000',70,'000000','bottom','center',20,10,7,100,'FFFFFF',14,100,'000000',65,4,100,'000000',2,'16px','none','FFFFFF','0','FFFFFF',10,20,20,'-10','-10','FFFFFF','000000',80,'20px',0,'none','FFFFFF','','FFFFFF',40,40,20,'CCCCCC','left',400,'000000','CCCCCC','segoe ui',12,'616161','666666',1,'none','3px','3px 10px','333333','666666',1,'none','0','2px',1,'solid','383838',14,10,12,'CCCCCC','top','3B3B3B',20,'FFFFFF','0 1px',1,'solid','000000','0',80,0,'FFFFFF','fa-chevron','000000','segoe ui',16,'bold','0','CCCCCC','segoe ui','bottom',16,'bold','2px','0px 0px 0px #888888',4,0,'0',0,'none','CCCCCC','FFFFFF','FFFFFF',0,'0px 0px 0px #888888',100,'center','scale','1.1',0,2,0,'0',0,'none','CCCCCC','FFFFFF','FFFFFF',0,'',100,'left','scale','1.1',0,'000000','segoe ui',20,'bold','0','FFFFFF',0,'0 0 0 0','0 0 5px 0',10,1,'solid','E0E0E0','FFFFFF','0',1,'solid','E8E8E8','5px','FFFFFF','0',1,'solid','E8E8E8','5px',1,'none','CCCCCC','000000','segoe ui',16,'bold',2,'2px',1,'none','CCCCCC','000000','segoe ui',14,'normal','2px','F2D22E',12,4,'0',0,'none','CCCCCC','FFFFFF',0,100,'center','scale','1.1',0,4,'0',0,'none','CCCCCC','FFFFFF',0,100,'center','scale','1.1','CCCCCC','segoe ui',16,'bold','2px','0px 0px 0px #888888','000000',100,'000000','20px',0,'none','FFFFFF','0px 0px 0px #000000','FFFFFF',40,20,40,'CCCCCC','top',1,'solid','000000','0','0 1px',0,'FFFFFF',80,'3B3B3B','FFFFFF',20,16,'segoe ui','FFFFFF',70,'5px','000000','0 0 0 0',14,'segoe ui','FFFFFF',70,'0','000000','5px 10px 5px 10px',12,12,'5px','F2D22E',3,'FFFFFF',1,'000000',60,'fa-chevron','2px','0','0',1,'solid','F5F5F5','FFFFFF','',80,'center','FFFFFF','5px auto 10px auto','0',0,'none','000000','right',16,'segoe ui','000000','B3AFAF',0,20,'2px auto','4px','0',1,'none','F5F5F5','EBEBEB','',80,'center','0px 5px 0px 5px','8px 8px 8px 8px','0',1,'none','FFFFFF','EBEBEB','center',15,'segoe ui','000000','4px','0',2,'none','F7F7F7','F5F5F5',90,'top','right','000000',70,1,'none','000000','5px','5px','15px','FFFFFF','segoe ui','bold',18,'FFFFFF','segoe ui','normal',14,'bottom','right','star','F9D062',20,5,'15px','F7B50E','bottom','left','000000',70,1,'none','000000','5px','5px','0 5px','FFFFFF','segoe ui','normal',14,12,'CCCCCC','segoe ui','000000','segoe ui',16,'bold','0','CCCCCC','segoe ui','bottom',16,'bold','2px','0px 0px 0px #888888',4,0,'0',0,'none','CCCCCC','FFFFFF','FFFFFF',0,'0px 0px 0px #888888',100,'center','scale','1.1',0,'000000',0,100,'000000','20px',0,'none','FFFFFF','FFFFFF',40,20,20,40,'CCCCCC','fa-chevron','0.5','Arial',2,'solid','5D204F','000000',0,0,5,'bold',14,'white',100,'5px',1,1),(2,'Theme 2',4,4,'0',5,'none','FFFFFF','E8E8E8','FFFFFF',0,'0px 0px 0px #888888',100,'center','rotate','2deg',1,'CCCCCC','segoe ui','bottom',16,'bold','5px','','bottom','center',0,12,'segoe ui','666666','bold',1,'none','E3E3E3','0','0','3px 6px','FCFCFC',100,'0',1,0,'000000',70,'000000','bottom','center',20,10,7,80,'FFFFFF',14,100,'000000',80,4,95,'000000',0,'16px','none','FFFFFF','','FFFFFF',10,20,20,'-10','-10','FFFFFF','000000',80,'20px',2,'none','FFFFFF','','FFFFFF',40,40,20,'FFFFFF','left',400,'000000','CCCCCC','arial',12,'333333','666666',1,'none','3px','3px 10px','333333','666666',1,'none','0','3px',1,'solid','2B2B2B',14,10,12,'FFFFFF','top','2B2B2B',20,'FFFFFF','0 1px',1,'none','000000','0',80,0,'FFFFFF','fa-chevron','000000','segoe ui',14,'normal','0','CCCCCC','segoe ui','bottom',16,'bold','5px','',4,4,'0',1,'none','000000','E8E8E8','FFFFFF',100,'',100,'center','rotate','2deg',1,2,4,'0',4,'none','E8E8E8','E8E8E8','FFFFFF',100,'',100,'left','rotate','2deg',0,'000000','segoe ui',16,'bold','0','FFFFFF',0,'0','0 0 5px 0',10,1,'none','CCCCCC','FFFFFF','0',0,'none','CCCCCC','0','FFFFFF','0',1,'none','CCCCCC','5px',1,'none','CCCCCC','000000','segoe ui',16,'bold',2,'2px',1,'none','CCCCCC','000000','segoe ui',14,'normal','2px','FFC933',12,4,'2px',1,'none','CCCCCC','FFFFFF',0,80,'center','rotate','2deg',0,4,'2px',1,'none','CCCCCC','FFFFFF',0,80,'center','rotate','2deg','CCCCCC','segoe ui',16,'bold','2px','0px 0px 0px #888888','000000',100,'000000','20px',0,'none','FFFFFF','','FFFFFF',40,20,40,'DBDBDB','bottom',1,'none','000000','0','0 1px',0,'FFFFFF',80,'303030','FFFFFF',20,16,'segoe ui','FFFFFF',70,'5px','000000','5px 10px 5px 10px',14,'segoe ui','FFFFFF',70,'0','000000','5px 10px 5px 10px',10,10,'10px','292929',1,'292929',2,'FFC933',60,'fa-chevron','2px','4px','0',1,'none','CCCCCC','E8E8E8','',70,'center','FFFFFF','5px auto 10px auto','0',0,'none','000000','right',16,'segoe ui','000000','A1A1A1',0,20,'2px auto','4px','2px',1,'none','E8E8E8','E8E8E8','',80,'center','24px 0px 0px 0px','8px 8px 8px 8px','0',1,'none','FFFFFF','E8E8E8','center',14,'segoe ui','000000','4px','0',1,'solid','EDEDED','FFFFFF',90,'top','right','000000',70,1,'none','000000','5px','5px','15px','FFFFFF','segoe ui','bold',18,'FFFFFF','segoe ui','normal',14,'bottom','right','star','F9D062',20,5,'15px','F7B50E','bottom','left','000000',70,1,'none','000000','5px','5px','0 5px','FFFFFF','segoe ui','normal',14,12,'CCCCCC','segoe ui','000000','segoe ui',14,'normal','0','CCCCCC','segoe ui','bottom',16,'bold','5px','',4,4,'0',1,'none','000000','E8E8E8','FFFFFF',100,'',100,'center','rotate','2deg',1,'000000',0,100,'000000','20px',0,'none','FFFFFF','FFFFFF',40,20,20,40,'CCCCCC','fa-chevron','0.5','Arial',2,'solid','5D204F','000000',0,0,5,'bold',14,'white',100,'5px',0,1);
/*!40000 ALTER TABLE `wp_bwg_theme` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_commentmeta`
--

DROP TABLE IF EXISTS `wp_commentmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_commentmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `comment_id` (`comment_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_commentmeta`
--

LOCK TABLES `wp_commentmeta` WRITE;
/*!40000 ALTER TABLE `wp_commentmeta` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_commentmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_comments`
--

DROP TABLE IF EXISTS `wp_comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_comments` (
  `comment_ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `comment_post_ID` bigint(20) unsigned NOT NULL DEFAULT '0',
  `comment_author` tinytext COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_author_email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_url` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_author_IP` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `comment_content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_karma` int(11) NOT NULL DEFAULT '0',
  `comment_approved` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '1',
  `comment_agent` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`comment_ID`),
  KEY `comment_post_ID` (`comment_post_ID`),
  KEY `comment_approved_date_gmt` (`comment_approved`,`comment_date_gmt`),
  KEY `comment_date_gmt` (`comment_date_gmt`),
  KEY `comment_parent` (`comment_parent`),
  KEY `comment_author_email` (`comment_author_email`(10))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_comments`
--

LOCK TABLES `wp_comments` WRITE;
/*!40000 ALTER TABLE `wp_comments` DISABLE KEYS */;
INSERT INTO `wp_comments` VALUES (1,1,'Mr WordPress','','https://wordpress.org/','','2015-10-27 10:11:44','2015-10-27 10:11:44','Hi, this is a comment.\nTo delete a comment, just log in and view the post&#039;s comments. There you will have the option to edit or delete them.',0,'1','','',0,0);
/*!40000 ALTER TABLE `wp_comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_links`
--

DROP TABLE IF EXISTS `wp_links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_links` (
  `link_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `link_url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_target` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_visible` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Y',
  `link_owner` bigint(20) unsigned NOT NULL DEFAULT '1',
  `link_rating` int(11) NOT NULL DEFAULT '0',
  `link_updated` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `link_rel` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `link_notes` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `link_rss` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`link_id`),
  KEY `link_visible` (`link_visible`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_links`
--

LOCK TABLES `wp_links` WRITE;
/*!40000 ALTER TABLE `wp_links` DISABLE KEYS */;
/*!40000 ALTER TABLE `wp_links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_postmeta`
--

DROP TABLE IF EXISTS `wp_postmeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_postmeta` (
  `meta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`meta_id`),
  KEY `post_id` (`post_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_postmeta`
--

LOCK TABLES `wp_postmeta` WRITE;
/*!40000 ALTER TABLE `wp_postmeta` DISABLE KEYS */;
INSERT INTO `wp_postmeta` VALUES (1,2,'_wp_page_template','default'),(2,5,'_wp_attached_file','2015/10/11.jpg'),(3,5,'_wp_attachment_metadata','a:5:{s:5:\"width\";i:2592;s:6:\"height\";i:1944;s:4:\"file\";s:14:\"2015/10/11.jpg\";s:5:\"sizes\";a:7:{s:9:\"thumbnail\";a:4:{s:4:\"file\";s:14:\"11-150x150.jpg\";s:5:\"width\";i:150;s:6:\"height\";i:150;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:6:\"medium\";a:4:{s:4:\"file\";s:14:\"11-300x225.jpg\";s:5:\"width\";i:300;s:6:\"height\";i:225;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:5:\"large\";a:4:{s:4:\"file\";s:15:\"11-1024x768.jpg\";s:5:\"width\";i:1024;s:6:\"height\";i:768;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:25:\"colormag-highlighted-post\";a:4:{s:4:\"file\";s:14:\"11-392x272.jpg\";s:5:\"width\";i:392;s:6:\"height\";i:272;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:29:\"colormag-featured-post-medium\";a:4:{s:4:\"file\";s:14:\"11-390x205.jpg\";s:5:\"width\";i:390;s:6:\"height\";i:205;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:28:\"colormag-featured-post-small\";a:4:{s:4:\"file\";s:13:\"11-130x90.jpg\";s:5:\"width\";i:130;s:6:\"height\";i:90;s:9:\"mime-type\";s:10:\"image/jpeg\";}s:23:\"colormag-featured-image\";a:4:{s:4:\"file\";s:14:\"11-800x445.jpg\";s:5:\"width\";i:800;s:6:\"height\";i:445;s:9:\"mime-type\";s:10:\"image/jpeg\";}}s:10:\"image_meta\";a:11:{s:8:\"aperture\";d:2.6000000000000001;s:6:\"credit\";s:0:\"\";s:6:\"camera\";s:5:\"WT19i\";s:7:\"caption\";s:0:\"\";s:17:\"created_timestamp\";i:315979879;s:9:\"copyright\";s:0:\"\";s:12:\"focal_length\";s:3:\"3.5\";s:3:\"iso\";s:3:\"800\";s:13:\"shutter_speed\";s:6:\"0.0625\";s:5:\"title\";s:0:\"\";s:11:\"orientation\";i:1;}}'),(4,5,'_wp_attachment_is_custom_background','colormag'),(5,6,'_edit_last','1'),(6,6,'_edit_lock','1446108217:1'),(7,6,'colormag_page_layout','no_sidebar_full_width'),(8,6,'_wp_page_template','default');
/*!40000 ALTER TABLE `wp_postmeta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_posts`
--

DROP TABLE IF EXISTS `wp_posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_posts` (
  `ID` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `post_author` bigint(20) unsigned NOT NULL DEFAULT '0',
  `post_date` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_date_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_title` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_excerpt` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'publish',
  `comment_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `ping_status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'open',
  `post_password` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `post_name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `to_ping` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `pinged` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_modified_gmt` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `post_content_filtered` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `post_parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `guid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `menu_order` int(11) NOT NULL DEFAULT '0',
  `post_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'post',
  `post_mime_type` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `comment_count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `post_name` (`post_name`(191)),
  KEY `type_status_date` (`post_type`,`post_status`,`post_date`,`ID`),
  KEY `post_parent` (`post_parent`),
  KEY `post_author` (`post_author`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_posts`
--

LOCK TABLES `wp_posts` WRITE;
/*!40000 ALTER TABLE `wp_posts` DISABLE KEYS */;
INSERT INTO `wp_posts` VALUES (1,1,'2015-10-27 10:11:44','2015-10-27 10:11:44','Welcome to WordPress. This is your first post. Edit or delete it, then start writing!','Hello world!','','publish','open','open','','hello-world','','','2015-10-27 10:11:44','2015-10-27 10:11:44','',0,'http://localhost/ato-project/?p=1',0,'post','',1),(2,1,'2015-10-27 10:11:44','2015-10-27 10:11:44','This is an example page. It\'s different from a blog post because it will stay in one place and will show up in your site navigation (in most themes). Most people start with an About page that introduces them to potential site visitors. It might say something like this:\n\n<blockquote>Hi there! I\'m a bike messenger by day, aspiring actor by night, and this is my website. I live in Los Angeles, have a great dog named Jack, and I like pi&#241;a coladas. (And gettin\' caught in the rain.)</blockquote>\n\n...or something like this:\n\n<blockquote>The XYZ Doohickey Company was founded in 1971, and has been providing quality doohickeys to the public ever since. Located in Gotham City, XYZ employs over 2,000 people and does all kinds of awesome things for the Gotham community.</blockquote>\n\nAs a new WordPress user, you should go to <a href=\"http://localhost/ato-project/wp-admin/\">your dashboard</a> to delete this page and create new pages for your content. Have fun!','Sample Page','','publish','closed','open','','sample-page','','','2015-10-27 10:11:44','2015-10-27 10:11:44','',0,'http://localhost/ato-project/?page_id=2',0,'page','',0),(3,1,'2015-10-27 10:27:00','0000-00-00 00:00:00','','Auto Draft','','auto-draft','open','open','','','','','2015-10-27 10:27:00','0000-00-00 00:00:00','',0,'http://localhost/ato-project/?p=3',0,'post','',0),(4,1,'2015-10-27 15:18:13','0000-00-00 00:00:00','','Auto Draft','','auto-draft','closed','closed','','','','','2015-10-27 15:18:13','0000-00-00 00:00:00','',0,'http://localhost/ato-project/?page_id=4',0,'page','',0),(5,1,'2015-10-28 13:51:50','2015-10-28 13:51:50','','1','','inherit','open','closed','','1','','','2015-10-28 13:51:50','2015-10-28 13:51:50','',0,'http://localhost/ato-project/wp-content/uploads/2015/10/11.jpg',0,'attachment','image/jpeg',0),(6,1,'2015-10-29 08:45:46','2015-10-29 08:45:46','','Gallery','','publish','closed','closed','','gallery','','','2015-10-29 08:45:46','2015-10-29 08:45:46','',0,'http://localhost/ato-project/?page_id=6',0,'page','',0),(7,1,'2015-10-29 08:45:46','2015-10-29 08:45:46','','Gallery','','inherit','closed','closed','','6-revision-v1','','','2015-10-29 08:45:46','2015-10-29 08:45:46','',6,'http://localhost/ato-project/index.php/2015/10/29/6-revision-v1/',0,'revision','',0);
/*!40000 ALTER TABLE `wp_posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_relationships`
--

DROP TABLE IF EXISTS `wp_term_relationships`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_relationships` (
  `object_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_taxonomy_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `term_order` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`object_id`,`term_taxonomy_id`),
  KEY `term_taxonomy_id` (`term_taxonomy_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_relationships`
--

LOCK TABLES `wp_term_relationships` WRITE;
/*!40000 ALTER TABLE `wp_term_relationships` DISABLE KEYS */;
INSERT INTO `wp_term_relationships` VALUES (1,1,0);
/*!40000 ALTER TABLE `wp_term_relationships` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_term_taxonomy`
--

DROP TABLE IF EXISTS `wp_term_taxonomy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_term_taxonomy` (
  `term_taxonomy_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `term_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `taxonomy` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent` bigint(20) unsigned NOT NULL DEFAULT '0',
  `count` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_taxonomy_id`),
  UNIQUE KEY `term_id_taxonomy` (`term_id`,`taxonomy`),
  KEY `taxonomy` (`taxonomy`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_term_taxonomy`
--

LOCK TABLES `wp_term_taxonomy` WRITE;
/*!40000 ALTER TABLE `wp_term_taxonomy` DISABLE KEYS */;
INSERT INTO `wp_term_taxonomy` VALUES (1,1,'category','',0,1);
/*!40000 ALTER TABLE `wp_term_taxonomy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_terms`
--

DROP TABLE IF EXISTS `wp_terms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_terms` (
  `term_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `slug` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `term_group` bigint(10) NOT NULL DEFAULT '0',
  PRIMARY KEY (`term_id`),
  KEY `slug` (`slug`(191)),
  KEY `name` (`name`(191))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_terms`
--

LOCK TABLES `wp_terms` WRITE;
/*!40000 ALTER TABLE `wp_terms` DISABLE KEYS */;
INSERT INTO `wp_terms` VALUES (1,'Uncategorized','uncategorized',0);
/*!40000 ALTER TABLE `wp_terms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wp_usermeta`
--

DROP TABLE IF EXISTS `wp_usermeta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wp_usermeta` (
  `umeta_id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_value` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`umeta_id`),
  KEY `user_id` (`user_id`),
  KEY `meta_key` (`meta_key`(191))
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wp_usermeta`
--

LOCK TABLES `wp_usermeta` WRITE;
/*!40000 ALTER TABLE `wp_usermeta` DISABLE KEYS */;
INSERT INTO `wp_usermeta` VALUES (1,1,'nickname','admin'),(2,1,'first_name',''),(3,1,'last_name',''),(4,1,'description',''),(5,1,'rich_editing','true'),(6,1,'comment_shortcuts','false'),(7,1,'admin_color','fresh'),(8,1,'use_ssl','0'),(9,1,'show_admin_bar_front','true'),(10,1,'wp_capabilities','a:1:{s:13:\"administrator\";b:1;}'),(11,1,'wp_user_level','10'),(12,1,'dismissed_wp_pointers',''),(13,1,'show_welcome_panel','1'),(14,1,'session_tokens','a:5:{s:64:\"75ac6850a9ff95bd5f6395ea34564e282cf2294f04fe98e075b1beae53806d92\";a:4:{s:10:\"expiration\";i:1446114419;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:74:\"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0\";s:5:\"login\";i:1445941619;}s:64:\"21e9ede4ac05891539e146698d004cfe5b249824bed4db73508360b723131f1a\";a:4:{s:10:\"expiration\";i:1446124176;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:104:\"Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/46.0.2490.80 Safari/537.36\";s:5:\"login\";i:1445951376;}s:64:\"be90ac47be11449cfcc1398521b1dd393b86a4200eef8e120d56d00e61d5f296\";a:4:{s:10:\"expiration\";i:1446125992;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:74:\"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0\";s:5:\"login\";i:1445953192;}s:64:\"5cfc9581194dc9ad7a1c70b6b1028aefac1a5c2d9588f86bb0b6618e16c92108\";a:4:{s:10:\"expiration\";i:1446213023;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:74:\"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0\";s:5:\"login\";i:1446040223;}s:64:\"8124d208bc13f69f52b1fb31c8969a837ec27ad6d23d7dca42f289a34d922a11\";a:4:{s:10:\"expiration\";i:1446281104;s:2:\"ip\";s:9:\"127.0.0.1\";s:2:\"ua\";s:74:\"Mozilla/5.0 (X11; Ubuntu; Linux i686; rv:41.0) Gecko/20100101 Firefox/41.0\";s:5:\"login\";i:1446108304;}}'),(15,1,'wp_dashboard_quick_press_last_post_id','3'),(16,1,'wp_user-settings','libraryContent=browse&editor=tinymce'),(17,1,'wp_user-settings-time','1446040218');
/*!40000 ALTER TABLE `wp_usermeta` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-10-29 10:51:31
