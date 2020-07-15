-- MySQL dump 10.13  Distrib 8.0.14, for macos10.14 (x86_64)
--
-- Host: localhost    Database: sapo
-- ------------------------------------------------------
-- Server version	8.0.14

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Current Database: `sapo`
--

/*!40000 DROP DATABASE IF EXISTS `sapo`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `sapo` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci */;

USE `sapo`;

--
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kategori` (
  `typ` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  `niva` int(11) DEFAULT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('ickespridning',2),('personskydd',3),('spionage',5),('terrorism',5);
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logg` (
  `id` int(11) NOT NULL,
  `kategori_typ` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `person_id` varchar(10) COLLATE utf8_swedish_ci DEFAULT NULL,
  `organisation_id` varchar(10) COLLATE utf8_swedish_ci DEFAULT NULL,
  `vad` text COLLATE utf8_swedish_ci,
  PRIMARY KEY (`id`),
  KEY `person_id_log_idx` (`person_id`),
  KEY `org_id_log_idx` (`organisation_id`),
  KEY `kat_typ_log` (`kategori_typ`),
  CONSTRAINT `kat_typ_log` FOREIGN KEY (`kategori_typ`) REFERENCES `kategori` (`typ`),
  CONSTRAINT `org_id_log` FOREIGN KEY (`organisation_id`) REFERENCES `organisation` (`id`),
  CONSTRAINT `person_id_log` FOREIGN KEY (`person_id`) REFERENCES `person` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'ickespridning','mumin','ha','Personen iaktogs på en hemmabyggd moped, misstänkt samröre med kriminell mc-organisation och vapenhandel.'),(2,'ickespridning','mumin','ha','Personen syntes hänga på torget vid Sibylla, ätandes en korv med mos, mopeden var nymålad och allt såg mycket misstänkt ut.'),(3,'spionage','mos','ps','Det noterades att personen googlade på \"webbprogrammering\", högst misstänkt spionage och eventuellt brott mot Internet. '),(4,'terrorism','mos','swed','Det finns iakttagelser om att personen pensionssparar sin statliga pension i en känd organisation för pengatvätt, högst olämpligt, rent av ett hot mot rikets säkerhet.'),(5,'spionage','jodoe','ps','Personen verkar sakna bakgrund och identitet, högst märkligt, kan det vara en spion eller vilande terrorgrupp.');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organisation`
--

DROP TABLE IF EXISTS `organisation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `organisation` (
  `id` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `namn` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organisation`
--

LOCK TABLES `organisation` WRITE;
/*!40000 ALTER TABLE `organisation` DISABLE KEYS */;
INSERT INTO `organisation` VALUES ('ha','Henriks Änglar'),('ps','Pensionerade spioner'),('si','Sveriges Idealister'),('swed','Internationell pengatvätt');
/*!40000 ALTER TABLE `organisation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `person`
--

DROP TABLE IF EXISTS `person`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `person` (
  `id` varchar(10) COLLATE utf8_swedish_ci NOT NULL,
  `fornamn` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `efternamn` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `person`
--

LOCK TABLES `person` WRITE;
/*!40000 ALTER TABLE `person` DISABLE KEYS */;
INSERT INTO `person` VALUES ('jadoe','Jane','Doe'),('jodoe','John','Doe'),('mos','Mikael ','Roos'),('mumin','Mumintrollet','Mumin');
/*!40000 ALTER TABLE `person` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_logg`
--

DROP TABLE IF EXISTS `v_logg`;
/*!50001 DROP VIEW IF EXISTS `v_logg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_logg` AS SELECT 
 1 AS `logg_id`,
 1 AS `kategori_typ`,
 1 AS `org_id`,
 1 AS `org_namn`,
 1 AS `person_id`,
 1 AS `person_namn`,
 1 AS `niva`,
 1 AS `vad`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_person`
--

DROP TABLE IF EXISTS `v_person`;
/*!50001 DROP VIEW IF EXISTS `v_person`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_person` AS SELECT 
 1 AS `Namn`,
 1 AS `Antal`,
 1 AS `Organisation`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'sapo'
--
/*!50003 DROP PROCEDURE IF EXISTS `show_all_logg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_all_logg`()
BEGIN
    SELECT
    *
    FROM v_logg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_short_logg` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_short_logg`()
BEGIN
    SELECT
    logg_id,
    kategori_typ,
    org_id,
    org_namn,
    person_id,
    person_namn,
    niva,
    SUBSTRING(vad, 1, 20) AS kort_vad

    FROM v_logg;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_log_filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_log_filter`(
	_filter TEXT)
BEGIN
	SELECT * FROM v_logg
    WHERE kategori_typ
    LIKE CONCAT('%', _filter, '%')
    OR person_id
    LIKE CONCAT('%', _filter, '%')
    OR person_namn
    LIKE CONCAT('%', _filter, '%')
    OR org_id
    LIKE CONCAT('%', _filter, '%')
    OR org_namn
    LIKE CONCAT('%', _filter, '%')
    OR vad
    LIKE CONCAT('%', _filter, '%')
    OR niva = _filter;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_person` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_person`()
BEGIN
    SELECT
    *
    FROM v_person;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_short_filter` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_short_filter`(
	_filter TEXT)
BEGIN
	SELECT
    logg_id,
    kategori_typ,
    org_id,
    org_namn,
    person_id,
    person_namn,
    niva,
    SUBSTRING(vad, 1, 20) AS kort_vad
    FROM v_logg
    WHERE kategori_typ
    LIKE CONCAT('%', _filter, '%')
    OR person_id
    LIKE CONCAT('%', _filter, '%')
    OR person_namn
    LIKE CONCAT('%', _filter, '%')
    OR org_id
    LIKE CONCAT('%', _filter, '%')
    OR org_namn
    LIKE CONCAT('%', _filter, '%')
    OR vad
    LIKE CONCAT('%', _filter, '%')
    OR niva = _filter;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `sapo`
--

USE `sapo`;

--
-- Final view structure for view `v_logg`
--

/*!50001 DROP VIEW IF EXISTS `v_logg`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_logg` AS select `logg`.`id` AS `logg_id`,`logg`.`kategori_typ` AS `kategori_typ`,`organisation`.`id` AS `org_id`,`organisation`.`namn` AS `org_namn`,`person`.`id` AS `person_id`,concat(`person`.`fornamn`,' ',`person`.`efternamn`) AS `person_namn`,`kategori`.`niva` AS `niva`,`logg`.`vad` AS `vad` from (((`logg` join `organisation` on((`logg`.`organisation_id` = `organisation`.`id`))) join `person` on((`logg`.`person_id` = `person`.`id`))) join `kategori` on((`logg`.`kategori_typ` = `kategori`.`typ`))) order by `logg`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_person`
--

/*!50001 DROP VIEW IF EXISTS `v_person`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_person` AS select concat(`person`.`fornamn`,' ',`person`.`efternamn`,' (',`person`.`id`,')') AS `Namn`,(select count(`logg`.`person_id`) from `logg` where (`logg`.`person_id` = `person`.`id`)) AS `Antal`,group_concat(distinct `organisation`.`namn` separator ' + ') AS `Organisation` from ((`person` left join `logg` on((`logg`.`person_id` = `person`.`id`))) left join `organisation` on((`logg`.`organisation_id` = `organisation`.`id`))) group by `person`.`id` order by `Antal` desc,`Namn` desc */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-03-28 18:18:09
