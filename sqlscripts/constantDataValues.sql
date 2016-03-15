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
-- Dumping data for table `ageRange`
--

LOCK TABLES `ageRange` WRITE;
/*!40000 ALTER TABLE `ageRange` DISABLE KEYS */;
INSERT INTO `ageRange` VALUES (1,'18-20'),(2,'20-25'),(3,'25-30'),(4,'30-40'),(5,'40-50'),(6,'50-60'),(7,'60-70'),(8,'70+'),(9,'N/A');
/*!40000 ALTER TABLE `ageRange` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `elementTagType`
--

LOCK TABLES `elementTagType` WRITE;
/*!40000 ALTER TABLE `elementTagType` DISABLE KEYS */;
INSERT INTO `elementTagType` VALUES (2,'Genre'),(4,'Industry'),(1,'Medium'),(3,'Style');
/*!40000 ALTER TABLE `elementTagType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `gender`
--

LOCK TABLES `gender` WRITE;
/*!40000 ALTER TABLE `gender` DISABLE KEYS */;
INSERT INTO `gender` VALUES (2,'female'),(1,'male'),(3,'N/A');
/*!40000 ALTER TABLE `gender` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `interactionType`
--

LOCK TABLES `interactionType` WRITE;
/*!40000 ALTER TABLE `interactionType` DISABLE KEYS */;
INSERT INTO `interactionType` VALUES (1,'checkIn'),(4,'checkout'),(3,'favourite'),(2,'like'),(6,'visitEnd'),(5,'visitStart');
/*!40000 ALTER TABLE `interactionType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `loginType`
--

LOCK TABLES `loginType` WRITE;
/*!40000 ALTER TABLE `loginType` DISABLE KEYS */;
INSERT INTO `loginType` VALUES (1,'email');
/*!40000 ALTER TABLE `loginType` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `userType`
--

LOCK TABLES `userType` WRITE;
/*!40000 ALTER TABLE `userType` DISABLE KEYS */;
INSERT INTO `userType` VALUES (2,'admin'),(1,'visitor');
/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-03-15  1:01:19
