CREATE DATABASE  IF NOT EXISTS `bantay_gensan` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bantay_gensan`;
-- MySQL dump 10.13  Distrib 8.0.43, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: bantay_gensan
-- ------------------------------------------------------
-- Server version	9.4.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `activity_logs`
--

DROP TABLE IF EXISTS `activity_logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `activity_logs` (
  `log_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `action` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `report_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`log_id`),
  KEY `activity_logs_report_id_fkey` (`report_id`),
  KEY `idx_activity_logs_user_id` (`user_id`),
  CONSTRAINT `activity_logs_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`) ON DELETE SET NULL,
  CONSTRAINT `activity_logs_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `activity_logs`
--

LOCK TABLES `activity_logs` WRITE;
/*!40000 ALTER TABLE `activity_logs` DISABLE KEYS */;
INSERT INTO `activity_logs` VALUES (1,1,'Created report \"Broken Street Light\"',1,'2026-02-22 21:28:45'),(2,3,'Updated status to In Progress',1,'2026-02-22 21:28:45'),(3,2,'Created report \"Pothole on Road\"',2,'2026-02-22 21:28:45'),(4,4,'Updated status to On Hold',2,'2026-02-22 21:28:45'),(5,1,'A Citizen updated status to \"In Progress\"',8,'2026-03-09 02:41:32'),(6,1,'A Citizen updated report details',8,'2026-03-09 02:51:37'),(7,1,'A Admin updated status to \"In Progress\"',8,'2026-03-09 03:02:37'),(8,1,'A Admin updated status to \"Complete\"',8,'2026-03-09 08:35:18'),(9,3,'Added a comment',8,'2026-03-09 09:03:43'),(10,3,'Added a comment',8,'2026-03-09 09:06:37'),(11,1,'Rated a report',3,'2026-03-09 09:23:43'),(12,1,'Rated a report',3,'2026-03-09 09:23:43'),(14,1,'A Admin updated the report',8,'2026-03-23 00:25:27'),(15,1,'A Admin updated the report',8,'2026-03-23 00:43:17'),(16,1,'A Admin updated the report',3,'2026-03-23 00:51:10'),(17,1,'A Admin updated the report',1,'2026-03-23 00:51:10'),(18,6,'A Admin updated the report',5,'2026-03-23 00:51:10'),(19,2,'A Admin updated the report',2,'2026-03-23 00:51:10'),(20,5,'A Admin updated the report',4,'2026-03-23 00:51:10'),(21,1,'A Admin updated status to \"In Progress\"',1,'2026-03-23 00:51:49'),(22,1,'A Admin updated status to \"Complete\"',1,'2026-03-23 00:54:35'),(23,1,'A Admin updated status to \"In Progress\"',1,'2026-03-23 00:55:12'),(24,2,'A Admin updated status to \"On Hold\" and added/updated admin notes',2,'2026-03-23 00:57:19'),(25,2,'A Citizen updated report details',2,'2026-03-23 00:59:33'),(26,2,'A Admin updated status to \"Complete\"',2,'2026-04-05 16:50:14'),(27,1,'A Admin updated status to \"In Progress\"',13,'2026-04-05 18:32:06'),(28,1,'A Admin added/updated admin notes',13,'2026-04-05 18:35:14'),(29,1,'A Admin added/updated admin notes',1,'2026-04-05 18:42:20'),(30,5,'A Admin added/updated admin notes',4,'2026-04-05 18:43:39'),(31,1,'Submitted new report: Broken Street Light',14,'2026-04-05 19:54:18'),(32,1,'A Citizen created a report',15,'2026-04-19 22:56:06'),(33,1,'Submitted new report: Broken Street Light',15,'2026-04-19 22:56:06');
/*!40000 ALTER TABLE `activity_logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `barangay_data`
--

DROP TABLE IF EXISTS `barangay_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `barangay_data` (
  `barangay_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`barangay_id`),
  KEY `barangay_data_created_by_fkey` (`created_by`),
  CONSTRAINT `barangay_data_created_by_fkey` FOREIGN KEY (`created_by`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `barangay_data`
--

LOCK TABLES `barangay_data` WRITE;
/*!40000 ALTER TABLE `barangay_data` DISABLE KEYS */;
INSERT INTO `barangay_data` VALUES (1,'Barangay Apopong',5,'2026-02-22 21:28:45','2026-02-22 21:28:45'),(2,'Barangay Bula',5,'2026-02-22 21:28:45','2026-02-22 21:28:45'),(3,'Barangay Fatima',5,'2026-03-02 01:34:23','2026-03-02 01:34:23'),(4,'Barangay Calumpang',5,'2026-03-02 01:34:23','2026-03-02 01:34:23'),(5,'Barangay Lagao',5,'2026-03-02 01:34:23','2026-03-02 01:34:23'),(6,'Barangay Mabuhay',5,'2026-03-23 00:06:40','2026-03-23 00:06:40'),(7,'Barangay Baluan',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(8,'Barangay Batomelong',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(9,'Barangay Buayan',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(10,'Barangay City Heights',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(11,'Barangay Conel',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(12,'Barangay Dadiangas East',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(13,'Barangay Dadiangas North',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(14,'Barangay Dadiangas South',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(15,'Barangay Dadiangas West',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(16,'Barangay Katangawan',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(17,'Barangay Labangal',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(18,'Barangay Ligaya',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(19,'Barangay Olympog',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(20,'Barangay San Isidro',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(21,'Barangay San Jose',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(22,'Barangay Siguel (Bawing)',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(23,'Barangay Sinawal',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(24,'Barangay Tambler',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(25,'Barangay Tinagacan',5,'2026-04-05 20:30:09','2026-04-05 20:30:09'),(26,'Barangay Upper Labay',5,'2026-04-05 20:30:09','2026-04-05 20:30:09');
/*!40000 ALTER TABLE `barangay_data` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enforce_barangay_created_by_admin` BEFORE INSERT ON `barangay_data` FOR EACH ROW BEGIN
    DECLARE v_role VARCHAR(20);
    SELECT role INTO v_role FROM users WHERE user_id = NEW.created_by;
    IF v_role <> 'Admin' THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Only Admin users can create barangay data';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_barangay_insert` AFTER INSERT ON `barangay_data` FOR EACH ROW BEGIN
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (NEW.created_by, CONCAT('An Admin added barangay \"', NEW.name, '\"'), NULL, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_barangay_update` AFTER UPDATE ON `barangay_data` FOR EACH ROW BEGIN
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (NEW.created_by, CONCAT('An Admin updated barangay \"', NEW.name, '\"'), NULL, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `log_barangay_delete` AFTER DELETE ON `barangay_data` FOR EACH ROW BEGIN
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (OLD.created_by, CONCAT('An Admin deleted barangay \"', OLD.name, '\"'), NULL, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comments` (
  `comment_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `user_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `comment_text` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment_image` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`comment_id`),
  KEY `comments_user_id_fkey` (`user_id`),
  KEY `idx_comments_report_id` (`report_id`),
  CONSTRAINT `comments_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`) ON DELETE CASCADE,
  CONSTRAINT `comments_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (1,1,1,NULL,'Please fix this soon!','pothole','2026-02-22 21:28:45'),(2,1,3,NULL,'We are checking this issue.','pothole','2026-02-22 21:28:45'),(3,2,2,NULL,'Dangerous, needs urgent repair.','pothole','2026-02-22 21:28:45'),(5,8,3,NULL,'Thank you for fixing the issue!','image.jpg','2026-03-09 09:03:43'),(6,8,3,NULL,'Thank you for fixing the issue!','image.jpg','2026-03-09 09:06:37');
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auto_fill_username` BEFORE INSERT ON `comments` FOR EACH ROW BEGIN
    DECLARE v_username VARCHAR(50);
    SELECT username INTO v_username FROM users WHERE user_id = NEW.user_id;
    SET NEW.user_name = v_username;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_comment_activity` AFTER INSERT ON `comments` FOR EACH ROW BEGIN
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (NEW.user_id, 'Added a comment', NEW.report_id, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `notifications`
--

DROP TABLE IF EXISTS `notifications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notifications` (
  `notification_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_read` tinyint NOT NULL DEFAULT '0',
  `notification_type` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'general',
  `report_id` int DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`notification_id`),
  KEY `notifications_report_id_fkey` (`report_id`),
  KEY `idx_notifications_user_id` (`user_id`),
  CONSTRAINT `notifications_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`) ON DELETE CASCADE,
  CONSTRAINT `notifications_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `notifications_notification_type_check` CHECK ((`notification_type` in (_utf8mb4'status_update',_utf8mb4'new_comment',_utf8mb4'report_resolved',_utf8mb4'report_rejected',_utf8mb4'general')))
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notifications`
--

LOCK TABLES `notifications` WRITE;
/*!40000 ALTER TABLE `notifications` DISABLE KEYS */;
INSERT INTO `notifications` VALUES (1,1,'Your report \"Broken Street Light\" status updated to In Progress',0,'general',NULL,'2026-02-22 21:28:45'),(2,2,'Your report \"Pothole on Road\" is on hold',0,'general',NULL,'2026-02-22 21:28:45'),(3,3,'New report submitted in your barangay',0,'general',NULL,'2026-02-22 21:28:45'),(4,5,'System maintenance scheduled',0,'general',NULL,'2026-02-22 21:28:45'),(5,2,'Your report \"Pothole on Road\" status changed to In Progress',0,'general',NULL,'2026-03-09 02:36:17'),(9,1,'Your report \"Guba na dalan\" status changed to In Progress',0,'general',NULL,'2026-03-09 02:41:32'),(10,1,'Your report \"Guba na dalan\" status changed to Complete',0,'general',NULL,'2026-03-09 02:51:37'),(11,1,'Your report \"Guba na dalan\" status changed to In Progress',0,'general',NULL,'2026-03-09 03:02:37'),(12,1,'Your report \"Guba na dalan\" status changed to Complete',0,'general',NULL,'2026-03-09 08:35:18'),(13,1,'Your report \"Broken Street Light\" status changed to In Progress',0,'general',NULL,'2026-03-23 00:51:49'),(14,1,'Your report \"Broken Street Light\" status changed to Complete',0,'general',NULL,'2026-03-23 00:54:35'),(15,1,'Your report \"Broken Street Light\" status changed to In Progress',0,'general',NULL,'2026-03-23 00:55:12'),(16,2,'Your report \"Pothole on Road\" status changed to On Hold',0,'general',NULL,'2026-03-23 00:57:19'),(17,2,'Admin added a note to your report \"Pothole on Road\": Test note',0,'general',NULL,'2026-03-23 00:57:19'),(18,2,'Admin added a note to your report \"Pothole on Road\": Test note by citizen',0,'general',NULL,'2026-03-23 00:59:33'),(20,2,'Your report \"Pothole on Road\" status changed to Complete',0,'report_resolved',2,'2026-04-05 16:50:14'),(21,1,'Your report \"overgrown power lines\" status changed to In Progress',0,'status_update',13,'2026-04-05 18:32:06'),(22,1,'Admin added a note to your report \"overgrown power lines\": Gina buhat na',0,'general',13,'2026-04-05 18:35:14'),(23,1,'Admin added a note to your report \"Broken Street Light\": On the go',0,'general',1,'2026-04-05 18:42:20'),(24,5,'Admin added a note to your report \"Garbage Overflow\": Sugdan na',0,'new_comment',4,'2026-04-05 18:43:39');
/*!40000 ALTER TABLE `notifications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `rating_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL,
  `user_id` int NOT NULL,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rating_value` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`rating_id`),
  KEY `ratings_report_id_fkey` (`report_id`),
  KEY `ratings_user_id_fkey` (`user_id`),
  CONSTRAINT `ratings_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`) ON DELETE CASCADE,
  CONSTRAINT `ratings_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  CONSTRAINT `ratings_rating_value_check` CHECK (((`rating_value` >= 1) and (`rating_value` <= 5)))
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
INSERT INTO `ratings` VALUES (1,1,1,NULL,5,'2026-02-22 21:28:45'),(2,1,3,NULL,4,'2026-02-22 21:28:45'),(3,2,2,NULL,3,'2026-02-22 21:28:45'),(5,3,1,NULL,5,'2026-03-09 09:23:43');
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `auto_fill_rating_username` BEFORE INSERT ON `ratings` FOR EACH ROW BEGIN
    DECLARE v_username VARCHAR(50);
    SELECT username INTO v_username FROM users WHERE user_id = NEW.user_id;
    SET NEW.username = v_username;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_rating_activity` AFTER INSERT ON `ratings` FOR EACH ROW BEGIN
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (NEW.user_id, 'Rated a report', NEW.report_id, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `report_images`
--

DROP TABLE IF EXISTS `report_images`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `report_images` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `image_filename` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image_type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'proof',
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`image_id`),
  KEY `report_images_report_id_fkey` (`report_id`),
  KEY `report_images_user_id_fkey` (`user_id`),
  CONSTRAINT `report_images_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`) ON DELETE CASCADE,
  CONSTRAINT `report_images_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `report_images_image_type_check` CHECK ((`image_type` in (_utf8mb4'proof',_utf8mb4'resolved')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `report_images`
--

LOCK TABLES `report_images` WRITE;
/*!40000 ALTER TABLE `report_images` DISABLE KEYS */;
INSERT INTO `report_images` VALUES (1,1,1,'streetlight1.jpg','proof','2026-02-22 21:28:45'),(2,1,1,'streetlight2.jpg','proof','2026-02-22 21:28:45'),(3,2,2,'pothole.jpg','proof','2026-02-22 21:28:45');
/*!40000 ALTER TABLE `report_images` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reports`
--

DROP TABLE IF EXISTS `reports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reports` (
  `report_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `location` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `severity` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'Low',
  `status` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT 'No status yet',
  `barangay` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `admin_notes` text COLLATE utf8mb4_unicode_ci,
  `modified_by` int DEFAULT NULL,
  `barangay_id` int NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`report_id`),
  KEY `reports_modified_by_fkey` (`modified_by`),
  KEY `idx_reports_status` (`status`),
  KEY `idx_reports_user_id` (`user_id`),
  KEY `idx_reports_barangay_id` (`barangay_id`),
  CONSTRAINT `reports_barangay_id_fkey` FOREIGN KEY (`barangay_id`) REFERENCES `barangay_data` (`barangay_id`) ON DELETE RESTRICT,
  CONSTRAINT `reports_modified_by_fkey` FOREIGN KEY (`modified_by`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `reports_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE,
  CONSTRAINT `reports_severity_check` CHECK ((`severity` in (_utf8mb4'Low',_utf8mb4'Medium',_utf8mb4'High'))),
  CONSTRAINT `reports_status_check` CHECK ((`status` in (_utf8mb4'No status yet',_utf8mb4'In Progress',_utf8mb4'Complete',_utf8mb4'On Hold',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reports`
--

LOCK TABLES `reports` WRITE;
/*!40000 ALTER TABLE `reports` DISABLE KEYS */;
INSERT INTO `reports` VALUES (1,1,'Broken Street Light','Street light near market is broken','Market Street','Medium','In Progress','Barangay Fatima','On the go',5,3,'2026-02-22 21:28:19','2026-04-05 18:42:20'),(2,2,'Pothole on Road','Large pothole causing traffic','Main Avenue','High','Complete','Barangay Calumpang','Test note by citizen',5,4,'2026-02-22 21:28:19','2026-04-05 16:50:14'),(3,1,'Overflowing Drain','Drain overflowing after rain','River Side','Low','Complete','Barangay Fatima','Assigned to staff',5,3,'2026-02-22 21:28:19','2026-02-22 21:28:19'),(4,5,'Garbage Overflow','Garbage not collected for 3 days','Barangay Lagao','Medium','In Progress','Barangay Lagao','Sugdan na',5,5,'2026-03-02 01:21:32','2026-04-05 18:43:39'),(5,6,'Fallen Tree','Tree blocking sidewalk','River Side','High','In Progress','Barangay Fatima','Assigned to staff',5,3,'2026-03-02 01:21:32','2026-03-02 01:21:32'),(8,1,'Guba na dalan','naguba ang dalan sa fatima','fatima','Medium','Complete','Barangay Fatima','wala pa nahuman',5,3,'2026-03-09 02:51:37','2026-03-09 08:35:18'),(10,1,'Broken Sidewalk','Sidewalk near elementary school is cracked and dangerous','Fatima Street','Medium','No status yet','Barangay Fatima','',NULL,3,'2026-03-23 01:07:07','2026-03-23 01:07:07'),(13,1,'overgrown power lines','this causes brownout','Prk.5 Diri dapit water station na blue','High','In Progress','Barangay Lagao','Gina buhat na',5,5,'2026-04-05 18:20:07','2026-04-05 18:35:14'),(14,1,'Broken Street Light','The street light has been broken for 3 days','Prk. 5 Lagao','High','No status yet','Barangay Lagao','',NULL,5,'2026-04-05 19:54:18','2026-04-05 19:54:18'),(15,1,'Broken Street Light','The street light has been broken for 3 days','Market Street','Low','No status yet','Barangay Fatima',NULL,NULL,3,'2026-04-19 22:56:06','2026-04-19 22:56:06');
/*!40000 ALTER TABLE `reports` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_auto_fill_barangay_insert` BEFORE INSERT ON `reports` FOR EACH ROW BEGIN
    DECLARE v_name VARCHAR(50);
    SELECT name INTO v_name FROM barangay_data WHERE barangay_id = NEW.barangay_id;
    SET NEW.barangay = COALESCE(v_name, '');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_report_activity_insert` AFTER INSERT ON `reports` FOR EACH ROW BEGIN
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (NEW.user_id, 'A Citizen created a report', NEW.report_id, NOW());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_auto_fill_barangay_update` BEFORE UPDATE ON `reports` FOR EACH ROW BEGIN
    DECLARE v_name VARCHAR(50);
    SELECT name INTO v_name FROM barangay_data WHERE barangay_id = NEW.barangay_id;
    SET NEW.barangay = COALESCE(v_name, '');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `enforce_report_modified` BEFORE UPDATE ON `reports` FOR EACH ROW BEGIN
    DECLARE v_role VARCHAR(20);
    IF (NEW.status <> OLD.status OR
        COALESCE(NEW.admin_notes,'') <> COALESCE(OLD.admin_notes,'')) THEN
        IF NEW.modified_by IS NULL THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'modified_by must be set when updating status or admin_notes';
        END IF;
        SELECT role INTO v_role FROM users WHERE user_id = NEW.modified_by;
        IF v_role = 'Citizen' THEN
            SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'Citizens are not allowed to update status or admin notes';
        END IF;
    END IF;
    SET NEW.updated_at = CURRENT_TIMESTAMP;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_notify_report` AFTER UPDATE ON `reports` FOR EACH ROW BEGIN
    DECLARE v_type VARCHAR(50);
    IF NEW.status <> OLD.status THEN
        SET v_type = CASE NEW.status
            WHEN 'Complete'  THEN 'report_resolved'
            WHEN 'Cancelled' THEN 'report_rejected'
            ELSE 'status_update'
        END;
        INSERT INTO notifications(user_id, message, is_read, created_at, notification_type, report_id)
        VALUES (
            NEW.user_id,
            CONCAT('Your report \"', NEW.title, '\" status changed to ', NEW.status),
            0, NOW(), v_type, NEW.report_id
        );
    END IF;
    IF COALESCE(NEW.admin_notes,'') <> COALESCE(OLD.admin_notes,'') AND NEW.admin_notes IS NOT NULL THEN
        INSERT INTO notifications(user_id, message, is_read, created_at, notification_type, report_id)
        VALUES (
            NEW.user_id,
            CONCAT('Admin added a note to your report \"', NEW.title, '\": ', NEW.admin_notes),
            0, NOW(), 'new_comment', NEW.report_id
        );
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_report_activity_update` AFTER UPDATE ON `reports` FOR EACH ROW trigger_block: BEGIN
    DECLARE v_role VARCHAR(20);
    DECLARE v_action TEXT;
    IF NEW.modified_by IS NULL THEN
        LEAVE trigger_block;
    END IF;
    SELECT role INTO v_role FROM users WHERE user_id = NEW.modified_by;
    IF v_role IS NULL THEN
        LEAVE trigger_block;
    END IF;
    IF v_role = 'Citizen' THEN
        SET v_action = 'A Citizen updated report details';
    ELSEIF NEW.status <> OLD.status AND COALESCE(NEW.admin_notes,'') <> COALESCE(OLD.admin_notes,'') THEN
        SET v_action = CONCAT('A ', v_role, ' updated status to \"', NEW.status, '\" and added/updated admin notes');
    ELSEIF NEW.status <> OLD.status THEN
        SET v_action = CONCAT('A ', v_role, ' updated status to \"', NEW.status, '\"');
    ELSEIF COALESCE(NEW.admin_notes,'') <> COALESCE(OLD.admin_notes,'') THEN
        SET v_action = CONCAT('A ', v_role, ' added/updated admin notes');
    ELSE
        SET v_action = CONCAT('A ', v_role, ' updated the report');
    END IF;
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (NEW.user_id, v_action, NEW.report_id, NOW());
END trigger_block */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_report_activity_delete` AFTER DELETE ON `reports` FOR EACH ROW BEGIN
    DECLARE v_role VARCHAR(20);
    SELECT role INTO v_role FROM users WHERE user_id = OLD.modified_by;
    IF v_role IN ('Citizen','Admin') THEN
        INSERT INTO activity_logs(user_id, action, report_id, created_at)
        VALUES (OLD.user_id, CONCAT('A ', v_role, ' deleted a report'), OLD.report_id, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `status_updates`
--

DROP TABLE IF EXISTS `status_updates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_updates` (
  `status_id` int NOT NULL AUTO_INCREMENT,
  `report_id` int NOT NULL,
  `user_id` int DEFAULT NULL,
  `status` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notes` text COLLATE utf8mb4_unicode_ci,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`status_id`),
  KEY `status_updates_report_id_fkey` (`report_id`),
  KEY `status_updates_user_id_fkey` (`user_id`),
  CONSTRAINT `status_updates_report_id_fkey` FOREIGN KEY (`report_id`) REFERENCES `reports` (`report_id`) ON DELETE CASCADE,
  CONSTRAINT `status_updates_user_id_fkey` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE SET NULL,
  CONSTRAINT `status_updates_status_check` CHECK ((`status` in (_utf8mb4'No status yet',_utf8mb4'In Progress',_utf8mb4'Complete',_utf8mb4'On Hold',_utf8mb4'Cancelled')))
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_updates`
--

LOCK TABLES `status_updates` WRITE;
/*!40000 ALTER TABLE `status_updates` DISABLE KEYS */;
INSERT INTO `status_updates` VALUES (1,1,3,'In Progress','Maintenance team assigned','2026-02-22 21:28:45'),(2,2,4,'On Hold','Waiting for budget approval','2026-02-22 21:28:45'),(3,3,3,'Complete','Drain cleaned','2026-02-22 21:28:45');
/*!40000 ALTER TABLE `status_updates` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `table_constraints_view`
--

DROP TABLE IF EXISTS `table_constraints_view`;
/*!50001 DROP VIEW IF EXISTS `table_constraints_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `table_constraints_view` AS SELECT 
 1 AS `TABLE_NAME`,
 1 AS `COLUMN_NAME`,
 1 AS `DATA_TYPE`,
 1 AS `CHARACTER_MAXIMUM_LENGTH`,
 1 AS `IS_NULLABLE`,
 1 AS `COLUMN_DEFAULT`,
 1 AS `constraints`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `role` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `first_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `middle_name` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone_number` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_active` tinyint NOT NULL DEFAULT '1',
  `barangay_id` int DEFAULT NULL,
  `department` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `users_username_key` (`username`),
  UNIQUE KEY `users_email_key` (`email`),
  KEY `users_barangay_id_fkey` (`barangay_id`),
  CONSTRAINT `users_barangay_id_fkey` FOREIGN KEY (`barangay_id`) REFERENCES `barangay_data` (`barangay_id`) ON DELETE SET NULL,
  CONSTRAINT `users_role_check` CHECK ((`role` in (_utf8mb4'Citizen',_utf8mb4'Barangay Officer',_utf8mb4'City Staff',_utf8mb4'Admin')))
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'essak','essak@example.com','$2a$06$pyoYdhxyDNGOPhucosUhrO43Xs5EZTbquGXfbNGYQlif1O5fnZW7C','Citizen','Unknown','Unknown',NULL,'09123456789',1,NULL,NULL,'2026-02-22 21:28:09','2026-03-23 19:54:41'),(2,'alvin','alvin@example.com','$2a$06$XJAImhhQ7kXt22c9QSaSZ.WTrsq8r4tcFtmLgMjJq7NOq6YpU6h5e','Citizen','Unknown','Unknown',NULL,'09999999999',1,NULL,NULL,'2026-02-22 21:28:09','2026-03-23 20:01:15'),(3,'louise','louise@example.com','$2a$06$P4/I7pGTksmcx0G/X4RfDe/hUq2mqJ5FLhpMfL7Ui/ABxrX9/sJ6W','Barangay Officer','Unknown','Unknown',NULL,NULL,1,3,NULL,'2026-02-22 21:28:09','2026-03-22 23:54:40'),(4,'jabbie','jabbie@example.com','$2a$06$pKA30jbtV0IHa8WkCrLgnu.jHaqWZtABuivN1yAb3baGdQIzAkTEG','City Staff','Unknown','Unknown',NULL,NULL,1,NULL,'DPWH','2026-02-22 21:28:09','2026-03-22 23:50:30'),(5,'marlo','marlo@example.com','$2a$06$6LGEHmDzCvePzHhpS4LMd.wW7nrMmnkNgy2uJ36hD0S7lwejT771W','Admin','Unknown','Unknown',NULL,NULL,1,NULL,NULL,'2026-02-22 21:28:09','2026-02-22 21:28:09'),(6,'ash','ash@example.com','$2a$06$jf15QzxIxTwUUmOLXNzbMukKHyasSlbMBlTnOBE7eq.w8JlKk59Sq','Citizen','Unknown','Unknown',NULL,NULL,1,NULL,NULL,'2026-03-02 00:43:27','2026-03-02 00:43:27'),(7,'carl','carl@example.com','$2a$06$WinWJju7HO568qMqnFzHwuKZ8mbawLKMdsatkyhDeoDqbljzsgB7W','Citizen','Unknown','Unknown',NULL,NULL,1,NULL,NULL,'2026-03-02 00:48:30','2026-03-02 00:48:30'),(8,'alex','alex@example.com','$2a$10$In06hXW5MT9F5wMw/OY84u04vOyJHP0rGRFjxEZYXMfYbCVywBGZy','Citizen','Unknown','Unknown',NULL,NULL,1,NULL,NULL,'2026-03-04 21:38:06','2026-03-04 21:38:06'),(9,'bob','bob@example.com','$2a$10$pKLojvAE/fzXWbitMAxwPueSIchUPGVJNo0zY29pEn6rY359rrUXm','Citizen','Unknown','Unknown',NULL,NULL,1,NULL,NULL,'2026-03-04 21:43:52','2026-03-04 21:43:52'),(10,'jun','jun@example.com','$2a$10$UDfqf2LlZMFu4avEpKG0cu40CHMDTGLzpIKNE/1uMphdM80cmiovq','Citizen','Unknown','Unknown',NULL,NULL,1,NULL,NULL,'2026-03-04 22:04:18','2026-03-04 22:04:18'),(11,'santy','santy@example.com','482c811da5d5b4bc6d497ffa98491e38','City Staff','Santy','Baligod',NULL,NULL,1,NULL,'DPWH','2026-04-19 21:42:00','2026-04-19 21:49:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hash_password_before_insert` BEFORE INSERT ON `users` FOR EACH ROW BEGIN
    SET NEW.password = SHA2(NEW.password, 256);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `hash_password_before_update` BEFORE UPDATE ON `users` FOR EACH ROW BEGIN
    IF NEW.password <> OLD.password THEN
        SET NEW.password = SHA2(NEW.password, 256);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `view_privileges`
--

DROP TABLE IF EXISTS `view_privileges`;
/*!50001 DROP VIEW IF EXISTS `view_privileges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_privileges` AS SELECT 
 1 AS `role`,
 1 AS `TABLE_NAME`,
 1 AS `COLUMN_NAME`,
 1 AS `privileges`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_rls_pol`
--

DROP TABLE IF EXISTS `view_rls_pol`;
/*!50001 DROP VIEW IF EXISTS `view_rls_pol`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_rls_pol` AS SELECT 
 1 AS `TABLE_NAME`,
 1 AS `policy_name`,
 1 AS `command`,
 1 AS `using_expression`,
 1 AS `with_check_expression`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_system_roles`
--

DROP TABLE IF EXISTS `view_system_roles`;
/*!50001 DROP VIEW IF EXISTS `view_system_roles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_system_roles` AS SELECT 
 1 AS `role_name`,
 1 AS `can_login`,
 1 AS `is_superuser`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_table_privileges`
--

DROP TABLE IF EXISTS `view_table_privileges`;
/*!50001 DROP VIEW IF EXISTS `view_table_privileges`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_table_privileges` AS SELECT 
 1 AS `GRANTEE`,
 1 AS `TABLE_NAME`,
 1 AS `privileges`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `view_user_roles`
--

DROP TABLE IF EXISTS `view_user_roles`;
/*!50001 DROP VIEW IF EXISTS `view_user_roles`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `view_user_roles` AS SELECT 
 1 AS `User`,
 1 AS `Host`,
 1 AS `can_login`,
 1 AS `assigned_role`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'bantay_gensan'
--
/*!50003 DROP PROCEDURE IF EXISTS `register_user` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `register_user`(
    IN p_username     VARCHAR(50),
    IN p_email        VARCHAR(100),
    IN p_password     VARCHAR(255),
    IN p_first_name   VARCHAR(50),
    IN p_middle_name  VARCHAR(50),
    IN p_last_name    VARCHAR(50),
    IN p_phone_number VARCHAR(20),
    IN p_role         VARCHAR(20),
    IN p_barangay_id  INT,
    IN p_department   VARCHAR(100)
)
BEGIN
    IF p_role NOT IN ('Citizen','Admin','City Staff','Barangay Officer') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid role. Must be: Citizen, Admin, City Staff, or Barangay Officer.';
    END IF;
    IF EXISTS (SELECT 1 FROM users WHERE username = p_username) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Username is already taken.';
    END IF;
    IF EXISTS (SELECT 1 FROM users WHERE email = p_email) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Email is already registered.';
    END IF;
    IF p_role = 'Barangay Officer' AND p_barangay_id IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Barangay Officer must be assigned to a barangay.';
    END IF;
    IF p_role = 'City Staff' AND p_department IS NULL THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'City Staff must have a department assigned.';
    END IF;
    IF p_barangay_id IS NOT NULL AND NOT EXISTS (
        SELECT 1 FROM barangay_data WHERE barangay_id = p_barangay_id
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Barangay with the given id does not exist.';
    END IF;
    INSERT INTO users (
        username, email, password, first_name, middle_name,
        last_name, phone_number, role, barangay_id,
        department, is_active, created_at, updated_at
    ) VALUES (
        p_username, p_email, p_password, p_first_name, p_middle_name,
        p_last_name, p_phone_number, p_role, p_barangay_id,
        p_department, 1, NOW(), NOW()
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `submit_report` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `submit_report`(
    IN p_user_id     INT,
    IN p_title       VARCHAR(100),
    IN p_details     TEXT,
    IN p_location    VARCHAR(100),
    IN p_severity    VARCHAR(10),
    IN p_barangay_id INT
)
BEGIN
    DECLARE v_report_id INT;
    IF p_severity NOT IN ('Low','Medium','High') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid severity. Must be Low, Medium, or High.';
    END IF;
    IF NOT EXISTS (
        SELECT 1 FROM users
        WHERE user_id = p_user_id AND role = 'Citizen' AND is_active = 1
    ) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'User does not exist, is not a citizen, or is inactive.';
    END IF;
    IF NOT EXISTS (SELECT 1 FROM barangay_data WHERE barangay_id = p_barangay_id) THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Barangay does not exist.';
    END IF;
    INSERT INTO reports (
        user_id, title, details, location,
        severity, status, barangay_id,
        created_at, updated_at
    ) VALUES (
        p_user_id, p_title, p_details, p_location,
        p_severity, 'No status yet', p_barangay_id,
        NOW(), NOW()
    );
    SET v_report_id = LAST_INSERT_ID();
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (p_user_id, CONCAT('Submitted new report: ', p_title), v_report_id, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_report_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_report_status`(
    IN p_admin_id  INT,
    IN p_report_id INT,
    IN p_status    VARCHAR(20),
    IN p_notes     TEXT
)
BEGIN
    DECLARE v_admin_role    VARCHAR(20);
    DECLARE v_report_exists INT;
    SELECT role INTO v_admin_role FROM users WHERE user_id = p_admin_id;
    IF v_admin_role NOT IN ('Admin','City Staff','Barangay Officer') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'User is not authorized to update report status.';
    END IF;
    SELECT COUNT(*) INTO v_report_exists FROM reports WHERE report_id = p_report_id;
    IF v_report_exists = 0 THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Report does not exist.';
    END IF;
    IF p_status NOT IN ('No status yet','In Progress','Complete','On Hold','Cancelled') THEN
        SIGNAL SQLSTATE '45000'
            SET MESSAGE_TEXT = 'Invalid status value.';
    END IF;
    UPDATE reports
    SET status      = p_status,
        admin_notes = p_notes,
        modified_by = p_admin_id,
        updated_at  = NOW()
    WHERE report_id = p_report_id;
    INSERT INTO status_updates(report_id, user_id, status, notes, created_at)
    VALUES (p_report_id, p_admin_id, p_status, p_notes, NOW());
    INSERT INTO activity_logs(user_id, action, report_id, created_at)
    VALUES (p_admin_id,
            CONCAT('Updated report #', p_report_id, ' status to ', p_status),
            p_report_id, NOW());
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `table_constraints_view`
--

/*!50001 DROP VIEW IF EXISTS `table_constraints_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `table_constraints_view` AS select `information_schema`.`c`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`c`.`COLUMN_NAME` AS `COLUMN_NAME`,`information_schema`.`c`.`DATA_TYPE` AS `DATA_TYPE`,`information_schema`.`c`.`CHARACTER_MAXIMUM_LENGTH` AS `CHARACTER_MAXIMUM_LENGTH`,`information_schema`.`c`.`IS_NULLABLE` AS `IS_NULLABLE`,`information_schema`.`c`.`COLUMN_DEFAULT` AS `COLUMN_DEFAULT`,group_concat(distinct `information_schema`.`tc`.`CONSTRAINT_TYPE` order by `information_schema`.`tc`.`CONSTRAINT_TYPE` ASC separator ', ') AS `constraints` from ((`information_schema`.`COLUMNS` `c` left join `information_schema`.`KEY_COLUMN_USAGE` `kcu` on(((`information_schema`.`c`.`COLUMN_NAME` = `information_schema`.`kcu`.`COLUMN_NAME`) and (`information_schema`.`c`.`TABLE_NAME` = `information_schema`.`kcu`.`TABLE_NAME`) and (`information_schema`.`c`.`TABLE_SCHEMA` = `information_schema`.`kcu`.`TABLE_SCHEMA`)))) left join `information_schema`.`TABLE_CONSTRAINTS` `tc` on(((`information_schema`.`kcu`.`CONSTRAINT_NAME` = `information_schema`.`tc`.`CONSTRAINT_NAME`) and (`information_schema`.`tc`.`TABLE_NAME` = `information_schema`.`c`.`TABLE_NAME`) and (`information_schema`.`tc`.`TABLE_SCHEMA` = `information_schema`.`c`.`TABLE_SCHEMA`)))) where (`information_schema`.`c`.`TABLE_SCHEMA` = 'bantay_gensan') group by `information_schema`.`c`.`TABLE_NAME`,`information_schema`.`c`.`COLUMN_NAME`,`information_schema`.`c`.`DATA_TYPE`,`information_schema`.`c`.`CHARACTER_MAXIMUM_LENGTH`,`information_schema`.`c`.`IS_NULLABLE`,`information_schema`.`c`.`COLUMN_DEFAULT`,`information_schema`.`c`.`ORDINAL_POSITION` order by `information_schema`.`c`.`TABLE_NAME`,`information_schema`.`c`.`ORDINAL_POSITION` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_privileges`
--

/*!50001 DROP VIEW IF EXISTS `view_privileges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_privileges` AS select `information_schema`.`column_privileges`.`GRANTEE` AS `role`,`information_schema`.`column_privileges`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`column_privileges`.`COLUMN_NAME` AS `COLUMN_NAME`,group_concat(`information_schema`.`column_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`column_privileges`.`PRIVILEGE_TYPE` ASC separator ', ') AS `privileges` from `information_schema`.`COLUMN_PRIVILEGES` where ((`information_schema`.`column_privileges`.`TABLE_NAME` in ('reports','users','comments','ratings','report_images','status_updates','notifications','activity_logs','barangay_data')) and (`information_schema`.`column_privileges`.`GRANTEE` in ('admin_role@%','city_staff_role@%','barangay_officer_role@%','reporter_role@%'))) group by `information_schema`.`column_privileges`.`GRANTEE`,`information_schema`.`column_privileges`.`TABLE_NAME`,`information_schema`.`column_privileges`.`COLUMN_NAME` order by `information_schema`.`column_privileges`.`TABLE_NAME`,`information_schema`.`column_privileges`.`GRANTEE`,`information_schema`.`column_privileges`.`COLUMN_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_rls_pol`
--

/*!50001 DROP VIEW IF EXISTS `view_rls_pol`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_rls_pol` AS select `information_schema`.`tc`.`TABLE_NAME` AS `TABLE_NAME`,`information_schema`.`tc`.`CONSTRAINT_NAME` AS `policy_name`,`information_schema`.`tc`.`CONSTRAINT_TYPE` AS `command`,`information_schema`.`rc`.`UPDATE_RULE` AS `using_expression`,`information_schema`.`rc`.`DELETE_RULE` AS `with_check_expression` from (`information_schema`.`TABLE_CONSTRAINTS` `tc` left join `information_schema`.`REFERENTIAL_CONSTRAINTS` `rc` on(((`information_schema`.`tc`.`CONSTRAINT_NAME` = `information_schema`.`rc`.`CONSTRAINT_NAME`) and (`information_schema`.`tc`.`CONSTRAINT_SCHEMA` = `information_schema`.`rc`.`CONSTRAINT_SCHEMA`)))) where (`information_schema`.`tc`.`TABLE_SCHEMA` = 'bantay_gensan') order by `information_schema`.`tc`.`TABLE_NAME`,`information_schema`.`tc`.`CONSTRAINT_NAME` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_system_roles`
--

/*!50001 DROP VIEW IF EXISTS `view_system_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_system_roles` AS select `mysql`.`user`.`User` AS `role_name`,if((`mysql`.`user`.`account_locked` = 'Y'),'No','Yes') AS `can_login`,if((`mysql`.`user`.`Super_priv` = 'Y'),'Yes','No') AS `is_superuser` from `mysql`.`user` where (`mysql`.`user`.`User` in ('admin_role','city_staff_role','barangay_officer_role','reporter_role')) order by `mysql`.`user`.`User` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_table_privileges`
--

/*!50001 DROP VIEW IF EXISTS `view_table_privileges`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_table_privileges` AS select `information_schema`.`table_privileges`.`GRANTEE` AS `GRANTEE`,`information_schema`.`table_privileges`.`TABLE_NAME` AS `TABLE_NAME`,group_concat(`information_schema`.`table_privileges`.`PRIVILEGE_TYPE` order by `information_schema`.`table_privileges`.`PRIVILEGE_TYPE` ASC separator ', ') AS `privileges` from `information_schema`.`TABLE_PRIVILEGES` where ((`information_schema`.`table_privileges`.`TABLE_SCHEMA` = 'bantay_gensan') and (`information_schema`.`table_privileges`.`GRANTEE` in ('\'admin_role\'@\'%\'','\'city_staff_role\'@\'%\'','\'barangay_officer_role\'@\'%\'','\'reporter_role\'@\'%\''))) group by `information_schema`.`table_privileges`.`GRANTEE`,`information_schema`.`table_privileges`.`TABLE_NAME` order by `information_schema`.`table_privileges`.`TABLE_NAME`,`information_schema`.`table_privileges`.`GRANTEE` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `view_user_roles`
--

/*!50001 DROP VIEW IF EXISTS `view_user_roles`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `view_user_roles` AS select `u`.`User` AS `User`,`u`.`Host` AS `Host`,if((`u`.`account_locked` = 'Y'),'No','Yes') AS `can_login`,group_concat(`r`.`FROM_USER` separator ', ') AS `assigned_role` from (`mysql`.`user` `u` left join `mysql`.`role_edges` `r` on((`u`.`User` = `r`.`TO_USER`))) where (`u`.`User` in ('alex','jabbie','louise','marlo','vince')) group by `u`.`User`,`u`.`Host`,`u`.`account_locked` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-04-19 23:13:18
