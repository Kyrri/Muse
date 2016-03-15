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
  `elementType` int(11) DEFAULT NULL,
  `imageLink` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`elementId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `element`
--

LOCK TABLES `element` WRITE;
/*!40000 ALTER TABLE `element` DISABLE KEYS */;
INSERT INTO `element` VALUES (1,1,'Luncheon of the Boating Party','Pierre-Auguste Renoir',1881,'Luncheon of the Boating Party by Pierre-Auguste Renoir remains the best known and most popular work of art at The Phillips Collection, just as Duncan Phillips imagined it would be when he bought it in 1923. The painting captures an idyllic atmosphere as Renoir\'s friends share food, wine, and conversation on a balcony overlooking the Seine at the Maison Fournaise restaurant in Chatou. Parisians flocked to the Maison Fournaise to rent rowing skiffs, eat a good meal, or stay the night.\nThe painting also reflects the changing character of French society in the mid- to late 19th century. The restaurant welcomed customers of many classes, including businessmen, society women, artists, actresses, writers, critics, seamstresses, and shop girls. This diverse group embodied a new, modern Parisian society.\nRenoir seems to have composed this complicated scene without advance studies or underdrawing. He spent months making numerous changes to the canvas, painting the individual figures when his models were available, and adding the striped awning along the top edge. Nonetheless, Renoir retained the freshness of his vision, even as he revised, rearranged, and crafted an exquisite work of art.',1,NULL),(2,1,'Composition VIII','Wassily Kandinsky',1923,'Composition VIII by Wassily Kandinsky is small oil on canvas painting dating from 1923 that is currently in the Guggenheim Museum in New York.\nAs the name implies, it is the eighth in a series of paintings, begun in 1911, in which the artist expresses what he is trying to achieve. Kandinsky wanted to explore the medium of painting rather than be concerned with subject matter. His goal was to paint what music sounds like.\n \nComposition VIII can accurately be described as a geometric composition. The viewer is immediately struck by the large concentric circles at the top left of the picture. The two inner circles are perfect circles, while the outer has a fuzzy outline.\nThe rest of the painting is comprised of other circles, semi-circles, triangles, squares, parallelograms and other shapes. Coloring throughout the painting is subtle, except for the striking black and purple of the top left circle.\n',1,NULL),(3,1,'Café Terrace at Night','Vincent van Gogh',1888,'Café Terrace at Night, also known as The Cafe Terrace on the Place du Forum, is a coloured oil painting executed by the Dutch artist Vincent van Gogh on an industrially primed canvas of size 25 (Toile de 25 figure) in Arles, France, mid-September 1888. The painting is not signed, but described and mentioned by the artist in three letters. There is also a large pen drawing of the composition which originates from the artist\'s estate.\nVisitors of the site can still stand at the northeastern corner of the Place du Forum, where the artist set up his easel. He looked south towards the artificially lit terrace of the popular coffee house, as well as into the enforced darkness of the rue du Palais leading up to the building structure (to the left, not pictured) and, beyond this structure, the tower of a former church (now Musée Lapidaire). Towards the right, Van Gogh indicated a lighted shop as well, and some branches of the trees surrounding the place—but he omitted the remainders of the Roman monuments just beside this little shop.\n',1,NULL);
/*!40000 ALTER TABLE `element` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementTag`
--

DROP TABLE IF EXISTS `elementTag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementTag` (
  `elementId` int(11) DEFAULT NULL,
  `code` int(11) DEFAULT NULL,
  UNIQUE KEY `elementId` (`elementId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementTag`
--

LOCK TABLES `elementTag` WRITE;
/*!40000 ALTER TABLE `elementTag` DISABLE KEYS */;
INSERT INTO `elementTag` VALUES (1,1325),(2,5728),(3,7793);
/*!40000 ALTER TABLE `elementTag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elementType`
--

DROP TABLE IF EXISTS `elementType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `elementType` (
  `elementType` int(11) NOT NULL AUTO_INCREMENT,
  `elementTYpeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`elementType`),
  UNIQUE KEY `elementTYpeDesc` (`elementTYpeDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elementType`
--

LOCK TABLES `elementType` WRITE;
/*!40000 ALTER TABLE `elementType` DISABLE KEYS */;
INSERT INTO `elementType` VALUES (1,'Oil on canvas');
/*!40000 ALTER TABLE `elementType` ENABLE KEYS */;
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
  `pass` varchar(255) NOT NULL,
  `userId` int(11) NOT NULL,
  PRIMARY KEY (`loginId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
INSERT INTO `login` VALUES (3,1,1,'test1@test.com','test123',7),(4,1,1,'test2@test.com','test123',8),(5,1,1,'test3@test.com','test123',9);
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
  PRIMARY KEY (`userId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (7,1,'test1','test11',1,1),(8,1,'test2','',1,1),(9,1,'test2','lastnametest',1,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `userType`
--

DROP TABLE IF EXISTS `userType`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `userType` (
  `userType` int(11) NOT NULL AUTO_INCREMENT,
  `userTypeDesc` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`userType`),
  UNIQUE KEY `userTypeDesc` (`userTypeDesc`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `userType`
--

LOCK TABLES `userType` WRITE;
/*!40000 ALTER TABLE `userType` DISABLE KEYS */;
INSERT INTO `userType` VALUES (1,'visitor');
/*!40000 ALTER TABLE `userType` ENABLE KEYS */;
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
    OUT vType VARCHAR(255),
    OUT vImgLnk VARCHAR(255)
)
BEGIN
    
    SELECT COUNT(*) INTO vStat
    FROM elementTag
    WHERE code=vCode;
    
    IF vStat > 0 THEN
		SELECT e.title, e.artist, e.paintYear, e.description, typ.elementTypeDesc, e.imageLink
		INTO vTitle,vArtist,vYear,vDesc,vType,vImgLnk
        FROM elementTag t
        INNER JOIN element e
        ON t.elementId=e.elementId
        INNER JOIN elementType typ
        ON e.elementType=typ.elementType
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
	-- check if login is valid
    DECLARE vvalidLogin TINYINT DEFAULT 0;
    
	SELECT COUNT(*) INTO vvalidLogin
    FROM login
	WHERE login=vlogin AND loginType=vloginType;
    
    IF vvalidLogin > 0 THEN
		SELECT "login already exisits" INTO vmsg;
        SELECT -1 INTO vsuc;
	ELSE
		INSERT INTO user (firstName, lastName, gender, ageRange)
        VALUES (vfirstName,vlastName,vgender,vageRange);
        
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-12-02 23:10:27
