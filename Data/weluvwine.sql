-- MySQL dump 10.13  Distrib 5.7.25, for Win32 (AMD64)
--
-- Host: localhost    Database: weluvwine
-- ------------------------------------------------------
-- Server version	5.7.25

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
-- Current Database: `weluvwine`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `weluvwine` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `weluvwine`;

--
-- Table structure for table `tasting_session`
--

DROP TABLE IF EXISTS `tasting_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting_session` (
  `TastingSessionId` int(11) NOT NULL,
  `SessionDate` datetime NOT NULL,
  `SessionKey` binary(16) NOT NULL,
  PRIMARY KEY (`TastingSessionId`),
  UNIQUE KEY `SessionKey_UNIQUE` (`SessionKey`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting_session`
--

LOCK TABLES `tasting_session` WRITE;
/*!40000 ALTER TABLE `tasting_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasting_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting_session_user`
--

DROP TABLE IF EXISTS `tasting_session_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting_session_user` (
  `TastingSessionId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `AttendedToSession` bit(1) NOT NULL,
  KEY `TastingSessionUser_User_idx` (`UserId`),
  KEY `TastingSessionUser_TastingSession_idx` (`TastingSessionId`),
  CONSTRAINT `TastingSessionUser_TastingSession` FOREIGN KEY (`TastingSessionId`) REFERENCES `tasting_session` (`TastingSessionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TastingSessionUser_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting_session_user`
--

LOCK TABLES `tasting_session_user` WRITE;
/*!40000 ALTER TABLE `tasting_session_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasting_session_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting_session_user_rate`
--

DROP TABLE IF EXISTS `tasting_session_user_rate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting_session_user_rate` (
  `TastingSessionId` int(11) NOT NULL,
  `WineId` int(11) NOT NULL,
  `UserId` int(11) NOT NULL,
  `AromaFlavorsStructure` decimal(10,0) unsigned zerofill NOT NULL,
  `FoodFriendliness` decimal(10,0) unsigned zerofill NOT NULL,
  `Value` decimal(10,0) unsigned zerofill NOT NULL,
  `Notes` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`TastingSessionId`),
  KEY `TastingSessionUserRate_User_idx` (`UserId`),
  KEY `TastingSessionUserRate_Wine_idx` (`WineId`),
  CONSTRAINT `TastingSessionUserRate_TastingSession` FOREIGN KEY (`TastingSessionId`) REFERENCES `tasting_session` (`TastingSessionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TastingSessionUserRate_User` FOREIGN KEY (`UserId`) REFERENCES `user` (`UserId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TastingSessionUserRate_Wine` FOREIGN KEY (`WineId`) REFERENCES `wine` (`WineId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting_session_user_rate`
--

LOCK TABLES `tasting_session_user_rate` WRITE;
/*!40000 ALTER TABLE `tasting_session_user_rate` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasting_session_user_rate` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasting_session_wine`
--

DROP TABLE IF EXISTS `tasting_session_wine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tasting_session_wine` (
  `TastingSessionId` int(11) NOT NULL,
  `WineId` int(11) NOT NULL,
  PRIMARY KEY (`TastingSessionId`,`WineId`),
  KEY `TastingSessionWine_Wine_idx` (`WineId`),
  CONSTRAINT `TastingSessionWine_TastingSession` FOREIGN KEY (`TastingSessionId`) REFERENCES `tasting_session` (`TastingSessionId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `TastingSessionWine_Wine` FOREIGN KEY (`WineId`) REFERENCES `wine` (`WineId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasting_session_wine`
--

LOCK TABLES `tasting_session_wine` WRITE;
/*!40000 ALTER TABLE `tasting_session_wine` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasting_session_wine` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `UserId` int(11) NOT NULL,
  `UserCode` varchar(30) NOT NULL,
  `Email` varchar(80) NOT NULL,
  PRIMARY KEY (`UserId`),
  UNIQUE KEY `UserCode_UNIQUE` (`UserCode`),
  UNIQUE KEY `Email_UNIQUE` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wine`
--

DROP TABLE IF EXISTS `wine`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `wine` (
  `WineId` INT(11) NOT NULL AUTO_INCREMENT,
  `ProductName` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `Region` varchar(50) NOT NULL,
  `GrapeVarities` varchar(50) NOT NULL,
  `Producer` varchar(50) NOT NULL,
  `ABV` decimal(10,0) NOT NULL,
  `Description` varchar(200) NOT NULL,
  PRIMARY KEY (`WineId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wine`
--

LOCK TABLES `wine` WRITE;
/*!40000 ALTER TABLE `wine` DISABLE KEYS */;
/*!40000 ALTER TABLE `wine` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2019-02-25  9:03:12
