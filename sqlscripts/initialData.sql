/* Data initialization scripting to do list
	- need to figure out how to script / dump constant data (i.e., interactionType, loginType, gender, ageRange)

Static data:
	- 1 Museum
		- 4 Exhibits
			- 10, 8, 7, 7 elements for each exhibit
				- 1 code per element
				- 3-5 tags per element

	- 7-10 Different artists 
	- 2-3 Differnt Tag Types
		- 7-10 Different Tags

	- 3-5 Samples Users
*/

/* User */
/* The admin user */
INSERT INTO `muse_dev`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('1', '1', 'Moko', 'Na', '1', '1', '1');
INSERT INTO `muse_dev`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('1', '1', '1', 'test%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '1');
INSERT INTO `muse_dev`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('2', '1', 'Potato', 'Tomato', '1', '1', '1');
INSERT INTO `muse_dev`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('3', '1', 'Test', 'John', '1', '1', '1');
INSERT INTO `muse_dev`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('2', '1', '1', 'test1%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '2');
INSERT INTO `muse_dev`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('3', '1', '1', 'test2%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '3');


/* Add museums firts */
INSERT INTO `muse_dev`.`museum` (`museumId`, `active`, `museumName`) VALUES ('1', '1', 'The UW Museum');

/* Add exhibits next */
INSERT INTO `muse_dev`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('1', '1', 'Vincent van Gogh', '1');
INSERT INTO `muse_dev`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('2', '1', 'Traditional Dress Around The World', '1');
INSERT INTO `muse_dev`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('3', '1', 'Wildlife', '1');
INSERT INTO `muse_dev`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('4', '1', 'Food from Around the World', '1');

/* Add artists next */
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('1', 'Japan', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('2', 'Italy', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('3', 'India', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('4', 'Korea', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('5', 'France', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('6', 'China', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('7', 'Sweden', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('8', 'Vincent van Gogh', '1');
INSERT INTO `muse_dev`.`artist` (`artistId`, `artist`, `active`) VALUES ('9', 'Canada', '1');

/* Add an element */
/*Exhibit 1*/
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('1', '1', 'The Starry Night', '8', '1889', 'Van Gogh painted this piece in 1889 while he was in Saint Rémy seeking treatment in a mental asylum.', 'http://lh6.ggpht.com/HlgucZ0ylJAfZgusynnUwxNIgIp5htNhShF559x3dRXiuy_UdP3UQVLYW6c=s1200', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('2', '1', 'Irises', '8', '1889', 'Irises is one of many paintings and prints of irises by Vincent Van Gogh.', 'http://lh5.ggpht.com/Go9QucSIS0OASfQar5o3ziLZFJfpbzoEURXvSL2vpu9B8yvvarl7qhrZQKs=s1200', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('3', '1', 'The Potato Eaters', '8', '1885', 'The Potato Eaters is an oil painting by Dutch artist Vincent van Gogh painted in April 1885 in Nuenen, Netherlands. ', 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Van-willem-vincent-gogh-die-kartoffelesser-03850.jpg', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('4', '1', 'Cafe Terrace at Night', '8', '1888', 'Café Terrace at Night, also known as The Cafe Terrace on the Place du Forum, is a coloured oil painting executed by the Dutch artist Vincent van Gogh on an industrially primed canvas of size 25 in Arles, France, mid-September 1888.', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Van_Gogh_-_Terrasse_des_Caf%C3%A9s_an_der_Place_du_Forum_in_Arles_am_Abend1.jpeg', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('5', '1', 'The Night Cafe', '8', '1888', 'The Night Café is an oil painting created by Dutch artist Vincent van Gogh in September 1888 in Arles. ', 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Le_caf%C3%A9_de_nuit_%28The_Night_Caf%C3%A9%29_by_Vincent_van_Gogh.jpeg', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('6', '1', 'Wheat Field with  Cypresses', '8', '1889', 'A Wheatfield with Cypresses is any of three similar 1889 oil paintings by Vincent van Gogh, as part of his wheat field series. ', 'https://upload.wikimedia.org/wikipedia/commons/1/15/Vincent_van_Gogh_-_Wheat_Field_with_Cypresses_%28National_Gallery_version%29.jpg', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('7', '1', 'Bedroom in Arles', '8', '1888', 'Bedroom in Arles is the title given to each of three similar paintings by 19th-century Dutch Post-Impressionist painter Vincent van Gogh. ', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Vincent_van_Gogh_-_Van_Gogh\'s_Bedroom_in_Arles_-_Google_Art_Project.jpg', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('8', '1', 'Wheatfield with Crows', '8', '1890', 'Wheatfield with Crows is a July 1890 painting by Vincent van Gogh. It is commonly stated that this was van Gogh\'s last painting.', 'http://lh5.ggpht.com/sGFNYnsvcc0L5hH_h3bcFo7pcQSqsYRZninoM_YpT_zudbjOVQAxeA0DZgM=s1200', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('9', '1', 'The Yellow House', '8', '1888', 'The Yellow House, alternatively named The Street, is an 1888 oil painting by the 19th-century Dutch Post-Impressionist painter Vincent van Gogh. ', 'http://lh6.ggpht.com/Xre4KcXyVP2H5GFHqwYchBMLM1ok0GEHwGUTerCJYnELzedZ1VBz_8g8S6_e=s1200', '1', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('10', '1', 'The Red Vineyard', '8', '1888', 'The Red Vineyards near Arles is an oil painting by the Dutch painter Vincent van Gogh, executed on a privately primed Toile de 30 piece of burlap in early November 1888.', 'https://upload.wikimedia.org/wikipedia/commons/3/35/Red_vineyards.jpg', '1', '');

/*Exhibit 2*/
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('11', '1', 'Kimono', '1', '1850', 'Traditional Japanese clothing.', 'http://img03.deviantart.net/9410/i/2012/033/2/0/japanese_kimono_1_by_nicojay-d4oe0ij.jpg', '2', '');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('12', '1', 'Traditional Dress of Italy', '2', '1720', 'Traditional Italian dress.', 'https://s-media-cache-ak0.pinimg.com/736x/f8/1f/75/f81f754ef6bb1139cd0daa4e7d042972.jpg', '2');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('13', '1', 'Sari', '3', '1900', 'Traditional Indian dress.', 'http://img5a.flixcart.com/image/sari/d/y/c/2440-a-chirag-sarees-400x400-imae4f9rbkzdqy2h.jpeg', '2');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('14', '1', 'Hanbok', '4', '1470', 'Traditional Korean dress.', 'http://www.freeridebikepark.com/wp-content/uploads/2015/08/Korean-Traditional-Dress-fashion.jpg', '2');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('15', '1', 'Traditional French Dress', '5', '1853', 'Traditional French dress.', 'http://images.nationalgeographic.com/wpf/media-live/photos/000/123/cache/fashion-france-dress_12353_600x450.jpg', '2');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('16', '1', 'Hanfu', '6', '1200', 'Traditional Chinese dress.', 'https://upload.wikimedia.org/wikipedia/commons/5/53/TraditionalChineseWeddingDress.jpg', '2');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('17', '1', 'Traditional Swedish Dress', '7', '1675', 'Traditional Swedish dress.', 'http://www.scandinavianstuff.com/shop/11328/art28/h5162/11625162-origpic-db888a.jpg', '2');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('18', '1', 'Traditional Canadian Dress', '9', '1920', 'Traditional Canadian dress.', 'http://artsalive.ca/collections/costumes/images/O/0203-5-1-AP.jpg', '2');

/*Exhibit 3*/
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('19', '1', 'Bear', '1', '2000', 'Bears in the wild.', 'https://ohsinsider.com/wp-content/uploads/2016/03/Wildlife-Photos14.jpg', '3');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('20', '1', 'Lion', '2', '2012', 'Wild lion.', 'http://envirocivil.com/wp-content/uploads/2012/07/asdasd.jpg', '3');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('21', '1', 'Koala', '3', '1995', 'A group of koalas.', 'http://webneel.com/daily/sites/default/files/images/daily/09-2013/19-wildlife-photography.jpg', '3');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('22', '1', 'Fox', '4', '2015', 'Rawr.', 'http://www.petsfoto.com/wp-content/uploads/2010/12/Wildlife-Photos4.jpg', '3');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('23', '1', 'Sloth', '5', '2002', 'Sloths.', 'http://assets.worldwildlife.org/photos/6526/images/hero_small/sloth_%28c%29_Jorge_Salas_International_Expeditions.JPG?1394634201', '3');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('24', '1', 'Coyote', '6', '2000', 'A wild coyote.', 'http://www.worldanimalfoundation.net/i/Coyote1.jpg', '3');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('25', '1', 'Giraffe', '9', '2010', 'A wild giraffe.', 'https://cdn.idevie.com/wp-content/uploads/2013/03/wildlife_animals_wallpaper27.jpg', '3');

/*Exhibit 4*/
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('26', '1', 'Sushi', '1', '2010', 'Sushi is a food preparation originating in Japan.', 'https://upload.wikimedia.org/wikipedia/commons/9/9c/2007feb-sushi-odaiba-manytypes.jpg', '4');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('27', '1', 'Spaghetti alle vongole', '2', '2016', 'Spaghetti with clams.', 'https://upload.wikimedia.org/wikipedia/commons/a/a1/Spaghetti_alle_vongole%2C_Cafe_a_Taglio%2C_St._Kilda.jpg', '4');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('28', '1', 'Mansha Tarkari', '3', '2010', 'Oriya mutton curry.', 'https://upload.wikimedia.org/wikipedia/commons/f/fe/Odia_Mutton_Curry_%28Mansha_Tarkari%29.jpg', '4');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('29', '1', 'Kongguksu', '4', '2000', 'A cold noodle dish with a broth made from ground soy beans.', 'https://upload.wikimedia.org/wikipedia/commons/b/b9/Korean_noodles-Kongguksu-01.jpg', '4');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('30', '1', 'Foie Gras', '5', '1990', 'Foie gras with mustard seeds and green onions in duck jus.', 'https://upload.wikimedia.org/wikipedia/commons/8/82/Foie_gras_en_cocotte.jpg', '4');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('31', '1', 'Chao fan ', '6', '2013', 'Chinese fried rice.', 'https://upload.wikimedia.org/wikipedia/commons/5/59/Chinese_fried_rice.jpg', '4');
INSERT INTO `muse_dev`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('32', '1', 'Pickled Herring', '7', '2011', 'Pickled herring, sour cream and chopped chives, potatoes and an egg half served at midsummer.', 'https://upload.wikimedia.org/wikipedia/commons/e/ef/Midsummer_pickled_herring.jpg', '4', '0');

/* Code Elements */
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(1,1000,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(2,1001,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(3,1002,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(4,1003,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(5,1004,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(6,1005,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(7,1006,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(8,1007,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(9,1008,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(10,1009,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(11,1010,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(12,1011,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(13,1012,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(14,1013,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(15,1014,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(16,1015,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(17,1016,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(18,1017,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(19,1018,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(20,1019,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(21,1020,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(22,1021,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(23,1022,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(24,1023,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(25,1024,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(26,1025,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(27,1026,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(28,1027,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(29,1028,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(30,1029,null);
INSERT INTO `muse_dev`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(31,1030,null);

/* Adding Tags */
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('1', 'Baroque', '3', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('2', 'Abstract', '3', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('3', 'Classicism', '3', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('4', 'Expressionism', '3', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('5', 'Still Life', '2', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('6', 'Landscape', '2', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('7', 'Portrait', '2', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('8', 'Oil on Canvas', '1', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('9', 'Watercolour', '1', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('10', 'Acrylic', '1', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('11', 'Automotive', '1', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('12', 'Mining', '1', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('13', 'Clothing', '1', '1');
INSERT INTO `muse_dev`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('14', 'Service', '1', '1');
