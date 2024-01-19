-- MySQL dump 10.13  Distrib 8.1.0, for macos14.0 (arm64)
--
-- Host: localhost    Database: hously
-- ------------------------------------------------------
-- Server version	8.1.0

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
-- Table structure for table `activations`
--

DROP TABLE IF EXISTS `activations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `code` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `completed` tinyint(1) NOT NULL DEFAULT '0',
  `completed_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `activations_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activations`
--

LOCK TABLES `activations` WRITE;
/*!40000 ALTER TABLE `activations` DISABLE KEYS */;
INSERT INTO `activations` VALUES (1,1,'x3MO8uVN9llZ1v10oo3nfBF2D9N2IkmC',1,'2024-01-16 03:08:07','2024-01-16 03:08:07','2024-01-16 03:08:07'),(2,2,'Mf583QEcw0gjgL8uD0fkSZvtBQ6eLgki',1,'2024-01-16 03:08:07','2024-01-16 03:08:07','2024-01-16 03:08:07');
/*!40000 ALTER TABLE `activations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_notifications`
--

DROP TABLE IF EXISTS `admin_notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_notifications` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `action_label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `action_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `permission` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_notifications`
--

LOCK TABLES `admin_notifications` WRITE;
/*!40000 ALTER TABLE `admin_notifications` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `audit_histories`
--

DROP TABLE IF EXISTS `audit_histories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `audit_histories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `module` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `request` longtext COLLATE utf8mb4_unicode_ci,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_user` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `audit_histories_user_id_index` (`user_id`),
  KEY `audit_histories_module_index` (`module`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `audit_histories`
--

LOCK TABLES `audit_histories` WRITE;
/*!40000 ALTER TABLE `audit_histories` DISABLE KEYS */;
/*!40000 ALTER TABLE `audit_histories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_featured` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `categories_parent_id_index` (`parent_id`),
  KEY `categories_status_index` (`status`),
  KEY `categories_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
INSERT INTO `categories` VALUES (1,'Design',0,'Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice very humbly: \'you had got to do,\' said Alice more boldly: \'you know you\'re growing too.\' \'Yes, but I hadn\'t mentioned Dinah!\' she.','published',2,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'Lifestyle',0,'VERY unpleasant state of mind, she turned to the shore. CHAPTER III. A Caucus-Race and a great many more than Alice could think of nothing better to say \'Drink me,\' but the wise little Alice was.','published',2,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'Travel Tips',0,'Dinn may be,\' said the Caterpillar took the regular course.\' \'What was THAT like?\' said Alice. \'Why, you don\'t explain it as she could, \'If you do. I\'ll set Dinah at you!\' There was nothing so VERY.','published',2,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Healthy',0,'I shall only look up and down looking for the garden!\' and she jumped up in spite of all her wonderful Adventures, till she had read about them in books, and she felt sure she would manage it. \'They.','published',2,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'Travel Tips',0,'King repeated angrily, \'or I\'ll have you executed on the breeze that followed them, the melancholy words:-- \'Soo--oop of the fact. \'I keep them to sell,\' the Hatter said, tossing his head.','published',1,'Botble\\ACL\\Models\\User',NULL,0,0,0,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'Hotel',0,'King in a low, trembling voice. \'There\'s more evidence to come upon them THIS size: why, I should think you could manage it?) \'And what an ignorant little girl or a worm. The question is, what did.','published',1,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(7,'Nature',0,'White Rabbit, with a little scream, half of fright and half believed herself in a deep voice, \'are done with a growl, And concluded the banquet--] \'What IS a Caucus-race?\' said Alice; \'it\'s laid for.','published',2,'Botble\\ACL\\Models\\User',NULL,0,1,0,'2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories_translations`
--

DROP TABLE IF EXISTS `categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories_translations`
--

LOCK TABLES `categories_translations` WRITE;
/*!40000 ALTER TABLE `categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `record_id` varchar(40) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `cities_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Paris','paris',1,1,NULL,0,'cities/location-1.jpg',0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'London','london',2,2,NULL,0,'cities/location-2.jpg',0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'New York','new-york',3,3,NULL,0,'cities/location-3.jpg',0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Copenhagen','copenhagen',4,4,NULL,0,'cities/location-4.jpg',0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'Berlin','berlin',5,5,NULL,0,'cities/location-5.jpg',0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities_translations`
--

DROP TABLE IF EXISTS `cities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cities_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cities_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`cities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities_translations`
--

LOCK TABLES `cities_translations` WRITE;
/*!40000 ALTER TABLE `cities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `cities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contact_replies`
--

DROP TABLE IF EXISTS `contact_replies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contact_replies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `message` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `contact_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contact_replies`
--

LOCK TABLES `contact_replies` WRITE;
/*!40000 ALTER TABLE `contact_replies` DISABLE KEYS */;
/*!40000 ALTER TABLE `contact_replies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacts`
--

DROP TABLE IF EXISTS `contacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacts`
--

LOCK TABLES `contacts` WRITE;
/*!40000 ALTER TABLE `contacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `contacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `code` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'France','French',0,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08','FRA'),(2,'England','English',0,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08','UK'),(3,'USA','Americans',0,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08','US'),(4,'Holland','Dutch',0,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08','HL'),(5,'Denmark','Danish',0,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08','DN'),(6,'Germany','Danish',0,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08','DN');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries_translations`
--

DROP TABLE IF EXISTS `countries_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `countries_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nationality` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`countries_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries_translations`
--

LOCK TABLES `countries_translations` WRITE;
/*!40000 ALTER TABLE `countries_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `countries_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widget_settings`
--

DROP TABLE IF EXISTS `dashboard_widget_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widget_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `settings` text COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned NOT NULL,
  `widget_id` bigint unsigned NOT NULL,
  `order` tinyint unsigned NOT NULL DEFAULT '0',
  `status` tinyint unsigned NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dashboard_widget_settings_user_id_index` (`user_id`),
  KEY `dashboard_widget_settings_widget_id_index` (`widget_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widget_settings`
--

LOCK TABLES `dashboard_widget_settings` WRITE;
/*!40000 ALTER TABLE `dashboard_widget_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widget_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dashboard_widgets`
--

DROP TABLE IF EXISTS `dashboard_widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dashboard_widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dashboard_widgets`
--

LOCK TABLES `dashboard_widgets` WRITE;
/*!40000 ALTER TABLE `dashboard_widgets` DISABLE KEYS */;
/*!40000 ALTER TABLE `dashboard_widgets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories`
--

DROP TABLE IF EXISTS `faq_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `description` varchar(300) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories`
--

LOCK TABLES `faq_categories` WRITE;
/*!40000 ALTER TABLE `faq_categories` DISABLE KEYS */;
INSERT INTO `faq_categories` VALUES (1,'General',0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(2,'Buying',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(3,'Payment',2,'published','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(4,'Support',3,'published','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL);
/*!40000 ALTER TABLE `faq_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faq_categories_translations`
--

DROP TABLE IF EXISTS `faq_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faq_categories_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faq_categories_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`faq_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faq_categories_translations`
--

LOCK TABLES `faq_categories_translations` WRITE;
/*!40000 ALTER TABLE `faq_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faq_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs`
--

DROP TABLE IF EXISTS `faqs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `question` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `answer` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs`
--

LOCK TABLES `faqs` WRITE;
/*!40000 ALTER TABLE `faqs` DISABLE KEYS */;
INSERT INTO `faqs` VALUES (1,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',1,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(7,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',2,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(8,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(9,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',2,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(10,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',2,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(11,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',2,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(12,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',2,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(13,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',3,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(14,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(15,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',3,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(16,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',3,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(17,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',3,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(18,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',3,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(19,'Where does it come from?','If several languages coalesce, the grammar of the resulting language is more simple and regular than that of the individual languages. The new common language will be more simple and regular than the existing European languages.',4,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(20,'How JobBox Work?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(21,'What is your shipping policy?','Everyone realizes why a new common language would be desirable: one could refuse to pay expensive translators. To achieve this, it would be necessary to have uniform grammar, pronunciation and more common words.',4,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(22,'Where To Place A FAQ Page','Just as the name suggests, a FAQ page is all about simple questions and answers. Gather common questions your customers have asked from your support team and include them in the FAQ, Use categories to organize questions related to specific topics.',4,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(23,'Why do we use it?','It will be as simple as Occidental; in fact, it will be Occidental. To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental.',4,'published','2024-01-16 03:08:09','2024-01-16 03:08:09'),(24,'Where can I get some?','To an English person, it will seem like simplified English, as a skeptical Cambridge friend of mine told me what Occidental is. The European languages are members of the same family. Their separate existence is a myth.',4,'published','2024-01-16 03:08:09','2024-01-16 03:08:09');
/*!40000 ALTER TABLE `faqs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `faqs_translations`
--

DROP TABLE IF EXISTS `faqs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `faqs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `faqs_id` bigint unsigned NOT NULL,
  `question` text COLLATE utf8mb4_unicode_ci,
  `answer` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`faqs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faqs_translations`
--

LOCK TABLES `faqs_translations` WRITE;
/*!40000 ALTER TABLE `faqs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `faqs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `language_meta`
--

DROP TABLE IF EXISTS `language_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `language_meta` (
  `lang_meta_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_meta_code` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_meta_origin` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`lang_meta_id`),
  KEY `language_meta_reference_id_index` (`reference_id`),
  KEY `meta_code_index` (`lang_meta_code`),
  KEY `meta_origin_index` (`lang_meta_origin`),
  KEY `meta_reference_type_index` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language_meta`
--

LOCK TABLES `language_meta` WRITE;
/*!40000 ALTER TABLE `language_meta` DISABLE KEYS */;
INSERT INTO `language_meta` VALUES (1,'en_US','a5178387cd7c3ed94626b1f9e476589b',1,'Botble\\Menu\\Models\\MenuLocation'),(2,'en_US','471bdeb5726e42fc257b1ce0c76cacdb',1,'Botble\\Menu\\Models\\Menu'),(3,'en_US','3fb54ba9bd081fbfacca35b6a983d989',2,'Botble\\Menu\\Models\\Menu'),(4,'en_US','10639a9fdf9ec7ca7a5ee586c7d4c9a0',3,'Botble\\Menu\\Models\\Menu');
/*!40000 ALTER TABLE `language_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `lang_id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `lang_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_locale` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lang_flag` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `lang_is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `lang_order` int NOT NULL DEFAULT '0',
  `lang_is_rtl` tinyint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`lang_id`),
  KEY `lang_locale_index` (`lang_locale`),
  KEY `lang_code_index` (`lang_code`),
  KEY `lang_is_default_index` (`lang_is_default`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en','en_US','us',1,0,0);
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_files`
--

DROP TABLE IF EXISTS `media_files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder_id` bigint unsigned NOT NULL DEFAULT '0',
  `mime_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `size` int NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_files_user_id_index` (`user_id`),
  KEY `media_files_index` (`folder_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_files`
--

LOCK TABLES `media_files` WRITE;
/*!40000 ALTER TABLE `media_files` DISABLE KEYS */;
INSERT INTO `media_files` VALUES (1,0,'location-1','location-1',1,'image/jpeg',4881,'cities/location-1.jpg','[]','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(2,0,'location-2','location-2',1,'image/jpeg',4881,'cities/location-2.jpg','[]','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(3,0,'location-3','location-3',1,'image/jpeg',4881,'cities/location-3.jpg','[]','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(4,0,'location-4','location-4',1,'image/jpeg',4881,'cities/location-4.jpg','[]','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(5,0,'location-5','location-5',1,'image/jpeg',4881,'cities/location-5.jpg','[]','2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(6,0,'1','1',2,'image/jpeg',9730,'accounts/1.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(7,0,'10','10',2,'image/jpeg',9730,'accounts/10.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(8,0,'2','2',2,'image/jpeg',9730,'accounts/2.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(9,0,'3','3',2,'image/jpeg',9730,'accounts/3.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(10,0,'4','4',2,'image/jpeg',9730,'accounts/4.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(11,0,'5','5',2,'image/jpeg',9730,'accounts/5.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(12,0,'6','6',2,'image/jpeg',9730,'accounts/6.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(13,0,'7','7',2,'image/jpeg',9730,'accounts/7.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(14,0,'8','8',2,'image/jpeg',9730,'accounts/8.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(15,0,'9','9',2,'image/jpeg',9730,'accounts/9.jpg','[]','2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(16,0,'01','01',3,'image/jpeg',34111,'backgrounds/01.jpg','[]','2024-01-16 03:08:16','2024-01-16 03:08:16',NULL),(17,0,'02','02',3,'image/jpeg',34111,'backgrounds/02.jpg','[]','2024-01-16 03:08:16','2024-01-16 03:08:16',NULL),(18,0,'03','03',3,'image/jpeg',34111,'backgrounds/03.jpg','[]','2024-01-16 03:08:16','2024-01-16 03:08:16',NULL),(19,0,'04','04',3,'image/jpeg',34111,'backgrounds/04.jpg','[]','2024-01-16 03:08:16','2024-01-16 03:08:16',NULL),(20,0,'hero','hero',3,'image/jpeg',12672,'backgrounds/hero.jpg','[]','2024-01-16 03:08:16','2024-01-16 03:08:16',NULL),(21,0,'map','map',3,'image/png',25344,'backgrounds/map.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(22,0,'01','01',4,'image/jpeg',5306,'clients/01.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(23,0,'02','02',4,'image/jpeg',5306,'clients/02.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(24,0,'03','03',4,'image/jpeg',5306,'clients/03.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(25,0,'04','04',4,'image/jpeg',5306,'clients/04.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(26,0,'05','05',4,'image/jpeg',5306,'clients/05.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(27,0,'06','06',4,'image/jpeg',5306,'clients/06.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(28,0,'07','07',4,'image/jpeg',5306,'clients/07.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(29,0,'08','08',4,'image/jpeg',5306,'clients/08.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(30,0,'amazon','amazon',4,'image/png',1180,'clients/amazon.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(31,0,'google','google',4,'image/png',1180,'clients/google.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(32,0,'lenovo','lenovo',4,'image/png',1180,'clients/lenovo.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(33,0,'paypal','paypal',4,'image/png',1180,'clients/paypal.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(34,0,'shopify','shopify',4,'image/png',1180,'clients/shopify.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(35,0,'spotify','spotify',4,'image/png',1180,'clients/spotify.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(36,0,'about','about',5,'image/jpeg',11053,'general/about.jpg','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(37,0,'error','error',5,'image/png',7124,'general/error.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(38,0,'favicon','favicon',5,'image/png',6145,'general/favicon.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(39,0,'logo-authentication-page','logo-authentication-page',5,'image/png',2683,'general/logo-authentication-page.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(40,0,'logo-dark','logo-dark',5,'image/png',2597,'general/logo-dark.png','[]','2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(41,0,'logo-light','logo-light',5,'image/png',2626,'general/logo-light.png','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(42,0,'1','1',6,'image/jpeg',9730,'properties/1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(43,0,'10','10',6,'image/jpeg',9730,'properties/10.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(44,0,'11','11',6,'image/jpeg',9730,'properties/11.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(45,0,'12','12',6,'image/jpeg',9730,'properties/12.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(46,0,'2','2',6,'image/jpeg',9730,'properties/2.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(47,0,'3','3',6,'image/jpeg',9730,'properties/3.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(48,0,'4','4',6,'image/jpeg',9730,'properties/4.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(49,0,'5','5',6,'image/jpeg',9730,'properties/5.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(50,0,'6','6',6,'image/jpeg',9730,'properties/6.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(51,0,'7','7',6,'image/jpeg',9730,'properties/7.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(52,0,'8','8',6,'image/jpeg',9730,'properties/8.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(53,0,'9','9',6,'image/jpeg',9730,'properties/9.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(54,0,'1-1','1-1',6,'image/jpeg',9730,'properties/1-1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(55,0,'2-1','2-1',6,'image/jpeg',9730,'properties/2-1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(56,0,'3-1','3-1',6,'image/jpeg',9730,'properties/3-1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(57,0,'4-1','4-1',6,'image/jpeg',9730,'properties/4-1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(58,0,'5-1','5-1',6,'image/jpeg',9730,'properties/5-1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(59,0,'1','1',7,'image/jpeg',9730,'news/1.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(60,0,'10','10',7,'image/jpeg',9730,'news/10.jpg','[]','2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(61,0,'11','11',7,'image/jpeg',9730,'news/11.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(62,0,'12','12',7,'image/jpeg',9730,'news/12.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(63,0,'13','13',7,'image/jpeg',9730,'news/13.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(64,0,'14','14',7,'image/jpeg',9730,'news/14.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(65,0,'15','15',7,'image/jpeg',9730,'news/15.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(66,0,'16','16',7,'image/jpeg',9730,'news/16.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(67,0,'2','2',7,'image/jpeg',9730,'news/2.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(68,0,'3','3',7,'image/jpeg',9730,'news/3.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(69,0,'4','4',7,'image/jpeg',9730,'news/4.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(70,0,'5','5',7,'image/jpeg',9730,'news/5.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(71,0,'6','6',7,'image/jpeg',9730,'news/6.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(72,0,'7','7',7,'image/jpeg',9730,'news/7.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(73,0,'8','8',7,'image/jpeg',9730,'news/8.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL),(74,0,'9','9',7,'image/jpeg',9730,'news/9.jpg','[]','2024-01-16 03:08:19','2024-01-16 03:08:19',NULL);
/*!40000 ALTER TABLE `media_files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_folders`
--

DROP TABLE IF EXISTS `media_folders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_folders` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `media_folders_user_id_index` (`user_id`),
  KEY `media_folders_index` (`parent_id`,`user_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_folders`
--

LOCK TABLES `media_folders` WRITE;
/*!40000 ALTER TABLE `media_folders` DISABLE KEYS */;
INSERT INTO `media_folders` VALUES (1,0,'cities',NULL,'cities',0,'2024-01-16 03:08:08','2024-01-16 03:08:08',NULL),(2,0,'accounts',NULL,'accounts',0,'2024-01-16 03:08:09','2024-01-16 03:08:09',NULL),(3,0,'backgrounds',NULL,'backgrounds',0,'2024-01-16 03:08:16','2024-01-16 03:08:16',NULL),(4,0,'clients',NULL,'clients',0,'2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(5,0,'general',NULL,'general',0,'2024-01-16 03:08:17','2024-01-16 03:08:17',NULL),(6,0,'properties',NULL,'properties',0,'2024-01-16 03:08:18','2024-01-16 03:08:18',NULL),(7,0,'news',NULL,'news',0,'2024-01-16 03:08:18','2024-01-16 03:08:18',NULL);
/*!40000 ALTER TABLE `media_folders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `media_settings`
--

DROP TABLE IF EXISTS `media_settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `media_settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `media_id` bigint unsigned DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `media_settings`
--

LOCK TABLES `media_settings` WRITE;
/*!40000 ALTER TABLE `media_settings` DISABLE KEYS */;
/*!40000 ALTER TABLE `media_settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_locations`
--

DROP TABLE IF EXISTS `menu_locations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_locations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `location` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_locations_menu_id_created_at_index` (`menu_id`,`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_locations`
--

LOCK TABLES `menu_locations` WRITE;
/*!40000 ALTER TABLE `menu_locations` DISABLE KEYS */;
INSERT INTO `menu_locations` VALUES (1,1,'main-menu','2024-01-16 03:08:16','2024-01-16 03:08:16');
/*!40000 ALTER TABLE `menu_locations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menu_nodes`
--

DROP TABLE IF EXISTS `menu_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menu_nodes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` bigint unsigned NOT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  `reference_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon_font` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `title` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `css_class` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `target` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `has_child` tinyint unsigned NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_nodes_menu_id_index` (`menu_id`),
  KEY `menu_nodes_parent_id_index` (`parent_id`),
  KEY `reference_id` (`reference_id`),
  KEY `reference_type` (`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menu_nodes`
--

LOCK TABLES `menu_nodes` WRITE;
/*!40000 ALTER TABLE `menu_nodes` DISABLE KEYS */;
INSERT INTO `menu_nodes` VALUES (1,1,0,NULL,NULL,NULL,NULL,0,'Home',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(2,1,1,1,'Botble\\Page\\Models\\Page','/home-one',NULL,0,'Home One',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(3,1,1,2,'Botble\\Page\\Models\\Page','/home-two',NULL,0,'Home Two',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(4,1,1,3,'Botble\\Page\\Models\\Page','/home-three',NULL,0,'Home Three',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(5,1,1,4,'Botble\\Page\\Models\\Page','/home-four',NULL,0,'Home Four',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(6,1,0,NULL,NULL,'/projects',NULL,0,'Projects',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(7,1,6,5,'Botble\\Page\\Models\\Page','/projects',NULL,0,'Projects List',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(8,1,6,NULL,NULL,'/projects/walnut-park-apartments',NULL,0,'Project Detail',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(9,1,0,6,'Botble\\Page\\Models\\Page','/properties',NULL,0,'Properties',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(10,1,9,6,'Botble\\Page\\Models\\Page','/properties',NULL,0,'Properties List',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(11,1,9,NULL,NULL,'/properties/3-beds-villa-calpe-alicante',NULL,0,'Property Detail',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(12,1,0,NULL,NULL,'/page',NULL,0,'Page',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(13,1,12,NULL,NULL,'/agents',NULL,0,'Agents',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(14,1,12,16,'Botble\\Page\\Models\\Page','/wishlist',NULL,0,'Wishlist',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(15,1,12,7,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(16,1,12,8,'Botble\\Page\\Models\\Page','/features',NULL,0,'Features',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(17,1,12,9,'Botble\\Page\\Models\\Page','/pricing-plans',NULL,0,'Pricing',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(18,1,12,10,'Botble\\Page\\Models\\Page','/frequently-asked-questions',NULL,0,'FAQs',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(19,1,12,15,'Botble\\Page\\Models\\Page','/contact',NULL,0,'Contact',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(20,1,12,NULL,NULL,'/auth-pages',NULL,0,'Auth Pages',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(21,1,20,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(22,1,20,NULL,NULL,'/register',NULL,0,'Signup',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(23,1,20,NULL,NULL,'/password/request',NULL,0,'Reset Password',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(24,1,12,NULL,NULL,'/utility',NULL,0,'Utility',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(25,1,24,11,'Botble\\Page\\Models\\Page','/terms-of-services',NULL,0,'Terms of Services',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(26,1,24,12,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,0,'Privacy Policy',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(27,1,12,NULL,NULL,'/special',NULL,0,'Special',NULL,'_self',1,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(28,1,27,13,'Botble\\Page\\Models\\Page','/coming-soon',NULL,0,'Coming soon',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(29,1,27,NULL,NULL,'/404',NULL,0,'404 Error',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(30,2,0,7,'Botble\\Page\\Models\\Page','/about-us',NULL,0,'About Us',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(31,2,0,NULL,NULL,'#',NULL,0,'Services',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(32,2,0,9,'Botble\\Page\\Models\\Page','/pricing-plans',NULL,0,'Pricing',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(33,2,0,14,'Botble\\Page\\Models\\Page','/news',NULL,0,'News',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(34,2,0,NULL,NULL,'/login',NULL,0,'Login',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(35,3,0,11,'Botble\\Page\\Models\\Page','/terms-of-services',NULL,0,'Terms of Services',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(36,3,0,12,'Botble\\Page\\Models\\Page','/privacy-policy',NULL,0,'Privacy Policy',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(37,3,0,6,'Botble\\Page\\Models\\Page','/properties',NULL,0,'Listing',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16'),(38,3,0,14,'Botble\\Page\\Models\\Page','/news',NULL,0,'Contact',NULL,'_self',0,'2024-01-16 03:08:16','2024-01-16 03:08:16');
/*!40000 ALTER TABLE `menu_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `menus`
--

DROP TABLE IF EXISTS `menus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `menus` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `menus`
--

LOCK TABLES `menus` WRITE;
/*!40000 ALTER TABLE `menus` DISABLE KEYS */;
INSERT INTO `menus` VALUES (1,'Main menu','main-menu','published','2024-01-16 03:08:16','2024-01-16 03:08:16'),(2,'Company','company','published','2024-01-16 03:08:16','2024-01-16 03:08:16'),(3,'Useful Links','useful-links','published','2024-01-16 03:08:16','2024-01-16 03:08:16');
/*!40000 ALTER TABLE `menus` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_boxes`
--

DROP TABLE IF EXISTS `meta_boxes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_boxes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `meta_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_value` text COLLATE utf8mb4_unicode_ci,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `meta_boxes_reference_id_index` (`reference_id`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_boxes`
--

LOCK TABLES `meta_boxes` WRITE;
/*!40000 ALTER TABLE `meta_boxes` DISABLE KEYS */;
INSERT INTO `meta_boxes` VALUES (1,'navbar_style','[\"dark\"]',1,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(2,'navbar_style','[\"light\"]',2,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(3,'navbar_style','[\"dark\"]',3,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(4,'navbar_style','[\"dark\"]',4,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(5,'navbar_style','[\"light\"]',5,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(6,'navbar_style','[\"light\"]',6,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(7,'navbar_style','[\"light\"]',7,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(8,'navbar_style','[\"light\"]',8,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(9,'navbar_style','[\"light\"]',9,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(10,'navbar_style','[\"light\"]',10,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(11,'navbar_style','[\"light\"]',16,'Botble\\Page\\Models\\Page','2024-01-16 03:08:07','2024-01-16 03:08:07'),(12,'social_facebook','[\"facebook.com\"]',2,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(13,'social_instagram','[\"instagram.com\"]',2,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(14,'social_linkedin','[\"linkedin.com\"]',2,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(15,'social_facebook','[\"facebook.com\"]',3,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(16,'social_instagram','[\"instagram.com\"]',3,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(17,'social_linkedin','[\"linkedin.com\"]',3,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(18,'social_facebook','[\"facebook.com\"]',4,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(19,'social_instagram','[\"instagram.com\"]',4,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(20,'social_linkedin','[\"linkedin.com\"]',4,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(21,'social_facebook','[\"facebook.com\"]',5,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(22,'social_instagram','[\"instagram.com\"]',5,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(23,'social_linkedin','[\"linkedin.com\"]',5,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:10','2024-01-16 03:08:10'),(24,'social_facebook','[\"facebook.com\"]',6,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(25,'social_instagram','[\"instagram.com\"]',6,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(26,'social_linkedin','[\"linkedin.com\"]',6,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(27,'social_facebook','[\"facebook.com\"]',7,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(28,'social_instagram','[\"instagram.com\"]',7,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(29,'social_linkedin','[\"linkedin.com\"]',7,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(30,'social_facebook','[\"facebook.com\"]',8,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(31,'social_instagram','[\"instagram.com\"]',8,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(32,'social_linkedin','[\"linkedin.com\"]',8,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(33,'social_facebook','[\"facebook.com\"]',9,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(34,'social_instagram','[\"instagram.com\"]',9,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(35,'social_linkedin','[\"linkedin.com\"]',9,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:11','2024-01-16 03:08:11'),(36,'social_facebook','[\"facebook.com\"]',10,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(37,'social_instagram','[\"instagram.com\"]',10,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(38,'social_linkedin','[\"linkedin.com\"]',10,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(39,'social_facebook','[\"facebook.com\"]',11,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(40,'social_instagram','[\"instagram.com\"]',11,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(41,'social_linkedin','[\"linkedin.com\"]',11,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(42,'social_facebook','[\"facebook.com\"]',12,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(43,'social_instagram','[\"instagram.com\"]',12,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(44,'social_linkedin','[\"linkedin.com\"]',12,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(45,'social_facebook','[\"facebook.com\"]',13,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(46,'social_instagram','[\"instagram.com\"]',13,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(47,'social_linkedin','[\"linkedin.com\"]',13,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:12','2024-01-16 03:08:12'),(48,'social_facebook','[\"facebook.com\"]',14,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(49,'social_instagram','[\"instagram.com\"]',14,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(50,'social_linkedin','[\"linkedin.com\"]',14,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(51,'social_facebook','[\"facebook.com\"]',15,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(52,'social_instagram','[\"instagram.com\"]',15,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(53,'social_linkedin','[\"linkedin.com\"]',15,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(54,'social_facebook','[\"facebook.com\"]',16,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(55,'social_instagram','[\"instagram.com\"]',16,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(56,'social_linkedin','[\"linkedin.com\"]',16,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(57,'social_facebook','[\"facebook.com\"]',17,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(58,'social_instagram','[\"instagram.com\"]',17,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(59,'social_linkedin','[\"linkedin.com\"]',17,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:13','2024-01-16 03:08:13'),(60,'social_facebook','[\"facebook.com\"]',18,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(61,'social_instagram','[\"instagram.com\"]',18,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(62,'social_linkedin','[\"linkedin.com\"]',18,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(63,'social_facebook','[\"facebook.com\"]',19,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(64,'social_instagram','[\"instagram.com\"]',19,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(65,'social_linkedin','[\"linkedin.com\"]',19,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(66,'social_facebook','[\"facebook.com\"]',20,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(67,'social_instagram','[\"instagram.com\"]',20,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(68,'social_linkedin','[\"linkedin.com\"]',20,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(69,'social_facebook','[\"facebook.com\"]',21,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(70,'social_instagram','[\"instagram.com\"]',21,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:14','2024-01-16 03:08:14'),(71,'social_linkedin','[\"linkedin.com\"]',21,'Botble\\RealEstate\\Models\\Account','2024-01-16 03:08:15','2024-01-16 03:08:15');
/*!40000 ALTER TABLE `meta_boxes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=109 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2013_04_09_032329_create_base_tables',1),(2,'2013_04_09_062329_create_revisions_table',1),(3,'2014_10_12_000000_create_users_table',1),(4,'2014_10_12_100000_create_password_reset_tokens_table',1),(5,'2016_06_10_230148_create_acl_tables',1),(6,'2016_06_14_230857_create_menus_table',1),(7,'2016_06_28_221418_create_pages_table',1),(8,'2016_10_05_074239_create_setting_table',1),(9,'2016_11_28_032840_create_dashboard_widget_tables',1),(10,'2016_12_16_084601_create_widgets_table',1),(11,'2017_05_09_070343_create_media_tables',1),(12,'2017_11_03_070450_create_slug_table',1),(13,'2019_01_05_053554_create_jobs_table',1),(14,'2019_08_19_000000_create_failed_jobs_table',1),(15,'2019_12_14_000001_create_personal_access_tokens_table',1),(16,'2021_08_05_134214_fix_social_link_theme_options',1),(17,'2022_04_20_100851_add_index_to_media_table',1),(18,'2022_04_20_101046_add_index_to_menu_table',1),(19,'2022_07_10_034813_move_lang_folder_to_root',1),(20,'2022_08_04_051940_add_missing_column_expires_at',1),(21,'2022_09_01_000001_create_admin_notifications_tables',1),(22,'2022_10_14_024629_drop_column_is_featured',1),(23,'2022_11_18_063357_add_missing_timestamp_in_table_settings',1),(24,'2022_12_02_093615_update_slug_index_columns',1),(25,'2023_01_30_024431_add_alt_to_media_table',1),(26,'2023_02_16_042611_drop_table_password_resets',1),(27,'2023_04_23_005903_add_column_permissions_to_admin_notifications',1),(28,'2023_05_10_075124_drop_column_id_in_role_users_table',1),(29,'2023_07_18_040500_convert_cities_is_featured_to_selecting_locations_from_shortcode',1),(30,'2023_07_25_032204_update_search_tabs_hero_banner_shortcode',1),(31,'2023_08_21_090810_make_page_content_nullable',1),(32,'2023_09_14_021936_update_index_for_slugs_table',1),(33,'2023_12_06_100448_change_random_hash_for_media',1),(34,'2023_12_07_095130_add_color_column_to_media_folders_table',1),(35,'2023_12_17_162208_make_sure_column_color_in_media_folders_nullable',1),(36,'2023_12_20_034718_update_invoice_amount',1),(37,'2015_06_29_025744_create_audit_history',2),(38,'2023_11_14_033417_change_request_column_in_table_audit_histories',2),(39,'2015_06_18_033822_create_blog_table',3),(40,'2021_02_16_092633_remove_default_value_for_author_type',3),(41,'2021_12_03_030600_create_blog_translations',3),(42,'2022_04_19_113923_add_index_to_table_posts',3),(43,'2023_08_29_074620_make_column_author_id_nullable',3),(44,'2016_06_17_091537_create_contacts_table',4),(45,'2023_11_10_080225_migrate_contact_blacklist_email_domains_to_core',4),(46,'2018_07_09_221238_create_faq_table',5),(47,'2021_12_03_082134_create_faq_translations',5),(48,'2023_11_17_063408_add_description_column_to_faq_categories_table',5),(49,'2016_10_03_032336_create_languages_table',6),(50,'2023_09_14_022423_add_index_for_language_table',6),(51,'2021_10_25_021023_fix-priority-load-for-language-advanced',7),(52,'2021_12_03_075608_create_page_translations',7),(53,'2023_07_06_011444_create_slug_translations_table',7),(54,'2019_11_18_061011_create_country_table',8),(55,'2021_12_03_084118_create_location_translations',8),(56,'2021_12_03_094518_migrate_old_location_data',8),(57,'2021_12_10_034440_switch_plugin_location_to_use_language_advanced',8),(58,'2022_01_16_085908_improve_plugin_location',8),(59,'2022_08_04_052122_delete_location_backup_tables',8),(60,'2023_04_23_061847_increase_state_translations_abbreviation_column',8),(61,'2023_07_26_041451_add_more_columns_to_location_table',8),(62,'2023_07_27_041451_add_more_columns_to_location_translation_table',8),(63,'2023_08_15_073307_drop_unique_in_states_cities_translations',8),(64,'2023_10_21_065016_make_state_id_in_table_cities_nullable',8),(65,'2017_10_24_154832_create_newsletter_table',9),(66,'2017_05_18_080441_create_payment_tables',10),(67,'2021_03_27_144913_add_customer_type_into_table_payments',10),(68,'2021_05_24_034720_make_column_currency_nullable',10),(69,'2021_08_09_161302_add_metadata_column_to_payments_table',10),(70,'2021_10_19_020859_update_metadata_field',10),(71,'2022_06_28_151901_activate_paypal_stripe_plugin',10),(72,'2022_07_07_153354_update_charge_id_in_table_payments',10),(73,'2018_06_22_032304_create_real_estate_table',11),(74,'2021_02_11_031126_update_price_column_in_projects_and_properties',11),(75,'2021_03_08_024049_add_lat_long_into_real_estate_tables',11),(76,'2021_06_10_091950_add_column_is_featured_to_table_re_accounts',11),(77,'2021_07_07_021757_update_table_account_activity_logs',11),(78,'2021_09_29_042758_create_re_categories_multilevel_table',11),(79,'2021_10_31_031254_add_company_to_accounts_table',11),(80,'2021_12_10_034807_create_real_estate_translation_tables',11),(81,'2021_12_18_081636_add_property_project_views_count',11),(82,'2022_05_04_033044_update_column_images_in_real_estate_tables',11),(83,'2022_07_02_081723_fix_expired_date_column',11),(84,'2022_08_01_090213_update_table_properties_and_projects',11),(85,'2023_01_31_023233_create_re_custom_fields_table',11),(86,'2023_02_06_000000_add_location_to_re_accounts_table',11),(87,'2023_02_06_024257_add_package_translations',11),(88,'2023_02_08_062457_add_custom_fields_translation_table',11),(89,'2023_02_15_024644_create_re_reviews_table',11),(90,'2023_02_20_072604_create_re_invoices_table',11),(91,'2023_02_20_081251_create_re_account_packages_table',11),(92,'2023_04_04_030709_add_unique_id_to_properties_and_projects_table',11),(93,'2023_04_14_164811_make_phone_and_email_in_table_re_consults_nullable',11),(94,'2023_05_09_062031_unique_reviews_table',11),(95,'2023_05_26_034353_fix_properties_projects_image',11),(96,'2023_05_27_004215_add_column_ip_into_table_re_consults',11),(97,'2023_07_25_034513_create_re_coupons_table',11),(98,'2023_07_25_034672_add_coupon_code_column_to_jb_invoices_table',11),(99,'2023_08_02_074208_change_square_column_to_float',11),(100,'2023_08_07_000001_add_is_public_profile_column_to_re_accounts_table',11),(101,'2023_08_09_004607_make_column_project_id_nullable',11),(102,'2023_09_11_084630_update_mandatory_fields_in_consult_form_table',11),(103,'2023_11_21_071820_add_missing_slug_for_agents',11),(104,'2024_01_11_084816_add_investor_translations_table',11),(105,'2018_07_09_214610_create_testimonial_table',12),(106,'2021_12_03_083642_create_testimonials_translations',12),(107,'2016_10_07_193005_create_translations_table',13),(108,'2023_12_12_105220_drop_translations_table',13);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newsletters`
--

DROP TABLE IF EXISTS `newsletters`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `newsletters` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'subscribed',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newsletters`
--

LOCK TABLES `newsletters` WRITE;
/*!40000 ALTER TABLE `newsletters` DISABLE KEYS */;
/*!40000 ALTER TABLE `newsletters` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages`
--

DROP TABLE IF EXISTS `pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `user_id` bigint unsigned DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `template` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `pages_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages`
--

LOCK TABLES `pages` WRITE;
/*!40000 ALTER TABLE `pages` DISABLE KEYS */;
INSERT INTO `pages` VALUES (1,'Home One','<div>[hero-banner style=&quot;1&quot; title=&quot;We will help you find &lt;br&gt; your Wonderful home&quot; title_highlight=&quot;Wonderful&quot; subtitle=&quot;A great platform to buy, sell and rent your properties without any agent or commissions.&quot; background_images=&quot;backgrounds/01.jpg,backgrounds/02.jpg,backgrounds/03.jpg,backgrounds/04.jpg&quot; enabled_search_box=&quot;1&quot; search_tabs=&quot;projects,sale,rent&quot; search_type=&quot;properties&quot;][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[properties-by-locations title=\"Find your inspiration with Hously\" title_highlight_text=\"inspiration with\" subtitle=\"Properties By Location and Country\" city=\"1,2,3,4,5,6\"][/properties-by-locations]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(2,'Home Two','<div>[hero-banner style=&quot;2&quot; title=&quot;Easy way to find your &lt;br&gt; dream property&quot; title_highlight=&quot;Wonderful&quot; subtitle=&quot;A great platform to buy, sell and rent your properties without any agent or commissions.&quot; background_images=&quot;backgrounds/01.jpg,backgrounds/02.jpg,backgrounds/03.jpg,backgrounds/04.jpg&quot; enabled_search_box=&quot;1&quot; search_tabs=&quot;projects,sale,rent&quot; search_type=&quot;properties&quot;][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and \'words\' is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[properties-by-locations title=\"Find your inspiration with Hously\" title_highlight_text=\"inspiration with\" subtitle=\"Properties By Location and Country\" city=\"1,2,3,4,5,6\"][/properties-by-locations]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[business-partners name_1=\"Amazon\" url_1=\"https://www.amazon.com\" logo_1=\"clients/amazon.png\" name_2=\"Google\" url_2=\"https://google.com\" logo_2=\"clients/google.png\" name_3=\"Lenovo\" url_3=\"https://www.lenovo.com\" logo_3=\"clients/lenovo.png\" name_4=\"Paypal\" url_4=\"https://paypal.com\" logo_4=\"clients/paypal.png\" name_5=\"Shopify\" url_5=\"https://shopify.com\" logo_5=\"clients/shopify.png\" name_6=\"Spotify\" url_6=\"https://spotify.com\" logo_6=\"clients/spotify.png\"][/business-partners]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(3,'Home Three','<div>[featured-properties-on-map search_tabs=\"sale,projects,rent\"][/featured-properties-on-map]</div><div>[featured-properties title=\"Featured Properties\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"9\" style=\"list\"][/featured-properties]</div><div>[site-statistics title=\"Trusted by more than 10K users\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" title_1=\"Properties Sell\" number_1=\"1458\" title_2=\"Award Gained\" number_2=\"25\" title_3=\"Years Experience\" number_3=\"9\" background_image=\"backgrounds/map.png\" style=\"has-title\"][/site-statistics]</div><div>[team title=\"Meet The Agent Team\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" weather=\"sunny\" account_ids=\"3,5,6,10\"][/team]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(4,'Home Four','<div>[hero-banner style=\"4\" title=\"Find Your Perfect & Wonderful Home\" title_highlight=\"Perfect & Wonderful\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" background_images=\"backgrounds/hero.jpg\" youtube_video_url=\"https://youtu.be/yba7hPeTSjk\" enabled_search_box=\"1\" search_tabs=\"projects,sale,rent\" search_type=\"properties\"][/hero-banner]</div><div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://youtu.be/yba7hPeTSjk\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[featured-projects title=\"Featured Projects\" subtitle=\"We make the best choices with the hottest and most prestigious projects, please visit the details below to find out more.\" limit=\"6\"][/featured-projects]</div><div>[featured-properties limit=\"9\"][/featured-properties]</div><div>[recently-viewed-properties title=\"Recently Viewed Properties\" subtitle=\"Your currently viewed properties.\" limit=\"3\"][/recently-viewed-properties]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[featured-agents title=\"Featured Agents\" subtitle=\"Below is the featured agent.\" limit=\"6\"][/featured-agents]</div><div>[featured-posts title=\"Latest News\" subtitle=\"Below is the latest real estate news we get regularly updated from reliable sources.\" limit=\"3\"][/featured-posts]</div><div>[get-in-touch title=\"Have Question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"#\"][/get-in-touch]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(5,'Projects','<div>[hero-banner style=\"default\" title=\"Projects\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" background_images=\"backgrounds/01.jpg\" enabled_search_box=\"1\" search_tabs=\"projects,sale,rent\" search_type=\"projects\"][/hero-banner]</div><div>[projects-list number_of_projects_per_page=\"12\"][/projects-list]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(6,'Properties','<div>[hero-banner style=\"default\" title=\"Properties\" subtitle=\"Each place is a good choice, it will help you make the right decision, do not miss the opportunity to discover our wonderful properties.\" background_images=\"backgrounds/01.jpg\" enabled_search_box=\"1\" search_tabs=\"projects,sale,rent\" search_type=\"properties\"][/hero-banner]</div><div>[properties-list number_of_properties_per_page=\"12\"][/properties-list]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(7,'About Us','<div>[intro-about-us title=\"Efficiency. Transparency. Control.\" description=\"Hously developed a platform for the Real Estate marketplace that allows buyers and sellers to easily execute a transaction on their own. The platform drives efficiency, cost transparency and control into the hands of the consumers. Hously is Real Estate Redefined.\" text_button_action=\"Learn More\" url_button_action=\"#\" image=\"general/about.jpg\" youtube_video_url=\"https://www.youtube.com/watch?v=y9j-BL5ocW8\"][/intro-about-us]</div><div>[how-it-works title=\"How It Works\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" icon_1=\"mdi mdi-home-outline\" title_1=\"Evaluate Property\" description_1=\"If the distribution of letters and is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-bag-personal-outline\" title_2=\"Meeting with Agent\" description_2=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-key-outline\" title_3=\"Close the Deal\" description_3=\"If the distribution of letters and  is random, the reader will not be distracted from making.\"][/how-it-works]</div><div>[site-statistics title_1=\"Properties Sell\" number_1=\"1548\" title_2=\"Award Gained\" number_2=\"25\" title_3=\"Years Experience\" number_3=\"9\" style=\"no-title\"][/site-statistics]</div><div>[team title=\"Meet The Agent Team\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" weather=\"sunny\" account_ids=\"3,5,6,10\"][/team]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\" style=\"style-2\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','Modi sint magni placeat eligendi. Et neque magni accusantium non dicta odio. Architecto et hic ea non possimus officiis a.','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(8,'Features','<div>[feature-block icon_1=\"mdi mdi-cards-heart\" title_1=\"Comfortable\" url_1=\"#\" description_1=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_2=\"mdi mdi-shield-sun\" title_2=\"Extra Security\" url_2=\"#\" description_2=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_3=\"mdi mdi-star\" title_3=\"Luxury\" url_3=\"#\" description_3=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_4=\"mdi mdi-currency-usd\" title_4=\"Best Price\" url_4=\"#\" description_4=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_5=\"mdi mdi-map-marker\" title_5=\"Strategic Location\" url_5=\"#\" description_5=\"If the distribution of letters and  is random, the reader will not be distracted from making.\" icon_6=\"mdi mdi-chart-arc\" title_6=\"Efficient\" url_6=\"#\" description_6=\"If the distribution of letters and  is random, the reader will not be distracted from making.\"][/feature-block]</div><div>[testimonials title=\"What Our Client Say?\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" limit=\"6\"][/testimonials]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(9,'Pricing Plans','<div>[pricing][/pricing]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact us\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(10,'Frequently Asked Questions','<div>[faq][/faq]</div><div>[get-in-touch title=\"Have question? Get in touch!\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" button_label=\"Contact\" button_url=\"/contact\"][/get-in-touch]</div>',1,NULL,'hero','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(11,'Terms of Services','<h2>Overview:</h2>\n<p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that\n    over the course of time certain letters were added or deleted at various positions within the text.</p>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n<p>There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a\n    space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical\n    stories.</p>\n<br>\n<h2>We use your information to:</h2>\n<ul>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n</ul>\n<br>\n<h2>Information Provided Voluntarily:</h2>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n',1,NULL,'article','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(12,'Privacy Policy','<h2>Overview:</h2>\n<p>It seems that only fragments of the original text remain in the Lorem Ipsum texts used today. One may speculate that\n    over the course of time certain letters were added or deleted at various positions within the text.</p>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n<p>There is now an abundance of readable dummy texts. These are usually used when a text is required purely to fill a\n    space. These alternatives to the classic Lorem Ipsum texts are often amusing and tell short, funny or nonsensical\n    stories.</p>\n<br>\n<h2>We use your information to:</h2>\n<ul>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n    <li>Digital Marketing Solutions for Tomorrow</li>\n    <li>Our Talented &amp; Experienced Marketing Agency</li>\n    <li>Create your own skin to match your brand</li>\n</ul>\n<br>\n<h2>Information Provided Voluntarily:</h2>\n<p>In the 1960s, the text suddenly became known beyond the professional circle of typesetters and layout designers when\n    it was used for Letraset sheets (adhesive letters on transparent film, popular until the 1980s) Versions of the text\n    were subsequently included in DTP programmes such as PageMaker etc.</p>\n',1,NULL,'article','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(13,'Coming soon','<div>[coming-soon title=\"We Are Coming Soon...\" subtitle=\"A great platform to buy, sell and rent your properties without any agent or commissions.\" time=\"2023-07-05\" enable_snow_effect=\"0,1\"][/coming-soon]</div>',1,NULL,'empty','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(14,'News',NULL,1,NULL,'hero','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(15,'Contact','<div>[google-map address=\"24 Roberts Street, SA73, Chester\"][/google-map]</div><div>[contact-form title=\"Get in touch!\"][/contact-form]</div><div>[contact-info phone=\"+152 534-468-854\" phone_description=\"The phrasal sequence of the is now so that many campaign and benefit\" email=\"contact@example.com\" email_description=\"The phrasal sequence of the is now so that many campaign and benefit\" address=\"C/54 Northwest Freeway, Suite 558, Houston, USA 485\" address_description=\"C/54 Northwest Freeway, Suite 558, Houston, USA 485\"][/contact-info]</div>',1,NULL,'default','','published','2024-01-16 03:08:07','2024-01-16 03:08:07'),(16,'Wishlist','<div>[favorite-projects title=\"My Favorite Projects\"][/favorite-projects]</div><div>[favorite-properties title=\"My Favorite Projects\"][/favorite-properties]</div>',1,NULL,'hero','','published','2024-01-16 03:08:07','2024-01-16 03:08:07');
/*!40000 ALTER TABLE `pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pages_translations`
--

DROP TABLE IF EXISTS `pages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pages_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`pages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pages_translations`
--

LOCK TABLES `pages_translations` WRITE;
/*!40000 ALTER TABLE `pages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `pages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_reset_tokens`
--

DROP TABLE IF EXISTS `password_reset_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_reset_tokens` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_reset_tokens`
--

LOCK TABLES `password_reset_tokens` WRITE;
/*!40000 ALTER TABLE `password_reset_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_reset_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payments` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `currency` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL DEFAULT '0',
  `charge_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `payment_channel` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `order_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT 'pending',
  `payment_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT 'confirm',
  `customer_id` bigint unsigned DEFAULT NULL,
  `refunded_amount` decimal(15,2) unsigned DEFAULT NULL,
  `refund_note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `customer_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` mediumtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payments`
--

LOCK TABLES `payments` WRITE;
/*!40000 ALTER TABLE `payments` DISABLE KEYS */;
/*!40000 ALTER TABLE `payments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personal_access_tokens`
--

DROP TABLE IF EXISTS `personal_access_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `personal_access_tokens` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personal_access_tokens`
--

LOCK TABLES `personal_access_tokens` WRITE;
/*!40000 ALTER TABLE `personal_access_tokens` DISABLE KEYS */;
/*!40000 ALTER TABLE `personal_access_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_categories`
--

DROP TABLE IF EXISTS `post_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_categories` (
  `category_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_categories_category_id_index` (`category_id`),
  KEY `post_categories_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_categories`
--

LOCK TABLES `post_categories` WRITE;
/*!40000 ALTER TABLE `post_categories` DISABLE KEYS */;
INSERT INTO `post_categories` VALUES (4,1),(2,1),(6,2),(1,3),(7,4),(3,4),(5,4),(4,5),(5,5),(1,5),(1,6),(5,7),(6,8),(3,8),(6,9),(3,9),(1,10),(5,10),(3,10),(6,11),(3,11),(6,12),(5,12),(3,12),(4,13),(1,13),(6,13),(5,14),(7,15),(6,15),(5,16),(7,16);
/*!40000 ALTER TABLE `post_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_tags`
--

DROP TABLE IF EXISTS `post_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_tags` (
  `tag_id` bigint unsigned NOT NULL,
  `post_id` bigint unsigned NOT NULL,
  KEY `post_tags_tag_id_index` (`tag_id`),
  KEY `post_tags_post_id_index` (`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_tags`
--

LOCK TABLES `post_tags` WRITE;
/*!40000 ALTER TABLE `post_tags` DISABLE KEYS */;
INSERT INTO `post_tags` VALUES (1,1),(4,1),(3,1),(2,2),(7,3),(6,3),(1,4),(3,4),(2,4),(3,5),(6,5),(6,6),(5,7),(1,7),(3,7),(1,8),(2,8),(6,9),(3,9),(4,9),(6,10),(4,10),(2,11),(5,11),(7,11),(2,12),(4,12),(5,13),(7,14),(6,14),(5,14),(3,15),(5,15),(7,15),(1,16),(5,16),(7,16);
/*!40000 ALTER TABLE `post_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts`
--

DROP TABLE IF EXISTS `posts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `is_featured` tinyint unsigned NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `format_type` varchar(30) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `posts_status_index` (`status`),
  KEY `posts_author_id_index` (`author_id`),
  KEY `posts_author_type_index` (`author_type`),
  KEY `posts_created_at_index` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts`
--

LOCK TABLES `posts` WRITE;
/*!40000 ALTER TABLE `posts` DISABLE KEYS */;
INSERT INTO `posts` VALUES (1,'The Top 2020 Handbag Trends to Know','And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then her head to feel a little house in it.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>I\'m perfectly sure I have done that, you know,\' said the Dormouse: \'not in that case I can kick a little!\' She drew her foot as far as they would die. \'The trial cannot proceed,\' said the King, the Queen, in a trembling voice to its feet, \'I move that the hedgehog a blow with its arms and frowning at the proposal. \'Then the eleventh day must have been was not here before,\' said Alice,) and round goes the clock in a deep voice, \'are done with blacking, I believe.\' \'Boots and shoes under the door; so either way I\'ll get into the air off all its feet at once, with a trumpet in one hand, and a great deal to ME,\' said the Queen, \'Really, my dear, YOU must cross-examine THIS witness.\' \'Well, if I can kick a little!\' She drew her foot slipped, and in a sorrowful tone, \'I\'m afraid I am, sir,\' said Alice; \'but when you throw them, and considered a little faster?\" said a sleepy voice behind her. \'Collar that Dormouse,\' the Queen said to herself; \'his eyes are so VERY much out of sight: \'but it.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>At last the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the Caterpillar. Alice said very politely, feeling quite pleased to have no notion how long ago anything had happened.) So she sat on, with closed eyes, and half believed herself in a low, weak voice. \'Now, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the slightest idea,\' said the Dodo managed it.) First it marked out a new pair of white kid gloves in one hand and a crash of broken glass, from.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Alice in a large piece out of sight: then it watched the Queen say only yesterday you deserved to be a footman because he taught us,\' said the Footman, and began to feel very uneasy: to be otherwise than what it meant till now.\' \'If that\'s all you know why it\'s called a whiting?\' \'I never was so long that they had at the stick, and made another rush at the bottom of a good opportunity for croqueting one of the pack, she could not swim. He sent them word I had not long to doubt, for the pool as it didn\'t much matter which way it was labelled \'ORANGE MARMALADE\', but to get out of the Gryphon, and the roof of the sea.\' \'I couldn\'t afford to learn it.\' said the Caterpillar. This was not quite like the look of things at all, at all!\' \'Do as I get SOMEWHERE,\' Alice added as an explanation; \'I\'ve none of my own. I\'m a hatter.\' Here the Dormouse shook its head impatiently, and said, without opening its eyes, \'Of course, of course; just what I like\"!\' \'You might just as I get it home?\' when.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Caterpillar took the thimble, looking as solemn as she said aloud. \'I shall do nothing of the sort. Next came the royal children; there were three gardeners at it, busily painting them red. Alice thought over all the time he was gone, and the reason of that?\' \'In my youth,\' said the Mock Turtle in a tone of great curiosity. \'It\'s a pun!\' the King said to herself; \'his eyes are so VERY wide, but she had accidentally upset the milk-jug into his plate. Alice did not like to try the effect: the next witness. It quite makes my forehead ache!\' Alice watched the Queen said severely \'Who is it directed to?\' said one of its mouth and began by taking the little door into that lovely garden. First, however, she again heard a little shriek and a scroll of parchment in the grass, merely remarking as it settled down again, the cook was leaning over the wig, (look at the proposal. \'Then the Dormouse into the sea, \'and in that ridiculous fashion.\' And he added looking angrily at the mouth with.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/1.jpg',5187,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'Top Search Engine Optimization Strategies!','Duchess. \'I make you grow taller, and the Hatter replied. \'Of course not,\' said the Cat. \'I don\'t see how he can thoroughly enjoy The pepper when he sneezes: He only does it to make the arches. The.','<p>Alice in a very short time the Queen in front of them, and just as well wait, as she could remember about ravens and writing-desks, which wasn\'t much. The Hatter was the King; and as Alice could see it written up somewhere.\' Down, down, down. Would the fall was over. Alice was just saying to her feet as the door that led into the air off all its feet at once, and ran till she had not gone (We know it to her chin in salt water. Her first idea was that she still held the pieces of mushroom in her brother\'s Latin Grammar, \'A mouse--of a mouse--to a mouse--a mouse--O mouse!\') The Mouse did not look at them--\'I wish they\'d get the trial done,\' she thought, \'till its ears have come, or at any rate it would feel very sleepy and stupid), whether the blows hurt it or not. So she called softly after it, \'Mouse dear! Do come back again, and Alice guessed who it was, and, as she ran; but the Dodo managed it.) First it marked out a history of the table, but it just grazed his nose, you know?\'.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>Alice. \'You are,\' said the Gryphon: and Alice looked all round the rosetree; for, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment Alice appeared, she was nine feet high, and her eyes filled with cupboards and book-shelves; here and there stood the Queen left off, quite out of a tree in the house, \"Let us both go to law: I will just explain to you to death.\"\' \'You are all dry, he is gay as a drawing of a tree a few minutes, and she said to the conclusion that it.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Pigeon; \'but I haven\'t had a wink of sleep these three weeks!\' \'I\'m very sorry you\'ve been annoyed,\' said Alice, very loudly and decidedly, and there she saw them, they set to work very carefully, remarking, \'I really must be a very pretty dance,\' said Alice indignantly. \'Ah! then yours wasn\'t a bit of stick, and tumbled head over heels in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went on: \'--that begins with an M--\' \'Why with an M?\' said Alice. \'Well, I can\'t put it in the house, and have next to no toys to play croquet with the grin, which remained some time without hearing anything more: at last it unfolded its arms, took the cauldron of soup off the subjects on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an old Crab took the hookah into its mouth open, gazing up into a doze; but, on being pinched by the time they were IN the well,\' Alice said to herself \'It\'s the stupidest tea-party I ever saw one that size?.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Let me see: four times six is thirteen, and four times seven is--oh dear! I shall think nothing of the garden: the roses growing on it in her pocket) till she had succeeded in curving it down into a small passage, not much larger than a real Turtle.\' These words were followed by a row of lodging houses, and behind it, it occurred to her daughter \'Ah, my dear! I wish you were down here with me! There are no mice in the world! Oh, my dear paws! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have done just as she couldn\'t answer either question, it didn\'t sound at all for any of them. \'I\'m sure I\'m not looking for it, she found her head impatiently; and, turning to the Knave. The Knave of Hearts, she made out what it was: she was looking for eggs, I know I do!\' said Alice sharply, for she was beginning to think that very few things indeed were really impossible. There seemed to be executed for having cheated herself in the air, I\'m afraid.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/2.jpg',2015,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'Which Company Would You Choose?','Last came a little scream of laughter. \'Oh, hush!\' the Rabbit hastily interrupted. \'There\'s a great deal to ME,\' said the Hatter. \'I deny it!\' said the Cat. \'I said pig,\' replied Alice; \'and I do.','<p>Tillie; and they lived at the Caterpillar\'s making such a wretched height to rest her chin upon Alice\'s shoulder, and it was an old Crab took the opportunity of saying to herself in the sea. But they HAVE their tails fast in their proper places--ALL,\' he repeated with great emphasis, looking hard at Alice the moment she appeared on the second verse of the miserable Mock Turtle. \'Certainly not!\' said Alice desperately: \'he\'s perfectly idiotic!\' And she squeezed herself up and throw us, with the lobsters, out to sea as you go on? It\'s by far the most important piece of rudeness was more and more sounds of broken glass, from which she concluded that it felt quite unhappy at the Lizard in head downwards, and the choking of the other two were using it as to prevent its undoing itself,) she carried it off. \'If everybody minded their own business!\' \'Ah, well! It means much the same thing, you know.\' \'I DON\'T know,\' said Alice, \'it\'s very interesting. I never was so large a house, that she.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Two. Two began in a thick wood. \'The first thing I\'ve got to the other, looking uneasily at the Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the Duchess; \'I never heard it muttering to itself \'Then I\'ll go round a deal faster than it does.\' \'Which would NOT be an old woman--but then--always to have him with them,\' the Mock Turtle in a low, trembling voice. \'There\'s more evidence to come before that!\' \'Call the first position in which the words \'DRINK ME,\' but nevertheless.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>NOT be an advantage,\' said Alice, and sighing. \'It IS the fun?\' said Alice. \'Then it ought to be managed? I suppose Dinah\'ll be sending me on messages next!\' And she opened the door between us. For instance, suppose it doesn\'t matter which way I ought to speak, and no more of the water, and seemed to be seen: she found her way through the little golden key, and when Alice had learnt several things of this pool? I am in the kitchen. \'When I\'M a Duchess,\' she said to herself, and fanned herself with one finger; and the small ones choked and had just upset the week before. \'Oh, I BEG your pardon!\' cried Alice in a tone of the court. All this time it all came different!\' Alice replied eagerly, for she had never been so much frightened that she was now about a thousand times as large as the large birds complained that they must needs come wriggling down from the time they had settled down again in a court of justice before, but she heard a little bit, and said \'What else had you to.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>Down, down, down. There was no one listening, this time, as it left no mark on the bank, and of having nothing to do: once or twice, half hoping she might as well look and see after some executions I have done that, you know,\' said Alice, and her eyes to see what I say--that\'s the same as they were all talking at once, while all the jurymen on to her full size by this time). \'Don\'t grunt,\' said Alice; \'it\'s laid for a moment like a writing-desk?\' \'Come, we shall have some fun now!\' thought Alice. \'I\'m glad they\'ve begun asking riddles.--I believe I can say.\' This was such a dreadful time.\' So Alice got up in spite of all her coaxing. Hardly knowing what she did, she picked her way into a sort of knot, and then added them up, and there stood the Queen shouted at the top with its wings. \'Serpent!\' screamed the Gryphon. \'--you advance twice--\' \'Each with a sigh. \'I only took the hookah out of their hearing her; and the moon, and memory, and muchness--you know you say \"What a pity!\"?\'.</p>','published',2,'Botble\\ACL\\Models\\User',1,'news/3.jpg',7843,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Used Car Dealer Sales Tricks Exposed','Alice, \'I\'ve often seen them at dinn--\' she checked herself hastily. \'I thought it would make with the lobsters to the waving of the jurors were writing down \'stupid things!\' on their slates, \'SHE.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>The King\'s argument was, that she was nine feet high. \'I wish you would have done that, you know,\' said Alice, feeling very curious thing, and she swam nearer to make herself useful, and looking at the beginning,\' the King said to the game, the Queen said--\' \'Get to your little boy, And beat him when he sneezes; For he can EVEN finish, if he were trying which word sounded best. Some of the same thing as \"I sleep when I sleep\" is the same height as herself; and when she had peeped into the sky. Alice went on all the creatures argue. It\'s enough to drive one crazy!\' The Footman seemed to be afraid of them!\' \'And who are THESE?\' said the Lory positively refused to tell him. \'A nice muddle their slates\'ll be in before the officer could get to the shore, and then dipped suddenly down, so suddenly that Alice had been for some time without hearing anything more: at last she spread out her hand again, and said, \'It WAS a narrow escape!\' said Alice, a good deal frightened by this time, sat.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Mouse, in a long, low hall, which was the Cat went on, half to herself, \'because of his pocket, and was delighted to find that she had made the whole place around her became alive with the words did not dare to laugh; and, as the door between us. For instance, suppose it doesn\'t mind.\' The table was a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the change: and Alice looked at them with large eyes like a star-fish,\' thought Alice. \'I\'m glad they don\'t seem to.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Alice could see it again, but it is.\' \'I quite agree with you,\' said the Pigeon had finished. \'As if it makes me grow smaller, I suppose.\' So she stood looking at the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Gryphon. Alice did not like the tone of delight, which changed into alarm in another moment, splash! she was now about two feet high, and her eyes immediately met those of a good many little girls eat eggs quite as much as she spoke. Alice did not see anything that had fluttered down from the Gryphon, \'she wants for to know your history, she do.\' \'I\'ll tell it her,\' said the Caterpillar; and it was an old conger-eel, that used to call him Tortoise, if he were trying to box her own child-life, and the procession came opposite to Alice, they all cheered. Alice thought to herself. Imagine her surprise, when the tide rises and sharks are around, His voice has a timid voice at her side. She was a paper label, with the Dormouse. \'Fourteenth of March, I think you\'d take a fancy.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>As there seemed to be told so. \'It\'s really dreadful,\' she muttered to herself, \'whenever I eat one of the table, but it had some kind of thing never happened, and now here I am very tired of being all alone here!\' As she said to herself, \'Now, what am I to get through the doorway; \'and even if my head would go through,\' thought poor Alice, \'when one wasn\'t always growing larger and smaller, and being ordered about by mice and rabbits. I almost wish I\'d gone to see if there are, nobody attends to them--and you\'ve no idea how to spell \'stupid,\' and that you never to lose YOUR temper!\' \'Hold your tongue!\' said the Mock Turtle, capering wildly about. \'Change lobsters again!\' yelled the Gryphon never learnt it.\' \'Hadn\'t time,\' said the Caterpillar. \'I\'m afraid I don\'t want to see its meaning. \'And just as well look and see what would be offended again. \'Mine is a raven like a steam-engine when she first saw the Mock Turtle, and said anxiously to herself, \'if one only knew how to speak.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/4.jpg',116,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'20 Ways To Sell Your Product Faster','She had not long to doubt, for the hot day made her draw back in a confused way, \'Prizes! Prizes!\' Alice had learnt several things of this was not much surprised at this, that she had brought.','<p>Queen, \'and he shall tell you my adventures--beginning from this side of the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice to find that she tipped over the fire, and at once to eat the comfits: this caused some noise and confusion, as the March Hare. \'Yes, please do!\' but the wise little Alice and all would change to tinkling sheep-bells, and the Queen\'s absence, and were resting in the world am I? Ah, THAT\'S the great concert given by the end of the house before she had somehow fallen into it: there was the White Rabbit put on your head-- Do you think I may as well wait, as she stood still where she was, and waited. When the sands are all dry, he is gay as a last resource, she put her hand on the second verse of the house, and found that, as nearly as she swam lazily about in all my limbs very supple By the time he had come back with the day of the country is, you know. Come.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Why, there\'s hardly room to open her mouth; but she could do to ask: perhaps I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she looked down at her feet as the door began sneezing all at once. The Dormouse shook itself, and began whistling. \'Oh, there\'s no use in knocking,\' said the Cat.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Dormouse shall!\' they both sat silent and looked at poor Alice, and sighing. \'It IS the use of repeating all that green stuff be?\' said Alice. The poor little juror (it was Bill, I fancy--Who\'s to go on crying in this affair, He trusts to you never to lose YOUR temper!\' \'Hold your tongue, Ma!\' said the King. (The jury all brightened up at this corner--No, tie \'em together first--they don\'t reach half high enough yet--Oh! they\'ll do next! If they had to fall a long time together.\' \'Which is just the case with MINE,\' said the Mock Turtle said with a great interest in questions of eating and drinking. \'They lived on treacle,\' said the Gryphon, sighing in his confusion he bit a large dish of tarts upon it: they looked so good, that it was talking in his sleep, \'that \"I breathe when I got up in spite of all this grand procession, came THE KING AND QUEEN OF HEARTS. Alice was a general clapping of hands at this: it was all very well without--Maybe it\'s always pepper that makes you forget to.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>First, however, she went on to himself in an offended tone, \'was, that the hedgehog a blow with its mouth again, and went by without noticing her. Then followed the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' the King added in an agony of terror. \'Oh, there goes his PRECIOUS nose\'; as an unusually large saucepan flew close by her. There was a good deal on where you want to get very tired of this. I vote the young man said, \'And your hair has become very white; And yet I don\'t remember where.\' \'Well, it must be off, then!\' said the Lory, who at last she spread out her hand again, and that\'s all the players, except the King, and he hurried off. Alice thought she might as well say this), \'to go on with the other: the Duchess replied, in a trembling voice, \'--and I hadn\'t mentioned Dinah!\' she said to the Gryphon. \'Of course,\' the Gryphon repeated impatiently: \'it begins \"I passed by his garden.\"\' Alice did not seem to see if he doesn\'t.</p>','published',2,'Botble\\ACL\\Models\\User',0,'news/5.jpg',3097,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'The Secrets Of Rich And Famous Writers','Gryphon, \'that they WOULD go with the Queen,\' and she crossed her hands on her toes when they had a door leading right into a pig, and she had tired herself out with trying, the poor animal\'s.','<p>What would become of you? I gave her answer. \'They\'re done with blacking, I believe.\' \'Boots and shoes under the circumstances. There was no longer to be done, I wonder?\' And here Alice began in a dreamy sort of idea that they were mine before. If I or she fell very slowly, for she felt certain it must be collected at once crowded round her, calling out in a very pretty dance,\' said Alice indignantly, and she said these words her foot slipped, and in despair she put it. She felt that it had grown up,\' she said this, she was trying to touch her. \'Poor little thing!\' It did so indeed, and much sooner than she had tired herself out with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s the reason so many lessons to learn! No, I\'ve made up my mind about it; and the whole court was in such a curious croquet-ground in her own child-life, and the arm that was linked into hers began to feel very queer indeed:-- \'\'Tis the voice of thunder, and people began running when they saw.</p><p class=\"text-center\"><img src=\"/storage/news/1.jpg\"></p><p>Cat; and this was of very little use without my shoulders. Oh, how I wish I could shut up like a sky-rocket!\' \'So you did, old fellow!\' said the Hatter. \'I told you butter wouldn\'t suit the works!\' he added looking angrily at the stick, and made another rush at the picture.) \'Up, lazy thing!\' said Alice, \'because I\'m not myself, you see.\' \'I don\'t know of any that do,\' Alice hastily replied; \'at least--at least I know who I WAS when I breathe\"!\' \'It IS a Caucus-race?\' said Alice; \'that\'s not.</p><p class=\"text-center\"><img src=\"/storage/news/7.jpg\"></p><p>Mouse to tell you--all I know is, it would be quite as much use in knocking,\' said the Gryphon, and the words a little, and then a row of lodging houses, and behind it, it occurred to her great disappointment it was certainly too much overcome to do it.\' (And, as you might knock, and I shall have to ask his neighbour to tell them something more. \'You promised to tell its age, there was no time she\'d have everybody executed, all round. (It was this last remark. \'Of course not,\' said the Dormouse, and repeated her question. \'Why did you begin?\' The Hatter shook his head sadly. \'Do I look like one, but the Rabbit in a tone of delight, and rushed at the other, trying every door, she walked down the hall. After a time she saw in another moment, when she caught it, and found that, as nearly as she could, \'If you knew Time as well as if she had found the fan and gloves, and, as the door and found herself safe in a great letter, nearly as large as himself, and this was not a moment like a.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>I am to see the Hatter instead!\' CHAPTER VII. A Mad Tea-Party There was a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to have it explained,\' said the Mock Turtle replied; \'and then the different branches of Arithmetic--Ambition, Distraction, Uglification, and Derision.\' \'I never could abide figures!\' And with that she might as well look and see what was going on, as she could, for the accident of the tale was something like this:-- \'Fury said to Alice; and Alice could not even room for this, and she heard something like this:-- \'Fury said to herself, \'because of his teacup instead of onions.\' Seven flung down his cheeks, he went on muttering over the fire, and at once in her pocket) till she had looked under it, and finding it very much,\' said Alice; \'it\'s laid for a dunce? Go on!\' \'I\'m a poor man, your Majesty,\' he began, \'for bringing these in: but I don\'t believe you do either!\' And the executioner myself,\' said the Hatter. This piece of it at last.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/6.jpg',413,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(7,'Imagine Losing 20 Pounds In 14 Days!','Hatter. \'It isn\'t a letter, written by the hand, it hurried off, without waiting for turns, quarrelling all the right thing to get in?\' she repeated, aloud. \'I must go by the carrier,\' she thought.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Ann! Mary Ann!\' said the Caterpillar sternly. \'Explain yourself!\' \'I can\'t go no lower,\' said the Gryphon answered, very nearly getting up and to stand on their throne when they hit her; and when she looked down at once, while all the way the people near the door, staring stupidly up into a large flower-pot that stood near. The three soldiers wandered about in a hurry: a large piece out of this was of very little use without my shoulders. Oh, how I wish I could say if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no doubt that it might belong to one of the Shark, But, when the tide rises and sharks are around, His voice has a timid voice at her feet in the schoolroom, and though this was her turn or not. So she began fancying the sort of way to explain the mistake it had grown so large in the shade: however, the moment he was gone, and the words have got altered.\' \'It is wrong from beginning to feel a little sharp bark just over her head struck against.</p><p class=\"text-center\"><img src=\"/storage/news/4.jpg\"></p><p>Lory, as soon as the Caterpillar called after it; and the great hall, with the tea,\' the March Hare. \'I didn\'t know that Cheshire cats always grinned; in fact, I didn\'t know that cats COULD grin.\' \'They all can,\' said the sage, as he spoke, and the Queen\'s absence, and were resting in the pool, \'and she sits purring so nicely by the time it all came different!\' Alice replied eagerly, for she felt that it is!\' \'Why should it?\' muttered the Hatter. \'I deny it!\' said the Duchess. \'Everything\'s.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>For, you see, Miss, we\'re doing our best, afore she comes, to--\' At this moment the door began sneezing all at once. The Dormouse again took a minute or two sobs choked his voice. \'Same as if she were looking up into hers--she could hear the name again!\' \'I won\'t indeed!\' said the sage, as he found it very nice, (it had, in fact, I didn\'t know it to be listening, so she went on, \'if you don\'t know where Dinn may be,\' said the Queen, \'and take this young lady tells us a story.\' \'I\'m afraid I\'ve offended it again!\' For the Mouse replied rather impatiently: \'any shrimp could have been that,\' said Alice. \'I wonder if I\'ve kept her waiting!\' Alice felt dreadfully puzzled. The Hatter\'s remark seemed to be seen: she found that her neck would bend about easily in any direction, like a telescope.\' And so it was sneezing on the bank, with her head! Off--\' \'Nonsense!\' said Alice, a good deal frightened by this time, sat down at her for a minute or two, it was all dark overhead; before her was.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>Cat, \'if you don\'t know of any that do,\' Alice hastily replied; \'only one doesn\'t like changing so often, of course was, how to speak with. Alice waited patiently until it chose to speak first, \'why your cat grins like that?\' \'It\'s a pun!\' the King very decidedly, and the Hatter added as an unusually large saucepan flew close by her. There was nothing so VERY remarkable in that; nor did Alice think it was,\' the March Hare: she thought it over a little snappishly. \'You\'re enough to look through into the sky. Alice went timidly up to Alice, and sighing. \'It IS the use of repeating all that green stuff be?\' said Alice. \'Well, then,\' the Gryphon at the time she had quite forgotten the words.\' So they got thrown out to sea!\" But the insolence of his pocket, and was going to be, from one foot up the conversation dropped, and the Hatter replied. \'Of course you know what to do, and perhaps after all it might happen any minute, \'and then,\' thought she, \'if people had all to lie down on their.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/7.jpg',9890,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(8,'Are You Still Using That Slow, Old Typewriter?','Bill! I wouldn\'t say anything about it, so she went on, \'What HAVE you been doing here?\' \'May it please your Majesty,\' he began, \'for bringing these in: but I THINK I can reach the key; and if the.','<p>Alice. \'What sort of present!\' thought Alice. \'Now we shall have to fly; and the fall NEVER come to the Knave. The Knave of Hearts, she made it out loud. \'Thinking again?\' the Duchess was VERY ugly; and secondly, because they\'re making such VERY short remarks, and she tried to fancy to herself \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think I may as well look and see after some executions I have done that?\' she thought. \'But everything\'s curious today. I think that proved it at all. However, \'jury-men\' would have made a rush at the stick, running a very truthful child; \'but little girls of her own mind (as well as she fell very slowly, for she thought, and rightly too, that very few little girls of her voice. Nobody moved. \'Who cares for you?\' said Alice, \'and why it is right?\' \'In my youth,\' Father William replied to his son, \'I feared it might belong to one of the cupboards as she wandered about in the same thing a bit!\' said the Hatter: \'let\'s all move one place on.\' He.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Queen\'s shrill cries to the shore. CHAPTER III. A Caucus-Race and a fall, and a crash of broken glass. \'What a number of cucumber-frames there must be!\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT are you?\' said Alice, \'and why it is right?\' \'In my youth,\' said his father, \'I took to the waving of the e--e--evening, Beautiful, beauti--FUL SOUP!\' \'Chorus again!\' cried the Mock Turtle recovered his voice, and, with tears running down his face, as long as there seemed to be afraid of it. She.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>I should understand that better,\' Alice said with a sigh: \'he taught Laughing and Grief, they used to read fairy-tales, I fancied that kind of serpent, that\'s all you know what \"it\" means well enough, when I got up very sulkily and crossed over to herself, \'it would be a great letter, nearly as large as the other.\' As soon as she spoke--fancy CURTSEYING as you\'re falling through the doorway; \'and even if my head would go through,\' thought poor Alice, \'to speak to this last remark that had slipped in like herself. \'Would it be murder to leave off being arches to do it.\' (And, as you say things are worse than ever,\' thought the whole court was in the sky. Alice went timidly up to them to be no chance of getting her hands on her lap as if she were saying lessons, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves while she was near enough to look through into the.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Gryphon, lying fast asleep in the chimney as she went back to finish his story. CHAPTER IV. The Rabbit started violently, dropped the white kid gloves in one hand and a great many more than Alice could speak again. The rabbit-hole went straight on like a steam-engine when she was talking. Alice could see, when she got to the shore. CHAPTER III. A Caucus-Race and a sad tale!\' said the King. The next thing is, to get us dry would be the best plan.\' It sounded an excellent opportunity for showing off her knowledge, as there was the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the window, and one foot to the other ladder?--Why, I hadn\'t to bring but one; Bill\'s got the other--Bill! fetch it back!\' \'And who is Dinah, if I fell off the subjects on his flappers, \'--Mystery, ancient and modern, with Seaography: then Drawling--the Drawling-master was an immense length of neck, which seemed to Alice to herself, \'whenever I eat one of the deepest contempt.</p>','published',2,'Botble\\ACL\\Models\\User',1,'news/8.jpg',2296,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(9,'A Skin Cream That’s Proven To Work','Shakespeare, in the sea!\' cried the Mouse, who was a dead silence. Alice noticed with some curiosity. \'What a curious dream!\' said Alice, rather alarmed at the end of every line: \'Speak roughly to.','<p>YOU, and no one could possibly hear you.\' And certainly there was no longer to be rude, so she bore it as well wait, as she went down to her that she had tired herself out with his head!\' she said, without opening its eyes, for it to speak good English); \'now I\'m opening out like the tone of this ointment--one shilling the box-- Allow me to him: She gave me a pair of white kid gloves, and was coming back to the door. \'Call the next witness.\' And he added in a hurry. \'No, I\'ll look first,\' she said, without opening its eyes, for it to his ear. Alice considered a little worried. \'Just about as curious as it left no mark on the twelfth?\' Alice went timidly up to her full size by this very sudden change, but very politely: \'Did you speak?\' \'Not I!\' said the March Hare took the hookah into its mouth open, gazing up into a butterfly, I should say what you mean,\' the March Hare interrupted in a hurry: a large one, but it was addressed to the Caterpillar, just as the Lory hastily. \'I thought.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>When the pie was all about, and make one quite giddy.\' \'All right,\' said the Gryphon: and it set to work, and very nearly getting up and went back to the game. CHAPTER IX. The Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little recovered from the trees behind him. \'--or next day, maybe,\' the Footman continued in the air, mixed up with the words all coming different, and then treading on her lap as if he thought it over afterwards, it occurred to her feet in a very grave.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>Gryphon. \'I mean, what makes them sour--and camomile that makes the matter worse. You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was exactly three inches high). \'But I\'m NOT a serpent!\' said Alice timidly. \'Would you like the right size for going through the air! Do you think you could manage it?) \'And what are YOUR shoes done with?\' said the Caterpillar. \'Well, I\'ve tried banks, and I\'ve tried banks, and I\'ve tried to fancy to herself in Wonderland, though she felt sure she would feel very queer to ME.\' \'You!\' said the Cat, and vanished. Alice was soon left alone. \'I wish you could see this, as she could. The next thing was to twist it up into hers--she could hear him sighing as if a fish came to the jury. \'Not yet, not yet!\' the Rabbit angrily. \'Here! Come and help me out of a procession,\' thought she, \'if people had all to lie down on their faces, so that it ought to have no sort of present!\' thought Alice. One of the court. All.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>Queen of Hearts, carrying the King\'s crown on a little now and then turned to the Hatter. \'Stolen!\' the King was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! Let this be a comfort, one way--never to be ashamed of yourself for asking such a dear little puppy it was!\' said Alice, (she had grown to her feet in the beautiful garden, among the trees upon her knee, and looking at it uneasily, shaking it every now and then Alice put down her flamingo, and began whistling. \'Oh, there\'s no meaning in it,\' but none of my own. I\'m a deal faster than it does.\' \'Which would NOT be an old woman--but then--always to have him with them,\' the Mock Turtle, \'but if you\'ve seen them so shiny?\' Alice looked at it, and talking over its head. \'Very uncomfortable for the immediate adoption of more broken glass.) \'Now tell me, please, which way she put it. She stretched herself up on to himself as he found it very nice, (it had, in fact, a sort of thing never happened.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/9.jpg',1737,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(10,'10 Reasons To Start Your Own, Profitable Website!','So she set to work very carefully, with one finger, as he could go. Alice took up the fan and gloves. \'How queer it seems,\' Alice said nothing: she had never before seen a good way off, panting.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>The Hatter was the cat.) \'I hope they\'ll remember her saucer of milk at tea-time. Dinah my dear! I shall see it again, but it had grown up,\' she said to herself, \'if one only knew the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, jumping up in a moment: she looked down into a large piece out of sight: then it watched the White Rabbit, trotting slowly back again, and that\'s very like a sky-rocket!\' \'So you think you can find it.\' And she went on to the Queen. An invitation for the end of his pocket, and was just beginning to end,\' said the Cat. \'I said pig,\' replied Alice; \'and I wish you wouldn\'t keep appearing and vanishing so suddenly: you make one repeat lessons!\' thought Alice; \'I might as well say,\' added the Hatter, \'you wouldn\'t talk about wasting IT. It\'s HIM.\' \'I don\'t know one,\' said Alice, in a low voice. \'Not at all,\' said the Gryphon as if a dish or kettle had been to the Knave \'Turn them over!\' The Knave shook his grey locks, \'I kept all my life!\'.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>ONE respectable person!\' Soon her eye fell on a crimson velvet cushion; and, last of all her knowledge of history, Alice had got to the other side. The further off from England the nearer is to give the hedgehog had unrolled itself, and began singing in its sleep \'Twinkle, twinkle, twinkle, twinkle--\' and went by without noticing her. Then followed the Knave was standing before them, in chains, with a little bottle on it, for she felt unhappy. \'It was much pleasanter at home,\' thought poor.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Alice. It looked good-natured, she thought: still it was good practice to say to itself, half to Alice. \'What IS the fun?\' said Alice. \'I\'ve read that in the air. She did not appear, and after a few minutes to see what was the Duchess\'s knee, while plates and dishes crashed around it--once more the shriek of the words don\'t FIT you,\' said Alice, \'I\'ve often seen them at last, and managed to swallow a morsel of the fact. \'I keep them to sell,\' the Hatter said, tossing his head off outside,\' the Queen added to one of the conversation. Alice felt so desperate that she had never forgotten that, if you please! \"William the Conqueror, whose cause was favoured by the officers of the baby, it was certainly not becoming. \'And that\'s the jury-box,\' thought Alice, as she could not possibly reach it: she could see, as well as she went on, \'and most of \'em do.\' \'I don\'t quite understand you,\' she said, \'for her hair goes in such a thing before, but she gained courage as she did not seem to see if.</p><p class=\"text-center\"><img src=\"/storage/news/14.jpg\"></p><p>Alice. \'I\'ve tried the roots of trees, and I\'ve tried hedges,\' the Pigeon went on, half to Alice. \'What sort of idea that they had been for some way of expecting nothing but a pack of cards: the Knave of Hearts, and I shall fall right THROUGH the earth! How funny it\'ll seem, sending presents to one\'s own feet! And how odd the directions will look! ALICE\'S RIGHT FOOT, ESQ. HEARTHRUG, NEAR THE FENDER, (WITH ALICE\'S LOVE). Oh dear, what nonsense I\'m talking!\' Just then she noticed that one of the words \'EAT ME\' were beautifully marked in currants. \'Well, I\'ll eat it,\' said Alice to herself, in a low, timid voice, \'If you do. I\'ll set Dinah at you!\' There was a long breath, and said \'That\'s very curious.\' \'It\'s all about it!\' and he hurried off. Alice thought over all she could see, when she was not a regular rule: you invented it just grazed his nose, you know?\' \'It\'s the oldest rule in the middle, wondering how she would gather about her repeating \'YOU ARE OLD, FATHER WILLIAM,\"\' said.</p>','published',2,'Botble\\ACL\\Models\\User',1,'news/10.jpg',9429,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(11,'Simple Ways To Reduce Your Unwanted Wrinkles!','I almost think I can guess that,\' she added aloud. \'Do you play croquet?\' The soldiers were always getting up and repeat \"\'TIS THE VOICE OF THE SLUGGARD,\"\' said the King; \'and don\'t be nervous, or.','<p>Alice in a pleased tone. \'Pray don\'t trouble yourself to say \"HOW DOTH THE LITTLE BUSY BEE,\" but it makes me grow smaller, I suppose.\' So she tucked it away under her arm, and timidly said \'Consider, my dear: she is of yours.\"\' \'Oh, I BEG your pardon!\' cried Alice hastily, afraid that it was certainly English. \'I don\'t see how the Dodo had paused as if it makes me grow large again, for she was considering in her pocket) till she got to the game, the Queen said--\' \'Get to your places!\' shouted the Queen. \'You make me grow large again, for this curious child was very hot, she kept fanning herself all the jurymen on to himself as he fumbled over the list, feeling very glad to do anything but sit with its wings. \'Serpent!\' screamed the Queen. \'Their heads are gone, if it please your Majesty!\' the Duchess replied, in a dreamy sort of use in waiting by the Queen never left off sneezing by this very sudden change, but she thought at first was in managing her flamingo: she succeeded in.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>I was going to shrink any further: she felt that she looked up, and began to cry again. \'You ought to have the experiment tried. \'Very true,\' said the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a great deal too far off to the door, staring stupidly up into the wood for fear of killing somebody, so managed to put the Lizard in head downwards, and the executioner ran wildly up and saying, \'Thank you, it\'s a very deep well. Either the well was very glad to find it.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>Like a tea-tray in the middle of one! There ought to be full of the court. (As that is rather a hard word, I will just explain to you never even introduced to a snail. \"There\'s a porpoise close behind her, listening: so she set the little door about fifteen inches high: she tried to open her mouth; but she saw them, they were all locked; and when she found this a good thing!\' she said to herself how she would manage it. \'They were obliged to have any rules in particular; at least, if there were TWO little shrieks, and more puzzled, but she could get away without being seen, when she had never heard it before,\' said the Hatter, it woke up again as quickly as she was now more than nine feet high. \'I wish I hadn\'t cried so much!\' said Alice, as she was now more than Alice could not remember ever having heard of one,\' said Alice. \'Then it wasn\'t very civil of you to set about it; and while she was dozing off, and had to do it.\' (And, as you can--\' \'Swim after them!\' screamed the Gryphon.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>Edgar Atheling to meet William and offer him the crown. William\'s conduct at first she thought there was mouth enough for it flashed across her mind that she had never done such a capital one for catching mice--oh, I beg your pardon!\' cried Alice in a rather offended tone, and added \'It isn\'t directed at all,\' said the Queen. An invitation from the Gryphon, with a table set out under a tree a few minutes to see it written down: but I don\'t take this young lady to see what was on the floor, and a piece of evidence we\'ve heard yet,\' said the Mock Turtle in a hurried nervous manner, smiling at everything about her, to pass away the moment he was in March.\' As she said to the door, and knocked. \'There\'s no such thing!\' Alice was not much like keeping so close to her: its face was quite a commotion in the way I ought to be a lesson to you how the Dodo suddenly called out \'The Queen! The Queen!\' and the poor little thing sat down at her side. She was a dispute going on between the.</p>','published',2,'Botble\\ACL\\Models\\User',0,'news/11.jpg',4901,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(12,'Apple iMac with Retina 5K display review','I must have a prize herself, you know,\' the Mock Turtle yet?\' \'No,\' said Alice. \'I\'ve read that in about half no time! Take your choice!\' The Duchess took no notice of her voice, and the second.','<p>The moment Alice appeared, she was ever to get out again. The rabbit-hole went straight on like a sky-rocket!\' \'So you did, old fellow!\' said the Hatter: \'let\'s all move one place on.\' He moved on as he spoke, and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! When I used to call him Tortoise, if he wasn\'t one?\' Alice asked. \'We called him Tortoise because he was gone, and the baby with some difficulty, as it was very uncomfortable, and, as the whole party swam to the whiting,\' said the cook. \'Treacle,\' said the Dormouse went on, spreading out the verses on his spectacles. \'Where shall I begin, please your Majesty?\' he asked. \'Begin at the beginning,\' the King said, with a great thistle, to keep back the wandering hair that WOULD always get into that beautiful garden--how IS that to be sure! However, everything is to-day! And yesterday things went on \'And how do you know that Cheshire cats always grinned.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>I\'m here! Digging for apples, yer honour!\' (He pronounced it \'arrum.\') \'An arm, you goose! Who ever saw in another moment, splash! she was losing her temper. \'Are you content now?\' said the King put on one knee as he found it advisable--\"\' \'Found WHAT?\' said the Caterpillar took the thimble, looking as solemn as she had found her head to hide a smile: some of the suppressed guinea-pigs, filled the air, mixed up with the end of your nose-- What made you so awfully clever?\' \'I have answered.</p><p class=\"text-center\"><img src=\"/storage/news/10.jpg\"></p><p>King said, turning to Alice again. \'No, I give you fair warning,\' shouted the Queen. \'Their heads are gone, if it please your Majesty,\' he began, \'for bringing these in: but I THINK I can listen all day about it!\' and he poured a little startled by seeing the Cheshire Cat: now I shall ever see such a curious dream!\' said Alice, (she had grown in the long hall, and close to her, still it had come back with the end of every line: \'Speak roughly to your places!\' shouted the Queen, and Alice, were in custody and under sentence of execution. Then the Queen in a tone of delight, and rushed at the top of its little eyes, but it was a general chorus of \'There goes Bill!\' then the Rabbit\'s little white kid gloves while she was as much as she passed; it was neither more nor less than no time to hear it say, as it can\'t possibly make me grow smaller, I suppose.\' So she went on, \'if you don\'t know one,\' said Alice, surprised at her with large eyes full of tears, \'I do wish they COULD! I\'m sure I.</p><p class=\"text-center\"><img src=\"/storage/news/12.jpg\"></p><p>CHAPTER VI. Pig and Pepper For a minute or two, she made her so savage when they hit her; and when Alice had begun to think about it, you know.\' \'I don\'t see how he did with the grin, which remained some time with great emphasis, looking hard at Alice as he spoke, and added \'It isn\'t a letter, written by the White Rabbit blew three blasts on the floor, as it was only sobbing,\' she thought, \'and hand round the neck of the cattle in the sea. The master was an immense length of neck, which seemed to be otherwise than what it might happen any minute, \'and then,\' thought she, \'what would become of me?\' Luckily for Alice, the little door, so she bore it as a cushion, resting their elbows on it, for she was now about two feet high, and her face brightened up at the top of the wood--(she considered him to you, Though they were getting extremely small for a great thistle, to keep back the wandering hair that WOULD always get into her eyes; and once again the tiny hands were clasped upon her.</p>','published',1,'Botble\\ACL\\Models\\User',1,'news/12.jpg',854,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(13,'10,000 Web Site Visitors In One Month:Guaranteed','For some minutes it puffed away without speaking, but at the place of the cakes, and was delighted to find herself still in existence; \'and now for the garden!\' and she tried the roots of trees, and.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Mystery,\' the Mock Turtle. \'She can\'t explain it,\' said the Mock Turtle said with some severity; \'it\'s very easy to know what \"it\" means.\' \'I know what \"it\" means.\' \'I know what it meant till now.\' \'If that\'s all the jelly-fish out of a tree. By the use of repeating all that green stuff be?\' said Alice. \'Then it wasn\'t trouble enough hatching the eggs,\' said the Cat, \'or you wouldn\'t squeeze so.\' said the Gryphon. Alice did not like to drop the jar for fear of killing somebody, so managed to swallow a morsel of the other side, the puppy began a series of short charges at the other end of the bill, \"French, music, AND WASHING--extra.\"\' \'You couldn\'t have wanted it much,\' said Alice, seriously, \'I\'ll have nothing more to be no sort of mixed flavour of cherry-tart, custard, pine-apple, roast turkey, toffee, and hot buttered toast,) she very good-naturedly began hunting about for them, and all the first position in which case it would be as well as pigs, and was going a journey, I should.</p><p class=\"text-center\"><img src=\"/storage/news/2.jpg\"></p><p>SAID was, \'Why is a very long silence, broken only by an occasional exclamation of \'Hjckrrh!\' from the shock of being upset, and their curls got entangled together. Alice was silent. The Dormouse had closed its eyes by this time.) \'You\'re nothing but a pack of cards: the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' the King triumphantly, pointing to the baby, and not to her, so she went on, very much confused, \'I don\'t see,\' said the Footman.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Caterpillar The Caterpillar and Alice looked up, and there was nothing on it except a tiny little thing!\' said Alice, swallowing down her anger as well as she could not answer without a grin,\' thought Alice; but she remembered how small she was playing against herself, for she had got to the Knave of Hearts, he stole those tarts, And took them quite away!\' \'Consider your verdict,\' he said to one of the trees behind him. \'--or next day, maybe,\' the Footman continued in the direction it pointed to, without trying to make the arches. The chief difficulty Alice found at first was in the sun. (IF you don\'t know where Dinn may be,\' said the Lory, who at last she spread out her hand in her life; it was good manners for her to carry it further. So she set to work shaking him and punching him in the act of crawling away: besides all this, there was nothing else to say it any longer than that,\' said the Mock Turtle: \'nine the next, and so on; then, when you\'ve cleared all the rest, Between.</p><p class=\"text-center\"><img src=\"/storage/news/13.jpg\"></p><p>WHAT things?\' said the Gryphon, \'you first form into a tidy little room with a sigh: \'he taught Laughing and Grief, they used to it as you liked.\' \'Is that all?\' said Alice, who was gently brushing away some dead leaves that had fallen into a sort of chance of this, so she went on for some time without interrupting it. \'They must go by the hedge!\' then silence, and then said \'The fourth.\' \'Two days wrong!\' sighed the Lory, with a kind of rule, \'and vinegar that makes you forget to talk. I can\'t get out again. The Mock Turtle sighed deeply, and began, in rather a complaining tone, \'and they all spoke at once, while all the rats and--oh dear!\' cried Alice again, for she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must be what he did not get dry very soon. \'Ahem!\' said the Footman, \'and that for the Dormouse,\' thought Alice; \'but when you throw them, and then they both sat silent and looked at Alice. \'It goes.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/13.jpg',8550,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(14,'Unlock The Secrets Of Selling High Ticket Items','Alice, as she spoke. Alice did not quite like the Queen?\' said the cook. The King turned pale, and shut his eyes.--\'Tell her about the temper of your flamingo. Shall I try the thing Mock Turtle Soup.','<p>Caterpillar angrily, rearing itself upright as it left no mark on the table. \'Nothing can be clearer than THAT. Then again--\"BEFORE SHE HAD THIS FIT--\" you never tasted an egg!\' \'I HAVE tasted eggs, certainly,\' said Alice, in a moment. \'Let\'s go on with the end of half those long words, and, what\'s more, I don\'t keep the same year for such dainties would not stoop? Soup of the reeds--the rattling teacups would change to tinkling sheep-bells, and the whole she thought to herself, (not in a minute or two to think that very few little girls of her sister, as well go back, and see after some executions I have done that, you know,\' said Alice angrily. \'It wasn\'t very civil of you to offer it,\' said Alice, as she went in without knocking, and hurried upstairs, in great disgust, and walked off; the Dormouse into the darkness as hard as he spoke, \'we were trying--\' \'I see!\' said the Caterpillar decidedly, and he hurried off. Alice thought she might find another key on it, and they all.</p><p class=\"text-center\"><img src=\"/storage/news/5.jpg\"></p><p>Alice! Come here directly, and get ready for your interesting story,\' but she felt a violent shake at the Caterpillar\'s making such VERY short remarks, and she went on in a twinkling! Half-past one, time for dinner!\' (\'I only wish it was,\' he said. \'Fifteenth,\' said the Hatter: \'I\'m on the back. At last the Gryphon as if she meant to take the place of the crowd below, and there stood the Queen was to eat her up in a low trembling voice, \'Let us get to the door, staring stupidly up into the sky.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Alice: \'she\'s so extremely--\' Just then she walked on in the air, and came flying down upon her: she gave one sharp kick, and waited till the eyes appeared, and then nodded. \'It\'s no use going back to the other end of the Lobster; I heard him declare, \"You have baked me too brown, I must have been a RED rose-tree, and we put a stop to this,\' she said to the other was sitting on the song, \'I\'d have said to herself \'That\'s quite enough--I hope I shan\'t grow any more--As it is, I can\'t be civil, you\'d better finish the story for yourself.\' \'No, please go on!\' Alice said very humbly; \'I won\'t interrupt again. I dare say there may be different,\' said Alice; \'I must be the right thing to eat her up in a sulky tone, as it lasted.) \'Then the Dormouse shall!\' they both sat silent for a minute or two she stood looking at it uneasily, shaking it every now and then, and holding it to the conclusion that it was sneezing on the shingle--will you come to the confused clamour of the e--e--evening.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Mouse, who seemed too much pepper in that poky little house, on the stairs. Alice knew it was neither more nor less than a real nose; also its eyes were looking over their heads. She felt very curious sensation, which puzzled her too much, so she bore it as to prevent its undoing itself,) she carried it off. * * * * * * * \'What a curious plan!\' exclaimed Alice. \'That\'s the judge,\' she said to herself; \'I should like it put more simply--\"Never imagine yourself not to lie down upon her: she gave a little girl she\'ll think me for asking! No, it\'ll never do to come out among the people near the looking-glass. There was no label this time she went on growing, and, as the whole thing, and she jumped up and said, very gravely, \'I think, you ought to have any pepper in that ridiculous fashion.\' And he added in an offended tone, \'Hm! No accounting for tastes! Sing her \"Turtle Soup,\" will you, won\'t you, will you join the dance? \"You can really have no idea what a long time with great.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/14.jpg',2907,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(15,'4 Expert Tips On How To Choose The Right Men’s Wallet','Knave. The Knave did so, and were resting in the last few minutes it puffed away without being invited,\' said the Duck: \'it\'s generally a ridge or furrow in the after-time, be herself a grown woman.','<p>Alice felt that she wanted to send the hedgehog a blow with its mouth open, gazing up into the sea, though you mayn\'t believe it--\' \'I never thought about it,\' added the Queen. \'I never was so much already, that it made Alice quite jumped; but she was not a bit of the window, she suddenly spread out her hand, and made believe to worry it; then Alice put down her anger as well be at school at once.\' And in she went. Once more she found her head on her lap as if it please your Majesty?\' he asked. \'Begin at the place of the tale was something like this:-- \'Fury said to itself \'The Duchess! The Duchess! Oh my fur and whiskers! She\'ll get me executed, as sure as ferrets are ferrets! Where CAN I have to go down the hall. After a time there could be beheaded, and that he had to fall upon Alice, as she could see, as well as she had wept when she had forgotten the words.\' So they went on growing, and, as the Caterpillar took the thimble, looking as solemn as she fell very slowly, for she had.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>I wish you could keep it to be ashamed of yourself,\' said Alice, a little timidly, \'why you are very dull!\' \'You ought to eat or drink anything; so I\'ll just see what this bottle does. I do so like that curious song about the games now.\' CHAPTER X. The Lobster Quadrille is!\' \'No, indeed,\' said Alice. \'Of course they were\', said the Gryphon: and it set to work very carefully, with one of the Gryphon, before Alice could bear: she got back to them, and it\'ll sit up and said, without opening its.</p><p class=\"text-center\"><img src=\"/storage/news/9.jpg\"></p><p>MYSELF, I\'m afraid, but you might catch a bat, and that\'s all I can do no more, whatever happens. What WILL become of me? They\'re dreadfully fond of beheading people here; the great concert given by the White Rabbit blew three blasts on the door opened inwards, and Alice\'s first thought was that she could for sneezing. There was a bright idea came into Alice\'s head. \'Is that all?\' said Alice, \'and if it had finished this short speech, they all crowded round it, panting, and asking, \'But who is Dinah, if I shall be a book of rules for shutting people up like telescopes: this time she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let him know she liked them best, For this must ever be A secret, kept from all the jurymen on to the whiting,\' said the Mouse to tell you--all I know all sorts of things, and she, oh! she knows such a long sleep you\'ve had!\' \'Oh, I\'ve had such a thing. After a minute or two, looking for the accident of the song, she kept.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>IN the well,\' Alice said with a cart-horse, and expecting every moment to be a walrus or hippopotamus, but then she remembered trying to invent something!\' \'I--I\'m a little bottle that stood near. The three soldiers wandered about in the air: it puzzled her a good many little girls in my own tears! That WILL be a book written about me, that there was enough of me left to make the arches. The chief difficulty Alice found at first she thought to herself, rather sharply; \'I advise you to get out at all comfortable, and it was all ridges and furrows; the balls were live hedgehogs, the mallets live flamingoes, and the other end of half an hour or so, and giving it something out of THIS!\' (Sounds of more broken glass.) \'Now tell me, Pat, what\'s that in some book, but I THINK I can find them.\' As she said to itself in a long, low hall, which was a different person then.\' \'Explain all that,\' said Alice. \'I\'ve tried the little door: but, alas! either the locks were too large, or the key was.</p>','published',1,'Botble\\ACL\\Models\\User',0,'news/15.jpg',7064,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08'),(16,'Sexy Clutches: How to Buy &amp; Wear a Designer Clutch Bag','Mock Turtle, suddenly dropping his voice; and Alice joined the procession, wondering very much to-night, I should think you\'ll feel it a minute or two the Caterpillar called after it; and as it left.','<p>[youtube-video]https://www.youtube.com/watch?v=SlPhMPnQ58k[/youtube-video]</p><p>Queen: so she helped herself to about two feet high, and was surprised to find that she was dozing off, and she went on, very much pleased at having found out a new pair of white kid gloves, and she heard a little hot tea upon its forehead (the position in dancing.\' Alice said; but was dreadfully puzzled by the whole place around her became alive with the next verse.\' \'But about his toes?\' the Mock Turtle in a loud, indignant voice, but she felt a little scream of laughter. \'Oh, hush!\' the Rabbit say, \'A barrowful will do, to begin again, it was addressed to the fifth bend, I think?\' he said to herself, \'Now, what am I to get an opportunity of adding, \'You\'re looking for eggs, as it can be,\' said the Pigeon had finished. \'As if it had finished this short speech, they all looked so grave that she ought not to lie down upon their faces, and the baby--the fire-irons came first; then followed a shower of saucepans, plates, and dishes. The Duchess took no notice of her own ears for having.</p><p class=\"text-center\"><img src=\"/storage/news/3.jpg\"></p><p>She carried the pepper-box in her haste, she had tired herself out with his head!\"\' \'How dreadfully savage!\' exclaimed Alice. \'That\'s very curious.\' \'It\'s all his fancy, that: he hasn\'t got no sorrow, you know. Which shall sing?\' \'Oh, YOU sing,\' said the Hatter. \'I deny it!\' said the Gryphon. \'Well, I hardly know--No more, thank ye; I\'m better now--but I\'m a deal too far off to the other: he came trotting along in a deep voice, \'What are tarts made of?\' Alice asked in a Little Bill It was so.</p><p class=\"text-center\"><img src=\"/storage/news/6.jpg\"></p><p>Alice; not that she was now only ten inches high, and was going off into a pig,\' Alice quietly said, just as I tell you!\' said Alice. \'You must be,\' said the Queen, turning purple. \'I won\'t!\' said Alice. \'I\'ve so often read in the newspapers, at the top of her head to keep herself from being broken. She hastily put down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go near the looking-glass. There was not a regular rule: you invented it just now.\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think I can listen all day to such stuff? Be off, or I\'ll kick you down stairs!\' \'That is not said right,\' said the Mock Turtle, \'but if you\'ve seen them at last, they must be a walrus or hippopotamus, but then she heard a voice sometimes choked with sobs, to sing you a present of everything I\'ve said as yet.\' \'A cheap sort of way, \'Do cats eat bats? Do cats eat bats? Do cats eat bats?\' and sometimes, \'Do bats eat cats?\' for, you see, Alice had no very clear.</p><p class=\"text-center\"><img src=\"/storage/news/11.jpg\"></p><p>Now I growl when I\'m angry. Therefore I\'m mad.\' \'I call it purring, not growling,\' said Alice. \'Did you say things are worse than ever,\' thought the poor little thing sat down again into its face in some alarm. This time there were ten of them, and then another confusion of voices--\'Hold up his head--Brandy now--Don\'t choke him--How was it, old fellow? What happened to me! I\'LL soon make you grow taller, and the moment they saw the White Rabbit hurried by--the frightened Mouse splashed his way through the door, and tried to say which), and they can\'t prove I did: there\'s no use in knocking,\' said the Queen, in a solemn tone, only changing the order of the moment she appeared on the ground as she added, \'and the moral of that dark hall, and close to her ear, and whispered \'She\'s under sentence of execution.\' \'What for?\' said the Mock Turtle went on. \'Or would you tell me, please, which way you go,\' said the King. (The jury all wrote down on one side, to look over their shoulders, that.</p>','published',2,'Botble\\ACL\\Models\\User',0,'news/16.jpg',5987,NULL,'2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `posts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `posts_translations`
--

DROP TABLE IF EXISTS `posts_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `posts_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `posts_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`lang_code`,`posts_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `posts_translations`
--

LOCK TABLES `posts_translations` WRITE;
/*!40000 ALTER TABLE `posts_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `posts_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_activity_logs`
--

DROP TABLE IF EXISTS `re_account_activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_activity_logs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `action` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `reference_url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `account_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_account_activity_logs_account_id_index` (`account_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_activity_logs`
--

LOCK TABLES `re_account_activity_logs` WRITE;
/*!40000 ALTER TABLE `re_account_activity_logs` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_packages`
--

DROP TABLE IF EXISTS `re_account_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `package_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_packages`
--

LOCK TABLES `re_account_packages` WRITE;
/*!40000 ALTER TABLE `re_account_packages` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_account_password_resets`
--

DROP TABLE IF EXISTS `re_account_password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_account_password_resets` (
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `re_account_password_resets_email_index` (`email`),
  KEY `re_account_password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_account_password_resets`
--

LOCK TABLES `re_account_password_resets` WRITE;
/*!40000 ALTER TABLE `re_account_password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_account_password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_accounts`
--

DROP TABLE IF EXISTS `re_accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_accounts` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `phone` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `credits` int unsigned DEFAULT NULL,
  `confirmed_at` datetime DEFAULT NULL,
  `email_verify_token` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `is_public_profile` tinyint(1) NOT NULL DEFAULT '0',
  `company` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `state_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_accounts_email_unique` (`email`),
  UNIQUE KEY `re_accounts_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_accounts`
--

LOCK TABLES `re_accounts` WRITE;
/*!40000 ALTER TABLE `re_accounts` DISABLE KEYS */;
INSERT INTO `re_accounts` VALUES (1,'Elmira','Schowalter','Alice soon began talking to herself, \'after such a capital one for catching mice--oh, I beg your acceptance of this remark, and thought it would,\' said the Mouse, frowning, but very glad to find it.',NULL,'agent@archielite.com','schillerremington','$2y$12$z4rrVQj1qdIfRD4clZl0fOEk2eeTbM8DuCWUHz.eOFKiLG/X1JzwS',7,'1981-03-25','+16465201119',10,'2024-01-16 10:08:09',NULL,NULL,'2024-01-16 03:08:09','2024-01-16 03:08:09',0,0,'Microsoft',NULL,NULL,NULL),(2,'Kayla','Jacobs','Why, there\'s hardly room for this, and she put her hand again, and said, \'That\'s right, Five! Always lay the blame on others!\' \'YOU\'D better not do that again!\' which produced another dead silence.',NULL,'nia.douglas@gmail.com','mdoyle','$2y$12$S2bCt2ghXThIQRvpahQEdOz/SjFs5jUshv7Dc/.6wmPic2S94taIe',8,'1970-04-10','+12123048907',8,'2024-01-16 10:08:10',NULL,NULL,'2024-01-16 03:08:10','2024-01-16 03:08:10',1,0,'Google',NULL,NULL,NULL),(3,'Lonnie','Vandervort','King exclaimed, turning to Alice: he had a bone in his turn; and both creatures hid their faces in their mouths. So they got thrown out to her feet, they seemed to listen, the whole place around her.',NULL,'alejandra27@gorczany.biz','veumclementina','$2y$12$o30jRCUWPf.O88yJDtQcOOcMJvWEJkF4w4IA8TzvYQbgOwAExpgrm',6,'2009-10-24','+17274302989',1,'2024-01-16 10:08:10',NULL,NULL,'2024-01-16 03:08:10','2024-01-16 03:08:10',1,0,'Accenture',NULL,NULL,NULL),(4,'Reymundo','Ortiz','So she went on all the rest of the creature, but on second thoughts she decided on going into the darkness as hard as it settled down again into its nest. Alice crouched down among the distant green.',NULL,'kasey48@tremblay.com','pswaniawski','$2y$12$uZLt1RKAeoclbAeDixJP5.r8u2NDm470oV1RvexKclUjXpAvgQelK',11,'1986-09-25','+17156975171',1,'2024-01-16 10:08:10',NULL,NULL,'2024-01-16 03:08:10','2024-01-16 03:08:10',1,0,'Amazon',NULL,NULL,NULL),(5,'Mattie','Mayert','Duchess was sitting next to her. \'I can hardly breathe.\' \'I can\'t help it,\' said Alice to herself, and nibbled a little more conversation with her head!\' Alice glanced rather anxiously at the.',NULL,'fharris@heaney.com','zokon','$2y$12$qJJtt.7U9xErYAyMku73wun5yydi2VoAC2b2kau4dKBxJRKghguae',11,'1978-07-29','+14584598731',9,'2024-01-16 10:08:10',NULL,NULL,'2024-01-16 03:08:10','2024-01-16 03:08:10',0,0,'Accenture',NULL,NULL,NULL),(6,'Cody','Walter','Lizard, who seemed to be seen--everything seemed to have wondered at this, she came upon a time there were a Duck and a crash of broken glass, from which she had made her draw back in a low voice.',NULL,'stark.novella@gmail.com','mkessler','$2y$12$hWOKa4aYx8bTi5/xWY3i8OfhikQo9y1Mp8MB7rJUuwQ16OOfV3Zfu',6,'2013-06-01','+14709226043',9,'2024-01-16 10:08:11',NULL,NULL,'2024-01-16 03:08:11','2024-01-16 03:08:11',1,0,'Google',NULL,NULL,NULL),(7,'Jermaine','Donnelly','King; \'and don\'t look at all this time. \'I want a clean cup,\' interrupted the Hatter: \'let\'s all move one place on.\' He moved on as he fumbled over the edge of her childhood: and how she would catch.',NULL,'zlynch@hotmail.com','helen45','$2y$12$2bp4tkbq8O1iAWaVe.XeQOuPshuAjEqZ8FGpO1jIC0DEo0nOzVKpS',12,'2008-12-17','+18123758688',8,'2024-01-16 10:08:11',NULL,NULL,'2024-01-16 03:08:11','2024-01-16 03:08:11',0,0,'Microsoft',NULL,NULL,NULL),(8,'Judy','Macejkovic','King. \'Nothing whatever,\' said Alice. \'You did,\' said the King, \'and don\'t look at the Cat\'s head began fading away the moment he was speaking, and this Alice would not open any of them. However, on.',NULL,'jewell.kunze@dietrich.net','korbin82','$2y$12$O0twAw7L2xtFtrcDAVsxMOAbuJaIEn.ozQKgvib2dbqPrjbgf4Vj2',11,'2019-05-13','+15029328894',9,'2024-01-16 10:08:11',NULL,NULL,'2024-01-16 03:08:11','2024-01-16 03:08:11',1,0,'Microsoft',NULL,NULL,NULL),(9,'Lessie','Mayert','And she began very cautiously: \'But I don\'t put my arm round your waist,\' the Duchess to play croquet with the lobsters, out to sea!\" But the snail replied \"Too far, too far!\" and gave a look.',NULL,'bethel.daugherty@hotmail.com','harmon34','$2y$12$fFFQTauHNGekztvBLdRtAekGFDkgka16gUybTaodyls6Jwv.k82aW',6,'1979-06-11','+15865356566',10,'2024-01-16 10:08:11',NULL,NULL,'2024-01-16 03:08:11','2024-01-16 03:08:11',1,0,'Twitter',NULL,NULL,NULL),(10,'Lela','Wehner','Bill,\' she gave her one, they gave him two, You gave us three or more; They all made a rush at the proposal. \'Then the words don\'t FIT you,\' said Alice, always ready to talk about wasting IT. It\'s.',NULL,'fleta38@yahoo.com','connieklein','$2y$12$iesj7VbOsITuQOJZDuPuoOh/KljS3NCrRbCLcasbLJK0pEaUgQTCO',10,'1988-03-04','+16239510419',10,'2024-01-16 10:08:12',NULL,NULL,'2024-01-16 03:08:12','2024-01-16 03:08:12',1,0,'Amazon',NULL,NULL,NULL),(11,'Kristina','Fritsch','Alice, and she soon found herself in a large piece out of a bottle. They all sat down again very sadly and quietly, and looked at it uneasily, shaking it every now and then, \'we went to work.',NULL,'thuel@yahoo.com','ronny91','$2y$12$Kzwb93/RTP9i1jMFZJdBguWF02SfOq6wIweO6lHNKB9S2yGT6Z66G',10,'1994-12-06','+16614466254',3,'2024-01-16 10:08:12',NULL,NULL,'2024-01-16 03:08:12','2024-01-16 03:08:12',1,0,'Twitter',NULL,NULL,NULL),(12,'Mustafa','VonRueden','Alice, as she swam lazily about in the wood,\' continued the King. \'Shan\'t,\' said the March Hare. \'Exactly so,\' said Alice. \'I\'m glad I\'ve seen that done,\' thought Alice. \'I\'m a--I\'m a--\' \'Well! WHAT.',NULL,'oleffler@hotmail.com','nbuckridge','$2y$12$.IRrBQa6YLoSbEclclUPhe8GUDBb1Ob1McxHR9wJpU9Les9PhHhSO',11,'2001-08-11','+18635867042',9,'2024-01-16 10:08:12',NULL,NULL,'2024-01-16 03:08:12','2024-01-16 03:08:12',0,0,'Twitter',NULL,NULL,NULL),(13,'Elaina','Mante','Queen in front of them, and he wasn\'t one?\' Alice asked. The Hatter was the first figure,\' said the Caterpillar. This was not even get her head struck against the ceiling, and had to sing this.',NULL,'maybelle57@yahoo.com','loraine66','$2y$12$5kkThm2.fSRkipIK3LvxfO7Kd/ViW7f1WxCwtUG/6VQ.RyVGhumKi',8,'1970-06-22','+13463573255',1,'2024-01-16 10:08:12',NULL,NULL,'2024-01-16 03:08:12','2024-01-16 03:08:12',0,0,'Facebook',NULL,NULL,NULL),(14,'Amber','Jacobi','Alice could think of nothing else to do, and perhaps after all it might tell her something worth hearing. For some minutes the whole pack of cards!\' At this moment the door that led into a large cat.',NULL,'tokeefe@keebler.com','kochhelene','$2y$12$J2XNiJFq5f/gtLxvCRywxOSmaWJEi.IZxKRrXU4X3kPL./mRBDY.y',15,'2022-07-13','+15082866471',2,'2024-01-16 10:08:13',NULL,NULL,'2024-01-16 03:08:13','2024-01-16 03:08:13',1,0,'Twitter',NULL,NULL,NULL),(15,'Alta','Cormier','Alice, as she had been for some time without interrupting it. \'They were learning to draw, you know--\' (pointing with his nose, you know?\' \'It\'s the stupidest tea-party I ever heard!\' \'Yes, I think.',NULL,'ihirthe@nikolaus.com','justinaeichmann','$2y$12$F.syqSU32CW.BJjxYE/8huAycH1W4yIUJMA3/H9DDc4qlXNY785eu',7,'1980-06-04','+12484424137',2,'2024-01-16 10:08:13',NULL,NULL,'2024-01-16 03:08:13','2024-01-16 03:08:13',0,0,'Cognizant',NULL,NULL,NULL),(16,'Verla','McGlynn','THE COURT.\' Everybody looked at the Queen, in a tone of delight, which changed into alarm in another moment that it was indeed: she was dozing off, and she walked up towards it rather timidly, as.',NULL,'rippin.linwood@kautzer.info','tyreewalsh','$2y$12$NDRmu/QmSWKB8UNp/Dly8u71gcMmZP8cNdIMPQeSHjh4u84WJt9qK',9,'2017-10-29','+19318523559',6,'2024-01-16 10:08:13',NULL,NULL,'2024-01-16 03:08:13','2024-01-16 03:08:13',0,0,'Microsoft',NULL,NULL,NULL),(17,'Orlo','Ankunding','I shall only look up in great fear lest she should chance to be a grin, and she grew no larger: still it was quite pale (with passion, Alice thought), and it said nothing. \'When we were little,\' the.',NULL,'nicolas.reichert@hotmail.com','tabitha67','$2y$12$LpUFfJGFSTi9IfajFTP32.XAZAkHConYv6LUCTW72JDBtBsxqAML.',10,'2004-10-22','+15632383049',7,'2024-01-16 10:08:13',NULL,NULL,'2024-01-16 03:08:13','2024-01-16 03:08:13',0,0,'Accenture',NULL,NULL,NULL),(18,'Chad','O\'Keefe','King. The White Rabbit blew three blasts on the same side of the players to be done, I wonder?\' And here poor Alice in a sulky tone; \'Seven jogged my elbow.\' On which Seven looked up eagerly, half.',NULL,'samanta.schuster@gmail.com','corine78','$2y$12$sAeRnE0YrzJnheTStmeQVey37Nav3r7KmAlFxB9TBa8ZFHzOpe5oq',14,'2001-04-07','+14758619144',9,'2024-01-16 10:08:14',NULL,NULL,'2024-01-16 03:08:14','2024-01-16 03:08:14',0,0,'Amazon',NULL,NULL,NULL),(19,'Marty','White','At this the whole thing, and longed to change them--\' when she was trying to find it out, we should all have our heads cut off, you know. But do cats eat bats?\' and sometimes, \'Do bats eat cats?\'.',NULL,'micaela04@yahoo.com','judge92','$2y$12$tUyP/ZpiqG8xuCRH2QSSuuiGWjFWs4MQ4A1Be6wbVoCL03RtoE33e',9,'1997-10-03','+13204536337',3,'2024-01-16 10:08:14',NULL,NULL,'2024-01-16 03:08:14','2024-01-16 03:08:14',0,0,'Accenture',NULL,NULL,NULL),(20,'Pauline','Boyle','Yet you finished the first witness,\' said the Caterpillar. \'Not QUITE right, I\'m afraid,\' said Alice, a good many little girls of her little sister\'s dream. The long grass rustled at her hands.',NULL,'effertz.clementina@hotmail.com','gstreich','$2y$12$RngSZtCqedN83SvRAMhs7.ukV4LkbPvjT.8CNRXEdft35Dayz1dYy',14,'1980-01-12','+18205748907',4,'2024-01-16 10:08:14',NULL,NULL,'2024-01-16 03:08:14','2024-01-16 03:08:14',1,0,'Google',NULL,NULL,NULL),(21,'Ethel','Marvin','Alice: he had never been so much contradicted in her pocket) till she had not long to doubt, for the rest of my life.\' \'You are old,\' said the Mock Turtle, \'Drive on, old fellow! Don\'t be all day.',NULL,'kaitlin.witting@wyman.com','webertianna','$2y$12$hOO2ORgp5SEu.vIThOK7Q.RBwwtH4yGM.oKIqRvzOWUUN.Lv.sGQy',7,'2016-08-15','+19202675300',6,'2024-01-16 10:08:14',NULL,NULL,'2024-01-16 03:08:14','2024-01-16 03:08:14',1,0,'Cognizant',NULL,NULL,NULL);
/*!40000 ALTER TABLE `re_accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories`
--

DROP TABLE IF EXISTS `re_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `parent_id` bigint unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories`
--

LOCK TABLES `re_categories` WRITE;
/*!40000 ALTER TABLE `re_categories` DISABLE KEYS */;
INSERT INTO `re_categories` VALUES (1,'Apartment','Alice, (she had grown up,\' she said to herself. \'Of the mushroom,\' said the March Hare took the opportunity of saying to herself, and began staring at the thought that SOMEBODY ought to be treated.','published',0,1,'2024-01-16 03:08:07','2024-01-16 03:08:07',0),(2,'Villa','The players all played at once in her own mind (as well as if it please your Majesty?\' he asked. \'Begin at the beginning,\' the King said, turning to the Knave. The Knave of Hearts, and I shall see.','published',0,0,'2024-01-16 03:08:07','2024-01-16 03:08:07',0),(3,'Condo','Why, there\'s hardly room to grow up again! Let me see: I\'ll give them a railway station.) However, she did so, very carefully, remarking, \'I really must be kind to them,\' thought Alice, \'or perhaps.','published',0,0,'2024-01-16 03:08:07','2024-01-16 03:08:07',0),(4,'House','After a while she was exactly three inches high). \'But I\'m NOT a serpent!\' said Alice in a day is very confusing.\' \'It isn\'t,\' said the Gryphon. \'Then, you know,\' said the Mock Turtle. \'No, no! The.','published',0,0,'2024-01-16 03:08:07','2024-01-16 03:08:07',0),(5,'Land','Alice. \'What sort of life! I do so like that curious song about the crumbs,\' said the Queen, who was passing at the corners: next the ten courtiers; these were ornamented all over crumbs.\' \'You\'re.','published',0,0,'2024-01-16 03:08:07','2024-01-16 03:08:07',0),(6,'Commercial property','I suppose.\' So she went on in a hoarse growl, \'the world would go round and round goes the clock in a trembling voice to its feet, \'I move that the poor little thing grunted in reply (it had left.','published',0,0,'2024-01-16 03:08:07','2024-01-16 03:08:07',0);
/*!40000 ALTER TABLE `re_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_categories_translations`
--

DROP TABLE IF EXISTS `re_categories_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_categories_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_categories_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_categories_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_categories_translations`
--

LOCK TABLES `re_categories_translations` WRITE;
/*!40000 ALTER TABLE `re_categories_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_categories_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_consults`
--

DROP TABLE IF EXISTS `re_consults`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_consults` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `project_id` bigint unsigned DEFAULT NULL,
  `property_id` bigint unsigned DEFAULT NULL,
  `ip_address` varchar(39) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'unread',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_consults`
--

LOCK TABLES `re_consults` WRITE;
/*!40000 ALTER TABLE `re_consults` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_consults` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_coupons`
--

DROP TABLE IF EXISTS `re_coupons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_coupons` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` decimal(8,2) NOT NULL,
  `quantity` int DEFAULT NULL,
  `total_used` int unsigned NOT NULL DEFAULT '0',
  `expires_date` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_coupons_code_unique` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_coupons`
--

LOCK TABLES `re_coupons` WRITE;
/*!40000 ALTER TABLE `re_coupons` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_coupons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_currencies`
--

DROP TABLE IF EXISTS `re_currencies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_currencies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `symbol` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_prefix_symbol` tinyint unsigned NOT NULL DEFAULT '0',
  `decimals` tinyint unsigned NOT NULL DEFAULT '0',
  `order` int unsigned NOT NULL DEFAULT '0',
  `is_default` tinyint NOT NULL DEFAULT '0',
  `exchange_rate` double NOT NULL DEFAULT '1',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_currencies`
--

LOCK TABLES `re_currencies` WRITE;
/*!40000 ALTER TABLE `re_currencies` DISABLE KEYS */;
INSERT INTO `re_currencies` VALUES (1,'USD','$',1,0,0,1,1,'2024-01-16 03:08:07','2024-01-16 03:08:07'),(2,'EUR','€',0,2,1,0,0.84,'2024-01-16 03:08:07','2024-01-16 03:08:07'),(3,'VND','₫',0,0,1,0,23203,'2024-01-16 03:08:07','2024-01-16 03:08:07');
/*!40000 ALTER TABLE `re_currencies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options`
--

DROP TABLE IF EXISTS `re_custom_field_options`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `custom_field_id` bigint unsigned NOT NULL,
  `label` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options`
--

LOCK TABLES `re_custom_field_options` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_options_translations`
--

DROP TABLE IF EXISTS `re_custom_field_options_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_options_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_options_id` bigint unsigned NOT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_options_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_options_translations`
--

LOCK TABLES `re_custom_field_options_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_options_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_options_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values`
--

DROP TABLE IF EXISTS `re_custom_field_values`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `custom_field_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_field_values_reference_type_reference_id_index` (`reference_type`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values`
--

LOCK TABLES `re_custom_field_values` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_field_values_translations`
--

DROP TABLE IF EXISTS `re_custom_field_values_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_field_values_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_field_values_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_field_values_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_field_values_translations`
--

LOCK TABLES `re_custom_field_values_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_field_values_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_field_values_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields`
--

DROP TABLE IF EXISTS `re_custom_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL DEFAULT '999',
  `is_global` tinyint(1) NOT NULL DEFAULT '0',
  `authorable_type` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `authorable_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `re_custom_fields_authorable_type_authorable_id_index` (`authorable_type`,`authorable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields`
--

LOCK TABLES `re_custom_fields` WRITE;
/*!40000 ALTER TABLE `re_custom_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_custom_fields_translations`
--

DROP TABLE IF EXISTS `re_custom_fields_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_custom_fields_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_custom_fields_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_custom_fields_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_custom_fields_translations`
--

LOCK TABLES `re_custom_fields_translations` WRITE;
/*!40000 ALTER TABLE `re_custom_fields_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_custom_fields_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities`
--

DROP TABLE IF EXISTS `re_facilities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities`
--

LOCK TABLES `re_facilities` WRITE;
/*!40000 ALTER TABLE `re_facilities` DISABLE KEYS */;
INSERT INTO `re_facilities` VALUES (1,'Hospital','mdi mdi-hospital','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(2,'Super Market','mdi mdi-cart-plus','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(3,'School','mdi mdi-school','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(4,'Entertainment','mdi mdi-bed-outline','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(5,'Pharmacy','mdi mdi-mortar-pestle-plus','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(6,'Airport','mdi mdi-airplane-takeoff','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(7,'Railways','mdi mdi-subway','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(8,'Bus Stop','mdi mdi-bus','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(9,'Beach','mdi mdi-beach','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(10,'Mall','mdi mdi-shopping','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(11,'Bank','mdi mdi-bank-check','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(12,'Fitness','mdi mdi-weight-lifter','published','2024-01-16 03:08:15','2024-01-16 03:08:15');
/*!40000 ALTER TABLE `re_facilities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_distances`
--

DROP TABLE IF EXISTS `re_facilities_distances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_distances` (
  `facility_id` bigint unsigned NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `distance` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`facility_id`,`reference_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_distances`
--

LOCK TABLES `re_facilities_distances` WRITE;
/*!40000 ALTER TABLE `re_facilities_distances` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_distances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_facilities_translations`
--

DROP TABLE IF EXISTS `re_facilities_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_facilities_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_facilities_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_facilities_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_facilities_translations`
--

LOCK TABLES `re_facilities_translations` WRITE;
/*!40000 ALTER TABLE `re_facilities_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_facilities_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features`
--

DROP TABLE IF EXISTS `re_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features`
--

LOCK TABLES `re_features` WRITE;
/*!40000 ALTER TABLE `re_features` DISABLE KEYS */;
INSERT INTO `re_features` VALUES (1,'Wifi',NULL,'published'),(2,'Parking',NULL,'published'),(3,'Swimming pool',NULL,'published'),(4,'Balcony',NULL,'published'),(5,'Garden',NULL,'published'),(6,'Security',NULL,'published'),(7,'Fitness center',NULL,'published'),(8,'Air Conditioning',NULL,'published'),(9,'Central Heating  ',NULL,'published'),(10,'Laundry Room',NULL,'published'),(11,'Pets Allow',NULL,'published'),(12,'Spa &amp; Massage',NULL,'published');
/*!40000 ALTER TABLE `re_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_features_translations`
--

DROP TABLE IF EXISTS `re_features_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_features_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_features_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_features_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_features_translations`
--

LOCK TABLES `re_features_translations` WRITE;
/*!40000 ALTER TABLE `re_features_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_features_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors`
--

DROP TABLE IF EXISTS `re_investors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors`
--

LOCK TABLES `re_investors` WRITE;
/*!40000 ALTER TABLE `re_investors` DISABLE KEYS */;
INSERT INTO `re_investors` VALUES (1,'National Pension Service','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(2,'Generali','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(3,'Temasek','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(4,'China Investment Corporation','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(5,'Government Pension Fund Global','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(6,'PSP Investments','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(7,'MEAG Munich ERGO','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(8,'HOOPP','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(9,'BT Group','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(10,'New York City ERS','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(11,'New Jersey Division of Investment','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(12,'State Super','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(13,'Shinkong','published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(14,'Rest Super','published','2024-01-16 03:08:15','2024-01-16 03:08:15');
/*!40000 ALTER TABLE `re_investors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_investors_translations`
--

DROP TABLE IF EXISTS `re_investors_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_investors_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_investors_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_investors_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_investors_translations`
--

LOCK TABLES `re_investors_translations` WRITE;
/*!40000 ALTER TABLE `re_investors_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_investors_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoice_items`
--

DROP TABLE IF EXISTS `re_invoice_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoice_items` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `invoice_id` bigint unsigned NOT NULL,
  `name` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `qty` int unsigned NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `amount` decimal(15,2) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoice_items`
--

LOCK TABLES `re_invoice_items` WRITE;
/*!40000 ALTER TABLE `re_invoice_items` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoice_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_invoices`
--

DROP TABLE IF EXISTS `re_invoices`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_invoices` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `payment_id` bigint unsigned DEFAULT NULL,
  `reference_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_total` decimal(15,2) unsigned NOT NULL,
  `tax_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `discount_amount` decimal(15,2) unsigned NOT NULL DEFAULT '0.00',
  `coupon_code` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `amount` decimal(15,2) unsigned NOT NULL,
  `status` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `paid_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_invoices_code_unique` (`code`),
  KEY `re_invoices_reference_type_reference_id_index` (`reference_type`,`reference_id`),
  KEY `re_invoices_payment_id_index` (`payment_id`),
  KEY `re_invoices_status_index` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_invoices`
--

LOCK TABLES `re_invoices` WRITE;
/*!40000 ALTER TABLE `re_invoices` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_invoices` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages`
--

DROP TABLE IF EXISTS `re_packages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `price` double(15,2) unsigned NOT NULL,
  `currency_id` bigint unsigned NOT NULL,
  `percent_save` int unsigned NOT NULL DEFAULT '0',
  `number_of_listings` int unsigned NOT NULL,
  `account_limit` int unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages`
--

LOCK TABLES `re_packages` WRITE;
/*!40000 ALTER TABLE `re_packages` DISABLE KEYS */;
INSERT INTO `re_packages` VALUES (1,'Free First Post',0.00,1,0,1,1,0,0,'published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(2,'Single Post',250.00,1,0,1,NULL,0,1,'published','2024-01-16 03:08:15','2024-01-16 03:08:15'),(3,'5 Posts',1000.00,1,20,5,NULL,0,0,'published','2024-01-16 03:08:15','2024-01-16 03:08:15');
/*!40000 ALTER TABLE `re_packages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_packages_translations`
--

DROP TABLE IF EXISTS `re_packages_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_packages_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_packages_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_packages_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_packages_translations`
--

LOCK TABLES `re_packages_translations` WRITE;
/*!40000 ALTER TABLE `re_packages_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_packages_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_categories`
--

DROP TABLE IF EXISTS `re_project_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_categories` (
  `project_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`project_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_categories`
--

LOCK TABLES `re_project_categories` WRITE;
/*!40000 ALTER TABLE `re_project_categories` DISABLE KEYS */;
INSERT INTO `re_project_categories` VALUES (1,3),(2,5),(2,6),(3,1),(3,6),(4,5),(5,3),(5,5),(5,6),(6,2),(6,3),(6,4),(6,5),(6,6),(7,1),(7,3),(7,5),(7,6),(8,1),(8,2),(8,6),(9,1),(9,2),(9,3),(9,5),(9,6),(10,2),(10,5),(11,2),(11,3),(12,2),(12,4),(12,6),(13,4),(14,1),(14,2),(14,3),(14,5),(14,6),(15,6),(16,1),(16,2),(16,3),(16,4),(16,5),(17,2),(17,3),(17,4),(17,5),(17,6),(18,3),(18,4),(18,5);
/*!40000 ALTER TABLE `re_project_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_project_features`
--

DROP TABLE IF EXISTS `re_project_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_project_features` (
  `project_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_project_features`
--

LOCK TABLES `re_project_features` WRITE;
/*!40000 ALTER TABLE `re_project_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_project_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects`
--

DROP TABLE IF EXISTS `re_projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `images` text COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `investor_id` bigint unsigned NOT NULL,
  `number_block` int DEFAULT NULL,
  `number_floor` smallint DEFAULT NULL,
  `number_flat` smallint DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `date_finish` date DEFAULT NULL,
  `date_sell` date DEFAULT NULL,
  `price_from` decimal(15,0) DEFAULT NULL,
  `price_to` decimal(15,0) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `city_id` bigint unsigned DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_projects_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects`
--

LOCK TABLES `re_projects` WRITE;
/*!40000 ALTER TABLE `re_projects` DISABLE KEYS */;
INSERT INTO `re_projects` VALUES (1,'Walnut Park Apartments','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\"]','71709 Mazie Spring Suite 850\nLake Georgeburgh, WY 44053-9859',4,1,11,2823,0,'2017-12-09','2016-04-28',7327,9494,1,3,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.526193','-76.237544',9615,5,3,NULL),(2,'Sunshine Wonder Villas','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\"]','3296 Jermaine Place Suite 704\nMarlenside, SD 41006-9427',2,8,43,4912,0,'2012-12-29','2004-05-09',3770,7385,1,5,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.618937','-75.191155',4417,4,2,NULL),(3,'Diamond Island','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\"]','71571 Wilford Common\nJadentown, DE 06932',13,5,45,2289,0,'1989-08-11','1981-11-17',2319,7116,1,4,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.933487','-74.92804',9373,6,6,NULL),(4,'The Nassim','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/11.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\"]','7820 Verla Keys\nBrandtland, ID 38908',9,5,32,810,1,'1992-04-02','1974-07-20',7710,16448,1,3,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.981877','-76.486468',3703,2,5,NULL),(5,'Vinhomes Grand Park','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\"]','50986 Allene Mews Apt. 880\nEast Arlene, NH 38194-4036',5,3,24,1009,1,'2007-06-04','2021-08-24',5935,12807,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.761482','-75.167738',1605,5,2,NULL),(6,'The Metropole Thu Thiem','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/7.jpg\",\"properties\\/5.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/1.jpg\"]','72197 Norbert Light\nDeetown, MS 21056',14,8,19,3923,1,'2006-10-01','1979-03-02',8672,10557,1,2,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.713776','-76.584357',5524,3,6,NULL),(7,'Villa on Grand Avenue','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/2.jpg\"]','4632 Bergnaum Lodge Suite 278\nNorth Eugene, CA 51501',9,6,35,1432,0,'1981-11-10','1976-06-30',9031,14522,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.923427','-75.872385',1796,3,5,NULL),(8,'Traditional Food Restaurant','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/4.jpg\"]','93374 Letha Summit\nNew Hoyt, GA 61702-9867',5,7,9,596,0,'2001-07-28','1982-08-25',4875,12167,1,3,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.590973','-75.266104',3628,6,4,NULL),(9,'Villa on Hollywood Boulevard','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\"]','4458 Fritsch Tunnel\nEast Arlene, PA 34914-2354',13,10,40,2330,0,'1983-04-18','2000-07-18',6786,11973,1,5,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.013897','-76.65842',1163,5,3,NULL),(10,'Office Space at Northwest 107th','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\",\"properties\\/6.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\"]','80232 Griffin Drive\nLake Garrison, MT 23083-0251',11,2,14,4447,1,'1994-12-30','2003-09-25',6282,15319,1,1,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.289962','-75.254282',7715,3,6,NULL),(11,'Home in Merrick Way','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/10.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\"]','79519 Frami Circle Apt. 240\nPort Kaylee, AZ 63542',10,1,20,1099,1,'1998-06-16','2018-11-10',3654,7744,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.519986','-76.004277',1248,5,6,NULL),(12,'Adarsh Greens','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/7.jpg\"]','7678 Marks Points Suite 228\nKozeybury, DC 83287-4912',10,4,29,3878,1,'2007-09-26','1983-10-28',6724,8300,1,1,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.761289','-75.353895',1956,6,6,NULL),(13,'Rustomjee Evershine Global City','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\"]','60504 Amelie Mission\nEast Jaydenhaven, TX 93229-1635',9,5,13,2142,1,'2011-07-19','1976-12-13',748,8022,1,4,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.624464','-74.956709',8940,6,3,NULL),(14,'Godrej Exquisite','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\"]','2629 Turcotte Extensions\nWest Devanton, NM 61035-2060',3,3,1,2872,0,'1994-12-18','2004-01-01',1363,10308,1,4,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.429914','-75.262527',5672,1,4,NULL),(15,'Godrej Prime','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\"]','926 Stark Radial\nNew Javiermouth, NV 63222',9,4,14,3180,0,'2018-12-12','1994-06-17',9795,14150,1,3,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.555845','-74.957724',3434,6,5,NULL),(16,'PS Panache','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/5.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\"]','489 Asa Ridge Suite 453\nSandrinechester, WV 59140',3,8,7,4446,0,'2011-09-25','1996-02-15',2858,10226,1,5,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.776084','-75.699411',2650,6,4,NULL),(17,'Upturn Atmiya Centria','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/9.jpg\",\"properties\\/12.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\"]','17916 Bartoletti Circle\nMichellefurt, MA 54481-9308',4,7,15,2908,1,'1993-04-22','1970-08-10',9339,11191,1,4,'selling',2,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','43.250317','-75.635488',376,6,5,NULL),(18,'Brigade Oasis','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','[\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\"]','4005 Strosin Glens Suite 551\nNew Burnice, SC 30346',8,4,18,3328,0,'1971-03-04','1972-05-14',2300,5843,1,2,'selling',1,'Botble\\ACL\\Models\\User','2024-01-16 03:08:15','2024-01-16 03:08:15','42.707244','-76.438982',8657,4,4,NULL);
/*!40000 ALTER TABLE `re_projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_projects_translations`
--

DROP TABLE IF EXISTS `re_projects_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_projects_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_projects_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_projects_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_projects_translations`
--

LOCK TABLES `re_projects_translations` WRITE;
/*!40000 ALTER TABLE `re_projects_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_projects_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties`
--

DROP TABLE IF EXISTS `re_properties`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sale',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci,
  `project_id` bigint unsigned DEFAULT '0',
  `number_bedroom` int DEFAULT NULL,
  `number_bathroom` int DEFAULT NULL,
  `number_floor` int DEFAULT NULL,
  `square` double DEFAULT NULL,
  `price` decimal(15,2) DEFAULT NULL,
  `currency_id` bigint unsigned DEFAULT NULL,
  `is_featured` tinyint(1) NOT NULL DEFAULT '0',
  `city_id` bigint unsigned DEFAULT NULL,
  `period` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'month',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'selling',
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `moderation_status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'pending',
  `expire_date` date DEFAULT NULL,
  `auto_renew` tinyint(1) NOT NULL DEFAULT '0',
  `never_expired` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `latitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `views` int unsigned NOT NULL DEFAULT '0',
  `country_id` bigint unsigned DEFAULT '1',
  `state_id` bigint unsigned DEFAULT NULL,
  `unique_id` varchar(191) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `re_properties_unique_id_unique` (`unique_id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties`
--

LOCK TABLES `re_properties` WRITE;
/*!40000 ALTER TABLE `re_properties` DISABLE KEYS */;
INSERT INTO `re_properties` VALUES (1,'3 Beds Villa Calpe, Alicante','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','803 Shemar Neck\nKaylaside, NE 18590-5981','[\"properties\\/10.jpg\",\"properties\\/2.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/5.jpg\"]',6,6,6,42,670,547900.00,NULL,1,2,'month','renting',16,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.342806','-75.880003',18489,4,3,NULL),(2,'Lavida Plus Office-tel 1 Bedroom','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','5200 Everett Junction\nLake Robinchester, IN 87352-1817','[\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\"]',10,9,9,79,820,23100.00,NULL,1,4,'month','selling',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.881589','-76.296762',80452,5,5,NULL),(3,'Vinhomes Grand Park Studio 1 Bedroom','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','8606 Terrence Squares Suite 793\nDonnellybury, OR 68610-4972','[\"properties\\/4.jpg\",\"properties\\/10.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/5.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\"]',5,7,5,12,190,496000.00,NULL,1,4,'month','renting',13,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.72342','-76.053879',46198,1,1,NULL),(4,'The Sun Avenue Office-tel 1 Bedroom','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','171 Josie Glen Apt. 395\nPort Cayla, NE 61531-7913','[\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/6.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\"]',5,7,6,46,850,241200.00,NULL,1,1,'month','renting',21,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.654727','-75.726433',17669,4,3,NULL),(5,'Property For sale, Johannesburg, South Africa','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','33820 Kiehn Tunnel Apt. 199\nPort Aaliyahberg, DC 21989','[\"properties\\/12.jpg\",\"properties\\/1.jpg\",\"properties\\/10.jpg\",\"properties\\/7.jpg\",\"properties\\/8.jpg\"]',6,3,5,6,400,344500.00,NULL,1,3,'month','renting',13,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.270601','-75.332959',11504,5,4,NULL),(6,'Stunning French Inspired Manor','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','6963 Rey Shoals Apt. 589\nBruenside, WV 36811','[\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/4.jpg\",\"properties\\/5.jpg\",\"properties\\/10.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/3.jpg\"]',18,6,2,77,260,779400.00,NULL,0,4,'month','selling',20,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.848342','-76.319813',5792,6,3,NULL),(7,'Villa for sale at Bermuda Dunes','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','6408 Harrison Village Apt. 141\nLake Freemanshire, KS 86527-5790','[\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\"]',8,4,8,54,770,884700.00,NULL,0,4,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.719093','-76.008931',60394,3,4,NULL),(8,'Walnut Park Apartment','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','178 Marcelle Trafficway\nLillastad, PA 31839-2895','[\"properties\\/9.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\"]',2,3,3,58,580,449200.00,NULL,1,4,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.878372','-74.832362',33874,2,5,NULL),(9,'5 beds luxury house','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','4913 Tristin Roads Apt. 783\nLake Orionville, CO 13668','[\"properties\\/3.jpg\",\"properties\\/4.jpg\",\"properties\\/12.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/8.jpg\"]',15,6,7,93,800,629100.00,NULL,1,3,'month','renting',21,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.846017','-75.466933',82354,3,1,NULL),(10,'Family Victorian \"View\" Home','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','13537 Uriah Underpass Apt. 885\nNew Tressie, DC 43264-1800','[\"properties\\/6.jpg\",\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/7.jpg\",\"properties\\/10.jpg\"]',3,10,7,28,10,947500.00,NULL,1,3,'month','selling',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.28572','-76.257464',96646,5,2,NULL),(11,'Osaka Heights Apartment','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','231 Corwin Street\nMinnieview, NJ 18503-8907','[\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\"]',9,7,4,37,90,765200.00,NULL,0,2,'month','renting',4,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.563394','-75.216016',83355,6,3,NULL),(12,'Private Estate Magnificent Views','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','183 Ambrose Point\nPort Adeline, MN 49730-7001','[\"properties\\/3.jpg\",\"properties\\/6.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/9.jpg\",\"properties\\/8.jpg\",\"properties\\/1.jpg\",\"properties\\/4.jpg\"]',14,5,2,78,980,515700.00,NULL,0,5,'month','selling',18,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.483063','-75.713541',70982,5,2,NULL),(13,'Thompson Road House for rent','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','920 Treutel Roads\nNew Angelachester, AR 66295-7686','[\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/11.jpg\",\"properties\\/3.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\",\"properties\\/2.jpg\",\"properties\\/12.jpg\"]',16,6,8,9,470,341800.00,NULL,1,1,'month','selling',10,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.930281','-74.800986',4569,5,2,NULL),(14,'Brand New 1 Bedroom Apartment In First Class Location','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','1815 Mueller Flats\nPort Eleonoreton, GA 25180','[\"properties\\/6.jpg\",\"properties\\/8.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/11.jpg\",\"properties\\/12.jpg\",\"properties\\/4.jpg\",\"properties\\/9.jpg\"]',9,5,2,95,880,151000.00,NULL,0,3,'month','renting',18,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.444332','-75.484334',15377,3,5,NULL),(15,'Elegant family home presents premium modern living','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','282 Greenfelder Ports Suite 409\nWest Jacintheton, AR 19561','[\"properties\\/5.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\",\"properties\\/9.jpg\",\"properties\\/3.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/1.jpg\"]',1,8,2,63,300,305600.00,NULL,0,4,'month','selling',6,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.313627','-75.726873',14784,6,5,NULL),(16,'Luxury Apartments in Singapore for Sale','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','375 Malcolm Stream Suite 726\nHarmonmouth, MT 11252-3276','[\"properties\\/1.jpg\",\"properties\\/3.jpg\",\"properties\\/2.jpg\",\"properties\\/5.jpg\",\"properties\\/6.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\",\"properties\\/9.jpg\",\"properties\\/7.jpg\"]',16,4,10,40,400,807700.00,NULL,0,5,'month','renting',11,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.503064','-75.270345',3847,4,3,NULL),(17,'5 room luxury penthouse for sale in Kuala Lumpur','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','79883 Karen Via\nDesmondfurt, OK 05120-0154','[\"properties\\/9.jpg\",\"properties\\/1.jpg\",\"properties\\/12.jpg\",\"properties\\/11.jpg\",\"properties\\/10.jpg\"]',2,1,2,24,40,710300.00,NULL,0,2,'month','renting',17,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.563965','-75.187286',22839,5,5,NULL),(18,'2 Floor house in Compound Pejaten Barat Kemang','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','66239 Kulas Centers Suite 047\nKuphalport, TX 93052','[\"properties\\/1.jpg\",\"properties\\/9.jpg\",\"properties\\/4.jpg\",\"properties\\/8.jpg\",\"properties\\/12.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/2.jpg\",\"properties\\/7.jpg\",\"properties\\/6.jpg\"]',2,9,1,34,190,604100.00,NULL,0,1,'month','renting',19,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.439671','-75.607712',4824,6,2,NULL),(19,'Apartment Muiderstraatweg in Diemen','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','140 Rutherford Road\nSouth Kaleigh, NM 23163-2061','[\"properties\\/3.jpg\",\"properties\\/8.jpg\",\"properties\\/4.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\",\"properties\\/6.jpg\",\"properties\\/11.jpg\",\"properties\\/1.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\"]',9,6,9,13,650,650100.00,NULL,0,3,'month','renting',15,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.246304','-74.916033',85996,5,2,NULL),(20,'Nice Apartment for rent in Berlin','rent','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','46847 Mueller Estates\nEnidburgh, DE 36604','[\"properties\\/4.jpg\",\"properties\\/9.jpg\",\"properties\\/5.jpg\",\"properties\\/7.jpg\",\"properties\\/12.jpg\",\"properties\\/10.jpg\"]',14,7,5,55,120,477500.00,NULL,1,2,'month','renting',19,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','43.401884','-75.672286',71982,4,2,NULL),(21,'Pumpkin Key - Private Island','sale','<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen sink with drain board and\n    provisions for water purifier , electric hood , exhaust fan will be provided</p>\n','<h4>Kitchen</h4>\n<p>Ceramic tiled flooring, Granite counter top , Single bowl stainless steel kitchen\n    sink with drain board and provisions for water purifier , electric hood , exhaust fan will be provided</p>\n<br>\n<h4>Toilets</h4>\n<p>Anti-skid Ceramic tiles on floor and ceramic wall tiles up to 7 feet height. White\n    coloured branded sanitary fittings, Chromium plated taps , concealed plumbing</p>\n<br>\n<h4>Doors</h4>\n<p>Main door will be high quality wooden door, premium Windows quality pre-hung internal\n    doors with wooded frame, UPVC or aluminum sliding doors and aluminum frame with glass for windows</p>\n<ul>\n    <li> 9 km to Katunayaka airport expressway entrance</li>\n    <li> 12 km to Southern expressway entrance at Kottawa</li>\n    <li> 2 km to Kalubowila General hospital</li>\n    <li> All leading banks within a few kilometer radii</li>\n    <li> Very close proximity to railway stations</li>\n    <li> Many leading schools including CIS within 5 km radius</li>\n</ul>\n','35032 Ullrich Mountains Suite 849\nWest Murphy, DC 22675','[\"properties\\/8.jpg\",\"properties\\/5.jpg\",\"properties\\/2.jpg\",\"properties\\/3.jpg\",\"properties\\/11.jpg\",\"properties\\/6.jpg\"]',9,9,5,57,490,216900.00,NULL,1,1,'month','selling',2,'Botble\\RealEstate\\Models\\Account','approved','1970-01-01',0,1,'2024-01-16 03:08:15','2024-01-16 03:08:15','42.553159','-75.847479',14608,4,2,NULL);
/*!40000 ALTER TABLE `re_properties` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_properties_translations`
--

DROP TABLE IF EXISTS `re_properties_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_properties_translations` (
  `lang_code` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `re_properties_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `location` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`re_properties_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_properties_translations`
--

LOCK TABLES `re_properties_translations` WRITE;
/*!40000 ALTER TABLE `re_properties_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_properties_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_categories`
--

DROP TABLE IF EXISTS `re_property_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_categories` (
  `property_id` bigint unsigned NOT NULL,
  `category_id` bigint unsigned NOT NULL,
  PRIMARY KEY (`property_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_categories`
--

LOCK TABLES `re_property_categories` WRITE;
/*!40000 ALTER TABLE `re_property_categories` DISABLE KEYS */;
INSERT INTO `re_property_categories` VALUES (1,3),(1,4),(1,5),(1,6),(2,2),(2,6),(3,1),(3,6),(4,2),(4,4),(4,6),(5,1),(5,3),(5,4),(6,3),(6,4),(7,1),(8,3),(8,4),(8,5),(9,2),(9,4),(10,1),(10,5),(10,6),(11,2),(11,6),(12,3),(12,4),(12,6),(13,3),(13,4),(14,1),(14,2),(14,4),(14,5),(15,2),(15,5),(16,2),(16,3),(17,3),(18,2),(18,3),(18,5),(19,3),(20,1),(20,2),(20,3),(20,4),(21,1),(21,3);
/*!40000 ALTER TABLE `re_property_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_property_features`
--

DROP TABLE IF EXISTS `re_property_features`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_property_features` (
  `property_id` bigint unsigned NOT NULL,
  `feature_id` bigint unsigned NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_property_features`
--

LOCK TABLES `re_property_features` WRITE;
/*!40000 ALTER TABLE `re_property_features` DISABLE KEYS */;
/*!40000 ALTER TABLE `re_property_features` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `re_reviews`
--

DROP TABLE IF EXISTS `re_reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `re_reviews` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `account_id` bigint unsigned NOT NULL,
  `reviewable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reviewable_id` bigint unsigned NOT NULL,
  `star` tinyint NOT NULL,
  `content` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'approved',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reviews_unique` (`account_id`,`reviewable_id`,`reviewable_type`),
  KEY `re_reviews_reviewable_type_reviewable_id_index` (`reviewable_type`,`reviewable_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `re_reviews`
--

LOCK TABLES `re_reviews` WRITE;
/*!40000 ALTER TABLE `re_reviews` DISABLE KEYS */;
INSERT INTO `re_reviews` VALUES (1,11,'Botble\\RealEstate\\Models\\Property',4,2,'Alice put down the little golden key and hurried off to other parts of the trees had a head unless there was Mystery,\' the Mock Turtle is.\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(2,8,'Botble\\RealEstate\\Models\\Project',12,5,'Writhing, of course, to begin again, it was sneezing on the same thing as \"I eat what I see\"!\' \'You might just as if he had never been in.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(3,20,'Botble\\RealEstate\\Models\\Project',17,3,'COULD! I\'m sure she\'s the best of educations--in fact, we went to work nibbling at the door of which was the first verse,\' said the Duchess, the Duchess! Oh! won\'t she be savage if I\'ve kept her eyes filled with tears.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(4,1,'Botble\\RealEstate\\Models\\Project',11,5,'Latitude or Longitude either, but thought they were IN the well,\' Alice said to Alice; and Alice looked at Alice. \'It must have been that,\' said the Queen, who was sitting on a crimson velvet cushion; and, last of all this time. \'I want a clean cup,\' interrupted.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(5,8,'Botble\\RealEstate\\Models\\Project',10,3,'Oh, how I wish you were down here till I\'m somebody else\"--but, oh dear!\' cried Alice, jumping.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(6,10,'Botble\\RealEstate\\Models\\Property',7,5,'VERY deeply with a round.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(7,7,'Botble\\RealEstate\\Models\\Project',9,2,'Alice thought to herself \'Suppose it should be free of them were.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(8,1,'Botble\\RealEstate\\Models\\Project',13,5,'Mock Turtle went on again:-- \'You may not have lived much under the sea,\' the Gryphon at the other, and making faces at him as he spoke, and then keep tight hold of it; and the March Hare. Alice was silent. The King looked anxiously over his shoulder with some surprise that the way I.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(9,4,'Botble\\RealEstate\\Models\\Property',2,5,'Pigeon, but in a tone of this was of very little use, as it is.\' \'Then you may stand down,\' continued the Gryphon. Alice did not dare to laugh; and, as she remembered how small.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(10,18,'Botble\\RealEstate\\Models\\Project',16,3,'Hatter, who turned pale and fidgeted. \'Give your evidence,\' said the cook. \'Treacle,\' said the Cat. \'I don\'t think--\' \'Then you shouldn\'t talk,\' said the King said to the door. \'Call the next witness.\' And he got up in.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(11,1,'Botble\\RealEstate\\Models\\Project',9,3,'Knave \'Turn them over!\' The Knave shook his head sadly. \'Do I look like it?\' he said, turning to Alice.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(12,9,'Botble\\RealEstate\\Models\\Property',9,2,'I should think you could see it trot away quietly into the garden with one finger pressed upon its forehead (the position in which case it would all come wrong, and she dropped it hastily, just in time to begin with,\' said.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(13,17,'Botble\\RealEstate\\Models\\Property',16,3,'Alice. \'It must have a prize herself, you know,\' said Alice to.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(14,11,'Botble\\RealEstate\\Models\\Project',8,3,'I can say.\' This was quite pleased to find her way into a line along the sea-shore--\' \'Two lines!\' cried the Gryphon, sighing in his throat,\' said the King. On this the White Rabbit was still.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(15,3,'Botble\\RealEstate\\Models\\Property',14,4,'Gryphon: and Alice called after it; and the sounds will take care of the sort,\' said the March Hare. \'Yes, please do!\' but the Dormouse began in a shrill, loud voice, and see after some executions I have to turn into a pig,\' Alice quietly said, just as she ran. \'How surprised.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(16,17,'Botble\\RealEstate\\Models\\Project',10,3,'Eaglet, and several other curious creatures. Alice led the way, and then keep tight hold of it; so, after hunting all about it!\' Last came a little recovered from the trees behind him. \'--or next day.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(17,3,'Botble\\RealEstate\\Models\\Property',8,5,'With gently smiling jaws!\' \'I\'m.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(18,6,'Botble\\RealEstate\\Models\\Project',15,4,'Alice did not look at me like that!\' said Alice very meekly: \'I\'m growing.\' \'You\'ve no right to think,\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(19,1,'Botble\\RealEstate\\Models\\Project',17,2,'Queen had only one who got any advantage from the Gryphon, \'she wants for to know when the Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(20,1,'Botble\\RealEstate\\Models\\Project',8,5,'Gryphon in an offended tone, and added with a yelp of delight, which changed into alarm in another moment, when she had quite forgotten the Duchess asked, with another hedgehog, which seemed to her feet as the Dormouse.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(21,5,'Botble\\RealEstate\\Models\\Property',18,2,'Yet you turned a back-somersault in at all?\' said the March Hare. \'Sixteenth,\' added the Dormouse, who was beginning to.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(22,14,'Botble\\RealEstate\\Models\\Property',12,5,'Forty-two. ALL PERSONS MORE THAN A MILE HIGH TO LEAVE THE COURT.\' Everybody looked at poor Alice, and tried to fancy what the name \'Alice!\' CHAPTER XII. Alice\'s Evidence \'Here!\' cried Alice, quite forgetting that she had to double themselves up and walking away. \'You.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(23,17,'Botble\\RealEstate\\Models\\Property',6,2,'Come on!\' So they went up to the confused clamour of the Gryphon, sighing in his note-book, cackled out \'Silence!\' and read as follows:-- \'The.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(24,8,'Botble\\RealEstate\\Models\\Property',11,2,'I to get through was more than Alice could hardly hear the very tones of her head made her so savage when they liked, and left foot, so as to the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(25,12,'Botble\\RealEstate\\Models\\Property',19,5,'Five and Seven said nothing, but looked.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(26,20,'Botble\\RealEstate\\Models\\Project',13,4,'Alice remarked. \'Right, as usual,\' said the Caterpillar called after her. \'I\'ve something important to say!\' This sounded promising, certainly: Alice turned and came back again. \'Keep your temper,\' said the Hatter: \'but you could only see her. She is such a capital.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(27,3,'Botble\\RealEstate\\Models\\Property',16,5,'William the Conqueror.\' (For, with all their simple joys, remembering her own child-life, and the Queen left off, quite out of sight; and an Eaglet, and several other.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(28,2,'Botble\\RealEstate\\Models\\Property',1,4,'Alice replied, so eagerly that the pebbles were all crowded round her, about four inches deep and reaching half down the chimney?--Nay, I shan\'t! YOU do it!--That I won\'t, then!--Bill\'s to go and get ready to.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(29,11,'Botble\\RealEstate\\Models\\Property',12,2,'You MUST have meant some mischief, or else you\'d have signed your name like an honest man.\' There was nothing else to do, and perhaps as this is May it won\'t be raving mad after all! I almost wish I could not.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(30,16,'Botble\\RealEstate\\Models\\Project',11,5,'Majesty,\' he began, \'for bringing these in: but I can\'t put it in less than a pig, my dear,\' said Alice, in a low, timid voice, \'If you do. I\'ll set Dinah at you!\' There was a paper label, with the dream of Wonderland of.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(31,13,'Botble\\RealEstate\\Models\\Project',13,3,'I!\' he replied. \'We quarrelled last March--just before HE went mad, you know--\' She had not got into a doze; but, on being pinched by the hedge!\' then.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(32,18,'Botble\\RealEstate\\Models\\Project',11,5,'He says it kills all the jurors were all writing very busily on slates. \'What are they doing?\' Alice whispered to the end: then stop.\' These were the two sides of the Lobster Quadrille, that she began nibbling at the stick, and made another rush at the sudden change, but very politely: \'Did you.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(33,19,'Botble\\RealEstate\\Models\\Property',15,1,'Duchess, who seemed to have it explained,\' said the Gryphon, and all her coaxing. Hardly knowing what she was peering about anxiously among the distant sobs of the same solemn tone, only changing the order of the deepest contempt. \'I\'ve seen a good deal frightened at the end of the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(35,4,'Botble\\RealEstate\\Models\\Project',3,3,'Cheshire cats always grinned; in.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(36,6,'Botble\\RealEstate\\Models\\Property',17,4,'A bright idea came into her eyes; and once again the tiny hands were clasped upon her face. \'Wake up, Alice dear!\' said her sister; \'Why, what are they doing?\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(37,9,'Botble\\RealEstate\\Models\\Project',8,5,'I hadn\'t gone down that rabbit-hole--and yet--and yet--it\'s rather curious, you know, as we needn\'t try to find.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(38,8,'Botble\\RealEstate\\Models\\Project',2,2,'And in she went. Once more she found that it led into a tidy little room with a smile. There was a bright brass plate.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(39,12,'Botble\\RealEstate\\Models\\Property',1,1,'Alice. \'That\'s the first to break the silence. \'What day of the jurors were all in bed!\' On various pretexts they all cheered. Alice thought to herself, and nibbled a little bottle that stood near.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(40,8,'Botble\\RealEstate\\Models\\Project',8,5,'Alice thought over all the jurymen are back in a deep voice, \'are done with a melancholy tone: \'it doesn\'t seem to put.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(41,12,'Botble\\RealEstate\\Models\\Project',1,5,'Gryphon, the squeaking of the gloves, and was a queer-shaped little creature, and held it out loud. \'Thinking again?\' the Duchess to play croquet with the dream of Wonderland of long ago: and how she was a long hookah, and taking.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(44,16,'Botble\\RealEstate\\Models\\Project',5,5,'The Frog-Footman repeated.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(45,5,'Botble\\RealEstate\\Models\\Project',3,5,'English!\' said the Hatter. \'Nor I,\' said the Dormouse; \'VERY ill.\' Alice tried to get.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(46,14,'Botble\\RealEstate\\Models\\Project',4,2,'CHAPTER III. A Caucus-Race and a pair of white kid gloves while she was looking about for it, he was obliged to have lessons to learn! No, I\'ve made up my mind about it; and as it.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(47,7,'Botble\\RealEstate\\Models\\Project',16,4,'May it won\'t be raving mad after all! I almost wish I had it written up.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(48,21,'Botble\\RealEstate\\Models\\Project',2,3,'THAT in a trembling voice:-- \'I passed by his garden, and I could not even get her head in the kitchen that did not quite like the look of things at all, as the door that led into the sky. Twinkle, twinkle--\"\' Here the other two were using it as to go on till you come to the tarts on the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(49,4,'Botble\\RealEstate\\Models\\Property',10,4,'And oh, my poor hands, how is it twelve? I--\' \'Oh, don\'t talk about her any more questions about it, even if my head would go through,\' thought poor Alice, that she was playing against herself, for this time she saw them, they set to work shaking him and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(50,21,'Botble\\RealEstate\\Models\\Project',15,3,'Alice could bear: she got to the baby, it.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(51,12,'Botble\\RealEstate\\Models\\Property',21,4,'King said to herself how she would catch a bat, and that\'s very like a Jack-in-the-box, and up I goes like a snout than a real Turtle.\' These words were followed by a row of lodging houses, and behind them a railway station.) However, she.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(52,13,'Botble\\RealEstate\\Models\\Project',5,2,'Alice. The King and Queen of Hearts, and I shall be a Caucus-race.\' \'What IS the use of a sea of green leaves that had slipped in like herself. \'Would it be murder to leave off this minute!\' She generally gave herself very good advice, (though she very.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(53,12,'Botble\\RealEstate\\Models\\Property',6,2,'Alice would not stoop? Soup of the March Hare. Visit either you like: they\'re both mad.\' \'But I don\'t want to go on crying in.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(54,16,'Botble\\RealEstate\\Models\\Property',17,2,'This time Alice waited patiently until it chose to speak again. The rabbit-hole went straight on like a snout than a rat-hole: she knelt down and looked at the top of her head made her so savage when they had at the picture.) \'Up, lazy.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(55,17,'Botble\\RealEstate\\Models\\Project',6,2,'SOME change in my life!\' Just as she went on \'And how do you know the meaning of it now in sight, and no more to come, so she helped herself to about two feet high, and her face in some book, but I think you\'d better ask HER about it.\' \'She\'s in prison,\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(56,9,'Botble\\RealEstate\\Models\\Project',4,2,'May it won\'t be raving mad--at least not so mad as it left no mark on the end of his tail. \'As if it please your Majesty,\' the Hatter with a round face, and was going to remark myself.\' \'Have you seen the Mock Turtle, and said \'What else have.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(57,5,'Botble\\RealEstate\\Models\\Property',16,2,'Duchess said to the Caterpillar, and the words don\'t FIT you,\' said.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(58,16,'Botble\\RealEstate\\Models\\Property',2,3,'Alice to herself. \'Shy, they seem to see that she had put on her face in her hands, and was just in time to wash the things being alive; for instance, there\'s the arch I\'ve got to the game, the Queen said to herself, \'I wish I hadn\'t begun my tea--not above a week or so--and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(59,16,'Botble\\RealEstate\\Models\\Property',18,4,'Duchess. \'Everything\'s got a moral, if only you can find them.\' As she said to herself, as she leant against a buttercup to rest her chin in salt water. Her first idea was that you weren\'t to talk to.\' \'How are you thinking of?\' \'I beg your pardon!\' cried.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(60,4,'Botble\\RealEstate\\Models\\Project',17,3,'Hatter, it woke up again as quickly as she could. \'No,\' said Alice. \'Did you say \"What a pity!\"?\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(61,15,'Botble\\RealEstate\\Models\\Property',15,1,'VERY wide, but she knew that it made Alice quite hungry to look down and make THEIR eyes bright and eager with many a strange tale.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(62,3,'Botble\\RealEstate\\Models\\Project',17,4,'Alice replied very gravely. \'What else had you to sit down without being invited,\' said the Dormouse crossed the court, \'Bring me the truth: did you manage on.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(63,11,'Botble\\RealEstate\\Models\\Property',3,4,'Alice began to say whether the blows hurt it or not. \'Oh, PLEASE mind what you\'re talking about,\' said Alice. \'That\'s very important,\' the King very decidedly, and he called the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(64,13,'Botble\\RealEstate\\Models\\Project',4,2,'Gryphon went on. \'Or would you like the name: however, it only grinned when it saw Alice. It looked good-natured, she thought: still it had struck her foot! She.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(65,19,'Botble\\RealEstate\\Models\\Project',5,5,'I dare say you\'re wondering why I don\'t put my arm round your waist,\' the Duchess said to live. \'I\'ve.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(66,15,'Botble\\RealEstate\\Models\\Property',7,2,'Mock Turtle. \'No, no! The adventures first,\' said the Caterpillar. \'I\'m afraid I am, sir,\' said Alice; \'living at.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(67,12,'Botble\\RealEstate\\Models\\Property',4,3,'VERY long claws and a crash of broken glass, from which she concluded that it.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(68,14,'Botble\\RealEstate\\Models\\Property',21,5,'Alice. \'I\'ve tried every way, and then raised himself upon tiptoe, put his mouth close to them, and considered a little before she got.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(69,19,'Botble\\RealEstate\\Models\\Project',9,5,'Mock Turtle drew a long and a Canary called out \'The race is over!\' and they repeated their arguments to her, still it had come back and finish your.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(70,13,'Botble\\RealEstate\\Models\\Property',10,5,'There was a little snappishly. \'You\'re enough to drive one crazy!\' The Footman seemed to her to wink with one of the sense, and the Mock Turtle. \'Very much indeed,\' said Alice. \'Why not?\' said the Hatter. \'You might just as usual. \'Come, there\'s no use in knocking,\' said the March Hare. Alice was.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(71,6,'Botble\\RealEstate\\Models\\Project',5,3,'I grow up, I\'ll write one--but I\'m grown up now,\' she said, \'than waste it in her French lesson-book. The Mouse only.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(74,7,'Botble\\RealEstate\\Models\\Property',2,2,'France-- Then turn not pale, beloved snail, but come and join the dance. So they.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(75,19,'Botble\\RealEstate\\Models\\Project',12,3,'Queen, \'Really, my dear, I think?\' \'I had NOT!\' cried the Mouse, sharply and very neatly and simply arranged; the only difficulty was, that if you only walk long enough.\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(76,17,'Botble\\RealEstate\\Models\\Property',9,4,'Why, there\'s hardly room to grow up any more HERE.\' \'But then,\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(77,7,'Botble\\RealEstate\\Models\\Project',1,3,'Normans--\" How are you thinking of?\' \'I beg your pardon!\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(78,20,'Botble\\RealEstate\\Models\\Project',9,2,'I\'m a deal faster than it does.\' \'Which would NOT be an advantage,\' said Alice, whose thoughts.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(79,14,'Botble\\RealEstate\\Models\\Project',1,1,'VERY wide, but she did not look at it!\' This speech caused a.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(80,9,'Botble\\RealEstate\\Models\\Property',8,4,'King say in a tone of the Gryphon, \'she wants for to know your history, she do.\' \'I\'ll tell it her,\' said the Caterpillar. \'Is that the Gryphon went on. Her listeners were perfectly quiet till she was.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(81,18,'Botble\\RealEstate\\Models\\Property',9,2,'I hadn\'t drunk quite so much!\' said.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(82,18,'Botble\\RealEstate\\Models\\Project',14,3,'I\'ve got to?\' (Alice had no very clear notion how long ago anything had happened.) So she stood looking at the Footman\'s head: it just at present--at least I know is, it would be four thousand miles.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(83,12,'Botble\\RealEstate\\Models\\Property',3,3,'I chose,\' the Duchess replied, in a shrill, passionate voice. \'Would YOU like cats if.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(84,8,'Botble\\RealEstate\\Models\\Property',14,2,'And it\'ll fetch things when you throw them, and all would change (she knew) to the jury, and the Queen\'s shrill cries to the table, but there was a general chorus of voices asked. \'Why, SHE, of course,\' said the Hatter. \'Stolen!\' the King in a melancholy tone. \'Nobody seems to be ashamed of.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(85,2,'Botble\\RealEstate\\Models\\Project',7,1,'As she said to herself, \'in my going out altogether, like.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(86,7,'Botble\\RealEstate\\Models\\Project',15,3,'Caterpillar. \'Well, perhaps not,\' said the Knave, \'I didn\'t mean it!\' pleaded poor Alice.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(87,10,'Botble\\RealEstate\\Models\\Project',11,4,'Alice: he had never left off quarrelling with the clock. For instance, if you cut your finger VERY deeply with a kind of thing never happened, and now here I.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(88,3,'Botble\\RealEstate\\Models\\Project',18,5,'No, I\'ve made up my mind about it; and the other paw, \'lives a March Hare. \'Yes, please do!\' but the Dodo could not think of anything else. CHAPTER V. Advice from a Caterpillar The Caterpillar and Alice looked at the Hatter, \'when the Queen.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(89,21,'Botble\\RealEstate\\Models\\Property',2,2,'HE was.\' \'I never could abide figures!\' And with that she ran off as hard as she said to herself, \'if one only knew the name \'W. RABBIT\' engraved upon it. She went on just as well be at school at once.\' And in she.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(90,10,'Botble\\RealEstate\\Models\\Property',21,4,'Alice could think of any one; so, when the tide rises and sharks are around, His voice has a timid voice at her with large round eyes, and half believed herself in a minute. Alice began in a hoarse, feeble voice: \'I heard every.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(91,16,'Botble\\RealEstate\\Models\\Property',20,2,'She took down a large pigeon had flown into her eyes; and once again the tiny hands were.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(92,13,'Botble\\RealEstate\\Models\\Property',12,1,'March Hare,) \'--it was at in all my life, never!\' They had a head unless there was.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(93,11,'Botble\\RealEstate\\Models\\Project',13,1,'And the moral of that is--\"Be what you would seem to dry me at all.\' \'In that case,\' said the Hatter; \'so I should think it.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(94,12,'Botble\\RealEstate\\Models\\Property',15,5,'Dormouse began in a natural way. \'I thought you did,\' said the Dormouse, without considering at all like the largest telescope that ever.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(95,9,'Botble\\RealEstate\\Models\\Property',7,1,'Queen: so she bore it as you might do very well without--Maybe it\'s always pepper that had fluttered down from the shock of being upset, and their slates and pencils had been running half an hour or so, and giving it something out of sight, he said to herself, \'the way all the same, the next.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(96,8,'Botble\\RealEstate\\Models\\Project',1,1,'White Rabbit, jumping up in a few minutes it puffed away without speaking, but at any rate: go and get ready.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(97,15,'Botble\\RealEstate\\Models\\Project',1,4,'Alice was a very difficult question. However, at last the Gryphon remarked.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(98,3,'Botble\\RealEstate\\Models\\Property',15,2,'Caterpillar. \'I\'m afraid I can\'t show it you myself,\' the Mock Turtle said: \'I\'m too stiff. And the Eaglet bent down its head impatiently, and said, \'It WAS a narrow.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(99,15,'Botble\\RealEstate\\Models\\Property',1,2,'Alice ventured to say. \'What is it?\' he said. (Which he certainly did NOT, being made entirely of cardboard.) \'All right, so far,\' said the Hatter said, turning to the other end of.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(100,6,'Botble\\RealEstate\\Models\\Project',17,1,'I don\'t put my arm round your waist,\' the Duchess was VERY ugly; and secondly, because she was walking by the way the people that walk with their hands and feet at the frontispiece if you please! \"William the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(101,7,'Botble\\RealEstate\\Models\\Property',15,2,'Soup,\" will you, old fellow?\' The Mock Turtle in a low curtain she had this fit) An obstacle that came between Him, and ourselves, and it. Don\'t let me help to undo it!\' \'I shall sit here,\' he said, turning to the other: the Duchess to play croquet.\' Then they both cried. \'Wake up.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(102,5,'Botble\\RealEstate\\Models\\Property',13,1,'Dormouse go on with the time,\' she said to herself. \'I dare say you\'re wondering why I don\'t remember where.\' \'Well, it must be shutting up like a thunderstorm. \'A fine day, your Majesty!\' the Duchess by this time, and was.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(103,3,'Botble\\RealEstate\\Models\\Property',10,5,'Alice, rather alarmed at the Lizard in head downwards, and the White Rabbit, who was gently brushing away some dead leaves that lay far below her. \'What CAN all that green stuff be?\' said Alice. \'It goes on, you know,\' Alice.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(104,18,'Botble\\RealEstate\\Models\\Project',18,3,'This did not like the Mock Turtle to the Classics master, though. He was an old Crab took the cauldron of soup off the mushroom, and raised herself to some tea and bread-and-butter, and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(106,5,'Botble\\RealEstate\\Models\\Project',6,4,'IS that to be said. At last the Mouse, frowning, but very.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(107,13,'Botble\\RealEstate\\Models\\Property',14,4,'I can find it.\' And she tried the roots of trees, and I\'ve tried hedges,\' the Pigeon in a VERY unpleasant state of mind, she turned to the little golden key in the other: he came.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(108,2,'Botble\\RealEstate\\Models\\Project',15,5,'So she began: \'O Mouse, do you know about it, even if I know all sorts of things--I can\'t remember things as I tell you!\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(109,17,'Botble\\RealEstate\\Models\\Property',14,4,'Gryphon. \'I mean, what makes them bitter--and--and barley-sugar and such things that make children sweet-tempered. I only wish they WOULD go with Edgar Atheling to meet William and offer him the crown. William\'s conduct at first was in confusion, getting the Dormouse shall!\' they both cried.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(110,14,'Botble\\RealEstate\\Models\\Property',11,1,'Queen, who was sitting on the song, perhaps?\' \'I\'ve heard something like this:-- \'Fury said.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(112,3,'Botble\\RealEstate\\Models\\Property',21,2,'Alice remarked. \'Oh, you foolish Alice!\' she answered herself. \'How can.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(114,8,'Botble\\RealEstate\\Models\\Project',5,3,'Father William replied to his son, \'I feared it might not escape again, and we won\'t talk about cats or dogs either, if you were never even introduced to a day-school, too,\' said Alice; not that she did it at all; and I\'m I.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(115,14,'Botble\\RealEstate\\Models\\Property',7,2,'William\'s conduct at first was in livery: otherwise, judging by his garden.\"\' Alice did not like to be sure, this.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(116,11,'Botble\\RealEstate\\Models\\Property',5,3,'How brave they\'ll all think me at all.\' \'In that case,\' said the Mock Turtle to sing this:-- \'Beautiful Soup, so rich and green, Waiting in a languid, sleepy voice. \'Who are YOU?\' Which brought them back again to the little golden key and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(117,9,'Botble\\RealEstate\\Models\\Project',1,3,'Mouse in the last words out loud, and the Queen shouted at the proposal.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(118,19,'Botble\\RealEstate\\Models\\Property',4,5,'For anything tougher than suet; Yet you finished the goose, with the words came very queer to ME.\' \'You!\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(119,11,'Botble\\RealEstate\\Models\\Property',21,1,'Latin Grammar, \'A mouse--of a mouse--to a.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(120,4,'Botble\\RealEstate\\Models\\Property',8,5,'Never heard of such a subject! Our family always HATED cats: nasty, low, vulgar things! Don\'t let me help to undo.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(122,8,'Botble\\RealEstate\\Models\\Project',16,3,'King added in a trembling voice to a snail. \"There\'s a porpoise close behind us, and he\'s treading on her face brightened up again.) \'Please your Majesty,\' the Hatter continued, \'in this way:-- \"Up above the world am I? Ah, THAT\'S the great hall, with the glass table as.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(123,6,'Botble\\RealEstate\\Models\\Property',14,4,'Mock Turtle, \'they--you\'ve seen them, of course?\' \'Yes,\' said Alice, rather doubtfully, as she could not join the dance. \'\"What matters it how far we go?\" his scaly friend replied. \"There is.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(124,13,'Botble\\RealEstate\\Models\\Project',16,4,'She did not like to be talking in his note-book, cackled out \'Silence!\' and read as follows:-- \'The Queen of Hearts, who only bowed and smiled in reply. \'Idiot!\' said the Mock Turtle in a soothing tone: \'don\'t be angry about.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(127,5,'Botble\\RealEstate\\Models\\Project',4,4,'Even the Duchess said in a furious passion, and went in. The door led right into a conversation. \'You don\'t know what to say \'I once tasted--\' but checked herself hastily. \'I thought you did,\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(128,20,'Botble\\RealEstate\\Models\\Property',16,4,'NOT marked \'poison,\' so Alice ventured to remark. \'Tut, tut, child!\' said the Duchess; \'and most of \'em do.\' \'I don\'t quite understand you,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she was not a VERY good opportunity for showing off a bit afraid of.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(129,7,'Botble\\RealEstate\\Models\\Property',6,2,'I\'ve finished.\' So they had to stop and untwist it.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(130,16,'Botble\\RealEstate\\Models\\Property',14,1,'Dodo solemnly, rising to its children, \'Come away, my dears! It\'s.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(132,17,'Botble\\RealEstate\\Models\\Project',18,1,'I wonder if I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(133,2,'Botble\\RealEstate\\Models\\Property',13,3,'BUSY BEE,\" but it puzzled her too much, so she felt that it was very glad to find quite a commotion in the last word two or three of her hedgehog. The hedgehog was engaged in a hurry to get very tired of being all.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(134,8,'Botble\\RealEstate\\Models\\Property',16,4,'Queen. \'Can you play croquet?\' The soldiers were always getting up and said, \'It was the BEST butter, you.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(136,4,'Botble\\RealEstate\\Models\\Project',8,5,'I can reach the key; and if the Mock Turtle sang this, very slowly and sadly:-- \'\"Will you walk a little glass box that was said, and went by without noticing her. Then followed the Knave was standing before them.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(137,16,'Botble\\RealEstate\\Models\\Project',6,3,'Queen, turning purple. \'I won\'t!\' said Alice. \'Did you speak?\' \'Not I!\' said the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(138,7,'Botble\\RealEstate\\Models\\Project',17,4,'I only wish people knew that: then they both bowed low, and their slates and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(139,11,'Botble\\RealEstate\\Models\\Project',14,1,'Alice. \'Well, then,\' the Gryphon answered, very nearly getting up and went to school in the after-time, be herself a grown woman; and how she was about a whiting before.\' \'I can tell you how the Dodo replied very readily: \'but that\'s because.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(140,2,'Botble\\RealEstate\\Models\\Project',5,2,'Mock Turtle at last, and managed to put the Dormouse denied nothing, being fast asleep. \'After that,\' continued the Hatter, \'when the Queen said--\' \'Get to.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(141,2,'Botble\\RealEstate\\Models\\Project',2,5,'But at any rate I\'ll never go THERE again!\' said Alice indignantly, and she felt sure it would.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(142,2,'Botble\\RealEstate\\Models\\Project',16,5,'Hardly knowing what she was in the distance, screaming with passion. She had just begun \'Well, of all her knowledge of history, Alice had.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(143,3,'Botble\\RealEstate\\Models\\Project',6,3,'ONE.\' \'One, indeed!\' said Alice, rather doubtfully, as she spoke; \'either you or your head must be off, and had to fall.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(144,16,'Botble\\RealEstate\\Models\\Property',8,2,'But do cats eat bats, I wonder?\' As she said to the Dormouse, without considering at all fairly,\' Alice began, in a tone of this rope--Will the roof bear?--Mind that loose slate--Oh, it\'s.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(145,5,'Botble\\RealEstate\\Models\\Property',6,4,'I\'m never sure what I\'m going to dive in among the party. Some of the month is it?\' \'Why,\' said the King, \'or I\'ll have you executed, whether you\'re a little ledge of rock, and, as the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(146,17,'Botble\\RealEstate\\Models\\Project',12,5,'I\'ll look first,\' she said, \'and see whether it\'s marked \"poison\" or not\'; for she felt sure she would get up and went on in a low, hurried tone. He looked at Alice, as she swam nearer to watch them, and the other end of the song, she kept on.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(147,2,'Botble\\RealEstate\\Models\\Property',12,2,'But they HAVE their tails fast in their mouths. So they began solemnly dancing round and get ready to make out what it was: at first she thought at first was in livery: otherwise, judging by his garden.\"\' Alice did not like to hear the name of nearly.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(148,14,'Botble\\RealEstate\\Models\\Property',5,2,'I am! But I\'d better take him his fan and a scroll of.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(149,21,'Botble\\RealEstate\\Models\\Property',5,2,'Alice cautiously replied, not feeling at all what had become of it; then Alice put down her flamingo, and began staring at the flowers and those cool fountains, but she had gone through that day. \'A.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(150,20,'Botble\\RealEstate\\Models\\Property',11,3,'I shall have to ask his neighbour to tell me who YOU are, first.\' \'Why?\' said the Mouse, in a large cat which was a body to cut it off from: that he shook both his.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(152,9,'Botble\\RealEstate\\Models\\Property',17,1,'Alice called out to her great delight it.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(153,8,'Botble\\RealEstate\\Models\\Property',7,1,'Do you think I can do no more, whatever happens. What WILL become of it; and while she ran, as well as she spoke. Alice did not like to be found: all she could see it trot away quietly into the air off all its feet at once, in a twinkling! Half-past one.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(155,11,'Botble\\RealEstate\\Models\\Project',16,2,'Caterpillar contemptuously. \'Who are YOU?\' said the Duchess, \'and that\'s the jury-box,\' thought Alice, as she went on in a few minutes that she was always ready to.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(157,20,'Botble\\RealEstate\\Models\\Property',2,3,'And the muscular strength, which it gave to my right size again; and the White Rabbit, trotting slowly back again, and went to the shore, and then said, \'It was the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(158,3,'Botble\\RealEstate\\Models\\Project',7,4,'Gryphon interrupted in a great letter, nearly as she added, \'and the moral of that is--\"Be what you mean,\' the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(161,21,'Botble\\RealEstate\\Models\\Project',14,5,'Queen added to one of the conversation. Alice replied, so eagerly that the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(162,11,'Botble\\RealEstate\\Models\\Project',6,1,'I\'ll be jury,\" Said cunning old Fury: \"I\'ll try the patience of an oyster!\' \'I wish the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(163,15,'Botble\\RealEstate\\Models\\Project',13,5,'There were doors all round the refreshments!\' But there seemed to be a lesson to you to death.\"\' \'You are old,\' said the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(164,10,'Botble\\RealEstate\\Models\\Project',5,4,'Good-bye, feet!\' (for when she caught it, and burning with curiosity, she ran off at once: one old Magpie began wrapping.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(165,12,'Botble\\RealEstate\\Models\\Property',11,3,'Alice said very humbly; \'I won\'t have any pepper in my time, but never ONE with such a noise inside, no one could possibly hear you.\' And certainly there was silence for some time without interrupting it. \'They must go by the little door: but, alas! the little.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(166,21,'Botble\\RealEstate\\Models\\Project',16,3,'You see, she came in sight of the teacups as the jury consider their verdict,\' the King said to the rose-tree, she went on. \'I do,\' Alice hastily replied; \'only one doesn\'t like changing so often, you know.\' \'Not the same thing a bit!\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(167,3,'Botble\\RealEstate\\Models\\Project',12,5,'Footman, and began an account of the treat. When the procession came opposite to Alice, and looking anxiously about as she picked.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(168,6,'Botble\\RealEstate\\Models\\Project',6,5,'Duchess was VERY ugly; and secondly, because she was beginning very angrily, but the Mouse only shook its head impatiently, and said, without even.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(169,6,'Botble\\RealEstate\\Models\\Property',2,5,'I was going off into a large kitchen, which was the Cat remarked. \'Don\'t be impertinent,\' said the Hatter. \'He won\'t stand.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(171,19,'Botble\\RealEstate\\Models\\Property',10,5,'Will you, won\'t you join the dance. So they began running about in all their simple sorrows, and find a thing,\' said the Caterpillar. \'Well, perhaps your feelings may be different,\' said Alice; \'all I know is, it would be.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(172,5,'Botble\\RealEstate\\Models\\Project',16,5,'King, going up to her daughter \'Ah, my dear! I shall never get to the Classics master, though. He was looking about for them, but they all stopped and looked at poor Alice, \'to pretend to be.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(173,10,'Botble\\RealEstate\\Models\\Project',12,1,'I must be kind to them,\' thought Alice, \'or perhaps they won\'t walk the way down one side and up the.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(174,14,'Botble\\RealEstate\\Models\\Project',3,1,'It means much the most interesting, and perhaps as this before, never! And I declare it\'s too bad, that it led into a conversation. \'You don\'t know where Dinn may be,\' said the Caterpillar. Alice thought this must.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(175,20,'Botble\\RealEstate\\Models\\Project',7,5,'I shall only look up and say \"How doth the little--\"\' and she very soon.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(176,17,'Botble\\RealEstate\\Models\\Property',10,3,'OUTSIDE.\' He unfolded the paper as he wore his crown over the verses the White Rabbit; \'in fact, there\'s nothing written on the bank, with her friend. When she got back to them, and it\'ll sit up and say \"How doth the little--\"\' and she had somehow.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(177,14,'Botble\\RealEstate\\Models\\Property',1,2,'Alice crouched down among the leaves, which she found it advisable--\"\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(178,17,'Botble\\RealEstate\\Models\\Project',9,5,'Rabbit actually TOOK A WATCH OUT OF ITS WAISTCOAT-POCKET, and looked at it again: but he.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(180,16,'Botble\\RealEstate\\Models\\Property',9,2,'Alice, \'it\'ll never do to come before that!\' \'Call the next thing is, to get in at once.\'.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(181,7,'Botble\\RealEstate\\Models\\Property',8,3,'They\'re dreadfully fond of pretending to be treated with respect. \'Cheshire Puss,\' she began, in a sulky tone, as it went. So she began again: \'Ou est ma chatte?\' which was full of tears, but.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(182,19,'Botble\\RealEstate\\Models\\Project',15,3,'When the Mouse was bristling all over, and both the hedgehogs were out of breath, and said to the Mock Turtle in the distance. \'Come on!\' cried the Gryphon. \'How the creatures wouldn\'t be so stingy about it, you know--\' \'What did they live at.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(185,21,'Botble\\RealEstate\\Models\\Property',3,2,'Alice soon began talking to herself, as usual. \'Come, there\'s half my plan done now! How puzzling all these strange Adventures of hers would, in the distance, screaming with passion. She had just upset the milk-jug into his cup of tea, and looked into its.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(186,18,'Botble\\RealEstate\\Models\\Project',13,4,'As she said to a farmer, you know, upon the other.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(188,15,'Botble\\RealEstate\\Models\\Project',12,3,'Duchess said after a minute or two to think about it, even if I can creep under the table: she opened it, and then hurried on, Alice.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(189,1,'Botble\\RealEstate\\Models\\Project',18,5,'Alice, in a great hurry. An enormous puppy was looking down at her for a baby: altogether Alice did not like to be a walrus or hippopotamus, but then.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(190,10,'Botble\\RealEstate\\Models\\Property',15,1,'And mentioned me to him: She gave me a good character, But said I didn\'t!\' interrupted Alice. \'You did,\' said the Hatter: \'I\'m on the floor: in another moment, when she looked up, but it was a different person then.\' \'Explain all that,\' said.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(191,19,'Botble\\RealEstate\\Models\\Project',17,3,'March Hare had just begun \'Well, of all this time. \'I want a clean cup,\' interrupted the Gryphon. Alice did not feel encouraged to ask any more questions about it, even if I can reach the key; and if.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(192,15,'Botble\\RealEstate\\Models\\Project',9,1,'Hatter asked triumphantly. Alice did not seem to have any pepper in my size; and as he could go. Alice took up the little thing howled so, that he had come back again, and the little creature down, and nobody spoke for some way of nursing it, (which was to get out.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(193,12,'Botble\\RealEstate\\Models\\Property',9,2,'Our family always HATED cats: nasty, low, vulgar things! Don\'t let me help to undo it!\' \'I shall be late!\' (when she thought it over here,\' said the Duchess; \'and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(194,5,'Botble\\RealEstate\\Models\\Property',19,3,'WHAT?\' thought Alice to herself, as she spoke; \'either you or your head must be kind to them,\' thought Alice, \'they\'re sure to happen,\' she said to herself. Imagine her surprise, when the Rabbit.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(195,3,'Botble\\RealEstate\\Models\\Property',5,5,'Queen, pointing to Alice again. \'No, I give it up,\' Alice replied: \'what\'s the answer?\' \'I haven\'t the least notice of them attempted to explain the paper. \'If there\'s no harm in trying.\' So.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(196,18,'Botble\\RealEstate\\Models\\Property',2,3,'I wish I hadn\'t gone down that rabbit-hole--and yet--and.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(197,16,'Botble\\RealEstate\\Models\\Project',1,3,'On various pretexts they all spoke at once, she found this a good opportunity for croqueting one of the house till she shook the house, and the other ladder?--Why, I.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15'),(199,1,'Botble\\RealEstate\\Models\\Property',2,3,'I was thinking I should like to try the whole court was a general chorus of \'There goes Bill!\' then the Rabbit\'s little white kid gloves while she ran, as well as she.','approved','2024-01-16 03:08:15','2024-01-16 03:08:15');
/*!40000 ALTER TABLE `re_reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `revisions`
--

DROP TABLE IF EXISTS `revisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `revisions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `revisionable_type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revisionable_id` bigint unsigned NOT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `old_value` text COLLATE utf8mb4_unicode_ci,
  `new_value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `revisions_revisionable_id_revisionable_type_index` (`revisionable_id`,`revisionable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `revisions`
--

LOCK TABLES `revisions` WRITE;
/*!40000 ALTER TABLE `revisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `revisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_users`
--

DROP TABLE IF EXISTS `role_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_users` (
  `user_id` bigint unsigned NOT NULL,
  `role_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `role_users_user_id_index` (`user_id`),
  KEY `role_users_role_id_index` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_users`
--

LOCK TABLES `role_users` WRITE;
/*!40000 ALTER TABLE `role_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `created_by` bigint unsigned NOT NULL,
  `updated_by` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_slug_unique` (`slug`),
  KEY `roles_created_by_index` (`created_by`),
  KEY `roles_updated_by_index` (`updated_by`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'admin','Admin','{\"users.index\":true,\"users.create\":true,\"users.edit\":true,\"users.destroy\":true,\"roles.index\":true,\"roles.create\":true,\"roles.edit\":true,\"roles.destroy\":true,\"core.system\":true,\"core.manage.license\":true,\"extensions.index\":true,\"media.index\":true,\"files.index\":true,\"files.create\":true,\"files.edit\":true,\"files.trash\":true,\"files.destroy\":true,\"folders.index\":true,\"folders.create\":true,\"folders.edit\":true,\"folders.trash\":true,\"folders.destroy\":true,\"settings.index\":true,\"settings.options\":true,\"settings.email\":true,\"settings.media\":true,\"settings.cronjob\":true,\"settings.admin-appearance\":true,\"settings.cache\":true,\"settings.datatables\":true,\"settings.email.rules\":true,\"menus.index\":true,\"menus.create\":true,\"menus.edit\":true,\"menus.destroy\":true,\"optimize.settings\":true,\"pages.index\":true,\"pages.create\":true,\"pages.edit\":true,\"pages.destroy\":true,\"plugins.index\":true,\"plugins.edit\":true,\"plugins.remove\":true,\"plugins.marketplace\":true,\"core.appearance\":true,\"theme.index\":true,\"theme.activate\":true,\"theme.remove\":true,\"theme.options\":true,\"theme.custom-css\":true,\"theme.custom-js\":true,\"theme.custom-html\":true,\"widgets.index\":true,\"analytics.general\":true,\"analytics.page\":true,\"analytics.browser\":true,\"analytics.referrer\":true,\"analytics.settings\":true,\"audit-log.index\":true,\"audit-log.destroy\":true,\"backups.index\":true,\"backups.create\":true,\"backups.restore\":true,\"backups.destroy\":true,\"plugins.blog\":true,\"posts.index\":true,\"posts.create\":true,\"posts.edit\":true,\"posts.destroy\":true,\"categories.index\":true,\"categories.create\":true,\"categories.edit\":true,\"categories.destroy\":true,\"tags.index\":true,\"tags.create\":true,\"tags.edit\":true,\"tags.destroy\":true,\"blog.settings\":true,\"plugins.captcha\":true,\"captcha.settings\":true,\"contacts.index\":true,\"contacts.edit\":true,\"contacts.destroy\":true,\"contact.settings\":true,\"plugin.faq\":true,\"faq.index\":true,\"faq.create\":true,\"faq.edit\":true,\"faq.destroy\":true,\"faq_category.index\":true,\"faq_category.create\":true,\"faq_category.edit\":true,\"faq_category.destroy\":true,\"faqs.settings\":true,\"languages.index\":true,\"languages.create\":true,\"languages.edit\":true,\"languages.destroy\":true,\"plugin.location\":true,\"country.index\":true,\"country.create\":true,\"country.edit\":true,\"country.destroy\":true,\"state.index\":true,\"state.create\":true,\"state.edit\":true,\"state.destroy\":true,\"city.index\":true,\"city.create\":true,\"city.edit\":true,\"city.destroy\":true,\"location.bulk-import.index\":true,\"location.export.index\":true,\"newsletter.index\":true,\"newsletter.destroy\":true,\"newsletter.settings\":true,\"payment.index\":true,\"payments.settings\":true,\"payment.destroy\":true,\"plugins.real-estate\":true,\"real-estate.settings\":true,\"property.index\":true,\"property.create\":true,\"property.edit\":true,\"property.destroy\":true,\"project.index\":true,\"project.create\":true,\"project.edit\":true,\"project.destroy\":true,\"property_feature.index\":true,\"property_feature.create\":true,\"property_feature.edit\":true,\"property_feature.destroy\":true,\"investor.index\":true,\"investor.create\":true,\"investor.edit\":true,\"investor.destroy\":true,\"review.index\":true,\"review.create\":true,\"review.edit\":true,\"review.destroy\":true,\"consult.index\":true,\"consult.create\":true,\"consult.edit\":true,\"consult.destroy\":true,\"property_category.index\":true,\"property_category.create\":true,\"property_category.edit\":true,\"property_category.destroy\":true,\"facility.index\":true,\"facility.create\":true,\"facility.edit\":true,\"facility.destroy\":true,\"account.index\":true,\"account.create\":true,\"account.edit\":true,\"account.destroy\":true,\"package.index\":true,\"package.create\":true,\"package.edit\":true,\"package.destroy\":true,\"consults.index\":true,\"consults.edit\":true,\"consults.destroy\":true,\"real-estate.custom-fields.index\":true,\"real-estate.custom-fields.create\":true,\"real-estate.custom-fields.edit\":true,\"real-estate.custom-fields.destroy\":true,\"invoice.index\":true,\"invoice.edit\":true,\"invoice.destroy\":true,\"invoice.template\":true,\"import-properties.index\":true,\"export-properties.index\":true,\"import-projects.index\":true,\"export-projects.index\":true,\"coupons.index\":true,\"coupons.destroy\":true,\"real-estate.settings.general\":true,\"real-estate.settings.currencies\":true,\"real-estate.settings.accounts\":true,\"real-estate.settings.invoices\":true,\"real-estate.settings.invoice-template\":true,\"social-login.settings\":true,\"testimonial.index\":true,\"testimonial.create\":true,\"testimonial.edit\":true,\"testimonial.destroy\":true,\"plugins.translation\":true,\"translations.locales\":true,\"translations.theme-translations\":true,\"translations.index\":true}','Admin users role',1,2,2,'2024-01-16 03:08:07','2024-01-16 03:08:07');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `settings`
--

DROP TABLE IF EXISTS `settings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `settings` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `settings`
--

LOCK TABLES `settings` WRITE;
/*!40000 ALTER TABLE `settings` DISABLE KEYS */;
INSERT INTO `settings` VALUES (2,'api_enabled','0',NULL,'2024-01-16 03:08:07'),(3,'activated_plugins','[\"language\",\"language-advanced\",\"analytics\",\"audit-log\",\"backup\",\"blog\",\"captcha\",\"contact\",\"cookie-consent\",\"faq\",\"location\",\"newsletter\",\"payment\",\"paypal\",\"paystack\",\"razorpay\",\"real-estate\",\"rss-feed\",\"social-login\",\"sslcommerz\",\"stripe\",\"testimonial\",\"translation\"]',NULL,'2024-01-16 03:08:07'),(6,'language_hide_default','1',NULL,'2024-01-16 03:08:07'),(7,'language_switcher_display','dropdown',NULL,'2024-01-16 03:08:07'),(8,'language_display','all',NULL,'2024-01-16 03:08:07'),(9,'language_hide_languages','[]',NULL,'2024-01-16 03:08:07'),(10,'media_random_hash','81b989f93d97d528454364472dc82286',NULL,NULL),(11,'theme','hously',NULL,NULL),(12,'show_admin_bar','1',NULL,NULL),(15,'permalink-botble-blog-models-post','news',NULL,NULL),(16,'permalink-botble-blog-models-category','news',NULL,NULL),(17,'payment_cod_status','1',NULL,NULL),(18,'payment_cod_description','Please pay money directly to the postman, if you choose cash on delivery method (COD).',NULL,NULL),(19,'payment_bank_transfer_status','1',NULL,NULL),(20,'payment_bank_transfer_description','Please send money to our bank account: ACB - 69270 213 19.',NULL,NULL),(21,'payment_stripe_payment_type','stripe_checkout',NULL,NULL),(22,'admin_logo','general/logo-light.png',NULL,NULL),(23,'admin_favicon','general/favicon.png',NULL,NULL),(25,'cookie_consent_message','Your experience on this site will be improved by allowing cookies',NULL,NULL),(26,'cookie_consent_learn_more_url','https://hously.test/cookie-policy',NULL,NULL),(27,'cookie_consent_learn_more_text','Cookie Policy',NULL,NULL),(28,'real_estate_enable_review_feature','1',NULL,NULL),(29,'real_estate_reviews_per_page','10',NULL,NULL),(30,'theme-hously-site_title','Hously',NULL,NULL),(31,'theme-hously-seo_title','Find your favorite homes at Hously',NULL,NULL),(32,'theme-hously-site_description','A great platform to buy, sell and rent your properties without any agent or commissions.',NULL,NULL),(33,'theme-hously-seo_description','A great platform to buy, sell and rent your properties without any agent or commissions.',NULL,NULL),(34,'theme-hously-copyright','© 2024 Archi Elite JSC. All right reserved.',NULL,NULL),(35,'theme-hously-favicon','general/favicon.png',NULL,NULL),(36,'theme-hously-logo','general/logo-light.png',NULL,NULL),(37,'theme-hously-logo_dark','general/logo-dark.png',NULL,NULL),(38,'theme-hously-404_page_image','general/error.png',NULL,NULL),(39,'theme-hously-primary_font','League Spartan',NULL,NULL),(40,'theme-hously-primary_color','#16a34a',NULL,NULL),(41,'theme-hously-secondary_color','#15803D',NULL,NULL),(42,'theme-hously-homepage_id','1',NULL,NULL),(43,'theme-hously-authentication_enable_snowfall_effect','1',NULL,NULL),(44,'theme-hously-authentication_background_image','backgrounds/01.jpg',NULL,NULL),(45,'theme-hously-categories_background_image','backgrounds/01.jpg',NULL,NULL),(46,'theme-hously-logo_authentication_page','general/logo-authentication-page.png',NULL,NULL),(47,'theme-hously-default_page_cover_image','backgrounds/01.jpg',NULL,NULL),(48,'theme-hously-projects_list_page_id','5',NULL,NULL),(49,'theme-hously-properties_list_page_id','6',NULL,NULL),(50,'theme-hously-blog_page_id','14',NULL,NULL),(51,'theme-hously-projects_list_layout','grid',NULL,NULL),(52,'theme-hously-properties_list_layout','grid',NULL,NULL),(53,'theme-hously-number_of_related_properties','6',NULL,NULL),(54,'theme-hously-social_links','[[{\"key\":\"social-name\",\"value\":\"Facebook\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-facebook\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"Instagram\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-instagram\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"Twitter\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-twitter\"},{\"key\":\"social-url\",\"value\":\"#\"}],[{\"key\":\"social-name\",\"value\":\"LinkedIn\"},{\"key\":\"social-icon\",\"value\":\"mdi mdi-linkedin\"},{\"key\":\"social-url\",\"value\":\"#\"}]]',NULL,NULL),(55,'theme-hously-enabled_toggle_theme_mode','1',NULL,NULL),(56,'theme-hously-default_theme_mode','system',NULL,NULL),(57,'theme-hously-show_whatsapp_button_on_consult_form','1',NULL,NULL);
/*!40000 ALTER TABLE `settings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs`
--

DROP TABLE IF EXISTS `slugs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reference_id` bigint unsigned NOT NULL,
  `reference_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `slugs_reference_id_index` (`reference_id`),
  KEY `slugs_key_index` (`key`),
  KEY `slugs_prefix_index` (`prefix`),
  KEY `slugs_reference_index` (`reference_id`,`reference_type`)
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs`
--

LOCK TABLES `slugs` WRITE;
/*!40000 ALTER TABLE `slugs` DISABLE KEYS */;
INSERT INTO `slugs` VALUES (1,'apartment',1,'Botble\\RealEstate\\Models\\Category','property-category','2024-01-16 03:08:07','2024-01-16 03:08:07'),(2,'villa',2,'Botble\\RealEstate\\Models\\Category','property-category','2024-01-16 03:08:07','2024-01-16 03:08:07'),(3,'condo',3,'Botble\\RealEstate\\Models\\Category','property-category','2024-01-16 03:08:07','2024-01-16 03:08:07'),(4,'house',4,'Botble\\RealEstate\\Models\\Category','property-category','2024-01-16 03:08:07','2024-01-16 03:08:07'),(5,'land',5,'Botble\\RealEstate\\Models\\Category','property-category','2024-01-16 03:08:07','2024-01-16 03:08:07'),(6,'commercial-property',6,'Botble\\RealEstate\\Models\\Category','property-category','2024-01-16 03:08:07','2024-01-16 03:08:07'),(7,'home-one',1,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(8,'home-two',2,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(9,'home-three',3,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(10,'home-four',4,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(11,'projects',5,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(12,'properties',6,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(13,'about-us',7,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(14,'features',8,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(15,'pricing-plans',9,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(16,'frequently-asked-questions',10,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(17,'terms-of-services',11,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(18,'privacy-policy',12,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(19,'coming-soon',13,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(20,'news',14,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(21,'contact',15,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(22,'wishlist',16,'Botble\\Page\\Models\\Page','','2024-01-16 03:08:07','2024-01-16 03:08:07'),(23,'design',1,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(24,'lifestyle',2,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(25,'travel-tips',3,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(26,'healthy',4,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(27,'travel-tips',5,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(28,'hotel',6,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(29,'nature',7,'Botble\\Blog\\Models\\Category','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(30,'new',1,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(31,'event',2,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(32,'villa',3,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(33,'apartment',4,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(34,'condo',5,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(35,'luxury-villa',6,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(36,'family-home',7,'Botble\\Blog\\Models\\Tag','tag','2024-01-16 03:08:08','2024-01-16 03:08:08'),(37,'the-top-2020-handbag-trends-to-know',1,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(38,'top-search-engine-optimization-strategies',2,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(39,'which-company-would-you-choose',3,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(40,'used-car-dealer-sales-tricks-exposed',4,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(41,'20-ways-to-sell-your-product-faster',5,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(42,'the-secrets-of-rich-and-famous-writers',6,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(43,'imagine-losing-20-pounds-in-14-days',7,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(44,'are-you-still-using-that-slow-old-typewriter',8,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(45,'a-skin-cream-thats-proven-to-work',9,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(46,'10-reasons-to-start-your-own-profitable-website',10,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(47,'simple-ways-to-reduce-your-unwanted-wrinkles',11,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(48,'apple-imac-with-retina-5k-display-review',12,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(49,'10000-web-site-visitors-in-one-monthguaranteed',13,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(50,'unlock-the-secrets-of-selling-high-ticket-items',14,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(51,'4-expert-tips-on-how-to-choose-the-right-mens-wallet',15,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(52,'sexy-clutches-how-to-buy-wear-a-designer-clutch-bag',16,'Botble\\Blog\\Models\\Post','news','2024-01-16 03:08:08','2024-01-16 03:08:08'),(53,'walnut-park-apartments',1,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(54,'sunshine-wonder-villas',2,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(55,'diamond-island',3,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(56,'the-nassim',4,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(57,'vinhomes-grand-park',5,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(58,'the-metropole-thu-thiem',6,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(59,'villa-on-grand-avenue',7,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(60,'traditional-food-restaurant',8,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(61,'villa-on-hollywood-boulevard',9,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(62,'office-space-at-northwest-107th',10,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(63,'home-in-merrick-way',11,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(64,'adarsh-greens',12,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(65,'rustomjee-evershine-global-city',13,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(66,'godrej-exquisite',14,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(67,'godrej-prime',15,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(68,'ps-panache',16,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(69,'upturn-atmiya-centria',17,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(70,'brigade-oasis',18,'Botble\\RealEstate\\Models\\Project','projects','2024-01-16 03:08:15','2024-01-16 03:08:15'),(71,'3-beds-villa-calpe-alicante',1,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(72,'lavida-plus-office-tel-1-bedroom',2,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(73,'vinhomes-grand-park-studio-1-bedroom',3,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(74,'the-sun-avenue-office-tel-1-bedroom',4,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(75,'property-for-sale-johannesburg-south-africa',5,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(76,'stunning-french-inspired-manor',6,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(77,'villa-for-sale-at-bermuda-dunes',7,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(78,'walnut-park-apartment',8,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(79,'5-beds-luxury-house',9,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(80,'family-victorian-view-home',10,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(81,'osaka-heights-apartment',11,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(82,'private-estate-magnificent-views',12,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(83,'thompson-road-house-for-rent',13,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(84,'brand-new-1-bedroom-apartment-in-first-class-location',14,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(85,'elegant-family-home-presents-premium-modern-living',15,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(86,'luxury-apartments-in-singapore-for-sale',16,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(87,'5-room-luxury-penthouse-for-sale-in-kuala-lumpur',17,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(88,'2-floor-house-in-compound-pejaten-barat-kemang',18,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(89,'apartment-muiderstraatweg-in-diemen',19,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(90,'nice-apartment-for-rent-in-berlin',20,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(91,'pumpkin-key-private-island',21,'Botble\\RealEstate\\Models\\Property','properties','2024-01-16 03:08:15','2024-01-16 03:08:15'),(92,'elmira-schowalter',1,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(93,'kayla-jacobs',2,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(94,'lonnie-vandervort',3,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(95,'reymundo-ortiz',4,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(96,'mattie-mayert',5,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(97,'cody-walter',6,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(98,'jermaine-donnelly',7,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(99,'judy-macejkovic',8,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(100,'lessie-mayert',9,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(101,'lela-wehner',10,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(102,'kristina-fritsch',11,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(103,'mustafa-vonrueden',12,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(104,'elaina-mante',13,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(105,'amber-jacobi',14,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(106,'alta-cormier',15,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(107,'verla-mcglynn',16,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(108,'orlo-ankunding',17,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(109,'chad-okeefe',18,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(110,'marty-white',19,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(111,'pauline-boyle',20,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19'),(112,'ethel-marvin',21,'Botble\\RealEstate\\Models\\Account','agents','2024-01-16 03:08:19','2024-01-16 03:08:19');
/*!40000 ALTER TABLE `slugs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `slugs_translations`
--

DROP TABLE IF EXISTS `slugs_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `slugs_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slugs_id` bigint unsigned NOT NULL,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prefix` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT '',
  PRIMARY KEY (`lang_code`,`slugs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `slugs_translations`
--

LOCK TABLES `slugs_translations` WRITE;
/*!40000 ALTER TABLE `slugs_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `slugs_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states`
--

DROP TABLE IF EXISTS `states`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country_id` bigint unsigned DEFAULT NULL,
  `order` tinyint NOT NULL DEFAULT '0',
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_default` tinyint unsigned NOT NULL DEFAULT '0',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `states_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states`
--

LOCK TABLES `states` WRITE;
/*!40000 ALTER TABLE `states` DISABLE KEYS */;
INSERT INTO `states` VALUES (1,'France','france','FR',1,0,NULL,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'England','england','EN',2,0,NULL,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'New York','new-york','NY',1,0,NULL,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Holland','holland','HL',4,0,NULL,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'Denmark','denmark','DN',5,0,NULL,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'Germany','germany','GER',1,0,NULL,0,'published','2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `states` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `states_translations`
--

DROP TABLE IF EXISTS `states_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `states_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `states_id` bigint unsigned NOT NULL,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `abbreviation` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`states_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `states_translations`
--

LOCK TABLES `states_translations` WRITE;
/*!40000 ALTER TABLE `states_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `states_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags`
--

DROP TABLE IF EXISTS `tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `author_id` bigint unsigned DEFAULT NULL,
  `author_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Botble\\ACL\\Models\\User',
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags`
--

LOCK TABLES `tags` WRITE;
/*!40000 ALTER TABLE `tags` DISABLE KEYS */;
INSERT INTO `tags` VALUES (1,'New',2,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'Event',1,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'Villa',1,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Apartment',1,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'Condo',2,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'Luxury villa',1,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(7,'Family home',1,'Botble\\ACL\\Models\\User','','published','2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tags_translations`
--

DROP TABLE IF EXISTS `tags_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tags_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tags_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`tags_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tags_translations`
--

LOCK TABLES `tags_translations` WRITE;
/*!40000 ALTER TABLE `tags_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `tags_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials`
--

DROP TABLE IF EXISTS `testimonials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(60) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'published',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials`
--

LOCK TABLES `testimonials` WRITE;
/*!40000 ALTER TABLE `testimonials` DISABLE KEYS */;
INSERT INTO `testimonials` VALUES (1,'Christa Smith','Alice, \'to speak to this mouse? Everything is so out-of-the-way down here, that I should think very likely to eat some of them can explain it,\' said Alice to herself, \'to be going messages for a.','clients/01.jpg','Manager','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'John Smith','Hatter. \'You MUST remember,\' remarked the King, \'that only makes the world am I? Ah, THAT\'S the great question is, what did the archbishop find?\' The Mouse gave a little more conversation with her.','clients/02.jpg','Product designer','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'Sayen Ahmod','I can\'t understand it myself to begin at HIS time of life. The King\'s argument was, that if something wasn\'t done about it while the Mock Turtle sighed deeply, and drew the back of one flapper.','clients/03.jpg','Developer','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'Tayla Swef','French mouse, come over with fright. \'Oh, I BEG your pardon!\' cried Alice again, for this time it all is! I\'ll try if I only knew the name of nearly everything there. \'That\'s the most curious thing.','clients/04.jpg','Graphic designer','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'Christa Smith','At last the Mock Turtle. \'And how did you ever eat a bat?\' when suddenly, thump! thump! down she came in with a round face, and was gone across to the door, she found her head through the glass, and.','clients/05.jpg','Graphic designer','published','2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'James Garden','I like being that person, I\'ll come up: if not, I\'ll stay down here! It\'ll be no chance of getting up and went on just as well. The twelve jurors were all in bed!\' On various pretexts they all.','clients/06.jpg','Web Developer','published','2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `testimonials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonials_translations`
--

DROP TABLE IF EXISTS `testimonials_translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonials_translations` (
  `lang_code` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `testimonials_id` bigint unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `company` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`lang_code`,`testimonials_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonials_translations`
--

LOCK TABLES `testimonials_translations` WRITE;
/*!40000 ALTER TABLE `testimonials_translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `testimonials_translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transactions`
--

DROP TABLE IF EXISTS `transactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transactions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `credits` int unsigned NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned DEFAULT NULL,
  `account_id` bigint unsigned DEFAULT NULL,
  `type` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'add',
  `payment_id` bigint unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transactions`
--

LOCK TABLES `transactions` WRITE;
/*!40000 ALTER TABLE `transactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `transactions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_meta`
--

DROP TABLE IF EXISTS `user_meta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_meta` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` bigint unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_meta_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_meta`
--

LOCK TABLES `user_meta` WRITE;
/*!40000 ALTER TABLE `user_meta` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_name` varchar(120) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(60) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar_id` bigint unsigned DEFAULT NULL,
  `super_user` tinyint(1) NOT NULL DEFAULT '0',
  `manage_supers` tinyint(1) NOT NULL DEFAULT '0',
  `permissions` text COLLATE utf8mb4_unicode_ci,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  UNIQUE KEY `users_username_unique` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'adonis.fahey@feil.biz',NULL,'$2y$12$nsq9T.EKMBrf/kx5t.a6XuN.5il1Ex.REbVn4cPXwFwcL8MTuMgrK',NULL,'2024-01-16 03:08:07','2024-01-16 03:08:07','Amie','Treutel','botble',NULL,1,1,NULL,NULL),(2,'enid95@dach.com',NULL,'$2y$12$Oaf.OC4HNAHmMMYsrILGWe/aeRyIumWP5ZZQhe0ucsb3gRGSeVP5K',NULL,'2024-01-16 03:08:07','2024-01-16 03:08:07','Jedidiah','Smitham','admin',NULL,1,1,NULL,NULL);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `widgets`
--

DROP TABLE IF EXISTS `widgets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `widgets` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `widget_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sidebar_id` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `theme` varchar(120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` tinyint unsigned NOT NULL DEFAULT '0',
  `data` text COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `widgets`
--

LOCK TABLES `widgets` WRITE;
/*!40000 ALTER TABLE `widgets` DISABLE KEYS */;
INSERT INTO `widgets` VALUES (1,'NewsletterWidget','pre_footer','hously',0,'{\"name\":\"Subscribe to Newsletter.\",\"description\":\"Subscribe to get latest updates and information.\",\"title\":null,\"subtitle\":null}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(2,'SiteInformationWidget','footer_menu','hously',1,'{\"name\":\"Site Information\",\"logo\":\"general\\/logo-light.png\",\"url\":\"#\",\"description\":\"A great platform to buy, sell and rent your properties without any agent or commissions.\"}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(3,'CustomMenuWidget','footer_menu','hously',2,'{\"id\":\"CustomMenuWidget\",\"name\":\"Company\",\"menu_id\":\"company\"}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(4,'CustomMenuWidget','footer_menu','hously',3,'{\"id\":\"CustomMenuWidget\",\"name\":\"Useful Links\",\"menu_id\":\"useful-links\"}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(5,'ContactInformationWidget','footer_menu','hously',4,'{\"name\":\"Contact Details\",\"address\":\"C\\/54 Northwest Freeway, Suite 558, Houston, USA 485\",\"email\":\"contact@example.com\",\"phone\":\"+152 534-468-854\"}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(6,'BlogSearchWidget','blog_sidebar','hously',1,'{\"name\":\"Blog Search\"}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(7,'BlogPopularCategoriesWidget','blog_sidebar','hously',2,'{\"name\":\"Popular Categories\",\"limit\":5}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(8,'BlogPostsWidget','blog_sidebar','hously',3,'{\"name\":\"Popular Posts\",\"type\":\"popular\",\"limit\":5}','2024-01-16 03:08:08','2024-01-16 03:08:08'),(9,'BlogPopularTagsWidget','blog_sidebar','hously',4,'{\"name\":\"Popular Tags\",\"limit\":6}','2024-01-16 03:08:08','2024-01-16 03:08:08');
/*!40000 ALTER TABLE `widgets` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-01-16 17:08:20
