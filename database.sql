CREATE DATABASE  IF NOT EXISTS `fys_project` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `fys_project`;
-- MySQL dump 10.13  Distrib 5.7.12, for osx10.9 (x86_64)
--
-- Host: localhost    Database: fys_project
-- ------------------------------------------------------
-- Server version	5.5.42

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `gebruikers`
--

DROP TABLE IF EXISTS `gebruikers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gebruikers` (
  `userid` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) DEFAULT NULL,
  `tussenvoegsel` varchar(45) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `straatnaam` varchar(45) DEFAULT NULL,
  `huisnummer` int(11) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `woonplaats` varchar(45) DEFAULT NULL,
  `land` varchar(45) DEFAULT NULL,
  `telefoonnummer` varchar(45) DEFAULT NULL,
  `mobielenummer` varchar(45) DEFAULT NULL,
  `werkvliegveld` varchar(45) DEFAULT NULL,
  `emailadres` varchar(45) DEFAULT NULL,
  `wachtwoord` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`),
  KEY `userid_idx` (`userid`,`telefoonnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gebruikers`
--

LOCK TABLES `gebruikers` WRITE;
/*!40000 ALTER TABLE `gebruikers` DISABLE KEYS */;
INSERT INTO `gebruikers` VALUES (1,'Lars',NULL,'Kort',NULL,3,NULL,NULL,NULL,NULL,NULL,'1',NULL,NULL);
/*!40000 ALTER TABLE `gebruikers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gevondenBagage`
--

DROP TABLE IF EXISTS `gevondenBagage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gevondenBagage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registratienummer` int(11) NOT NULL,
  `datumgevonden` date DEFAULT NULL,
  `datumaangemeld` date DEFAULT NULL,
  `vliegveldherkomst` int(11) DEFAULT NULL,
  `vliegveldbestemming` int(11) DEFAULT NULL,
  `vliegveldgevonden` int(11) DEFAULT NULL,
  `vluchtnummer` varchar(45) DEFAULT NULL,
  `vluchtdatum` date DEFAULT NULL,
  `gewicht` decimal(2,0) DEFAULT NULL,
  `kleur` varchar(45) DEFAULT NULL,
  `merk` varchar(45) DEFAULT NULL,
  `speciale opmerkingen` varchar(250) DEFAULT NULL,
  `persoonsnummer` int(11) DEFAULT NULL,
  `userid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registratienummer_UNIQUE` (`registratienummer`),
  KEY `persoonnummer_idx` (`persoonsnummer`),
  KEY `userid_idx` (`userid`),
  KEY `vher_idx` (`vliegveldherkomst`),
  KEY `vbes` (`vliegveldbestemming`),
  KEY `vgev` (`vliegveldgevonden`),
  CONSTRAINT `persoonnummer` FOREIGN KEY (`persoonsnummer`) REFERENCES `persoonsGegevens` (`persoonsnummer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid` FOREIGN KEY (`userid`) REFERENCES `gebruikers` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vbes` FOREIGN KEY (`vliegveldbestemming`) REFERENCES `vliegvelden` (`vliegveld_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vgev` FOREIGN KEY (`vliegveldgevonden`) REFERENCES `vliegvelden` (`vliegveld_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vher` FOREIGN KEY (`vliegveldherkomst`) REFERENCES `vliegvelden` (`vliegveld_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gevondenBagage`
--

LOCK TABLES `gevondenBagage` WRITE;
/*!40000 ALTER TABLE `gevondenBagage` DISABLE KEYS */;
INSERT INTO `gevondenBagage` VALUES (1,11,'2016-01-01','2017-02-02',143,144,145,'dfsdf','2018-03-03',99,'rood','ananas',NULL,1,1);
/*!40000 ALTER TABLE `gevondenBagage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `koppeltabel`
--

DROP TABLE IF EXISTS `koppeltabel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `koppeltabel` (
  `koppeld_id` int(11) NOT NULL AUTO_INCREMENT,
  `gevonden_id` int(11) DEFAULT NULL,
  `verloren_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`koppeld_id`),
  KEY `verloren_id_idx` (`verloren_id`),
  KEY `gevonden_id_idx` (`gevonden_id`),
  CONSTRAINT `gevonden_id` FOREIGN KEY (`gevonden_id`) REFERENCES `gevondenBagage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `verloren_id` FOREIGN KEY (`verloren_id`) REFERENCES `verlorenBagage` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `koppeltabel`
--

LOCK TABLES `koppeltabel` WRITE;
/*!40000 ALTER TABLE `koppeltabel` DISABLE KEYS */;
/*!40000 ALTER TABLE `koppeltabel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persoonsGegevens`
--

DROP TABLE IF EXISTS `persoonsGegevens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `persoonsGegevens` (
  `persoonsnummer` int(11) NOT NULL AUTO_INCREMENT,
  `voornaam` varchar(45) DEFAULT NULL,
  `tussenvoegsel` varchar(45) DEFAULT NULL,
  `achternaam` varchar(45) DEFAULT NULL,
  `straatnaam` varchar(45) DEFAULT NULL,
  `huisnummer` int(11) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `woonplaats` varchar(45) DEFAULT NULL,
  `land` varchar(45) DEFAULT NULL,
  `telefoonnummer` varchar(45) DEFAULT NULL,
  `mobielenummer` varchar(45) DEFAULT NULL,
  `emailadres` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`persoonsnummer`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persoonsGegevens`
--

LOCK TABLES `persoonsGegevens` WRITE;
/*!40000 ALTER TABLE `persoonsGegevens` DISABLE KEYS */;
INSERT INTO `persoonsGegevens` VALUES (1,'Lars',NULL,'Kort',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `persoonsGegevens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `verlorenBagage`
--

DROP TABLE IF EXISTS `verlorenBagage`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `verlorenBagage` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `registratienummer` int(11) NOT NULL,
  `datumverloren` date DEFAULT NULL,
  `datumaangemeld` date DEFAULT NULL,
  `vliegveldherkomst` int(11) DEFAULT NULL,
  `vliegveldbestemming` int(11) DEFAULT NULL,
  `vliegveldgevonden` int(11) DEFAULT NULL,
  `vluchtnummer` varchar(45) DEFAULT NULL,
  `vluchtdatum` date DEFAULT NULL,
  `gewicht` decimal(2,0) DEFAULT NULL,
  `kleur` varchar(45) DEFAULT NULL,
  `merk` varchar(45) DEFAULT NULL,
  `speciale opmerkingen` varchar(250) DEFAULT NULL,
  `persoonsnummer` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `registratienummer_UNIQUE` (`registratienummer`),
  KEY `userid_idx` (`userid`),
  KEY `persoonnummer2_idx` (`persoonsnummer`),
  KEY `vher2_idx` (`vliegveldherkomst`),
  KEY `vbes2_idx` (`vliegveldbestemming`),
  KEY `vgev2_idx` (`vliegveldgevonden`),
  CONSTRAINT `persoonnummer2` FOREIGN KEY (`persoonsnummer`) REFERENCES `persoonsGegevens` (`persoonsnummer`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `userid2` FOREIGN KEY (`userid`) REFERENCES `gebruikers` (`userid`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vbes2` FOREIGN KEY (`vliegveldbestemming`) REFERENCES `vliegvelden` (`vliegveld_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vgev2` FOREIGN KEY (`vliegveldgevonden`) REFERENCES `vliegvelden` (`vliegveld_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `vher2` FOREIGN KEY (`vliegveldherkomst`) REFERENCES `vliegvelden` (`vliegveld_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `verlorenBagage`
--

LOCK TABLES `verlorenBagage` WRITE;
/*!40000 ALTER TABLE `verlorenBagage` DISABLE KEYS */;
/*!40000 ALTER TABLE `verlorenBagage` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vliegvelden`
--

DROP TABLE IF EXISTS `vliegvelden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vliegvelden` (
  `vliegveld_id` int(11) NOT NULL AUTO_INCREMENT,
  `vliegveldnaam` varchar(45) DEFAULT NULL,
  `afkorting` varchar(45) DEFAULT NULL,
  `land` varchar(45) DEFAULT NULL,
  `straat` varchar(45) DEFAULT NULL,
  `huisnummer` varchar(45) DEFAULT NULL,
  `postcode` varchar(45) DEFAULT NULL,
  `telefoonnummer` varchar(45) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`vliegveld_id`),
  UNIQUE KEY `vliegveld_id_UNIQUE` (`vliegveld_id`)
) ENGINE=InnoDB AUTO_INCREMENT=154 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vliegvelden`
--

LOCK TABLES `vliegvelden` WRITE;
/*!40000 ALTER TABLE `vliegvelden` DISABLE KEYS */;
INSERT INTO `vliegvelden` VALUES (116,'Bourgas','BOJ','Bulgarije',NULL,NULL,NULL,NULL,NULL,NULL),(117,'Al Hoceima','AHU','Marokko',NULL,NULL,NULL,NULL,NULL,NULL),(118,'Alanya-Gazipasa','GZP','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(119,'Amsterdam','AMS','Nederland',NULL,NULL,NULL,NULL,NULL,NULL),(120,'Ankara Esenboga','ESB','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(121,'Antalya','AYT','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(122,'Banjul','BJL','Gambia',NULL,NULL,NULL,NULL,NULL,NULL),(123,'Bodrum','BJV','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(124,'Catania','CTA','Italie',NULL,NULL,NULL,NULL,NULL,NULL),(125,'Corfu','CFU','Griekenland',NULL,NULL,NULL,NULL,NULL,NULL),(126,'Dalaman','DLM','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(127,'Dubai','DXB','Ver. Arabische Emiraten',NULL,NULL,NULL,NULL,NULL,NULL),(128,'Eindhoven','EIN','Nederland',NULL,NULL,NULL,NULL,NULL,NULL),(129,'Faro','FAO','Portugal',NULL,NULL,NULL,NULL,NULL,NULL),(130,'Fez','FEZ','Marokko',NULL,NULL,NULL,NULL,NULL,NULL),(131,'Fuerteventura','FUE','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(132,'Funchal-Madeira','FNC','Portugal',NULL,NULL,NULL,NULL,NULL,NULL),(133,'Girona','GRO','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(134,'Gran Canaria','LPA','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(135,'Heraklion','HER','Griekenland',NULL,NULL,NULL,NULL,NULL,NULL),(136,'Hurghada','HRG','Egypte',NULL,NULL,NULL,NULL,NULL,NULL),(137,'Ibiza','IBZ','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(138,'Izmir','ADB','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(139,'Kayseri','ASR','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(140,'Konya','KYA','Turkije',NULL,NULL,NULL,NULL,NULL,NULL),(141,'Kos','KGS','Griekenland',NULL,NULL,NULL,NULL,NULL,NULL),(142,'Lanzarote','ACE','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(143,'Malaga','AGP','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(144,'Marrakech','RAK','Marokko',NULL,NULL,NULL,NULL,NULL,NULL),(145,'Mytilini (Lesbos)','MJT','Griekenland',NULL,NULL,NULL,NULL,NULL,NULL),(146,'Nador','NDR','Marokko',NULL,NULL,NULL,NULL,NULL,NULL),(147,'Nicosia(Ercan)','NIC','Cyprus',NULL,NULL,NULL,NULL,NULL,NULL),(148,'Ohrid','OHD','Macedonie',NULL,NULL,NULL,NULL,NULL,NULL),(149,'Palma de Mallorca','PMI','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(150,'Rhodos','RHO','Griekenland',NULL,NULL,NULL,NULL,NULL,NULL),(151,'Tanger','TNG','Marokko',NULL,NULL,NULL,NULL,NULL,NULL),(152,'Tenerife','TFS','Spanje',NULL,NULL,NULL,NULL,NULL,NULL),(153,'Zakynthos','ZTH','Griekenland',NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `vliegvelden` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-12-05 20:48:11
