/* Add museums firts */
INSERT INTO `muse_dev`.`museum` (`museumName`) VALUES ('Interwebs');

/* Add exhibits next */
INSERT INTO `muse_dev`.`exhibit` (`exhibitName`, `museumId`) VALUES ('Cats', '4');
INSERT INTO `muse_dev`.`exhibit` (`exhibitName`, `museumId`) VALUES ('Dogs', '4');

/* Add an element */
INSERT INTO `muse_dev`.`element` (`title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('Dug the Dog', '4', '2016', 'It\'s Dug\'s 1st Birthday', 'http://i.imgur.com/kQa1ri6.jpg', '10');

/* Code Elements */
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`location`) VALUES(15,4321,null);