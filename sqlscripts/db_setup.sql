-- database scripts
-- create database
-- taylor was here
DROP SCHEMA muse_dev;

CREATE SCHEMA `muse_dev` DEFAULT CHARACTER SET utf8 ;
USE muse_dev ;

-- create tables and sample data
CREATE TABLE `visitor` (
  `visitorId` int(11) NOT NULL AUTO_INCREMENT,
  `visitorName` varchar(255) NOT NULL,
  `login` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`visitorId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

CREATE TABLE visitorGroup (
	visitorGroupId INT NOT NULL AUTO_INCREMENT,
	visitorGroupName VARCHAR(255) NOT NULL,
	PRIMARY KEY (visitorGroupId)
);

CREATE TABLE visitorGroupMemeber (
    visitorGroupId INT NOT NULL,
    visitorId INT NOT NULL,
    active TINYINT NOT NULL DEFAULT 1, 
    updateTime TIMESTAMP NOT NULL DEFAULT NOW(),
	PRIMARY KEY (visitorGroupId, visitorId),
	FOREIGN KEY (visitorGroupId) REFERENCES visitorGroup(visitorGroupId),
	FOREIGN KEY (visitorId) REFERENCES visitor(visitorId)
);
