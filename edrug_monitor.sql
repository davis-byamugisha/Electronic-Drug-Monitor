-- phpMyAdmin SQL Dump
-- version 4.0.4
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Apr 25, 2017 at 11:37 AM
-- Server version: 5.6.12-log
-- PHP Version: 5.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `edrug_monitor`
--
CREATE DATABASE IF NOT EXISTS `edrug_monitor` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `edrug_monitor`;

-- --------------------------------------------------------

--
-- Table structure for table `centers`
--

CREATE TABLE IF NOT EXISTS `centers` (
  `Center_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Center_Name` varchar(255) NOT NULL,
  `Type_Id` int(11) NOT NULL,
  PRIMARY KEY (`Center_Id`),
  KEY `fk_centers_center_types1_idx` (`Type_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `centers`
--

INSERT INTO `centers` (`Center_Id`, `Center_Name`, `Type_Id`) VALUES
(1, 'Mbarara Regional Referral', 1),
(2, 'Health Center', 2),
(3, 'District Drug Authority', 3),
(4, 'National Drug Authority', 4),
(5, 'Wakiso District', 3),
(6, 'Kinoni Hospital', 1),
(7, 'Ntungamo district drug authority', 3),
(8, 'Rukungiri District', 3);

-- --------------------------------------------------------

--
-- Table structure for table `center_types`
--

CREATE TABLE IF NOT EXISTS `center_types` (
  `Type_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Type_Name` varchar(100) NOT NULL,
  PRIMARY KEY (`Type_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `center_types`
--

INSERT INTO `center_types` (`Type_Id`, `Type_Name`) VALUES
(1, 'Hospitals'),
(2, 'Health Centers'),
(3, 'District'),
(4, 'National');

-- --------------------------------------------------------

--
-- Table structure for table `dispensing`
--

CREATE TABLE IF NOT EXISTS `dispensing` (
  `Dispensing_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Center_Id` int(11) NOT NULL,
  `Drug_Id` int(11) NOT NULL,
  `Quantity_Dispensed` int(11) NOT NULL,
  `Stock_After` int(11) NOT NULL,
  `Date_Dispensed` date NOT NULL,
  `Created_At` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Dispensing_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `dispensing`
--

INSERT INTO `dispensing` (`Dispensing_Id`, `Center_Id`, `Drug_Id`, `Quantity_Dispensed`, `Stock_After`, `Date_Dispensed`, `Created_At`) VALUES
(1, 1, 4, 65, 235, '0000-00-00', '2017-04-24 13:40:00'),
(2, 1, 2, 77, 233, '0000-00-00', '2017-04-24 13:40:00'),
(3, 1, 1, 88, 52, '0000-00-00', '2017-04-24 13:40:00'),
(4, 1, 4, 4, 296, '2017-04-24', '2017-04-24 13:41:45'),
(5, 1, 2, 45, 265, '2017-04-24', '2017-04-24 13:41:45'),
(6, 1, 1, 45, 95, '2017-04-24', '2017-04-24 13:41:45');

-- --------------------------------------------------------

--
-- Table structure for table `drugs`
--

CREATE TABLE IF NOT EXISTS `drugs` (
  `Drug_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Name` varchar(45) NOT NULL,
  `Code` varchar(45) NOT NULL,
  `Reorder` int(11) NOT NULL,
  PRIMARY KEY (`Drug_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=38 ;

--
-- Dumping data for table `drugs`
--

INSERT INTO `drugs` (`Drug_Id`, `Drug_Name`, `Code`, `Reorder`) VALUES
(1, 'Paracetamol', 'P', 50),
(2, 'Amoxyciline', 'AM', 350),
(4, 'Albendazole', 'AL', 0),
(35, 'Tetracycline', 'TT', 0),
(36, 'Diclofenac', 'DC', 0),
(37, 'Metro Tabs', 'MT', 10);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `Id` int(11) NOT NULL AUTO_INCREMENT,
  `Drug_Id` int(11) NOT NULL,
  `Sent_By` int(11) NOT NULL,
  `Sent_To` int(11) NOT NULL,
  `Quantity` int(11) NOT NULL,
  `Current_Stock` int(11) NOT NULL,
  `User_Id` int(11) NOT NULL,
  `Date_Ordered` date NOT NULL,
  `Received` tinyint(1) NOT NULL DEFAULT '0',
  `Created_At` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`),
  KEY `fk_drug_movements_drugs_idx` (`Drug_Id`),
  KEY `fk_drug_movements_centers1_idx` (`Sent_By`),
  KEY `fk_drug_movements_centers2_idx` (`Sent_To`),
  KEY `fk_drug_movements_users1_idx` (`User_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=16 ;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`Id`, `Drug_Id`, `Sent_By`, `Sent_To`, `Quantity`, `Current_Stock`, `User_Id`, `Date_Ordered`, `Received`, `Created_At`) VALUES
(1, 35, 3, 4, 96, 100, 3, '2017-04-19', 1, '2017-04-19 20:37:24'),
(2, 36, 3, 4, 86, 176, 3, '2017-04-19', 1, '2017-04-19 20:37:24'),
(3, 1, 1, 4, 41, 41, 1, '2017-04-19', 1, '2017-04-19 20:38:15'),
(4, 2, 1, 4, 42, 9, 1, '2017-04-19', 1, '2017-04-19 20:38:15'),
(5, 4, 3, 4, 56, 56, 3, '2017-04-20', 1, '2017-04-20 14:53:01'),
(6, 35, 3, 4, 50, 500, 3, '2017-04-20', 1, '2017-04-20 14:53:01'),
(7, 1, 1, 4, 100, 100, 1, '2017-04-20', 1, '2017-04-20 14:54:43'),
(8, 2, 1, 4, 200, 200, 1, '2017-04-20', 1, '2017-04-20 14:54:43'),
(9, 2, 1, 4, 60, 260, 1, '2017-04-20', 1, '2017-04-20 15:01:24'),
(10, 2, 1, 4, 30, 290, 1, '2017-04-20', 1, '2017-04-20 15:14:54'),
(11, 2, 1, 4, 20, 310, 1, '2017-04-20', 1, '2017-04-20 15:24:59'),
(12, 1, 1, 4, 40, 140, 1, '2017-04-23', 1, '2017-04-23 17:19:51'),
(13, 4, 1, 4, 300, 300, 1, '2017-04-23', 1, '2017-04-23 17:19:52'),
(14, 4, 6, 4, 33, 33, 19, '2017-04-25', 1, '2017-04-25 11:20:24'),
(15, 35, 6, 4, 33, 33, 19, '2017-04-25', 1, '2017-04-25 11:20:24');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE IF NOT EXISTS `users` (
  `User_Id` int(11) NOT NULL AUTO_INCREMENT,
  `Full_Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Phone` varchar(45) NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `Center_Id` int(11) NOT NULL,
  PRIMARY KEY (`User_Id`),
  KEY `fk_users_centers1_idx` (`Center_Id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=20 ;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`User_Id`, `Full_Name`, `Email`, `Phone`, `Username`, `Password`, `Center_Id`) VALUES
(1, 'System Administrator', 'admin@gmail.com', '0707409214', 'admin', 'admin', 0),
(2, 'Health Center Person', 'healthcenter@gmail.com', '07092138493', 'hc', 'hc', 2),
(3, 'District person', 'district@gmail.com', '0707409214', 'dda', 'dda', 3),
(4, 'National DA Person', 'nda@gmail.com', '07092138493', 'nda', 'nda', 4),
(9, 'Test Hospital User', 'multiplestreamsinternationa@gmail.com', '0704141801', 'testh', 'testh', 1),
(10, 'Test HC User', 'multiplestreamsinternationa@gmail.com', '0704141801', 'testhc', 'testhc', 2),
(12, 'Test dda persona ', 'dda@gmail.com', '0788545805', 'testdda', 'testdda', 3),
(13, 'sd', 'dfdf', 'fd', 'df', 'df', 4),
(14, 'Alexis Steel Rachel', 'admin', '6176430602', 'sysadmin', 'sysadmin', 1),
(15, 'Amon Mugizi', 'wakiso@gmail.com', '0707409214', 'amon', 'amon', 5),
(16, 'Alexis Steel Rachel', 'afsdfgds', '6176430602', 'Alexis', 'dsfds', 1),
(17, 'Alexis Steel Rachel', 'davisb256@gmail.com', '256771897631', 'Alexis', 'sdfdsf', 1),
(18, 'Bena', 'hhjjj@gmail.com', '0775627989', 'Davis ', 'davis', 3),
(19, 'Sample User', 'multiplestreamsinternationa@gmail.com', '0704141801', 'kinoni', 'kinoni', 6);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
