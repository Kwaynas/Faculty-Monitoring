-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: trodes
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `currdate` date DEFAULT current_timestamp(),
  `cardid` varchar(8) DEFAULT NULL,
  `login` varchar(11) DEFAULT NULL,
  `logout` varchar(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `attendance_ibfk_1` (`cardid`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`cardid`) REFERENCES `faculty` (`uid`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=156 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `faculty`
--

DROP TABLE IF EXISTS `faculty`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `faculty` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` varchar(8) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `Cindex` (`uid`),
  KEY `FIndex` (`fullname`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `sched`
--

DROP TABLE IF EXISTS `sched`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sched` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) DEFAULT NULL,
  `datesch` varchar(20) NOT NULL,
  `startsch` varchar(10) NOT NULL,
  `endsch` varchar(10) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `faculty` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `SCHIndex` (`datesch`,`startsch`,`endsch`),
  KEY `Findex` (`faculty`) USING BTREE,
  CONSTRAINT `sched_ibfk_1` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`fullname`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `studreq`
--

DROP TABLE IF EXISTS `studreq`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `studreq` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `datestamp` date NOT NULL DEFAULT current_timestamp(),
  `timestamp` time NOT NULL DEFAULT current_timestamp(),
  `fac` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `stud_name` varchar(255) DEFAULT NULL,
  `stud_num` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `room` varchar(255) DEFAULT 'TBA',
  `prop_date` varchar(255) DEFAULT NULL,
  `prop_time_start` varchar(255) NOT NULL,
  `prop_time_end` varchar(255) NOT NULL,
  `fin_date` varchar(255) DEFAULT 'TBA',
  `fin_time_start` varchar(255) NOT NULL DEFAULT 'TBA',
  `fin_time_end` varchar(255) NOT NULL DEFAULT ' ',
  `message` text NOT NULL,
  `isdone` tinyint(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `isdone` (`isdone`) USING BTREE,
  KEY `Findex` (`fac`) USING BTREE,
  CONSTRAINT `studreq_ibfk_1` FOREIGN KEY (`fac`) REFERENCES `faculty` (`fullname`) ON DELETE SET NULL ON UPDATE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=111 DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-17 17:58:17
