
/* The admin user 
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('1', '1', 'super', 'admin', '1', '1', '2');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('1', '1', '1', 'admin\%40muse.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '1');

alter table `muse_qa`.`user` auto_increment = 1;
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('2', '1', 'Tom', 'Collins', '1', '4', '1');
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('3', '1', 'Mary', 'Jane', '2', '3', '1');
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('4', '1', 'Moko', 'Na', '2', '2', '1');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('2', '1', '1', 'test1\%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '2');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('3', '1', '1', 'test2\%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '3');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('4', '1', '1', 'test3\%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '1');

/* Add museums firts 
alter table `muse_qa`.`museum` auto_increment = 1;
INSERT INTO `muse_qa`.`museum` (`museumId`, `active`, `museumName`) VALUES ('1', '1', 'Muse Sample');
INSERT INTO `muse_qa`.`museum` (`museumId`, `active`, `museumName`) VALUES ('2', '1', 'SYDE/Civil Design Symposium');

/* Add museum admin permissions 
alter table `muse_qa`.`museumPermission` auto_increment = 1;
INSERT INTO `muse_qa`.`museumPermission` (`userId`, `museumId`) VALUES ('1', '1');
INSERT INTO `muse_qa`.`museumPermission` (`userId`, `museumId`) VALUES ('1', '2');

/* Add exhibits next 
alter table `muse_qa`.`exhibit` auto_increment = 1;
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('1', '1', 'Vincent van Gogh', '1');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('2', '1', 'Wassily Kandinsky', '1');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('3', '1', 'Portraits', '1');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('4', '1', 'Landscapes', '1');
*/

INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('5', '1', 'SYDE EngineeingSymposium', '2');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('6', '1', 'Civil EngineeringSymposium', '2');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('7', '1', 'Geological Engineering Symposium', '2');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('8', '1', 'Environmental Engineering', '2');

/*Add Artist*/
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('17', 'Gurneet Arora, Melissa Lynette, Canmanie Ponnambalam, Nicole Simone', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('18', 'Daniella Johnston, Chelsea Haemel, Theo Chan, Jim Lin', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('19', 'Harvey Tang, Mayank Gulati, Lesia Nalepa, Nick Mostowich', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('20', 'Imaad Umar, Laura Ospina, Sumanyu Sharma, Davin Wong', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('21', 'Charlotte Chan, Vishal Mathur, Christopher Stern, Nathan Yim', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('22', 'Ian Easterbrook, Daniel Saunders, Matthew Van Gennip, Prarthana Chandran', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('23', 'Christopher Ngan, Joshua Cheung, Angela Gu, Clement Fun', '1');

/*Add Element*/
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('33', '1', 'TrackConductr', '17', '2016', 'TrackConductr provides baton gesture control for conducting virtual orchestras. It allows conductors to conduct the playback of pre-recorded audio tracks using a simple laptop camera and without altering the baton. TrackConductr extracts the tempo from a conductor’s natural gestures in real-time and dynamically changes the tempo of a MIDI file as it plays.', 'http://i.imgur.com/Rv3E5pJ.jpg', '5', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('34', '1', 'BCI Wheelchair', '18', '2016', 'This design team is developing a training simulation for severely disabled users (e.g. those with ALS, paralysis, tetraplegia, etc.) to control a wheelchair using mental commands. This brain-computer interface (BCI) takes the user’s thought as input for the wheelchair’s movement. The simulation allows the user to control their movement in a virtual environment and test the system’s streamlined control scheme and the obstacle avoidance measures.', 'http://i.imgur.com/bowTpnW.png', '5');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('35', '1', 'Mass Medic', '19', '2016', 'MassMedic is a system to leverage crowdsourced medical information from smartphones and wearable devices in mass casualty incidents to improve disaster response', 'http://i.imgur.com/GUEnMoa.png', '5');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('36', '1', 'Deep Image Encoding for Diagnostic Radiology', '20', '2016', 'Content based image retrieval method that uses radon transforms and auto encoders to index and search for images. The database and search can be integrated into a hospital’s network allowing medical professionals to have “virtual peer review” within seconds.', 'http://i.imgur.com/FNmBp7m.png', '5');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('37', '1', 'Cozie', '21', '2016', 'Cozie is a smart blanket that tracks a user\'s sleep activity, and heats them to an optimal temperature throughout the night to decrease sleep onset time and increase slow wave sleep.', 'http://i.imgur.com/FlAYnFr.jpg', '5');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `exhibitId`) VALUES ('38', '1', 'Peaches', '22', '2016', 'A robotic arm for picking soft fruits.', '5');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `exhibitId`) VALUES ('39', '1', 'Driven', '23', '2016', 'This project aims to provide continuous and automated detection of lane change behaviours and their sentiment. A camera detects the face and a gyroscope is placed on a wheel for a user to operate on a driving simulator, and the data is fused, noise reduced, and given for a machine to learn detection of head turn and lane change start and ends. Potential applications focus on driver education including driving schools and live constructive feedback.', '5');

INSERT INTO `muse_qa`.`elementTag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('15', 'Image Processing', '1', '1');
INSERT INTO `muse_qa`.`elementTag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('16', 'Music', '1', '1');
INSERT INTO `muse_qa`.`elementTag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('17', 'Biomedical', '1', '1');
INSERT INTO `muse_qa`.`elementTag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('18', 'Paramedics', '1', '1');
INSERT INTO `muse_qa`.`elementTag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('19', 'Medical Image Retrieval', '1', '1');
INSERT INTO `muse_qa`.`elementTag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('20', 'Sleep', '1', '1');

INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(33,8000,33);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(34,8001,34);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(35,8002,35);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(36,8003,36);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(37,8004,37);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(38,8005,38);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(39,8006,39);


INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`, `active`) VALUES ('15', '33', '');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('17', '34');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('18', '35');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('19', '36');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('20', '37');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('15', '38');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('15', '39');
INSERT INTO `muse_qa`.`elementTagMapping` (`elementTagId`, `elementId`) VALUES ('16', '33');

INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('33', '5', '7', '12');
INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('34', '5', '9', '11');
INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('35', '5', '10', '12');
INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('36', '5', '7', '9');
INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('37', '5', '4', '10');
INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('38', '5', '6', '9');
INSERT INTO `muse_qa`.`location` (`locationId`, `exhibitId`, `gridX`, `gridY`) VALUES ('39', '5', '4', '9');
