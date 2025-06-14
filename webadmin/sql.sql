-- MySQL dump 10.13  Distrib 8.0.24, for Linux (x86_64)
--
-- Host: localhost    Database: sql_gapp_bwhos_com
-- ------------------------------------------------------
-- Server version	8.0.24

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `app_settings`
--

DROP TABLE IF EXISTS `app_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `app_settings` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` text COLLATE utf8mb4_general_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `app_settings`
--

LOCK TABLES `app_settings` WRITE;
/*!40000 ALTER TABLE `app_settings` DISABLE KEYS */;
INSERT INTO `app_settings` VALUES (1,'appconfiguration','{\"app_name\":\"Bwhos Web \",\"url\":\"https://gaap.bwhos.com/webapp/webadmin\",\"appLanuguage\":\"en\",\"isJavascriptEnable\":\"true\",\"isSplashScreen\":\"true\",\"isZoomFunctionality\":\"false\",\"navigationStyle\":\"sidedrawer\",\"header_style\":\"left\",\"is_walkthrough\":\"true\",\"is_webrtc\":\"true\",\"is_floating_button\":\"true\",\"floating_button_style\":\"regular\",\"is_pull_refresh\":\"false\",\"tab_style\":\"tab_with_title_icon\",\"bottom_navigation\":\"bottom_navigation_3\",\"walkthrough_style\":\"walkthrough_style_3\",\"clear_cookie\":\"false\",\"isExitPopupScreen\":\"true\",\"disable_header\":\"false\",\"disable_footer\":\"false\",\"app_logo\":\"https://gaap.bwhos.com/webapp/webadmin/upload/app_logo.png\",\"floating_button\":\"https://gaap.bwhos.com/webapp/webadmin/upload/floating_button.png\"}'),(2,'admob','{\"ads_type\":\"admob\",\"admobBannerID\":\"\",\"admobIntentialID\":\"\",\"admobBannerIDIOS\":\"\",\"admobIntentialIDIOS\":\"\",\"facebookBannerID\":\"\",\"facebookIntentialID\":\"\",\"facebookBannerIDIOS\":\"\",\"facebookIntentialIDIOS\":\"\"}'),(3,'progressbar','{\"is_progressbar\":\"true\",\"loaderStyle\":\"FadingCircle\"}'),(4,'theme','{\"themeStyle\":\"Theme6\",\"customColor\":null,\"gradientColor1\":null,\"gradientColor2\":null}'),(5,'about','{\"whatsAppNumber\":\"98796543210\",\"instagramUrl\":\"https://www.instagram.com/\",\"twitterUrl\":\"https://twitter.com/login\",\"facebookUrl\":\"https://www.facebook.com/\",\"callNumber\":\"9876543210\",\"snapchat\":\"https://www.snapchat.com/\",\"skype\":\"https://www.skype.com/en/\",\"messenger\":\"https://www.messenger.com/\",\"youtube\":\"https://www.youtube.com/\",\"isShowAbout\":\"true\"}'),(6,'onesignal_configuration','{\"app_id\":\"xxxxx\",\"rest_api_key\":\"xxxxx\"}'),(7,'splash_configuration','{\"first_color\":\"#3788ff\",\"second_color\":\"#4581e8\",\"title\":\"Bwhos Web\",\"enable_title\":\"true\",\"title_color\":\"#ffffff\",\"enable_logo\":\"true\",\"enable_background\":\"false\",\"splash_logo_url\":\"https://gaap.bwhos.com/webapp/webadmin/upload/splash_logo.png\",\"splash_background_url\":\"https://gaap.bwhos.com/webapp/webadmin/upload/splash_background.png\"}'),(8,'exitpopup_configuration','{\"title\":\"Do you want to exit at this moment? \",\"positive_text\":\"Yes\",\"negative_text\":\"No\",\"enable_image\":\"true\",\"exit_image_url\":\"https://meetmighty.com/mightywebbuilder/upload/cancel.png\"}'),(9,'share_content','{\"share\":\"share conntentt https://bwhos.com/upload/contact/\"}');
/*!40000 ALTER TABLE `app_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `floating_button`
--

DROP TABLE IF EXISTS `floating_button`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `floating_button` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `floating_button`
--

LOCK TABLES `floating_button` WRITE;
/*!40000 ALTER TABLE `floating_button` DISABLE KEYS */;
INSERT INTO `floating_button` VALUES (1,'Search','ic_search.png','https://www.google.com/',1),(2,'Message','ic_message.png','https://www.google.com/',1),(3,'Share','ic_share.png','https://www.google.com/',1),(4,'Home','ic_home.png','https://www.google.com/',1);
/*!40000 ALTER TABLE `floating_button` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `left_header_icon`
--

DROP TABLE IF EXISTS `left_header_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `left_header_icon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `left_header_icon`
--

LOCK TABLES `left_header_icon` WRITE;
/*!40000 ALTER TABLE `left_header_icon` DISABLE KEYS */;
INSERT INTO `left_header_icon` VALUES (1,'Back Button 1','ic_back1','ic_back1.png','event',NULL,0,'2021-04-09 05:19:17','2021-04-09 05:19:17'),(2,'Back Button 2','ic_back2','ic_back2.png','event',NULL,1,'2021-04-09 05:19:27','2021-04-09 05:19:27'),(3,'Home','ic_home','ic_home.png','event',NULL,0,'2021-04-09 05:20:00','2021-04-09 05:20:00'),(4,'Profile','ic_profile','ic_profile.png','url','https://www.google.com/',0,'2021-04-09 05:20:29','2021-04-09 05:20:29'),(5,'Close','ic_close','ic_close.png','event',NULL,0,'2021-04-09 05:20:30','2021-04-09 05:20:30'),(6,'Search','ic_search','ic_search.png','url','https://www.google.com/',0,'2021-04-09 05:20:36','2021-04-09 05:20:36'),(7,'Add','ic_add','ic_add.png','url','https://www.google.com/',0,'2021-04-09 05:20:51','2021-04-09 05:20:51');
/*!40000 ALTER TABLE `left_header_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu`
--

DROP TABLE IF EXISTS `menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `parent_id` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu`
--

LOCK TABLES `menu` WRITE;
/*!40000 ALTER TABLE `menu` DISABLE KEYS */;
INSERT INTO `menu` VALUES (1,'Home','bottom_navigation','1618040510-ic_home.png','https://meetmighty.com/mightywebbuilder',1,0),(2,'Search','bottom_navigation','1618040523-ic_search.png','https://codecanyon.net/user/meetmighty/portfolio',1,0),(3,'Cart','bottom_navigation','1618040544-ic_cart.png','https://www.myntra.com/',1,0),(4,'Settings','bottom_navigation','1618040565-ic_settings.png','https://www.google.com/',1,0),(7,'About','sidedrawer','1735911550-themeLogo.png','https://bwhos.com/app',1,0),(8,'','','default.png','',0,0);
/*!40000 ALTER TABLE `menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `right_header_icon`
--

DROP TABLE IF EXISTS `right_header_icon`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `right_header_icon` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `right_header_icon`
--

LOCK TABLES `right_header_icon` WRITE;
/*!40000 ALTER TABLE `right_header_icon` DISABLE KEYS */;
INSERT INTO `right_header_icon` VALUES (1,'Reload','ic_reload','ic_reload.png','event',NULL,1,'2020-06-07 21:28:42','2020-06-07 21:28:42'),(2,'Search','ic_search','ic_search.png','url','https://www.google.com/',1,'2020-06-07 21:48:16','2020-06-07 21:48:16'),(3,'Cart','ic_cart','ic_cart.png','url','https://www.myntra.com/',0,'2021-04-09 05:11:40','2021-04-09 05:11:40'),(4,'Settings','ic_settings','ic_settings.png','url','https://www.google.com/',0,'2021-04-09 10:33:15','2021-04-09 10:33:17'),(5,'Share','ic_share','ic_share.png','event',NULL,0,'2020-06-07 21:46:42','2020-06-07 21:46:42'),(6,'Close','ic_close','ic_close.png','event',NULL,0,'2021-04-09 05:10:36','2021-04-09 05:10:36'),(7,'Profile','ic_profile','ic_profile.png','url','https://www.google.com/',0,'2021-04-09 05:11:54','2021-04-09 05:11:54'),(8,'Message','ic_message','ic_message.png','url','https://www.google.com/',0,'2021-04-09 05:12:47','2021-04-09 05:12:47'),(9,'Notification','ic_notification','ic_notification.png','url','https://www.google.com/',0,'2021-04-09 05:13:11','2021-04-09 05:13:11'),(10,'Favourite','ic_favourite','ic_favourite.png\r\n','url','https://www.google.com/',0,'2021-06-24 17:01:26',NULL),(11,'Add','ic_add','ic_add.png','url','https://www.google.com/',0,'2021-06-24 17:01:26',NULL),(12,'List','ic_list','ic_list.png','url','https://www.google.com/',0,'2021-06-24 17:03:34',NULL),(13,'Filter','ic_filter','ic_filter.png','url','https://www.google.com/',0,'2021-06-24 17:03:34',NULL),(14,'Chat','ic_chat','ic_chat.png','url','https://www.google.com/',0,'2021-06-24 17:04:24',NULL),(15,'About','ic_about','ic_about.png','url','https://www.google.com/',0,'2021-06-24 17:04:24',NULL),(16,'QR Code','ic_qr_code','ic_qr_code.png','event',NULL,0,'2022-07-25 05:10:36',NULL);
/*!40000 ALTER TABLE `right_header_icon` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabs`
--

DROP TABLE IF EXISTS `tabs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tabs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabs`
--

LOCK TABLES `tabs` WRITE;
/*!40000 ALTER TABLE `tabs` DISABLE KEYS */;
INSERT INTO `tabs` VALUES (1,'Home','ic_home.png','https://www.google.com/',1),(2,'Search','ic_search.png','https://www.google.com/',1),(3,'Profile','ic_profile.png','https://www.google.com/',1),(4,'Wishlist','ic_heart.png','https://www.google.com/',1);
/*!40000 ALTER TABLE `tabs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_agent`
--

DROP TABLE IF EXISTS `user_agent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_agent` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `android` text COLLATE utf8mb4_general_ci,
  `ios` text COLLATE utf8mb4_general_ci,
  `status` tinyint DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_agent`
--

LOCK TABLES `user_agent` WRITE;
/*!40000 ALTER TABLE `user_agent` DISABLE KEYS */;
INSERT INTO `user_agent` VALUES (1,'Web Browser','random','Mozilla/5.0 (iPhone; CPU iPhone OS 12_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Version/12.1 Mobile/15E148 Safari/604.1',1);
/*!40000 ALTER TABLE `user_agent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'fartaz@bwhos.com','06351fc5c9911e99aad3554fbb7b5aff','Admin','Admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `walkthrough`
--

DROP TABLE IF EXISTS `walkthrough`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `walkthrough` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `subtitle` text COLLATE utf8mb4_general_ci,
  `image` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `walkthrough`
--

LOCK TABLES `walkthrough` WRITE;
/*!40000 ALTER TABLE `walkthrough` DISABLE KEYS */;
INSERT INTO `walkthrough` VALUES (1,'Bwhos Web','BwhosWeb app is used to convert your Website to Application Mobile','1735911602-themeLogo.png',1),(2,'Theme Style','Bwhos Web holds stunning options of Theme styles that you can apply to your mobile app to define your app better.','1735911624-night-logo.png',1),(3,'','','default.png',0);
/*!40000 ALTER TABLE `walkthrough` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'sql_gapp_bwhos_com'
--

--
-- Dumping routines for database 'sql_gapp_bwhos_com'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-06-08  1:30:14
