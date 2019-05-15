-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 15, 2019 at 04:00 PM
-- Server version: 10.1.38-MariaDB
-- PHP Version: 7.3.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bankwebapp`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `Accno` char(5) NOT NULL,
  `Name` char(20) NOT NULL,
  `Address` char(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`Accno`, `Name`, `Address`) VALUES
('CX001', 'Admin', 'Admin'),
('CX002', 'Peter Smith', '123 London High Street Camden'),
('SF001', 'Jane Doe', '123 London Low Street Westminster XYZ'),
('CM003', 'Dexter Howard', '257 London Middle Street Tower Hill XYZ'),
('SM002', 'Daniel Lake', 'Somewhere in Epping EEZ'),
('SM003', 'Fabian Lewis', 'London West London xxx'),
('CM004', 'Steve', 'Rogers');

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `Accno` char(5) NOT NULL,
  `Amount` float(20,2) NOT NULL,
  `Date` datetime(6) NOT NULL,
  `Type` char(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transactions`
--

INSERT INTO `transactions` (`Accno`, `Amount`, `Date`, `Type`) VALUES
('CX002', 200.00, '2019-05-09 06:06:10.187187', 'D'),
('CX002', 40.62, '2019-05-10 16:00:00.000000', 'W'),
('SF001', 152.48, '2019-05-09 08:00:00.000000', 'D'),
('SF001', 221.48, '2019-05-09 08:00:00.000000', 'D'),
('SF001', 134.00, '2019-05-09 14:32:05.000000', 'D'),
('SF001', 12.00, '2019-05-09 14:32:36.000000', 'D'),
('SF001', 12.00, '2019-05-09 14:32:45.000000', 'D'),
('SF001', 12.00, '2019-05-09 14:32:48.000000', 'D'),
('CX002', 1.00, '2019-05-09 14:38:06.000000', 'D'),
('SF001', 12.00, '2019-05-09 14:42:37.000000', 'D'),
('SF001', 16.00, '2019-05-09 14:42:45.000000', 'D'),
('CX002', 14.00, '2019-05-09 14:42:59.000000', 'D'),
('SF001', 7.00, '2019-05-09 14:45:19.000000', 'D'),
('SF001', 3.00, '2019-05-09 14:48:35.000000', 'D'),
('SF001', 3.00, '2019-05-09 14:50:11.000000', 'D'),
('SF001', 4.00, '2019-05-09 14:50:44.000000', 'D'),
('SF001', 4.00, '2019-05-09 14:52:00.000000', 'D'),
('SF001', 3.00, '2019-05-09 14:53:46.000000', 'W'),
('SF001', 50.00, '2019-05-09 15:01:39.000000', 'W'),
('CX002', 20.00, '2019-05-09 15:29:24.000000', 'D'),
('CX002', 5.00, '2019-05-09 15:29:35.000000', 'D'),
('CX002', 10.00, '2019-05-09 15:41:59.000000', 'D'),
('SF001', 20.00, '2019-05-09 16:07:20.000000', 'D'),
('SF001', 2.00, '2019-05-09 16:46:42.000000', 'D'),
('SF001', 3.00, '2019-05-09 16:46:52.000000', 'W'),
('SF001', 20.00, '2019-05-09 17:34:49.000000', 'W'),
('SF001', 30.00, '2019-05-10 13:04:58.000000', 'D'),
('SF001', 40.00, '2019-05-10 13:12:56.000000', 'W'),
('SF001', 70.00, '2019-05-10 13:33:08.000000', 'D'),
('SF001', 70.00, '2019-05-10 13:33:15.000000', 'W');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `Accno` char(5) NOT NULL,
  `Password` char(20) NOT NULL,
  `Role` int(1) NOT NULL,
  `Active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`Accno`, `Password`, `Role`, `Active`) VALUES
('CX001', 'password', 2, 1),
('CX002', 'hi', 1, 1),
('SF001', 'hi', 1, 1),
('CM003', 'hi', 1, 1),
('SM002', 'hi', 1, 1),
('SM003', 'hi', 1, 1),
('CM004', 'hi', 1, 1);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
