-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 18, 2022 at 08:18 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `trodes`
--

-- --------------------------------------------------------

--
-- Table structure for table `attendance`
--

CREATE TABLE `attendance` (
  `id` int(11) NOT NULL,
  `currdate` date DEFAULT current_timestamp(),
  `cardid` varchar(8) DEFAULT NULL,
  `login` varchar(11) DEFAULT NULL,
  `logout` varchar(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `faculty`
--

CREATE TABLE `faculty` (
  `id` int(11) NOT NULL,
  `uid` varchar(255) DEFAULT NULL,
  `fullname` varchar(255) NOT NULL,
  `fname` varchar(255) NOT NULL,
  `mname` varchar(255) NOT NULL,
  `lname` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `sched`
--

CREATE TABLE `sched` (
  `id` int(11) NOT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `datesch` varchar(20) NOT NULL,
  `startsch` varchar(10) NOT NULL,
  `endsch` varchar(10) NOT NULL,
  `room` varchar(255) DEFAULT NULL,
  `faculty` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `studreq`
--

CREATE TABLE `studreq` (
  `id` int(11) NOT NULL,
  `datestamp` date NOT NULL DEFAULT current_timestamp(),
  `timestamp` time NOT NULL DEFAULT current_timestamp(),
  `fac` varchar(255) DEFAULT NULL,
  `purpose` varchar(255) DEFAULT NULL,
  `stud_name` varchar(255) DEFAULT NULL,
  `stud_num` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `subjectsection` varchar(255) NOT NULL,
  `room` varchar(255) DEFAULT 'TBA',
  `prop_date` varchar(255) DEFAULT NULL,
  `prop_time_start` varchar(255) NOT NULL,
  `prop_time_end` varchar(255) NOT NULL,
  `fin_date` varchar(255) DEFAULT 'TBA',
  `fin_time_start` varchar(255) NOT NULL DEFAULT 'TBA',
  `fin_time_end` varchar(255) NOT NULL DEFAULT ' ',
  `stdmessage` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `isdone` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `attendance`
--
ALTER TABLE `attendance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `attendance_ibfk_1` (`cardid`);

--
-- Indexes for table `faculty`
--
ALTER TABLE `faculty`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Cindex` (`uid`),
  ADD KEY `FIndex` (`fullname`) USING BTREE;

--
-- Indexes for table `sched`
--
ALTER TABLE `sched`
  ADD PRIMARY KEY (`id`),
  ADD KEY `SCHIndex` (`datesch`,`startsch`,`endsch`),
  ADD KEY `Findex` (`faculty`) USING BTREE;

--
-- Indexes for table `studreq`
--
ALTER TABLE `studreq`
  ADD PRIMARY KEY (`id`),
  ADD KEY `isdone` (`isdone`) USING BTREE,
  ADD KEY `Findex` (`fac`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `attendance`
--
ALTER TABLE `attendance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `faculty`
--
ALTER TABLE `faculty`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sched`
--
ALTER TABLE `sched`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `studreq`
--
ALTER TABLE `studreq`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `attendance`
--
ALTER TABLE `attendance`
  ADD CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`cardid`) REFERENCES `faculty` (`uid`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `sched`
--
ALTER TABLE `sched`
  ADD CONSTRAINT `sched_ibfk_1` FOREIGN KEY (`faculty`) REFERENCES `faculty` (`fullname`) ON DELETE SET NULL ON UPDATE SET NULL;

--
-- Constraints for table `studreq`
--
ALTER TABLE `studreq`
  ADD CONSTRAINT `studreq_ibfk_1` FOREIGN KEY (`fac`) REFERENCES `faculty` (`fullname`) ON DELETE SET NULL ON UPDATE SET NULL;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
