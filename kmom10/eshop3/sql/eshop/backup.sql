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
-- Current Database: `eshop`
--

/*!40000 DROP DATABASE IF EXISTS `eshop`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `eshop` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_swedish_ci */;

USE `eshop`;

--
-- Table structure for table `faktura`
--

DROP TABLE IF EXISTS `faktura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `faktura` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sent` timestamp NOT NULL,
  `kund_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `status` varchar(45) COLLATE utf8_swedish_ci DEFAULT 'Ej betald',
  `paid` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kund_id_fak_idx` (`kund_id`),
  KEY `order_id_fak_idx` (`order_id`),
  CONSTRAINT `kund_id_fak` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`),
  CONSTRAINT `order_id_fak` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `faktura`
--

LOCK TABLES `faktura` WRITE;
/*!40000 ALTER TABLE `faktura` DISABLE KEYS */;
/*!40000 ALTER TABLE `faktura` ENABLE KEYS */;
UNLOCK TABLES;

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
INSERT INTO `kategori` VALUES ('bth'),('dbwebb'),('DLG'),('kaffe'),('mugg'),('musik'),('penna'),('porslin'),('skiva'),('spellista'),('te');
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
  PRIMARY KEY (`id`),
  KEY `kund_fornamn_index` (`fornamn`),
  KEY `kund_efternamn_index` (`efternamn`)
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logg`
--

LOCK TABLES `logg` WRITE;
/*!40000 ALTER TABLE `logg` DISABLE KEYS */;
INSERT INTO `logg` VALUES (1,'2019-03-29 09:18:22','Product inserted: Kaffemugg med dbwebb-tryck, pris: 69.00'),(2,'2019-03-29 09:18:22','Product inserted: Temugg med dbwebb-tryck, pris: 79.00'),(3,'2019-03-29 09:18:22','Product inserted: Kaffeblandning med dbwebb-krydda, pris: 49.00'),(4,'2019-03-29 09:18:22','Product inserted: Skiva där BTHs lärarkår sjunger, pris: 199.00'),(5,'2019-03-29 09:18:22','Product inserted: DLG Penna, pris: 500.00'),(6,'2019-03-29 09:18:22','Product inserted: Queen A Night at the Opera, pris: 299.00'),(7,'2019-03-29 09:18:22','Product inserted: The Beatles A Hard Day\'s Night, pris: 299.00'),(8,'2019-03-29 09:18:22','Inventory added: 1, quantity: 7 on shelf A:101'),(9,'2019-03-29 09:18:22','Inventory added: 2, quantity: 120 on shelf B:101'),(10,'2019-03-29 09:18:22','Inventory added: 3, quantity: 200 on shelf A:201'),(11,'2019-03-29 09:18:22','Inventory added: 4, quantity: 30 on shelf C:101'),(12,'2019-03-29 09:18:22','Inventory added: 5, quantity: 5000 on shelf C:201'),(13,'2019-03-29 09:18:22','Inventory added: 6, quantity: 30 on shelf A:201'),(14,'2019-03-29 09:18:22','Inventory added: 7, quantity: 25 on shelf A:201');
/*!40000 ALTER TABLE `logg` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order2produkt`
--

DROP TABLE IF EXISTS `order2produkt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order2produkt` (
  `order_id` int(11) NOT NULL,
  `produkt_id` int(11) NOT NULL,
  `kvantitet` int(11) NOT NULL,
  KEY `produkt_id_idx` (`produkt_id`),
  KEY `order_id_idx` (`order_id`),
  CONSTRAINT `order_id_op` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
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
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `kund_id` int(11) DEFAULT NULL,
  `order_status` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `order_created` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `order_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `order_placed` timestamp NULL DEFAULT NULL,
  `order_sent` timestamp NULL DEFAULT NULL,
  `order_deleted` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `kund_id_idx` (`kund_id`),
  CONSTRAINT `kund_id_order` FOREIGN KEY (`kund_id`) REFERENCES `kund` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
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
  `beskrivning` text COLLATE utf8_swedish_ci,
  PRIMARY KEY (`id`),
  KEY `produkt_namn_index` (`namn`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produkt`
--

LOCK TABLES `produkt` WRITE;
/*!40000 ALTER TABLE `produkt` DISABLE KEYS */;
INSERT INTO `produkt` VALUES (1,'Kaffemugg med dbwebb-tryck',69.00,'/img/eshop/kaffekopp.png','En vacker snövit keramisk kaffemugg med högupplöst flerfärgstryck från dbwebb.'),(2,'Temugg med dbwebb-tryck',79.00,'/img/eshop/temugg.png','En ståtlig matt helsvart temugg, extra stor, med grön dbwebb-logo, för sköna stunder framför datorn.'),(3,'Kaffeblandning med dbwebb-krydda',49.00,'/img/eshop/kaffe.png','En egenbryggd kaffeblandning för aktiva studiedagara, utan paus, spetsad med dbwebb-krydda.'),(4,'Skiva där BTHs lärarkår sjunger',199.00,'/img/eshop/bth-skiva.png','BTHs samlade lärarkår sjunger studiemotiverande sångar, inkluderar länk till online spellista.'),(5,'DLG Penna',500.00,'/img/eshop/penna.png','Den finaste penna i världen.'),(6,'Queen A Night at the Opera',299.00,'/img/eshop/queen.png','A Night at the Opera is the fourth studio album by the British rock band Queen.'),(7,'The Beatles A Hard Day\'s Night',299.00,'/img/eshop/beatles.png','A Hard Day\'s Night is the third studio album by the English rock band the Beatles.');
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
INSERT INTO `produkt2kategori` VALUES (1,'dbwebb'),(1,'mugg'),(1,'porslin'),(1,'kaffe'),(2,'dbwebb'),(2,'mugg'),(2,'te'),(3,'kaffe'),(4,'skiva'),(5,'penna'),(5,'DLG'),(6,'skiva'),(6,'musik'),(7,'skiva'),(7,'musik');
/*!40000 ALTER TABLE `produkt2kategori` ENABLE KEYS */;
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
INSERT INTO `produkt2lager` VALUES (1,7,'A:101'),(2,120,'B:101'),(3,200,'A:201'),(4,30,'C:101'),(5,5000,'C:201'),(6,30,'A:201'),(7,25,'A:201');
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
-- Table structure for table `spec`
--

DROP TABLE IF EXISTS `spec`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `spec` (
  `faktura_id` int(11) NOT NULL,
  `produkt_namn` varchar(45) COLLATE utf8_swedish_ci DEFAULT NULL,
  `antal` int(11) DEFAULT NULL,
  `pris` decimal(18,2) DEFAULT NULL,
  KEY `faktura_id_idx` (`faktura_id`),
  CONSTRAINT `faktura_id` FOREIGN KEY (`faktura_id`) REFERENCES `faktura` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spec`
--

LOCK TABLES `spec` WRITE;
/*!40000 ALTER TABLE `spec` DISABLE KEYS */;
/*!40000 ALTER TABLE `spec` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `v_faktura`
--

DROP TABLE IF EXISTS `v_faktura`;
/*!50001 DROP VIEW IF EXISTS `v_faktura`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_faktura` AS SELECT 
 1 AS `faktura_id`,
 1 AS `status`,
 1 AS `paid`,
 1 AS `sent`,
 1 AS `order_id`,
 1 AS `kund_id`,
 1 AS `kund_namn`,
 1 AS `adress`,
 1 AS `postnummer`,
 1 AS `ort`,
 1 AS `land`,
 1 AS `telefon`,
 1 AS `produkt_namn`,
 1 AS `antal`,
 1 AS `pris`,
 1 AS `order_rader`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_logg`
--

DROP TABLE IF EXISTS `v_logg`;
/*!50001 DROP VIEW IF EXISTS `v_logg`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_logg` AS SELECT 
 1 AS `id`,
 1 AS `datum_tid`,
 1 AS `event`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_order_details`
--

DROP TABLE IF EXISTS `v_order_details`;
/*!50001 DROP VIEW IF EXISTS `v_order_details`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_order_details` AS SELECT 
 1 AS `id`,
 1 AS `created`,
 1 AS `kund_id`,
 1 AS `kund_namn`,
 1 AS `produkt_namn`,
 1 AS `produkt_pris`,
 1 AS `kvantitet`,
 1 AS `updated`,
 1 AS `sent`,
 1 AS `order_rader`,
 1 AS `order_status`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_orders`
--

DROP TABLE IF EXISTS `v_orders`;
/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_orders` AS SELECT 
 1 AS `id`,
 1 AS `created`,
 1 AS `kund_id`,
 1 AS `kund_namn`,
 1 AS `order_rader`,
 1 AS `order_status`,
 1 AS `updated`,
 1 AS `placed`,
 1 AS `sent`,
 1 AS `deleted`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `v_plocklista`
--

DROP TABLE IF EXISTS `v_plocklista`;
/*!50001 DROP VIEW IF EXISTS `v_plocklista`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8mb4;
/*!50001 CREATE VIEW `v_plocklista` AS SELECT 
 1 AS `OrderID`,
 1 AS `ProduktID`,
 1 AS `Antal`,
 1 AS `Hylla`,
 1 AS `Lagersaldo`*/;
SET character_set_client = @saved_cs_client;

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
/*!50003 DROP FUNCTION IF EXISTS `order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` FUNCTION `order_status`(
	_created TIMESTAMP,
    _deleted TIMESTAMP,
    _sent TIMESTAMP,
    _placed TIMESTAMP,
    _updated TIMESTAMP
) RETURNS char(10) CHARSET utf8 COLLATE utf8_swedish_ci
    DETERMINISTIC
BEGIN
    IF _created THEN
		IF _deleted THEN
		RETURN 'Raderad';
        ELSEIF _sent THEN
        RETURN 'Skickad';
        ELSEIF _placed THEN
        RETURN 'Beställd';
        ELSEIF _updated > _created THEN
        RETURN 'Updated';
		ELSE RETURN 'Skapad';
        END IF;
	END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `add_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `add_category`(
    _id INT,
	_type VARCHAR(45))
BEGIN
	INSERT INTO produkt2kategori
    VALUES (_id, _type);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
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
        WHERE produkt_id_lag = _id AND hylla_id = _hylla_id) IS NOT NULL

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
/*!50003 DROP PROCEDURE IF EXISTS `build_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `build_order`(
    a_id INT,
    a_produkt_id INT,
    a_kvantitet INT
)
BEGIN
    IF (
        SELECT produkt_id FROM order2produkt
        WHERE order_id = a_id
        AND produkt_id = a_produkt_id) IS NOT NULL

        THEN
        UPDATE order2produkt
        SET kvantitet = kvantitet + a_kvantitet
        WHERE
        order_id = a_id
        AND
        produkt_id = a_produkt_id;

        ELSE
        INSERT INTO order2produkt VALUES(
            a_id,
            a_produkt_id,
            a_kvantitet
        );
    END IF;

    UPDATE orders
    SET order_updated = NOW()
    WHERE id = a_id;
    CALL update_order_status(a_id);
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
/*!50003 DROP PROCEDURE IF EXISTS `create_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `create_order`(
    a_id INT
)
BEGIN
    INSERT INTO orders (kund_id, order_status) VALUES (
        a_id,
        order_status(now(), NULL, NULL, NULL, NULL)
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
    a_beskrivning TEXT
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
/*!50003 DROP PROCEDURE IF EXISTS `delete_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `delete_order`(_id INT)
BEGIN
    UPDATE orders
    SET order_deleted = NOW()
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
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
    DELETE FROM order2produkt WHERE produkt_id = a_product_id;
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
    UPDATE produkt2lager
    SET antal = antal - _antal
    WHERE produkt_id_lag = _id AND hylla_id = _hylla_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `fill_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `fill_invoice`(
    _faktura_id INT,
    _produkt_namn VARCHAR(45),
    _antal INT,
    _pris DECIMAL(18,2)
)
BEGIN
    INSERT INTO spec VALUES(
        _faktura_id,
        _produkt_namn,
        _antal,
        _pris
    );
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
/*!50003 DROP PROCEDURE IF EXISTS `gen_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `gen_invoice`(_sent TIMESTAMP, _order_id INT, _kund_id INT)
BEGIN
    INSERT INTO faktura(sent, kund_id, order_id) VALUES(_sent, _kund_id, _order_id);
    SELECT id FROM faktura WHERE order_id = _order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `invoice_paid` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `invoice_paid`(
    _id INT,
    _paid TIMESTAMP
)
BEGIN
    IF(_paid IS NULL) THEN
        UPDATE faktura
        SET status = 'Betald',
        paid = NOW()
        WHERE id = _id;
    ELSE
        UPDATE faktura
        SET status = 'Betald',
        paid = _paid
        WHERE id = _id;
    END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `place_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `place_order`(_id INT)
BEGIN
    UPDATE orders
    SET order_placed = NOW()
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `remove_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `remove_category`(
	_id INT,
    _typ VARCHAR(45)
)
BEGIN
    DELETE FROM produkt2kategori
    WHERE
    produkt_id_kat = _id
    and
    kategori = _typ
    ;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `send_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `send_order`(_id INT)
BEGIN
    UPDATE orders
    SET order_sent = NOW()
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
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
/*!50003 DROP PROCEDURE IF EXISTS `show_category` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_category`(
	_type VARCHAR(45))
BEGIN
	SELECT * FROM v_produkt
    WHERE FIND_IN_SET(_type, Kategorier);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_customers` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_customers`()
BEGIN
    SELECT * FROM kund
    ORDER BY id;
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
    SELECT id, DATE_FORMAT(tid, '%Y-%m-%d %H:%i:%s') AS datum_tid, handelse FROM logg
    ORDER BY id DESC
    LIMIT _num;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_order`(_id INT)
BEGIN
    SELECT
    id,
    created,
    kund_id,
    kund_namn,
    order_rader,
    order_status
    FROM v_orders
    WHERE id = _id OR kund_id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `show_orders` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_orders`()
BEGIN
    SELECT
    id,
    created,
    kund_id,
    kund_namn,
    order_rader,
    order_status
    FROM v_orders;
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
    SELECT
    id,
    namn,
    pris,
    bild_lank,
    IF(Kategorier IS NULL, 'Ingen kategori vald', Kategorier) AS Kategorier,
    IF(Lagersaldo IS NULL, 'Slut i lager', Lagersaldo) AS Lagersaldo
    FROM v_produkt;
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
/*!50003 DROP PROCEDURE IF EXISTS `show_produkt_kategori` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `show_produkt_kategori`(
	_id INT)
BEGIN
	SELECT kategori FROM produkt2kategori
    WHERE produkt_id_kat = _id;
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
/*!50003 DROP PROCEDURE IF EXISTS `stock_update` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `stock_update`(
    _id INT)
BEGIN
	SELECT * FROM produkt2lager
	WHERE produkt_id_lag = _id
    ORDER BY hylla_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `un_delete_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `un_delete_order`(_id INT)
BEGIN
    UPDATE orders
    SET order_deleted = NULL
    WHERE id = _id;

    UPDATE orders
    SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `update_order_status` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `update_order_status`(_id INT)
BEGIN
    UPDATE orders SET order_status = order_status(
        order_created,
        order_deleted,
        order_sent,
        order_placed,
        order_updated
    )
    WHERE id = _id;
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
    a_beskrivning TEXT
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
/*!50003 DROP PROCEDURE IF EXISTS `view_invoice` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_invoice`(
    _order_id INT
)
BEGIN
    SELECT *,
    (antal * pris) AS sum_row,
    (SELECT SUM(pris * antal) FROM v_faktura WHERE order_id = _order_id) AS total
    FROM v_faktura
    WHERE order_id = _order_id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_log` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_log`()
BEGIN
	SELECT * FROM v_logg;
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
    WHERE event
    LIKE CONCAT('%', _filter, '%')
    OR datum_tid
    LIKE CONCAT('%', _filter, '%');
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_order` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_order`(_id INT)
BEGIN
    SELECT *,
    (produkt_pris * kvantitet) AS sum_rad,
    (SELECT SUM(produkt_pris * kvantitet) FROM v_order_details WHERE id = _id) AS total
    FROM v_order_details WHERE id = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `view_plocklista` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`user`@`%` PROCEDURE `view_plocklista`(_id INT)
BEGIN
    SELECT
    ProduktID,
    Antal,
    Hylla,
    Lagersaldo,
    (Lagersaldo - Antal) AS Diff,
    IF(Lagersaldo > 0, IF(Lagersaldo - Antal < 0, 'Räcker inte', 'Finns i lager'), 'Slut i lager') AS Lagerstatus
    FROM v_plocklista
    WHERE OrderID = _id;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Current Database: `eshop`
--

USE `eshop`;

--
-- Final view structure for view `v_faktura`
--

/*!50001 DROP VIEW IF EXISTS `v_faktura`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_faktura` AS select `spec`.`faktura_id` AS `faktura_id`,`faktura`.`status` AS `status`,date_format(`faktura`.`paid`,'%Y-%m-%d') AS `paid`,date_format(`faktura`.`sent`,'%Y-%m-%d -> %H:%i:%s') AS `sent`,`faktura`.`order_id` AS `order_id`,`faktura`.`kund_id` AS `kund_id`,concat(`kund`.`fornamn`,' ',`kund`.`efternamn`) AS `kund_namn`,`kund`.`adress` AS `adress`,`kund`.`postnummer` AS `postnummer`,`kund`.`ort` AS `ort`,`kund`.`land` AS `land`,`kund`.`telefon` AS `telefon`,`spec`.`produkt_namn` AS `produkt_namn`,`spec`.`antal` AS `antal`,`spec`.`pris` AS `pris`,(select count(`spec`.`produkt_namn`) from `spec` where (`spec`.`faktura_id` = `faktura`.`id`)) AS `order_rader` from ((`spec` left join `faktura` on((`spec`.`faktura_id` = `faktura`.`id`))) join `kund` on((`kund`.`id` = `faktura`.`kund_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `v_logg` AS select `logg`.`id` AS `id`,date_format(`logg`.`tid`,'%Y-%m-%d -> %H:%i:%s') AS `datum_tid`,`logg`.`handelse` AS `event` from `logg` order by `logg`.`tid` desc limit 20 */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_order_details`
--

/*!50001 DROP VIEW IF EXISTS `v_order_details`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_order_details` AS select `orders`.`id` AS `id`,date_format(`orders`.`order_created`,'%Y-%m-%d -> %H:%i:%s') AS `created`,`orders`.`kund_id` AS `kund_id`,concat(`kund`.`fornamn`,' ',`kund`.`efternamn`) AS `kund_namn`,`produkt`.`namn` AS `produkt_namn`,`produkt`.`pris` AS `produkt_pris`,`order2produkt`.`kvantitet` AS `kvantitet`,date_format(`orders`.`order_updated`,'%Y-%m-%d -> %H:%i:%s') AS `updated`,date_format(`orders`.`order_sent`,'%Y-%m-%d -> %H:%i:%s') AS `sent`,(select count(`order2produkt`.`kvantitet`) from `order2produkt` where (`orders`.`id` = `order2produkt`.`order_id`)) AS `order_rader`,`orders`.`order_status` AS `order_status` from (((`orders` left join `order2produkt` on((`order2produkt`.`order_id` = `orders`.`id`))) join `kund` on((`orders`.`kund_id` = `kund`.`id`))) left join `produkt` on((`order2produkt`.`produkt_id` = `produkt`.`id`))) order by `orders`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_orders`
--

/*!50001 DROP VIEW IF EXISTS `v_orders`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_orders` AS select `orders`.`id` AS `id`,date_format(`orders`.`order_created`,'%Y-%m-%d -> %H:%i:%s') AS `created`,`orders`.`kund_id` AS `kund_id`,concat(`kund`.`fornamn`,' ',`kund`.`efternamn`) AS `kund_namn`,(select count(`order2produkt`.`kvantitet`) from `order2produkt` where (`orders`.`id` = `order2produkt`.`order_id`)) AS `order_rader`,`orders`.`order_status` AS `order_status`,date_format(`orders`.`order_updated`,'%Y-%m-%d -> %H:%i:%s') AS `updated`,date_format(`orders`.`order_placed`,'%Y-%m-%d -> %H:%i:%s') AS `placed`,date_format(`orders`.`order_sent`,'%Y-%m-%d -> %H:%i:%s') AS `sent`,date_format(`orders`.`order_deleted`,'%Y-%m-%d -> %H:%i:%s') AS `deleted` from ((`orders` left join `order2produkt` on((`order2produkt`.`order_id` = `orders`.`id`))) join `kund` on((`orders`.`kund_id` = `kund`.`id`))) group by `orders`.`id` order by `orders`.`id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `v_plocklista`
--

/*!50001 DROP VIEW IF EXISTS `v_plocklista`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`user`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `v_plocklista` AS select `order2produkt`.`order_id` AS `OrderID`,`order2produkt`.`produkt_id` AS `ProduktID`,`order2produkt`.`kvantitet` AS `Antal`,group_concat(distinct `produkt2lager`.`hylla_id`,'(',`produkt2lager`.`antal`,')' separator ', ') AS `Hylla`,(select sum(`produkt2lager`.`antal`) from `produkt2lager` where (`produkt2lager`.`produkt_id_lag` = `order2produkt`.`produkt_id`) group by `produkt2lager`.`produkt_id_lag`) AS `Lagersaldo` from (`order2produkt` left join `produkt2lager` on((`produkt2lager`.`produkt_id_lag` = `order2produkt`.`produkt_id`))) group by `order2produkt`.`order_id`,`order2produkt`.`kvantitet`,`order2produkt`.`produkt_id` order by `order2produkt`.`order_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

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
/*!50001 VIEW `v_produkt` AS select `produkt`.`id` AS `id`,`produkt`.`namn` AS `namn`,`produkt`.`pris` AS `pris`,`produkt`.`bild_lank` AS `bild_lank`,`produkt`.`beskrivning` AS `beskrivning`,group_concat(distinct `produkt2kategori`.`kategori` separator ',') AS `Kategorier`,group_concat(distinct `produkt2lager`.`hylla_id`,'(',`produkt2lager`.`antal`,')' separator ', ') AS `Hylla`,(select sum(`produkt2lager`.`antal`) from `produkt2lager` where (`produkt2lager`.`produkt_id_lag` = `produkt`.`id`) group by `produkt2lager`.`produkt_id_lag`) AS `Lagersaldo` from ((`produkt` left join `produkt2lager` on((`produkt`.`id` = `produkt2lager`.`produkt_id_lag`))) left join `produkt2kategori` on((`produkt`.`id` = `produkt2kategori`.`produkt_id_kat`))) group by `produkt`.`id` */;
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

-- Dump completed on 2019-03-29 10:19:18
