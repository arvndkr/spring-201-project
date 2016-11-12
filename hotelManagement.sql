-- MySQL dump 10.13  Distrib 5.6.26, for Win32 (x86)
--
-- Host: localhost    Database: app
-- ------------------------------------------------------
-- Server version	5.6.26-log

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
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `bookings` (
  `booking_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user` int(10) unsigned NOT NULL DEFAULT '0',
  `city` int(10) unsigned NOT NULL DEFAULT '0',
  `hotel` int(10) unsigned NOT NULL DEFAULT '0',
  `no_of_rooms` int(10) unsigned NOT NULL DEFAULT '0',
  `check_in_date` date NOT NULL DEFAULT '0000-00-00',
  `check_out_date` date NOT NULL DEFAULT '0000-00-00',
  `amount` double NOT NULL DEFAULT '0',
  `ref_id` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`booking_id`),
  KEY `FK_bookings_user` (`user`),
  KEY `FK_bookings_hotel` (`hotel`),
  KEY `FK_bookings_city` (`city`),
  CONSTRAINT `FK_bookings_city` FOREIGN KEY (`city`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `FK_bookings_hotel` FOREIGN KEY (`hotel`) REFERENCES `hotels` (`hotel_id`),
  CONSTRAINT `FK_bookings_user` FOREIGN KEY (`user`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bookings`
--

LOCK TABLES `bookings` WRITE;
/*!40000 ALTER TABLE `bookings` DISABLE KEYS */;
/*!40000 ALTER TABLE `bookings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cities`
--

DROP TABLE IF EXISTS `cities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cities` (
  `city_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `city_name` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cities`
--

LOCK TABLES `cities` WRITE;
/*!40000 ALTER TABLE `cities` DISABLE KEYS */;
INSERT INTO `cities` VALUES (1,'Delhi'),(2,'Chennai'),(3,'Bangalore');
/*!40000 ALTER TABLE `cities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hotels`
--

DROP TABLE IF EXISTS `hotels`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hotels` (
  `hotel_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `hotel_name` varchar(45) NOT NULL DEFAULT '',
  `city` int(10) unsigned NOT NULL DEFAULT '0',
  `number_of_rooms` int(10) unsigned NOT NULL DEFAULT '0',
  `rating` int(10) unsigned NOT NULL DEFAULT '0',
  `rent` double NOT NULL DEFAULT '0',
  PRIMARY KEY (`hotel_id`),
  KEY `FK_Hotel_City` (`city`),
  CONSTRAINT `FK_Hotel_City` FOREIGN KEY (`city`) REFERENCES `cities` (`city_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hotels`
--

LOCK TABLES `hotels` WRITE;
/*!40000 ALTER TABLE `hotels` DISABLE KEYS */;
INSERT INTO `hotels` VALUES (1,'Taj Residency',1,15,5,2500),(2,'Hyatt',2,20,4,2000),(3,'Royal Marine',1,25,3,1500),(4,'Residency',1,15,4,1000),(5,'Rose Lawn',1,30,5,3000),(6,'White Palace',1,20,4,2000),(7,'Green Resort',1,40,3,1000);
/*!40000 ALTER TABLE `hotels` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_roles`
--

DROP TABLE IF EXISTS `user_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_roles` (
  `role_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `role` varchar(45) NOT NULL DEFAULT '',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_roles`
--

LOCK TABLES `user_roles` WRITE;
/*!40000 ALTER TABLE `user_roles` DISABLE KEYS */;
INSERT INTO `user_roles` VALUES (1,'user');
/*!40000 ALTER TABLE `user_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `user_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `user_name` varchar(45) NOT NULL DEFAULT '',
  `password` varchar(45) NOT NULL DEFAULT '',
  `user_role` int(10) unsigned NOT NULL DEFAULT '0',
  `city` int(10) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`user_id`),
  KEY `FK_Users_Role` (`user_role`),
  KEY `FK_City` (`city`),
  CONSTRAINT `FK_City` FOREIGN KEY (`city`) REFERENCES `cities` (`city_id`),
  CONSTRAINT `FK_Users_Role` FOREIGN KEY (`user_role`) REFERENCES `user_roles` (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-12 12:46:58
