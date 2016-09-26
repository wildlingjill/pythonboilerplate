CREATE DATABASE  IF NOT EXISTS `beltproject1` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `beltproject1`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: beltproject1
-- ------------------------------------------------------
-- Server version	5.5.42

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
-- Table structure for table `friends`
--

DROP TABLE IF EXISTS `friends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `friends` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `friend_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `friends`
--

LOCK TABLES `friends` WRITE;
/*!40000 ALTER TABLE `friends` DISABLE KEYS */;
INSERT INTO `friends` VALUES (14,3,5),(28,8,2),(29,2,8),(30,2,6),(31,6,2);
/*!40000 ALTER TABLE `friends` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'Jill Robinson','Jill','jill@coding.com','$2b$12$Yo6pyZ4JkYU5T0RCxd50K.3X3kedJojtuLKwotNrp9pFVABjjBlGm','1990-07-14 00:00:00','2016-09-25 19:13:43',NULL),(3,'Gracia Lee','Gracia','glee@coding.com','$2b$12$prnAjIZdjT88RzKWdhVJ6uhbqDI2OwT/whFkW.9iO819D.l5eU.k.','2016-09-13 00:00:00','2016-09-25 19:21:48',NULL),(4,'Michael','Michael','michael@coding.com','$2b$12$Z0UUhazbeMLXb67Vob3o.ur7S/zzXT0yRRT6mfbXCewG3/VwMUZRm','2016-09-01 00:00:00','2016-09-25 19:22:17',NULL),(5,'Johnny','Johnny','johnny@coding.com','$2b$12$cBkEFQoIqFbuNclFrX3UmOXCqJ/fUbcFT0mD/L1TOETYR9mRSBJZC','2016-02-10 00:00:00','2016-09-25 19:22:40',NULL),(6,'Daniel','Daniel','daniel@coding.com','$2b$12$qS6zcHgOdxweuX0/6RMkgeAwogWxcwfOn1X69w46/sK6bIm.eZy8G','1990-02-17 00:00:00','2016-09-25 20:02:35',NULL),(8,'Devan Wong','Devan','devan@coding.com','$2b$12$lykmWwBnColcLwV2OxSSRe.kExjBwuUYxGBD8yfs6sgz8NGG7if.2','2016-09-05 00:00:00','2016-09-25 21:49:24',NULL);
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

-- Dump completed on 2016-09-25 21:56:03
