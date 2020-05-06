-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: brainio_production
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.16.04.1

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
-- Table structure for table `ar_internal_metadata`
--

DROP TABLE IF EXISTS `ar_internal_metadata`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ar_internal_metadata` (
  `key` varchar(255) NOT NULL,
  `value` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ar_internal_metadata`
--

LOCK TABLES `ar_internal_metadata` WRITE;
/*!40000 ALTER TABLE `ar_internal_metadata` DISABLE KEYS */;
INSERT INTO `ar_internal_metadata` VALUES ('environment','development','2020-01-08 10:39:44','2020-01-08 10:39:44');
/*!40000 ALTER TABLE `ar_internal_metadata` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audiences`
--

DROP TABLE IF EXISTS `audiences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `audiences` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `pixel_id` varchar(255) DEFAULT NULL,
  `audience_type` varchar(255) DEFAULT NULL,
  `retention_seconds` varchar(255) DEFAULT NULL,
  `value` varchar(255) DEFAULT NULL,
  `customaudience_id` varchar(255) DEFAULT NULL,
  `sub_category_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `subtype` varchar(255) DEFAULT NULL,
  `origin_audience_id` varchar(255) DEFAULT NULL,
  `fb_type` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `fb_custom_ratio` varchar(255) DEFAULT NULL,
  `page_id` varchar(255) DEFAULT NULL,
  `description` text,
  `field` varchar(255) DEFAULT NULL,
  `event` varchar(255) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `starting_ratio` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_audiences_on_sub_category_id` (`sub_category_id`),
  CONSTRAINT `fk_rails_cc8741d384` FOREIGN KEY (`sub_category_id`) REFERENCES `sub_categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audiences`
--

LOCK TABLES `audiences` WRITE;
/*!40000 ALTER TABLE `audiences` DISABLE KEYS */;
INSERT INTO `audiences` VALUES (10,'Recent Visitors 0-30','2434201416894708','pixel','2592000','1','120330000305224608',6,'2020-01-22 06:42:36','2020-01-22 07:17:37','LOOKALIKE','','custom_ratio','US','0.01',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(11,'All Visitors 30-180','2434201416894708','pixel','15552000','1','120330000305225108',6,'2020-01-22 06:48:03','2020-01-22 06:48:03','LOOKALIKE','','custom_ratio','US','0.01',NULL,NULL,NULL,NULL,NULL,NULL,NULL),(12,'Facebook Fans','2434201416894708','pixel','15552000','1','120330000305248508',4,'2020-01-22 11:38:58','2020-01-22 11:38:58','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(26,'Niche Retargeting From Top URLs','2434201416894708','pixel','86400','home','120330000305511308',10,'2020-01-29 09:49:16','2020-01-29 09:49:16','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(27,'Category Specific Mid Intent Visitors','2434201416894708','pixel','15552000','category','120330000305511408',21,'2020-01-29 09:50:51','2020-01-29 09:50:51','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(28,'Product Specific - Mid Intent Visitors','2434201416894708','pixel','15552000','product','120330000305511508',22,'2020-01-29 09:52:15','2020-01-29 09:52:15','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(34,'Niche Retention Ads From Top URLs','2434201416894708','pixel','86400','home','120330000305512408',10,'2020-01-29 10:52:04','2020-01-29 10:52:04','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(36,'Basic Retention - Last 180d','2434201416894708','pixel','15552000','','120330000305512608',7,'2020-01-29 10:56:35','2020-01-29 10:56:35','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(37,'Post Purchase - 0-10 Days','2434201416894708','pixel','864000','','120330000305512708',25,'2020-01-29 10:58:56','2020-01-29 10:58:56','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(38,'Website Leads','2434201416894708','pixel','15552000','','120330000305512808',30,'2020-01-29 11:03:38','2020-01-29 11:03:38','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,NULL,NULL,NULL,NULL,NULL),(39,'Time Spent - Deep Browsing','2434201416894708','pixel','15552000','','120330000305514508',9,'2020-01-29 13:02:55','2020-01-29 13:02:55','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,'url','purchase',NULL,NULL,NULL),(40,'Time Spent - Considering','2434201416894708','pixel','15552000','','120330000305516208',9,'2020-01-29 13:22:29','2020-01-29 13:22:29','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,'time','purchase','gt','180',NULL),(41,'Multiple Visits','2434201416894708','pixel','15552000','','120330000305516308',6,'2020-01-29 13:30:28','2020-01-29 13:30:28','LOOKALIKE','','custom_ratio','US','0.01','104245237765328',NULL,'count','purchase','gt','180',NULL),(42,'Facebook Fans (Lookalike)','2434201416894708','pixel','86400','','120330000305541508',15,'2020-01-30 10:23:07','2020-01-30 10:23:07','LOOKALIKE','120330000305248508','custom_ratio','US','0.01','104245237765328',NULL,'url','purchase','gt','1','0'),(43,'Facebook Fans (Lookalike)','2434201416894708','pixel','86400','','120330000305541708',15,'2020-01-30 10:33:13','2020-01-30 10:33:13','LOOKALIKE','120330000305248508','custom_ratio','US','0.04','104245237765328',NULL,'url','purchase','gt','1','0.01'),(45,'Lookalike Of All Website Leads','2434201416894708','pixel','86400','','120330000305560108',17,'2020-01-30 11:37:33','2020-01-30 11:37:33','LOOKALIKE','120330000305512808','custom_ratio','US','0.01','104245237765328',NULL,'url','purchase','gt','1','0'),(46,'Category Specific Purchasers','2434201416894708','pixel','86400','','120330000305560308',12,'2020-01-30 12:07:21','2020-01-30 12:07:21','LOOKALIKE','120330000305511408','custom_ratio','US','0.02','104245237765328',NULL,'url','purchase','gt','1','0'),(47,'Category Specific Visitors','2434201416894708','pixel','86400','','120330000305560508',12,'2020-01-30 12:08:51','2020-01-30 12:08:51','LOOKALIKE','120330000305511408','custom_ratio','US','0.2','104245237765328',NULL,'url','purchase','gt','1','0.1'),(48,'Product Specific - Purchasers','2434201416894708','pixel','86400','','120330000305560608',13,'2020-01-30 12:10:28','2020-01-30 12:10:28','LOOKALIKE','120330000305511508','custom_ratio','US','0.2','104245237765328',NULL,'url','purchase','gt','1','0.1'),(49,'Product Specific - Visitors','2434201416894708','pixel','86400','','120330000305560808',13,'2020-01-30 12:11:14','2020-01-30 12:11:14','LOOKALIKE','120330000305511508','custom_ratio','US','0.1','104245237765328',NULL,'url','purchase','gt','1','0'),(50,'Niche Prospecting From Top URLs','2434201416894708','pixel','86400','','120330000305560908',19,'2020-01-30 12:18:12','2020-01-30 12:18:12','LOOKALIKE','120330000305512408','custom_ratio','US','0.09','104245237765328',NULL,'url','purchase','gt','1','0'),(51,'test lead','2434201416894708','pixel','86400','','120330000305847408',17,'2020-02-06 11:52:20','2020-02-06 11:52:20','LOOKALIKE','120330000305512708','custom_ratio','US','0.06','104245237765328','','url','purchase','gt','1','0.04'),(52,'test video','2434201416894708','pixel','86400','','120330000305866208',1,'2020-02-06 13:38:39','2020-02-06 13:38:39','LOOKALIKE','','custom_ratio','US','0.02','104245237765328','','url','purchase','gt','1','0'),(53,'4567','2434201416894708','pixel','2592000','','120330000307195208',6,'2020-02-19 08:43:34','2020-02-19 08:43:34','LOOKALIKE','','custom_ratio','US','0.02','104245237765328','','time_spent','purchase','gt','180','0'),(54,'','2434201416894708','pixel','86400','','120330000307301108',5,'2020-02-19 13:42:50','2020-02-19 13:42:50','LOOKALIKE','120330000305248508','custom_ratio','US','0.02','104245237765328','','url','purchase','gt','1','0');
/*!40000 ALTER TABLE `audiences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `business_managers`
--

DROP TABLE IF EXISTS `business_managers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `business_managers` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `business_account_id` bigint(20) DEFAULT NULL,
  `business_account_name` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `business_managers`
--

LOCK TABLES `business_managers` WRITE;
/*!40000 ALTER TABLE `business_managers` DISABLE KEYS */;
/*!40000 ALTER TABLE `business_managers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `campaigns`
--

DROP TABLE IF EXISTS `campaigns`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `campaigns` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `objective` varchar(255) DEFAULT NULL,
  `special_ad_category` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `buying_type` varchar(255) DEFAULT NULL,
  `campaign_id` varchar(255) DEFAULT NULL,
  `daily_budget` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `campaigns`
--

LOCK TABLES `campaigns` WRITE;
/*!40000 ALTER TABLE `campaigns` DISABLE KEYS */;
INSERT INTO `campaigns` VALUES (1,'OFFER_CLAIMS','CREDIT',NULL,'test campaign',NULL,'120330000305470108','40','2020-01-28 07:46:51','2020-01-28 07:46:51');
/*!40000 ALTER TABLE `campaigns` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Re-engagement','Re-engagement','2020-01-20 11:55:37','2020-01-20 11:55:37'),(3,'Retargeting','Retargeting','2020-01-20 11:57:42','2020-01-20 11:57:42'),(4,'Retention','Retention','2020-01-21 06:46:14','2020-01-21 06:46:14'),(5,'Prospecting Lookalike','Prospecting Lookalike','2020-01-21 08:04:40','2020-01-21 08:04:40');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facebooks`
--

DROP TABLE IF EXISTS `facebooks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facebooks` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `fb_user_id` bigint(20) DEFAULT NULL,
  `fb_access_token` varchar(255) DEFAULT NULL,
  `fb_business_account_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facebooks`
--

LOCK TABLES `facebooks` WRITE;
/*!40000 ALTER TABLE `facebooks` DISABLE KEYS */;
/*!40000 ALTER TABLE `facebooks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `paypal_payments`
--

DROP TABLE IF EXISTS `paypal_payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `paypal_payments` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `order_id` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `address_line_1` varchar(255) DEFAULT NULL,
  `admin_area_2` varchar(255) DEFAULT NULL,
  `admin_area_1` varchar(255) DEFAULT NULL,
  `postal_code` bigint(20) DEFAULT NULL,
  `country_code` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `currency_code` varchar(255) DEFAULT NULL,
  `payment_amount` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `paypal_payments`
--

LOCK TABLES `paypal_payments` WRITE;
/*!40000 ALTER TABLE `paypal_payments` DISABLE KEYS */;
INSERT INTO `paypal_payments` VALUES (1,'8VW4382030404534E','John Doe','1 Main St','San Jose','CA',95131,'US','78T085877E2177908','USD',49,'2020-01-27 13:58:28','2020-01-27 13:58:28');
/*!40000 ALTER TABLE `paypal_payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `resource_type` varchar(255) DEFAULT NULL,
  `resource_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_roles_on_name_and_resource_type_and_resource_id` (`name`,`resource_type`,`resource_id`),
  KEY `index_roles_on_name` (`name`),
  KEY `index_roles_on_resource_type_and_resource_id` (`resource_type`,`resource_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin',NULL,NULL,'2020-01-16 11:48:22','2020-01-16 11:48:22');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rules`
--

DROP TABLE IF EXISTS `rules`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rules` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `evaluation_spec` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `fb_rule_id` varchar(255) DEFAULT NULL,
  `schedule_spec` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `entity_type` varchar(255) DEFAULT NULL,
  `filter_value` int(11) DEFAULT NULL,
  `time_preset` varchar(255) DEFAULT NULL,
  `filter_field` varchar(255) DEFAULT NULL,
  `filter_operation` varchar(255) DEFAULT NULL,
  `evaluation_type` varchar(255) DEFAULT NULL,
  `insight` varchar(255) DEFAULT NULL,
  `attribution_window` varchar(255) DEFAULT NULL,
  `value` int(11) DEFAULT NULL,
  `operator` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rules`
--

LOCK TABLES `rules` WRITE;
/*!40000 ALTER TABLE `rules` DISABLE KEYS */;
INSERT INTO `rules` VALUES (1,NULL,'ENABLED','120330000306587108',NULL,'qwerty','CAMPAIGN',NULL,'LAST_2_DAYS',NULL,NULL,NULL,'cost_per_search_fb',NULL,559,'GREATER_THAN','2020-02-14 05:36:13','2020-02-14 05:36:13'),(2,NULL,'ENABLED','120330000306589108',NULL,'ytrewq','CAMPAIGN',NULL,'LAST_2_DAYS',NULL,NULL,NULL,'cost_per_search_fb',NULL,559,'GREATER_THAN','2020-02-14 05:37:29','2020-02-14 05:37:29'),(3,NULL,'ENABLED','120330000307596408',NULL,'qwertyu','CAMPAIGN',NULL,'LAST_28_DAYS',NULL,NULL,NULL,'cost_per_view_content_fb',NULL,559,'LESS_THAN','2020-02-21 08:59:04','2020-02-21 08:59:04'),(4,NULL,'ENABLED','120330000309660208',NULL,'test rule -- new','CAMPAIGN',NULL,'LAST_2_DAYS',NULL,NULL,NULL,'cost_per_view_content_fb',NULL,559,'GREATER_THAN','2020-02-27 13:58:31','2020-02-27 13:58:31');
/*!40000 ALTER TABLE `rules` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20191230095223'),('20191230100106'),('20191230120152'),('20191230120215'),('20191230120537'),('20191230120554'),('20200102120826'),('20200103134844'),('20200110174546'),('20200115101848'),('20200115130313'),('20200115133031'),('20200120115009'),('20200120115319'),('20200120115352'),('20200121083515'),('20200122095714'),('20200122095857'),('20200122095935'),('20200125080924'),('20200129102337'),('20200130065757');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_categories`
--

DROP TABLE IF EXISTS `sub_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_categories` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `category_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_sub_categories_on_category_id` (`category_id`),
  CONSTRAINT `fk_rails_8e75c2ee78` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_categories`
--

LOCK TABLES `sub_categories` WRITE;
/*!40000 ALTER TABLE `sub_categories` DISABLE KEYS */;
INSERT INTO `sub_categories` VALUES (1,'Video Viewers','Video  Viewers',1,'2020-01-20 11:59:11','2020-01-28 05:23:35'),(3,'Ads Engagors','Ads Engagors',1,'2020-01-20 12:04:50','2020-01-20 12:04:50'),(4,'Social Media Engagors','Social Media Engagors',1,'2020-01-20 12:05:26','2020-01-20 12:05:26'),(5,'test lookalike','test lookalike',5,'2020-01-21 08:05:59','2020-01-21 08:05:59'),(6,'Basic Retargeting','Basic Retargeting',3,'2020-01-21 08:06:28','2020-01-28 05:23:11'),(7,'Basic rentention','basic rentention',4,'2020-01-21 08:07:02','2020-01-29 13:33:29'),(8,'Traffic Source','Traffic Source',3,'2020-01-22 06:52:46','2020-01-22 06:52:46'),(9,'Time Based','Time Based',3,'2020-01-22 06:53:55','2020-01-22 06:54:50'),(10,'Niche Retargeting','Niche Retargeting',3,'2020-01-22 06:54:33','2020-01-22 06:54:33'),(12,'Category Affinity',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(13,'Product Affinity',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(14,'Special Audiences',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(15,'Social Media Fans',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(16,'Video Viewers',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(17,'Leads',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(18,'Devices persona',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(19,'Niche Lookalike',NULL,5,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(21,'Category Affinity',NULL,3,'2020-01-28 05:16:29','2020-01-28 05:16:29'),(22,'Product Affinity',NULL,3,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(24,'Email Lists',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(25,'Post Purchase',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(26,'Reactivation',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(27,'Niche Retention',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(28,'Category Affinity',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(29,'Product Affinity',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30'),(30,'Leads',NULL,4,'2020-01-28 05:16:30','2020-01-28 05:16:30');
/*!40000 ALTER TABLE `sub_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscriptions`
--

DROP TABLE IF EXISTS `subscriptions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscriptions` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `my_score` varchar(255) DEFAULT NULL,
  `cost_value` varchar(255) DEFAULT NULL,
  `pay_value` varchar(255) DEFAULT NULL,
  `subscription_type` varchar(255) DEFAULT NULL,
  `start_date` varchar(255) DEFAULT NULL,
  `end_date` varchar(255) DEFAULT NULL,
  `agree` tinyint(1) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_subscriptions_on_user_id` (`user_id`),
  CONSTRAINT `fk_rails_933bdff476` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscriptions`
--

LOCK TABLES `subscriptions` WRITE;
/*!40000 ALTER TABLE `subscriptions` DISABLE KEYS */;
INSERT INTO `subscriptions` VALUES (1,'0',NULL,NULL,'Annual Plan','2020-01-23','2021-01-23',1,1,'2020-01-23 06:49:04','2020-01-23 06:49:04'),(2,'',NULL,NULL,'Monthly Plan','2020-01-23','2020-02-23',1,2,'2020-01-23 06:52:08','2020-01-23 06:52:08'),(3,'',NULL,NULL,'Monthly Plan','2020-01-23','2020-02-23',1,2,'2020-01-23 06:52:31','2020-01-23 06:52:31'),(4,'0',NULL,NULL,'Quarterly Plan','2020-01-23','2020-04-23',1,2,'2020-01-23 06:52:56','2020-01-23 06:52:56'),(5,'132',NULL,NULL,'Quarterly Plan','2020-01-23','2020-04-23',1,2,'2020-01-23 06:55:56','2020-01-23 06:55:56'),(6,'',NULL,NULL,'Monthly Plan','2020-01-23','2020-02-23',1,2,'2020-01-23 06:56:09','2020-01-23 06:56:09'),(7,'17547',NULL,NULL,'Quarterly Plan','2020-01-23','2020-04-23',1,2,'2020-01-23 06:57:25','2020-01-23 06:57:25'),(8,'0',NULL,NULL,'Quarterly Plan','2020-01-23','2020-04-23',1,2,'2020-01-23 06:57:49','2020-01-23 06:57:49'),(9,'',NULL,NULL,'Monthly Plan','2020-01-23','2020-02-23',1,2,'2020-01-23 13:32:14','2020-01-23 13:32:14'),(10,'',NULL,NULL,'Monthly Plan','2020-01-23','2020-02-23',1,2,'2020-01-23 13:32:22','2020-01-23 13:32:22'),(11,'',NULL,NULL,'Monthly Plan','2020-01-23','2020-02-23',1,2,'2020-01-23 13:32:31','2020-01-23 13:32:31'),(12,'0',NULL,NULL,'Quarterly Plan','2020-01-23','2020-04-23',1,2,'2020-01-23 13:34:06','2020-01-23 13:34:06'),(13,'0',NULL,NULL,'Quarterly Plan','2020-01-24','2020-04-24',1,2,'2020-01-24 07:40:27','2020-01-24 07:40:27'),(14,'29700',NULL,NULL,'Quarterly Plan','2020-01-24','2020-04-24',1,2,'2020-01-24 07:41:03','2020-01-24 07:41:03'),(15,'49',NULL,NULL,'','2020-01-27','2020-04-27',1,11,'2020-01-27 13:58:28','2020-01-27 13:58:28');
/*!40000 ALTER TABLE `subscriptions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `email` varchar(255) NOT NULL DEFAULT '',
  `encrypted_password` varchar(255) NOT NULL DEFAULT '',
  `reset_password_token` varchar(255) DEFAULT NULL,
  `reset_password_sent_at` datetime DEFAULT NULL,
  `remember_created_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `provider` varchar(255) DEFAULT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `image` text,
  `sign_in_count` int(11) NOT NULL DEFAULT '0',
  `current_sign_in_at` datetime DEFAULT NULL,
  `last_sign_in_at` datetime DEFAULT NULL,
  `current_sign_in_ip` varchar(255) DEFAULT NULL,
  `last_sign_in_ip` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_users_on_email` (`email`),
  UNIQUE KEY `index_users_on_reset_password_token` (`reset_password_token`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'admin@brainio.com','$2a$11$RUYBYiptNj8BSijlmrsPBOzjIfKxNO3ipx17fRKDWUo2TSdaF/3c.',NULL,NULL,NULL,'2020-01-16 11:48:22','2020-02-28 10:23:01',NULL,NULL,'admin',NULL,40,'2020-02-28 10:23:01','2020-02-27 13:37:24','219.91.153.171','219.91.153.171',1),(2,'dj282300@gmail.com','$2a$11$Abcp/I7RpD141aALE/sgT.Kya18u6q0NRPwZ2eHckK6BsU5QxYtH6',NULL,NULL,NULL,'2020-01-16 12:02:55','2020-02-27 13:04:06',NULL,NULL,'david',NULL,38,'2020-02-27 13:04:06','2020-02-27 10:40:12','219.91.153.171','219.91.153.171',1),(4,'test@gmail.com','$2a$11$otSxZ9IwamKnDLoTL9gXneQL4kJa.86DRRtgal9EGAlE.yEcVs1l2',NULL,NULL,NULL,'2020-01-16 12:05:50','2020-01-20 12:10:24',NULL,NULL,'david',NULL,4,'2020-01-17 10:42:29','2020-01-16 12:13:16','::1','::1',1),(5,'test@g.c','$2a$11$7oxMIXnF3vLDYCav8cM9AOwJU3ZlhPQRte28EFaxwAN2uaxTiC8G.',NULL,NULL,NULL,'2020-01-16 12:24:02','2020-01-17 10:43:58',NULL,NULL,'admin@brainio.com',NULL,0,NULL,NULL,NULL,NULL,1),(6,'dasdw@g.com','$2a$11$/WiW7OD8LIIGqZlq7uUAkOS21m7Q.r6ZNNZdlrXawbhaHnfxbU92m',NULL,NULL,NULL,'2020-01-16 12:24:38','2020-01-17 09:29:22',NULL,NULL,'admin@brainiodsda.com',NULL,0,NULL,NULL,NULL,NULL,1),(7,'admin1@brainio.com','$2a$11$lON/Ro39IsP69d.loNiIJugFJTXqG.xeKDH3NuSd1DKr36OzAQ2mq',NULL,NULL,NULL,'2020-01-17 07:37:21','2020-01-17 07:38:15',NULL,NULL,'test',NULL,0,NULL,NULL,NULL,NULL,1),(8,'test12345@gmail.com','$2a$11$2h/PMtrQ7/tnZvWBU4YN7uvdhfHPWGsCo7WuAOl5xoOBTZhRoAope',NULL,NULL,NULL,'2020-01-17 07:42:33','2020-01-17 09:25:33',NULL,NULL,'test1234567',NULL,0,NULL,NULL,NULL,NULL,1),(9,'c@f.c','$2a$11$9GpiKQYv/ilkt9K6ejI.FOPumQVxnFa5McmPyWzEOaaP692S2WV1.',NULL,NULL,NULL,'2020-01-17 09:28:54','2020-01-17 09:28:54',NULL,NULL,'',NULL,0,NULL,NULL,NULL,NULL,1),(10,'sdads@gmail.com','$2a$11$8IOipgu2I2O7yvhTn42Dju8ssf6gHD0zOGd7Q059aRjI1AiAC27PK',NULL,NULL,NULL,'2020-01-17 10:44:21','2020-01-17 10:44:21',NULL,NULL,'saa',NULL,0,NULL,NULL,NULL,NULL,1),(11,'roneymith34@gmail.com','$2a$11$tXKCqbvCZCXhQk0Kar7PeeS4F9Sz3n/87xI1fcUGfSnnsvD7f4Fsm',NULL,NULL,NULL,'2020-01-27 13:52:23','2020-01-27 13:52:23',NULL,NULL,NULL,NULL,1,'2020-01-27 13:52:23','2020-01-27 13:52:23','::1','::1',1),(12,'test2@gmail.com','$2a$11$W6iUm/ANcqbwUsvwYEGBheWJ7/1RP4pQMxbfrQ/alwZ.vFBLJtiv2',NULL,NULL,NULL,'2020-02-20 13:51:12','2020-02-20 13:51:12',NULL,NULL,NULL,NULL,1,'2020-02-20 13:51:12','2020-02-20 13:51:12','219.91.153.171','219.91.153.171',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_roles`
--

DROP TABLE IF EXISTS `users_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users_roles` (
  `user_id` bigint(20) DEFAULT NULL,
  `role_id` bigint(20) DEFAULT NULL,
  KEY `index_users_roles_on_role_id` (`role_id`),
  KEY `index_users_roles_on_user_id_and_role_id` (`user_id`,`role_id`),
  KEY `index_users_roles_on_user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_roles`
--

LOCK TABLES `users_roles` WRITE;
/*!40000 ALTER TABLE `users_roles` DISABLE KEYS */;
INSERT INTO `users_roles` VALUES (1,1),(7,1),(8,1);
/*!40000 ALTER TABLE `users_roles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-29 18:14:16
