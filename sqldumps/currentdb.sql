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

-- Dump completed on 2015-11-02 10:40:09
