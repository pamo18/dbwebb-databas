-- MySQL dump 10.13  Distrib 8.0.14, for macos10.14 (x86_64)
--
-- Host: localhost    Database: eshop
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
-- Table structure for table `kategori`
--

DROP TABLE IF EXISTS `kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kategori` (
  `typ` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`typ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kategori`
--

LOCK TABLES `kategori` WRITE;
/*!40000 ALTER TABLE `kategori` DISABLE KEYS */;
INSERT INTO `kategori` VALUES ('bth'),('dbwebb'),('DLG'),('kaffe'),('mugg'),('penna'),('porslin'),('skiva'),('spellista'),('te');
/*!40000 ALTER TABLE `kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kund`
--

DROP TABLE IF EXISTS `kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `kund` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fornamn` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  `efternamn` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  `adress` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `postnummer` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `ort` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `land` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `telefon` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kund`
--

LOCK TABLES `kund` WRITE;
/*!40000 ALTER TABLE `kund` DISABLE KEYS */;
INSERT INTO `kund` VALUES (1,'Mikael','Roos','Centrumgatan 1','564 00','Bankeryd','Sverige','070 42 42 42'),(2,'John','Doe','Skogen 1','555 55','555 55','Sverige','070 123 555'),(3,'Jane','Doe','Skogen 2','555 56','666 66','Sverige','070 456 556'),(4,'Mumintrollet','Mumin','Blå hus 1','111 11','Mumindalen','Finland','070 111 111'),(5,'Paul','Moreland','Ringvägen 1','531 73','Källby','Sverige','070 00 00 10');
/*!40000 ALTER TABLE `kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lager`
--

DROP TABLE IF EXISTS `lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `lager` (
  `hylla` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`hylla`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lager`
--

LOCK TABLES `lager` WRITE;
/*!40000 ALTER TABLE `lager` DISABLE KEYS */;
INSERT INTO `lager` VALUES ('A:101'),('A:201'),('B:101'),('C:101'),('C:201');
/*!40000 ALTER TABLE `lager` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `leverans`
--

DROP TABLE IF EXISTS `leverans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `leverans` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `total` decimal(18,2) NOT NULL,
  `pris` decimal(18,2) NOT NULL,
  `faktura` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `order_id_lv` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `leverans`
--

LOCK TABLES `leverans` WRITE;
/*!40000 ALTER TABLE `leverans` DISABLE KEYS */;
/*!40000 ALTER TABLE `leverans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logg`
--

DROP TABLE IF EXISTS `logg`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `logg` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tid` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `handelse` text COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'2019-02-26 15:12:36','Product inserted: Kaffemugg med dbwebb-tryck, pris: 69.00'),(2,'2019-02-26 15:12:36','Product inserted: Temugg med dbwebb-tryck, pris: 79.00'),(3,'2019-02-26 15:12:36','Product inserted: Kaffeblandning med dbwebb-krydda, pris: 49.00'),(4,'2019-02-26 15:12:36','Product inserted: Skiva där BTHs lärarkår sjunger, pris: 199.00'),(5,'2019-02-26 15:12:36','Product inserted: DLG Penna, pris: 500.00'),(6,'2019-02-26 15:12:36','Inventory added: 1, quantity: 7 on shelf A:101'),(7,'2019-02-26 15:12:36','Inventory added: 2, quantity: 12 on shelf B:101'),(8,'2019-02-26 15:12:36','Inventory added: 3, quantity: 200 on shelf A:201'),(9,'2019-02-26 15:12:36','Inventory added: 4, quantity: 3 on shelf C:101'),(10,'2019-02-26 15:12:36','Inventory added: 5, quantity: 5000 on shelf C:201');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kund_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `antal` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `kund_id_idx` (`kund_id`),
  KEY `produkt_id_idx` (`produkt_id`),
  CONSTRAINT `kund_id_order` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`),
  CONSTRAINT `produkt_id_order` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order2produkt`
--

DROP TABLE IF EXISTS `order2produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order2produkt` (
  `produkt_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  KEY `produkt_id_idx` (`produkt_id`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `order_id_op` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `produkt_id_op` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order2produkt`
--

LOCK TABLES `order2produkt` WRITE;
/*!40000 ALTER TABLE `order2produkt` DISABLE KEYS */;
/*!40000 ALTER TABLE `order2produkt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `plocklista`
--

DROP TABLE IF EXISTS `plocklista`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `plocklista` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) NOT NULL,
  `hylla` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_id_idx` (`order_id`),
  KEY `hylla_id_pl_idx` (`hylla`),
  CONSTRAINT `hylla_pl` FOREIGN KEY (`hylla`) REFERENCES `lager` (`hylla`),
  CONSTRAINT `order_id_pl` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `plocklista`
--

LOCK TABLES `plocklista` WRITE;
/*!40000 ALTER TABLE `plocklista` DISABLE KEYS */;
/*!40000 ALTER TABLE `plocklista` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt`
--

DROP TABLE IF EXISTS `produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produkt` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `namn` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  `pris` decimal(18,2) NOT NULL,
  `bild_lank` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `beskrivning` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1,'Kaffemugg med dbwebb-tryck',69.00,'/img/eshop/kaffekopp.png','En vacker snövit keramisk kaffemugg med högup'),(2,'Temugg med dbwebb-tryck',79.00,'/img/eshop/temugg.png','En ståtlig matt helsvart temugg, extra stor, '),(3,'Kaffeblandning med dbwebb-krydda',49.00,'/img/eshop/kaffe.png','En egenbryggd kaffeblandning för aktiva studi'),(4,'Skiva där BTHs lärarkår sjunger',199.00,'/img/eshop/bth-skiva.png','BTHs samlade lärarkår sjunger studiemotiveran'),(5,'DLG Penna',500.00,'/img/eshop/penna.png','Den finaste penna i världen.');
/*!40000 ALTER TABLE `produkt` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_insert` AFTER INSERT ON `produkt` FOR EACH ROW INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product inserted: ', NEW.namn, ', pris: ', NEW.pris)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_update` AFTER UPDATE ON `produkt` FOR EACH ROW INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Product updated, Before: id = ',
            OLD.id,
            ', ',
            OLD.namn,
            ', ',
            OLD.pris,
            ', ',
            ' After: id = ',
            NEW.id,
            ', ',
            NEW.namn,
            ', ',
            NEW.pris
        )) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_product_delete` AFTER DELETE ON `produkt` FOR EACH ROW INSERT INTO logg (`handelse`)
        VALUES (CONCAT('Product deleted: ', OLD.namn)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `produkt2kategori`
--

DROP TABLE IF EXISTS `produkt2kategori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produkt2kategori` (
  `produkt_id_kat` int(11) NOT NULL,
  `kategori` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  KEY `produkt_id_pkat_idx` (`produkt_id_kat`),
  KEY `kategori_typ_pkat_idx` (`kategori`),
  CONSTRAINT `kategori_pkat` FOREIGN KEY (`kategori`) REFERENCES `kategori` (`typ`),
  CONSTRAINT `produkt_id_pkat` FOREIGN KEY (`produkt_id_kat`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2kategori`
--

LOCK TABLES `produkt2kategori` WRITE;
/*!40000 ALTER TABLE `produkt2kategori` DISABLE KEYS */;
INSERT INTO `produkt2kategori` VALUES (1,'dbwebb'),(1,'mugg'),(1,'porslin'),(1,'kaffe'),(2,'dbwebb'),(2,'mugg'),(2,'te'),(3,'kaffe'),(4,'skiva'),(5,'penna'),(5,'DLG');
/*!40000 ALTER TABLE `produkt2kategori` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt2kund`
--

DROP TABLE IF EXISTS `produkt2kund`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produkt2kund` (
  `produkt_id` int(11) NOT NULL,
  `kund_id` int(11) NOT NULL,
  KEY `produkt_id_idx` (`produkt_id`),
  KEY `kund_id_idx` (`kund_id`),
  CONSTRAINT `kund_id_pk` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`),
  CONSTRAINT `produkt_id_pk` FOREIGN KEY (`produkt_id`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2kund`
--

LOCK TABLES `produkt2kund` WRITE;
/*!40000 ALTER TABLE `produkt2kund` DISABLE KEYS */;
/*!40000 ALTER TABLE `produkt2kund` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produkt2lager`
--

DROP TABLE IF EXISTS `produkt2lager`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `produkt2lager` (
  `produkt_id_lag` int(11) NOT NULL,
  `antal` int(11) DEFAULT NULL,
  `hylla_id` varchar(45) COLLATE utf8_swedish_ci NOT NULL,
  KEY `produkt_id_lager_idx` (`produkt_id_lag`),
  KEY `hylla_id_lager_idx` (`hylla_id`),
  CONSTRAINT `hylla_id_lager` FOREIGN KEY (`hylla_id`) REFERENCES `lager` (`hylla`),
  CONSTRAINT `produkt_id_lager` FOREIGN KEY (`produkt_id_lag`) REFERENCES `produkt` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt2lager`
--

LOCK TABLES `produkt2lager` WRITE;
/*!40000 ALTER TABLE `produkt2lager` DISABLE KEYS */;
INSERT INTO `produkt2lager` VALUES (1,7,'A:101'),(2,12,'B:101'),(3,200,'A:201'),(4,3,'C:101'),(5,5000,'C:201');
/*!40000 ALTER TABLE `produkt2lager` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_lager_insert` AFTER INSERT ON `produkt2lager` FOR EACH ROW INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Inventory added: ',
            NEW.produkt_id_lag,
            ', quantity: ',
            NEW.antal,
            ' on shelf ',
            NEW.hylla_id)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_lager_update` AFTER UPDATE ON `produkt2lager` FOR EACH ROW INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Inventory updated: ',
            NEW.produkt_id_lag,
            ', quantity: ',
            NEW.antal - OLD.antal,
            ' on shelf ',
            NEW.hylla_id)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`user`@`%`*/ /*!50003 TRIGGER `log_lager_delete` AFTER DELETE ON `produkt2lager` FOR EACH ROW INSERT INTO logg (`handelse`)
        VALUES (CONCAT(
            'Shelf ', OLD.hylla_id,
            ' inventory deleted for product id: ',
            OLD.produkt_id_lag)) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `v_produkt`
--

DROP TABLE IF EXISTS `v_produkt`;
/*!50001 DROP VIEW IF EXISTS `v_produkt`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_produkt` AS SELECT 
 1 AS `id`,
 1 AS `namn`,
 1 AS `pris`,
 1 AS `bild_lank`,
 1 AS `beskrivning`,
 1 AS `Kategorier`,
 1 AS `Hylla`,
 1 AS `Lagersaldo`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping routines for database 'eshop'
--
/*!50003 DROP PROCEDURE IF EXISTS `add_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `add_inv`(
    _id INT,
    _hylla_id VARCHAR(45),
    _antal INT)
BEGIN
    IF (
        SELECT antal
        FROM produkt2lager
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id)

        THEN
        UPDATE produkt2lager
        SET antal = antal + _antal
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;

        ELSE
        INSERT INTO produkt2lager
        VALUES(_id, _antal, _hylla_id);
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_kund` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `create_kund`(
    a_fornamn VARCHAR(45),
    a_efternamn VARCHAR(45),
    a_adress VARCHAR(45),
    a_postnummer VARCHAR(45),
    a_ort VARCHAR(45),
    a_land VARCHAR(45),
    a_telefon VARCHAR(45)
)
BEGIN
    INSERT INTO kund VALUES (
        a_fornamn,
        a_efternamn,
        a_adress,
        a_postnummer,
        a_ort,
        a_land,
        a_telefon
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `create_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `create_product`(
    a_namn VARCHAR(45),
    a_pris DECIMAL(18,2),
    a_bild_lank VARCHAR(45),
    a_beskrivning VARCHAR(45)
)
BEGIN
    INSERT INTO produkt (namn, pris, bild_lank, beskrivning) VALUES (
        a_namn,
        a_pris,
        a_bild_lank,
        a_beskrivning
    );
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `delete_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `delete_product`(a_product_id INT)
BEGIN
    DELETE FROM produkt2kategori WHERE produkt_id_kat = a_product_id;
    DELETE FROM produkt2lager WHERE produkt_id_lag = a_product_id;
    DELETE FROM produkt WHERE id = a_product_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `del_inv` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `del_inv`(
    _id INT,
    _hylla_id VARCHAR(45),
    _antal INT)
BEGIN
    IF (
        (SELECT antal
        FROM produkt2lager
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id) - _antal <= 0)

        THEN
        DELETE FROM produkt2lager
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;

        ELSE
        UPDATE produkt2lager
        SET antal = antal - _antal
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `filter_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `filter_inventory`(_fltr VARCHAR(45))
BEGIN
    SELECT id, namn, Hylla, Lagersaldo
    FROM v_produkt
    WHERE id = _fltr OR namn LIKE CONCAT('%',_fltr,'%')  OR Hylla = _fltr;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_categories` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_categories`()
BEGIN
    SELECT * FROM kategori;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_inventory` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_inventory`()
BEGIN
    SELECT id, namn, Hylla, Lagersaldo FROM v_produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_log`(_num INT)
BEGIN
    SELECT id, DATE_FORMAT(tid, '%Y-%m-%d %H:%i:%s') AS 'Time', handelse FROM logg
    ORDER BY id DESC
    LIMIT _num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_products` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_products`()
BEGIN
    SELECT * FROM v_produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_produkt_info` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_produkt_info`(product_id INT)
BEGIN
    SELECT * FROM produkt WHERE id = product_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_produkt_table` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_produkt_table`()
BEGIN
    SELECT * FROM produkt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_shelf` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_shelf`()
BEGIN
    SELECT * FROM lager
    ORDER BY hylla;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_product` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `update_product`(
    a_id INT,
    a_namn VARCHAR(45),
    a_pris DECIMAL(18,2),
    a_bild_lank VARCHAR(45),
    a_beskrivning VARCHAR(45)
)
BEGIN
    UPDATE produkt
    SET
        namn = a_namn,
        pris = a_pris,
        bild_lank = a_bild_lank,
        beskrivning = a_beskrivning
    WHERE
        id = a_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `v_produkt`
--

/*!50001 DROP VIEW IF EXISTS `v_produkt`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_produkt` AS select `produkt`.`id` AS `id`,`produkt`.`namn` AS `namn`,`produkt`.`pris` AS `pris`,`produkt`.`bild_lank` AS `bild_lank`,`produkt`.`beskrivning` AS `beskrivning`,group_concat(distinct `produkt2kategori`.`kategori` separator ', ') AS `Kategorier`,group_concat(distinct `produkt2lager`.`hylla_id`,'(',`produkt2lager`.`antal`,')' separator ', ') AS `Hylla`,(select sum(`produkt2lager`.`antal`) from `produkt2lager` where (`produkt2lager`.`produkt_id_lag` = `produkt`.`id`) group by `produkt2lager`.`produkt_id_lag`) AS `Lagersaldo` from ((`produkt` left join `produkt2lager` on((`produkt`.`id` = `produkt2lager`.`produkt_id_lag`))) left join `produkt2kategori` on((`produkt`.`id` = `produkt2kategori`.`produkt_id_kat`))) group by `produkt`.`id` */;
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

-- Dump completed on 2019-02-26 16:15:30
