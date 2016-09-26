CREATE DATABASE  IF NOT EXISTS `beltproject2` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `beltproject2`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: 127.0.0.1    Database: beltproject2
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
-- Table structure for table `favourites`
--

DROP TABLE IF EXISTS `favourites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `favourites` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `quote_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favourites`
--

LOCK TABLES `favourites` WRITE;
/*!40000 ALTER TABLE `favourites` DISABLE KEYS */;
INSERT INTO `favourites` VALUES (4,3,1),(6,2,2),(8,2,3),(9,4,3),(10,1,3),(11,1,1),(15,5,2),(16,1,4);
/*!40000 ALTER TABLE `favourites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `quotes`
--

DROP TABLE IF EXISTS `quotes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quotes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `author_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `quotes`
--

LOCK TABLES `quotes` WRITE;
/*!40000 ALTER TABLE `quotes` DISABLE KEYS */;
INSERT INTO `quotes` VALUES (1,'Obi-Wan Kenobi: These are not the droids you\'re looking for.',1,'0000-00-00 00:00:00',NULL),(2,'Devan Wong: I hear what you\'re saying, but...',2,'2016-09-26 10:12:23',NULL),(3,'Jill Robinson: I have no idea what I\'m doing with these SQL queries right now.',4,'2016-09-26 10:31:15',NULL),(4,'Jill Robinson: Nothing is working and everything is terrible',5,NULL,NULL),(5,'Me: Why is nothing working??',4,NULL,NULL),(6,'Why??Me',1,NULL,NULL),(7,'Me:Does this even work?',1,NULL,NULL),(8,'Jill: I\'m officially terrible at MySQL queries.',1,NULL,NULL);
/*!40000 ALTER TABLE `quotes` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'Jill Robinson','Jill','jill@coding.com','$2b$12$FAWiJbAwuNv5NLO1geJpQeAk51r8.nhzH/flGJagIWtT.CmoBkBxS','2016-09-05 00:00:00','2016-09-26 09:35:21',NULL),(2,'Devan','Devan','devan@coding.com','$2b$12$F/BIZetC0FNbdMNN8gTSEuoSRY5aoDdFTARxOyRRy5i9Gzdb3N0nm','2016-09-06 00:00:00','2016-09-26 10:01:54',NULL),(3,'Bob','Bob','bob@coding.com','$2b$12$q3e5dNcTPqh/ICNIUn8PC.y9A1rOo23JfCzjnzf9dttR7QwUca6M6','2016-09-03 00:00:00','2016-09-26 10:02:14',NULL),(4,'Daniel','Daniel','daniel@coding.com','$2b$12$9ugD09j1eGBpgEVA0nm1ieCJ66LtbP8vADLpXuMXzdyEZBtJtrj8G','2016-09-05 00:00:00','2016-09-26 10:02:32',NULL),(5,'Michael','Michael','michael@coding.com','$2b$12$BVIJnviR6Oo1aLikMVW1RuTkw5KBqgOjYWyjYfgN3pY0omfxccTjW','2016-09-12 00:00:00','2016-09-26 12:22:11',NULL);
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

-- Dump completed on 2016-09-26 13:23:26
