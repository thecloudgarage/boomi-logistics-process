-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: mysqldb
-- Generation Time: Apr 18, 2021 at 05:48 AM
-- Server version: 5.7.33
-- PHP Version: 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `customer_inventories`
--

-- --------------------------------------------------------

--
-- Table structure for table `contactperson`
--

CREATE TABLE `contactperson` (
  `contactpersonempid` int(11) NOT NULL,
  `contactpersonncity` text NOT NULL,
  `contactpersonfirstname` text,
  `contactpersonlastname` text,
  `contactpersonemail` text,
  `contactpersonphone` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `customer_details`
--

CREATE TABLE `customer_details` (
  `customerId` text,
  `customerName` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `customerAddress` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `customerCity` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `customerState` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `customerPinCode` int(11) NOT NULL,
  `customerCountry` varchar(500) CHARACTER SET utf8mb4 NOT NULL,
  `customerContactEmailAddress` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `customerContactPhoneNumber` varchar(50) CHARACTER SET utf8mb4 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicleallocation`
--

CREATE TABLE `vehicleallocation` (
  `vehicleregistrationnumber` text,
  `customerIdallocated` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `vehicleregistration`
--

CREATE TABLE `vehicleregistration` (
  `vehicleregistrationnumber` text,
  `state` text,
  `city` text,
  `pincode` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `contactperson`
--
ALTER TABLE `contactperson`
  ADD PRIMARY KEY (`contactpersonempid`),
  ADD UNIQUE KEY `contactpersoncity` (`contactpersonncity`(100));

--
-- Indexes for table `vehicleregistration`
--
ALTER TABLE `vehicleregistration`
  ADD KEY `pincode` (`pincode`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
