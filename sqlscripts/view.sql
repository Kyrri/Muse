USE `muse_dev`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_elementviews` AS
    SELECT 
        x.museumId,
        m.museumName,
        e.exhibitId,
        x.exhibitName,
        i.elementId,
        c.code AS 'elementCode',
        e.title AS 'elementName',
        a.artist,
        count(i.interactionId) AS 'views',
        i.tstamp AS 'tstamp'
    FROM interaction i
        left JOIN `element` `e` ON `i`.`elementId` = `e`.`elementId`
        left JOIN `exhibit` `x` ON `e`.`exhibitId` = `x`.`exhibitId`
        left join museum m on x.museumId=m.museumId
        left join elementcode c on i.elementId=c.elementId
        left join artist a on e.artistId=a.artistId
    WHERE
        `i`.`interactionTypeId` = 1
    group by
        museumId, museumName, exhibitId, exhibitName, elementId, elementCode, elementName, 
        artist, tstamp;

    
    
