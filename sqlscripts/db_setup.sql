-- database scripts
-- create database
-- taylor was here
DROP SCHEMA muse_dev;

CREATE SCHEMA `muse_dev` DEFAULT CHARACTER SET utf8 ;
USE muse_dev ;

CREATE TABLE `userType` (
  `userTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `userType` varchar(255) NOT NULL,
  PRIMARY KEY (`userTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `muse_dev`.`userType` (`userType`) VALUES ("Visitor");
INSERT INTO `muse_dev`.`userType` (`userType`) VALUES ("Curator");

CREATE TABLE `planType` (
  `planTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `planType` varchar(255) NOT NULL,
  PRIMARY KEY (`planTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
INSERT INTO `muse_dev`.`planType` (`planType`) VALUES ("Visitor Defined");
INSERT INTO `muse_dev`.`planType` (`planType`) VALUES ("Curator Defined");

CREATE TABLE `actionType` (
  `actionTypeId` int(11) NOT NULL AUTO_INCREMENT,
  `actionType` varchar(255) NOT NULL,
  PRIMARY KEY (`actionTypeId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;


CREATE TABLE `groups` (
  `groupId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `groupName` varchar(255) NOT NULL,
  PRIMARY KEY (`groupId`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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

CREATE TABLE `museum` (
  `museumId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `museumName` varchar(255) NOT NULL,
  PRIMARY KEY (`museumId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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

CREATE TABLE `tag` (
  `tagId` int(11) NOT NULL AUTO_INCREMENT,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `tagName` varchar(255) NOT NULL,
  `proCreated` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE `exhibitTags` (
  `exhibitId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`exhibitId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `exhibittags_ibfk_1` FOREIGN KEY (`exhibitId`) REFERENCES `exhibit` (`exhibitId`),
  CONSTRAINT `exhibittsgs_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `displayTags` (
  `displayId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`displayId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `displaytags_ibfk_1` FOREIGN KEY (`displayId`) REFERENCES `display` (`displayId`),
  CONSTRAINT `displaytags_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `artifactTags` (
  `artifactId` int(11) NOT NULL,
  `tagId` int(11) NOT NULL,
  `active` tinyint(4) NOT NULL DEFAULT '1',
  `createTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updateTime` timestamp NULL DEFAULT NULL,
  `proCreated` tinyint(4) NULL DEFAULT NULL,
  PRIMARY KEY (`artifactId`,`tagId`),
  KEY `tagId` (`tagId`),
  CONSTRAINT `artifacttags_ibfk_1` FOREIGN KEY (`artifactId`) REFERENCES `artifact` (`artifactId`),
  CONSTRAINT `artifacttags_ibfk_2` FOREIGN KEY (`tagId`) REFERENCES `tag` (`tagId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

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



