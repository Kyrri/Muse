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
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('1', '1', 'super', 'admin', '1', '1', '2');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('1', '1', '1', 'admin\%40muse.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '1');

alter table `muse_qa`.`user` auto_increment = 1;
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('2', '1', 'Tom', 'Collins', '1', '4', '1');
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('3', '1', 'Mary', 'Jane', '2', '3', '1');
INSERT INTO `muse_qa`.`user` (`userId`, `active`, `firstName`, `lastName`, `gender`, `ageRange`, `userTypeId`) VALUES ('4', '1', 'Moko', 'Na', '2', '2', '1');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('2', '1', '1', 'test1\%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '2');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('3', '1', '1', 'test2\%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '3');
INSERT INTO `muse_qa`.`login` (`loginId`, `active`, `loginType`, `login`, `pass`, `userId`) VALUES ('4', '1', '1', 'test3\%40test.com', 'pbkdf2$10000$0e9dcdc6127f44594691365f927eb37ec865b8c5a3fb5dcc6f2d17d368cd96d7550d254edb5e5802aad318226b4d698033223236c4cdb71dbe629ab5582a4021$ed0a6912657d74e849ddf4b54a9d6ee0d7a16d538e8010650fe29d22c65ccbcb5a3e0e4a6175855ed8b62a5d6a74d43e7f142e09b5e7df9b4ddc930ad6effeb1', '1');

/* Add museums firts */
alter table `muse_qa`.`museum` auto_increment = 1;
INSERT INTO `muse_qa`.`museum` (`museumId`, `active`, `museumName`) VALUES ('1', '1', 'Muse Sample');
INSERT INTO `muse_qa`.`museum` (`museumId`, `active`, `museumName`) VALUES ('2', '1', 'SYDE/Civil Design Symposium');

/* Add museum admin permissions */
alter table `muse_qa`.`museumPermission` auto_increment = 1;
INSERT INTO `muse_qa`.`museumPermission` (`userId`, `museumId`) VALUES ('1', '1');
INSERT INTO `muse_qa`.`museumPermission` (`userId`, `museumId`) VALUES ('1', '2');

/* Add exhibits next */
alter table `muse_qa`.`exhibit` auto_increment = 1;
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('1', '1', 'Vincent van Gogh', '1');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('2', '1', 'Wassily Kandinsky', '1');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('3', '1', 'Portraits', '1');
INSERT INTO `muse_qa`.`exhibit` (`exhibitId`, `active`, `exhibitName`, `museumId`) VALUES ('4', '1', 'Landscapes', '1');

/* Add artists next */
alter table `muse_qa`.`artist` auto_increment = 1;
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('1', 'Wassily Kandinsky', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('2', 'Leonardo da Vinci', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('3', 'James Abbott McNeill Whistler', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('4', 'Rembrandt', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('5', 'Grant Wood', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('6', 'Johannes Vermeer', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('7', 'Jan van Eyck', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('8', 'Vincent van Gogh', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('9', 'John Singer Sargent', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('10', 'El Greco', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('11', 'Albert Bierstadt', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('12', 'Claude Monet', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('13', 'Carel Fabritius', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('14', 'David Hockney', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('15', 'Claude Lorrain', '1');
INSERT INTO `muse_qa`.`artist` (`artistId`, `artist`, `active`) VALUES ('16', 'Alfred Sisley', '1');

/* Add an element */
/*Exhibit 1*/
alter table `muse_qa`.`element` auto_increment = 1;
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('1', '1', 'The Starry Night', '8', '1889', 'Van Gogh painted this piece in 1889 while he was in Saint Rémy seeking treatment in a mental asylum.', 'http://lh6.ggpht.com/HlgucZ0ylJAfZgusynnUwxNIgIp5htNhShF559x3dRXiuy_UdP3UQVLYW6c=s1200', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('2', '1', 'Irises', '8', '1889', 'Irises is one of many paintings and prints of irises by Vincent Van Gogh.', 'http://lh5.ggpht.com/Go9QucSIS0OASfQar5o3ziLZFJfpbzoEURXvSL2vpu9B8yvvarl7qhrZQKs=s1200', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('3', '1', 'The Potato Eaters', '8', '1885', 'The Potato Eaters is an oil painting by Dutch artist Vincent van Gogh painted in April 1885 in Nuenen, Netherlands. ', 'https://upload.wikimedia.org/wikipedia/commons/b/b1/Van-willem-vincent-gogh-die-kartoffelesser-03850.jpg', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('4', '1', 'Cafe Terrace at Night', '8', '1888', 'Café Terrace at Night, also known as The Cafe Terrace on the Place du Forum, is a coloured oil painting executed by the Dutch artist Vincent van Gogh on an industrially primed canvas of size 25 in Arles, France, mid-September 1888.', 'https://upload.wikimedia.org/wikipedia/commons/0/09/Van_Gogh_-_Terrasse_des_Caf%C3%A9s_an_der_Place_du_Forum_in_Arles_am_Abend1.jpeg', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('5', '1', 'The Night Cafe', '8', '1888', 'The Night Café is an oil painting created by Dutch artist Vincent van Gogh in September 1888 in Arles. ', 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Le_caf%C3%A9_de_nuit_%28The_Night_Caf%C3%A9%29_by_Vincent_van_Gogh.jpeg', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('6', '1', 'Wheat Field with  Cypresses', '8', '1889', 'A Wheatfield with Cypresses is any of three similar 1889 oil paintings by Vincent van Gogh, as part of his wheat field series. ', 'https://upload.wikimedia.org/wikipedia/commons/1/15/Vincent_van_Gogh_-_Wheat_Field_with_Cypresses_%28National_Gallery_version%29.jpg', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('7', '1', 'Bedroom in Arles', '8', '1888', 'Bedroom in Arles is the title given to each of three similar paintings by 19th-century Dutch Post-Impressionist painter Vincent van Gogh. ', 'https://upload.wikimedia.org/wikipedia/commons/7/77/Vincent_van_Gogh_-_Van_Gogh\'s_Bedroom_in_Arles_-_Google_Art_Project.jpg', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('8', '1', 'Wheatfield with Crows', '8', '1890', 'Wheatfield with Crows is a July 1890 painting by Vincent van Gogh. It is commonly stated that this was van Gogh\'s last painting.', 'http://lh5.ggpht.com/sGFNYnsvcc0L5hH_h3bcFo7pcQSqsYRZninoM_YpT_zudbjOVQAxeA0DZgM=s1200', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('9', '1', 'The Yellow House', '8', '1888', 'The Yellow House, alternatively named The Street, is an 1888 oil painting by the 19th-century Dutch Post-Impressionist painter Vincent van Gogh. ', 'http://lh6.ggpht.com/Xre4KcXyVP2H5GFHqwYchBMLM1ok0GEHwGUTerCJYnELzedZ1VBz_8g8S6_e=s1200', '1', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('10', '1', 'The Red Vineyard', '8', '1888', 'The Red Vineyards near Arles is an oil painting by the Dutch painter Vincent van Gogh, executed on a privately primed Toile de 30 piece of burlap in early November 1888.', 'https://upload.wikimedia.org/wikipedia/commons/3/35/Red_vineyards.jpg', '1', '');

/*Exhibit 2*/
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('11', '1', 'Composition VII', '1', '1913', 'Commonly cited as the pinnacle of Kandinskys pre-World War I achievement, Composition VII shows the artists rejection of pictorial representation through a swirling hurricane of colors and shapes. ', 'http://www.wassilykandinsky.net/images/works/36.jpg', '2', '');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('12', '1', 'Der Blaue Berg', '1', '1908', 'n this work, the influence of the Fauves on Kandinskys color palette is apparent as he distorted colors and moved away from the natural world. He presented a bright blue mountain, framed by a red and yellow tree on either side.', 'http://annex.guggenheim.org/collections/media/902/41.505_ph_web.jpg', '2');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('13', '1', 'Composition IV', '1', '1911', ' Hidden within the bright swaths of color and the clear black lines of Composition IV, Kandinsky portrayed several Cossacks with lances, as well as boats, reclining figures, and a castle on a hilltop. ', 'http://totallyhistory.com/wp-content/uploads/2012/12/composition-iv-1911.jpg', '2');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('14', '1', 'Composition VIII', '1', '1923', 'The rational, geometric order of Composition VIII is a polar opposite of the operatic composition of Composition VII (1913). Painted while he taught at the Bauhaus, this work illustrates how Kandinsky synthesized elements from Suprematism, Constructivism, and the schools own ethos. ', 'http://annex.guggenheim.org/collections/media/902/37.262_ph_web.jpg', '2');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('15', '1', 'Moscow I', '1', '1908', 'At first the move to Moscow in 1914 initiated a period of depression and Kandinsky hardly even painted at all his first year back. When he picked up his paintbrush again in 1916, he expressed his desire to paint a portrait of Moscow in a letter to his former companion, Munter.', 'http://media.guggenheim.org/content/arts_curriculum/masters/kandinsky_L4_z.jpg', '2');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('16', '1', 'Several Circles ', '1', '1926', ' Kandinsky painted this work in his sixtieth year and it demonstrates his lifelong search for the ideal form of spiritual expression in art. Created as part of his experimentation with a linear style of painting, this work shows his interest in the form of the circle. "The circle," claimed Kandinsky, "is the synthesis of the greatest oppositions. ', 'http://annex.guggenheim.org/collections/media/902/41.283_ph_web.jpg', '2');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('17', '1', 'Composition X', '1', '1939', 'Influenced by the flowing biomorphic forms of Surrealism, Kandinsky later incorporated organic shapes back into his pictorial vocabulary. Executed in France, this monumental painting relies upon a black background to heighten the visual impact of the brightly colored undulating forms in the foreground. ', 'https://upload.wikimedia.org/wikipedia/commons/d/d4/Wassily_Kandinsky,_1939_-_Composition_X.png', '2');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('18', '1', 'Der Blaue Reiter', '1', '1903', ' This breakthrough work is a deceptively simple image - a lone rider racing across a landscape - yet it represented a decisive moment in Kandinskys developing style. In this painting, he demonstrated a clear stylistic link to the work of the Impressionists, like Claude Monet, particularly evident in the contrasts of light and dark on the sun-dappled hillside. ', 'http://www.moma.org/german_expressionism/images/styles/blaue_reiter/thumbnails/01.jpg', '2');

/*Exhibit 3*/
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('19', '1', 'Mona Lisa', '2', '1503', 'The Mona Lisa is a half-length portrait of a woman by the Italian artist Leonardo da Vinci, which has been acclaimed as "the best known, the most visited, the most written about, the most sung about, the most parodied work of art in the world".', 'https://upload.wikimedia.org/wikipedia/commons/e/ec/Mona_Lisa%2C_by_Leonardo_da_Vinci%2C_from_C2RMF_retouched.jpg', '3');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('20', '1', 'Whistlers Mother', '3', '1871', 'Arrangement in Grey and Black No.1, best known under its colloquial name Whistlers Mother, is a painting in oils on canvas created by the American-born painter James McNeill Whistler in 1871.', 'http://lh6.ggpht.com/tLRAUHjROVYb0eWrCoTg5-bIu7ATED7z3Uq_6OoR3mF0DlX5MOQEMv6ErgNM=s1200', '3');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('21', '1', 'The Night Watch', '4', '1642', 'Militia Company of District II under the Command of Captain Frans Banninck Cocq, also known as The Shooting Company of Frans Banning Cocq and Willem van Ruytenburch, but commonly referred to as The Night Watch (Dutch: De Nachtwacht), is a 1642 painting by Rembrandt van Rijn. ', 'http://lh3.ggpht.com/kyli_fpElvyJPO-SmYL6NE4h_5meEj_-3Q3gqzc-DJSkNnPLwl6BCuyllV5yWA=s1200', '3');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('22', '1', 'American Gothic', '5', '1930', 'American Gothic is a painting by Grant Wood in the collection of the Art Institute of Chicago. Woods inspiration came from what is now known as the American Gothic House, and his decision to paint the house along with the kind of people I fancied should live in that house." The painting shows a farmer standing beside a woman that has been interpreted to be either his wife or his daughter.', 'http://lh5.ggpht.com/Vw6D1hSkdwPxGarkGGMviDZflLBx7wH6skpde-2KLautW5vZkCEz1TPYXnM=s1200', '3');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('23', '1', 'Girl with a Pearl Earring', '6', '1665', 'Girl with a Pearl Earring is an oil painting by 17th-century Dutch painter Johannes Vermeer. It is a tronie of a girl with a headscarf and a pearl earring. ', 'https://upload.wikimedia.org/wikipedia/commons/d/d7/Meisje_met_de_parel.jpg', '3');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('24', '1', 'Arnolfini Portrait', '7', '1434', 'The Arnolfini Portrait is an oil painting on oak panel dated 1434 by the Early Netherlandish painter Jan van Eyck.', 'https://upload.wikimedia.org/wikipedia/commons/3/33/Van_Eyck_-_Arnolfini_Portrait.jpg', '3');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('25', '1', 'Portrait of Madame X', '9', '1883', 'Madame X or Portrait of Madame X is the informal title of a portrait painting by John Singer Sargent of a young socialite named Virginie Amélie Avegno Gautreau, wife of Pierre Gautreau.', 'https://upload.wikimedia.org/wikipedia/commons/a/a4/Madame_X_%28Madame_Pierre_Gautreau%29%2C_John_Singer_Sargent%2C_1884_%28unfree_frame_crop%29.jpg', '3');

/*Exhibit 4*/
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('26', '1', 'View of Toledo', '10', '1600', 'View of Toledo, is one of the two surviving landscapes painted by El Greco. The other, View and Plan of Toledo lies at Museo Del Greco, Toledo, Spain.', 'http://lh3.ggpht.com/RqXgLVgDATaim60OJJI7-vKnimiu9b2nnCFGiT8AGphvtEZZsbJphYXQdt_H=s1200', '4');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('27', '1', 'A Storm in the Rocky Mountains, Mt. Rosalie', '11', '1866', 'A Storm in the Rocky Mountains, Mt. Rosalie is an 1866 landscape oil painting by German-American painter Albert Bierstadt that was inspired by sketches created on an 1863 expedition.', 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Bierstadt_A_Storm_in_the_Rocky_Mountains,_Mt_Rosalie.jpg', '4');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('28', '1', 'Beach in Pouville', '12', '1882', 'Beach in Pourville is a painting by French artist Claude Monet. It was painted in 1882, one of a series of oil-on-canvas works made by Monet that year in the small seaside resort of Pourville-sur-Mer, near Dieppe in northern France.', 'https://upload.wikimedia.org/wikipedia/commons/f/fa/Beach_at_Pourville.jpg', '4');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('29', '1', 'A View of Delft', '13', '1652', 'A View of Delft, with a Musical Instrument Sellers Stall is a 1652 painting by Carel Fabritius. It is an oil painting on canvas of 20.9 by 35.7 cm of a cityscape of Delft.', 'http://www.essentialvermeer.com/catalogue/images/intractv/voesmar_delft.jpg', '4');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('30', '1', 'Waterloo Bridge, Sunlight Effect', '14', '1903', 'Claude Monet, regarded as the leader of the Impressionist movement, was the most original and influential painter of the nineteenth century. He produced a variety of landscapes and outdoor scenes that explore the transitory effects of light and clear color under varying atmospheric conditions. This magnificent painting belongs to Monets later career, when he focused increasingly on a series of canvases devoted to a single motif. ', 'http://www.artic.edu/aic/collections/citi/images/standard/WebLarge/WebImg_000267/182302_3188052.jpg', '4');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`) VALUES ('31', '1', 'A Bigger Grand Canyon ', '15', '1998', 'In 1982 David Hockney took a series of photographs of the Grand Canyon that he placed together to form a collage. Hockney returned to the Grand Canyon theme in 1986, producing a large-scale photo-collage of sixty photographs; and again in 1997, when he painted A composition for a bigger Grand Canyon.', 'http://nga.gov.au/hockney/big.jpg', '4');
INSERT INTO `muse_qa`.`element` (`elementId`, `active`, `title`, `artistId`, `paintYear`, `description`, `imageLink`, `exhibitId`, `utilTime`) VALUES ('32', '1', 'Ascanius Shooting the Stag of Sylvia', '16', '1682', 'Landscape with Ascanius Shooting the Stag of Sylvia is an 1682 oil on canvas painting by Claude Lorrain, a painter of the style of Classicism. ', 'https://upload.wikimedia.org/wikipedia/commons/e/ee/Ascanius_Shooting_the_Stag_of_Sylvia_1682_Claude_Lorrain.jpg', '4', '0');

update `muse_qa`.`element` set utilTime=45;
/* Code Elements */
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(1,1000,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(2,1001,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(3,1002,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(4,1003,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(5,1004,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(6,1005,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(7,1006,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(8,1007,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(9,1008,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(10,1009,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(11,1010,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(12,1011,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(13,1012,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(14,1013,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(15,1014,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(16,1015,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(17,1016,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(18,1017,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(19,1018,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(20,1019,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(21,1020,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(22,1021,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(23,1022,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(24,1023,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(25,1024,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(26,1025,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(27,1026,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(28,1027,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(29,1028,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(30,1029,null);
INSERT INTO `muse_qa`.`elementcode`(`elementId`,`code`,`locationId`) VALUES(31,1030,null);

/* Adding Tags */
alter table `muse_qa`.`elementtag` auto_increment = 1;
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('1', 'Baroque', '3', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('2', 'Abstract', '3', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('3', 'Classicism', '3', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('4', 'Expressionism', '3', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('5', 'Still Life', '2', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('6', 'Landscape', '2', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('7', 'Portrait', '2', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('8', 'Oil on Canvas', '1', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('9', 'Watercolour', '1', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('10', 'Acrylic', '1', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('11', 'Automotive', '1', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('12', 'Mining', '1', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('13', 'Clothing', '1', '1');
INSERT INTO `muse_qa`.`elementtag` (`elementTagId`, `elementTag`, `elementTagTypeId`, `active`) VALUES ('14', 'Service', '1', '1');

/* Tagging Elements */
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '11', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '12', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '13', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '14', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '15', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '16', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '17', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('2', '18', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '11', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '12', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '13', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '14', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '15', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '16', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '17', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '18', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '1', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '2', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '3', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '4', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '5', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '6', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '7', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '8', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '1', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '4', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '6', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '19', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '20', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '21', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '22', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '23', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '24', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('7', '25', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '19', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '20', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('3', '21', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '22', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('1', '23', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '24', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '25', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '9', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '10', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '26', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '27', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '28', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '29', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '30', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('6', '31', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '26', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '27', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '28', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '29', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '30', '1');
INSERT INTO `muse_qa`.`elementtagmapping` (`elementTagId`, `elementId`, `active`) VALUES ('8', '31', '1');

alter table muse_qa.interaction auto_increment=1;
alter table muse_qa.visit auto_increment=1;
