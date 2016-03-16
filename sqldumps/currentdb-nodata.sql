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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
 1 AS `elementName`*/;
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
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

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
    OUT vSuccess integer, 
    out vVisitId integer
)
BEGIN
    declare vExists integer default 0;
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
        
	start transaction;
    
    select count(*) into vExists from visit
    where visitDate=vVisitDate and userId=vUserId and museumId=vMuseumId;
    
    if vExists = 1 then 
		select visitId into vVisitId from visit
        where visitDate=vVisitDate and userId=vUserId and museumId=vMuseumId;
        call insert_interaction(5,vUserId,null,vVisitId,null,@o1);
        select 0 into vSuccess;
	elseif vExists > 1 then 
		select -1 into vSuccess;
	else
		INSERT INTO visit (
			visitDate,
			userId,
			museumId
		) VALUES (
			vVisitDate,
			vUserId,
			vMuseumId
		);
        select last_insert_id() into vVisitId;
        call insert_interaction(5,vUserId,null,vVisitId,null,@o1);
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
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
        SELECT -1 into vSuccess;
    
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
/*!50001 VIEW `v_activeelements` AS select `x`.`museumId` AS `museumId`,`m`.`museumName` AS `museumName`,`e`.`exhibitId` AS `exhibitId`,`x`.`exhibitName` AS `exhibitName`,`e`.`elementId` AS `elementId`,`e`.`title` AS `elementName` from ((`element` `e` left join `exhibit` `x` on(((`x`.`exhibitId` = `e`.`exhibitId`) and (`x`.`active` = 1)))) left join `museum` `m` on(((`m`.`museumId` = `x`.`museumId`) and (`m`.`active` = 1)))) where (`e`.`active` = 1) */;
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

-- Dump completed on 2016-03-16 17:13:38
