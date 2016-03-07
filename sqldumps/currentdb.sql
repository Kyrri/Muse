-- MySQL dump 10.13  Distrib 5.6.27, for osx10.8 (x86_64)
--
-- Host: localhost    Database: muse_dev
-- ------------------------------------------------------
-- Server version	5.6.27-enterprise-commercial-advanced

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
-- Current Database: `muse_dev`
--

/*!40000 DROP DATABASE IF EXISTS `muse_dev`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `muse_dev` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `muse_dev`;

--
-- Table structure for table `ageRange`
--

DROP TABLE IF EXISTS `ageRange`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ageRange` (
  `ageRange` int(11) NOT NULL AUTO_INCREMENT,
  `ageRangeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ageRange`),
  UNIQUE KEY `ageRangeDesc` (`ageRangeDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ageRange`
--

LOCK TABLES `ageRange` WRITE;
/*!40000 ALTER TABLE `ageRange` DISABLE KEYS */;
INSERT INTO `ageRange` VALUES (1,'18-20'),(2,'20-25'),(3,'25-30'),(4,'30-40'),(5,'40-50'),(6,'50-60'),(7,'60-70'),(8,'70+'),(9,'N/A');
/*!40000 ALTER TABLE `ageRange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artist`
--

DROP TABLE IF EXISTS `artist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artist` (
  `artistId` int(11) NOT NULL AUTO_INCREMENT,
  `artist` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`artistId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Pierre-Auguste Renoir'),(2,'Wassily Kandinsky'),(3,'Vincent van Gogh'),(4,'Interwebs');
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `elementId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `artistId` int(11) DEFAULT NULL,
  `paintYear` int(11) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `imageLink` varchar(255) DEFAULT NULL,
  `exhibitId` int(11) NOT NULL,
  PRIMARY KEY (`elementId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,1,'Luncheon of the Boating Party',1,1881,'',NULL,1),(2,1,'Composition VIII',2,1923,'',NULL,1),(3,1,'Café Terrace at Night',3,1888,'',NULL,1),(4,1,'Maeby',4,2016,'A Cat Called Maeby','http://i.imgur.com/6oTvhPo.jpg',2),(5,1,'Baby Cat',4,2016,'A baby cat','http://i.imgur.com/5TTQdjM.jpg',2),(6,0,'test1',1,1993,'test','testtest',1),(7,0,'test2',1,1993,'test','testtest',1),(8,0,'test3',1,1993,'test','testtest',1),(9,1,'Demo Project 1',2,1993,'This is a description','',1);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementCode`
--

DROP TABLE IF EXISTS `elementCode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementCode` (
  `elementId` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  UNIQUE KEY `elementId` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementCode`
--

LOCK TABLES `elementCode` WRITE;
/*!40000 ALTER TABLE `elementCode` DISABLE KEYS */;
INSERT INTO `elementCode` VALUES (1,1325),(2,5728),(3,7793);
/*!40000 ALTER TABLE `elementCode` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementFacts`
--

DROP TABLE IF EXISTS `elementFacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementFacts` (
  `elementFactId` int(11) NOT NULL AUTO_INCREMENT,
  `elementId` int(11) NOT NULL,
  `active` int(11) NOT NULL DEFAULT '1',
  `factNumber` int(11) NOT NULL,
  `factText` varchar(140) NOT NULL,
  PRIMARY KEY (`elementFactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementFacts`
--

LOCK TABLES `elementFacts` WRITE;
/*!40000 ALTER TABLE `elementFacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `elementFacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementTag`
--

DROP TABLE IF EXISTS `elementTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementTag` (
  `elementTagId` int(11) NOT NULL AUTO_INCREMENT,
  `elementTag` varchar(255) DEFAULT NULL,
  `elementTagTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementTagId`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTag`
--

LOCK TABLES `elementTag` WRITE;
/*!40000 ALTER TABLE `elementTag` DISABLE KEYS */;
INSERT INTO `elementTag` VALUES (1,'Oil on Canvas',1),(2,'Aerospace',4),(3,'Automotive',4),(4,'Watercolour',1),(5,'Charcoal',1),(6,'pencil',1),(7,'ink',1),(8,'test',2),(9,'Enter tag name',2),(10,'test1',2),(15,'test5',1),(20,'test',4);
/*!40000 ALTER TABLE `elementTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementTagMapping`
--

DROP TABLE IF EXISTS `elementTagMapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementTagMapping` (
  `elementTagId` int(11) NOT NULL DEFAULT '0',
  `elementId` int(11) NOT NULL DEFAULT '0',
  `active` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`elementTagId`,`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTagMapping`
--

LOCK TABLES `elementTagMapping` WRITE;
/*!40000 ALTER TABLE `elementTagMapping` DISABLE KEYS */;
INSERT INTO `elementTagMapping` VALUES (1,1,1),(1,2,1),(1,3,1),(3,4,1),(3,5,1),(4,4,1),(8,1,1),(8,2,1),(9,1,1),(9,5,1),(10,1,1),(10,4,1);
/*!40000 ALTER TABLE `elementTagMapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementTagType`
--

DROP TABLE IF EXISTS `elementTagType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementTagType` (
  `elementTagTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `elementTagType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`elementTagTypeId`),
  UNIQUE KEY `elementTagTypeDesc` (`elementTagType`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTagType`
--

LOCK TABLES `elementTagType` WRITE;
/*!40000 ALTER TABLE `elementTagType` DISABLE KEYS */;
INSERT INTO `elementTagType` VALUES (2,'Genre'),(4,'Industry'),(1,'Medium'),(3,'Style');
/*!40000 ALTER TABLE `elementTagType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibit`
--

DROP TABLE IF EXISTS `exhibit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibit` (
  `exhibitId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `exhibitName` varchar(255) DEFAULT NULL,
  `museumId` int(11) NOT NULL,
  PRIMARY KEY (`exhibitId`),
  UNIQUE KEY `exhibitName` (`exhibitName`,`museumId`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibit`
--

LOCK TABLES `exhibit` WRITE;
/*!40000 ALTER TABLE `exhibit` DISABLE KEYS */;
INSERT INTO `exhibit` VALUES (1,1,'Muse Sample 1',1),(2,1,'Internet Cats',1),(3,0,'Test1',1),(6,0,'Test2',1),(7,0,'Test3',1);
/*!40000 ALTER TABLE `exhibit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gender`
--

DROP TABLE IF EXISTS `gender`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gender` (
  `gender` int(11) NOT NULL AUTO_INCREMENT,
  `genderDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`gender`),
  UNIQUE KEY `genderDesc` (`genderDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (2,'female'),(1,'male'),(3,'N/A');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interaction`
--

DROP TABLE IF EXISTS `interaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interaction` (
  `interactionId` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `interactionType` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `visitId` int(11) NOT NULL,
  PRIMARY KEY (`interactionId`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (1,'2016-02-23 18:21:43',1,2,1325,0),(2,'0000-00-00 00:00:00',1,1,1,1),(3,'2016-03-02 19:42:39',1,1,1,1),(4,'0000-00-00 00:00:00',1,1,1,1),(5,'0000-00-00 00:00:00',1,1,1,1),(6,'0000-00-00 00:00:00',1,1,1,1),(7,'0000-00-00 00:00:00',1,1,1,1),(8,'2016-02-03 05:00:00',1,1,1,1),(9,'2016-03-02 19:46:47',1,1,1,1),(10,'2016-03-02 19:47:09',1,1,1,1);
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactionType`
--

DROP TABLE IF EXISTS `interactionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactionType` (
  `interactionType` int(11) NOT NULL AUTO_INCREMENT,
  `interactionTypeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`interactionType`),
  UNIQUE KEY `interactionTypeDesc` (`interactionTypeDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactionType`
--

LOCK TABLES `interactionType` WRITE;
/*!40000 ALTER TABLE `interactionType` DISABLE KEYS */;
INSERT INTO `interactionType` VALUES (1,'checkin'),(4,'checkout'),(3,'favourite'),(2,'like');
/*!40000 ALTER TABLE `interactionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `loginId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `loginType` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `pass` varchar(720) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (3,1,1,'test1@test.com','test123',7),(4,1,1,'test2@test.com','test123',8),(5,1,1,'test3@test.com','test123',9),(6,1,1,'afadfsad%40sfsdfsd.com','sfadfadsfasd',10),(7,1,1,'Testingemail%40test.com','banana',11),(8,1,1,'Testing%40test.com','banana',12),(9,1,1,'123%40what.com','apple',13),(10,1,1,'yim.nathan%40gmail.com','musepassword',14),(11,1,1,'Chrrria%40gmail.ca','aaaaa',15),(12,1,1,'mtheng%40uwaterloo.ca','syde461demo',16),(13,1,1,'iangeasterbrook%40gmail.com','gg9911c3',17),(14,1,1,'chelsea.haemel%40hotmail.ca','chelsea',18),(15,1,1,'theojchan%40hotmail.com','Fire!blast5',19),(16,1,1,'Fjdosi%40isoos.odos','test123',20),(17,1,1,'nfjds%40uhfis.cds','test123',21),(18,1,1,'Shshsh%40dhdhdh.com','dhehrheh',22),(19,1,1,'Dhehrh%40djdhdh.dhdhd','djdhdhd',23),(20,1,1,'Tester%40walkthrough.com','dhdhdhdh',24),(21,1,1,'Isoshdk%40hsops.oso','sospskdo',25),(22,1,1,'Jsododi%40jspsp.pso','jdpsoss',26),(23,1,1,'Melissa.a.lynett%40gmail.com','AndrewIsWearingGrey',27),(24,1,1,'Shshsh%40shdhdh.djdjdj','sjshsjd',28),(25,1,1,'Dhdhdh%40djdhdh.djdhd','shehdhdhdhdh',29);
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loginType`
--

DROP TABLE IF EXISTS `loginType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `loginType` (
  `loginType` int(11) NOT NULL AUTO_INCREMENT,
  `loginTypeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`loginType`),
  UNIQUE KEY `loginTypeDesc` (`loginTypeDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loginType`
--

LOCK TABLES `loginType` WRITE;
/*!40000 ALTER TABLE `loginType` DISABLE KEYS */;
INSERT INTO `loginType` VALUES (1,'email');
/*!40000 ALTER TABLE `loginType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museum`
--

DROP TABLE IF EXISTS `museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `museum` (
  `museumId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `museumName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`museumId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum`
--

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;
INSERT INTO `museum` VALUES (1,1,'Muse Sample');
/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `gender` int(11) DEFAULT NULL,
  `ageRange` int(11) DEFAULT NULL,
  `userTypeId` int(11) NOT NULL,
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,1,'test1','test11',1,1,1),(8,1,'test2','',1,1,1),(9,1,'test2','lastnametest',1,1,1),(10,1,'adfadfadsf','afasdfad',1,1,1),(11,1,'Gloria','McPlot',1,1,1),(12,1,'','',1,1,1),(13,1,'Potato','Tomato',1,1,1),(14,1,'Nathan','Yim',1,1,1),(15,1,'A','A',1,1,1),(16,1,'m','bristow',1,1,1),(17,1,'Ian','Easterbrook',1,1,1),(18,1,'Chelsea','Haemel',1,1,1),(19,1,'Theo','Chan',1,1,1),(20,1,'','',1,1,1),(21,1,'','',1,1,1),(22,1,'Djdhrh','',1,1,1),(23,1,'Dhdhdhd','Dhdhdhd',1,1,1),(24,1,'Bob','Smith',1,1,1),(25,1,'','',1,1,1),(26,1,'','',1,1,1),(27,1,'Melissa','Lynett',1,1,1),(28,1,'','',1,1,1),(29,1,'Dhdhdhdh','',1,1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userType`
--

DROP TABLE IF EXISTS `userType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userType` (
  `userTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userTypeId`),
  UNIQUE KEY `userTypeDesc` (`userType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userType`
--

LOCK TABLES `userType` WRITE;
/*!40000 ALTER TABLE `userType` DISABLE KEYS */;
INSERT INTO `userType` VALUES (2,'admin'),(1,'visitor');
/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_elements`
--

DROP TABLE IF EXISTS `v_elements`;
/*!50001 DROP VIEW IF EXISTS `v_elements`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_elements` AS SELECT 
 1 AS `id`,
 1 AS `active`,
 1 AS `museum`,
 1 AS `exhibit`,
 1 AS `element`,
 1 AS `code`,
 1 AS `artist`,
 1 AS `year`,
 1 AS `description`,
 1 AS `imageLink`,
 1 AS `numTags`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_exhibits`
--

DROP TABLE IF EXISTS `v_exhibits`;
/*!50001 DROP VIEW IF EXISTS `v_exhibits`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_exhibits` AS SELECT 
 1 AS `museum`,
 1 AS `exhibit`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tags`
--

DROP TABLE IF EXISTS `v_tags`;
/*!50001 DROP VIEW IF EXISTS `v_tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_tags` AS SELECT 
 1 AS `id`,
 1 AS `active`,
 1 AS `element`,
 1 AS `type`,
 1 AS `tag`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_users`
--

DROP TABLE IF EXISTS `v_users`;
/*!50001 DROP VIEW IF EXISTS `v_users`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_users` AS SELECT 
 1 AS `id`,
 1 AS `userType`,
 1 AS `login`,
 1 AS `firstName`,
 1 AS `lastName`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visitId` int(11) NOT NULL AUTO_INCREMENT,
  `tstamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `visitDate` date NOT NULL,
  `userId` int(11) NOT NULL,
  `museumId` int(11) NOT NULL,
  `visitTypeId` int(11) NOT NULL,
  PRIMARY KEY (`visitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitType`
--

DROP TABLE IF EXISTS `visitType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitType` (
  `visitTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `visitType` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitTypeId`),
  UNIQUE KEY `visitType` (`visitType`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitType`
--

LOCK TABLES `visitType` WRITE;
/*!40000 ALTER TABLE `visitType` DISABLE KEYS */;
INSERT INTO `visitType` VALUES (1,'Free Roam'),(2,'Museum Curated');
/*!40000 ALTER TABLE `visitType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'muse_dev'
--
/*!50003 DROP FUNCTION IF EXISTS `f_getArtistId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getArtistId`(textName VARCHAR(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select artistId into id
	from artist where artist=textName;

	RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_getElementId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getElementId`(elementName varchar(255),exhibitName varchar(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select elementId into id
	from element where title=elementName and exhibitId=f_getExhibitId(exhibitName);

	RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_getElementTagId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getElementTagId`(textName varchar(255), tagType varchar(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select elementTagId into id
	from elementTag where elementTag=textName and elementTagTypeId=f_getElementTagTypeId(tagType);

	RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_getElementTagTypeId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getElementTagTypeId`(textName VARCHAR(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select elementTagTypeId into id
	from elementTagType where elementTagType=textName;

	RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_getExhibitId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getExhibitId`(textName varchar(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select exhibitId into id
	from exhibit where exhibitName=textName;

	RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `f_getMuseumId` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getMuseumId`(textName VARCHAR(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select museumId into id
	from museum where museumName=textName;

	RETURN id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `getElementDataFromCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `getElementDataFromCode`(
	IN vCode INTEGER,
    
	OUT vStat INTEGER,
    OUT vTitle VARCHAR(255),
    OUT vArtist VARCHAR(255),
    OUT vYear INTEGER,
    OUT vDesc LONGTEXT,
    OUT vImgLnk VARCHAR(255)
)
BEGIN
    
    SELECT COUNT(*) INTO vStat
    FROM elementCode
    WHERE code=vCode;
    
    IF vStat > 0 THEN
		SELECT e.title, e.artist, e.paintYear, e.description, e.imageLink
		INTO vTitle,vArtist,vYear,vDesc,vImgLnk
        FROM elementCode t
        INNER JOIN element e
        ON t.elementId=e.elementId
        WHERE t.code=vCode;
	ELSE 
		SELECT -1 INTO vStat;
    END IF;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_element` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_element`(
	in vExhibit varchar(255), 
    in vTitle varchar(255),
    in vArtist varchar(255),
    in vYear integer,
    in vDesc varchar(500), 
    in vImageLink varchar(255),
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	select count(*) into vExists from element
    where exhibitId=f_getExhibitId(vExhibit) and title=vTitle;
    
    if vExists=0 then 
		insert into element (
			title,
            artistId,
            paintYear,
            description, 
            imageLink,
            exhibitId
        ) values (
			vTitle, 
            f_getArtistId(vArtist),
            vYear,
            vDesc,
            vImageLink,
            f_getExhibitId(vExhibit)
        );
        select 0 into vSuccess;
    else
		select -2 into vSuccess;
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_elementTag` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_elementTag`(
	in vElementTag varchar(255),
    in vElementTagType varchar(255),
    out vSuccess integer
)
BEGIN
	declare vValid integer default 0;
    declare vElementTagTypeId integer default -1;
    
    select count(*) into vValid
    from elementTagType
    where elementTagType = vElementTagType;
    
    if vValid = 1 then 
		select elementTagTypeId into vElementTagTypeId 
        from elementTagType where elementTagType=vElementTagType;
        
        select count(*) into vValid 
        from elementTag where elementTag=vElementTag and elementTagTypeId=vElementTagTypeId;
        
        if vValid > 0 then
			select -2 into vSuccess; 
        else
			insert into elementTag (
				elementTag,
				elementTagTypeId
			) values (
				vElementTag,
				(select elementTagTypeId from elementTagType where elementTagType=vElementTagType)
			);
            select 0 into vSuccess;
        end if;
	else
		select -1 into vSuccess;
	end if;
    
    -- -1 error = tagType does not exist
    -- -2 error = tag already exists
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_elementTagMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_elementTagMapping`(
	in vElement varchar(255),
    in vExhibit varchar(255),
    in vElementTag varchar(255),
    in vElementTagType varchar(255),
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;

	select count(*) into vExists from elementTagMapping
    where elementTagId=f_getElementTagId(vElementTag,vElementTagType) and elementId=f_getElementId(vElement,vExhibit);
    
    if vExists=0 then 
		insert into elementTagMapping (
			elementTagId, elementId
		) values (
			f_getElementTagId(vElementTag,vElementTagType), f_getElementId(vElement,vExhibit)
		);
		select 0 into vSuccess;
	else 
		select -2 into vSuccess;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_exhibit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_exhibit`(
	in vMuseum varchar(255),
    in vExhibitName varchar(255),
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;

    select count(*) into vExists
    from exhibit
    where exhibitName=vExhibitName and museumId=f_getMuseumId(vMuseum);

	if vExists=0 then 
		insert into exhibit (
			exhibitName, museumId
		) values (
			vExhibitName, f_getMuseumId(vMuseum)
		);
		select 0 into vSuccess;
	else 
		select -2 into vSuccess;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_interaction` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_interaction`(
	IN vInteractionType INTEGER,
    IN vUserId INTEGER, 
    IN vElementId INTEGER,
    IN vVisitId INTEGER,
    IN vTstamp TIMESTAMP
)
BEGIN
    INSERT INTO interaction (
		interactionType, 
        userId,
        elementId,
        visitId, 
        tstamp
    ) VALUES (
		vInteractionType, 
        vUserId, 
        vElementId,
        vVisitId,
        vTstamp
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_visit` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_visit`(
	IN vVisitDate date, 
    IN vUserId integer, 
    IN vMuseumId integer, 
    IN vVisitTypeId integer
)
BEGIN
	INSERT INTO visit (
		visitDate,
        userId,
        museumId,
        visitTypeId
    ) VALUES (
		vVisitDate,
        vUserId,
        vMuseumId,
        vVisitTypeId
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `loginPasswordReturn` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `loginPasswordReturn`(
	IN vLogin VARCHAR(255),
    IN vLoginType INTEGER,
    OUT vSuccess INTEGER,
    OUT vPass VARCHAR(720),
    OUT vUserId INTEGER
)
BEGIN
	DECLARE vvalidLogin TINYINT DEFAULT 0;
    
	SELECT COUNT(*) INTO vvalidLogin
    FROM login
	WHERE login=vLogin AND loginType=vLoginType;
    
    IF vvalidLogin = 0 THEN
		SELECT -1 INTO vSuccess;
        SELECT -1 INTO vPass;
        SELECT -1 INTO vUserId;
	ELSE
		SELECT pass, userId
        INTO vPass, vUserId
		FROM login
		WHERE login=vLogin AND loginType=vLoginType;
        
        SELECT 1 INTO vSuccess;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userCreate` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userCreate`(
	IN vlogin VARCHAR(255), 
    IN vpass VARCHAR(255),
    IN vloginType INTEGER, 
    IN vuserType INTEGER,
    IN vfirstName VARCHAR(255),
    IN vlastName VARCHAR(255),
    IN vgender INTEGER,
    IN vageRange INTEGER,
	
    OUT vsuc TINYINT,
    OUT vmsg VARCHAR(255)

)
BEGIN
	
    DECLARE vvalidLogin TINYINT DEFAULT 0;
    
	SELECT COUNT(*) INTO vvalidLogin
    FROM login
	WHERE login=vlogin AND loginType=vloginType;
    
    IF vvalidLogin > 0 THEN
		SELECT "login already exisits" INTO vmsg;
        SELECT -1 INTO vsuc;
	ELSE
		INSERT INTO user (firstName, lastName, gender, ageRange,userTypeId)
        VALUES (vfirstName,vlastName,vgender,vageRange,vuserType);
        
        INSERT INTO login (loginType, login, pass, userId)
        VALUES (vloginType, vlogin, vpass, (SELECT MAX(userId) FROM user));
        
        SELECT "user added" INTO vmsg;
        SELECT 1 INTO vsuc;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `userLogin` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `userLogin`(
	IN vlogin VARCHAR(255),
    IN vpass VARCHAR(255),
    IN vloginType INTEGER,
    
    OUT vuserId INTEGER,
    OUT vmsg VARCHAR(255)
)
BEGIN
	DECLARE vvalidLogin TINYINT DEFAULT 0;
    
	SELECT COUNT(*) INTO vvalidLogin
    FROM login
	WHERE login=vlogin AND pass=vpass AND loginType=vloginType;
    
    IF vvalidLogin = 0 THEN
		SELECT "user does not exist or password incorrect" INTO vmsg;
        SELECT -1 INTO vuserId;
	ELSE
		SELECT userId INTO vuserId
		FROM login
		WHERE login=vlogin AND pass=vpass AND loginType=vLoginType;
        
        SELECT "login sucessful" INTO vmsg;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `muse_dev`
--

USE `muse_dev`;

--
-- Final view structure for view `v_elements`
--

/*!50001 DROP VIEW IF EXISTS `v_elements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elements` AS select `e`.`elementId` AS `id`,(case `e`.`active` when 1 then 'Active' when 0 then 'Inactive' end) AS `active`,`m`.`museumName` AS `museum`,`x`.`exhibitName` AS `exhibit`,`e`.`title` AS `element`,`c`.`code` AS `code`,`a`.`artist` AS `artist`,`e`.`paintYear` AS `year`,`e`.`description` AS `description`,`e`.`imageLink` AS `imageLink`,(select count(0) from `elementtagmapping` `tm` where (`tm`.`elementId` = `e`.`elementId`)) AS `numTags` from ((((`element` `e` left join `exhibit` `x` on((`e`.`exhibitId` = `x`.`exhibitId`))) left join `museum` `m` on((`x`.`museumId` = `m`.`museumId`))) left join `elementcode` `c` on((`e`.`elementId` = `c`.`elementId`))) left join `artist` `a` on((`e`.`artistId` = `a`.`artistId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_exhibits`
--

/*!50001 DROP VIEW IF EXISTS `v_exhibits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_exhibits` AS select `m`.`museumName` AS `museum`,`e`.`exhibitName` AS `exhibit`,`e`.`active` AS `active` from (`exhibit` `e` left join `museum` `m` on((`e`.`museumId` = `m`.`museumId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_tags`
--

/*!50001 DROP VIEW IF EXISTS `v_tags`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_tags` AS select `m`.`elementId` AS `id`,(case `m`.`active` when 1 then 'Active' when 0 then 'Inactive' end) AS `active`,`e`.`title` AS `element`,`tt`.`elementTagType` AS `type`,`t`.`elementTag` AS `tag` from (((`elementtagmapping` `m` left join `element` `e` on((`m`.`elementId` = `e`.`elementId`))) left join `elementtag` `t` on((`m`.`elementTagId` = `t`.`elementTagId`))) left join `elementtagtype` `tt` on((`t`.`elementTagTypeId` = `tt`.`elementTagTypeId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_users`
--

/*!50001 DROP VIEW IF EXISTS `v_users`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_users` AS select distinct `l`.`userId` AS `id`,`t`.`userType` AS `userType`,`l`.`login` AS `login`,`u`.`firstName` AS `firstName`,`u`.`lastName` AS `lastName` from ((`login` `l` left join `user` `u` on((`l`.`userId` = `u`.`userId`))) left join `usertype` `t` on((`u`.`userTypeId` = `t`.`userTypeId`))) where (`u`.`active` = 1) */;
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

-- Dump completed on 2016-03-07  0:51:59
