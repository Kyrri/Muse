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
-- Table structure for table `display`
--

DROP TABLE IF EXISTS `display`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `display` (
  `displayId` int(11) NOT NULL AUTO_INCREMENT,
  `active` binary(1) NOT NULL DEFAULT '1',
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
-- Table structure for table `exhibit`
--

DROP TABLE IF EXISTS `exhibit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `exhibit` (
  `exhibitId` int(11) NOT NULL AUTO_INCREMENT,
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
-- Table structure for table `museum`
--

DROP TABLE IF EXISTS `museum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `museum` (
  `museumId` int(11) NOT NULL AUTO_INCREMENT,
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
  PRIMARY KEY (`planId`)
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
-- Table structure for table `tag`
--

DROP TABLE IF EXISTS `tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `tagName` varchar(255) NOT NULL,
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
-- Table structure for table `visit`
--

DROP TABLE IF EXISTS `visit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visit` (
  `visitId` int(11) NOT NULL AUTO_INCREMENT,
  `createdStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `visitorGroupId` int(11) NOT NULL,
  `museumId` int(11) NOT NULL,
  PRIMARY KEY (`visitId`),
  KEY `visitorGroupId` (`visitorGroupId`),
  KEY `museumId` (`museumId`),
  CONSTRAINT `visit_ibfk_1` FOREIGN KEY (`visitorGroupId`) REFERENCES `visitorGroup` (`visitorGroupId`),
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

--
-- Table structure for table `visitor`
--

DROP TABLE IF EXISTS `visitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitor` (
  `visitorId` int(11) NOT NULL AUTO_INCREMENT,
  `visitorName` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitorId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitor`
--

LOCK TABLES `visitor` WRITE;
/*!40000 ALTER TABLE `visitor` DISABLE KEYS */;
INSERT INTO `visitor` VALUES (1,'Andrew','',NULL),(2,'Lindsay','',NULL),(3,'Taylor','',NULL),(4,'Evelyn','',NULL);
/*!40000 ALTER TABLE `visitor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitorGroup`
--

DROP TABLE IF EXISTS `visitorGroup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitorGroup` (
  `visitorGroupId` int(11) NOT NULL AUTO_INCREMENT,
  `visitorGroupName` varchar(255) NOT NULL,
  PRIMARY KEY (`visitorGroupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitorGroup`
--

LOCK TABLES `visitorGroup` WRITE;
/*!40000 ALTER TABLE `visitorGroup` DISABLE KEYS */;
INSERT INTO `visitorGroup` VALUES (1,'Group 1');
/*!40000 ALTER TABLE `visitorGroup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitorGroupMemeber`
--

DROP TABLE IF EXISTS `visitorGroupMemeber`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `visitorGroupMemeber` (
  `visitorGroupId` int(11) NOT NULL,
  `visitorId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`visitorGroupId`,`visitorId`),
  KEY `visitorId` (`visitorId`),
  CONSTRAINT `visitorgroupmemeber_ibfk_1` FOREIGN KEY (`visitorGroupId`) REFERENCES `visitorGroup` (`visitorGroupId`),
  CONSTRAINT `visitorgroupmemeber_ibfk_2` FOREIGN KEY (`visitorId`) REFERENCES `visitor` (`visitorId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitorGroupMemeber`
--

LOCK TABLES `visitorGroupMemeber` WRITE;
/*!40000 ALTER TABLE `visitorGroupMemeber` DISABLE KEYS */;
INSERT INTO `visitorGroupMemeber` VALUES (1,1,1,'2015-11-02 15:28:29'),(1,3,1,'2015-11-02 15:28:29');
/*!40000 ALTER TABLE `visitorGroupMemeber` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-11-02 13:23:52
