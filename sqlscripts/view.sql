USE `muse_dev`;
CREATE 
     OR REPLACE ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `v_elementviews` AS
    SELECT 
        `i`.`interactionId` AS `interactionId`,
        `i`.`tstamp` AS `tstamp`,
        `i`.`interactionTypeId` AS `interactionTypeId`,
        `i`.`userId` AS `userId`,
        `i`.`elementId` AS `elementId`,
        `i`.`visitId` AS `visitId`,
        `e`.`exhibitId` AS `exhibitId`
    FROM interaction i
    LEFT JOIN element e on i.elementId=e.elementId
    WHERE
        i.interactionTypeId=2