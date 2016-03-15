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
-- Table structure for table `actionType`
--

DROP TABLE IF EXISTS `actionType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `actionType` (
  `actionTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `actionType` varchar(255) NOT NULL,
  PRIMARY KEY (`actionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actionType`
--

LOCK TABLES `actionType` WRITE;
/*!40000 ALTER TABLE `actionType` DISABLE KEYS */;
/*!40000 ALTER TABLE `actionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifact`
--

DROP TABLE IF EXISTS `artifact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifact` (
  `artifactId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `artifactName` varchar(255) NOT NULL,
  `displayId` int(11) NOT NULL,
  PRIMARY KEY (`artifactId`),
  KEY `displayId` (`displayId`),
  CONSTRAINT `artifact_ibfk_1` FOREIGN KEY (`displayId`) REFERENCES `display` (`displayId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifact`
--

LOCK TABLES `artifact` WRITE;
/*!40000 ALTER TABLE `artifact` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `artifactTags`
--

DROP TABLE IF EXISTS `artifactTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `artifactTags` (
  `artifactId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`artifactId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `artifacttags_ibfk_1` FOREIGN KEY (`artifactId`) REFERENCES `artifact` (`artifactId`),
  CONSTRAINT `artifacttags_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artifactTags`
--

LOCK TABLES `artifactTags` WRITE;
/*!40000 ALTER TABLE `artifactTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `artifactTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `display`
--

DROP TABLE IF EXISTS `display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display` (
  `displayId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `displayName` varchar(255) NOT NULL,
  `exhibitId` int(11) NOT NULL,
  PRIMARY KEY (`displayId`),
  KEY `exhibitId` (`exhibitId`),
  CONSTRAINT `display_ibfk_1` FOREIGN KEY (`exhibitId`) REFERENCES `exhibit` (`exhibitId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `display`
--

LOCK TABLES `display` WRITE;
/*!40000 ALTER TABLE `display` DISABLE KEYS */;
/*!40000 ALTER TABLE `display` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `displayTags`
--

DROP TABLE IF EXISTS `displayTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `displayTags` (
  `displayId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`displayId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `displaytags_ibfk_1` FOREIGN KEY (`displayId`) REFERENCES `display` (`displayId`),
  CONSTRAINT `displaytags_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `displayTags`
--

LOCK TABLES `displayTags` WRITE;
/*!40000 ALTER TABLE `displayTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `displayTags` ENABLE KEYS */;
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
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `exhibitName` varchar(255) NOT NULL,
  `museumId` int(11) NOT NULL,
  PRIMARY KEY (`exhibitId`),
  KEY `museumId` (`museumId`),
  CONSTRAINT `exhibit_ibfk_1` FOREIGN KEY (`museumId`) REFERENCES `museum` (`museumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibit`
--

LOCK TABLES `exhibit` WRITE;
/*!40000 ALTER TABLE `exhibit` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exhibitTags`
--

DROP TABLE IF EXISTS `exhibitTags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibitTags` (
  `exhibitId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`exhibitId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `exhibittags_ibfk_1` FOREIGN KEY (`exhibitId`) REFERENCES `exhibit` (`exhibitId`),
  CONSTRAINT `exhibittsgs_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exhibitTags`
--

LOCK TABLES `exhibitTags` WRITE;
/*!40000 ALTER TABLE `exhibitTags` DISABLE KEYS */;
/*!40000 ALTER TABLE `exhibitTags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groupMembers`
--

DROP TABLE IF EXISTS `groupMembers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groupMembers` (
  `groupId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`groupId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `visitorgroupmemeber_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`groupId`),
  CONSTRAINT `visitorgroupmemeber_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groupMembers`
--

LOCK TABLES `groupMembers` WRITE;
/*!40000 ALTER TABLE `groupMembers` DISABLE KEYS */;
/*!40000 ALTER TABLE `groupMembers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `groups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `interactions`
--

DROP TABLE IF EXISTS `interactions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `interactions` (
  `interactionId` int(11) NOT NULL AUTO_INCREMENT,
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `userId` int(11) NOT NULL,
  `artifactId` int(11) NOT NULL,
  PRIMARY KEY (`interactionId`),
  KEY `userId` (`userId`),
  KEY `artifactId` (`artifactId`),
  CONSTRAINT `interactions_ibfk_1` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`),
  CONSTRAINT `interactions_ibfk_2` FOREIGN KEY (`artifactId`) REFERENCES `artifact` (`artifactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `interactions`
--

LOCK TABLES `interactions` WRITE;
/*!40000 ALTER TABLE `interactions` DISABLE KEYS */;
/*!40000 ALTER TABLE `interactions` ENABLE KEYS */;
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
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `museumName` varchar(255) NOT NULL,
  PRIMARY KEY (`museumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `museum`
--

LOCK TABLES `museum` WRITE;
/*!40000 ALTER TABLE `museum` DISABLE KEYS */;
/*!40000 ALTER TABLE `museum` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plan`
--

DROP TABLE IF EXISTS `plan`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `plan` (
  `planId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) DEFAULT NULL,
  `planTypeId` int(11) NOT NULL,
  PRIMARY KEY (`planId`),
  KEY `planTypeId` (`planTypeId`),
  CONSTRAINT `plan_ibfk_1` FOREIGN KEY (`planTypeId`) REFERENCES `planType` (`planTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plan`
--

LOCK TABLES `plan` WRITE;
/*!40000 ALTER TABLE `plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `plan` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planArtifacts`
--

DROP TABLE IF EXISTS `planArtifacts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planArtifacts` (
  `planId` int(11) NOT NULL,
  `artifactId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`planId`,`artifactId`),
  KEY `artifactId` (`artifactId`),
  CONSTRAINT `planartifacts_ibfk_1` FOREIGN KEY (`planId`) REFERENCES `plan` (`planId`),
  CONSTRAINT `planartifacts_ibfk_2` FOREIGN KEY (`artifactId`) REFERENCES `artifact` (`artifactId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planArtifacts`
--

LOCK TABLES `planArtifacts` WRITE;
/*!40000 ALTER TABLE `planArtifacts` DISABLE KEYS */;
/*!40000 ALTER TABLE `planArtifacts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planContributors`
--

DROP TABLE IF EXISTS `planContributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planContributors` (
  `planId` int(11) NOT NULL,
  `userId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`planId`,`userId`),
  KEY `userId` (`userId`),
  CONSTRAINT `plancontributors_ibfk_1` FOREIGN KEY (`planId`) REFERENCES `plan` (`planId`),
  CONSTRAINT `plancontributors_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`userId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planContributors`
--

LOCK TABLES `planContributors` WRITE;
/*!40000 ALTER TABLE `planContributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `planContributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `planType`
--

DROP TABLE IF EXISTS `planType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `planType` (
  `planTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `planType` varchar(255) NOT NULL,
  PRIMARY KEY (`planTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `planType`
--

LOCK TABLES `planType` WRITE;
/*!40000 ALTER TABLE `planType` DISABLE KEYS */;
INSERT INTO `planType` VALUES (1,'Visitor Defined'),(2,'Curator Defined');
/*!40000 ALTER TABLE `planType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `tagName` varchar(255) NOT NULL,
  `proCreated` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userType`
--

DROP TABLE IF EXISTS `userType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userType` (
  `userTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  PRIMARY KEY (`userTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userType`
--

LOCK TABLES `userType` WRITE;
/*!40000 ALTER TABLE `userType` DISABLE KEYS */;
INSERT INTO `userType` VALUES (1,'Visitor'),(2,'Curator');
/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `userId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `userName` varchar(255) NOT NULL,
  `userType` int(11) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userId`),
  KEY `userType` (`userType`),
  CONSTRAINT `user_ibfk_1` FOREIGN KEY (`userType`) REFERENCES `userType` (`userTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (5,1,'2015-11-02 21:43:20',NULL,'John',1,'user1','password');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visitId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `groupId` int(11) NOT NULL,
  `museumId` int(11) NOT NULL,
  PRIMARY KEY (`visitId`),
  KEY `groupId` (`groupId`),
  KEY `museumId` (`museumId`),
  CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`groupId`) REFERENCES `groups` (`groupId`),
  CONSTRAINT `visit_ibfk_2` FOREIGN KEY (`museumId`) REFERENCES `museum` (`museumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visit`
--

LOCK TABLES `visit` WRITE;
/*!40000 ALTER TABLE `visit` DISABLE KEYS */;
/*!40000 ALTER TABLE `visit` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-01 21:18:28
