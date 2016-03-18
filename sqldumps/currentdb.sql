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
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`artistId`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artist`
--

LOCK TABLES `artist` WRITE;
/*!40000 ALTER TABLE `artist` DISABLE KEYS */;
INSERT INTO `artist` VALUES (1,'Pierre-Auguste Renoir',1),(2,'Wassily Kandinsky',1),(3,'Vincent van Gogh',1),(4,'Interwebs',1),(5,'test1',1),(6,'hello\'s',1);
/*!40000 ALTER TABLE `artist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `checkInDuration`
--

DROP TABLE IF EXISTS `checkInDuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `checkInDuration` (
  `visitId` int(11) NOT NULL,
  `elementId` int(11) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  KEY `fk_checkInDuration_elementId_idx` (`elementId`),
  KEY `fk_checkInDuration_visitId_idx` (`visitId`),
  CONSTRAINT `fk_checkInDuration_elementId` FOREIGN KEY (`elementId`) REFERENCES `element` (`elementId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_checkInDuration_visitId` FOREIGN KEY (`visitId`) REFERENCES `visit` (`visitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `checkInDuration`
--

LOCK TABLES `checkInDuration` WRITE;
/*!40000 ALTER TABLE `checkInDuration` DISABLE KEYS */;
INSERT INTO `checkInDuration` VALUES (5,4,'2016-03-10 04:58:22','2016-03-10 18:30:35',48733),(7,4,'2016-03-10 18:48:39','2016-03-10 18:48:40',1),(8,4,'2016-03-14 21:28:44','2016-03-14 21:29:43',59),(13,4,'2016-03-14 23:24:28','2016-03-14 23:37:10',762),(14,4,'2016-03-15 02:27:19','2016-03-15 02:27:23',4),(15,4,'2016-03-16 07:00:25','2016-03-16 07:03:56',211),(16,4,'2016-03-17 17:54:30','2016-03-17 17:56:24',114);
/*!40000 ALTER TABLE `checkInDuration` ENABLE KEYS */;
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
  `utilTime` int(11) NOT NULL DEFAULT '45',
  PRIMARY KEY (`elementId`),
  KEY `fk_element_artistId_idx` (`artistId`),
  KEY `fk_element_exhibitId_idx` (`exhibitId`),
  CONSTRAINT `fk_element_artistId` FOREIGN KEY (`artistId`) REFERENCES `artist` (`artistId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_element_exhibitId` FOREIGN KEY (`exhibitId`) REFERENCES `exhibit` (`exhibitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,1,'Luncheon of the Boating Party',1,1881,'Test description',NULL,1,45),(2,1,'Composition VIII',2,1923,'',NULL,1,45),(3,1,'Café Terrace at Night',3,1888,'A nice piece',NULL,1,45),(4,1,'Maeby',4,2016,'A Cat Called Maeby','http://i.imgur.com/6oTvhPo.jpg',2,45),(5,1,'Baby Cat',4,2016,'A baby cat','http://i.imgur.com/5TTQdjM.jpg',2,45),(6,0,'test1',1,1993,'test','testtest',3,45),(7,0,'test2',1,1993,'test','testtest',1,45),(8,0,'test3',1,1993,'test','testtest',1,45),(9,0,'Demo Project 1',2,1993,'This is a description','',1,45),(10,0,'Andrews Test',4,1456,'The form works','testtest',1,45),(11,0,'Another Test',1,1234,'1234','1234',1,45),(12,0,'Another Test1',1,0,'','',1,45),(13,1,'At1',1,1333,'adfadsfad','adfasdfadsfad',1,45),(14,1,'New Element',4,1234,'adfadfad','adfasdfasdfads',2,45);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
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
  `active` int(11) NOT NULL DEFAULT '1',
  PRIMARY KEY (`elementTagId`),
  KEY `fk_elementTag_elementTagTypeId_idx` (`elementTagTypeId`),
  CONSTRAINT `fk_elementTag_elementTagTypeId` FOREIGN KEY (`elementTagTypeId`) REFERENCES `elementTagType` (`elementTagTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTag`
--

LOCK TABLES `elementTag` WRITE;
/*!40000 ALTER TABLE `elementTag` DISABLE KEYS */;
INSERT INTO `elementTag` VALUES (1,'Oil on Canvas',1,1),(2,'Aerospace',4,1),(3,'Automotive',4,1),(4,'Watercolour',1,1),(5,'Charcoal',1,1),(6,'pencil',1,1),(7,'ink',1,1),(8,'test',2,1),(9,'Enter tag name',2,1),(10,'test1',2,1),(15,'test5',1,1),(20,'test',4,1),(21,'itest1',4,1),(22,'Oil on Wood',1,1);
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
  PRIMARY KEY (`elementTagId`,`elementId`),
  KEY `fk_elementTagMapping_elementId_idx` (`elementId`),
  CONSTRAINT `fk_elementTagMapping_elementId` FOREIGN KEY (`elementId`) REFERENCES `element` (`elementId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_elementTagMapping_elementTagId` FOREIGN KEY (`elementTagId`) REFERENCES `elementTag` (`elementTagId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTagMapping`
--

LOCK TABLES `elementTagMapping` WRITE;
/*!40000 ALTER TABLE `elementTagMapping` DISABLE KEYS */;
INSERT INTO `elementTagMapping` VALUES (1,1,1),(1,2,1),(1,3,1),(3,4,1),(3,5,0),(4,4,1),(8,1,1),(8,2,1),(8,4,0),(9,1,1),(9,5,1),(10,1,1),(10,4,0),(20,4,1),(21,4,1);
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
-- Table structure for table `elementcode`
--

DROP TABLE IF EXISTS `elementcode`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementcode` (
  `elementId` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  `locationId` int(11) DEFAULT NULL,
  UNIQUE KEY `elementId` (`elementId`,`code`),
  KEY `fk_elementcode_locationId_idx` (`locationId`),
  CONSTRAINT `fk_elementcode_elementId` FOREIGN KEY (`elementId`) REFERENCES `element` (`elementId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_elementcode_locationId` FOREIGN KEY (`locationId`) REFERENCES `location` (`locationId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementcode`
--

LOCK TABLES `elementcode` WRITE;
/*!40000 ALTER TABLE `elementcode` DISABLE KEYS */;
INSERT INTO `elementcode` VALUES (1,1325,NULL),(2,5728,NULL),(3,7793,NULL),(4,1234,NULL),(13,1122,NULL),(5,6778,NULL),(6,1111,NULL);
/*!40000 ALTER TABLE `elementcode` ENABLE KEYS */;
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
  UNIQUE KEY `exhibitName` (`exhibitName`,`museumId`),
  KEY `fk_exhibit_museumId_idx` (`museumId`),
  CONSTRAINT `fk_exhibit_museumId` FOREIGN KEY (`museumId`) REFERENCES `museum` (`museumId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibit`
--

LOCK TABLES `exhibit` WRITE;
/*!40000 ALTER TABLE `exhibit` DISABLE KEYS */;
INSERT INTO `exhibit` VALUES (1,1,'Muse Sample 1',1),(2,1,'Internet Cats',1),(3,0,'Test1',2),(6,0,'Test2',1),(7,0,'Test3',1),(8,1,'test4',1);
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
INSERT INTO `gender` VALUES (2,'Female'),(1,'Male'),(3,'N/A');
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
  `interactionTypeId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `elementId` int(11) DEFAULT '-1',
  `visitId` int(11) NOT NULL,
  PRIMARY KEY (`interactionId`),
  KEY `fk_interaction_interactionTypeId_idx` (`interactionTypeId`),
  KEY `fk_interaction_userId_idx` (`userId`),
  KEY `fk_interaction_elementId_idx` (`elementId`),
  KEY `fk_interaction_visitId_idx` (`visitId`),
  CONSTRAINT `fk_interaction_interactionTypeId` FOREIGN KEY (`interactionTypeId`) REFERENCES `interactionType` (`interactionType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_interaction_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_interaction_visitId` FOREIGN KEY (`visitId`) REFERENCES `visit` (`visitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (1,'2016-03-14 23:14:15',3,34,4,13),(2,'2016-03-14 23:24:28',1,34,4,13),(3,'2016-03-14 23:37:10',4,34,4,13),(4,'2016-03-15 02:25:40',5,35,NULL,14),(6,'2016-03-15 02:26:24',4,35,15,14),(7,'2016-03-15 02:27:19',1,35,4,14),(8,'2016-03-15 02:27:23',6,35,NULL,14),(9,'2016-03-15 02:27:23',4,35,4,14),(10,'2016-03-16 06:55:26',5,33,NULL,15),(11,'2016-03-16 07:00:22',5,33,NULL,15),(12,'2016-03-16 07:18:14',1,33,4,15),(13,'2016-03-16 07:03:56',4,33,4,15),(14,'2016-03-16 07:03:56',2,33,4,15),(15,'2016-03-16 07:07:52',5,33,NULL,15),(16,'2016-03-16 07:10:15',5,33,NULL,15),(17,'2016-03-16 07:14:58',5,33,NULL,15),(18,'2016-03-16 07:15:47',5,33,NULL,15),(19,'2016-03-17 17:54:25',5,41,NULL,16),(20,'2016-03-18 02:55:06',1,41,4,16),(21,'2016-03-17 17:56:24',2,41,4,16),(22,'2016-03-17 17:56:24',4,41,4,16),(23,'2016-03-17 23:22:24',5,41,NULL,16),(24,'2016-03-18 02:11:06',5,41,NULL,16),(25,'2016-03-18 02:55:03',5,41,NULL,16);
/*!40000 ALTER TABLE `interaction` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS calc_interactionDuration */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger calc_interactionDuration after insert on interaction
for each row
begin 
	if new.interactionTypeId = 6 then 
		delete from visitDuration where visitId=new.visitId;
        insert into visitDuration (
			visitId,
            startTime,
            endTime
        ) values (
			new.visitId,
            (select tstamp from interaction 
				where interactionTypeId=5
				and visitId=new.visitId
                order by tstamp desc 
                limit 1),
			new.tstamp
        );
        CALL `muse_dev`.`update_visitDuration`();
	elseif new.interactionTypeId = 4 then
		delete from checkInDuration where elementId=new.elementId and visitId=new.visitId;
        insert into checkInDuration (
			visitId,
            elementId,
            startTime,
            endTime
        ) values (
			new.visitId,
            new.elementId,
            (select tstamp from interaction 
				where interactionTypeId=1
				and visitId=new.visitId and elementId=new.elementId
                order by tstamp desc 
                limit 1),
			new.tstamp
        );
        CALL `muse_dev`.`update_checkInDuration`();
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
/*!50032 DROP TRIGGER IF EXISTS calc_interactionDurationUpdate */;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 trigger calc_interactionDurationUpdate after update on interaction
for each row
begin 
	if new.interactionTypeId = 6 then 
		delete from visitDuration where visitId=new.visitId;
        insert into visitDuration (
			visitId,
            startTime,
            endTime
        ) values (
			new.visitId,
            (select tstamp from interaction 
				where interactionTypeId=5
				and visitId=new.visitId
                order by tstamp desc 
                limit 1),
			new.tstamp
        );
        CALL `muse_dev`.`update_visitDuration`();
	elseif new.interactionTypeId = 4 then
		delete from checkInDuration where elementId=new.elementId and visitId=new.visitId;
        insert into checkInDuration (
			visitId,
            elementId,
            startTime,
            endTime
        ) values (
			new.visitId,
            new.elementId,
            (select tstamp from interaction 
				where interactionTypeId=1
				and visitId=new.visitId and elementId=new.elementId
                order by tstamp desc 
                limit 1),
			new.tstamp
        );
        CALL `muse_dev`.`update_checkInDuration`();
    end if;
end */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactionType`
--

LOCK TABLES `interactionType` WRITE;
/*!40000 ALTER TABLE `interactionType` DISABLE KEYS */;
INSERT INTO `interactionType` VALUES (1,'checkIn'),(4,'checkout'),(3,'favourite'),(2,'like'),(6,'visitEnd'),(5,'visitStart');
/*!40000 ALTER TABLE `interactionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `location` (
  `locationId` int(11) NOT NULL AUTO_INCREMENT,
  `exhibitId` int(11) NOT NULL,
  `locationDesc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`locationId`),
  KEY `fk_location_exhibitId_idx` (`exhibitId`),
  CONSTRAINT `fk_location_exhibitId` FOREIGN KEY (`exhibitId`) REFERENCES `exhibit` (`exhibitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
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
  PRIMARY KEY (`loginId`),
  KEY `fk_login_loginType_idx` (`loginType`),
  KEY `fk_login_userId_idx` (`userId`),
  CONSTRAINT `fk_login_loginType` FOREIGN KEY (`loginType`) REFERENCES `loginType` (`loginType`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_login_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (1,1,1,'admin%40muse.com','',1),(3,1,1,'test1@test.com','test123',7),(4,1,1,'test2@test.com','test123',8),(5,1,1,'test3@test.com','test123',9),(6,1,1,'afadfsad%40sfsdfsd.com','sfadfadsfasd',10),(7,1,1,'Testingemail%40test.com','banana',11),(8,1,1,'Testing%40test.com','banana',12),(9,1,1,'123%40what.com','apple',13),(10,1,1,'yim.nathan%40gmail.com','musepassword',14),(11,1,1,'Chrrria%40gmail.ca','aaaaa',15),(12,1,1,'mtheng%40uwaterloo.ca','syde461demo',16),(13,1,1,'iangeasterbrook%40gmail.com','gg9911c3',17),(14,1,1,'chelsea.haemel%40hotmail.ca','chelsea',18),(15,1,1,'theojchan%40hotmail.com','Fire!blast5',19),(16,1,1,'Fjdosi%40isoos.odos','test123',20),(17,1,1,'nfjds%40uhfis.cds','test123',21),(18,1,1,'Shshsh%40dhdhdh.com','dhehrheh',22),(19,1,1,'Dhehrh%40djdhdh.dhdhd','djdhdhd',23),(20,1,1,'Tester%40walkthrough.com','dhdhdhdh',24),(21,1,1,'Isoshdk%40hsops.oso','sospskdo',25),(22,1,1,'Jsododi%40jspsp.pso','jdpsoss',26),(23,1,1,'Melissa.a.lynett%40gmail.com','AndrewIsWearingGrey',27),(24,1,1,'Shshsh%40shdhdh.djdjdj','sjshsjd',28),(25,1,1,'Dhdhdh%40djdhdh.djdhd','shehdhdhdhdh',29),(26,1,1,'andrewtest%40test.com','pbkdf2$10000$41b577b7a744f907e037db86b82d8ea1c2e7c7a38b25df882b18ca0bc9e619892acfb84eed0861715f104762708e996154d5307f8be1deb978a58f5e186b8bad$e536dd46822cbf694e0b7cc6601b0b3b51069879fda1e4b89c77cd67783b80b0b5aa0f4e855585b6be0b67290ff02d86569b416fd223ba55e',30),(27,1,1,'a1%40test.com','pbkdf2$10000$42489d2826869b5c3df8aefa83168a0c56b5311ce36ce920b76d6a2d9dcee43de7d85a0b964725b00ed98ee0c7a96a53565380385e5f68e4f5c68264f76fc7ba$50ee40ec8d28c03664140044c4ee6ec4086098e25e2f260cea8757ae9ff3af036a4499d0c5a562b9f47be9ca0e6f650a8c67cefdb8cd0b320',31),(28,1,1,'a2%40test.com','pbkdf2$10000$22c9920564f01d8a3eef6bdc3575ab3f8c451399b0cd8df77c2a7a752606dfafd386ef4e731ee9b57fe445f4c578ec59e92d338e5efe4e7f48279cfee64e55e6$185c0786e48e0a6a46a1df0969f26fba466ea0d469d275a2b9c8d8f154d5237774aef8ddfe2aaafc6ee466be244fd91a0b7aea5d4d7fdde4d',32),(29,1,1,'a3%40test.com','pbkdf2$10000$c3014a9ee5f9c8261208666cdb0c424e676afd05c44f550318afa35a0b7c4a153c5302947dae22833cfa25898f7794cd1495aa9d42a261d05d9e5eb6c3e196ca$1480f783fa14d2ca9c112452f35a95800496cb2c92b5655f408097e482533abf02084efd412b6e4f613bc7cca30654c0a754ed5d36b764f1e519878468c3186a',33),(30,1,1,'a4%40test.com','pbkdf2$10000$dc5f6dc4561caed629af9f6367cbb8b81dce3764f7a7d480267ac803a4e69252bee37b1f8a0ad68baf7efe175d7f78692f8688aa7bfcb0984a306056a088cb34$d04711540ab09cafa0f6e8b02af24fa43a794e3bdaad0fc14a792b6192cc54a7c17bbf7844509bf6a3cdf502de10b88c878fad8d5d53e5161b26c978a6825be2',34),(31,1,1,'a5%40test.com','pbkdf2$10000$96c01d3d084c577e99629effeb000abcad856a9f8e4ee299989de805b146e975ad0bc4f6ab7f5f6cf7fc5b6deaacdd5316a917d44143547557c9ace2f711de45$97e8ab4b1a7dd17841c3022c97641aa924092c0ff77e79d0de0ae1f65f3637c68fb418b736db73d536f454387d52529b12a016590b64b925e07bc4ab4cf5435b',35),(32,1,1,'a6%40test.com','pbkdf2$10000$71ed62777f1d75c6b1d8b03b3067607b45dadd18c9fadb0042d93292814bb78b078e3459da1ffc68807f7b140f89d622270b52a9dafeee46f8a3a7633f34404d$dcf0c67f528e2a2329fd6ffcea56185f627f0a657ca960e4bab19eaa1b119722b924c37a817d584283470fded8c585418d38803b81e5218d8216237cb445edfa',36),(33,1,1,'a7%40test.com','pbkdf2$10000$8235f68ec4259ab069055a60e3e1658c7e374f0b32ff640804e7db78e2ef50014efc97505538eac2a2657e1683aacaa64c821cde69a03593fb333623e2ffb258$3203491860096dd7c83674f74dc4e512d11ee9e729e4733c3abf3bc1e3392f81ba11ea4c44fd5002ff6ab98a2cf17cb01e7f08f07e40ced0c56948f28b9be15b',37),(34,1,1,'a9%40test.com','pbkdf2$10000$f1fae1b66dc743855b8323b7a18065d1538ea03dee8a235700473fc0d0a056f096766cb8367145f225593f3ffbb6cf04a08973e3bd55e7fd6ed1b6db92e06d4a$4fa2437f72a63efd27f90db448fc23a85b4caf779b4e0048650f89fa62920fa75d4145e884b6ce11e0362753a1a846afa492d42ff0e0daa4ea5cc43a31b6ef46',38),(35,1,1,'a10%40test.com','pbkdf2$10000$1d93e46dd2b2b178f9c148e25d1061e51a7d02fdd7592d18fd9d4f44bb34b60811dae3fe685f5b0b5615fbfc5f283d17eacf4d3e434e33929e06de6c18ea37cb$1cfa39217b0cb2f712dbe7e0690d0b087416e4530275d01ac8b95a113c84f2d062d71b586bdf50b7337871c56c920e26f7950e04be0cc33c4839307b41245d67',39),(36,1,1,'a11%40test.com','pbkdf2$10000$5c564564011cb820e68066d8d6efa394cd109d68e5d36d2d4f80d00a19497b23053e7b58700dd3efb1dff1b2762f9f14df40105baeae385658766627d35d9502$a90e8a427860c1af1a44a5970885a4cf8cf60605e7cdcce880765177f6d5d824b14eead7b675f5fced401f2676c211fa993f81269fcf7e9b205d957cd602b485',40),(37,1,1,'a12\\%40test.com','pbkdf2$10000$85610fbe9a081215efb11a86413ee51432632208fec84e18eb97d78e4427d6f1ab9b573103e624cf5ad77d43409279f81b24771b01ba35181bb05faf83e96e02$8e4c98ea72a3d598cb74e13cba972e2f4935dc1ac2f48077a71daea3d8d0f8e146086cefb5bbc2a2d7410a79e6a2ac215a40f2a38d0bc91d81b5fa71734120e7',41);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum`
--

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;
INSERT INTO `museum` VALUES (1,1,'Muse Sample'),(2,1,'The Met'),(3,1,'MoMA');
/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `museumPermission`
--

DROP TABLE IF EXISTS `museumPermission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `museumPermission` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `museumId` int(11) NOT NULL DEFAULT '0',
  `active` int(11) DEFAULT '1',
  PRIMARY KEY (`userId`,`museumId`),
  KEY `fk_museumPermission_museumId_idx` (`museumId`),
  CONSTRAINT `fk_museumPermission_museumId` FOREIGN KEY (`museumId`) REFERENCES `museum` (`museumId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_museumPermission_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museumPermission`
--

LOCK TABLES `museumPermission` WRITE;
/*!40000 ALTER TABLE `museumPermission` DISABLE KEYS */;
INSERT INTO `museumPermission` VALUES (1,1,1),(1,2,1),(1,3,1);
/*!40000 ALTER TABLE `museumPermission` ENABLE KEYS */;
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
  PRIMARY KEY (`userId`),
  KEY `fk_user_gender_idx` (`gender`),
  KEY `fk_user_ageRange_idx` (`ageRange`),
  KEY `fk_user_userTypeId_idx` (`userTypeId`),
  CONSTRAINT `fk_user_ageRange` FOREIGN KEY (`ageRange`) REFERENCES `ageRange` (`ageRange`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_gender` FOREIGN KEY (`gender`) REFERENCES `gender` (`gender`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_userTypeId` FOREIGN KEY (`userTypeId`) REFERENCES `userType` (`userTypeId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,1,'admin','admin',NULL,NULL,2),(7,1,'test1','test11',1,1,1),(8,1,'test2','',1,1,1),(9,1,'test2','lastnametest',1,1,1),(10,1,'adfadfadsf','afasdfad',1,1,1),(11,1,'Gloria','McPlot',1,1,1),(12,1,'','',1,1,1),(13,1,'Potato','Tomato',1,1,1),(14,1,'Nathan','Yim',1,1,1),(15,1,'A','A',1,1,1),(16,1,'m','bristow',1,1,1),(17,1,'Ian','Easterbrook',1,1,1),(18,1,'Chelsea','Haemel',1,1,1),(19,1,'Theo','Chan',1,1,1),(20,1,'','',1,1,1),(21,1,'','',1,1,1),(22,1,'Djdhrh','',1,1,1),(23,1,'Dhdhdhd','Dhdhdhd',1,1,1),(24,1,'Bob','Smith',1,1,1),(25,1,'','',1,1,1),(26,1,'','',1,1,1),(27,1,'Melissa','Lynett',1,1,1),(28,1,'','',1,1,1),(29,1,'Dhdhdhdh','',1,1,1),(30,1,'Andrew','I',1,1,1),(31,1,'','',1,1,1),(32,1,'','',1,1,1),(33,1,'','',1,1,1),(34,1,'Tester','',1,1,1),(35,1,'','',1,1,1),(36,1,'','',1,1,1),(37,1,'','',1,1,1),(38,1,'FirstName','LastName',1,1,1),(39,1,'FirstName','LastName',1,1,1),(40,1,'','',2,6,1),(41,1,'test','test',1,6,1);
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
-- Temporary view structure for view `v_activeelements`
--

DROP TABLE IF EXISTS `v_activeelements`;
/*!50001 DROP VIEW IF EXISTS `v_activeelements`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_activeelements` AS SELECT 
 1 AS `museumId`,
 1 AS `museumName`,
 1 AS `exhibitId`,
 1 AS `exhibitName`,
 1 AS `elementId`,
 1 AS `elementName`,
 1 AS `utilTime`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_activeexhibits`
--

DROP TABLE IF EXISTS `v_activeexhibits`;
/*!50001 DROP VIEW IF EXISTS `v_activeexhibits`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_activeexhibits` AS SELECT 
 1 AS `museumId`,
 1 AS `museumName`,
 1 AS `exhibitId`,
 1 AS `exhibitName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_elementdetails`
--

DROP TABLE IF EXISTS `v_elementdetails`;
/*!50001 DROP VIEW IF EXISTS `v_elementdetails`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_elementdetails` AS SELECT 
 1 AS `elementCode`,
 1 AS `museumId`,
 1 AS `elementId`,
 1 AS `active`,
 1 AS `elementName`,
 1 AS `artist`,
 1 AS `year`,
 1 AS `description`,
 1 AS `imageLink`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_elements`
--

DROP TABLE IF EXISTS `v_elements`;
/*!50001 DROP VIEW IF EXISTS `v_elements`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_elements` AS SELECT 
 1 AS `museumId`,
 1 AS `exhibitId`,
 1 AS `elementId`,
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
-- Temporary view structure for view `v_elementviews`
--

DROP TABLE IF EXISTS `v_elementviews`;
/*!50001 DROP VIEW IF EXISTS `v_elementviews`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_elementviews` AS SELECT 
 1 AS `museumId`,
 1 AS `museumName`,
 1 AS `exhibitId`,
 1 AS `exhibitName`,
 1 AS `elementId`,
 1 AS `elementCode`,
 1 AS `elementName`,
 1 AS `artist`,
 1 AS `views`,
 1 AS `tstamp`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_exhibits`
--

DROP TABLE IF EXISTS `v_exhibits`;
/*!50001 DROP VIEW IF EXISTS `v_exhibits`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_exhibits` AS SELECT 
 1 AS `museumId`,
 1 AS `museum`,
 1 AS `exhibitId`,
 1 AS `exhibit`,
 1 AS `active`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_museumadminpermissions`
--

DROP TABLE IF EXISTS `v_museumadminpermissions`;
/*!50001 DROP VIEW IF EXISTS `v_museumadminpermissions`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_museumadminpermissions` AS SELECT 
 1 AS `userId`,
 1 AS `user`,
 1 AS `museumId`,
 1 AS `museumName`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_tags`
--

DROP TABLE IF EXISTS `v_tags`;
/*!50001 DROP VIEW IF EXISTS `v_tags`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_tags` AS SELECT 
 1 AS `elementId`,
 1 AS `elementTagId`,
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
-- Temporary view structure for view `v_visits`
--

DROP TABLE IF EXISTS `v_visits`;
/*!50001 DROP VIEW IF EXISTS `v_visits`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `v_visits` AS SELECT 
 1 AS `visitId`,
 1 AS `userId`,
 1 AS `museum`,
 1 AS `visitDate`*/;
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
  `visitDate` date NOT NULL,
  `userId` int(11) NOT NULL,
  `museumId` int(11) NOT NULL,
  PRIMARY KEY (`visitId`),
  UNIQUE KEY `uq_visit` (`visitDate`,`userId`,`museumId`),
  KEY `fk_visit_userId_idx` (`userId`),
  KEY `fk_visit_museumId_idx` (`museumId`),
  CONSTRAINT `fk_visit_museumId` FOREIGN KEY (`museumId`) REFERENCES `museum` (`museumId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_visit_userId` FOREIGN KEY (`userId`) REFERENCES `user` (`userId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
INSERT INTO `visit` VALUES (1,'2016-03-09 06:51:25','2016-03-09',1,1),(2,'2016-03-09 06:53:15','2016-03-09',33,1),(3,'2016-03-09 06:53:43','2016-03-08',33,1),(4,'2016-03-09 18:50:32','2016-03-09',33,2),(5,'2016-03-09 18:53:41','2016-03-09',33,3),(6,'2016-03-10 05:16:00','2016-03-10',33,3),(7,'2016-03-10 18:47:56','2016-03-10',33,2),(8,'2016-03-14 21:28:35','2016-03-14',33,1),(9,'2016-03-14 21:44:53','2016-03-14',31,1),(10,'2016-03-14 21:47:11','2016-03-14',37,1),(11,'2016-03-14 21:53:00','2016-03-14',37,2),(12,'2016-03-14 22:35:25','2016-03-14',36,1),(13,'2016-03-14 22:45:11','2016-03-14',34,1),(14,'2016-03-15 02:25:40','2016-03-14',35,3),(15,'2016-03-16 06:55:26','2016-03-16',33,1),(16,'2016-03-17 17:54:25','2016-03-17',41,1);
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitDuration`
--

DROP TABLE IF EXISTS `visitDuration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitDuration` (
  `visitId` int(11) NOT NULL,
  `startTime` timestamp NULL DEFAULT NULL,
  `endTime` timestamp NULL DEFAULT NULL,
  `duration` int(11) DEFAULT NULL,
  KEY `fk_visitDuration_visitId_idx` (`visitId`),
  CONSTRAINT `fk_visitDuration_visitId` FOREIGN KEY (`visitId`) REFERENCES `visit` (`visitId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitDuration`
--

LOCK TABLES `visitDuration` WRITE;
/*!40000 ALTER TABLE `visitDuration` DISABLE KEYS */;
INSERT INTO `visitDuration` VALUES (5,'2016-03-10 03:31:10','2016-03-10 04:47:02',4552),(6,'2016-03-10 05:24:19','2016-03-10 05:27:33',194),(14,'2016-03-15 02:25:40','2016-03-15 02:27:23',103);
/*!40000 ALTER TABLE `visitDuration` ENABLE KEYS */;
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
CREATE DEFINER=`root`@`localhost` FUNCTION `f_getExhibitId`(textName varchar(255),museumName varchar(255)) RETURNS int(11)
BEGIN
	declare id integer;
	select exhibitId into id
	from exhibit where exhibitName=textName and museumId=f_getMuseumId(museumName);

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
/*!50003 DROP PROCEDURE IF EXISTS `delete_element` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_element`(
	in vElementId integer,
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vExists from element
    where elementId=vElementId;
    
    if vExists = 1 then
		update element set active=0
        where elementId=vElementId;
        select 0 into vSuccess;
	elseif vExists = 0 then 
		select -3 into vSuccess;
	else
		select -1 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_elementTagMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `delete_elementTagMapping`(
	in vElementId integer,
    in vElementTagId integer,
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vExists from elementTagMapping
    where elementId=vElementId and elementTagId=vElementTagId;
    
    if vExists = 1 then
		update elementTagMapping set active=0
        where elementId=vElementId and elementTagId=vElementTagId;
        select 0 into vSuccess;
	elseif vExists = 0 then 
		select -3 into vSuccess;
	else
		select -1 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
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
/*!50003 DROP PROCEDURE IF EXISTS `insert_artist` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_artist`(
	in vArtistName varchar(255),
    out vSuccess integer
)
BEGIN
	declare vValid integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vValid from artist
    where artist=vArtistName;
    
    if vValid = 0 then 
		insert into artist (artist) 
        values (vArtistName);
        select 0 into vSuccess;
	else
		select -2 into vSuccess;
	end if;
    
	if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
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
	in vExhibitId varchar(255), 
    in vTitle varchar(255),
    in vArtistId varchar(255),
    in vYear integer,
    in vDesc varchar(500), 
    in vImageLink varchar(255),
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
	DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
        
	select count(*) into vExists from element
    where exhibitId=vExhibitId and title=vTitle;
    
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
            vArtistId,
            vYear,
            vDesc,
            vImageLink,
            vExhibitId
        );
        select 0 into vSuccess;
    else
		select -2 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
    
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `insert_elementCode` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert_elementCode`(
	in vElementId integer,
    in vElementCode integer,
    out vSuccess integer
)
BEGIN
	declare vValid integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vValid from elementCode
    where code=vElementCode;
    
    if vValid = 0 then 
		insert into elementCode (elementId,code) 
        values (vElementId,vElementCode);
        select 0 into vSuccess;
	else
		select -4 into vSuccess;
	end if;
    
	if vSuccess >= 0 then 
		commit;
	else 
		rollback;
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
    in vElementTagTypeId integer,
    out vSuccess integer
)
BEGIN
	declare vValid integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vValid from elementTag
    where elementTag=vElementTag and elementTagTypeId=vElementTagTypeId;
    
    if vValid = 0 then 
		insert into elementTag (elementTag,elementTagTypeId) 
        values (vElementTag,vElementTagTypeId);
        select 0 into vSuccess;
	else
		select -2 into vSuccess;
	end if;
    
	if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
    
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
	in vElementId integer,
    in vElementTagId integer,
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;

	select count(*) into vExists from elementTagMapping
    where elementId=vElementId and elementTagId=vElementTagId;
    
    if vExists=0 then 
		insert into elementTagMapping (
			elementTagId, elementId
		) values (
			vElementTagId, vElementId
		);
		select 0 into vSuccess;
	else 
		select -2 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
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
	in vMuseumId integer,
    in vExhibitName varchar(255),
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;

    select count(*) into vExists from exhibit
    where exhibitName=vExhibitName and museumId=vMuseumId;

	if vExists=0 then 
		insert into exhibit (
			exhibitName, museumId
		) values (
			vExhibitName, vMuseumId
		);
		select 0 into vSuccess;
	else 
		select -2 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
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
	IN vInteractionTypeId INTEGER,
    IN vUserId INTEGER, 
    IN vElementCode INTEGER,
    IN vVisitId INTEGER,
    IN vTstamp TIMESTAMP,
    out vSuccess integer
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
    select -1 into vSuccess;
    start transaction;
    
	if vTstamp is null then 
		select now() into vTstamp;
	end if;
    
    select count(*) into @exists from interaction 
    where interactionTypeId=vInteractionTypeId and userId=vUserId 
			and visitId=vVisitId 
            and elementId=(select elementId from elementcode where code=vElementCode);
            
	if @exists > 0 then 
		
        update interaction set tstamp=vTstamp
        where interactionTypeId=vInteractionTypeId and userId=vUserId 
			and visitId=vVisitId 
            and elementId=(select elementId from elementcode where code=vElementCode); 
		
        select 0 into vSuccess;
    
    else 
		
        INSERT INTO interaction (
			interactionTypeId, 
			userId,
			elementId,
			visitId, 
			tstamp
		) VALUES (
			vInteractionTypeId, 
			vUserId, 
			(select elementId from elementCode where code=vElementCode),
			vVisitId,
			vTstamp
		);
		
		select 0 into vSuccess;
    
    end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
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
    in vTstamp timestamp,
    OUT vSuccess integer, 
    out vVisitId integer
)
BEGIN
    declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    if vTstamp is null then 
		select now() into vTstamp;
	end if;
    
    select count(*) into vExists from visit
    where visitDate=vVisitDate and userId=vUserId and museumId=vMuseumId;
    
    if vExists = 1 then 
		select visitId into vVisitId from visit
        where visitDate=vVisitDate and userId=vUserId and museumId=vMuseumId;
        call insert_interaction(5,vUserId,null,vVisitId,vTstamp,@o1);
        select 0 into vSuccess;
	elseif vExists > 1 then 
		select -1 into vSuccess;
	else
		INSERT INTO visit (
			visitDate,
			userId,
			museumId, 
            tstamp
		) VALUES (
			vVisitDate,
			vUserId,
			vMuseumId,
            vTstamp
		);
        select last_insert_id() into vVisitId;
        call insert_interaction(5,vUserId,null,vVisitId,vTstamp,@o1);
		select @o1 into vSuccess;
	end if;
	
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
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
    /*DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;*/
    
	start transaction;
    
    SELECT COUNT(*) INTO vvalidLogin
    FROM login
	WHERE login=vLogin AND loginType=vLoginType;
    
    IF vvalidLogin = 0 THEN
		SELECT -1,-1,-1 INTO vSuccess,vPass,vUserId;
	ELSE
		SELECT pass, userId INTO vPass, vUserId FROM login
		WHERE login=vLogin AND loginType=vLoginType;
        
        SELECT 0 INTO vSuccess;
    END IF;
    
	if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `restore_element` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `restore_element`(
	in vElementId integer,
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
    
    start transaction;
    
    select count(*) into vExists from element
    where elementId=vElementId;
    
    if vExists = 1 then
		update element set active=1
        where elementId=vElementId;
        select 0 into vSuccess;
	elseif vExists = 0 then 
		select -3 into vSuccess;
	else
		select -1 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `restore_elementTagMapping` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `restore_elementTagMapping`(
	in vElementId integer,
    in vElementTagId integer,
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vExists from elementTagMapping
    where elementId=vElementId and elementTagId=vElementTagId;
    
    if vExists = 1 then
		update elementTagMapping set active=1
        where elementId=vElementId and elementTagId=vElementTagId;
        select 0 into vSuccess;
	elseif vExists = 0 then 
		select -3 into vSuccess;
	else
		select -1 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_checkInDuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_checkInDuration`()
BEGIN
	update checkInDuration set duration = timestampdiff(second,startTime,endTime);
    delete from checkInDuration where duration <= 0 OR startTime is null or endtime is null;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_element` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_element`(
	in vElementId integer,
    in vField varchar(255),
    in vValue varchar(255),
    out vSuccess integer
)
BEGIN
	declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
    
    start transaction;
    
    select count(*) into vExists from element
    where elementId=vElementId;
    
    if vExists = 1 then
        if vField='artistId' then 
            update element set artistId=vValue where elementId=vElementId;
		elseif vField='exhibitId' then
            update element set exhibitId=vValue where elementId=vElementId;
		elseif vField='description' then
			update element set description=vValue where elementId=vElementId;
        elseif vField='active' then
			update element set active=vValue where elementId=vElementId;
        elseif vField='title' then
			update element set title=vValue where elementId=vElementId;
        elseif vField='paintYear' then
			update element set paintYear=vValue where elementId=vElementId;
        elseif vField='imageLink' then
			update element set imageLink=vValue where elementId=vElementId;
        end if;
        
        select 0 into vSuccess;
	
    elseif vExists = 0 then 
		select -3 into vSuccess;
	else
		select -1 into vSuccess;
	end if;
    
    if vSuccess >= 0 then 
		commit;
	else 
		rollback;
	end if;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_visitDuration` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `update_visitDuration`()
BEGIN
    update visitDuration set duration = timestampdiff(second,startTime,endTime);
    delete from visitDuration where duration <= 0 OR startTime is null or endtime is null;
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
    IN vpass VARCHAR(720),
    IN vloginType INTEGER, 
    IN vuserType INTEGER,
    IN vfirstName VARCHAR(255),
    IN vlastName VARCHAR(255),
    IN vgender INTEGER,
    IN vageRange INTEGER,
	
    OUT vsuc TINYINT,
    OUT vmsg VARCHAR(255), 
    out vUserId integer

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
		select last_insert_id() into vUserId;

        INSERT INTO login (loginType, login, pass, userId)
        VALUES (vloginType, vlogin, vpass, (SELECT MAX(userId) FROM user));
        
        SELECT "user added" INTO vmsg;
        SELECT 0 INTO vsuc;
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
    IN vpass VARCHAR(720),
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
-- Final view structure for view `v_activeelements`
--

/*!50001 DROP VIEW IF EXISTS `v_activeelements`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_activeelements` AS select `x`.`museumId` AS `museumId`,`m`.`museumName` AS `museumName`,`e`.`exhibitId` AS `exhibitId`,`x`.`exhibitName` AS `exhibitName`,`e`.`elementId` AS `elementId`,`e`.`title` AS `elementName`,`e`.`utilTime` AS `utilTime` from ((`element` `e` left join `exhibit` `x` on(((`x`.`exhibitId` = `e`.`exhibitId`) and (`x`.`active` = 1)))) left join `museum` `m` on(((`m`.`museumId` = `x`.`museumId`) and (`m`.`active` = 1)))) where (`e`.`active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_activeexhibits`
--

/*!50001 DROP VIEW IF EXISTS `v_activeexhibits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_activeexhibits` AS select `x`.`museumId` AS `museumId`,`m`.`museumName` AS `museumName`,`x`.`exhibitId` AS `exhibitId`,`x`.`exhibitName` AS `exhibitName` from (`exhibit` `x` left join `museum` `m` on(((`m`.`museumId` = `x`.`museumId`) and (`m`.`active` = 1)))) where (`x`.`active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_elementdetails`
--

/*!50001 DROP VIEW IF EXISTS `v_elementdetails`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elementdetails` AS select `c`.`code` AS `elementCode`,`m`.`museumId` AS `museumId`,`c`.`elementId` AS `elementId`,`e`.`active` AS `active`,`e`.`title` AS `elementName`,`a`.`artist` AS `artist`,`e`.`paintYear` AS `year`,`e`.`description` AS `description`,`e`.`imageLink` AS `imageLink` from ((((`elementcode` `c` left join `element` `e` on((`c`.`elementId` = `e`.`elementId`))) left join `artist` `a` on((`e`.`artistId` = `a`.`artistId`))) left join `exhibit` `x` on((`e`.`exhibitId` = `x`.`exhibitId`))) left join `museum` `m` on((`x`.`museumId` = `m`.`museumId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `v_elements` AS select `m`.`museumId` AS `museumId`,`x`.`exhibitId` AS `exhibitId`,`e`.`elementId` AS `elementId`,(case `e`.`active` when 1 then 'Active' when 0 then 'Inactive' end) AS `active`,`m`.`museumName` AS `museum`,`x`.`exhibitName` AS `exhibit`,`e`.`title` AS `element`,`c`.`code` AS `code`,`a`.`artist` AS `artist`,`e`.`paintYear` AS `year`,`e`.`description` AS `description`,`e`.`imageLink` AS `imageLink`,(select count(0) from `elementtagmapping` `tm` where (`tm`.`elementId` = `e`.`elementId`)) AS `numTags` from ((((`element` `e` left join `exhibit` `x` on((`e`.`exhibitId` = `x`.`exhibitId`))) left join `museum` `m` on((`x`.`museumId` = `m`.`museumId`))) left join `elementcode` `c` on((`e`.`elementId` = `c`.`elementId`))) left join `artist` `a` on((`e`.`artistId` = `a`.`artistId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_elementviews`
--

/*!50001 DROP VIEW IF EXISTS `v_elementviews`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_elementviews` AS select `x`.`museumId` AS `museumId`,`m`.`museumName` AS `museumName`,`e`.`exhibitId` AS `exhibitId`,`x`.`exhibitName` AS `exhibitName`,`i`.`elementId` AS `elementId`,`c`.`code` AS `elementCode`,`e`.`title` AS `elementName`,`a`.`artist` AS `artist`,count(`i`.`interactionId`) AS `views`,`i`.`tstamp` AS `tstamp` from (((((`interaction` `i` left join `element` `e` on((`i`.`elementId` = `e`.`elementId`))) left join `exhibit` `x` on((`e`.`exhibitId` = `x`.`exhibitId`))) left join `museum` `m` on((`x`.`museumId` = `m`.`museumId`))) left join `elementcode` `c` on((`i`.`elementId` = `c`.`elementId`))) left join `artist` `a` on((`e`.`artistId` = `a`.`artistId`))) where (`i`.`interactionTypeId` = 1) group by `x`.`museumId`,`m`.`museumName`,`e`.`exhibitId`,`x`.`exhibitName`,`i`.`elementId`,`elementCode`,`elementName`,`a`.`artist`,`i`.`tstamp` */;
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
/*!50001 VIEW `v_exhibits` AS select `m`.`museumId` AS `museumId`,`m`.`museumName` AS `museum`,`e`.`exhibitId` AS `exhibitId`,`e`.`exhibitName` AS `exhibit`,`e`.`active` AS `active` from (`exhibit` `e` left join `museum` `m` on((`e`.`museumId` = `m`.`museumId`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_museumadminpermissions`
--

/*!50001 DROP VIEW IF EXISTS `v_museumadminpermissions`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_museumadminpermissions` AS select `u`.`userId` AS `userId`,concat(`u`.`firstName`,' ',`u`.`lastName`) AS `user`,`p`.`museumId` AS `museumId`,`m`.`museumName` AS `museumName` from ((`user` `u` left join `museumpermission` `p` on((`u`.`userId` = `p`.`userId`))) left join `museum` `m` on((`p`.`museumId` = `m`.`museumId`))) where ((`u`.`userTypeId` = 2) and (`m`.`active` = 1)) */;
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
/*!50001 VIEW `v_tags` AS select `m`.`elementId` AS `elementId`,`t`.`elementTagId` AS `elementTagId`,(case `m`.`active` when 1 then 'Active' when 0 then 'Inactive' end) AS `active`,`e`.`title` AS `element`,`tt`.`elementTagType` AS `type`,`t`.`elementTag` AS `tag` from (((`elementtagmapping` `m` left join `element` `e` on((`m`.`elementId` = `e`.`elementId`))) left join `elementtag` `t` on((`m`.`elementTagId` = `t`.`elementTagId`))) left join `elementtagtype` `tt` on((`t`.`elementTagTypeId` = `tt`.`elementTagTypeId`))) */;
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

--
-- Final view structure for view `v_visits`
--

/*!50001 DROP VIEW IF EXISTS `v_visits`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8 */;
/*!50001 SET character_set_results     = utf8 */;
/*!50001 SET collation_connection      = utf8_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `v_visits` AS select `v`.`visitId` AS `visitId`,`v`.`userId` AS `userId`,`m`.`museumName` AS `museum`,`v`.`visitDate` AS `visitDate` from (`visit` `v` left join `museum` `m` on((`v`.`museumId` = `m`.`museumId`))) */;
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

-- Dump completed on 2016-03-17 22:56:16
