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
-- Table structure for table `element`
--

DROP TABLE IF EXISTS `element`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `element` (
  `elementId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `title` varchar(255) NOT NULL,
  `artist` varchar(255) DEFAULT NULL,
  `paintYear` int(11) DEFAULT NULL,
  `description` longtext,
  `imageLink` varchar(255) DEFAULT NULL,
  `exhibitId` int(11) NOT NULL,
  PRIMARY KEY (`elementId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,1,'Luncheon of the Boating Party','Pierre-Auguste Renoir',1881,'Luncheon of the Boating Party by Pierre-Auguste Renoir remains the best known and most popular work of art at The Phillips Collection, just as Duncan Phillips imagined it would be when he bought it in 1923. The painting captures an idyllic atmosphere as Renoir\'s friends share food, wine, and conversation on a balcony overlooking the Seine at the Maison Fournaise restaurant in Chatou. Parisians flocked to the Maison Fournaise to rent rowing skiffs, eat a good meal, or stay the night.\nThe painting also reflects the changing character of French society in the mid- to late 19th century. The restaurant welcomed customers of many classes, including businessmen, society women, artists, actresses, writers, critics, seamstresses, and shop girls. This diverse group embodied a new, modern Parisian society.\nRenoir seems to have composed this complicated scene without advance studies or underdrawing. He spent months making numerous changes to the canvas, painting the individual figures when his models were available, and adding the striped awning along the top edge. Nonetheless, Renoir retained the freshness of his vision, even as he revised, rearranged, and crafted an exquisite work of art.',NULL,1),(2,1,'Composition VIII','Wassily Kandinsky',1923,'Composition VIII by Wassily Kandinsky is small oil on canvas painting dating from 1923 that is currently in the Guggenheim Museum in New York.\nAs the name implies, it is the eighth in a series of paintings, begun in 1911, in which the artist expresses what he is trying to achieve. Kandinsky wanted to explore the medium of painting rather than be concerned with subject matter. His goal was to paint what music sounds like.\n \nComposition VIII can accurately be described as a geometric composition. The viewer is immediately struck by the large concentric circles at the top left of the picture. The two inner circles are perfect circles, while the outer has a fuzzy outline.\nThe rest of the painting is comprised of other circles, semi-circles, triangles, squares, parallelograms and other shapes. Coloring throughout the painting is subtle, except for the striking black and purple of the top left circle.\n',NULL,1),(3,1,'Café Terrace at Night','Vincent van Gogh',1888,'Café Terrace at Night, also known as The Cafe Terrace on the Place du Forum, is a coloured oil painting executed by the Dutch artist Vincent van Gogh on an industrially primed canvas of size 25 (Toile de 25 figure) in Arles, France, mid-September 1888. The painting is not signed, but described and mentioned by the artist in three letters. There is also a large pen drawing of the composition which originates from the artist\'s estate.\nVisitors of the site can still stand at the northeastern corner of the Place du Forum, where the artist set up his easel. He looked south towards the artificially lit terrace of the popular coffee house, as well as into the enforced darkness of the rue du Palais leading up to the building structure (to the left, not pictured) and, beyond this structure, the tower of a former church (now Musée Lapidaire). Towards the right, Van Gogh indicated a lighted shop as well, and some branches of the trees surrounding the place—but he omitted the remainders of the Roman monuments just beside this little shop.\n',NULL,1);
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
-- Table structure for table `elementTag`
--

DROP TABLE IF EXISTS `elementTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementTag` (
  `elementTagId` int(11) NOT NULL AUTO_INCREMENT,
  `elementTag` varchar(255) DEFAULT NULL,
  `elementTagTypeId` int(11) DEFAULT NULL,
  PRIMARY KEY (`elementTagId`),
  UNIQUE KEY `elementTagDesc` (`elementTag`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTag`
--

LOCK TABLES `elementTag` WRITE;
/*!40000 ALTER TABLE `elementTag` DISABLE KEYS */;
INSERT INTO `elementTag` VALUES (1,'Oil on Canvas',1);
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
INSERT INTO `elementTagMapping` VALUES (1,1,1),(1,2,1),(1,3,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTagType`
--

LOCK TABLES `elementTagType` WRITE;
/*!40000 ALTER TABLE `elementTagType` DISABLE KEYS */;
INSERT INTO `elementTagType` VALUES (2,'Genre'),(1,'Medium'),(3,'Style');
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
  PRIMARY KEY (`exhibitId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibit`
--

LOCK TABLES `exhibit` WRITE;
/*!40000 ALTER TABLE `exhibit` DISABLE KEYS */;
INSERT INTO `exhibit` VALUES (1,1,'Muse Sample 1',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interaction`
--

LOCK TABLES `interaction` WRITE;
/*!40000 ALTER TABLE `interaction` DISABLE KEYS */;
INSERT INTO `interaction` VALUES (1,'2016-02-23 18:21:43',1,2,1325,0);
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
 1 AS `museum`,
 1 AS `exhibit`,
 1 AS `element`,
 1 AS `code`*/;
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
    OUT vPass VARCHAR(720),
    OUT vmsg VARCHAR(255)
)
BEGIN
	DECLARE vvalidLogin TINYINT DEFAULT 0;
    
	SELECT COUNT(*) INTO vvalidLogin
    FROM login
	WHERE login=vLogin AND loginType=vLoginType;
    
    IF vvalidLogin = 0 THEN
		SELECT "login does not exist" INTO vmsg;
        SELECT -1 INTO vPass;
	ELSE
		SELECT pass INTO vPass
		FROM login
		WHERE login=vLogin AND loginType=vLoginType;
        
        SELECT "return sucessful" INTO vmsg;
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
/*!50001 VIEW `v_elements` AS select `e`.`elementId` AS `id`,`m`.`museumName` AS `museum`,`x`.`exhibitName` AS `exhibit`,`e`.`title` AS `element`,`c`.`code` AS `code` from (((`element` `e` left join `exhibit` `x` on((`e`.`exhibitId` = `x`.`exhibitId`))) left join `museum` `m` on((`x`.`museumId` = `m`.`museumId`))) left join `elementcode` `c` on((`e`.`elementId` = `c`.`elementId`))) */;
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
/*!50001 VIEW `v_tags` AS select `m`.`elementId` AS `id`,`e`.`title` AS `element`,`tt`.`elementTagType` AS `type`,`t`.`elementTag` AS `tag` from (((`elementtagmapping` `m` left join `element` `e` on((`m`.`elementId` = `e`.`elementId`))) left join `elementtag` `t` on((`m`.`elementTagId` = `t`.`elementTagId`))) left join `elementtagtype` `tt` on((`t`.`elementTagTypeId` = `tt`.`elementTagTypeId`))) */;
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

-- Dump completed on 2016-02-28 20:34:29
