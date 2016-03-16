/* Data initialization scripting to do list
	- need to figure out how to script / dump constant data (i.e., interactionType, loginType, gender, ageRange)

Static data:
	- 1 Museum
		- 3-5 Exhibits
			- 7-10 Elements per exhbit
				- 1 code per element
				- 3-5 tags per element

	- 7-10 Different artists 
	- 2-3 Differnt Tag Types
		- 7-10 Different Tags

	- 3-5 Samples Users
*/

/* User */
/* The admin user */
INSERT INTO `muse_dev`.`user` (`userId`, `active`, `firstName`, `lastName`, `userTypeId`) VALUES ('1', '1', 'admin', 'admin', '2');
INSERT INTO `muse_dev`.`login` (`loginId`, `active`, `loginType`, `login`, `userId`) VALUES ('1', '1', '1', 'admin%40muse.com', '1');

/* Add museums firts */
INSERT INTO `muse_dev`.`museum` (`museumName`) VALUES ('Muse Demo');

/* Add exhibits next */
INSERT INTO `muse_dev`.`exhibit` (`exhibitName`, `museumId`) VALUES ('Cats', '1');
INSERT INTO `muse_dev`.`exhibit` (`exhibitName`, `museumId`) VALUES ('Dogs', '2');

/* Add an element */
INSERT INTO `muse_dev`.`element` (`title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('Dug the Dog', '4', '2016', 'It\'s Dug\'s 1st Birthday', 'http://i.imgur.com/kQa1ri6.jpg', '10');

/* Code Elements */
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`location`) VALUES(15,4321,null);