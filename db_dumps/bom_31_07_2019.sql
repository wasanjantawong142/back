-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 31, 2019 at 03:34 AM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bom_demo_test`
--

-- --------------------------------------------------------

--
-- Table structure for table `bd_info`
--

CREATE TABLE `bd_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(20) DEFAULT NULL,
  `ratio_engcost` float NOT NULL,
  `version` int(11) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bd_info`
--

INSERT INTO `bd_info` (`id`, `name`, `type`, `ratio_engcost`, `version`, `create_date`, `create_by`, `inuse`) VALUES
(46, 'UNIX', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(47, 'Dell', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(48, 'HPE', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(49, 'Nutanix', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(50, 'VDI', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(51, 'UNIX', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 0),
(52, 'Talk to me', 'JV', 0.9, NULL, '2019-05-11 15:10:48', '60336', 1),
(53, 'Service plus', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(54, 'OpenLandScape', 'JV', 0.9, NULL, '2019-05-11 15:10:48', '60336', 1),
(55, 'One Email', 'JV', 0.9, NULL, '2019-05-11 15:10:48', '60336', 1),
(56, 'Network&Security', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(57, 'Marketing', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(58, 'INET MS', 'JV', 0.9, NULL, '2019-05-11 15:10:48', '60336', 1),
(59, 'IDC', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(60, 'HPE', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 0),
(61, 'Flexpod', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 1),
(62, 'Dell', 'INET', 0.8, NULL, '2019-05-11 15:10:48', '60336', 0),
(63, 'Atcetera', 'JV', 0.9, NULL, '2019-05-11 15:10:48', '60336', 1),
(64, 'test001', 'INET', 0.8, NULL, '2019-07-24 14:39:42', '60336', 1),
(65, 'test00111sd1', 'INET', 0.8, NULL, '2019-07-24 14:51:15', '60336', 0),
(66, 'test001111', 'INET', 0.8, NULL, '2019-07-24 15:01:18', '60336', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bd_log`
--

CREATE TABLE `bd_log` (
  `id` int(11) NOT NULL,
  `id_bd` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bd_log`
--

INSERT INTO `bd_log` (`id`, `id_bd`, `case_log`, `create_date`, `create_by`) VALUES
(22, 46, 'CREATE', '2019-05-11 15:10:48', '60336'),
(23, 47, 'CREATE', '2019-05-11 15:10:48', '60336'),
(24, 48, 'CREATE', '2019-05-11 15:10:48', '60336'),
(25, 49, 'CREATE', '2019-05-11 15:10:48', '60336'),
(26, 50, 'CREATE', '2019-05-11 15:10:48', '60336'),
(27, 51, 'CREATE', '2019-05-11 15:10:48', '60336'),
(28, 52, 'CREATE', '2019-05-11 15:10:48', '60336'),
(29, 53, 'CREATE', '2019-05-11 15:10:48', '60336'),
(30, 54, 'CREATE', '2019-05-11 15:10:48', '60336'),
(31, 55, 'CREATE', '2019-05-11 15:10:48', '60336'),
(32, 56, 'CREATE', '2019-05-11 15:10:48', '60336'),
(33, 57, 'CREATE', '2019-05-11 15:10:48', '60336'),
(34, 58, 'CREATE', '2019-05-11 15:10:48', '60336'),
(35, 59, 'CREATE', '2019-05-11 15:10:48', '60336'),
(36, 60, 'CREATE', '2019-05-11 15:10:48', '60336'),
(37, 61, 'CREATE', '2019-05-11 15:10:48', '60336'),
(38, 62, 'CREATE', '2019-05-11 15:10:48', '60336'),
(39, 63, 'CREATE', '2019-05-11 15:10:48', '60336'),
(40, 51, 'BLOCK', '2019-05-11 00:00:00', '60336'),
(41, 60, 'BLOCK', '2019-05-11 00:00:00', '60336'),
(43, 62, 'BLOCK', '2019-05-11 00:00:00', '60336'),
(44, 64, 'CREATE', '2019-07-24 14:39:42', '60336'),
(45, 65, 'CREATE', '2019-07-24 14:51:15', '60336'),
(46, 66, 'CREATE', '2019-07-24 15:01:18', '60336'),
(47, 65, 'EDIT', '2019-07-24 15:01:36', '60336'),
(48, 65, 'BLOCK', '2019-07-24 15:26:27', '60336');

-- --------------------------------------------------------

--
-- Table structure for table `bom_bd`
--

CREATE TABLE `bom_bd` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `id_bd` int(11) NOT NULL,
  `bd_name` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_bd`
--

INSERT INTO `bom_bd` (`id`, `id_bom`, `id_bd`, `bd_name`, `inuse`) VALUES
(59, 13, 61, 'Flexpod', 1),
(60, 13, 52, 'Talk to me', 1),
(61, 13, 63, 'Atcetera', 1),
(62, 13, 55, 'One Email', 1),
(63, 13, 54, 'OpenLandScape', 1),
(76, 14, 55, 'One Email', 1),
(77, 14, 61, 'Flexpod', 1),
(81, 15, 61, 'Flexpod', 1),
(82, 15, 54, 'OpenLandScape', 1),
(91, 16, 61, 'Flexpod', 1),
(92, 16, 52, 'Talk to me', 1),
(93, 16, 58, 'INET MS', 1),
(103, 12, 61, 'Flexpod', 1),
(104, 12, 52, 'Talk to me', 1),
(105, 12, 54, 'OpenLandScape', 1),
(106, 17, 52, 'Talk to me', 1),
(107, 17, 58, 'INET MS', 1),
(108, 17, 61, 'Flexpod', 1),
(109, 18, 61, 'Flexpod', 1),
(115, 24, 54, 'OpenLandScape', 1),
(116, 25, 55, 'One Email', 1),
(117, 26, 61, 'Flexpod', 1),
(124, 31, 61, 'Flexpod', 1),
(126, 33, 55, 'One Email', 1),
(127, 34, 52, 'Talk to me', 1),
(128, 35, 55, 'One Email', 1),
(137, 36, 54, 'OpenLandScape', 1),
(138, 36, 52, 'Talk to me', 1),
(150, 40, 61, 'Flexpod', 1),
(151, 40, 55, 'One Email', 1),
(153, 41, 55, 'One Email', 1),
(154, 42, 54, 'OpenLandScape', 1),
(155, 42, 61, 'Flexpod', 1),
(156, 43, 52, 'Talk to me', 1),
(157, 44, 52, 'Talk to me', 1),
(158, 45, 61, 'Flexpod', 1),
(159, 46, 47, 'Dell', 1),
(160, 47, 61, 'Flexpod', 1),
(169, 23, 52, 'Talk to me', 1),
(170, 23, 61, 'Flexpod', 1),
(171, 23, 59, 'IDC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_bd_log`
--

CREATE TABLE `bom_bd_log` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `bd_name` varchar(255) DEFAULT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_bd_log`
--

INSERT INTO `bom_bd_log` (`id`, `id_bom`, `bd_name`, `case_log`, `create_date`, `create_by`, `remark`) VALUES
(1, 12, 'Flexpod', 'WAITING', '2019-05-28 11:34:24', '0', NULL),
(2, 13, 'Flexpod', 'WAITING', '2019-05-28 12:05:47', '0', NULL),
(3, 13, 'Talk to me', 'WAITING', '2019-05-28 12:05:47', '0', NULL),
(4, 13, 'Atcetera', 'WAITING', '2019-05-28 12:05:47', '0', NULL),
(5, 13, 'Flexpod', 'WAITING', '2019-05-28 14:22:50', '0', NULL),
(6, 13, 'Talk to me', 'WAITING', '2019-05-28 14:22:50', '0', NULL),
(7, 13, 'Atcetera', 'WAITING', '2019-05-28 14:22:50', '0', NULL),
(8, 13, 'Flexpod', 'APPROVE', '2019-05-28 14:52:04', '777777', NULL),
(9, 13, 'Flexpod', 'APPROVE', '2019-05-28 15:29:29', '777777', NULL),
(10, 13, 'Flexpod', 'APPROVE', '2019-05-28 15:45:00', '777777', NULL),
(11, 13, 'Flexpod', 'APPROVE', '2019-05-28 15:57:27', '777777', NULL),
(12, 13, 'Flexpod', 'APPROVE', '2019-05-28 15:58:12', '777777', NULL),
(13, 13, 'Flexpod', 'REJECT', '2019-05-28 15:58:29', '777777', NULL),
(14, 13, 'Flexpod', 'REJECT', '2019-05-28 16:27:39', '777777', NULL),
(15, 13, 'Flexpod', 'APPROVE', '2019-05-28 16:27:48', '777777', NULL),
(16, 13, 'Talk to me', 'APPROVE', '2019-05-28 16:36:50', '999999', NULL),
(17, 13, 'Atcetera', 'APPROVE', '2019-05-28 16:36:50', '999999', NULL),
(18, 13, 'Talk to me', 'REJECT', '2019-05-28 16:57:20', '999999', ''),
(19, 13, 'Atcetera', 'REJECT', '2019-05-28 16:57:20', '999999', ''),
(20, 13, 'Flexpod', 'REJECT', '2019-05-28 17:34:13', '777777', 'test bd reject'),
(21, 13, 'Flexpod', 'APPROVE', '2019-05-28 17:58:23', '777777', ''),
(22, 13, 'Flexpod', 'REJECT', '2019-05-28 17:58:29', '777777', ''),
(23, 13, 'Talk to me', 'APPROVE', '2019-05-28 18:00:02', '999999', ''),
(24, 13, 'Atcetera', 'APPROVE', '2019-05-28 18:00:02', '999999', ''),
(25, 13, 'Flexpod', 'APPROVE', '2019-05-28 18:00:53', '777777', ''),
(26, 13, 'Flexpod', 'REJECT', '2019-05-28 18:11:24', '777777', ''),
(27, 13, 'Flexpod', 'WAITING', '2019-05-29 16:59:01', '0', NULL),
(28, 13, 'Talk to me', 'WAITING', '2019-05-29 16:59:01', '0', NULL),
(29, 13, 'Atcetera', 'WAITING', '2019-05-29 16:59:01', '0', NULL),
(30, 13, 'OpenLandScape', 'WAITING', '2019-05-29 16:59:01', '0', NULL),
(31, 13, 'Flexpod', 'WAITING', '2019-05-29 17:01:54', '0', NULL),
(32, 13, 'Talk to me', 'WAITING', '2019-05-29 17:01:54', '0', NULL),
(33, 13, 'Atcetera', 'WAITING', '2019-05-29 17:01:54', '0', NULL),
(34, 13, 'INET MS', 'WAITING', '2019-05-29 17:01:54', '0', NULL),
(35, 13, 'Flexpod', 'WAITING', '2019-05-29 17:07:03', '0', NULL),
(36, 13, 'Talk to me', 'WAITING', '2019-05-29 17:07:03', '0', NULL),
(37, 13, 'Atcetera', 'WAITING', '2019-05-29 17:07:03', '0', NULL),
(38, 13, 'One Email', 'WAITING', '2019-05-29 17:07:03', '0', NULL),
(39, 13, 'Flexpod', 'WAITING', '2019-05-29 17:10:41', '0', NULL),
(40, 13, 'Talk to me', 'WAITING', '2019-05-29 17:10:41', '0', NULL),
(41, 13, 'Atcetera', 'WAITING', '2019-05-29 17:10:41', '0', NULL),
(42, 13, 'One Email', 'WAITING', '2019-05-29 17:10:41', '0', NULL),
(43, 13, 'Flexpod', 'WAITING', '2019-05-29 17:28:23', '0', NULL),
(44, 13, 'Talk to me', 'WAITING', '2019-05-29 17:28:23', '0', NULL),
(45, 13, 'Atcetera', 'WAITING', '2019-05-29 17:28:23', '0', NULL),
(46, 13, 'One Email', 'WAITING', '2019-05-29 17:28:23', '0', NULL),
(47, 13, 'Flexpod', 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(48, 13, 'Talk to me', 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(49, 13, 'Atcetera', 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(50, 13, 'One Email', 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(51, 13, 'OpenLandScape', 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(52, 13, 'Flexpod', 'APPROVE', '2019-05-30 10:12:29', '777777', ''),
(53, 13, 'Talk to me', 'APPROVE', '2019-05-30 10:12:49', '999999', ''),
(54, 13, 'Atcetera', 'APPROVE', '2019-05-30 10:12:49', '999999', ''),
(55, 13, 'One Email', 'APPROVE', '2019-05-30 10:12:49', '999999', ''),
(56, 13, 'OpenLandScape', 'APPROVE', '2019-05-30 10:12:49', '999999', ''),
(57, 12, 'Flexpod', 'WAITING', '2019-05-30 16:20:01', '0', NULL),
(58, 12, 'Talk to me', 'WAITING', '2019-05-30 16:20:01', '0', NULL),
(59, 12, 'OpenLandScape', 'WAITING', '2019-05-30 16:20:01', '0', NULL),
(60, 12, 'Flexpod', 'REJECT', '2019-05-30 16:24:10', '777777', 'comment remark '),
(61, 12, 'Talk to me', 'REJECT', '2019-05-30 16:24:59', '999999', ''),
(62, 12, 'OpenLandScape', 'REJECT', '2019-05-30 16:24:59', '999999', ''),
(63, 12, 'Talk to me', 'REJECT', '2019-05-30 16:27:49', '999999', 'test comment reject'),
(64, 12, 'OpenLandScape', 'REJECT', '2019-05-30 16:27:49', '999999', 'test comment reject'),
(65, 12, 'Flexpod', 'WAITING', '2019-05-30 16:49:45', '0', NULL),
(66, 12, 'Talk to me', 'WAITING', '2019-05-30 16:49:45', '0', NULL),
(67, 12, 'OpenLandScape', 'WAITING', '2019-05-30 16:49:45', '0', NULL),
(68, 12, 'Talk to me', 'REJECT', '2019-05-31 08:11:46', '999999', 'test check css style'),
(69, 12, 'OpenLandScape', 'REJECT', '2019-05-31 08:11:46', '999999', 'test check css style'),
(70, 14, 'One Email', 'WAITING', '2019-05-31 10:07:43', '999999', NULL),
(71, 14, 'Flexpod', 'WAITING', '2019-05-31 10:07:43', '999999', NULL),
(72, 12, 'Flexpod', 'APPROVE', '2019-05-31 12:05:24', '777777', ''),
(73, 14, 'One Email', 'APPROVE', '2019-05-31 12:05:41', '999999', ''),
(74, 14, 'One Email', 'APPROVE', '2019-05-31 12:12:33', '999999', 'approve test'),
(75, 14, 'Flexpod', 'APPROVE', '2019-05-31 12:13:19', '777777', 'test approve op cloud'),
(76, 15, 'Flexpod', 'WAITING', '2019-06-04 17:29:59', '000000', NULL),
(77, 15, 'Flexpod', 'WAITING', '2019-06-04 18:23:46', '000000', NULL),
(78, 15, 'OpenLandScape', 'WAITING', '2019-06-04 18:23:46', '000000', NULL),
(79, 15, 'Flexpod', 'APPROVE', '2019-06-04 18:27:39', '777777', ''),
(80, 15, 'OpenLandScape', 'APPROVE', '2019-06-04 18:28:15', '999999', ''),
(81, 12, 'Flexpod', 'WAITING', '2019-06-05 08:48:55', '000000', NULL),
(82, 12, 'Talk to me', 'WAITING', '2019-06-05 08:48:55', '000000', NULL),
(83, 12, 'OpenLandScape', 'WAITING', '2019-06-05 08:48:55', '000000', NULL),
(84, 16, 'Flexpod', 'WAITING', '2019-06-05 15:46:51', '000000', NULL),
(85, 16, 'Talk to me', 'WAITING', '2019-06-05 15:46:51', '000000', NULL),
(86, 12, 'Flexpod', 'WAITING', '2019-06-05 15:47:40', '000000', NULL),
(87, 12, 'Talk to me', 'WAITING', '2019-06-05 15:47:40', '000000', NULL),
(88, 12, 'OpenLandScape', 'WAITING', '2019-06-05 15:47:40', '000000', NULL),
(89, 16, 'Flexpod', 'WAITING', '2019-06-05 15:53:11', '000000', NULL),
(90, 16, 'Talk to me', 'WAITING', '2019-06-05 15:53:11', '000000', NULL),
(91, 16, 'INET MS', 'WAITING', '2019-06-05 15:53:11', '000000', NULL),
(92, 12, 'Flexpod', 'APPROVE', '2019-06-05 15:56:02', '777777', ''),
(93, 12, 'Flexpod', 'APPROVE', '2019-06-05 15:57:16', '777777', ''),
(94, 12, 'Flexpod', 'APPROVE', '2019-06-05 15:58:50', '777777', ''),
(95, 12, 'Flexpod', 'APPROVE', '2019-06-05 15:58:50', '777777', ''),
(96, 12, 'Talk to me', 'APPROVE', '2019-06-05 15:59:44', '999999', ''),
(97, 12, 'OpenLandScape', 'APPROVE', '2019-06-05 15:59:44', '999999', ''),
(98, 16, 'Flexpod', 'APPROVE', '2019-06-06 17:20:29', '777777', ''),
(99, 17, 'Talk to me', 'WAITING', '2019-06-06 17:31:06', '777777', NULL),
(100, 17, 'INET MS', 'WAITING', '2019-06-06 17:31:06', '777777', NULL),
(101, 17, 'Flexpod', 'WAITING', '2019-06-06 17:31:06', '777777', NULL),
(102, 16, 'Flexpod', 'APPROVE', '2019-06-07 10:50:33', '777777', ''),
(103, 16, 'Talk to me', 'APPROVE', '2019-06-07 10:51:00', '999999', ''),
(104, 16, 'INET MS', 'APPROVE', '2019-06-07 10:51:00', '999999', ''),
(105, 18, 'Flexpod', 'WAITING', '2019-06-10 08:46:24', '000000', NULL),
(110, 23, 'Talk to me', 'WAITING', '2019-06-10 09:36:39', '000000', NULL),
(111, 24, 'OpenLandScape', 'WAITING', '2019-06-11 10:29:49', '000000', NULL),
(112, 25, 'One Email', 'WAITING', '2019-06-11 10:31:46', '000000', NULL),
(113, 26, 'Flexpod', 'WAITING', '2019-06-11 10:35:20', '000000', NULL),
(120, 31, 'Flexpod', 'WAITING', '2019-06-11 11:25:27', '000000', NULL),
(122, 33, 'One Email', 'WAITING', '2019-06-11 11:33:13', '000000', NULL),
(123, 34, 'Talk to me', 'WAITING', '2019-06-11 11:46:04', '000000', NULL),
(124, 35, 'One Email', 'WAITING', '2019-06-11 11:59:35', '000000', NULL),
(128, 36, 'OpenLandScape', 'WAITING', '2019-06-11 15:08:28', '000000', NULL),
(129, 36, 'OpenLandScape', 'WAITING', '2019-06-11 15:09:31', '000000', NULL),
(130, 36, 'Talk to me', 'WAITING', '2019-06-11 15:09:31', '000000', NULL),
(131, 36, 'OpenLandScape', 'WAITING', '2019-06-11 15:09:57', '000000', NULL),
(132, 36, 'Talk to me', 'WAITING', '2019-06-11 15:09:57', '000000', NULL),
(133, 36, 'OpenLandScape', 'APPROVE', '2019-06-11 15:12:28', '999999', ''),
(134, 36, 'Talk to me', 'APPROVE', '2019-06-11 15:12:28', '999999', ''),
(138, 40, 'Flexpod', 'WAITING', '2019-06-12 10:58:35', '000000', NULL),
(139, 40, 'Flexpod', 'APPROVE', '2019-06-12 11:12:56', '777777', ''),
(140, 40, 'Flexpod', 'WAITING', '2019-06-12 11:26:14', '000000', NULL),
(141, 40, 'One Email', 'WAITING', '2019-06-12 11:26:14', '000000', NULL),
(142, 40, 'Flexpod', 'WAITING', '2019-06-12 12:10:06', '000000', NULL),
(143, 40, 'One Email', 'WAITING', '2019-06-12 12:10:06', '000000', NULL),
(144, 40, 'Flexpod', 'WAITING', '2019-06-12 14:42:21', '000000', NULL),
(145, 40, 'One Email', 'WAITING', '2019-06-12 14:42:21', '000000', NULL),
(146, 40, 'Flexpod', 'WAITING', '2019-06-12 14:42:36', '000000', NULL),
(147, 40, 'One Email', 'WAITING', '2019-06-12 14:42:36', '000000', NULL),
(148, 41, 'One Email', 'WAITING', '2019-06-12 15:22:38', '000000', NULL),
(149, 41, 'One Email', 'WAITING', '2019-06-12 15:23:29', '000000', NULL),
(150, 42, 'OpenLandScape', 'WAITING', '2019-06-17 08:44:42', '000000', NULL),
(151, 42, 'Flexpod', 'WAITING', '2019-06-17 08:44:42', '000000', NULL),
(152, 43, 'Talk to me', 'WAITING', '2019-06-20 11:00:21', '000000', NULL),
(153, 44, 'Talk to me', 'WAITING', '2019-06-20 13:35:09', '000000', NULL),
(154, 45, 'Flexpod', 'WAITING', '2019-07-18 16:50:46', '60336', NULL),
(155, 46, 'Dell', 'WAITING', '2019-07-26 16:05:00', '60336', NULL),
(156, 47, 'Flexpod', 'WAITING', '2019-07-26 16:34:19', '60336', NULL),
(157, 23, 'Talk to me', 'WAITING', '2019-07-26 16:38:01', '60336', NULL),
(158, 23, 'Flexpod', 'WAITING', '2019-07-26 16:38:01', '60336', NULL),
(159, 23, 'Talk to me', 'WAITING', '2019-07-26 17:11:12', '60336', NULL),
(160, 23, 'Flexpod', 'WAITING', '2019-07-26 17:11:12', '60336', NULL),
(161, 23, 'IDC', 'WAITING', '2019-07-26 17:11:12', '60336', NULL),
(162, 23, 'Talk to me', 'WAITING', '2019-07-26 17:12:35', '60336', NULL),
(163, 23, 'Flexpod', 'WAITING', '2019-07-26 17:12:35', '60336', NULL),
(164, 23, 'IDC', 'WAITING', '2019-07-26 17:12:35', '60336', NULL),
(165, 23, 'Talk to me', 'WAITING', '2019-07-26 17:13:30', '60336', NULL),
(166, 23, 'Flexpod', 'WAITING', '2019-07-26 17:13:30', '60336', NULL),
(167, 23, 'IDC', 'WAITING', '2019-07-26 17:13:30', '60336', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bom_bd_old`
--

CREATE TABLE `bom_bd_old` (
  `id` int(11) NOT NULL,
  `id_bom_old` int(11) NOT NULL,
  `id_bd` int(11) NOT NULL,
  `bd_name` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_bd_old`
--

INSERT INTO `bom_bd_old` (`id`, `id_bom_old`, `id_bd`, `bd_name`, `inuse`) VALUES
(6, 7, 61, 'Flexpod', 1),
(7, 8, 61, 'Flexpod', 1),
(8, 8, 52, 'Talk to me', 1),
(9, 8, 63, 'Atcetera', 1),
(10, 9, 61, 'Flexpod', 1),
(11, 9, 52, 'Talk to me', 1),
(12, 10, 61, 'Flexpod', 1),
(13, 10, 52, 'Talk to me', 1),
(14, 10, 63, 'Atcetera', 1),
(15, 10, 55, 'One Email', 1),
(16, 11, 61, 'Flexpod', 1),
(17, 11, 52, 'Talk to me', 1),
(18, 11, 63, 'Atcetera', 1),
(19, 11, 55, 'One Email', 1),
(24, 13, 61, 'Flexpod', 1),
(25, 13, 52, 'Talk to me', 1),
(26, 13, 63, 'Atcetera', 1),
(27, 13, 55, 'One Email', 1),
(28, 14, 61, 'Flexpod', 1),
(29, 14, 52, 'Talk to me', 1),
(30, 14, 63, 'Atcetera', 1),
(31, 15, 61, 'Flexpod', 1),
(32, 15, 52, 'Talk to me', 1),
(33, 15, 63, 'Atcetera', 1),
(34, 16, 61, 'Flexpod', 1),
(35, 16, 52, 'Talk to me', 1),
(36, 16, 63, 'Atcetera', 1),
(37, 16, 54, 'OpenLandScape', 1),
(38, 17, 61, 'Flexpod', 1),
(39, 17, 52, 'Talk to me', 1),
(40, 17, 63, 'Atcetera', 1),
(41, 17, 58, 'INET MS', 1),
(42, 18, 61, 'Flexpod', 1),
(43, 18, 52, 'Talk to me', 1),
(44, 18, 63, 'Atcetera', 1),
(45, 18, 55, 'One Email', 1),
(46, 19, 61, 'Flexpod', 1),
(47, 19, 52, 'Talk to me', 1),
(48, 19, 63, 'Atcetera', 1),
(49, 19, 55, 'One Email', 1),
(50, 20, 61, 'Flexpod', 1),
(51, 20, 52, 'Talk to me', 1),
(52, 20, 63, 'Atcetera', 1),
(53, 20, 55, 'One Email', 1),
(54, 21, 61, 'Flexpod', 1),
(55, 21, 52, 'Talk to me', 1),
(56, 21, 54, 'OpenLandScape', 1),
(57, 22, 61, 'Flexpod', 1),
(58, 22, 52, 'Talk to me', 1),
(59, 22, 54, 'OpenLandScape', 1),
(60, 23, 61, 'Flexpod', 1),
(61, 23, 52, 'Talk to me', 1),
(62, 23, 54, 'OpenLandScape', 1),
(63, 24, 61, 'Flexpod', 1),
(64, 24, 52, 'Talk to me', 1),
(65, 24, 54, 'OpenLandScape', 1),
(66, 25, 61, 'Flexpod', 1),
(67, 26, 61, 'Flexpod', 1),
(68, 26, 54, 'OpenLandScape', 1),
(69, 27, 61, 'Flexpod', 1),
(70, 27, 52, 'Talk to me', 1),
(71, 27, 54, 'OpenLandScape', 1),
(72, 28, 61, 'Flexpod', 1),
(73, 28, 52, 'Talk to me', 1),
(74, 28, 54, 'OpenLandScape', 1),
(75, 29, 61, 'Flexpod', 1),
(76, 29, 52, 'Talk to me', 1),
(77, 30, 61, 'Flexpod', 1),
(78, 30, 52, 'Talk to me', 1),
(79, 30, 54, 'OpenLandScape', 1),
(80, 31, 61, 'Flexpod', 1),
(81, 31, 52, 'Talk to me', 1),
(82, 31, 54, 'OpenLandScape', 1),
(83, 32, 61, 'Flexpod', 1),
(84, 32, 52, 'Talk to me', 1),
(85, 32, 54, 'OpenLandScape', 1),
(86, 33, 61, 'Flexpod', 1),
(87, 33, 52, 'Talk to me', 1),
(88, 33, 54, 'OpenLandScape', 1),
(92, 37, 54, 'OpenLandScape', 1),
(93, 38, 54, 'OpenLandScape', 1),
(94, 38, 52, 'Talk to me', 1),
(95, 39, 54, 'OpenLandScape', 1),
(96, 39, 52, 'Talk to me', 1),
(97, 40, 61, 'Flexpod', 1),
(98, 41, 61, 'Flexpod', 1),
(99, 42, 61, 'Flexpod', 1),
(100, 42, 55, 'One Email', 1),
(101, 43, 61, 'Flexpod', 1),
(102, 43, 55, 'One Email', 1),
(103, 44, 61, 'Flexpod', 1),
(104, 44, 55, 'One Email', 1),
(105, 45, 55, 'One Email', 1),
(106, 46, 52, 'Talk to me', 1),
(107, 47, 52, 'Talk to me', 1),
(108, 47, 61, 'Flexpod', 1),
(109, 48, 52, 'Talk to me', 1),
(110, 48, 61, 'Flexpod', 1),
(111, 48, 59, 'IDC', 1),
(112, 49, 52, 'Talk to me', 1),
(113, 49, 61, 'Flexpod', 1),
(114, 49, 59, 'IDC', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_diagram`
--

CREATE TABLE `bom_diagram` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_diagram`
--

INSERT INTO `bom_diagram` (`id`, `id_bom`, `path`, `img_name`, `inuse`) VALUES
(20, 36, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-09-57-36-2019-06-11-15-09-31-36-2019-06-11-15-08-28-2.png', '36-2019-06-11-15-09-57-36-2019-06-11-15-09-31-36-2019-06-11-15-08-28-2.png', 1),
(21, 36, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-09-57-36-2019-06-11-15-09-31-11.png', '36-2019-06-11-15-09-57-36-2019-06-11-15-09-31-11.png', 1),
(22, 36, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-09-57-test.png', '36-2019-06-11-15-09-57-test.png', 1),
(27, 40, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-40/40-2019-06-12-14-42-37-40-2019-06-12-14-42-21-40-2019-06-12-12-10-06-40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', '40-2019-06-12-14-42-37-40-2019-06-12-14-42-21-40-2019-06-12-12-10-06-40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', 1),
(31, 41, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-41/41-2019-06-12-15-23-29-5.png', '41-2019-06-12-15-23-29-5.png', 1),
(32, 41, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-41/41-2019-06-12-15-23-29-6.png', '41-2019-06-12-15-23-29-6.png', 1),
(33, 42, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-42/42-2019-06-17-08-44-42-2.png', '42-2019-06-17-08-44-42-2.png', 1),
(34, 42, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-42/42-2019-06-17-08-44-42-4.png', '42-2019-06-17-08-44-42-4.png', 1),
(35, 42, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-42/42-2019-06-17-08-44-42-3.png', '42-2019-06-17-08-44-42-3.png', 1),
(42, 23, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-24.png', '23-24.png', 1),
(43, 23, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-test.png', '23-test.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_diagram_old`
--

CREATE TABLE `bom_diagram_old` (
  `id` int(11) NOT NULL,
  `id_bom_old` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `img_name` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_diagram_old`
--

INSERT INTO `bom_diagram_old` (`id`, `id_bom_old`, `path`, `img_name`, `inuse`) VALUES
(10, 37, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-08-28-1.png', '36-2019-06-11-15-08-28-1.png', 1),
(11, 37, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-08-28-3.png', '36-2019-06-11-15-08-28-3.png', 1),
(12, 37, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-08-28-2.png', '36-2019-06-11-15-08-28-2.png', 1),
(13, 38, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-09-31-36-2019-06-11-15-08-28-3.png', '36-2019-06-11-15-09-31-36-2019-06-11-15-08-28-3.png', 1),
(14, 38, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-09-31-36-2019-06-11-15-08-28-2.png', '36-2019-06-11-15-09-31-36-2019-06-11-15-08-28-2.png', 1),
(15, 38, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-36/36-2019-06-11-15-09-31-11.png', '36-2019-06-11-15-09-31-11.png', 1),
(16, 41, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-40/40-2019-06-12-10-58-35-9.png', '40-2019-06-12-10-58-35-9.png', 1),
(17, 42, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-40/40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', '40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', 1),
(18, 43, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-40/40-2019-06-12-12-10-06-40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', '40-2019-06-12-12-10-06-40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', 1),
(19, 44, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-40/40-2019-06-12-14-42-21-40-2019-06-12-12-10-06-40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', '40-2019-06-12-14-42-21-40-2019-06-12-12-10-06-40-2019-06-12-11-26-14-40-2019-06-12-10-58-35-9.png', 1),
(20, 45, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-41/41-2019-06-12-15-22-38-5.png', '41-2019-06-12-15-22-38-5.png', 1),
(21, 45, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-41/41-2019-06-12-15-22-38-7.png', '41-2019-06-12-15-22-38-7.png', 1),
(22, 45, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-41/41-2019-06-12-15-22-38-6.png', '41-2019-06-12-15-22-38-6.png', 1),
(23, 47, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-24.png', '23-24.png', 1),
(24, 47, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-test.png', '23-test.png', 1),
(25, 48, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-24.png', '23-24.png', 1),
(26, 48, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-test.png', '23-test.png', 1),
(27, 49, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-24.png', '23-24.png', 1),
(28, 49, 'C:\\Users\\Godceza\\Desktop\\bom\\bom_backend_present/apps/boms/diagram/bomid-23/23-test.png', '23-test.png', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_item`
--

CREATE TABLE `bom_item` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `id_bd` int(11) NOT NULL,
  `bd_name` varchar(255) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `id_item` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_item`
--

INSERT INTO `bom_item` (`id`, `id_bom`, `id_bd`, `bd_name`, `id_product`, `product_name`, `id_item`, `item_name`, `inuse`) VALUES
(88, 13, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(89, 13, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(90, 13, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(91, 13, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(92, 13, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(93, 13, 63, 'Atcetera', 566, 'VM as a Service', 1581, 'Monthly fee for Add SQL License', 1),
(94, 13, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(95, 13, 54, 'OpenLandScape', 510, 'VM as a Service', 1168, 'Monthly fee for Backup 1 GB', 1),
(96, 13, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(126, 14, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(127, 14, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(128, 14, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(129, 14, 61, 'Flexpod', 557, 'INET-S3 Storage', 1558, 'Monthly fee for INETS3 S3', 1),
(135, 15, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(136, 15, 61, 'Flexpod', 557, 'INET-S3 Storage', 1558, 'Monthly fee for INETS3 S3', 1),
(137, 15, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(155, 16, 61, 'Flexpod', 556, 'Database as a Service', 1540, 'Monthly fee for DBasS-FlexPod Cloud [ package S ] MSSQL Enterprise', 1),
(156, 16, 52, 'Talk to me', 503, 'Talk to me', 1109, 'Expert Domain', 1),
(157, 16, 58, 'INET MS', 539, 'Database as a Service', 1439, 'Turnkey-DBA-Implement Standard (One Time)', 1),
(179, 12, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(180, 12, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(181, 12, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(182, 12, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(183, 12, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(184, 12, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(185, 12, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(186, 17, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(187, 17, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(188, 17, 58, 'INET MS', 539, 'Database as a Service', 1439, 'Turnkey-DBA-Implement Standard (One Time)', 1),
(189, 17, 58, 'INET MS', 539, 'Database as a Service', 1440, 'Turnkey-DBA-Implement Advance (One Time)', 1),
(190, 17, 61, 'Flexpod', 553, 'VM as a Service', 1509, 'Monthly fee for INET-FlexPod Cloud(Package,Bronze) Package : Bronze', 1),
(191, 17, 61, 'Flexpod', 553, 'VM as a Service', 1510, 'Monthly fee for INET-FlexPod Cloud(Package,Silver) Package : Silver', 1),
(192, 18, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1534, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 1),
(193, 18, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1535, 'Monthly fee for DRaaS (VEEAM) VFW (NSX)', 1),
(194, 18, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1536, 'Monthly fee for DRaaS (VEEAM) VM Gateway(vCPU 8, Ram 8, disk 50 , OS windows)', 1),
(206, 24, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(207, 24, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(208, 25, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(209, 25, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(210, 26, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1532, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 1 VM - 20 VM (One Time)', 1),
(211, 26, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1533, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 21 VM - 50 VM (One Time)', 1),
(212, 26, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1534, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 1),
(224, 31, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(225, 31, 61, 'Flexpod', 556, 'Database as a Service', 1540, 'Monthly fee for DBasS-FlexPod Cloud [ package S ] MSSQL Enterprise', 1),
(228, 33, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(229, 33, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(230, 34, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(231, 34, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(232, 35, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(233, 35, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(253, 36, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(254, 36, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(255, 36, 54, 'OpenLandScape', 510, 'VM as a Service', 1153, 'Monthly fee for INET-OpenLandscape Cloud (Package E)', 1),
(256, 36, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(257, 36, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(320, 40, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(321, 40, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(322, 40, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(323, 40, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(324, 40, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(325, 40, 61, 'Flexpod', 553, 'VM as a Service', 1522, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 1),
(326, 40, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(327, 40, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(328, 40, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(333, 41, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(334, 41, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(335, 41, 55, 'One Email', 513, 'Mail as a Service', 1179, 'Mail Gateway Package 20 Anti Spam 4000 users/year', 1),
(336, 41, 55, 'One Email', 513, 'Mail as a Service', 1180, 'Mail Gateway Package 21 Anti Spam 5000 users/year', 1),
(337, 42, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(338, 42, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(339, 42, 54, 'OpenLandScape', 510, 'VM as a Service', 1153, 'Monthly fee for INET-OpenLandscape Cloud (Package E)', 1),
(340, 42, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(341, 42, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(342, 42, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(343, 42, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(344, 42, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(345, 43, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(346, 43, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(347, 44, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(348, 44, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(349, 45, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(350, 46, 47, 'Dell', 482, 'VM as a Service', 856, 'Monthly fee for INET-Dell Cloud (Resource Pool)', 1),
(351, 46, 47, 'Dell', 482, 'VM as a Service', 857, 'Add IP  Address', 1),
(352, 46, 47, 'Dell', 482, 'VM as a Service', 858, 'VM Fee (BW, Antivirus, Operation Monitoring& Alert)', 1),
(353, 46, 47, 'Dell', 482, 'VM as a Service', 859, 'Add HDD', 1),
(354, 46, 47, 'Dell', 482, 'VM as a Service', 860, 'Add VRAM', 1),
(355, 46, 47, 'Dell', 482, 'VM as a Service', 861, 'Add VCPU', 1),
(356, 47, 61, 'Flexpod', 553, 'VM as a Service', 1510, 'Monthly fee for INET-FlexPod Cloud(Package,Silver) Package : Silver', 1),
(357, 47, 61, 'Flexpod', 553, 'VM as a Service', 1524, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Std.', 1),
(358, 47, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(373, 23, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(374, 23, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(375, 23, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1534, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 1),
(376, 23, 59, 'IDC', 548, 'INET-IDC1', 1479, 'Co-Location Full Rack', 1),
(377, 23, 59, 'IDC', 548, 'INET-IDC1', 1480, 'Co-Location Full Rack (HD)', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_item_old`
--

CREATE TABLE `bom_item_old` (
  `id` int(11) NOT NULL,
  `id_bom_old` int(11) NOT NULL,
  `id_bd` int(11) NOT NULL,
  `bd_name` varchar(255) DEFAULT NULL,
  `id_product` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `id_item` int(11) NOT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_item_old`
--

INSERT INTO `bom_item_old` (`id`, `id_bom_old`, `id_bd`, `bd_name`, `id_product`, `product_name`, `id_item`, `item_name`, `inuse`) VALUES
(15, 7, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(16, 7, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(17, 7, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(18, 7, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(19, 8, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(20, 8, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(21, 8, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(22, 8, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(23, 8, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(24, 8, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(25, 9, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(26, 9, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(27, 9, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(28, 9, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(29, 9, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(30, 10, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(31, 10, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(32, 10, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(33, 10, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(34, 10, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(35, 10, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(36, 10, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(37, 11, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(38, 11, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(39, 11, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(40, 11, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(41, 11, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(42, 11, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(43, 11, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(44, 13, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(45, 13, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(46, 13, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(47, 13, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(48, 13, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(49, 13, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(50, 13, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(51, 14, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(52, 14, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(53, 14, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(54, 14, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(55, 14, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(56, 14, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(57, 15, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(58, 15, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(59, 15, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(60, 15, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(61, 15, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(62, 15, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(63, 16, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(64, 16, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(65, 16, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(66, 16, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(67, 16, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(68, 17, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(69, 17, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(70, 17, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(71, 17, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(72, 17, 58, 'INET MS', 539, 'Database as a Service', 1439, 'Turnkey-DBA-Implement Standard (One Time)', 1),
(73, 18, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(74, 18, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(75, 18, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(76, 18, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(77, 18, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(78, 19, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(79, 19, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(80, 19, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(81, 19, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(82, 19, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(83, 19, 63, 'Atcetera', 566, 'VM as a Service', 1581, 'Monthly fee for Add SQL License', 1),
(84, 20, 61, 'Flexpod', 556, 'Database as a Service', 1555, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 1),
(85, 20, 61, 'Flexpod', 556, 'Database as a Service', 1556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 1),
(86, 20, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(87, 20, 63, 'Atcetera', 561, 'Mail Gateway', 1568, 'Monthly fee for Mail Gateway (Standard)', 1),
(88, 20, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(89, 20, 63, 'Atcetera', 566, 'VM as a Service', 1581, 'Monthly fee for Add SQL License', 1),
(90, 20, 63, 'Atcetera', 565, 'SQL Database as a Service', 1576, 'Monthly fee for INET-SQL DBaaS (Large)', 1),
(91, 21, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(92, 21, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(93, 21, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(94, 21, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(95, 21, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(96, 21, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(97, 22, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(98, 22, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(99, 22, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(100, 22, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(101, 22, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(102, 22, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(103, 22, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(104, 23, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(105, 23, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(106, 23, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(107, 23, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(108, 23, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(109, 23, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(110, 23, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(111, 24, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(112, 24, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(113, 24, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(114, 24, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(115, 24, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(116, 24, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(117, 24, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(118, 25, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(119, 25, 61, 'Flexpod', 557, 'INET-S3 Storage', 1558, 'Monthly fee for INETS3 S3', 1),
(120, 26, 61, 'Flexpod', 556, 'Database as a Service', 1542, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 1),
(121, 26, 61, 'Flexpod', 557, 'INET-S3 Storage', 1558, 'Monthly fee for INETS3 S3', 1),
(122, 26, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(123, 27, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(124, 27, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(125, 27, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(126, 27, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(127, 27, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(128, 27, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(129, 27, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(130, 27, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(131, 28, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1529, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 1),
(132, 28, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(133, 28, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(134, 28, 61, 'Flexpod', 556, 'Database as a Service', 1539, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 1),
(135, 28, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(136, 28, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(137, 28, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(138, 28, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(139, 29, 61, 'Flexpod', 556, 'Database as a Service', 1540, 'Monthly fee for DBasS-FlexPod Cloud [ package S ] MSSQL Enterprise', 1),
(140, 29, 52, 'Talk to me', 503, 'Talk to me', 1109, 'Expert Domain', 1),
(141, 30, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(142, 30, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(143, 30, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(144, 30, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(145, 30, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(146, 30, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(147, 30, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(148, 31, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(149, 31, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(150, 31, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(151, 31, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(152, 31, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(153, 31, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(154, 31, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(155, 32, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(156, 32, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(157, 32, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(158, 32, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(159, 32, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(160, 32, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(161, 32, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(162, 33, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1530, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 1),
(163, 33, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1531, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 1),
(164, 33, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(165, 33, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(166, 33, 61, 'Flexpod', 553, 'VM as a Service', 1517, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 1),
(167, 33, 52, 'Talk to me', 503, 'Talk to me', 1118, '4 Digit (Option 2,First Year)', 1),
(168, 33, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(175, 37, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(176, 37, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(177, 37, 54, 'OpenLandScape', 510, 'VM as a Service', 1153, 'Monthly fee for INET-OpenLandscape Cloud (Package E)', 1),
(178, 38, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(179, 38, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(180, 38, 54, 'OpenLandScape', 510, 'VM as a Service', 1153, 'Monthly fee for INET-OpenLandscape Cloud (Package E)', 1),
(181, 38, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(182, 38, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(183, 39, 54, 'OpenLandScape', 510, 'VM as a Service', 1151, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 1),
(184, 39, 54, 'OpenLandScape', 510, 'VM as a Service', 1152, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 1),
(185, 39, 54, 'OpenLandScape', 510, 'VM as a Service', 1153, 'Monthly fee for INET-OpenLandscape Cloud (Package E)', 1),
(186, 39, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(187, 39, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(188, 40, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(189, 40, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(190, 40, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(191, 40, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(192, 40, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(193, 40, 61, 'Flexpod', 553, 'VM as a Service', 1522, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 1),
(194, 40, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(195, 41, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(196, 41, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(197, 41, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(198, 41, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(199, 41, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(200, 41, 61, 'Flexpod', 553, 'VM as a Service', 1522, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 1),
(201, 41, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(202, 42, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(203, 42, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(204, 42, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(205, 42, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(206, 42, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(207, 42, 61, 'Flexpod', 553, 'VM as a Service', 1522, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 1),
(208, 42, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(209, 42, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(210, 42, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(211, 43, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(212, 43, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(213, 43, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(214, 43, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(215, 43, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(216, 43, 61, 'Flexpod', 553, 'VM as a Service', 1522, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 1),
(217, 43, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(218, 43, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(219, 43, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(220, 44, 61, 'Flexpod', 553, 'VM as a Service', 1512, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 1),
(221, 44, 61, 'Flexpod', 553, 'VM as a Service', 1514, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 1),
(222, 44, 61, 'Flexpod', 553, 'VM as a Service', 1515, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 1),
(223, 44, 61, 'Flexpod', 553, 'VM as a Service', 1516, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 1),
(224, 44, 61, 'Flexpod', 553, 'VM as a Service', 1519, 'IP  Address IP  Address', 1),
(225, 44, 61, 'Flexpod', 553, 'VM as a Service', 1522, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 1),
(226, 44, 61, 'Flexpod', 553, 'VM as a Service', 1525, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 1),
(227, 44, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(228, 44, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(229, 45, 55, 'One Email', 513, 'Mail as a Service', 1177, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 1),
(230, 45, 55, 'One Email', 513, 'Mail as a Service', 1178, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 1),
(231, 45, 55, 'One Email', 513, 'Mail as a Service', 1179, 'Mail Gateway Package 20 Anti Spam 4000 users/year', 1),
(232, 45, 55, 'One Email', 513, 'Mail as a Service', 1180, 'Mail Gateway Package 21 Anti Spam 5000 users/year', 1),
(233, 46, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(234, 46, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(235, 47, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(236, 47, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(237, 47, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1534, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 1),
(238, 48, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(239, 48, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(240, 48, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1534, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 1),
(241, 48, 59, 'IDC', 548, 'INET-IDC1', 1479, 'Co-Location Full Rack', 1),
(242, 48, 59, 'IDC', 548, 'INET-IDC1', 1480, 'Co-Location Full Rack (HD)', 1),
(243, 49, 52, 'Talk to me', 503, 'Talk to me', 1106, 'Contact Value', 1),
(244, 49, 52, 'Talk to me', 503, 'Talk to me', 1107, 'Customer Satisfaction', 1),
(245, 49, 61, 'Flexpod', 555, 'Disaster recovery as a Service', 1534, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 1),
(246, 49, 59, 'IDC', 548, 'INET-IDC1', 1479, 'Co-Location Full Rack', 1),
(247, 49, 59, 'IDC', 548, 'INET-IDC1', 1480, 'Co-Location Full Rack (HD)', 1),
(248, 49, 61, 'Flexpod', 553, 'VM as a Service', 1509, 'Monthly fee for INET-FlexPod Cloud(Package,Bronze) Package : Bronze', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_item_price`
--

CREATE TABLE `bom_item_price` (
  `id` int(11) NOT NULL,
  `id_bom_item` int(11) NOT NULL,
  `item_ratio_engcost` float DEFAULT NULL,
  `item_unit_amount` int(11) NOT NULL,
  `item_unit` varchar(20) DEFAULT NULL,
  `item_unit_price` float DEFAULT NULL,
  `item_amount_price` float DEFAULT NULL,
  `item_actualcost` float DEFAULT NULL,
  `item_ratio_actualcost` float DEFAULT NULL,
  `item_engcost` float DEFAULT NULL,
  `item_engcost_month` float DEFAULT NULL,
  `onetime` tinyint(1) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_item_price`
--

INSERT INTO `bom_item_price` (`id`, `id_bom_item`, `item_ratio_engcost`, `item_unit_amount`, `item_unit`, `item_unit_price`, `item_amount_price`, `item_actualcost`, `item_ratio_actualcost`, `item_engcost`, `item_engcost_month`, `onetime`, `inuse`) VALUES
(1, 1, 0.8, 4, 'VCPU', 240, 960, 11520, 3.5, 14400, 1200, 0, 1),
(2, 2, 0.8, 8, 'GB', 192, 1536, 18432, 5.59, 23040, 1920, 0, 1),
(3, 3, 0.8, 300, 'GB', 3.2, 960, 11520, 3.5, 14400, 1200, 0, 1),
(4, 4, 0.8, 1, 'Package', 24000, 24000, 288000, 87.41, 360000, 30000, 0, 1),
(5, 5, 0.8, 1, 'Package', 40480, 40480, 485760, 37.5, 607200, 50600, 0, 1),
(6, 6, 0.8, 1, 'License', 488, 488, 5856, 0.45, 7320, 610, 0, 1),
(7, 7, 0.8, 1, 'License', 4480, 4480, 53760, 4.15, 67200, 5600, 0, 1),
(8, 8, 0.9, 1, 'agent', 25000, 25000, 300000, 23.16, 333333, 27777.8, 0, 1),
(9, 9, 0.9, 1, 'agent', 12500, 12500, 150000, 11.58, 166667, 13888.9, 0, 1),
(10, 10, 0.9, 1000, 'Account', 25, 25000, 300000, 23.16, 333333, 27777.8, 0, 1),
(16, 16, 0.8, 4, 'VCPU', 240, 960, 11520, 2.4, 14400, 1200, 0, 1),
(17, 17, 0.8, 8, 'GB', 192, 1536, 18432, 3.84, 23040, 1920, 0, 1),
(18, 18, 0.8, 300, 'GB', 3.2, 960, 11520, 2.4, 14400, 1200, 0, 1),
(19, 19, 0.8, 1, 'Package', 24000, 24000, 288000, 60.07, 360000, 30000, 0, 1),
(20, 20, 0.9, 1, 'agent', 12500, 12500, 150000, 31.28, 166667, 13888.9, 0, 1),
(21, 21, 0.8, 1, 'Package', 40480, 40480, 485760, 11.63, 607200, 50600, 0, 1),
(22, 22, 0.8, 1, 'License', 488, 488, 5856, 0.14, 7320, 610, 0, 1),
(23, 23, 0.8, 1, 'License', 4480, 4480, 53760, 1.29, 67200, 5600, 0, 1),
(24, 24, 0.9, 1, 'agent', 25000, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(25, 25, 0.9, 1, 'agent', 12500, 12500, 150000, 3.59, 166667, 13888.9, 0, 1),
(26, 26, 0.9, 1000, 'Account', 25, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(27, 27, 0.9, 1, 'Package', 240000, 240000, 2880000, 68.98, 3200000, 266667, 0, 1),
(28, 28, 0.8, 4, 'VCPU', 240, 960, 11520, 1.92, 14400, 1200, 0, 1),
(29, 29, 0.8, 8, 'GB', 192, 1536, 18432, 3.06, 23040, 1920, 0, 1),
(30, 30, 0.8, 300, 'GB', 3.2, 960, 11520, 1.92, 14400, 1200, 0, 1),
(31, 31, 0.8, 1, 'Package', 24000, 24000, 288000, 47.88, 360000, 30000, 0, 1),
(32, 32, 0.9, 1, 'agent', 12500, 12500, 150000, 24.94, 166667, 13888.9, 0, 1),
(33, 33, 0.9, 1, 'VM', 10170, 10170, 122040, 20.29, 135600, 11300, 0, 1),
(34, 34, 0.8, 1, 'Package', 40500, 40500, 486000, 11.64, 607500, 50625, 0, 1),
(35, 35, 0.8, 1, 'License', 488, 488, 5856, 0.14, 7320, 610, 0, 1),
(36, 36, 0.8, 1, 'License', 4480, 4480, 53760, 1.29, 67200, 5600, 0, 1),
(37, 37, 0.9, 1, 'agent', 25000, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(38, 38, 0.9, 1, 'agent', 12500, 12500, 150000, 3.59, 166667, 13888.9, 0, 1),
(39, 39, 0.9, 1000, 'Account', 25, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(40, 40, 0.9, 1, 'Package', 240000, 240000, 2880000, 68.97, 3200000, 266667, 0, 1),
(41, 41, 0.8, 1, 'Package', 40000, 40000, 480000, 11.51, 600000, 50000, 0, 1),
(42, 42, 0.8, 1, 'License', 488, 488, 5856, 0.14, 7320, 610, 0, 1),
(43, 43, 0.8, 1, 'License', 4480, 4480, 53760, 1.29, 67200, 5600, 0, 1),
(44, 44, 0.9, 1, 'agent', 25000, 25000, 300000, 7.19, 333333, 27777.8, 0, 1),
(45, 45, 0.9, 1, 'agent', 12500, 12500, 150000, 3.6, 166667, 13888.9, 0, 1),
(46, 46, 0.9, 1000, 'Account', 25, 25000, 300000, 7.19, 333333, 27777.8, 0, 1),
(47, 47, 0.9, 1, 'Package', 240000, 240000, 2880000, 69.07, 3200000, 266667, 0, 1),
(48, 48, 0.8, 1, 'Package', 40000, 40000, 480000, 37.22, 600000, 50000, 0, 1),
(49, 49, 0.8, 1, 'License', 488, 488, 5856, 0.45, 7320, 610, 0, 1),
(50, 50, 0.8, 1, 'License', 4480, 4480, 53760, 4.17, 67200, 5600, 0, 1),
(51, 51, 0.9, 1, 'agent', 25000, 25000, 300000, 23.26, 333333, 27777.8, 0, 1),
(52, 52, 0.9, 1, 'agent', 12500, 12500, 150000, 11.63, 166667, 13888.9, 0, 1),
(53, 53, 0.9, 1000, 'Account', 25, 25000, 300000, 23.26, 333333, 27777.8, 0, 1),
(54, 54, 0.8, 1, 'Package', 40000, 40000, 480000, 37.04, 600000, 50000, 0, 1),
(55, 55, 0.8, 1, 'License', 488, 488, 5856, 0.45, 7320, 610, 0, 1),
(56, 56, 0.8, 1, 'License', 5000, 5000, 60000, 4.63, 75000, 6250, 0, 1),
(57, 57, 0.9, 1, 'agent', 25000, 25000, 300000, 23.15, 333333, 27777.8, 0, 1),
(58, 58, 0.9, 1, 'agent', 12500, 12500, 150000, 11.58, 166667, 13888.9, 0, 1),
(59, 59, 0.9, 1000, 'Account', 25, 25000, 300000, 23.15, 333333, 27777.8, 0, 1),
(60, 60, 0.8, 1, 'License', 488, 488, 5856, 0.74, 7320, 610, 0, 1),
(61, 61, 0.8, 1, 'License', 5100, 5100, 61200, 7.76, 76500, 6375, 0, 1),
(62, 62, 0.9, 1, 'agent', 25000, 25000, 300000, 38.02, 333333, 27777.8, 0, 1),
(63, 63, 0.9, 1000, 'Account', 25, 25000, 300000, 38.02, 333333, 27777.8, 0, 1),
(64, 64, 0.9, 1, 'VM', 10170, 10170, 122040, 15.47, 135600, 11300, 0, 1),
(65, 65, 0.8, 1, 'License', 488, 488, 5856, 0.68, 7320, 610, 0, 1),
(66, 66, 0.8, 1, 'License', 5100, 5100, 61200, 7.12, 76500, 6375, 0, 1),
(67, 67, 0.9, 1, 'agent', 25000, 25000, 300000, 34.92, 333333, 27777.8, 0, 1),
(68, 68, 0.9, 1000, 'Account', 25, 25000, 300000, 34.92, 333333, 27777.8, 0, 1),
(69, 69, 0.9, 1, 'VM', 16000, 16000, 192000, 22.35, 213333, 17777.8, 0, 1),
(70, 70, 0.8, 1, 'License', 488, 488, 5856, 0.25, 7320, 610, 0, 1),
(71, 71, 0.8, 1, 'License', 5100, 5100, 61200, 2.64, 76500, 6375, 0, 1),
(72, 72, 0.9, 1, 'agent', 2500, 2500, 30000, 1.29, 33333.3, 2777.78, 0, 1),
(73, 73, 0.9, 1000, 'Account', 25, 25000, 300000, 12.95, 333333, 27777.8, 0, 1),
(74, 74, 0.9, 1, 'Package', 160000, 160000, 1920000, 82.86, 2133330, 177778, 0, 1),
(75, 75, 0.8, 1, 'License', 488, 488, 5856, 0.26, 7320, 610, 0, 1),
(76, 76, 0.8, 1, 'License', 5100, 5100, 61200, 2.71, 76500, 6375, 0, 1),
(77, 77, 0.9, 1, 'agent', 2500, 2500, 30000, 1.33, 33333.3, 2777.78, 0, 1),
(78, 78, 0.9, 1000, 'Account', 25, 25000, 300000, 13.28, 333333, 27777.8, 0, 1),
(79, 79, 0.9, 1, 'Package', 150000, 150000, 1800000, 79.67, 2000000, 166667, 0, 1),
(80, 80, 0.9, 1, 'License', 5200, 5200, 62400, 2.76, 69333.3, 5777.78, 0, 1),
(81, 81, 0.8, 1, 'License', 488, 488, 5856, 0.23, 7320, 610, 0, 1),
(82, 82, 0.8, 1, 'License', 5100, 5100, 61200, 2.44, 76500, 6375, 0, 1),
(83, 83, 0.9, 1, 'agent', 2500, 2500, 30000, 1.2, 33333.3, 2777.78, 0, 1),
(84, 84, 0.9, 1000, 'Account', 25, 25000, 300000, 11.97, 333333, 27777.8, 0, 1),
(85, 85, 0.9, 1, 'Package', 150000, 150000, 1800000, 71.84, 2000000, 166667, 0, 1),
(86, 86, 0.9, 1, 'License', 5200, 5200, 62400, 2.49, 69333.3, 5777.78, 0, 1),
(87, 87, 0.9, 1, 'Package', 20500, 20500, 246000, 9.82, 273333, 22777.8, 0, 1),
(88, 88, 0.8, 1, 'License', 488, 488, 5856, 0.24, 7320, 610, 0, 1),
(89, 89, 0.8, 1, 'License', 5100, 5100, 61200, 2.48, 76500, 6375, 0, 1),
(90, 90, 0.9, 1, 'agent', 2500, 2500, 30000, 1.22, 33333.3, 2777.78, 0, 1),
(91, 91, 0.9, 1000, 'Account', 25, 25000, 300000, 12.15, 333333, 27777.8, 0, 1),
(92, 92, 0.9, 1, 'Package', 150000, 150000, 1800000, 72.91, 2000000, 166667, 0, 1),
(93, 93, 0.9, 1, 'License', 6000, 6000, 72000, 2.92, 80000, 6666.67, 0, 1),
(94, 94, 0.9, 1, 'VM', 10170, 10170, 122040, 4.94, 135600, 11300, 0, 1),
(95, 95, 0.9, 500, 'GB', 2.7, 1350, 16200, 0.66, 18000, 1500, 0, 1),
(96, 96, 0.9, 1, 'VM', 5130, 5130, 61560, 2.49, 68400, 5700, 0, 1),
(97, 97, 0.8, 4, 'VCPU', 240, 960, 11520, 1.91, 14400, 1200, 0, 1),
(98, 98, 0.8, 8, 'GB', 192, 1536, 18432, 3.05, 23040, 1920, 0, 1),
(99, 99, 0.8, 300, 'GB', 3.2, 960, 11520, 1.91, 14400, 1200, 0, 1),
(100, 100, 0.8, 1, 'Package', 24000, 24000, 288000, 47.72, 360000, 30000, 0, 1),
(101, 101, 0.9, 1, 'agent', 12500, 12500, 150000, 24.85, 166667, 13888.9, 0, 1),
(102, 102, 0.9, 1, 'VM', 10170, 10170, 122040, 20.22, 135600, 11300, 0, 1),
(103, 103, 0.8, 1, 'License', 168, 168, 2016, 0.33, 2520, 210, 0, 1),
(104, 104, 0.8, 4, 'VCPU', 240, 960, 11520, 1.89, 14400, 1200, 0, 1),
(105, 105, 0.8, 8, 'GB', 192, 1536, 18432, 3.02, 23040, 1920, 0, 1),
(106, 106, 0.8, 300, 'GB', 3.2, 960, 11520, 1.89, 14400, 1200, 0, 1),
(107, 107, 0.8, 1, 'Package', 24500, 24500, 294000, 48.23, 367500, 30625, 0, 1),
(108, 108, 0.9, 1, 'agent', 12500, 12500, 150000, 24.61, 166667, 13888.9, 0, 1),
(109, 109, 0.9, 1, 'VM', 10170, 10170, 122040, 20.02, 135600, 11300, 0, 1),
(110, 110, 0.8, 1, 'License', 168, 168, 2016, 0.33, 2520, 210, 0, 1),
(111, 111, 0.8, 4, 'VCPU', 240, 960, 11520, 1.86, 14400, 1200, 0, 1),
(112, 112, 0.8, 8, 'GB', 192, 1536, 18432, 2.98, 23040, 1920, 0, 1),
(113, 113, 0.8, 300, 'GB', 3.2, 960, 11520, 1.86, 14400, 1200, 0, 1),
(114, 114, 0.8, 1, 'Package', 24500, 24500, 294000, 47.46, 367500, 30625, 0, 1),
(115, 115, 0.9, 1, 'agent', 12500, 12500, 150000, 24.21, 166667, 13888.9, 0, 1),
(116, 116, 0.9, 1, 'VM', 11000, 11000, 132000, 21.31, 146667, 12222.2, 0, 1),
(117, 117, 0.8, 1, 'License', 168, 168, 2016, 0.33, 2520, 210, 0, 1),
(118, 118, 0.8, 4, 'VCPU', 240, 960, 11520, 1.4, 14400, 1200, 0, 1),
(119, 119, 0.8, 8, 'GB', 192, 1536, 18432, 2.24, 23040, 1920, 0, 1),
(120, 120, 0.8, 300, 'GB', 3.2, 960, 11520, 1.4, 14400, 1200, 0, 1),
(121, 121, 0.8, 1, 'Package', 24500, 24500, 294000, 35.7, 367500, 30625, 0, 1),
(122, 122, 0.9, 1, 'agent', 12500, 12500, 150000, 18.22, 166667, 13888.9, 0, 1),
(123, 123, 0.9, 1, 'VM', 11000, 11000, 132000, 16.03, 146667, 12222.2, 0, 1),
(124, 124, 0.8, 1, 'License', 168, 168, 2016, 0.24, 2520, 210, 0, 1),
(125, 125, 0.9, 1, 'agent', 17000, 17000, 204000, 24.77, 226667, 18888.9, 0, 1),
(126, 126, 0.9, 2, 'Package', 160000, 320000, 3840000, 30.07, 4266670, 355556, 0, 1),
(127, 127, 0.9, 3, 'Package', 240000, 720000, 8640000, 67.65, 9600000, 800000, 0, 1),
(128, 128, 0.8, 1, 'Package', 24000, 24000, 288000, 2.25, 360000, 30000, 0, 1),
(129, 129, 0.8, 200, 'GB', 1.6, 320, 3840, 0.03, 4800, 400, 0, 1),
(130, 130, 0.8, 1, 'Package', 40480, 40480, 485760, 98.06, 607200, 50600, 0, 1),
(131, 131, 0.8, 500, 'GB', 1.6, 800, 9600, 1.94, 12000, 1000, 0, 1),
(132, 132, 0.8, 1, 'Package', 40480, 40480, 485760, 78.68, 607200, 50600, 0, 1),
(133, 133, 0.8, 500, 'GB', 1.6, 800, 9600, 1.55, 12000, 1000, 0, 1),
(134, 134, 0.9, 1, 'VM', 10170, 10170, 122040, 19.77, 135600, 11300, 0, 1),
(135, 135, 0.8, 1, 'Package', 40000, 40000, 480000, 78.48, 600000, 50000, 0, 1),
(136, 136, 0.8, 500, 'GB', 1.6, 800, 9600, 1.57, 12000, 1000, 0, 1),
(137, 137, 0.9, 1, 'VM', 10170, 10170, 122040, 19.95, 135600, 11300, 0, 1),
(138, 138, 0.8, 4, 'VCPU', 240, 960, 11520, 1.4, 14400, 1200, 0, 1),
(139, 139, 0.8, 8, 'GB', 192, 1536, 18432, 2.24, 23040, 1920, 0, 1),
(140, 140, 0.8, 300, 'GB', 3.2, 960, 11520, 1.4, 14400, 1200, 0, 1),
(141, 141, 0.8, 1, 'Package', 24500, 24500, 294000, 35.7, 367500, 30625, 0, 1),
(142, 142, 0.9, 1, 'agent', 12500, 12500, 150000, 18.22, 166667, 13888.9, 0, 1),
(143, 143, 0.9, 1, 'VM', 11000, 11000, 132000, 16.03, 146667, 12222.2, 0, 1),
(144, 144, 0.8, 1, 'License', 168, 168, 2016, 0.24, 2520, 210, 0, 1),
(145, 145, 0.9, 1, 'agent', 17000, 17000, 204000, 24.77, 226667, 18888.9, 0, 1),
(146, 146, 0.8, 2, 'Package', 19680, 39360, 472320, 26.71, 590400, 49200, 0, 1),
(147, 147, 0.9, 4, 'agent', 27000, 108000, 1296000, 73.29, 1440000, 120000, 0, 1),
(148, 148, 0.8, 8, 'GB', 192, 1536, 18432, 3.23, 23040, 1920, 0, 1),
(149, 149, 0.8, 300, 'GB', 3.2, 960, 11520, 2.02, 14400, 1200, 0, 1),
(150, 150, 0.9, 1, 'agent', 12500, 12500, 150000, 26.28, 166667, 13888.9, 0, 1),
(151, 151, 0.9, 1, 'VM', 11000, 11000, 132000, 23.13, 146667, 12222.2, 0, 1),
(152, 152, 0.8, 1, 'License', 168, 168, 2016, 0.35, 2520, 210, 0, 1),
(153, 153, 0.9, 1, 'agent', 17000, 17000, 204000, 35.74, 226667, 18888.9, 0, 1),
(154, 154, 0.8, 1, 'VM', 4400, 4400, 52800, 9.25, 66000, 5500, 0, 1),
(155, 155, 0.8, 2, 'Package', 19680, 39360, 472320, 24.09, 590400, 49200, 0, 1),
(156, 156, 0.9, 4, 'agent', 27000, 108000, 1296000, 66.11, 1440000, 120000, 0, 1),
(157, 157, 0.9, 1, 'VM', 16000, 16000, 192000, 9.79, 213333, 17777.8, 0, 1),
(158, 158, 0.8, 8, 'GB', 192, 1536, 18432, 3.23, 23040, 1920, 0, 1),
(159, 159, 0.8, 300, 'GB', 3.2, 960, 11520, 2.02, 14400, 1200, 0, 1),
(160, 160, 0.9, 1, 'agent', 12500, 12500, 150000, 26.28, 166667, 13888.9, 0, 1),
(161, 161, 0.9, 1, 'VM', 11000, 11000, 132000, 23.13, 146667, 12222.2, 0, 1),
(162, 162, 0.8, 1, 'License', 170, 170, 2040, 0.36, 2550, 212.5, 0, 1),
(163, 163, 0.9, 1, 'agent', 17000, 17000, 204000, 35.74, 226667, 18888.9, 0, 1),
(164, 164, 0.8, 1, 'VM', 4400, 4400, 52800, 9.25, 66000, 5500, 0, 1),
(165, 165, 0.8, 8, 'GB', 192, 1536, 18432, 3.24, 23040, 1920, 0, 1),
(166, 166, 0.8, 300, 'GB', 2.5, 750, 9000, 1.58, 11250, 937.5, 0, 1),
(167, 167, 0.9, 1, 'agent', 12500, 12500, 150000, 26.4, 166667, 13888.9, 0, 1),
(168, 168, 0.9, 1, 'VM', 11000, 11000, 132000, 23.23, 146667, 12222.2, 0, 1),
(169, 169, 0.8, 1, 'License', 170, 170, 2040, 0.36, 2550, 212.5, 0, 1),
(170, 170, 0.9, 1, 'agent', 17000, 17000, 204000, 35.9, 226667, 18888.9, 0, 1),
(171, 171, 0.8, 1, 'VM', 4400, 4400, 52800, 9.29, 66000, 5500, 0, 1),
(172, 172, 0.8, 8, 'GB', 192, 1536, 18432, 3.24, 23040, 1920, 0, 1),
(173, 173, 0.8, 300, 'GB', 2.5, 750, 9000, 1.58, 11250, 937.5, 0, 1),
(174, 174, 0.9, 1, 'agent', 12500, 12500, 150000, 26.4, 166667, 13888.9, 0, 1),
(175, 175, 0.9, 1, 'VM', 11000, 11000, 132000, 23.23, 146667, 12222.2, 0, 1),
(176, 176, 0.8, 1, 'License', 170, 170, 2040, 0.36, 2550, 212.5, 0, 1),
(177, 177, 0.9, 1, 'agent', 17000, 17000, 204000, 35.9, 226667, 18888.9, 0, 1),
(178, 178, 0.8, 1, 'VM', 4400, 4400, 52800, 9.29, 66000, 5500, 0, 1),
(179, 179, 0.8, 8, 'GB', 192, 1536, 18432, 3.5, 23040, 1920, 0, 1),
(180, 180, 0.8, 300, 'GB', 2.5, 750, 9000, 1.71, 11250, 937.5, 0, 1),
(181, 181, 0.9, 1, 'agent', 10000, 10000, 120000, 22.8, 133333, 11111.1, 0, 1),
(182, 182, 0.9, 1, 'VM', 10000, 10000, 120000, 22.8, 133333, 11111.1, 0, 1),
(183, 183, 0.8, 1, 'License', 170, 170, 2040, 0.39, 2550, 212.5, 0, 1),
(184, 184, 0.9, 1, 'agent', 17000, 17000, 204000, 38.76, 226667, 18888.9, 0, 1),
(185, 185, 0.8, 1, 'VM', 4400, 4400, 52800, 10.03, 66000, 5500, 0, 1),
(186, 186, 0.9, 1, 'agent', 25000, 25000, 300000, 29.75, 333333, 27777.8, 0, 1),
(187, 187, 0.9, 1, 'agent', 12500, 12500, 150000, 14.88, 166667, 13888.9, 0, 1),
(188, 188, 0.9, 1, 'VM', 16000, 16000, 192000, 19.04, 213333, 17777.8, 0, 1),
(189, 189, 0.9, 1, 'Time', 27000, 27000, 324000, 32.14, 360000, 30000, 0, 1),
(190, 190, 0.8, 1, 'VM', 1440, 1440, 17280, 1.71, 21600, 1800, 0, 1),
(191, 191, 0.8, 1, 'VM', 2080, 2080, 24960, 2.48, 31200, 2600, 0, 1),
(192, 192, 0.8, 1, 'Project', 20000, 20000, 20000, 20.6, 25000, 2083.33, 1, 1),
(193, 193, 0.8, 1, 'Project', 1600, 1600, 19200, 19.78, 24000, 2000, 0, 1),
(194, 194, 0.8, 1, 'Project', 4824, 4824, 57888, 59.62, 72360, 6030, 0, 1),
(204, 204, 0.9, 1, 'agent', 25000, 25000, 300000, 66.67, 333333, 27777.8, 0, 1),
(205, 205, 0.9, 1, 'agent', 12500, 12500, 150000, 33.33, 166667, 13888.9, 0, 1),
(206, 206, 0.9, 1, 'VM', 10170, 10170, 122040, 66.47, 135600, 11300, 0, 1),
(207, 207, 0.9, 1, 'VM', 5130, 5130, 61560, 33.53, 68400, 5700, 0, 1),
(208, 208, 0.9, 1, 'Package', 160000, 160000, 1920000, 40, 2133330, 177778, 0, 1),
(209, 209, 0.9, 1, 'Package', 240000, 240000, 2880000, 60, 3200000, 266667, 0, 1),
(210, 210, 0.8, 1, 'Project', 6400, 6400, 6400, 16.33, 8000, 666.67, 1, 1),
(211, 211, 0.8, 1, 'Project', 12800, 12800, 12800, 32.65, 16000, 1333.33, 1, 1),
(212, 212, 0.8, 1, 'Project', 20000, 20000, 20000, 51.02, 25000, 2083.33, 1, 1),
(224, 224, 0.8, 1, 'Package', 24000, 24000, 288000, 54.95, 360000, 30000, 0, 1),
(225, 225, 0.8, 1, 'Package', 19680, 19680, 236160, 45.05, 295200, 24600, 0, 1),
(228, 228, 0.9, 1, 'Package', 160000, 160000, 1920000, 40, 2133330, 177778, 0, 1),
(229, 229, 0.9, 1, 'Package', 240000, 240000, 2880000, 60, 3200000, 266667, 0, 1),
(230, 230, 0.9, 1, 'agent', 25000, 25000, 300000, 66.67, 333333, 27777.8, 0, 1),
(231, 231, 0.9, 1, 'agent', 12500, 12500, 150000, 33.33, 166667, 13888.9, 0, 1),
(232, 232, 0.9, 1, 'Package', 160000, 160000, 1920000, 40, 2133330, 177778, 0, 1),
(233, 233, 0.9, 1, 'Package', 240000, 240000, 2880000, 60, 3200000, 266667, 0, 1),
(240, 240, 0.9, 1, 'VM', 10170, 10170, 122040, 56.78, 135600, 11300, 0, 1),
(241, 241, 0.9, 1, 'VM', 5130, 5130, 61560, 28.64, 68400, 5700, 0, 1),
(242, 242, 0.9, 1, 'VM', 2610, 2610, 31320, 14.57, 34800, 2900, 0, 1),
(243, 243, 0.9, 1, 'VM', 10170, 10170, 122040, 18.35, 135600, 11300, 0, 1),
(244, 244, 0.9, 1, 'VM', 5130, 5130, 61560, 9.26, 68400, 5700, 0, 1),
(245, 245, 0.9, 1, 'VM', 2610, 2610, 31320, 4.71, 34800, 2900, 0, 1),
(246, 246, 0.9, 1, 'agent', 25000, 25000, 300000, 45.12, 333333, 27777.8, 0, 1),
(247, 247, 0.9, 1, 'agent', 12500, 12500, 150000, 22.56, 166667, 13888.9, 0, 1),
(248, 248, 0.9, 1, 'VM', 10170, 10170, 122040, 18.35, 135600, 11300, 0, 1),
(249, 249, 0.9, 1, 'VM', 5130, 5130, 61560, 9.26, 68400, 5700, 0, 1),
(250, 250, 0.9, 1, 'VM', 2610, 2610, 31320, 4.71, 34800, 2900, 0, 1),
(251, 251, 0.9, 1, 'agent', 25000, 25000, 300000, 45.12, 333333, 27777.8, 0, 1),
(252, 252, 0.9, 1, 'agent', 12500, 12500, 150000, 22.56, 166667, 13888.9, 0, 1),
(253, 253, 0.9, 1, 'VM', 10170, 10170, 122040, 18.37, 135600, 11300, 0, 1),
(254, 254, 0.9, 1, 'VM', 5100, 5100, 61200, 9.21, 68000, 5666.67, 0, 1),
(255, 255, 0.9, 1, 'VM', 2600, 2600, 31200, 4.7, 34666.7, 2888.89, 0, 1),
(256, 256, 0.9, 1, 'agent', 25000, 25000, 300000, 45.15, 333333, 27777.8, 0, 1),
(257, 257, 0.9, 1, 'agent', 12500, 12500, 150000, 22.58, 166667, 13888.9, 0, 1),
(279, 279, 0.8, 6, 'VM', 4400, 26400, 316800, 26.79, 396000, 33000, 0, 1),
(280, 280, 0.8, 16, 'VCPU', 240, 3840, 46080, 3.9, 57600, 4800, 0, 1),
(281, 281, 0.8, 48, 'GB', 192, 9216, 110592, 9.35, 138240, 11520, 0, 1),
(282, 282, 0.8, 1200, 'GB', 3.2, 3840, 46080, 3.9, 57600, 4800, 0, 1),
(283, 283, 0.8, 6, 'IP', 80, 480, 5760, 0.49, 7200, 600, 0, 1),
(284, 284, 0.8, 6, 'License', 488, 2928, 35136, 2.97, 43920, 3660, 0, 1),
(285, 285, 0.8, 6, 'License', 8640, 51840, 622080, 52.61, 777600, 64800, 0, 1),
(286, 286, 0.8, 6, 'VM', 4400, 26400, 316800, 26.28, 396000, 33000, 0, 1),
(287, 287, 0.8, 16, 'VCPU', 240, 3840, 46080, 3.82, 57600, 4800, 0, 1),
(288, 288, 0.8, 48, 'GB', 192, 9216, 110592, 9.17, 138240, 11520, 0, 1),
(289, 289, 0.8, 1200, 'GB', 3, 3600, 43200, 3.58, 54000, 4500, 0, 1),
(290, 290, 0.8, 6, 'IP', 80, 480, 5760, 0.48, 7200, 600, 0, 1),
(291, 291, 0.8, 6, 'License', 488, 2928, 35136, 2.91, 43920, 3660, 0, 1),
(292, 292, 0.8, 6, 'License', 9000, 54000, 648000, 53.75, 810000, 67500, 0, 1),
(293, 293, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(294, 294, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(295, 295, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(296, 296, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(297, 297, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(298, 298, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(299, 299, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(300, 300, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(301, 301, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(302, 302, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(303, 303, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(304, 304, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(305, 305, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(306, 306, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(307, 307, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(308, 308, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(309, 309, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(310, 310, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(311, 311, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(312, 312, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(313, 313, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(314, 314, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(315, 315, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(316, 316, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(317, 317, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(318, 318, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(319, 319, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(320, 320, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(321, 321, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(322, 322, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(323, 323, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(324, 324, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(325, 325, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(326, 326, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(327, 327, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(328, 328, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(329, 329, 0.9, 1, 'Package', 160000, 160000, 1920000, 11.11, 2133330, 177778, 0, 1),
(330, 330, 0.9, 1, 'Package', 240000, 240000, 2880000, 16.67, 3200000, 266667, 0, 1),
(331, 331, 0.9, 1, 'Package', 320000, 320000, 3840000, 22.22, 4266670, 355556, 0, 1),
(332, 332, 0.9, 2, 'Package', 360000, 720000, 8640000, 50, 9600000, 800000, 0, 1),
(333, 333, 0.9, 1, 'Package', 160000, 160000, 1920000, 11.11, 2133330, 177778, 0, 1),
(334, 334, 0.9, 1, 'Package', 240000, 240000, 2880000, 16.67, 3200000, 266667, 0, 1),
(335, 335, 0.9, 1, 'Package', 320000, 320000, 3840000, 22.22, 4266670, 355556, 0, 1),
(336, 336, 0.9, 2, 'Package', 360000, 720000, 8640000, 50, 9600000, 800000, 0, 1),
(337, 337, 0.9, 1, 'VM', 10170, 10170, 122040, 37.36, 135600, 11300, 0, 1),
(338, 338, 0.9, 1, 'VM', 5130, 5130, 61560, 18.85, 68400, 5700, 0, 1),
(339, 339, 0.9, 1, 'VM', 2610, 2610, 31320, 9.59, 34800, 2900, 0, 1),
(340, 340, 0.8, 1, 'VM', 4400, 4400, 52800, 16.16, 66000, 5500, 0, 1),
(341, 341, 0.8, 4, 'VCPU', 240, 960, 11520, 3.53, 14400, 1200, 0, 1),
(342, 342, 0.8, 16, 'GB', 192, 3072, 36864, 11.28, 46080, 3840, 0, 1),
(343, 343, 0.8, 250, 'GB', 3.2, 800, 9600, 2.94, 12000, 1000, 0, 1),
(344, 344, 0.8, 1, 'IP', 80, 80, 960, 0.29, 1200, 100, 0, 1),
(345, 345, 0.9, 1, 'agent', 25000, 25000, 300000, 66.67, 333333, 27777.8, 0, 1),
(346, 346, 0.9, 1, 'agent', 12500, 12500, 150000, 33.33, 166667, 13888.9, 0, 1),
(347, 347, 0.9, 1, 'agent', 25000, 25000, 300000, 66.67, 333333, 27777.8, 0, 1),
(348, 348, 0.9, 1, 'agent', 12500, 12500, 150000, 33.33, 166667, 13888.9, 0, 1),
(349, 349, 0.8, 2, 'VM', 4400, 8800, 105600, 100, 132000, 11000, 0, 1),
(350, 350, 0.8, 1, 'Project', 200000, 200000, 2400000, 96.24, 3000000, 250000, 0, 1),
(351, 351, 0.8, 2, 'IP', 80, 160, 1920, 0.08, 2400, 200, 0, 1),
(352, 352, 0.8, 2, 'VM', 536, 1072, 12864, 0.52, 16080, 1340, 0, 1),
(353, 353, 0.8, 500, 'GB', 3.2, 1600, 19200, 0.77, 24000, 2000, 0, 1),
(354, 354, 0.8, 16, 'GB', 192, 3072, 36864, 1.48, 46080, 3840, 0, 1),
(355, 355, 0.8, 8, 'VCPU', 240, 1920, 23040, 0.92, 28800, 2400, 0, 1),
(356, 356, 0.8, 4, 'VM', 2080, 8320, 99840, 13.68, 124800, 10400, 0, 1),
(357, 357, 0.8, 4, 'License', 4480, 17920, 215040, 29.47, 268800, 22400, 0, 1),
(358, 358, 0.8, 4, 'License', 8640, 34560, 414720, 56.84, 518400, 43200, 0, 1),
(359, 359, 0.9, 1, 'agent', 25000, 25000, 300000, 63.83, 333333, 27777.8, 0, 1),
(360, 360, 0.9, 1, 'agent', 12500, 12500, 150000, 31.91, 166667, 13888.9, 0, 1),
(361, 361, 0.8, 1, 'Project', 20000, 20000, 20000, 4.26, 25000, 2083.33, 1, 1),
(362, 362, 0.9, 1, 'agent', 25000, 25000, 300000, 9.27, 333333, 27777.8, 0, 1),
(363, 363, 0.9, 1, 'agent', 12500, 12500, 150000, 4.64, 166667, 13888.9, 0, 1),
(364, 364, 0.8, 1, 'Project', 20000, 20000, 20000, 0.62, 25000, 2083.33, 1, 1),
(365, 365, 0.8, 4, 'Rack', 23680, 94720, 1136640, 35.14, 1420800, 118400, 0, 1),
(366, 366, 0.8, 4, 'Rack', 33920, 135680, 1628160, 50.33, 2035200, 169600, 0, 1),
(367, 367, 0.9, 1, 'agent', 25000, 25000, 300000, 9.22, 333333, 27777.8, 0, 1),
(368, 368, 0.9, 1, 'agent', 12500, 12500, 150000, 4.61, 166667, 13888.9, 0, 1),
(369, 369, 0.8, 1, 'Project', 20000, 20000, 20000, 0.61, 25000, 2083.33, 1, 1),
(370, 370, 0.8, 4, 'Rack', 23680, 94720, 1136640, 34.95, 1420800, 118400, 0, 1),
(371, 371, 0.8, 4, 'Rack', 33920, 135680, 1628160, 50.07, 2035200, 169600, 0, 1),
(372, 372, 0.8, 1, 'VM', 1440, 1440, 17280, 0.53, 21600, 1800, 0, 1),
(373, 373, 0.9, 1, 'agent', 25000, 25000, 300000, 9.27, 333333, 27777.8, 0, 1),
(374, 374, 0.9, 1, 'agent', 12500, 12500, 150000, 4.64, 166667, 13888.9, 0, 1),
(375, 375, 0.8, 1, 'Project', 20000, 20000, 20000, 0.62, 25000, 2083.33, 1, 1),
(376, 376, 0.8, 4, 'Rack', 23680, 94720, 1136640, 35.14, 1420800, 118400, 0, 1),
(377, 377, 0.8, 4, 'Rack', 33920, 135680, 1628160, 50.33, 2035200, 169600, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_item_price_old`
--

CREATE TABLE `bom_item_price_old` (
  `id` int(11) NOT NULL,
  `id_bom_item_old` int(11) NOT NULL,
  `item_ratio_engcost` float DEFAULT NULL,
  `item_unit_amount` int(11) NOT NULL,
  `item_unit` varchar(20) DEFAULT NULL,
  `item_unit_price` float DEFAULT NULL,
  `item_amount_price` float DEFAULT NULL,
  `item_actualcost` float DEFAULT NULL,
  `item_ratio_actualcost` float DEFAULT NULL,
  `item_engcost` float DEFAULT NULL,
  `item_engcost_month` float DEFAULT NULL,
  `onetime` tinyint(1) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_item_price_old`
--

INSERT INTO `bom_item_price_old` (`id`, `id_bom_item_old`, `item_ratio_engcost`, `item_unit_amount`, `item_unit`, `item_unit_price`, `item_amount_price`, `item_actualcost`, `item_ratio_actualcost`, `item_engcost`, `item_engcost_month`, `onetime`, `inuse`) VALUES
(13, 15, 0.8, 4, 'VCPU', 240, 960, 11520, 3.5, 14400, 1200, 0, 1),
(14, 16, 0.8, 8, 'GB', 192, 1536, 18432, 5.59, 23040, 1920, 0, 1),
(15, 17, 0.8, 300, 'GB', 3.2, 960, 11520, 3.5, 14400, 1200, 0, 1),
(16, 18, 0.8, 1, 'Package', 24000, 24000, 288000, 87.41, 360000, 30000, 0, 1),
(17, 19, 0.8, 1, 'Package', 40480, 40480, 485760, 37.5, 607200, 50600, 0, 1),
(18, 20, 0.8, 1, 'License', 488, 488, 5856, 0.45, 7320, 610, 0, 1),
(19, 21, 0.8, 1, 'License', 4480, 4480, 53760, 4.15, 67200, 5600, 0, 1),
(20, 22, 0.9, 1, 'agent', 25000, 25000, 300000, 23.16, 333333, 27777.8, 0, 1),
(21, 23, 0.9, 1, 'agent', 12500, 12500, 150000, 11.58, 166667, 13888.9, 0, 1),
(22, 24, 0.9, 1000, 'Account', 25, 25000, 300000, 23.16, 333333, 27777.8, 0, 1),
(23, 25, 0.8, 4, 'VCPU', 240, 960, 11520, 2.4, 14400, 1200, 0, 1),
(24, 26, 0.8, 8, 'GB', 192, 1536, 18432, 3.84, 23040, 1920, 0, 1),
(25, 27, 0.8, 300, 'GB', 3.2, 960, 11520, 2.4, 14400, 1200, 0, 1),
(26, 28, 0.8, 1, 'Package', 24000, 24000, 288000, 60.07, 360000, 30000, 0, 1),
(27, 29, 0.9, 1, 'agent', 12500, 12500, 150000, 31.28, 166667, 13888.9, 0, 1),
(28, 30, 0.8, 1, 'Package', 40480, 40480, 485760, 11.63, 607200, 50600, 0, 1),
(29, 31, 0.8, 1, 'License', 488, 488, 5856, 0.14, 7320, 610, 0, 1),
(30, 32, 0.8, 1, 'License', 4480, 4480, 53760, 1.29, 67200, 5600, 0, 1),
(31, 33, 0.9, 1, 'agent', 25000, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(32, 34, 0.9, 1, 'agent', 12500, 12500, 150000, 3.59, 166667, 13888.9, 0, 1),
(33, 35, 0.9, 1000, 'Account', 25, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(34, 36, 0.9, 1, 'Package', 240000, 240000, 2880000, 68.98, 3200000, 266667, 0, 1),
(35, 37, 0.8, 1, 'Package', 40500, 40500, 486000, 11.64, 607500, 50625, 0, 1),
(36, 38, 0.8, 1, 'License', 488, 488, 5856, 0.14, 7320, 610, 0, 1),
(37, 39, 0.8, 1, 'License', 4480, 4480, 53760, 1.29, 67200, 5600, 0, 1),
(38, 40, 0.9, 1, 'agent', 25000, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(39, 41, 0.9, 1, 'agent', 12500, 12500, 150000, 3.59, 166667, 13888.9, 0, 1),
(40, 42, 0.9, 1000, 'Account', 25, 25000, 300000, 7.18, 333333, 27777.8, 0, 1),
(41, 43, 0.9, 1, 'Package', 240000, 240000, 2880000, 68.97, 3200000, 266667, 0, 1),
(42, 44, 0.8, 1, 'Package', 40000, 40000, 480000, 11.51, 600000, 50000, 0, 1),
(43, 45, 0.8, 1, 'License', 488, 488, 5856, 0.14, 7320, 610, 0, 1),
(44, 46, 0.8, 1, 'License', 4480, 4480, 53760, 1.29, 67200, 5600, 0, 1),
(45, 47, 0.9, 1, 'agent', 25000, 25000, 300000, 7.19, 333333, 27777.8, 0, 1),
(46, 48, 0.9, 1, 'agent', 12500, 12500, 150000, 3.6, 166667, 13888.9, 0, 1),
(47, 49, 0.9, 1000, 'Account', 25, 25000, 300000, 7.19, 333333, 27777.8, 0, 1),
(48, 50, 0.9, 1, 'Package', 240000, 240000, 2880000, 69.07, 3200000, 266667, 0, 1),
(49, 51, 0.8, 1, 'Package', 40000, 40000, 480000, 37.22, 600000, 50000, 0, 1),
(50, 52, 0.8, 1, 'License', 488, 488, 5856, 0.45, 7320, 610, 0, 1),
(51, 53, 0.8, 1, 'License', 4480, 4480, 53760, 4.17, 67200, 5600, 0, 1),
(52, 54, 0.9, 1, 'agent', 25000, 25000, 300000, 23.26, 333333, 27777.8, 0, 1),
(53, 55, 0.9, 1, 'agent', 12500, 12500, 150000, 11.63, 166667, 13888.9, 0, 1),
(54, 56, 0.9, 1000, 'Account', 25, 25000, 300000, 23.26, 333333, 27777.8, 0, 1),
(55, 57, 0.8, 1, 'Package', 40000, 40000, 480000, 37.04, 600000, 50000, 0, 1),
(56, 58, 0.8, 1, 'License', 488, 488, 5856, 0.45, 7320, 610, 0, 1),
(57, 59, 0.8, 1, 'License', 5000, 5000, 60000, 4.63, 75000, 6250, 0, 1),
(58, 60, 0.9, 1, 'agent', 25000, 25000, 300000, 23.15, 333333, 27777.8, 0, 1),
(59, 61, 0.9, 1, 'agent', 12500, 12500, 150000, 11.58, 166667, 13888.9, 0, 1),
(60, 62, 0.9, 1000, 'Account', 25, 25000, 300000, 23.15, 333333, 27777.8, 0, 1),
(61, 63, 0.8, 1, 'License', 488, 488, 5856, 0.74, 7320, 610, 0, 1),
(62, 64, 0.8, 1, 'License', 5100, 5100, 61200, 7.76, 76500, 6375, 0, 1),
(63, 65, 0.9, 1, 'agent', 25000, 25000, 300000, 38.02, 333333, 27777.8, 0, 1),
(64, 66, 0.9, 1000, 'Account', 25, 25000, 300000, 38.02, 333333, 27777.8, 0, 1),
(65, 67, 0.9, 1, 'VM', 10170, 10170, 122040, 15.47, 135600, 11300, 0, 1),
(66, 68, 0.8, 1, 'License', 488, 488, 5856, 0.68, 7320, 610, 0, 1),
(67, 69, 0.8, 1, 'License', 5100, 5100, 61200, 7.12, 76500, 6375, 0, 1),
(68, 70, 0.9, 1, 'agent', 25000, 25000, 300000, 34.92, 333333, 27777.8, 0, 1),
(69, 71, 0.9, 1000, 'Account', 25, 25000, 300000, 34.92, 333333, 27777.8, 0, 1),
(70, 72, 0.9, 1, 'VM', 16000, 16000, 192000, 22.35, 213333, 17777.8, 0, 1),
(71, 73, 0.8, 1, 'License', 488, 488, 5856, 0.25, 7320, 610, 0, 1),
(72, 74, 0.8, 1, 'License', 5100, 5100, 61200, 2.64, 76500, 6375, 0, 1),
(73, 75, 0.9, 1, 'agent', 2500, 2500, 30000, 1.29, 33333.3, 2777.78, 0, 1),
(74, 76, 0.9, 1000, 'Account', 25, 25000, 300000, 12.95, 333333, 27777.8, 0, 1),
(75, 77, 0.9, 1, 'Package', 160000, 160000, 1920000, 82.86, 2133330, 177778, 0, 1),
(76, 78, 0.8, 1, 'License', 488, 488, 5856, 0.26, 7320, 610, 0, 1),
(77, 79, 0.8, 1, 'License', 5100, 5100, 61200, 2.71, 76500, 6375, 0, 1),
(78, 80, 0.9, 1, 'agent', 2500, 2500, 30000, 1.33, 33333.3, 2777.78, 0, 1),
(79, 81, 0.9, 1000, 'Account', 25, 25000, 300000, 13.28, 333333, 27777.8, 0, 1),
(80, 82, 0.9, 1, 'Package', 150000, 150000, 1800000, 79.67, 2000000, 166667, 0, 1),
(81, 83, 0.9, 1, 'License', 5200, 5200, 62400, 2.76, 69333.3, 5777.78, 0, 1),
(82, 84, 0.8, 1, 'License', 488, 488, 5856, 0.23, 7320, 610, 0, 1),
(83, 85, 0.8, 1, 'License', 5100, 5100, 61200, 2.44, 76500, 6375, 0, 1),
(84, 86, 0.9, 1, 'agent', 2500, 2500, 30000, 1.2, 33333.3, 2777.78, 0, 1),
(85, 87, 0.9, 1000, 'Account', 25, 25000, 300000, 11.97, 333333, 27777.8, 0, 1),
(86, 88, 0.9, 1, 'Package', 150000, 150000, 1800000, 71.84, 2000000, 166667, 0, 1),
(87, 89, 0.9, 1, 'License', 5200, 5200, 62400, 2.49, 69333.3, 5777.78, 0, 1),
(88, 90, 0.9, 1, 'Package', 20500, 20500, 246000, 9.82, 273333, 22777.8, 0, 1),
(89, 91, 0.8, 4, 'VCPU', 240, 960, 11520, 1.92, 14400, 1200, 0, 1),
(90, 92, 0.8, 8, 'GB', 192, 1536, 18432, 3.06, 23040, 1920, 0, 1),
(91, 93, 0.8, 300, 'GB', 3.2, 960, 11520, 1.92, 14400, 1200, 0, 1),
(92, 94, 0.8, 1, 'Package', 24000, 24000, 288000, 47.88, 360000, 30000, 0, 1),
(93, 95, 0.9, 1, 'agent', 12500, 12500, 150000, 24.94, 166667, 13888.9, 0, 1),
(94, 96, 0.9, 1, 'VM', 10170, 10170, 122040, 20.29, 135600, 11300, 0, 1),
(95, 97, 0.8, 4, 'VCPU', 240, 960, 11520, 1.91, 14400, 1200, 0, 1),
(96, 98, 0.8, 8, 'GB', 192, 1536, 18432, 3.05, 23040, 1920, 0, 1),
(97, 99, 0.8, 300, 'GB', 3.2, 960, 11520, 1.91, 14400, 1200, 0, 1),
(98, 100, 0.8, 1, 'Package', 24000, 24000, 288000, 47.72, 360000, 30000, 0, 1),
(99, 101, 0.9, 1, 'agent', 12500, 12500, 150000, 24.85, 166667, 13888.9, 0, 1),
(100, 102, 0.9, 1, 'VM', 10170, 10170, 122040, 20.22, 135600, 11300, 0, 1),
(101, 103, 0.8, 1, 'License', 168, 168, 2016, 0.33, 2520, 210, 0, 1),
(102, 104, 0.8, 4, 'VCPU', 240, 960, 11520, 1.89, 14400, 1200, 0, 1),
(103, 105, 0.8, 8, 'GB', 192, 1536, 18432, 3.02, 23040, 1920, 0, 1),
(104, 106, 0.8, 300, 'GB', 3.2, 960, 11520, 1.89, 14400, 1200, 0, 1),
(105, 107, 0.8, 1, 'Package', 24500, 24500, 294000, 48.23, 367500, 30625, 0, 1),
(106, 108, 0.9, 1, 'agent', 12500, 12500, 150000, 24.61, 166667, 13888.9, 0, 1),
(107, 109, 0.9, 1, 'VM', 10170, 10170, 122040, 20.02, 135600, 11300, 0, 1),
(108, 110, 0.8, 1, 'License', 168, 168, 2016, 0.33, 2520, 210, 0, 1),
(109, 111, 0.8, 4, 'VCPU', 240, 960, 11520, 1.86, 14400, 1200, 0, 1),
(110, 112, 0.8, 8, 'GB', 192, 1536, 18432, 2.98, 23040, 1920, 0, 1),
(111, 113, 0.8, 300, 'GB', 3.2, 960, 11520, 1.86, 14400, 1200, 0, 1),
(112, 114, 0.8, 1, 'Package', 24500, 24500, 294000, 47.46, 367500, 30625, 0, 1),
(113, 115, 0.9, 1, 'agent', 12500, 12500, 150000, 24.21, 166667, 13888.9, 0, 1),
(114, 116, 0.9, 1, 'VM', 11000, 11000, 132000, 21.31, 146667, 12222.2, 0, 1),
(115, 117, 0.8, 1, 'License', 168, 168, 2016, 0.33, 2520, 210, 0, 1),
(116, 118, 0.8, 1, 'Package', 40480, 40480, 485760, 98.06, 607200, 50600, 0, 1),
(117, 119, 0.8, 500, 'GB', 1.6, 800, 9600, 1.94, 12000, 1000, 0, 1),
(118, 120, 0.8, 1, 'Package', 40480, 40480, 485760, 78.68, 607200, 50600, 0, 1),
(119, 121, 0.8, 500, 'GB', 1.6, 800, 9600, 1.55, 12000, 1000, 0, 1),
(120, 122, 0.9, 1, 'VM', 10170, 10170, 122040, 19.77, 135600, 11300, 0, 1),
(121, 123, 0.8, 4, 'VCPU', 240, 960, 11520, 1.4, 14400, 1200, 0, 1),
(122, 124, 0.8, 8, 'GB', 192, 1536, 18432, 2.24, 23040, 1920, 0, 1),
(123, 125, 0.8, 300, 'GB', 3.2, 960, 11520, 1.4, 14400, 1200, 0, 1),
(124, 126, 0.8, 1, 'Package', 24500, 24500, 294000, 35.7, 367500, 30625, 0, 1),
(125, 127, 0.9, 1, 'agent', 12500, 12500, 150000, 18.22, 166667, 13888.9, 0, 1),
(126, 128, 0.9, 1, 'VM', 11000, 11000, 132000, 16.03, 146667, 12222.2, 0, 1),
(127, 129, 0.8, 1, 'License', 168, 168, 2016, 0.24, 2520, 210, 0, 1),
(128, 130, 0.9, 1, 'agent', 17000, 17000, 204000, 24.77, 226667, 18888.9, 0, 1),
(129, 131, 0.8, 4, 'VCPU', 240, 960, 11520, 1.4, 14400, 1200, 0, 1),
(130, 132, 0.8, 8, 'GB', 192, 1536, 18432, 2.24, 23040, 1920, 0, 1),
(131, 133, 0.8, 300, 'GB', 3.2, 960, 11520, 1.4, 14400, 1200, 0, 1),
(132, 134, 0.8, 1, 'Package', 24500, 24500, 294000, 35.7, 367500, 30625, 0, 1),
(133, 135, 0.9, 1, 'agent', 12500, 12500, 150000, 18.22, 166667, 13888.9, 0, 1),
(134, 136, 0.9, 1, 'VM', 11000, 11000, 132000, 16.03, 146667, 12222.2, 0, 1),
(135, 137, 0.8, 1, 'License', 168, 168, 2016, 0.24, 2520, 210, 0, 1),
(136, 138, 0.9, 1, 'agent', 17000, 17000, 204000, 24.77, 226667, 18888.9, 0, 1),
(137, 139, 0.8, 2, 'Package', 19680, 39360, 472320, 26.71, 590400, 49200, 0, 1),
(138, 140, 0.9, 4, 'agent', 27000, 108000, 1296000, 73.29, 1440000, 120000, 0, 1),
(139, 141, 0.8, 8, 'GB', 192, 1536, 18432, 3.23, 23040, 1920, 0, 1),
(140, 142, 0.8, 300, 'GB', 3.2, 960, 11520, 2.02, 14400, 1200, 0, 1),
(141, 143, 0.9, 1, 'agent', 12500, 12500, 150000, 26.28, 166667, 13888.9, 0, 1),
(142, 144, 0.9, 1, 'VM', 11000, 11000, 132000, 23.13, 146667, 12222.2, 0, 1),
(143, 145, 0.8, 1, 'License', 168, 168, 2016, 0.35, 2520, 210, 0, 1),
(144, 146, 0.9, 1, 'agent', 17000, 17000, 204000, 35.74, 226667, 18888.9, 0, 1),
(145, 147, 0.8, 1, 'VM', 4400, 4400, 52800, 9.25, 66000, 5500, 0, 1),
(146, 148, 0.8, 8, 'GB', 192, 1536, 18432, 3.23, 23040, 1920, 0, 1),
(147, 149, 0.8, 300, 'GB', 3.2, 960, 11520, 2.02, 14400, 1200, 0, 1),
(148, 150, 0.9, 1, 'agent', 12500, 12500, 150000, 26.28, 166667, 13888.9, 0, 1),
(149, 151, 0.9, 1, 'VM', 11000, 11000, 132000, 23.13, 146667, 12222.2, 0, 1),
(150, 152, 0.8, 1, 'License', 170, 170, 2040, 0.36, 2550, 212.5, 0, 1),
(151, 153, 0.9, 1, 'agent', 17000, 17000, 204000, 35.74, 226667, 18888.9, 0, 1),
(152, 154, 0.8, 1, 'VM', 4400, 4400, 52800, 9.25, 66000, 5500, 0, 1),
(153, 155, 0.8, 8, 'GB', 192, 1536, 18432, 3.23, 23040, 1920, 0, 1),
(154, 156, 0.8, 300, 'GB', 3.2, 960, 11520, 2.02, 14400, 1200, 0, 1),
(155, 157, 0.9, 1, 'agent', 12500, 12500, 150000, 26.28, 166667, 13888.9, 0, 1),
(156, 158, 0.9, 1, 'VM', 11000, 11000, 132000, 23.13, 146667, 12222.2, 0, 1),
(157, 159, 0.8, 1, 'License', 170, 170, 2040, 0.36, 2550, 212.5, 0, 1),
(158, 160, 0.9, 1, 'agent', 17000, 17000, 204000, 35.74, 226667, 18888.9, 0, 1),
(159, 161, 0.8, 1, 'VM', 4400, 4400, 52800, 9.25, 66000, 5500, 0, 1),
(160, 162, 0.8, 8, 'GB', 192, 1536, 18432, 3.24, 23040, 1920, 0, 1),
(161, 163, 0.8, 300, 'GB', 2.5, 750, 9000, 1.58, 11250, 937.5, 0, 1),
(162, 164, 0.9, 1, 'agent', 12500, 12500, 150000, 26.4, 166667, 13888.9, 0, 1),
(163, 165, 0.9, 1, 'VM', 11000, 11000, 132000, 23.23, 146667, 12222.2, 0, 1),
(164, 166, 0.8, 1, 'License', 170, 170, 2040, 0.36, 2550, 212.5, 0, 1),
(165, 167, 0.9, 1, 'agent', 17000, 17000, 204000, 35.9, 226667, 18888.9, 0, 1),
(166, 168, 0.8, 1, 'VM', 4400, 4400, 52800, 9.29, 66000, 5500, 0, 1),
(173, 175, 0.9, 1, 'VM', 10170, 10170, 122040, 56.78, 135600, 11300, 0, 1),
(174, 176, 0.9, 1, 'VM', 5130, 5130, 61560, 28.64, 68400, 5700, 0, 1),
(175, 177, 0.9, 1, 'VM', 2610, 2610, 31320, 14.57, 34800, 2900, 0, 1),
(176, 178, 0.9, 1, 'VM', 10170, 10170, 122040, 18.35, 135600, 11300, 0, 1),
(177, 179, 0.9, 1, 'VM', 5130, 5130, 61560, 9.26, 68400, 5700, 0, 1),
(178, 180, 0.9, 1, 'VM', 2610, 2610, 31320, 4.71, 34800, 2900, 0, 1),
(179, 181, 0.9, 1, 'agent', 25000, 25000, 300000, 45.12, 333333, 27777.8, 0, 1),
(180, 182, 0.9, 1, 'agent', 12500, 12500, 150000, 22.56, 166667, 13888.9, 0, 1),
(181, 183, 0.9, 1, 'VM', 10170, 10170, 122040, 18.35, 135600, 11300, 0, 1),
(182, 184, 0.9, 1, 'VM', 5130, 5130, 61560, 9.26, 68400, 5700, 0, 1),
(183, 185, 0.9, 1, 'VM', 2610, 2610, 31320, 4.71, 34800, 2900, 0, 1),
(184, 186, 0.9, 1, 'agent', 25000, 25000, 300000, 45.12, 333333, 27777.8, 0, 1),
(185, 187, 0.9, 1, 'agent', 12500, 12500, 150000, 22.56, 166667, 13888.9, 0, 1),
(186, 188, 0.8, 6, 'VM', 4400, 26400, 316800, 26.79, 396000, 33000, 0, 1),
(187, 189, 0.8, 16, 'VCPU', 240, 3840, 46080, 3.9, 57600, 4800, 0, 1),
(188, 190, 0.8, 48, 'GB', 192, 9216, 110592, 9.35, 138240, 11520, 0, 1),
(189, 191, 0.8, 1200, 'GB', 3.2, 3840, 46080, 3.9, 57600, 4800, 0, 1),
(190, 192, 0.8, 6, 'IP', 80, 480, 5760, 0.49, 7200, 600, 0, 1),
(191, 193, 0.8, 6, 'License', 488, 2928, 35136, 2.97, 43920, 3660, 0, 1),
(192, 194, 0.8, 6, 'License', 8640, 51840, 622080, 52.61, 777600, 64800, 0, 1),
(193, 195, 0.8, 6, 'VM', 4400, 26400, 316800, 26.28, 396000, 33000, 0, 1),
(194, 196, 0.8, 16, 'VCPU', 240, 3840, 46080, 3.82, 57600, 4800, 0, 1),
(195, 197, 0.8, 48, 'GB', 192, 9216, 110592, 9.17, 138240, 11520, 0, 1),
(196, 198, 0.8, 1200, 'GB', 3, 3600, 43200, 3.58, 54000, 4500, 0, 1),
(197, 199, 0.8, 6, 'IP', 80, 480, 5760, 0.48, 7200, 600, 0, 1),
(198, 200, 0.8, 6, 'License', 488, 2928, 35136, 2.91, 43920, 3660, 0, 1),
(199, 201, 0.8, 6, 'License', 9000, 54000, 648000, 53.75, 810000, 67500, 0, 1),
(200, 202, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(201, 203, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(202, 204, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(203, 205, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(204, 206, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(205, 207, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(206, 208, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(207, 209, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(208, 210, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(209, 211, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(210, 212, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(211, 213, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(212, 214, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(213, 215, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(214, 216, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(215, 217, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(216, 218, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(217, 219, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(218, 220, 0.8, 6, 'VM', 4400, 26400, 316800, 5.28, 396000, 33000, 0, 1),
(219, 221, 0.8, 16, 'VCPU', 240, 3840, 46080, 0.77, 57600, 4800, 0, 1),
(220, 222, 0.8, 48, 'GB', 192, 9216, 110592, 1.84, 138240, 11520, 0, 1),
(221, 223, 0.8, 1200, 'GB', 3, 3600, 43200, 0.72, 54000, 4500, 0, 1),
(222, 224, 0.8, 6, 'IP', 80, 480, 5760, 0.1, 7200, 600, 0, 1),
(223, 225, 0.8, 6, 'License', 488, 2928, 35136, 0.59, 43920, 3660, 0, 1),
(224, 226, 0.8, 6, 'License', 9000, 54000, 648000, 10.79, 810000, 67500, 0, 1),
(225, 227, 0.9, 1, 'Package', 160000, 160000, 1920000, 31.97, 2133330, 177778, 0, 1),
(226, 228, 0.9, 1, 'Package', 240000, 240000, 2880000, 47.96, 3200000, 266667, 0, 1),
(227, 229, 0.9, 1, 'Package', 160000, 160000, 1920000, 11.11, 2133330, 177778, 0, 1),
(228, 230, 0.9, 1, 'Package', 240000, 240000, 2880000, 16.67, 3200000, 266667, 0, 1),
(229, 231, 0.9, 1, 'Package', 320000, 320000, 3840000, 22.22, 4266670, 355556, 0, 1),
(230, 232, 0.9, 2, 'Package', 360000, 720000, 8640000, 50, 9600000, 800000, 0, 1),
(231, 233, 0.9, 1, 'agent', 25000, 25000, 300000, 66.67, 333333, 27777.8, 0, 1),
(232, 234, 0.9, 1, 'agent', 12500, 12500, 150000, 33.33, 166667, 13888.9, 0, 1),
(233, 235, 0.9, 1, 'agent', 25000, 25000, 300000, 63.83, 333333, 27777.8, 0, 1),
(234, 236, 0.9, 1, 'agent', 12500, 12500, 150000, 31.91, 166667, 13888.9, 0, 1),
(235, 237, 0.8, 1, 'Project', 20000, 20000, 20000, 4.26, 25000, 2083.33, 1, 1),
(236, 238, 0.9, 1, 'agent', 25000, 25000, 300000, 9.27, 333333, 27777.8, 0, 1),
(237, 239, 0.9, 1, 'agent', 12500, 12500, 150000, 4.64, 166667, 13888.9, 0, 1),
(238, 240, 0.8, 1, 'Project', 20000, 20000, 20000, 0.62, 25000, 2083.33, 1, 1),
(239, 241, 0.8, 4, 'Rack', 23680, 94720, 1136640, 35.14, 1420800, 118400, 0, 1),
(240, 242, 0.8, 4, 'Rack', 33920, 135680, 1628160, 50.33, 2035200, 169600, 0, 1),
(241, 243, 0.9, 1, 'agent', 25000, 25000, 300000, 9.22, 333333, 27777.8, 0, 1),
(242, 244, 0.9, 1, 'agent', 12500, 12500, 150000, 4.61, 166667, 13888.9, 0, 1),
(243, 245, 0.8, 1, 'Project', 20000, 20000, 20000, 0.61, 25000, 2083.33, 1, 1),
(244, 246, 0.8, 4, 'Rack', 23680, 94720, 1136640, 34.95, 1420800, 118400, 0, 1),
(245, 247, 0.8, 4, 'Rack', 33920, 135680, 1628160, 50.07, 2035200, 169600, 0, 1),
(246, 248, 0.8, 1, 'VM', 1440, 1440, 17280, 0.53, 21600, 1800, 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_log`
--

CREATE TABLE `bom_log` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `version` varchar(20) NOT NULL,
  `data_change` text,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_log`
--

INSERT INTO `bom_log` (`id`, `id_bom`, `case_log`, `version`, `data_change`, `create_date`, `create_by`, `remark`) VALUES
(1, 12, 'CREATE', '1.01', '', '2019-05-28 11:34:24', '0', ''),
(2, 13, 'CREATE', '1.01', '', '2019-05-28 12:05:47', '0', 'test create'),
(9, 12, 'EDIT', '1.01', '', '2019-05-28 13:34:24', '0', ''),
(10, 13, 'EDIT', '1.01', '', '2019-05-28 13:39:45', '0', ''),
(11, 12, 'EDIT', '2.01', '', '2019-05-28 13:40:48', '0', 'test edit by presale'),
(12, 13, 'EDIT', '2.01', '', '2019-05-28 14:04:32', '777777', ''),
(13, 13, 'EDIT', '3.01', '', '2019-05-28 14:11:39', '777777', ''),
(15, 13, 'EDIT', '4.01', '', '2019-05-28 14:22:50', '0', ''),
(16, 13, 'EDIT', '5.01', '', '2019-05-28 14:26:24', '777777', ''),
(17, 13, 'EDIT', '5.02', ' ', '2019-05-29 16:59:01', '0', ''),
(18, 13, 'EDIT', '6.02', ' ', '2019-05-29 17:01:54', '0', ''),
(19, 13, 'EDIT', '7.02', ' ', '2019-05-29 17:07:03', '0', ''),
(20, 13, 'EDIT', '8.02', ' ', '2019-05-29 17:10:41', '0', ''),
(21, 13, 'EDIT', '9.02', 'เพิ่ม item Monthly fee for INET-SQL DBaaS (Large)ของ BD: Atcetera, ', '2019-05-29 17:28:23', '0', ''),
(22, 13, 'EDIT', '10.02', 'เพิ่มราคาต่อ License ของ Monthly fee for Add SQL License BD: Atcetera จาก 5200บาท เป็น6000บาท, เพิ่ม item Monthly fee for INET-OpenLandscape Cloud (Package G)ของ BD: OpenLandScape, เพิ่ม item Monthly fee for Backup 1 GBของ BD: OpenLandScape, เพิ่ม item Monthly fee for INET-OpenLandscape Cloud (Package F)ของ BD: OpenLandScape, ลด item Monthly fee for INET-SQL DBaaS (Large)ของ BD: Atcetera, ', '2019-05-29 17:36:58', '0', ''),
(23, 12, 'EDIT', '3.01', 'เพิ่ม item Monthly fee for INET-FlexPod Cloud Add on Remote Desktop Licenseของ BD: Flexpod, ', '2019-05-30 16:20:01', '0', ''),
(24, 12, 'EDIT', '4.01', 'เพิ่มราคาต่อ Package ของ Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise BD: Flexpod จาก 24000บาท เป็น24500บาท, ', '2019-05-30 16:24:10', '777777', 'comment remark '),
(25, 12, 'EDIT', '4.02', 'เพิ่มราคาต่อ VM ของ Monthly fee for INET-OpenLandscape Cloud (Package G) BD: OpenLandScape จาก 10170บาท เป็น11000บาท, ', '2019-05-30 16:24:59', '999999', ''),
(26, 12, 'EDIT', '4.03', 'เพิ่ม item 4 Digit (Option 2,First Year)ของ BD: Talk to me, ', '2019-05-30 16:49:45', '0', 'remark from presale---------------------------------------------------'),
(27, 14, 'CREATE', '1.01', '', '2019-05-31 10:07:43', '999999', ''),
(28, 15, 'CREATE', '1.01', '', '2019-06-04 17:29:59', '000000', ''),
(29, 15, 'EDIT', '1.01', 'เพิ่ม item Monthly fee for INET-OpenLandscape Cloud (Package G)ของ BD: OpenLandScape, ', '2019-06-04 18:23:46', '000000', ''),
(30, 15, 'EDIT', '2.01', 'ลดราคาต่อ Package ของ Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise BD: Flexpod จาก 40480บาท เป็น40000บาท, ', '2019-06-04 18:27:39', '777777', ''),
(31, 12, 'EDIT', '5.03', 'เพิ่มราคาขายของ sale จาก 34000บาท เป็น80000บาท, ', '2019-06-05 08:48:55', '000000', ''),
(32, 16, 'CREATE', '1.01', '', '2019-06-05 15:46:51', '000000', ''),
(33, 12, 'EDIT', '6.03', 'เพิ่ม item Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinumของ BD: Flexpod, ลบ item Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPUของ BD: Flexpod, ลบ item Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterpriseของ BD: Flexpod, ', '2019-06-05 15:47:40', '000000', ''),
(34, 16, 'EDIT', '1.01', 'เพิ่ม item Turnkey-DBA-Implement Standard (One Time)ของ BD: INET MS, ', '2019-06-05 15:53:11', '000000', 'add on'),
(35, 12, 'EDIT', '7.03', 'เพิ่มราคาต่อ License ของ Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License BD: Flexpod จาก 168บาท เป็น170บาท, ', '2019-06-05 15:56:01', '777777', ''),
(36, 12, 'EDIT', '7.04', 'ลดราคาต่อ GB ของ Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk BD: Flexpod จาก 3.2บาท เป็น2.5บาท, ', '2019-06-05 15:58:49', '777777', ''),
(37, 12, 'EDIT', '7.04', 'ลดราคาต่อ GB ของ Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk BD: Flexpod จาก 3.2บาท เป็น2.5บาท, ลดราคาต่อ GB ของ Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk BD: Flexpod จาก 3.2บาท เป็น2.5บาท, ', '2019-06-05 15:58:49', '777777', ''),
(38, 12, 'EDIT', '7.05', 'ลดราคาต่อ agent ของ Customer Satisfaction BD: Talk to me จาก 12500บาท เป็น10000บาท, ลดราคาต่อ VM ของ Monthly fee for INET-OpenLandscape Cloud (Package G) BD: OpenLandScape จาก 11000บาท เป็น10000บาท, ', '2019-06-05 15:59:44', '999999', ''),
(39, 17, 'CREATE', '1.01', '', '2019-06-06 17:31:06', '777777', ''),
(40, 18, 'CREATE', '1.01', '', '2019-06-10 08:46:24', '000000', ''),
(45, 23, 'CREATE', '1.01', '', '2019-06-10 09:36:39', '000000', ''),
(46, 24, 'CREATE', '1.01', '', '2019-06-11 10:29:49', '000000', 'test diagram'),
(47, 25, 'CREATE', '1.01', '', '2019-06-11 10:31:46', '000000', ''),
(48, 26, 'CREATE', '1.01', '', '2019-06-11 10:35:20', '000000', ''),
(53, 31, 'CREATE', '1.01', '', '2019-06-11 11:25:27', '000000', ''),
(55, 33, 'CREATE', '1.01', '', '2019-06-11 11:33:13', '000000', ''),
(56, 34, 'CREATE', '1.01', '', '2019-06-11 11:46:04', '000000', ''),
(57, 35, 'CREATE', '1.01', '', '2019-06-11 11:59:35', '000000', ''),
(61, 36, 'CREATE', '1.01', '', '2019-06-11 15:08:28', '000000', ''),
(62, 36, 'EDIT', '1.01', 'เพิ่มราคาขายของ sale จาก 19000บาท เป็น60000บาท, เพิ่ม item Contact Valueของ BD: Talk to me, เพิ่ม item Customer Satisfactionของ BD: Talk to me, เพิ่ม diagram, ลบ diagram ที่มีออกไป, ', '2019-06-11 15:09:30', '000000', ''),
(63, 36, 'EDIT', '2.01', 'เพิ่ม diagram, ลบ diagram ที่มีออกไป, ', '2019-06-11 15:09:57', '000000', ''),
(64, 36, 'EDIT', '3.01', 'ลดราคาต่อ VM ของ Monthly fee for INET-OpenLandscape Cloud (Package F) BD: OpenLandScape จาก 5130บาท เป็น5100บาท, ลดราคาต่อ VM ของ Monthly fee for INET-OpenLandscape Cloud (Package E) BD: OpenLandScape จาก 2610บาท เป็น2600บาท, ', '2019-06-11 15:12:27', '999999', ''),
(68, 40, 'CREATE', '1.01', '', '2019-06-12 10:58:35', '000000', ''),
(69, 40, 'EDIT', '1.01', 'ลดราคาต่อ GB ของ Monthly fee for INET-FlexPod Cloud Add on Disk (SSD) BD: Flexpod จาก 3.2บาท เป็น3บาท, เพิ่มราคาต่อ License ของ Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent. BD: Flexpod จาก 8640บาท เป็น9000บาท, ', '2019-06-12 11:12:56', '777777', ''),
(70, 40, 'EDIT', '1.02', 'เพิ่ม item Mail Gateway Package 18 Anti Spam 2000 users/yearของ BD: One Email, เพิ่ม item Mail Gateway Package 19 Anti Spam 3000 users/yearของ BD: One Email, ', '2019-06-12 11:26:14', '000000', ''),
(71, 40, 'EDIT', '2.02', '', '2019-06-12 12:10:06', '000000', 'test edit bom'),
(72, 40, 'EDIT', '3.02', 'แก้ไข spec vm resource , ', '2019-06-12 14:42:21', '000000', ''),
(73, 40, 'EDIT', '4.02', 'ลด vm resource , ', '2019-06-12 14:42:36', '000000', ''),
(74, 41, 'CREATE', '1.01', '', '2019-06-12 15:22:38', '000000', ''),
(75, 41, 'EDIT', '1.01', 'ลบ diagram ที่มีออกไป, เพิ่ม vm resource , ', '2019-06-12 15:23:29', '000000', ''),
(76, 42, 'CREATE', '1.01', '', '2019-06-17 08:44:42', '000000', 'test'),
(77, 43, 'CREATE', '1.01', '', '2019-06-20 11:00:21', '000000', 'test upload ref file'),
(78, 44, 'CREATE', '1.01', '', '2019-06-20 13:35:09', '000000', 'test diragram ref_file'),
(79, 45, 'CREATE', '1.01', '', '2019-07-18 16:50:46', '60336', ''),
(80, 46, 'CREATE', '1.01', '', '2019-07-26 16:05:00', '60336', 'test'),
(81, 47, 'CREATE', '1.01', '', '2019-07-26 16:34:19', '60336', 'test'),
(82, 23, 'EDIT', '1.01', 'เพิ่มราคาขายของ sale จาก 40000บาท เป็น43000บาท, เพิ่ม item Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)ของ BD: Flexpod, เพิ่ม diagram, เพิ่ม diagram, เพิ่ม vm resource , ', '2019-07-26 16:38:01', '60336', ''),
(83, 23, 'EDIT', '2.01', 'เพิ่มราคาขายของ sale จาก 43000บาท เป็น330000บาท, เพิ่ม item Co-Location Full Rackของ BD: IDC, เพิ่ม item Co-Location Full Rack (HD)ของ BD: IDC, แก้ไข spec vm resource , ', '2019-07-26 17:11:12', '60336', ''),
(84, 23, 'EDIT', '3.01', 'เพิ่ม item Monthly fee for INET-FlexPod Cloud(Package,Bronze) Package : Bronzeของ BD: Flexpod, แก้ไข spec vm resource , ', '2019-07-26 17:12:35', '60336', ''),
(85, 23, 'EDIT', '4.01', 'ลบ item Monthly fee for INET-FlexPod Cloud(Package,Bronze) Package : Bronzeของ BD: Flexpod, แก้ไข spec vm resource , ', '2019-07-26 17:13:30', '60336', '');

-- --------------------------------------------------------

--
-- Table structure for table `bom_main`
--

CREATE TABLE `bom_main` (
  `id` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `customer_id` varchar(255) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `sale_id` varchar(10) NOT NULL,
  `sale_name` varchar(255) NOT NULL,
  `sale_tel` varchar(255) NOT NULL,
  `presale_id` varchar(10) NOT NULL,
  `presale_name` varchar(255) NOT NULL,
  `presale_tel` varchar(255) NOT NULL,
  `business_development_id` int(11) DEFAULT NULL,
  `business_development_name` varchar(255) DEFAULT NULL,
  `business_development_tel` varchar(255) DEFAULT NULL,
  `cost_id` int(11) DEFAULT NULL,
  `cost_name` varchar(255) DEFAULT NULL,
  `cost_tel` varchar(255) DEFAULT NULL,
  `contract` int(11) NOT NULL,
  `total_sale_price` float NOT NULL,
  `total_actualcost` float NOT NULL,
  `total_engcost` float NOT NULL,
  `total_engcost_per_month` float NOT NULL,
  `sale_factor` float NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `ref_type` varchar(30) DEFAULT NULL,
  `ref_id` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_main`
--

INSERT INTO `bom_main` (`id`, `project_name`, `customer_id`, `customer_name`, `sale_id`, `sale_name`, `sale_tel`, `presale_id`, `presale_name`, `presale_tel`, `business_development_id`, `business_development_name`, `business_development_tel`, `cost_id`, `cost_name`, `cost_tel`, `contract`, `total_sale_price`, `total_actualcost`, `total_engcost`, `total_engcost_per_month`, `sale_factor`, `version`, `ref_type`, `ref_id`, `create_date`, `create_by`, `inuse`) VALUES
(12, 'test', '', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 526272, 596173, 49681.1, 1.61, '7.06', '', '', '2019-05-28 11:34:24', '0', 1),
(13, 'test001', '', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 200000, 2468860, 2752490, 229374, 0.87, '11.02', '', '', '2019-05-28 12:05:47', '0', 1),
(14, 'project solution (aia)', '', 'aia', '555555', 'santi wantanachai', '0888888888', '000000', 'kamon gomintirawat', '0888888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1000000, 12771800, 14231500, 1185960, 0.84, '1.01', '', '', '2019-05-31 10:07:43', '999999', 1),
(15, 'test change database', '', 'inet', '555555', 'lkjhgf', '852002', '000000', 'jhgfd', '5464646', NULL, NULL, NULL, NULL, NULL, NULL, 12, 49000, 611640, 747600, 62300, 0.79, '2.02', NULL, NULL, '2019-06-04 17:29:59', '000000', 1),
(16, 'test 5-6-2019', '', 'inet', '555555', 'นายสันติภาพ ทองใหม่', '065 521 4404', '000000', 'นายณัฐภัทร จริยะนันตกุล', '065 521 4405', NULL, NULL, NULL, NULL, NULL, NULL, 12, 160000, 1960320, 2243730, 186978, 0.86, '2.01', '', '', '2019-06-05 15:46:51', '000000', 1),
(17, 'test sort order', '', 'inet', '555555', 'asdfghjk', '1234567890', '000000', 'xhj', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 93000, 1008240, 1126130, 93844.5, 0.99, '1.01', '', '', '2019-06-06 17:31:06', '777777', 1),
(18, 'testdiagram', '', 'inet', '555555', 'sdbn', '123456789', '000000', 'sdcfvb', '1234567844', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10000, 97088, 121360, 10113.3, 0.99, '1.01', '', '', '2019-06-10 08:46:24', '000000', 1),
(23, 'test diagram', '', 'inet', '555555', 'asdfghj', '1234567890', '000000', 'sdf', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 330000, 3234800, 3981000, 331750, 0.99, '5.01', '', '', '2019-06-10 09:36:39', '000000', 1),
(24, 'test diagram 001', '', 'inet', '555555', 'asdf', '08888888', '000000', 'asd', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 15000, 183600, 204000, 17000, 0.88, '1.01', '', '', '2019-06-11 10:29:49', '000000', 1),
(25, 'test diagram 002', '', 'inet', '555555', 'hgfd', '08888888', '000000', 'erw', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 440000, 4800000, 5333330, 444444, 0.99, '1.01', '', '', '2019-06-11 10:31:46', '000000', 1),
(26, 'test diagram 003', '', 'inet', '555555', 'asedf', '08888888', '000000', 'ew', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 4000, 39200, 49000, 4083.33, 0.98, '1.01', '', '', '2019-06-11 10:35:20', '000000', 1),
(31, 'test diagram 888', '', 'inet', '555555', '1', '08888888', '000000', '2', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 54000, 524160, 655200, 54600, 0.99, '1.01', '', '', '2019-06-11 11:25:27', '000000', 1),
(33, 'test diagram008', '', 'inet', '555555', 'q', '08888888', '000000', 'a', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 440000, 4800000, 5333330, 444444, 0.99, '1.01', '', '', '2019-06-11 11:33:13', '000000', 1),
(34, 'test diagram 009', '', 'inet', '555555', 'one', '08888888', '000000', 'two', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 40000, 450000, 500000, 41666.7, 0.96, '1.01', '', '', '2019-06-11 11:46:04', '000000', 1),
(35, 'test_diagram_2019', '', 'inet', '555555', '1234', '08888888', '000000', '5678', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 400000, 4800000, 5333330, 444444, 0.9, '1.01', '', '', '2019-06-11 11:59:35', '000000', 1),
(36, 'test diagram 999', '', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 60000, 664440, 738267, 61522.2, 0.98, '3.02', '', '', '2019-06-11 15:08:28', '000000', 1),
(40, 'test vm resource', '', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 120000, 6005570, 6840290, 570024, 0.21, '5.02', '', '', '2019-06-12 10:58:35', '000000', 1),
(41, 'test diagram and vm resource', '', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, 17280000, 19200000, 1600000, 0, '2.01', '', '', '2019-06-12 15:22:38', '000000', 1),
(42, 'test_inet-2019-06-17', '', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 30000, 326664, 378480, 31540, 0.95, '1.01', '', '', '2019-06-17 08:44:42', '000000', 1),
(43, 'test ref file', '', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 40000, 450000, 500000, 41666.7, 0.96, '1.01', '', '', '2019-06-20 11:00:21', '000000', 1),
(44, 'test diagram', '', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 0, 450000, 500000, 41666.7, 0, '1.01', '', '', '2019-06-20 13:35:09', '000000', 1),
(45, 'asdfghjkl', '', 'x', '60335', 'นางสาวกัญญ์วรา ฉลากกลาง', '065 521 4403', '60336', 'aaa', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 10000, 105600, 132000, 11000, 0.91, '1.01', '', '', '2019-07-18 16:50:46', '60336', 1),
(46, 'test_api', '', 'inet', '555555', 'cvbnm,', '123456789', '000000', '123456789', '123456789', NULL, NULL, NULL, NULL, NULL, NULL, 12, 240000, 2493890, 3117360, 259780, 0.92, '1.01', '', '', '2019-07-26 16:05:00', '60336', 1),
(47, 'test api --- 1', '', 'inet', '555555', 'xcvbn', '123456789', '60336', 'sdfvb', '123456789', NULL, NULL, NULL, NULL, NULL, NULL, 12, 76000, 729600, 912000, 76000, 1, '1.01', '', '', '2019-07-26 16:34:19', '60336', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_main_old`
--

CREATE TABLE `bom_main_old` (
  `id` int(11) NOT NULL,
  `id_bom_main` int(11) NOT NULL,
  `project_name` varchar(255) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `sale_id` varchar(10) NOT NULL,
  `sale_name` varchar(255) NOT NULL,
  `sale_tel` varchar(255) NOT NULL,
  `presale_id` varchar(10) NOT NULL,
  `presale_name` varchar(255) NOT NULL,
  `presale_tel` varchar(255) NOT NULL,
  `business_development_id` int(11) DEFAULT NULL,
  `business_development_name` varchar(255) DEFAULT NULL,
  `business_development_tel` varchar(255) DEFAULT NULL,
  `cost_id` int(11) DEFAULT NULL,
  `cost_name` varchar(255) DEFAULT NULL,
  `cost_tel` varchar(255) DEFAULT NULL,
  `contract` int(11) NOT NULL,
  `total_sale_price` float NOT NULL,
  `total_actualcost` float NOT NULL,
  `total_engcost` float NOT NULL,
  `total_engcost_per_month` float NOT NULL,
  `sale_factor` float NOT NULL,
  `version` varchar(20) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_main_old`
--

INSERT INTO `bom_main_old` (`id`, `id_bom_main`, `project_name`, `customer_name`, `sale_id`, `sale_name`, `sale_tel`, `presale_id`, `presale_name`, `presale_tel`, `business_development_id`, `business_development_name`, `business_development_tel`, `cost_id`, `cost_name`, `cost_tel`, `contract`, `total_sale_price`, `total_actualcost`, `total_engcost`, `total_engcost_per_month`, `sale_factor`, `version`, `create_date`, `create_by`, `inuse`) VALUES
(7, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 329472, 411840, 34320, 0.99, '1.01', '2019-05-28 13:34:24', '0', 1),
(8, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 125000, 1295380, 1515050, 126254, 0.99, '1.01', '2019-05-28 13:39:45', '0', 1),
(9, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 479472, 578507, 48208.9, 0.71, '2.01', '2019-05-28 13:40:48', '0', 1),
(10, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 390000, 4175380, 4715050, 392921, 0.99, '2.01', '2019-05-28 14:04:32', '0', 1),
(11, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 390000, 4175620, 4715350, 392946, 0.99, '3.01', '2019-05-28 14:11:39', '0', 1),
(13, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 390000, 4169620, 4707850, 392321, 0.99, '4.01', '2019-05-28 14:22:50', '0', 1),
(14, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 390000, 1289620, 1507850, 125654, 3.1, '5.01', '2019-05-28 14:26:24', '0', 1),
(15, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 390000, 1295860, 1515650, 126304, 3.09, '5.02', '2019-05-29 16:59:01', '0', 1),
(16, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 390000, 789096, 886087, 73840.6, 5.28, '6.02', '2019-05-29 17:01:54', '0', 1),
(17, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 859056, 963820, 80318.3, 1, '7.02', '2019-05-29 17:07:03', '0', 1),
(18, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 2317060, 2583820, 215318, 0.37, '8.02', '2019-05-29 17:10:41', '0', 1),
(19, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 200000, 2259460, 2519820, 209985, 0.95, '9.02', '2019-05-29 17:28:23', '0', 1),
(20, 13, 'test001', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 200000, 2505460, 2793150, 232763, 0.86, '10.02', '2019-05-29 17:36:58', '0', 1),
(21, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 601512, 714107, 59508.9, 0.57, '3.01', '2019-05-30 16:20:01', '0', 1),
(22, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 603528, 716627, 59718.9, 0.57, '4.01', '2019-05-30 16:24:10', '0', 1),
(23, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 609528, 724127, 60343.9, 0.56, '4.02', '2019-05-30 16:24:59', '0', 1),
(24, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 619488, 735193, 61266.1, 0.55, '4.03', '2019-05-30 16:49:45', '0', 1),
(25, 15, 'test change database', 'inet', '555555', 'lkjhgf', '852002', '000000', 'jhgfd', '5464646', NULL, NULL, NULL, NULL, NULL, NULL, 12, 49000, 495360, 619200, 51600, 0.95, '1.01', '2019-06-04 18:23:46', '000000', 1),
(26, 15, 'test change database', 'inet', '555555', 'lkjhgf', '852002', '000000', 'jhgfd', '5464646', NULL, NULL, NULL, NULL, NULL, NULL, 12, 49000, 617400, 754800, 62900, 0.78, '2.01', '2019-06-04 18:27:39', '000000', 1),
(27, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 34000, 823488, 961860, 80155, 0.42, '5.03', '2019-06-05 08:48:55', '0', 1),
(28, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 823488, 961860, 80155, 1, '6.03', '2019-06-05 15:47:40', '0', 1),
(29, 16, 'test 5-6-2019', 'inet', '555555', 'นายสันติภาพ ทองใหม่', '065 521 4404', '000000', 'นายณัฐภัทร จริยะนันตกุล', '065 521 4405', NULL, NULL, NULL, NULL, NULL, NULL, 12, 160000, 1768320, 2030400, 169200, 0.95, '1.01', '2019-06-05 15:53:11', '000000', 1),
(30, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 570768, 645960, 53830, 1.49, '7.03', '2019-06-05 15:56:01', '0', 1),
(31, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 570792, 645990, 53832.5, 1.49, '7.04', '2019-06-05 15:58:49', '0', 1),
(32, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 570792, 645990, 53832.5, 1.49, '7.04', '2019-06-05 15:58:49', '0', 1),
(33, 12, 'test', 'aia', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 80000, 568272, 642840, 53570, 1.49, '7.05', '2019-06-05 15:59:44', '0', 1),
(37, 36, 'test diagram 999', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 19000, 214920, 238800, 19900, 0.95, '1.01', '2019-06-11 15:09:30', '000000', 1),
(38, 36, 'test diagram 999', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 60000, 664920, 738800, 61566.7, 0.97, '2.01', '2019-06-11 15:09:57', '000000', 1),
(39, 36, 'test diagram 999', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 60000, 664920, 738800, 61566.7, 0.97, '3.01', '2019-06-11 15:12:27', '000000', 1),
(40, 40, 'test vm resource', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 120000, 1182530, 1478160, 123180, 0.97, '1.01', '2019-06-12 11:12:56', '000000', 1),
(41, 40, 'test vm resource', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 120000, 1205570, 1506960, 125580, 0.96, '1.02', '2019-06-12 11:26:14', '000000', 1),
(42, 40, 'test vm resource', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 120000, 6005570, 6840290, 570024, 0.21, '2.02', '2019-06-12 12:10:06', '000000', 1),
(43, 40, 'test vm resource', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 120000, 6005570, 6840290, 570024, 0.21, '3.02', '2019-06-12 14:42:21', '000000', 1),
(44, 40, 'test vm resource', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 120000, 6005570, 6840290, 570024, 0.21, '4.02', '2019-06-12 14:42:36', '000000', 1),
(45, 41, 'test diagram and vm resource', 'inet', '555555', 'tee', '08888888', '000000', 'kee', '08888888', NULL, NULL, NULL, NULL, NULL, NULL, 12, 1, 17280000, 19200000, 1600000, 0, '1.01', '2019-06-12 15:23:29', '000000', 1),
(46, 23, 'test diagram', 'inet', '555555', 'asdfghj', '1234567890', '000000', 'sdf', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 40000, 450000, 500000, 41666.7, 0.96, '1.01', '2019-07-26 16:38:01', '000000', 1),
(47, 23, 'test diagram', 'inet', '555555', 'asdfghj', '1234567890', '000000', 'sdf', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 43000, 470000, 525000, 43750, 0.98, '2.01', '2019-07-26 17:11:12', '000000', 1),
(48, 23, 'test diagram', 'inet', '555555', 'asdfghj', '1234567890', '000000', 'sdf', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 330000, 3234800, 3981000, 331750, 0.99, '3.01', '2019-07-26 17:12:35', '000000', 1),
(49, 23, 'test diagram', 'inet', '555555', 'asdfghj', '1234567890', '000000', 'sdf', '1234567890', NULL, NULL, NULL, NULL, NULL, NULL, 12, 330000, 3252080, 4002600, 333550, 0.99, '4.01', '2019-07-26 17:13:30', '000000', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_poc_status`
--

CREATE TABLE `bom_poc_status` (
  `id_bom` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `modify_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bom_ref_file`
--

CREATE TABLE `bom_ref_file` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bom_ref_file_old`
--

CREATE TABLE `bom_ref_file_old` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `path` varchar(255) NOT NULL,
  `file_name` varchar(255) DEFAULT NULL,
  `file_type` varchar(255) DEFAULT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `bom_sale_log`
--

CREATE TABLE `bom_sale_log` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_sale_log`
--

INSERT INTO `bom_sale_log` (`id`, `id_bom`, `case_log`, `create_date`, `create_by`, `remark`) VALUES
(1, 12, 'WAITING', '2019-05-28 11:34:24', '0', NULL),
(2, 13, 'WAITING', '2019-05-28 12:05:47', '0', NULL),
(9, 12, 'WAITING', '2019-05-28 13:34:24', '0', NULL),
(10, 13, 'WAITING', '2019-05-28 13:39:45', '0', NULL),
(11, 12, 'WAITING', '2019-05-28 13:40:48', '0', NULL),
(12, 13, 'WAITING', '2019-05-28 14:04:32', '777777', NULL),
(13, 13, 'WAITING', '2019-05-28 14:11:39', '777777', NULL),
(15, 13, 'WAITING', '2019-05-28 14:22:50', '0', NULL),
(16, 13, 'WAITING', '2019-05-29 16:59:01', '0', NULL),
(17, 13, 'WAITING', '2019-05-29 17:01:54', '0', NULL),
(18, 13, 'WAITING', '2019-05-29 17:07:03', '0', NULL),
(19, 13, 'WAITING', '2019-05-29 17:10:41', '0', NULL),
(20, 13, 'WAITING', '2019-05-29 17:28:23', '0', NULL),
(21, 13, 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(22, 13, 'APPROVE', '2019-05-30 10:15:46', '555555', ''),
(23, 12, 'WAITING', '2019-05-30 16:20:01', '0', NULL),
(24, 12, 'WAITING', '2019-05-30 16:49:45', '0', NULL),
(25, 14, 'WAITING', '2019-05-31 10:07:43', '999999', NULL),
(26, 14, 'APPROVE', '2019-05-31 12:13:52', '555555', 'sale approve'),
(27, 15, 'WAITING', '2019-06-04 17:29:59', '000000', NULL),
(28, 15, 'WAITING', '2019-06-04 18:23:46', '000000', NULL),
(29, 15, 'APPROVE', '2019-06-04 18:28:45', '555555', ''),
(30, 12, 'WAITING', '2019-06-05 08:48:55', '000000', NULL),
(31, 16, 'WAITING', '2019-06-05 15:46:51', '000000', NULL),
(32, 12, 'WAITING', '2019-06-05 15:47:40', '000000', NULL),
(33, 16, 'WAITING', '2019-06-05 15:53:11', '000000', NULL),
(34, 12, 'APPROVE', '2019-06-05 16:14:51', '555555', ''),
(35, 17, 'WAITING', '2019-06-06 17:31:06', '777777', NULL),
(36, 16, 'APPROVE', '2019-06-07 10:51:22', '555555', ''),
(37, 18, 'WAITING', '2019-06-10 08:46:24', '000000', NULL),
(42, 23, 'WAITING', '2019-06-10 09:36:39', '000000', NULL),
(43, 24, 'WAITING', '2019-06-11 10:29:49', '000000', NULL),
(44, 25, 'WAITING', '2019-06-11 10:31:46', '000000', NULL),
(45, 26, 'WAITING', '2019-06-11 10:35:20', '000000', NULL),
(50, 31, 'WAITING', '2019-06-11 11:25:27', '000000', NULL),
(52, 33, 'WAITING', '2019-06-11 11:33:13', '000000', NULL),
(53, 34, 'WAITING', '2019-06-11 11:46:04', '000000', NULL),
(54, 35, 'WAITING', '2019-06-11 11:59:35', '000000', NULL),
(58, 36, 'WAITING', '2019-06-11 15:08:28', '000000', NULL),
(59, 36, 'WAITING', '2019-06-11 15:09:30', '000000', NULL),
(60, 36, 'WAITING', '2019-06-11 15:09:57', '000000', NULL),
(64, 40, 'WAITING', '2019-06-12 10:58:35', '000000', NULL),
(65, 40, 'WAITING', '2019-06-12 11:26:14', '000000', NULL),
(66, 40, 'WAITING', '2019-06-12 12:10:06', '000000', NULL),
(67, 40, 'WAITING', '2019-06-12 14:42:21', '000000', NULL),
(68, 40, 'WAITING', '2019-06-12 14:42:36', '000000', NULL),
(69, 41, 'WAITING', '2019-06-12 15:22:38', '000000', NULL),
(70, 41, 'WAITING', '2019-06-12 15:23:29', '000000', NULL),
(71, 42, 'WAITING', '2019-06-17 08:44:42', '000000', NULL),
(72, 43, 'WAITING', '2019-06-20 11:00:21', '000000', NULL),
(73, 44, 'WAITING', '2019-06-20 13:35:09', '000000', NULL),
(74, 45, 'WAITING', '2019-07-18 16:50:46', '60336', NULL),
(75, 46, 'WAITING', '2019-07-26 16:05:00', '60336', NULL),
(76, 47, 'WAITING', '2019-07-26 16:34:19', '60336', NULL),
(77, 23, 'WAITING', '2019-07-26 16:38:01', '60336', NULL),
(78, 23, 'WAITING', '2019-07-26 17:11:12', '60336', NULL),
(79, 23, 'WAITING', '2019-07-26 17:12:35', '60336', NULL),
(80, 23, 'WAITING', '2019-07-26 17:13:30', '60336', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bom_solution_log`
--

CREATE TABLE `bom_solution_log` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `remark` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_solution_log`
--

INSERT INTO `bom_solution_log` (`id`, `id_bom`, `case_log`, `create_date`, `create_by`, `remark`) VALUES
(1, 12, 'WAITING', '2019-05-28 11:34:24', '0', NULL),
(2, 13, 'WAITING', '2019-05-28 12:05:47', '0', NULL),
(9, 12, 'WAITING', '2019-05-28 13:34:24', '0', NULL),
(10, 13, 'WAITING', '2019-05-28 13:39:45', '0', NULL),
(11, 12, 'WAITING', '2019-05-28 13:40:48', '0', NULL),
(12, 13, 'APPROVE', '2019-05-28 13:49:21', '444444', NULL),
(13, 12, 'REJECT', '2019-05-28 13:49:40', '444444', 'test comment alert in view page'),
(14, 13, 'WAITING', '2019-05-28 14:04:32', '777777', NULL),
(15, 13, 'APPROVE', '2019-05-28 14:10:41', '444444', NULL),
(16, 13, 'WAITING', '2019-05-28 14:11:39', '777777', NULL),
(18, 13, 'WAITING', '2019-05-28 14:22:50', '0', NULL),
(19, 13, 'APPROVE', '2019-05-28 14:23:24', '444444', NULL),
(20, 13, 'WAITING', '2019-05-29 16:59:01', '0', NULL),
(21, 13, 'WAITING', '2019-05-29 17:01:54', '0', NULL),
(22, 13, 'WAITING', '2019-05-29 17:07:03', '0', NULL),
(23, 13, 'WAITING', '2019-05-29 17:10:41', '0', NULL),
(24, 13, 'WAITING', '2019-05-29 17:28:23', '0', NULL),
(25, 13, 'WAITING', '2019-05-29 17:36:58', '0', NULL),
(26, 13, 'APPROVE', '2019-05-30 10:11:44', '444444', ''),
(27, 12, 'WAITING', '2019-05-30 16:20:01', '0', NULL),
(28, 12, 'APPROVE', '2019-05-30 16:20:46', '444444', ''),
(29, 12, 'WAITING', '2019-05-30 16:49:45', '0', NULL),
(30, 12, 'APPROVE', '2019-05-30 17:04:57', '444444', ''),
(31, 14, 'WAITING', '2019-05-31 10:07:43', '999999', NULL),
(32, 14, 'APPROVE', '2019-05-31 10:29:32', '444444', 'approve order BOM'),
(33, 15, 'WAITING', '2019-06-04 17:29:59', '000000', NULL),
(34, 15, 'WAITING', '2019-06-04 18:23:46', '000000', NULL),
(35, 15, 'APPROVE', '2019-06-04 18:26:40', '444444', ''),
(36, 12, 'WAITING', '2019-06-05 08:48:55', '000000', NULL),
(37, 16, 'WAITING', '2019-06-05 15:46:51', '000000', NULL),
(38, 12, 'WAITING', '2019-06-05 15:47:40', '000000', NULL),
(39, 12, 'APPROVE', '2019-06-05 15:51:18', '444444', 'test lead presale ---------------> approve on 5-6-2019'),
(40, 16, 'REJECT', '2019-06-05 15:51:49', '444444', 'test lead presale reject '),
(41, 16, 'WAITING', '2019-06-05 15:53:11', '000000', NULL),
(42, 16, 'APPROVE', '2019-06-06 17:20:07', '444444', ''),
(43, 17, 'WAITING', '2019-06-06 17:31:06', '777777', NULL),
(44, 17, 'REJECT', '2019-06-07 10:50:08', '444444', ''),
(45, 18, 'WAITING', '2019-06-10 08:46:24', '000000', NULL),
(50, 23, 'WAITING', '2019-06-10 09:36:39', '000000', NULL),
(51, 24, 'WAITING', '2019-06-11 10:29:49', '000000', NULL),
(52, 25, 'WAITING', '2019-06-11 10:31:46', '000000', NULL),
(53, 26, 'WAITING', '2019-06-11 10:35:20', '000000', NULL),
(58, 31, 'WAITING', '2019-06-11 11:25:27', '000000', NULL),
(60, 33, 'WAITING', '2019-06-11 11:33:13', '000000', NULL),
(61, 34, 'WAITING', '2019-06-11 11:46:04', '000000', NULL),
(62, 35, 'WAITING', '2019-06-11 11:59:35', '000000', NULL),
(63, 35, 'APPROVE', '2019-06-11 12:29:49', '444444', ''),
(67, 36, 'WAITING', '2019-06-11 15:08:28', '000000', NULL),
(68, 36, 'WAITING', '2019-06-11 15:09:30', '000000', NULL),
(69, 36, 'WAITING', '2019-06-11 15:09:57', '000000', NULL),
(70, 36, 'APPROVE', '2019-06-11 15:11:39', '444444', 'test diagram lead presalee'),
(74, 40, 'WAITING', '2019-06-12 10:58:35', '000000', NULL),
(75, 40, 'APPROVE', '2019-06-12 11:11:35', '444444', ''),
(76, 40, 'WAITING', '2019-06-12 11:26:14', '000000', NULL),
(77, 40, 'WAITING', '2019-06-12 12:10:06', '000000', NULL),
(78, 40, 'WAITING', '2019-06-12 14:42:21', '000000', NULL),
(79, 40, 'WAITING', '2019-06-12 14:42:36', '000000', NULL),
(80, 41, 'WAITING', '2019-06-12 15:22:38', '000000', NULL),
(81, 41, 'WAITING', '2019-06-12 15:23:29', '000000', NULL),
(82, 42, 'WAITING', '2019-06-17 08:44:42', '000000', NULL),
(83, 43, 'WAITING', '2019-06-20 11:00:21', '000000', NULL),
(84, 44, 'WAITING', '2019-06-20 13:35:09', '000000', NULL),
(85, 45, 'WAITING', '2019-07-18 16:50:46', '60336', NULL),
(86, 46, 'WAITING', '2019-07-26 16:05:00', '60336', NULL),
(87, 47, 'WAITING', '2019-07-26 16:34:19', '60336', NULL),
(88, 23, 'WAITING', '2019-07-26 16:38:01', '60336', NULL),
(89, 23, 'WAITING', '2019-07-26 17:11:12', '60336', NULL),
(90, 23, 'WAITING', '2019-07-26 17:12:35', '60336', NULL),
(91, 23, 'WAITING', '2019-07-26 17:13:30', '60336', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `bom_vm_resource`
--

CREATE TABLE `bom_vm_resource` (
  `id` int(11) NOT NULL,
  `id_bom` int(11) NOT NULL,
  `name_server` varchar(100) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `disk` int(11) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `sql` varchar(100) DEFAULT NULL,
  `additional` varchar(100) DEFAULT NULL,
  `inuse` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_vm_resource`
--

INSERT INTO `bom_vm_resource` (`id`, `id_bom`, `name_server`, `cpu`, `memory`, `disk`, `os`, `sql`, `additional`, `inuse`) VALUES
(21, 40, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(22, 40, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(23, 40, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(24, 40, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(25, 40, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(26, 40, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(28, 41, 'test', 1, 1, 1, 'windows 10', 'windows 10', 'windows 10', 1),
(29, 41, 'test', 2, 2, 2, '-', '-', '-', 1),
(30, 42, 'test', 4, 8, 250, 'windows 10', '-', '-', 1),
(31, 46, 'sasdad', 4, 8, 250, 'windows 10', '-', '-', 1),
(32, 46, 'test', 4, 8, 250, 'windows 10', '-', '-', 1),
(33, 47, 'test', 4, 8, 200, '-', '-', '-', 1),
(34, 47, 'test', 4, 8, 200, '-', '-', '-', 1),
(35, 47, 'test', 4, 8, 200, '-', '-', '-', 1),
(36, 47, 'test', 4, 8, 200, '-', '-', '-', 1),
(40, 23, 'test', 4, 8, 200, '-', '-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `bom_vm_resource_old`
--

CREATE TABLE `bom_vm_resource_old` (
  `id` int(11) NOT NULL,
  `id_bom_old` int(11) NOT NULL,
  `name_server` varchar(100) DEFAULT NULL,
  `cpu` int(11) DEFAULT NULL,
  `memory` int(11) DEFAULT NULL,
  `disk` int(11) DEFAULT NULL,
  `os` varchar(100) DEFAULT NULL,
  `sql` varchar(100) DEFAULT NULL,
  `additional` varchar(100) DEFAULT NULL,
  `inuse` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `bom_vm_resource_old`
--

INSERT INTO `bom_vm_resource_old` (`id`, `id_bom_old`, `name_server`, `cpu`, `memory`, `disk`, `os`, `sql`, `additional`, `inuse`) VALUES
(1, 42, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(2, 42, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(3, 42, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(4, 42, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(5, 42, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(6, 42, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(7, 43, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(8, 43, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(9, 43, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(10, 43, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(11, 43, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(12, 43, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(13, 43, 'test_v1', 4, 16, 400, 'windows 10', 'test', 'test edit', 1),
(14, 44, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(15, 44, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(16, 44, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(17, 44, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(18, 44, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(19, 44, 'test', 4, 8, 200, 'windows 10', 'microsoft sql', '-', 1),
(20, 44, 'test_v1', 4, 16, 400, 'windows 10', 'test', '', 1),
(21, 45, 'test', 1, 1, 1, 'windows 10', 'windows 10', 'windows 10', 1),
(22, 47, 'test', 4, 8, 200, '-', '-', '-', 1),
(23, 48, 'test', 4, 8, 200, '-', '-', '-', 1),
(24, 49, 'test', 4, 8, 200, '-', '-', '-', 1);

-- --------------------------------------------------------

--
-- Table structure for table `item_info`
--

CREATE TABLE `item_info` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `item_code` varchar(255) DEFAULT NULL,
  `units` varchar(10) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `onetime` tinyint(1) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_info`
--

INSERT INTO `item_info` (`id`, `id_product`, `name`, `item_code`, `units`, `price`, `onetime`, `description`, `create_date`, `create_by`, `inuse`) VALUES
(818, 477, 'VMaaS Customize', 'GH-04002005', 'Project', 0, 0, 'AIX', '2019-05-12 00:00:09', '60336', 1),
(819, 477, 'Add on CPU', 'GH-04002006', 'vCPU', 1200, 0, 'AIX', '2019-05-12 00:00:09', '60336', 1),
(820, 477, 'Add on Memory', 'GH-04002007', 'GB', 176, 0, 'AIX', '2019-05-12 00:00:09', '60336', 1),
(821, 477, 'Add on Disk Storage', 'GH-04002008', 'GB', 3.2, 0, 'AIX', '2019-05-12 00:00:09', '60336', 1),
(822, 477, 'Operation cost', 'GH-04002009', 'LPAR', 3040, 0, 'AIX', '2019-05-12 00:00:09', '60336', 1),
(823, 477, 'IP Address', 'GH-04002010', 'IP', 80, 0, 'AIX', '2019-05-12 00:00:09', '60336', 1),
(824, 477, 'AIX  VMaaS Package Bronze', 'GH-04002001', 'VM', 5200, 0, 'VMaaS Package Bronze', '2019-05-12 00:00:09', '60336', 1),
(825, 477, 'AIX VMaaS Package Silver', 'GH-04002002', 'VM', 7600, 0, 'VMaaS Package Silver', '2019-05-12 00:00:09', '60336', 1),
(826, 477, 'AIX VMaaS Package Gold', 'GH-04002003', 'VM', 12400, 0, 'VMaaS Package Gold', '2019-05-12 00:00:09', '60336', 1),
(827, 477, 'AIX VMaaS Package Platinum', 'GH-04002004', 'VM', 22000, 0, 'VMaaS Package Platinum', '2019-05-12 00:00:09', '60336', 1),
(828, 477, 'AIX VMaaS Customize', 'GH-04002005', 'Project', 0, 0, 'VMaaS Customize', '2019-05-12 00:00:09', '60336', 1),
(829, 480, 'AS/400 DRaaS', 'GH-04009001', 'Project', 0, 0, 'DRaaS', '2019-05-12 00:00:09', '60336', 1),
(830, 480, 'AS/400 VMaaS', 'GH-04009002', 'Project', 0, 0, 'VMaaS ', '2019-05-12 00:00:09', '60336', 1),
(831, 478, 'Sparc Cloud VMaaS Package S', 'GH-05002001', 'VM', 4400, 0, 'VMaaS Package S', '2019-05-12 00:00:09', '60336', 1),
(832, 478, 'Sparc Cloud VMaaS Package M', 'GH-05002002', 'VM', 6800, 0, 'VMaaS Package M', '2019-05-12 00:00:09', '60336', 1),
(833, 478, 'Sparc Cloud VMaaS Package L', 'GH-05002003', 'VM', 11200, 0, 'VMaaS Package L', '2019-05-12 00:00:09', '60336', 1),
(834, 478, 'Sparc Cloud VMaaS Package XL', 'GH-05002004', 'VM', 16000, 0, 'VMaaS Package XL', '2019-05-12 00:00:09', '60336', 1),
(835, 478, 'Sparc Cloud VMaaS Customize', 'GH-04005005', 'Project', 0, 0, 'VMaaS Customize', '2019-05-12 00:00:09', '60336', 1),
(836, 478, 'Sparc Cloud Add on Disk SSD Storage', 'GH-04005006', 'GB', 8.8, 0, 'Add on Disk SSD Storage', '2019-05-12 00:00:09', '60336', 1),
(837, 478, 'Sparc Cloud Add on Disk HYBRID Storage', 'GH-04005007', 'GB', 3.6, 0, 'Add on Disk HYBRID Storage', '2019-05-12 00:00:09', '60336', 1),
(838, 478, 'Sparc Cloud Add on Disk SATA Storage', 'GH-04005008', 'GB', 2.4, 0, 'Add on Disk SATA Storage', '2019-05-12 00:00:09', '60336', 1),
(839, 478, 'Sparc Cloud Add on CPU', 'GH-04005009', 'vCPU', 400, 0, 'Add on CPU', '2019-05-12 00:00:09', '60336', 1),
(840, 478, 'Sparc Cloud Add on Memory', 'GH-04005010', 'GB', 200, 0, 'Add on Memory', '2019-05-12 00:00:09', '60336', 1),
(841, 478, 'VMaaS Customize', 'GH-04005005', 'Project', 0, 0, 'Sparc Cloud', '2019-05-12 00:00:09', '60336', 1),
(842, 478, 'Operation cost', 'GH-04005006', 'LDOM', 1920, 0, 'Sparc Cloud', '2019-05-12 00:00:09', '60336', 1),
(843, 478, 'IP Address', 'GH-04005005', 'IP', 80, 0, 'Sparc Cloud', '2019-05-12 00:00:09', '60336', 1),
(844, 479, 'Marketing Fund IBM', 'GH-04001004', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(845, 479, 'Marketing Fund Oracle', 'GH-04001006', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(846, 479, 'Rebate Oracle', 'GH-04001005', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(847, 479, 'Rebate IBM', 'GH-04001003', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(848, 479, 'Prof. Service', 'GH-04001002', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(849, 479, 'Trading', 'GH-04001001', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(850, 481, 'IaaS', 'GH-08002001', 'Package', 56000, 0, 'INET-AI IaaS', '2019-05-12 00:00:09', '60336', 1),
(851, 481, 'PaaS', 'GH-08002002', 'Package', 80000, 0, 'INET-AI PaaS', '2019-05-12 00:00:09', '60336', 1),
(852, 481, 'SaaS', 'GH-08002003', 'Project', 0, 0, 'INET-AI SaaS', '2019-05-12 00:00:09', '60336', 1),
(853, 481, 'Add on Disk Storage', 'GH-08002004', 'GB', 8.8, 0, 'INET-AI Add on Disk Storage', '2019-05-12 00:00:09', '60336', 1),
(854, 481, 'Add on CPU', 'GH-08002005', 'vCPU', 2560, 0, 'INET-AI Add on CPU', '2019-05-12 00:00:09', '60336', 1),
(855, 481, 'Add on Memory', 'GH-08002006', 'GB', 170, 0, 'INET-AI Add on Memory', '2019-05-12 00:00:09', '60336', 1),
(856, 482, 'Monthly fee for INET-Dell Cloud (Resource Pool)', 'GH-06002005', 'Project', 0, 0, 'Dell', '2019-05-12 00:00:09', '60336', 1),
(857, 482, 'Add IP  Address', 'GH-06002006', 'IP', 80, 0, 'Monthly fee for INET-Dell Cloud  ', '2019-05-12 00:00:09', '60336', 1),
(858, 482, 'VM Fee (BW, Antivirus, Operation Monitoring& Alert)', 'GH-06002007', 'VM', 536, 0, 'Monthly fee for INET-Dell Cloud  ', '2019-05-12 00:00:09', '60336', 1),
(859, 482, 'Add HDD', 'GH-06002008', 'GB', 3.2, 0, 'Monthly fee for INET-Dell Cloud  ', '2019-05-12 00:00:09', '60336', 1),
(860, 482, 'Add VRAM', 'GH-06002009', 'GB', 192, 0, 'Monthly fee for INET-Dell Cloud  ', '2019-05-12 00:00:09', '60336', 1),
(861, 482, 'Add VCPU', 'GH-06002010', 'VCPU', 240, 0, 'Monthly fee for INET-Dell Cloud  ', '2019-05-12 00:00:09', '60336', 1),
(862, 482, 'Monthly fee for INET-Back up', 'GH-06002011', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(863, 482, 'Monthly fee for INET-Back up (VDisk (Hybrid )', 'GH-06002012', 'GB', 4, 0, 'à¸à¸²à¸£à¸ªà¸³à¸£à¸­à¸‡à¸‚à¹‰à¸­à¸¡à¸¹à¸¥ ( Back Up Data )  à¸žà¸¶à¹ˆà¸‡à¹€à¸žà¸´à¹ˆà¸¡', '2019-05-12 00:00:09', '60336', 1),
(864, 482, 'Monthly fee for INET-Back up (BW Transfer (Upload))', 'GH-06002013', 'Mbps', 16, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(865, 482, 'Monthly fee for INET-Back up (Offsite Virtual)', 'GH-06002014', 'VM', 960, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(866, 482, 'Monthly fee for INET-Back up (Offsite Physical Server)', 'GH-06002015', 'License', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(867, 482, 'Monthly fee for INET-Back up (On site File Level back up)', 'GH-06002016', 'License', 800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(868, 482, 'Monthly fee for INET-Back up (Off site File level back up)', 'GH-06002017', 'License', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(869, 482, 'Monthly fee for INET-DR', 'GH-06002018', 'unit', 0, 0, 'â€¦.', '2019-05-12 00:00:09', '60336', 1),
(870, 482, 'Monthly fee for INET-DR (BW Transfer (Upload))', 'GH-06002019', 'Mbps', 16, 0, 'Site à¸ªà¸³à¸£à¸­à¸‡à¸‚à¹‰à¸­à¸¡à¸¹à¸¥à¹€à¸žà¸·à¹ˆà¸­à¹„à¸¡à¹ˆà¹ƒà¸«à¹‰à¹€à¸à¸´à¸”à¸„à¸§à¸²à¸¡à¹€à¸ªà¸µà¸¢à¸«à¸²à¸¢à¸‚à¹‰à¸­à¸¡à¸¹à¸¥  à¸žà¸¶à¹ˆà¸‡à¹€à¸žà¸´à¹ˆà¸¡', '2019-05-12 00:00:09', '60336', 1),
(871, 482, 'Monthly fee for INET-DR (Veeam Backup & Replication)', 'GH-06002020', 'VM', 1040, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(872, 482, 'Monthly fee for INET-DR (VCPU)', 'GH-06002021', 'VCPU', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(873, 482, 'Monthly fee for INET-DR (VRam(GB) + VCPP)', 'GH-06002022', 'GB', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(874, 482, 'Monthly fee for INET-DR (VDisk (Hybrid) +VSAN)', 'GH-06002023', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(875, 482, 'Monthly fee for INET-DR (BW, Antivirus, Operation Monitoring& Alert)', 'GH-06002024', 'VM', 536, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(876, 482, 'Monthly fee for INET-Dell Cloud  เพิ่ม (Add SQL License Ent)', 'GH-06002015', 'License', 8640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(877, 482, 'Monthly fee for INET-Dell Cloud (Add SQL License Std)', 'GH-06002014', 'License', 4480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(878, 482, 'Monthly fee for INET-Dell Cloud เพิ่ม (Add Windows License Ent)', 'GH-06002013', 'License', 488, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(879, 482, 'Monthly fee for INET-Dell Cloud (Add Windows License Std)', 'GH-06002012', 'License', 408, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(880, 482, 'Monthly fee for INET-Dell Cloud  เพิ่ม Add IP  Address', 'GH-06002011', 'IP', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(881, 482, 'Monthly fee for INET-Dell Cloud  เพิ่ม VM Fee (BW, Antivirus, Operation Monitoring& Alert)', 'GH-06002010', 'VM', 536, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(882, 482, 'Monthly fee for INET-Dell Cloud  เพิ่ม Add HDD', 'GH-06002009', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(883, 482, 'Monthly fee for INET-Dell Cloud  เพิ่ม Add VRAM', 'GH-06002008', 'GB', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(884, 482, 'Monthly fee for INET-Dell Cloud เพิ่ม Add VCPU', 'GH-06002007', 'VCPU', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(885, 482, 'Monthly fee for INET-Dell Cloud  (Add Remote Desktop License)', 'GH-06002006', 'License', 168, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(886, 482, 'Monthly fee for INET-Dell Cloud (Resource Pool)', 'GH-06002005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(887, 482, 'Monthly fee for INET-Dell Cloud (Package,Platinum)', 'GH-06002004', 'VM', 4000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(888, 482, 'Monthly fee for INET-Dell Cloud (Package, Gold)', 'GH-06002003', 'VM', 2560, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(889, 482, 'Monthly fee for INET-Dell Cloud (Package, Silver)', 'GH-06002002', 'VM', 1920, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(890, 482, 'Monthly fee for INET-Dell Cloud (Package, Bronze)', 'GH-06002001', 'VM', 1360, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(891, 482, 'Monthly fee for INET-Back up', 'GH-06002016', 'unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(892, 482, 'Monthly fee for INET-DR', 'GH-06002017', 'unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(893, 482, 'Monthly fee for INET-NSX Solfware    แก้ไข การสร้างและจัดการ Virtual Machine & Security', 'GH-06002018', 'Unit', 162, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(894, 485, 'Monthly fee for INET-BDaas  (Customize spec)', 'GH-06003002', 'unit', 0, 0, 'Customize spec à¸›à¸£à¸±à¸š Spec à¸•à¸²à¸¡ Requirement à¸‚à¸­à¸‡à¸¥à¸¹à¸à¸„à¹‰à¸²', '2019-05-12 00:00:09', '60336', 1),
(895, 485, 'Big data Storage', 'GH-06003003', 'GB', 4.8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(896, 485, 'Add IP  Address', 'GH-06003004', 'IP', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(897, 485, 'VM Fee (BW, Antivirus, Operation Monitoring& Alert)', 'GH-06003005', 'VM', 536, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(898, 485, 'Add HDD', 'GH-06003006', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(899, 485, 'Add VRAM', 'GH-06003007', 'GB', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(900, 485, 'Add VCPU', 'GH-06003008', 'VCPU', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(901, 486, 'Monthly fee for INET-CBaas (Customize spec)', 'GH-06004003', 'unit', 0, 0, 'Spec à¹€à¸›à¹‡à¸™ Service à¸›à¸£à¸±à¸š Spec à¸•à¸²à¸¡ Requirement à¸¥à¸¹à¸à¸„à¹‰à¸²', '2019-05-12 00:00:09', '60336', 1),
(902, 486, 'Implement', 'GH-06004004', 'unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(903, 486, 'License', 'GH-06004005', 'unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(904, 486, 'Add IP  Address', 'GH-06004006', 'IP', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(905, 486, 'VM Fee (BW, Antivirus, Operation Monitoring& Alert)', 'GH-06004007', 'VM', 536, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(906, 486, 'Add HDD', 'GH-06004008', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(907, 486, 'Add VRAM', 'GH-06004009', 'GB', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(908, 486, 'Add VCPU', 'GH-06004010', 'VCPU', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(909, 486, 'Monthly fee for INET-CBaas (Starter)', 'GH-06004001', 'unit', 6962.67, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(910, 486, 'Monthly fee for INET-CBaas (Plan A)', 'GH-06004002', 'unit', 12242.7, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(911, 486, 'Monthly fee for INET-CBaas (Customize spec)', 'GH-06004003', 'unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(912, 483, 'Monthly fee for INET-ATaas (Tableau Creator)', 'GH-06005001', 'unit', 3200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(913, 483, 'Monthly fee for INET-ATaas (Tableau Explorer)', 'GH-06005002', 'unit', 2160, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(914, 483, 'Monthly fee for INET-ATaas (Tableau Viewers (Minimum 50 Users))', 'GH-06005003', 'unit', 1120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(915, 483, 'Monthly fee for INET-ATaas (Qlik Professional)', 'GH-06005004', 'unit', 5000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(916, 483, 'Monthly fee for INET-ATaas (Qlik Viewer)', 'GH-06005005', 'unit', 3000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(917, 485, 'Monthly fee for INET-BDaas( Package  : 4 VMs(16vCPU/64GB/400GB))', 'GH-06003001', 'Package', 19200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(918, 485, 'Monthly fee for INET-BDaas  (Customize spec)', 'GH-06003002', 'unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(919, 484, 'Marketing Fund', 'GH-06001004', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(920, 484, 'Rebate', 'GH-06001005', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(921, 484, 'Revenue Share', 'GH-06001003', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(922, 484, 'Prof. Service', 'GH-06001002', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(923, 484, 'Trading', 'GH-06001001', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(924, 484, 'One Time', 'GH-06001006', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(925, 484, 'Operation Service', 'GH-06001007', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(926, 493, 'Monthly fee for INET-HP Cloud (Resource Pool)', 'GH-02002005', 'Project', 0, 0, 'HPE', '2019-05-12 00:00:09', '60336', 1),
(927, 493, 'VM Fee (BW, Antivirus, Operation Monotoring, Alert)', 'GH-02002006', 'VM', 920, 0, 'Monthly fee for INET-HP Cloud ', '2019-05-12 00:00:09', '60336', 1),
(928, 493, 'Add HDD', 'GH-02002006', 'GB', 3.2, 0, 'Monthly fee for INET-HP Cloud ', '2019-05-12 00:00:09', '60336', 1),
(929, 493, 'Add VRAM', 'GH-02002006', 'GB', 192, 0, 'Monthly fee for INET-HP Cloud ', '2019-05-12 00:00:09', '60336', 1),
(930, 493, 'Add VCPU', 'GH-02002006', 'VCPU', 280, 0, 'Monthly fee for INET-HP Cloud ', '2019-05-12 00:00:09', '60336', 1),
(931, 493, 'Monthly fee for INET-HP Cloud [VMaaS] NSX Edge Other vFW Other', 'GH-02002017', 'Project', 0, 0, 'vFW Other', '2019-05-12 00:00:09', '60336', 1),
(932, 493, 'Monthly fee for INET-HP Cloud[VMaaS] VM Fee (BW, Antivirus, Operation, IP, Monotoring)', 'GH-02002016', 'VM', 1120, 0, 'VM Fee (BW, Antivirus, Operation, IP, Monotoring)', '2019-05-12 00:00:09', '60336', 1),
(933, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add vDisk SAS Metrocluster', 'GH-02002015', 'GB', 6, 0, 'SAS Metrocluster', '2019-05-12 00:00:09', '60336', 1),
(934, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add vDisk SSD', 'GH-02002014', 'GB', 3.2, 0, 'SSD', '2019-05-12 00:00:09', '60336', 1),
(935, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add vDisk SATA', 'GH-02002013', 'GB', 1.6, 0, 'SATA', '2019-05-12 00:00:09', '60336', 1),
(936, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add vDisk SAS', 'GH-02002012', 'GB', 3, 0, 'SAS', '2019-05-12 00:00:09', '60336', 1),
(937, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add vRAM RAM', 'GH-02002029', 'GB', 192, 0, 'RAM', '2019-05-12 00:00:09', '60336', 1),
(938, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add vCPU CPU', 'GH-02002028', 'VCPU', 280, 0, 'CPU', '2019-05-12 00:00:09', '60336', 1),
(939, 493, 'Monthly fee for INET-HP Cloud [VMaaS] Other', 'GH-02002027', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(940, 493, 'Monthly fee for INET-HP Cloud[VMaaS] Patinum', 'GH-02002004', 'VM', 4400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(941, 493, 'Monthly fee for INET-HP Cloud[VMaaS] Gold', 'GH-02002003', 'VM', 2640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(942, 493, 'Monthly fee for INET-HP Cloud[VMaaS] Silver', 'GH-02002002', 'VM', 2080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(943, 493, 'Monthly fee for INET-HP Cloud[VMaaS] Bronz', 'GH-02002001', 'VM', 1440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(944, 493, 'Monthly  fee for INET-HP Cloud [VMaaS] Add SUSE SUSE Standard', 'GH-02002018', 'License', 0, 0, 'SUSE Standard', '2019-05-12 00:00:09', '60336', 1),
(945, 493, 'Monthly  fee for INET-HP Cloud [VMaaS] Add SQL Ent SQL Ent License', 'GH-02002019', 'License', 8640, 0, 'SQL Ent License', '2019-05-12 00:00:09', '60336', 1),
(946, 493, 'Monthly  fee for INET-HP Cloud [VMaaS] Add SQL Std SQL Std License', 'GH-02002020', 'License', 4480, 0, 'SQL Std License', '2019-05-12 00:00:09', '60336', 1),
(947, 493, 'Monthly  fee for INET-HP Cloud [VMaaS] Add Window  Datacenter Window Datacenter License', 'GH-02002021', 'License', 960, 0, 'Window Datacenter License', '2019-05-12 00:00:09', '60336', 1),
(948, 493, 'Monthly  fee for INET-HP Cloud [VMaaS] Add Window  Ent Window Ent License', 'GH-02002022', 'License', 488, 0, 'Window Ent License', '2019-05-12 00:00:09', '60336', 1),
(949, 493, 'Monthly  fee for INET-HP Cloud [VMaaS] Add Window  Std Window Std License', 'GH-02002023', 'License', 408, 0, 'Window Std License', '2019-05-12 00:00:09', '60336', 1),
(950, 493, 'Monthly fee for INET-HP Cloud [VMaaS] Add Red Hat Red Hat License', 'GH-02002024', 'License', 0, 0, 'Red Hat License', '2019-05-12 00:00:09', '60336', 1),
(951, 493, 'Monthly fee for INET-HP Cloud [VMaaS]Add IP', 'GH-02002025', 'IP', 80, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(952, 493, 'INET-HP Cloud [VMaaS] OwnCloud Customization Fee One Time', 'GH-02002026', 'Time', 1500, 1, 'One Time', '2019-05-12 00:00:09', '60336', 1),
(953, 493, 'Monthly fee for INET-HP Cloud [VMaaS] Platinum OwnCloud', 'GH-02002009', 'VM', 4400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(954, 493, 'Monthly fee for INET-HP Cloud [VMaaS] Gold OwnCloud', 'GH-02002008', 'VM', 2640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(955, 493, 'Monthly fee for INET-HP Cloud [VMaaS] Silver OwnCloud', 'GH-02002007', 'VM', 2080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(956, 493, 'Monthly fee for INET-HP Cloud [VMaaS] Bronz OwnCloud', 'GH-02002006', 'VM', 1440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(957, 493, 'Monthly fee for INET-HP Cloud [VMaaS] NSX Edge Quad-Large', 'GH-02002010', 'VM', 2000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(958, 493, 'Monthly fee for INET-HP Cloud [VMaaS] NSX Edge X-Large', 'GH-02002011', 'VM', 4000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(959, 493, 'HPE Monthly fee for INET-HP Cloud (Resource Pool)', 'GH-02002005', 'Project', 0, 0, 'Monthly fee for INET-HP Cloud (Resource Pool)', '2019-05-12 00:00:09', '60336', 1),
(960, 491, 'Monthly fee for INET-HP Cloud [BaaS] Other Backup Other', 'GH-02003004', 'Project', 0, 0, 'Backup Other', '2019-05-12 00:00:09', '60336', 1),
(961, 491, 'Monthly fee for INET-HP Cloud [BaaS] Acronis Backup Veeam Acronis', 'GH-02003003', 'Project', 0, 0, 'Backup Veeam Acronis', '2019-05-12 00:00:09', '60336', 1),
(962, 491, 'Monthly fee for INET-HP Cloud [BaaS] Veeam-Onsite Backup Veeam Onsite', 'GH-02003002', 'Project', 0, 0, 'Backup Veeam Onsite', '2019-05-12 00:00:09', '60336', 1),
(963, 491, 'Monthly fee for INET-HP Cloud [BaaS] Veeam-Offsite Backup Veeam Offsite', 'GH-02003001', 'Project', 0, 0, 'Backup Veeam Offsite', '2019-05-12 00:00:09', '60336', 1),
(964, 490, 'Monthly fee for INET-HP Cloud [BMaaS] Other Bare Metal XL', 'GH-02005005', 'Package', 36000, 0, 'Bare Metal XL', '2019-05-12 00:00:09', '60336', 1),
(965, 490, 'Monthly fee for INET-HP Cloud [BMaaS] Platinum Bare Metal L', 'GH-02005004', 'Package', 32000, 0, 'Bare Metal L', '2019-05-12 00:00:09', '60336', 1),
(966, 490, 'Monthly fee for INET-HP Cloud [BMaaS] Gold Bare Metal M', 'GH-02005003', 'Package', 27200, 0, 'Bare Metal M', '2019-05-12 00:00:09', '60336', 1),
(967, 490, 'Monthly fee for INET-HP Cloud [BMaaS] Silver Bare Metal S', 'GH-02005002', 'Package', 23200, 0, 'Bare Metal S', '2019-05-12 00:00:09', '60336', 1),
(968, 490, 'Monthly fee for INET-HP Cloud [BMaaS] Bronz Bare Metal XS', 'GH-02005001', 'Package', 20800, 0, 'Bare Metal XS', '2019-05-12 00:00:09', '60336', 1),
(969, 492, 'Monthly fee for INET-HP Cloud [DRaaS] Other DR Other', 'GH-02004003', 'Project', 0, 0, 'DR Other', '2019-05-12 00:00:09', '60336', 1),
(970, 492, 'Monthly fee for INET-HP Cloud [DRaaS] Veeam DR Veeam', 'GH-02004001', 'Project', 0, 0, 'DR Veeam', '2019-05-12 00:00:09', '60336', 1),
(971, 487, 'Marketing  Fund One Time', 'GH-02001001', 'Project', 0, 1, 'One Time', '2019-05-12 00:00:09', '60336', 1),
(972, 487, 'Rebate One Time', 'GH-02001002', 'Project', 0, 1, 'One Time', '2019-05-12 00:00:09', '60336', 1),
(973, 487, 'Monthly fee for INET-HP Cloud Prof. Service Professional Service', 'GH-02001003', 'Project', 0, 1, 'Professional Service', '2019-05-12 00:00:09', '60336', 1),
(974, 489, 'Monthly fee for INET-HP Cloud [HNaas] SAP Other SAP Other', 'GH-02006006', 'Project', 0, 0, 'SAP Other', '2019-05-12 00:00:09', '60336', 1),
(975, 489, 'Monthly fee for INET-HP Cloud [HNaas] SAP DR SAP DR', 'GH-02006005', 'Project', 0, 0, 'SAP DR', '2019-05-12 00:00:09', '60336', 1),
(976, 489, 'Monthly fee for INET-HP Cloud [HNaas] SAP Backup SAP Backup', 'GH-02006004', 'Project', 0, 0, 'SAP Backup', '2019-05-12 00:00:09', '60336', 1),
(977, 489, 'Monthly fee for INET-HP Cloud [HNaaS] SAP Hana SAP Hana VM', 'GH-02006003', 'Project', 0, 0, 'SAP Hana VM', '2019-05-12 00:00:09', '60336', 1),
(978, 489, 'Monthly fee for INET-HP Cloud [HNaaS] SAP B1 SAP B1 VM', 'GH-02006002', 'Project', 0, 0, 'SAP B1 VM', '2019-05-12 00:00:09', '60336', 1),
(979, 489, 'Monthly fee for INET-HP Cloud [HNaaS] SAP A1 SAP A1 VM', 'GH-02006001', 'Project', 0, 0, 'SAP A1 VM', '2019-05-12 00:00:09', '60336', 1),
(980, 489, 'Monthly fee for INET-HP Cloud [HNaaS] Add SUSE SUSE For SAP', 'GH-02006007', 'Project', 0, 0, 'SUSE For SAP', '2019-05-12 00:00:09', '60336', 1),
(981, 489, 'Monthly fee for INET-HP Cloud [HNaaS] Add Redhat Redhat For SAP', 'GH-02006008', 'Project', 0, 0, 'Redhat For SAP', '2019-05-12 00:00:09', '60336', 1),
(982, 488, 'INET-HP Cloud Customization Service Fee One Time', 'GH-02007001', 'Project', 0, 1, 'One Time', '2019-05-12 00:00:09', '60336', 1),
(983, 488, 'Monthly fee for Dedicate Storage IO 1,000 IOPs', 'GH-02007002', 'IOPs', 1000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(984, 489, 'Monthly fee for INET-HP Cloud [HNaaS] Implement HANA One Time', 'GH-02006009', 'Time', 500000, 1, 'One Time', '2019-05-12 00:00:09', '60336', 1),
(985, 494, 'Monthly fee for INET-Nutanix Hosting VM', 'GH-03002016', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(986, 494, 'Monthly fee for INET-Nutanix Cloud (Add vRAM)', 'GH-03002014', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(987, 494, 'Monthly fee for INET-Nutanix Cloud (Add vDisk)', 'GH-03002017', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(988, 494, 'Monthly fee for INET-Nutanix Cloud (Add vCPU)', 'GH-03002018', 'VCPU', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(989, 494, 'Cost B/W(follow VM) Shared Domestic 5Gbps/Inter50Mbps', 'GH-03002019', 'VM', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(990, 494, 'IP  Address(follow VM)', 'GH-03002020', 'IP', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(991, 494, 'Monitoring& Alert(follow VM)', 'GH-03002021', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(992, 494, 'Antivirus(follow VM)', 'GH-03002022', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(993, 494, 'Operation Cost(follow VM)', 'GH-03002023', 'Vm', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(994, 494, 'Monthly fee for INET-Nutanix Cloud (Resource Pool)', 'GH-03002005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(995, 494, 'Monthly fee for INET-Nutanix Cloud (Add vRAM)', 'GH-03002014', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(996, 494, 'Monthly fee for INET-Nutanix Cloud (Add vDisk)', 'GH-03002017', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(997, 494, 'Monthly fee for INET-Nutanix Cloud (Add vCPU)', 'GH-03002018', 'VCPU', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(998, 494, 'Cost B/W(follow VM) Shared Domestic 5Gbps/Inter50Mbps', 'GH-03002019', 'VM', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(999, 494, 'IP  Address(follow VM)', 'GH-03002020', 'IP', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1000, 494, 'Monitoring& Alert(follow VM)', 'GH-03002021', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1001, 494, 'Antivirus(follow VM)', 'GH-03002022', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1002, 494, 'Operation Cost(follow VM)', 'GH-03002023', 'Vm', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1003, 494, 'Monthly fee forINET-NutanixCloud (Package,Platinum)', 'GH-03002004', 'VM', 3360, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1004, 494, 'Monthly fee for INET-Nutanix Cloud (Package,Silver)', 'GH-03002002', 'VM', 1840, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1005, 494, 'Monthly fee for INET-Nutanix Cloud (Package,Bronze)', 'GH-03002001', 'VM', 1280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1006, 494, 'Monthly fee for INET-Nutanix Cloud (Resource Pool)', 'GH-03002005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1007, 494, 'Monthly fee for INET-Nutanix Cloud (Package, Gold)', 'GH-03002003', 'VM', 2480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1008, 494, 'Monthly fee for INET-Nutanix Cloud (Add Windows Std License)', 'GH-03002010', 'License', 408, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1009, 494, 'Monthly fee for INET-Nutanix Cloud (Add Windows Ent License)', 'GH-03002012', 'License', 488, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1010, 494, 'Monthly fee for INET-Nutanix Cloud (Add Windows Datacenter License)', 'GH-03002013', 'License', 960, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1011, 494, 'Monthly fee for INET-Nutanix Cloud (Add SQL Std License)', 'GH-03002011', 'License', 4480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1012, 494, 'Monthly fee for INET-Nutanix Cloud (Add SQL Ent License)', 'GH-03002015', 'License', 8640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1013, 494, 'Monthly fee for INET-Nutanix Cloud (Add SQL License  Web Edition )', 'GH-03002006', 'License', 288, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1014, 494, 'Monthly fee for INET-Nutanix Cloud (Add Remote Desktop License)', 'GH-03002027', 'License', 168, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1015, 495, 'Monthly fee for INET-Nutanix DRaaS', 'GH-03003001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1016, 495, 'Monthly fee for INET-Nutanix Cloud (Add vRAM)', 'GH-03002014', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1017, 495, 'Monthly fee for INET-Nutanix Cloud (Add vDisk)', 'GH-03002017', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1018, 495, 'Monthly fee for INET-Nutanix Cloud (Add vCPU)', 'GH-03002018', 'VCPU', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1019, 495, 'VDisk (SSD) Snapshot 7 Coppies(On/Off Site)', 'GH-03003005', 'GB', 4.8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1020, 495, 'Cost B/W(follow VM) Shared Domestic 5Gbps/Inter50Mbps', 'GH-03002019', 'VM', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1021, 495, 'IP  Address(follow VM)', 'GH-03002020', 'IP', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1022, 495, 'Monitoring& Alert(follow VM)', 'GH-03002021', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1023, 495, 'Antivirus(follow VM)', 'GH-03002022', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1024, 495, 'Operation Cost(follow VM)', 'GH-03002023', 'Vm', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1025, 496, 'NX Backup Offite  Veeam Backup (Virtual)', 'GH-03005001', 'Project', 0, 0, 'à¸£à¸¹à¸›à¹à¸šà¸šà¸à¸²à¸£à¸—à¸³ Backup VM à¹à¸šà¸š Offisite à¸¡à¸²à¸¢à¸±à¸‡ Cloudà¹à¸šà¸š CloudSide à¸£à¸­à¸‡à¸£à¸±à¸š Physical , Virtualization', '2019-05-12 00:00:09', '60336', 1),
(1026, 496, 'VDisk (Hybrid)', 'GH-03005003', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1027, 496, 'License Backup Offsite Service + Veeam Cloud Connect Backup à¸à¸£à¸“à¸µà¸—à¸µà¹ˆà¸¥à¸¹à¸à¸„à¹‰à¸²à¸¡à¸µ Veeam Lic.', 'GH-03005004', 'VM', 560, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1028, 496, 'License Backup Offsite Service + Veeam Cloud Connect Backup +Veeam BR à¸à¸£à¸“à¸µà¸—à¸µà¹ˆà¸¥à¸¹à¸à¸„à¹‰à¸²à¹„à¸¡à¹ˆà¸¡à¸µ Veeam Lic.', 'GH-03005005', 'VM', 960, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1029, 496, 'Veeam Gateway [Spec 4 vCPU 4 vRAM 60 vDisk(Hybrid), Windows Lic. STD.]  à¸à¸£à¸“à¸µà¸—à¸µà¹ˆà¸œà¹ˆà¸²à¸™ Private', 'GH-03005006', 'VM', 2320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1030, 496, 'BW Transfer (Upload)', 'GH-03005007', 'Mbps', 8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1031, 496, 'NX Backup Offite   Veeam Backup (Physical)', 'GH-03005008', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1032, 496, 'VDisk (Hybrid)', 'GH-03005003', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1033, 496, 'Backup Offsite Service + Veeam Cloud Connect Backup +Veeam Agent of Physical Server', 'GH-03005010', 'Set', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1034, 496, 'Veeam Gateway [Spec 4 vCPU 4 vRAM 60 vDisk(Hybrid), Windows Lic. STD.]  à¸à¸£à¸“à¸µà¸—à¸µà¹ˆà¸œà¹ˆà¸²à¸™ Private', 'GH-03005006', 'VM', 2320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1035, 496, 'BW Transfer (Upload)', 'GH-03005007', 'Mbps', 8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1036, 496, 'Monthly fee for INET-Nutanix File Back Up', 'GH-03005002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1037, 496, 'VDisk (Hybrid)', 'GH-03005003', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1038, 496, 'Backup Service per VM', 'GH-03005014', 'VM', 560, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1039, 497, 'NX DBaas (Tibero) บริการฐานข้อมูลพร้อมใช้งานแบบ Paas ในรูปแบบ Tibero', 'GH-03006002', 'Project', 0, 0, 'à¸šà¸£à¸´à¸à¸²à¸£à¸à¸²à¸™à¸‚à¹‰à¸­à¸¡à¸¹à¸¥à¸žà¸£à¹‰à¸­à¸¡à¹ƒà¸Šà¹‰à¸‡à¸²à¸™à¹à¸šà¸š Paas à¹ƒà¸™à¸£à¸¹à¸›à¹à¸šà¸š Tibero', '2019-05-12 00:00:09', '60336', 1),
(1040, 497, 'Database as a Service (Tibero) - Standard Package', 'GH-03006015', 'Unit', 15120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1041, 497, 'Database Buffer', 'GH-03006016', 'GB', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1042, 497, 'Database Storage + SnapShot 3 Copies (every 8 hrs - Same/Off site)', 'GH-03006017', 'GB', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1043, 497, 'Add Database Buffer', 'GH-03006018', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1044, 497, 'Add Disk for Database - VDisk (Hybrid)', 'GH-03006019', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1045, 497, 'Included Anti-Virus + Public IP 1 IP per vm + Monitoring + Operation + BW', 'GH-03006020', 'Set', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1046, 497, 'Included Anti-Virus + Public IP 1 IP per vm + Monitoring + Operation + BW', 'GH-03006020', 'Set', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1047, 497, 'NX DBaas (My SQL) งานบริการ Data base แบบ Relational + การบริหารจัดการ', 'GH-03006001', 'Project', 0, 0, 'à¸‡à¸²à¸™à¸šà¸£à¸´à¸à¸²à¸£ Data base à¹à¸šà¸š Relational + à¸à¸²à¸£à¸šà¸£à¸´à¸«à¸²à¸£à¸ˆà¸±à¸”à¸à¸²à¸£', '2019-05-12 00:00:09', '60336', 1),
(1048, 497, 'Database as a Service (MySQL) - Package XXXXX', 'GH-03006022', 'Unit', 4600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1049, 497, 'Database Buffer', 'GH-03006016', 'GB', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1050, 497, 'Database Storage + SnapShot 3 Copies (every 8 hrs - Same/Off site)', 'GH-03006017', 'GB', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1051, 497, 'Add Database Buffer', 'GH-03006018', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1052, 497, 'Add Disk for Database - VDisk (Hybrid)', 'GH-03006019', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1053, 497, 'Included Anti-Virus + Public IP 1 IP per vm + Monitoring + Operation + BW', 'GH-03006020', 'Set', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1054, 497, 'NX DBaas (MS SQL)', 'GH-03006008', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1055, 497, 'Database as a Service (MSSQL) - Package XXXXX', 'GH-03006009', 'Unit', 4600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1056, 497, 'Database Memory', 'GH-03006010', 'GB', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1057, 497, 'Database Storage + SnapShot 3 Copies (every 8 hrs - Same/Off site)', 'GH-03006017', 'GB', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1058, 497, 'Add Database Memory', 'GH-03006012', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1059, 497, 'Add Disk for Database - VDisk (Hybrid)', 'GH-03006019', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1060, 497, 'Included Anti-Virus + Public IP 1 IP per vm + Monitoring + Operation + BW', 'GH-03006020', 'Set', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1061, 498, 'Monthly fee for INET-Nutanix Private Cloud', 'GH-03007001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1062, 498, 'Monthly fee for INET-Nutanix Cloud (Add vRAM)', 'GH-03002014', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1063, 498, 'Monthly fee for INET-Nutanix Cloud (Add vDisk)', 'GH-03002017', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1064, 498, 'Monthly fee for INET-Nutanix Cloud (Add vCPU)', 'GH-03002018', 'VCPU', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1065, 498, 'VDisk (SSD) Snapshot 7 Coppies(On/Off Site)', 'GH-03003005', 'GB', 4.8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1066, 498, 'Cost B/W(follow VM) Shared Domestic 5Gbps/Inter50Mbps', 'GH-03002019', 'VM', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1067, 498, 'IP  Address(follow VM)', 'GH-03002020', 'IP', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1068, 498, 'Monitoring& Alert(follow VM)', 'GH-03002021', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1069, 498, 'Antivirus(follow VM)', 'GH-03002022', 'Vm', 104, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1070, 498, 'Operation Cost(follow VM)', 'GH-03002023', 'Vm', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1071, 499, 'Trading', 'GH-03001001', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1072, 499, 'Rebate', 'GH-03001003', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1073, 499, 'Prof. Service', 'GH-03001002', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1074, 499, 'Marketing  Fund', 'GH-03001004', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1075, 495, 'Monthly fee for INET-Nutanix DRaaS', 'GH-03003001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1076, 502, 'Monthly fee for Implementation', 'VO-01003001', 'Time', 2400, 0, 'Monthly fee for VDI Implementation', '2019-05-12 00:00:09', '60336', 1),
(1077, 500, 'VDI Marketing Fund', 'VO-01001004', 'Project', 0, 1, 'VDI Marketing Fund', '2019-05-12 00:00:09', '60336', 1),
(1078, 500, 'Prof. Service VDI Professional service', 'VO-01001002', 'Project', 0, 1, 'Prof. Service VDI Professional service', '2019-05-12 00:00:09', '60336', 1),
(1079, 500, 'VDI Rebate', 'VO-01001003', 'Project', 0, 1, 'VDI Rebate', '2019-05-12 00:00:09', '60336', 1),
(1080, 500, 'VDI Trading', 'VO-01001001', 'Project', 0, 1, 'VDI Trading', '2019-05-12 00:00:09', '60336', 1),
(1081, 501, 'Monthly fee for VDI add CPU', 'VO-01002014', 'VCPU', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1082, 501, 'Monthly fee for VDI add RAM', 'VO-01002015', 'GB', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1083, 501, 'Monthly fee for VDI add Disk', 'VO-01002016', 'GB', 3.2, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1084, 501, 'Monthly fee for VDI add MS Office Professional', 'VO-01002007', 'Account', 480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1085, 501, 'Monthly fee for VDI add MS Office Standard', 'VO-01002005', 'Account', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1086, 501, 'Monthly fee for VDI add MS O365', 'VO-01002017', 'License', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1087, 501, 'Monthly fee for VDI SmartVDI for Express', 'VO-01002018', 'Account', 96, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1088, 501, 'Monthly fee for Citrix Hostedshare', 'VO-01002002', 'Account', 600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1089, 501, 'Monthly fee for VDI SmartVDI Standalone', 'VO-01002004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1090, 501, 'Monthly fee for VDI SmartVDI Farm', 'VO-01002006', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1091, 501, 'Monthly fee for VDI Citrix Broker Size S', 'VO-01002009', 'Project', 8000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1092, 501, 'Monthly fee for VDI Citrix Broker Size M', 'VO-01002010', 'Project', 36800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1093, 501, 'Monthly fee for VDI Managed Service', 'VO-01002012', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1094, 501, 'Monthly fee for Citrix Dedicate Desktop', 'VO-01002001', 'Account', 960, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1095, 501, 'Monthly fee for Citrx Hostedshare', 'VO-01002019', 'Account', 750, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1096, 501, 'Monthly fee for Citrix Virtual App', 'VO-01002003', 'Account', 650, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1097, 501, 'Monthly fee for Horiton Dedicate Desktop', 'VO-01002020', 'Account', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1098, 501, 'Monthly fee for Horiton Hostedshare', 'VO-01002021', 'Account', 600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1099, 501, 'Monthly fee for Horiton Virtual App', 'VO-01002022', 'Account', 520, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1100, 501, 'Monthly fee for SmartVDI', 'VO-01002023', 'Account', 520, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1101, 501, 'Monthly fee for VDI Peripheral box monitor mouse keyboard', 'VO-01002008', 'Account', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1102, 501, 'Monthly fee for VDI Horizon Tenant Size S', 'VO-01002025', 'Project', 6100, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1103, 501, 'Monthly fee for VDI Horizon Tenant Size M', 'VO-01002026', 'Project', 11000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1104, 501, 'Monthly fee for VDI Horizon Tenant Size L', 'VO-01002027', 'Project', 17200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1105, 501, 'Monthly fee for VDI Citrix Broker Size L', 'VO-01002011', 'Project', 60800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1106, 503, 'Contact Value', 'CT-CC001001', 'agent', 25000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1107, 503, 'Customer Satisfaction', 'CT-CC001002', 'agent', 12500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1108, 503, 'Customer Satisfaction(Add on)', 'CT-CC001003', 'Person', 50, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1109, 503, 'Expert Domain', 'CT-CC001004', 'agent', 27000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1110, 503, 'Tele Sales (Option 1)', 'CT-CC001005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1111, 503, 'Tele Sales (Option 1,Complete)', 'CT-CC001006', 'Person', 40, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1112, 503, 'Tele Sales (Option 1,Not Complete)', 'CT-CC001007', 'Person', 20, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1113, 503, 'Tele Sales (Option 2)', 'CT-CC001008', 'agent', 22500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1114, 503, 'Contact Center System', 'CT-CC001009', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1115, 503, 'ค่าโทรศัพท์', 'CT-CC001010', 'minute', 1.5, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1116, 503, 'Software CRM', 'CT-CC001011', 'System', 100000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1117, 503, '4 Digit (Option 1)', 'CT-CC001012', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1118, 503, '4 Digit (Option 2,First Year)', 'CT-CC001013', 'agent', 17000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1119, 503, '4 Digit (Option 2,Ohther Year)', 'CT-CC001014', 'agent', 16000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1120, 503, 'Seat Facility rental(Options 1 : Operating time :  8 hrs x 5 days)', 'CT-CC001015', 'Seat', 7000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1121, 503, 'Seat Facility rental(Options 2 : Operating time :  8 hrs x 7 days)', 'CT-CC001016', 'Seat', 9000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1122, 503, 'Seat Facility rental(Options 3 : Operating time :  24 hrs x 7 days)', 'CT-CC001017', 'Seat', 14000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1123, 503, 'BCP(Options 1 : Operating time :  8 hrs x 5 days)', 'CT-CC001018', 'Seat', 7000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1124, 503, 'BCP(Options 1 : Operating time :  8 hrs x 7 days)', 'CT-CC001019', 'Seat', 9000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1125, 503, 'BCP(Options 1 : Operating time :  24 hrs x 7 days)', 'CT-CC001020', 'Seat', 14000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1126, 503, 'Contact Center Fully Outsourced (Shared Agent + System)', 'CT-CC001021', 'Seat', 22500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1127, 503, 'Contact Center Fully Outsourced (Dedicate Agent + System)', 'CT-CC001022', 'Seat', 27000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1128, 503, 'Contact Center Fully Outsourced (Dedicate Agent )', 'CT-CC001023', 'Seat', 22500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1129, 503, 'Contact Center Fully Outsourced (Shared Agent )', 'CT-CC001024', 'Seat', 19000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1130, 503, 'Tele PR', 'CT-CC001025', 'Person', 30, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1131, 503, 'Data Cleansing', 'CT-CC001026', 'Person', 30, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1132, 503, 'Data Cleansing(Add on Data)', 'CT-CC001027', 'Person', 10, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1133, 503, 'Chat bot (Starter Plans)', 'CT-CC001028', 'Project', 9900, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1134, 503, 'Chat bot (Plans S)', 'CT-CC001029', 'Project', 19990, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1135, 503, 'Chat bot (Plans M)', 'CT-CC001030', 'Project', 29990, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1136, 503, 'Chat bot (Plans L)', 'CT-CC001031', 'Project', 39990, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1137, 503, 'Contact Center Consultant', 'CT-CC001032', 'Project', 10000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1138, 503, 'Lead Generation', 'CT-CC001033', 'Person', 50, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1139, 503, 'Chat bot Consultant', 'CT-CC001034', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1140, 503, 'Setup fee', 'CT-CC001035', 'Project', 10000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1141, 504, 'Project Management Service PM+UAT Package S', 'SP-01001001', 'Unit', 1000, 0, 'PM+UAT Package S', '2019-05-12 00:00:09', '60336', 1),
(1142, 504, 'Project Management Service PM+UAT Package M', 'SP-01001002', 'Unit', 2000, 0, 'PM+UAT Package M', '2019-05-12 00:00:09', '60336', 1),
(1143, 504, 'Project Management Service PM+UAT Package L', 'SP-01001003', 'Unit', 3000, 0, 'PM+UAT Package L', '2019-05-12 00:00:09', '60336', 1),
(1144, 509, 'Project Management Service for BCP', 'SP-01001004', 'Time', 3000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1145, 505, 'Manage service Package S', 'SP-01002001', 'Unit', 1000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1146, 505, 'Manage service Package M', 'SP-01002002', 'Unit', 2000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1147, 505, 'Manage service Package L', 'SP-01002003', 'Unit', 3000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1148, 506, 'Implementation Monitor (PRTG) Implement Monitoring & Alert 1 VM  (5 sensor)', 'SP-01003001', 'Unit', 1000, 0, 'Implement Monitoring & Alert 1 VM  (5 sensor)', '2019-05-12 00:00:09', '60336', 1),
(1149, 507, 'Portal Monitoring Service VM', 'SP-01004001', 'Unit', 3000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1150, 508, 'Implementation Active Directory (AD) Implement AD (One time charge)', 'SP-01005002', 'Time', 30000, 1, 'Implement AD (One time charge)', '2019-05-12 00:00:09', '60336', 1),
(1151, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package G)', 'VP-02002007', 'VM', 10170, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1152, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package F)', 'VP-02002006', 'VM', 5130, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1153, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package E)', 'VP-02002005', 'VM', 2610, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1154, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package D)', 'VP-02002004', 'VM', 1260, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1155, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package C)', 'VP-02002003', 'VM', 720, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1156, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package B)', 'VP-02002002', 'VM', 450, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1157, 510, 'Monthly fee for INET-OpenLandscape Cloud (Package A)', 'VP-02002001', 'VM', 270, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1158, 510, 'Postpaid fee for OpenLandscape Cloud (pay as you go)', 'VP-02002015', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1159, 510, 'Monthly fee for Additional License Windows Server Enterprise License Windows Server Enterprise', 'VP-02002016', 'License', 549, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1160, 510, 'Monthly fee for Additional IP Address', 'VP-02002017', 'IP', 90, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1161, 510, 'Monthly fee for Additional Hosting License Plesk Plesk', 'VP-02002018', 'License', 1170, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1162, 510, 'Monthly fee for Additional Hosting License CPanel CPanel', 'VP-02002019', 'License', 1350, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1163, 510, 'Monthly fee for Additional Hosting License Direct Admin Direct Admin', 'VP-02002020', 'License', 1170, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1164, 510, 'Onetime fee for Implementation of Hosting Plesk', 'VP-02002021', 'Time', 1530, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1165, 510, 'Monthly fee for Monitor Service Up-Down per service for Public IP Service Ex. HTTP, SQL, SMTP etc.', 'VP-02002022', 'VM', 180, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1166, 510, 'Monthly fee for Monitor Service Up-Down for Public IP', 'VP-02002023', 'VM', 90, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1167, 510, 'Monthly fee for Incident SMS Alert contact 2 Number', 'VP-02002024', 'Unit', 90, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1168, 510, 'Monthly fee for Backup 1 GB', 'VP-02002025', 'GB', 2.7, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1169, 510, 'Monthly fee for License MS  SQL (Standard) / 2 vCPU', 'VP-02002026', 'License', 5040, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1170, 510, 'Monthly fee for License MS  SQL (Enterprise) / 2 vCPU', 'VP-02002027', 'License', 9720, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1171, 510, 'Monthly fee for Internation Bandwidth/Mbps. (Dedicate)', 'VP-02002028', 'Mbps', 1800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1172, 510, 'Monthly fee for QOS/ACL Internation Bandwidth (Dedicate) 1 Policy', 'VP-02002029', 'Policy', 1080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1173, 511, 'Onetime fee for Maintenance Agreement Service', 'VP-02004002', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1174, 511, 'Onetime fee for Implementation service', 'VP-02004003', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1175, 511, 'Onetime fee for Consult & Solution service', 'VP-02004005', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1176, 512, 'Onetime fee for Creative Design Service', 'VP-02005002', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1177, 513, 'Mail Gateway Package 18 Anti Spam 2000 users/year', 'VO-02001037', 'Package', 160000, 0, 'Anti Spam 2000 users/year', '2019-05-12 00:00:09', '60336', 1),
(1178, 513, 'Mail Gateway Package 19 Anti Spam 3000 users/year', 'VO-02001038', 'Package', 240000, 0, 'Anti Spam 3000 users/year', '2019-05-12 00:00:09', '60336', 1),
(1179, 513, 'Mail Gateway Package 20 Anti Spam 4000 users/year', 'VO-02001039', 'Package', 320000, 0, 'Anti Spam 4000 users/year', '2019-05-12 00:00:09', '60336', 1),
(1180, 513, 'Mail Gateway Package 21 Anti Spam 5000 users/year', 'VO-02001040', 'Package', 360000, 0, 'Anti Spam 5000 users/year', '2019-05-12 00:00:09', '60336', 1),
(1181, 513, 'Mail Marketing Package 1 Mail Marketing Package 5,000 emails/month', 'VO-02001041', 'Package', 3900, 0, 'Mail Marketing Package 5,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1182, 513, 'Mail Marketing Package 2 Mail Marketing Package 10,000 emails/month', 'VO-02001042', 'Package', 4300, 0, 'Mail Marketing Package 10,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1183, 513, 'Mail Marketing Package 3 Mail Marketing Package 20,000 emails/month', 'VO-02001043', 'Package', 5100, 0, 'Mail Marketing Package 20,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1184, 513, 'Mail Marketing Package 4 Mail Marketing Package 30,000 emails/month', 'VO-02001044', 'Package', 5900, 0, 'Mail Marketing Package 30,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1185, 513, 'Mail Marketing Package 5 Mail Marketing Package 50,000 emails/month', 'VO-02001045', 'Package', 7250, 0, 'Mail Marketing Package 50,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1186, 513, 'Mail Marketing Package 6 Mail Marketing Package 60,000 emails/month', 'VO-02001046', 'Package', 8000, 0, 'Mail Marketing Package 60,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1187, 513, 'Mail Marketing Package 7 Mail Marketing Package 100,000 emails/month', 'VO-02001047', 'Package', 8500, 0, 'Mail Marketing Package 100,000 emails/month', '2019-05-12 00:00:09', '60336', 1);
INSERT INTO `item_info` (`id`, `id_product`, `name`, `item_code`, `units`, `price`, `onetime`, `description`, `create_date`, `create_by`, `inuse`) VALUES
(1188, 513, 'Mail Marketing Package 8 Mail Marketing Package 200,000 emails/month', 'VO-02001048', 'Package', 11500, 0, 'Mail Marketing Package 200,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1189, 513, 'Mail Marketing Package 9 Mail Marketing Package 300,000 emails/month', 'VO-02001049', 'Package', 14000, 0, 'Mail Marketing Package 300,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1190, 513, 'Mail Marketing Package 10 Mail Marketing Package 400,000 emails/month', 'VO-02001050', 'Package', 16700, 0, 'Mail Marketing Package 400,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1191, 513, 'Mail Marketing Package 11 Mail Marketing Package 500,000 emails/month', 'VO-02001051', 'Package', 18500, 0, 'Mail Marketing Package 500,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1192, 513, 'Mail Marketing Package 12 Mail Marketing Package 600,000 emails/month', 'VO-02001052', 'Package', 20300, 0, 'Mail Marketing Package 600,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1193, 513, 'Mail Marketing Package 13 Mail Marketing Package 700,000 emails/month', 'VO-02001053', 'Package', 21000, 0, 'Mail Marketing Package 700,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1194, 513, 'Mail Marketing Package 14 Mail Marketing Package 800,000 emails/month', 'VO-02001054', 'Package', 22700, 0, 'Mail Marketing Package 800,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1195, 513, 'Mail Marketing Package 15 Mail Marketing Package 900,000 emails/month', 'VO-02001055', 'Package', 25100, 0, 'Mail Marketing Package 900,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1196, 513, 'Mail Marketing Package 16 Mail Marketing Package 1,000,000 emails/month', 'VO-02001056', 'Package', 25500, 0, 'Mail Marketing Package 1,000,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1197, 513, 'Mail Marketing Package 17 Mail Marketing Package 2,000,000 emails/month', 'VO-02001057', 'Package', 35500, 0, 'Mail Marketing Package 2,000,000 emails/month', '2019-05-12 00:00:09', '60336', 1),
(1198, 514, 'Secure drive 50 GB', 'VO-02002001', 'Package', 1440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1199, 514, 'Secure drive 100 GB', 'VO-02002002', 'Package', 1600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1200, 514, 'Secure drive 200 GB', 'VO-02002003', 'Package', 1920, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1201, 514, 'Secure drive 300 GB', 'VO-02002004', 'Package', 2240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1202, 514, 'Secure drive 400 GB', 'VO-02002005', 'Package', 2480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1203, 514, 'Secure drive 500 GB', 'VO-02002006', 'Package', 2800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1204, 514, 'Secure drive 600 GB', 'VO-02002007', 'Package', 3120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1205, 514, 'Secure drive 700 GB', 'VO-02002008', 'Package', 3440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1206, 514, 'Secure drive 800 GB', 'VO-02002009', 'Package', 3680, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1207, 514, 'Secure drive 900 GB', 'VO-02002010', 'Package', 4000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1208, 514, 'Secure drive 1,000 GB', 'VO-02002011', 'Package', 4320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1209, 514, 'Secure drive 2,000 GB', 'VO-02002012', 'Package', 7280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1210, 514, 'Secure drive 3,000 GB', 'VO-02002013', 'Package', 10320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1211, 514, 'Secure drive 4,000 GB', 'VO-02002014', 'Package', 13280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1212, 514, 'Secure drive 5,000 GB', 'VO-02002015', 'Package', 16320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1213, 514, 'Secure drive 6,000 GB', 'VO-02002016', 'Package', 19280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1214, 514, 'Secure drive 7,000 GB', 'VO-02002017', 'Package', 22320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1215, 514, 'Secure drive 8,000 GB', 'VO-02002018', 'Package', 25280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1216, 514, 'Secure drive 9,000 GB', 'VO-02002019', 'Package', 28320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1217, 514, 'Secure drive 10,000 GB', 'VO-02002020', 'Package', 31280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1218, 514, 'Secure drive 20,000 GB', 'VO-02002021', 'Package', 61280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1219, 514, 'Secure drive 30,000 GB', 'VO-02002022', 'Package', 91280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1220, 514, 'Secure drive 40,000 GB', 'VO-02002023', 'Package', 121280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1221, 520, 'Juniper (ระบุ) ', 'CI-02006001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1222, 520, 'Juniper SRX320 JSB (500M)', 'CI-02006018', 'Unit', 1340, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1223, 520, 'Juniper SRX320 JSB-L (200M)', 'CI-02006019', 'Unit', 1120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1224, 520, 'Juniper SRX300 JE (200M)', 'CI-02006020', 'Unit', 550, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1225, 520, 'RED-Sophos (ระบุ)', 'CI-02006002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1226, 520, 'Red 15', 'CI-02006021', 'Unit', 370, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1227, 520, 'Red 15W', 'CI-02006022', 'Unit', 440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1228, 520, 'Red 50', 'CI-02006023', 'Unit', 730, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1229, 520, 'Draytek (ระบุ) ', 'CI-02006003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1230, 520, 'Draytek2926', 'CI-02006024', 'Unit', 250, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1231, 520, 'Draytek2926n', 'CI-02006025', 'Unit', 340, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1232, 520, 'Draytek2926Ln', 'CI-02006026', 'Unit', 590, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1233, 529, 'Monthly fee for INET PBX (Standard Package) per Extension', 'SC-01008001', 'Extension', 120, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1234, 529, 'Monthly fee for INET PBX (Professional Package) per Extension', 'SC-01008002', 'Extension', 136, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1235, 529, 'Monthly fee for INET PBX (Add IP Phone (Yealink T21PE2))', 'SC-01008017', 'Unit', 60, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1236, 529, 'Monthly fee for INET PBX (Add IP Phone (T23G))', 'SC-01008003', 'Unit', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1237, 529, 'Monthly fee for INET PBX (Add IP Phone (T27G))', 'SC-01008018', 'Unit', 130, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1238, 529, 'Monthly fee for INET PBX (Add IP Phone (T29G))', 'SC-01008019', 'Unit', 180, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1239, 529, 'Monthly fee for INET PBX (Add IP Phone (T46S))', 'SC-01008020', 'Unit', 190, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1240, 529, 'Monthly fee for INET PBX (Add IP Phone (T48S))', 'SC-01008021', 'Unit', 250, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1241, 529, 'Monthly fee for INET PBX (Add IP Phone (T58A))', 'SC-01008022', 'Unit', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1242, 529, 'Monthly fee for INET PBX (Add IP Phone (T58V))', 'SC-01008023', 'Unit', 350, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1243, 529, 'Monthly fee for INET PBX (Add Expansion (Yealink EXP20))', 'SC-01008024', 'Unit', 100, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1244, 529, 'Monthly fee for INET PBX (Add Airtime Domestic) per Minute', 'SC-01008004', 'Minute', 0.72, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1245, 529, 'Monthly fee for INET PBX (Add DID Number BKK 1 Concurrent)', 'SC-01008005', 'Package', 200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1246, 529, 'Monthly fee for INET PBX (Add DID Number UPC 2 Concurrent)', 'SC-01008006', 'Package', 650, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1247, 529, 'Monthly fee for INET PBX (Add Concurrent 1 Unit)', 'SC-01008007', 'Unit', 100, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1248, 529, 'Monthly fee for INET PBX (Implement อุปกรณ์ Voice Gateway) per Site', 'SC-01008008', 'Site', 480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1249, 529, 'Monthly fee for INET PBX (Add Onsite Support ภาคเหนือ­) per Site', 'SC-01008009', 'Site', 1280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1250, 529, 'Monthly fee for INET PBX (Add Onsite Support  ภาคกลาง) per Site', 'SC-01008010', 'Site', 800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1251, 529, 'Monthly fee for INET PBX (Add Onsite Support ภาคใต้) per Site', 'SC-01008011', 'Site', 1280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1252, 529, 'Monthly fee for INET PBX (Add Onsite Support ภาคตะวันออก) per Site', 'SC-01008012', 'Site', 800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1253, 529, 'Monthly fee for INET PBX (Add Onsite Support ภาคตะวันออกเฉียงเหนือ­) per Site', 'SC-01008013', 'Site', 1280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1254, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Voice Gateway (VEGA60 4FXO) per Box', 'SC-01008014', 'Box', 570, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1255, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Voice Gateway (VEGA60 8FXO) per Box', 'SC-01008025', 'Box', 900, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1256, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Voice Gateway (VEGA100G Digital Gateway with 1 T1/E1) per Box', 'SC-01008015', 'Box', 1490, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1257, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Voice Gateway (Vega200G Digital Gateway with 2 T1/E1) per Box', 'SC-01008026', 'Box', 2280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1258, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Vega3000G 24 FXS Analog Gateway Up to 24 VoIP Channels (**require STTP24)', 'SC-01008027', 'Box', 1810, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1259, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Vega3050G 50 FXS Analog Gateway Up to 50 VoIP Channels (**require STTP24)', 'SC-01008028', 'Box', 2970, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1260, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ STTP24 (Telco Patch Panel - 24 ports for VEGA3000G/3050G)', 'SC-01008029', 'Unit', 140, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1261, 529, 'Monthly fee for INET PBX (Add อุปกรณ์ Voice Gateway (8 GSM, Quad-Band 850/900/1800/1900 small chassis) per Box', 'SC-01008016', 'Box', 1460, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1262, 529, 'Monthly fee for INET PBX (Add FTA5102 (ATA) ตัวแปลงจาก Digital เป็น Analog สำหรับเครื่อง Fax etc. / Box)', 'SC-01008030', 'Box', 60, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1263, 522, 'Monthly fee for INET-VFW-Forcepoint (Package, NGF-8 CPU)', 'SC-01002004', 'Package', 18400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1264, 522, 'Monthly fee for INET-VFW-Forcepoint (Package, NGF-4 CPU)', 'SC-01002003', 'Package', 12800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1265, 522, 'Monthly fee for INET-VFW-Forcepoint (Package, NGF-2 CPU)', 'SC-01002002', 'Package', 8640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1266, 522, 'Monthly fee for INET-VFW-Forcepoint (Package, NGF-1 CPU)', 'SC-01002001', 'Package', 6080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1267, 522, 'Monthly fee for INET-VFW-Forcepoint (Add VPN Account (IPSec or SSL)) per Account', 'SC-01002008', 'Unit', 40, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1268, 522, 'Monthly fee for INET-VFW-Forcepoint (Add VPN-Site to site (Public IP)) per IP', 'SC-01002009', 'Unit', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1269, 522, 'Monthly fee for INET-VFW-Forcepoint (Add DDoS Protection)', 'SC-01002011', 'Unit', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1270, 522, 'Monthly fee for INET-VFW-Forcepoint (Add IPS)', 'SC-01002012', 'Unit', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1271, 522, 'Monthly fee for INET-VFW-Forcepoint (Add Server Load Balancing (5 Virtual IP))', 'SC-01002013', 'Unit', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1272, 522, 'Monthly fee for INET-VFW-Forcepoint (Add Traffic Quality of Service (QOS))  Shape BW by IP only', 'SC-01002014', 'Unit', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1273, 522, 'Monthly fee for INET-VFW-Forcepoint (Add Other (ระบุ))', 'SC-01002015', 'Unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1274, 521, 'Add Port 1 FE (UTP)', 'CI-02006004', 'Unit', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1275, 521, 'Add Port 1 GE (UTP) (2960S) / Port ME', 'CI-02006005', 'Unit', 2240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1276, 521, 'Add Port 1 GE (Fiber/UTP) (N2K)', 'CI-02006006', 'Unit', 4240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1277, 521, 'Add Port 1 GE (Fiber/UTP) (N5K)', 'CI-02006007', 'Unit', 5040, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1278, 521, 'Add Port 10 GE (Fiber) (N5K)', 'CI-02006008', 'Unit', 22400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1279, 521, 'Add Port 10 GE (Fiber) (N7K)', 'CI-02006009', 'Unit', 25600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1280, 521, 'Add Port 10 GE (Fiber) (N9K-ACI)', 'CI-02006010', 'Unit', 33600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1281, 521, 'Add Port VRF 1 Link (TST/BTT)', 'CI-02006011', 'Unit', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1282, 521, 'Add Port VRF 2 Links (TST/BTT)', 'CI-02006012', 'Unit', 720, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1283, 521, 'Add Port 10 GE DWDM (Dedicated)', 'CI-02006013', 'Unit', 40800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1284, 521, 'Add Dedicated Darkfiber TST-BTT (per core)', 'CI-02006014', 'Unit', 12000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1285, 521, 'Add Patch cord fiber@TST (Fl. 10-11)', 'CI-02006015', 'Unit', 800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1286, 521, 'Add Patch cord fiber@Site 3', 'CI-02006016', 'Unit', 800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1287, 521, 'Add Port Backdoor', 'CI-02006017', 'Unit', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1288, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 4) Average 4 GB', 'SC-01005001', 'Package', 14800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1289, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 3) Average 3 GB', 'SC-01005002', 'Package', 13200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1290, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 2) Average 2 GB', 'SC-01005003', 'Package', 11600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1291, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 1) Average 1 GB', 'SC-01005004', 'Package', 10000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1292, 525, 'Monthly fee for INET-Log (Add Customize Report)', 'SC-01005005', 'Package', 2500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1293, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 1) Add Notification Average 1 GB', 'SC-01005006', 'Package', 3000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1294, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 2) Add Notification Average 2 GB', 'SC-01005007', 'Package', 3000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1295, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 3) Add Notification Average 3 GB', 'SC-01005008', 'Package', 3200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1296, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 4) Add Notification Average 4 GB', 'SC-01005009', 'Package', 3200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1297, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 1) Add Log Retention Average 1 GB', 'SC-01005010', 'Package', 1500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1298, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 2) Add Log Retention Average 2 GB', 'SC-01005011', 'Package', 2880, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1299, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 3) Add Log Retention Average 3 GB', 'SC-01005012', 'Package', 4500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1300, 525, 'Monthly fee for INET-Log (Package, iLog Package Medium 4) Add Log Retention Average 4 GB', 'SC-01005013', 'Package', 6000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1301, 525, 'Monthly fee for INET-Log (Package, iLog-Small) Under 1 GB', 'SC-01005014', 'Package', 2800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1302, 525, 'Monthly fee for INET-Log (Other (ระบุ Spec))', 'SC-01005015', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1303, 523, 'Monthly fee for INET-VFW-Palo Alto: Full Pack (vm-700 16 Core)', 'SC-01003001', 'Package', 151440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1304, 523, 'Monthly fee for INET-VFW-Palo Alto: Full Pack (vm-500 8 Core)', 'SC-01003002', 'Package', 69920, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1305, 523, 'Monthly fee for INET-VFW-Palo Alto: Full Pack (vm-300 4 Core)', 'SC-01003003', 'Package', 27200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1306, 523, 'Monthly fee for INET-VFW-Palo Alto: Full Pack (vm-100 2 Core)', 'SC-01003004', 'Package', 15200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1307, 523, 'Monthly fee for INET-VFW-Palo Alto: Full Pack (vm-50 1 Core)', 'SC-01003005', 'Package', 7520, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1308, 523, 'Monthly fee for INET-VFW-Palo Alto: Standard Pack (vm-700 16 Core)', 'SC-01003006', 'Package', 128160, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1309, 523, 'Monthly fee for INET-VFW-Palo Alto: Standard Pack (vm-500 8 Core)', 'SC-01003007', 'Package', 59200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1310, 523, 'Monthly fee for INET-VFW-Palo Alto: Standard Pack (vm-300 4 Core)', 'SC-01003008', 'Package', 23200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1311, 523, 'Monthly fee for INET-VFW-Palo Alto: Standard Pack (vm-100 2 Core)', 'SC-01003009', 'Package', 12960, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1312, 523, 'Monthly fee for INET-VFW-Palo Alto: Standard Pack (vm-50 1 Core)', 'SC-01003010', 'Package', 6800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1313, 523, 'Monthly fee for INET-VFW-Palo Alto (Firewall log 100GB)', 'SC-01003011', 'Unit', 440, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1314, 523, 'Monthly fee for INET-VFW-Palo Alto (Firewall log 500GB)', 'SC-01003012', 'Unit', 1400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1315, 523, 'Monthly fee for INET-VFW-Palo Alto (Firewall log 1000GB)', 'SC-01003013', 'Unit', 2600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1316, 523, 'Monthly fee for INET-VFW-Palo Alto (Add Other (à¸£à¸°à¸šà¸¸))', 'SC-01003014', 'Unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1317, 523, 'Monthly fee for INET-VFW-Fortigate (1 core)', 'SC-01003020', 'Package', 6800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1318, 523, 'Monthly fee for INET-VFW-Fortigate (2 core)', 'SC-01003021', 'Package', 10400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1319, 523, 'Monthly fee for INET-VFW-Fortigate (Add VPN Account (IPSec)) per Account', 'SC-01003022', 'Account', 40, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1320, 523, 'Monthly fee for INET-VFW-Fortigate(Add VPN-Site to site (Public IP)) per IP', 'SC-01003023', 'IP', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1321, 523, 'Monthly fee for INET-VFW-Fortigate(Add Other (ระบุ))', 'SC-01003024', 'Unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1322, 526, 'Monthly fee for INET-VFW-Sophos(Platinum guard-6 Core)', 'SC-01006002', 'Package', 22480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1323, 526, 'Monthly fee for INET-VFW-Sophos (Gold guard-4 Core)', 'SC-01006005', 'Package', 15760, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1324, 526, 'Monthly fee for INET-VFW-Sophos (Silver guard-2 Core)', 'SC-01006003', 'Package', 9760, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1325, 526, 'Monthly fee for INET-VFW-Sophos (Bronze guard-1 Core)', 'SC-01006004', 'Package', 6080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1326, 526, 'Monthly fee for INET-VFW-Sophos (Add VPN Account (IPSec)) per Account', 'SC-01006009', 'Account', 40, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1327, 526, 'Monthly fee for INET-VFW-Sophos (Add VPN Account (IPSec)+2FA Token) per Account', 'SC-01006010', 'Account', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1328, 526, 'Monthly fee for INET-VFW-Sophos(Add VPN-Site to site (Public IP)) per IP', 'SC-01006011', 'IP', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1329, 526, 'Monthly fee for INET-VFW-Sophos(Add Other (ระบุ))', 'SC-01006012', 'Unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1330, 526, 'Monthly fee for INET-VFW-Sophos (Add iView 100 GB)', 'SC-01006013', 'Package', 2080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1331, 526, 'Monthly fee for INET-VFW-Sophos (Add iView 500 GB)', 'SC-01006014', 'Package', 4320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1332, 526, 'Monthly fee for INET-VFW-Sophos (Add iView 1000 GB)', 'SC-01006015', 'Package', 6480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1333, 526, 'Monthly fee for INET-VFW-Sophos (Add iView 4000 GB)', 'SC-01006016', 'Package', 18960, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1334, 526, 'Monthly fee for INET-VFW-Sophos (Add iView 8000 GB)', 'SC-01006017', 'Package', 34160, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1335, 527, 'Monthly fee for INET-DDOS', 'SC-01006001', 'Package', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1336, 524, 'Monthly fee for INET-WAF (Package,PhysicalProtect)', 'SC-01004002', 'Package', 8000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1337, 524, 'Monthly fee for INET-WAF (Package, Cloud Protect)', 'SC-01004001', 'Package', 4800, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1338, 530, 'Monthly fee for INET-Webex (Package, 10 times  [package A])', 'S-WX001001', 'Package', 1600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1339, 530, 'Monthly fee for INET-Webex (Package, Unlimited times  [package B])', 'S-WX001002', 'Package', 3840, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1340, 523, 'Monthly fee for INET-VFW-Juniper (VSRX-100M-STD)', 'SC-01003015', 'Package', 6080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1341, 523, 'Monthly fee for INET-VFW-Juniper (VSRX-1G-STD)', 'SC-01003016', 'Package', 9760, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1342, 523, 'Monthly fee for INET-VFW-Juniper (Add VPN Account (IPSec)) per Account', 'SC-01003017', 'Account', 40, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1343, 523, 'Monthly fee for INET-VFW-Juniper(Add VPN-Site to site (Public IP)) per IP', 'SC-01003018', 'IP', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1344, 523, 'Monthly fee for INET-VFW-Juniper(Add Other (à¸£à¸°à¸šà¸¸))', 'SC-01003019', 'Unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1345, 528, 'Monthly fee for INET Managed VFW &  Report', 'SC-01007001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1346, 528, 'Monthly fee for INET Managed Log & Log Report', 'SC-01007002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1347, 515, 'Trading', 'CI-02001001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1348, 515, 'Prof. Service', 'CI-02001002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1349, 515, 'Rebate', 'CI-02001003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1350, 515, 'Marketing Fund', 'CI-02001004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1351, 519, 'Monthly fee for INET-Singtel  (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02005001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1352, 516, 'Monthly fee for INET-Standard (Link 1 Link (à¸£à¸°à¸šà¸¸ Carrier))', 'CI-02002001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1353, 516, 'Monthly fee for INET-Standard (Link 2 Link (à¸£à¸°à¸šà¸¸ Carrier))', 'CI-02006027', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1354, 516, 'Monthly fee for INET-Standard (Link+Router(à¸£à¸°à¸šà¸¸ Carrier))', 'CI-02006028', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1355, 516, 'Add Router Cisco 1941 by inext', 'CI-02006029', 'Project', 760, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1356, 516, 'Add Router Cisco 3845 by inext', 'CI-02006030', 'Project', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1357, 516, 'Add Router Cisco 2921 by inext', 'CI-02006031', 'Project', 2400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1358, 516, 'Add Router Cisco 1841 by inext', 'CI-02006032', 'Project', 380, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1359, 516, 'Add Hwic-4Esw by inext', 'CI-02006033', 'Project', 420, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1360, 516, 'Add EHwic-4Esw by inext', 'CI-02006034', 'Project', 420, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1361, 516, 'Add Router (à¸£à¸°à¸šà¸¸)', 'CI-02006035', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1362, 516, 'Monthly fee for INET-VRF Cloud Connect 1 Link (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02003002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1363, 516, 'Monthly fee for INET-VRF Cloud Connect 2 Link (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02003003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1364, 516, 'à¸„à¹ˆà¸²à¸ˆà¸” AS NUMBER', 'C-02002003', 'Unit', 400, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1365, 516, 'Monthly Fee for Report', 'CP-NW000A07', 'Unit', 1200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1366, 516, 'Monthly fee for Additional International Bandwidth 1:1  per Mbps', 'CI-02002002', 'Mbps', 720, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1367, 516, 'Monthly fee for Additional International Bandwidth 1:3 per Mbps', 'CI-02002007', 'Mbps', 240, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1368, 516, 'Monthly fee for Additional for Domestic Link (NIX) per Mbps', 'CI-02002003', 'Mbps', 8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1369, 516, 'Monthly fee for IP address 16 IP (Service Node)', 'CI-02002011', 'Unit', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1370, 516, 'Monthly fee for IP address 256 IP (Service Node)', 'CI-02002014', 'Unit', 1280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1371, 516, 'Monthly fee for IP address 1-150 IP (Service IDC) per IP', 'CI-02002015', 'IP', 80, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1372, 516, 'Monthly fee for IP address >256 IP (Service IDC) per IP', 'CI-02002017', 'IP', 60, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1373, 516, 'Monthly fee for IP address IPv6 (Dedicated)', 'CI-02002024', 'Unit', 4000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1374, 516, 'Monthly fee for INET-Private Link (Link (à¸£à¸°à¸šà¸¸ Carrier))', 'CI-02002018', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1375, 516, 'Monthly fee for INET-Private Link (Router)', 'CI-02002025', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1376, 516, 'Monthly fee for INET-Private Link (Link + Router)', 'CI-02002026', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1377, 516, 'Monthly fee for INET-SD WAN', 'CI-02002019', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1378, 516, 'Monthly fee for INET-EDC Pool', 'CI-02002020', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1379, 516, 'Monthly fee for FTTX (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02002027', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1380, 516, 'Monthly fee for ADSL (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02002028', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1381, 516, 'Monthly fee for VDSL (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02002029', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1382, 516, 'Monthly fee for Sim 4G  (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02002030', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1383, 516, 'Monthly fee for Sim 4G + Aircard  (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02002031', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1384, 516, 'Monthly fee for Sim 4G + Pocket wifi  (à¸£à¸°à¸šà¸¸ Carrier)', 'CI-02002032', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1385, 516, 'Managed Service', 'CI-02002022', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1386, 516, 'Monthly fee for INET-Streaming on Cloud', 'CI-02002023', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1387, 517, 'Monthly fee for F5 Load Balance', 'CI-02003001', 'Unit', 20000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1388, 518, 'Monthly fee for INET-MetroLAN', 'CI-02004001', 'Package', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1389, 531, 'Marketing fund', 'MK-01001001', 'Project', 0, 1, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1390, 532, 'à¸„à¹ˆà¸²à¸šà¸£à¸´à¸à¸²à¸£à¸žà¸·à¹‰à¸™à¸—à¸µà¹ˆ BCP', 'MK-01002001', 'Seat', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1391, 532, 'à¸„à¹ˆà¸²à¸šà¸£à¸´à¸à¸²à¸£à¸«à¹‰à¸­à¸‡à¸›à¸£à¸°à¸Šà¸¸à¸¡', 'MK-01002002', 'Seat', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1392, 532, 'à¸„à¹ˆà¸²à¹€à¸Šà¹ˆà¸²à¹ƒà¸Šà¹‰à¸­à¸¸à¸›à¸à¸£à¸“à¹Œà¸ªà¸³à¸™à¸±à¸à¸‡à¸²à¸™', 'MK-01002003', 'Unit', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1393, 532, 'à¸„à¹ˆà¸²à¸­à¸²à¸«à¸²à¸£', 'MK-01002004', 'Seat', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1394, 533, 'Event Management Fee', 'MK-01003001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1395, 533, 'à¸„à¹ˆà¸²à¹‚à¸†à¸©à¸“à¸²', 'MK-01003002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1396, 533, 'à¸„à¹ˆà¸²à¸­à¸²à¸«à¸²à¸£', 'MK-01003003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1397, 533, 'à¸„à¹ˆà¸²à¸‚à¸­à¸‡à¸—à¸µà¹ˆà¸£à¸°à¸¥à¸¶à¸, à¸‚à¸­à¸‡à¸£à¸²à¸‡à¸§à¸±à¸¥', 'MK-01003004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1398, 534, 'Graphic Design', 'MK-01004001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1399, 534, 'à¸„à¹ˆà¸²à¸–à¹ˆà¸²à¸¢à¸—à¸³à¸§à¸´à¸”à¸µà¹‚à¸­', 'MK-01004002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1400, 534, 'à¸„à¹ˆà¸²à¸œà¸¥à¸´à¸•à¸ªà¸·à¹ˆà¸­', 'MK-01004003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1401, 540, 'Turnkey-Cloud-Flexpod', 'TK-01008001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1402, 540, 'Turnkey-Cloud-Microsoft', 'TK-01008002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1403, 540, 'Turnkey-Cloud-HP', 'TK-01008003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1404, 540, 'Turnkey-Cloud-SPARC', 'TK-01008004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1405, 540, 'Turnkey-Cloud-Nutanix', 'TK-01008005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1406, 540, 'Turnkey-Cloud-IBM', 'TK-01008006', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1407, 540, 'Turnkey-Cloud-OLS', 'TK-01008007', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1408, 540, 'Turnkey-Cloud-Oracle', 'TK-01008008', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1409, 540, 'Turnkey-Cloud-Dell', 'TK-01008009', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1410, 540, 'Turnkey-Cloud-Healthcare-Add VCPU', 'TK-01008010', 'VCPU', 315, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1411, 540, 'Turnkey-Cloud-Healthcare-Add VRAM', 'TK-01008011', 'GB', 252, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1412, 540, 'Turnkey-Cloud-Healthcare-Add Disk SAS', 'TK-01008012', 'GB', 6.3, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1413, 540, 'Turnkey-Cloud-Healthcare-Add Disk SSD', 'TK-01008013', 'GB', 11.55, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1414, 540, 'Turnkey-Cloud-Healthcare-Add IP', 'TK-01008014', 'IP', 105, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1415, 540, 'Turnkey-Cloud-Healthcare-Add VM Fee', 'TK-01008015', 'VM', 1890, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1416, 540, 'Turnkey-Cloud-Healthcare-Add License MS SQL (Standard)/2 VCPU', 'TK-01008016', 'License', 5880, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1417, 540, 'Turnkey-Cloud-Healthcare-Add License MS SQL (Enterprise)/2 VCPU', 'TK-01008017', 'License', 11340, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1418, 540, 'Turnkey-Cloud-Healthcare-Add License Windows Server (Standard)', 'TK-01008018', 'License', 535.5, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1419, 540, 'Turnkey-Cloud-Healthcare-Add License Windows (Enterprise)', 'TK-01008019', 'License', 640.5, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1420, 540, 'Turnkey-Cloud-Healthcare-Add Monitor Service Up-Down per Service for public IP', 'TK-01008020', 'IP', 210, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1421, 540, 'Turnkey-Cloud-Healthcare-Add Monitor Ping Up-Down for public IP', 'TK-01008021', 'IP', 105, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1422, 540, 'Turnkey-Cloud-PCIDSS-Add VCPU', 'TK-01008022', 'VCPU', 315, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1423, 540, 'Turnkey-Cloud-PCIDSS-Add VRAM', 'TK-01008023', 'GB', 252, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1424, 540, 'Turnkey-Cloud-PCIDSS-Add Disk SAS', 'TK-01008024', 'GB', 6.3, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1425, 540, 'Turnkey-Cloud-PCIDSS-Add IP', 'TK-01008025', 'IP', 105, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1426, 540, 'Turnkey-Cloud-PCIDSS-Add VM Fee', 'TK-01008026', 'VM', 1890, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1427, 540, 'Turnkey-Cloud-PCIDSS-Add License MS SQL (Standard)/2 VCPU', 'TK-01008027', 'License', 5880, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1428, 540, 'Turnkey-Cloud-PCIDSS-Add License MS SQL (Enterprise)/2 VCPU', 'TK-01008028', 'License', 11340, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1429, 540, 'Turnkey-Cloud-PCIDSS-Add License Windows Server (Standard)', 'TK-01008029', 'License', 535.5, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1430, 540, 'Turnkey-Cloud-PCIDSS-Add License Windows (Enterprise)', 'TK-01008030', 'License', 640.5, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1431, 540, 'Turnkey-Cloud-PCIDSS-Add Monitor Service Up-Down per Service for public IP', 'TK-01008031', 'IP', 210, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1432, 540, 'Turnkey-Cloud-PCIDSS-Add Monitor Ping Up-Down for public IP', 'TK-01008032', 'IP', 105, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1433, 538, 'Turnkey-BaaS', 'TK-01006003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1434, 538, 'Turnkey-BaaS-CommVault-Disk Source', 'TK-01006001', 'GB', 12, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1435, 538, 'Turnkey-BaaS-CommVault-Disk SATA', 'TK-01006004', 'GB', 3, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1436, 538, 'Turnkey-BaaS-CommVault-Professional Services', 'TK-01006005', 'VM', 600, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1437, 538, 'Turnkey-BaaS-CommVault-DBA Support', 'TK-01006006', 'VM', 6500, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1438, 538, 'Turnkey-BaaS-Veeam', 'TK-01006002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1439, 539, 'Turnkey-DBA-Implement Standard (One Time)', 'TK-01007001', 'VM', 16000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1440, 539, 'Turnkey-DBA-Implement Advance (One Time)', 'TK-01007005', 'Time', 27000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1441, 539, 'Turnkey-DBA-Managed Standard', 'TK-01007002', 'DB Instanc', 9700, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1442, 539, 'Turnkey-DBA-Managed Advance', 'TK-01007006', 'DB Instanc', 16700, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1443, 539, 'Turnkey-DBA-Migration (One Time)', 'TK-01007003', 'Time', 27000, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1444, 539, 'Turnkey-DBA-Package', 'TK-01007004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1445, 535, 'Turnkey-IDC-SRB', 'TK-01003003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1446, 535, 'Turnkey-IDC-BCP', 'TK-01003004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1447, 536, 'Turnkey-EDC', 'TK-01004001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1448, 537, 'Turnkey-MS-PM', 'TK-01005001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1449, 537, 'Turnkey-MS-Infra', 'TK-01005002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1450, 537, 'Turnkey-MS-OS', 'TK-01005003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1451, 537, 'Turnkey-MS-SD', 'TK-01005004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1452, 541, 'Turnkey-Singtel', 'TK-01009001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1453, 542, 'Turnkey-AI', 'TK-01010001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1454, 543, 'Turnkey-Security', 'TK-01011001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1455, 543, 'Turkey-VA', 'TK-01011002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1456, 543, 'Turkey-Pentest', 'TK-01011003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1457, 543, 'Turkey-SOC-VM Log (INET Cloud only) (50 MB/day)', 'TK-01011004', 'VM', 1050, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1458, 543, 'Turkey-SOC-Device Log (Local site) (50 MB/day)', 'TK-01011005', 'Device', 7350, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1459, 543, 'Turkey-SOC-Device Log (50 MB/day)', 'TK-01011006', 'Device', 9450, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1460, 544, 'Turnkey-Mobility', 'TK-01012001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1461, 545, 'Turnkey-VDI', 'TK-01013001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1462, 547, 'Turnkey-WebEx', 'TK-01005005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1463, 546, 'Turnkey-ZimbraMail', 'TK-01014001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1464, 547, 'Turnkey-ExchangeMail', 'TK-01015001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1465, 550, 'Co-Location Full Rack', 'CI-01003001', 'Rack', 23040, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1466, 550, 'Co-Location Full Rack (Unlimit)', 'CI-01003002', 'Rack', 35200, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1467, 550, 'Co-Location Full Rack (Pay per Used)', 'CI-01003003', 'Rack', 20480, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1468, 550, 'Co-Location Space (sq.m.)', 'CI-01003004', 'sq.m.', 7680, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1469, 550, 'BCP Seat', 'CI-01003005', 'Seat', 1280, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1470, 550, 'Wiring Patch cable(CAT5, CAT6)', 'CI-01003006', 'Unit', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1471, 550, 'Wiring Patch cord (Fiber)', 'CI-01003007', 'Unit', 640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1472, 550, 'Add Quota Power', 'CI-01003008', 'Unit', 3.84, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1473, 550, 'Add Rack Shelf', 'CI-01003009', 'Unit', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1474, 550, 'Exceed Power', 'CI-01003010', 'Unit', 4.48, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1475, 550, 'Power Bar 12 Outlet', 'CI-01003011', 'Unit', 224, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1476, 550, 'Power Bar 24 Outlet', 'CI-01003012', 'Unit', 448, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1477, 550, 'One time, other', 'CI-01003013', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1478, 548, 'Co-Location Half Rack', 'CI-01001001', 'Rack', 15616, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1479, 548, 'Co-Location Full Rack', 'CI-01001002', 'Rack', 23680, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1480, 548, 'Co-Location Full Rack (HD)', 'CI-01001003', 'Rack', 33920, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1481, 548, 'Co-Location Space (sq.m.)', 'CI-01001004', 'sq.m.', 7680, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1482, 548, 'Wiring Patch cable(CAT5, CAT6)', 'CI-01001005', 'Unit', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1483, 548, 'Wiring Patch cord (Fiber)', 'CI-01001006', 'Unit', 640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1484, 548, 'Add Quota Power', 'CI-01001007', 'Unit', 4.8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1485, 548, 'Add Rack Shelf', 'CI-01001008', 'Unit', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1486, 548, 'Exceed Power', 'CI-01001009', 'Unit', 5.12, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1487, 548, 'Power Bar 12 Outlet', 'CI-01001010', 'Unit', 224, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1488, 548, 'Power Bar 24 Outlet', 'CI-01001011', 'Unit', 448, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1489, 548, 'One time, other', 'CI-01001012', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1490, 549, 'Co-Location Half Rack', 'CI-01002001', 'Rack', 19840, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1491, 549, 'Co-Location Full Rack', 'CI-01002002', 'Rack', 30080, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1492, 549, 'Co-Location Space (sq.m.)', 'CI-01002003', 'sq.m.', 7680, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1493, 549, 'Wiring Patch cable(CAT5, CAT6)', 'CI-01002004', 'Unit', 320, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1494, 549, 'Wiring Patch cord (Fiber)', 'CI-01002005', 'Unit', 640, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1495, 549, 'Add Quota Power', 'CI-01002006', 'Unit', 4.8, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1496, 549, 'Add Rack Shelf', 'CI-01002007', 'Unit', 192, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1497, 549, 'Exceed Power', 'CI-01002008', 'Unit', 5.12, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1498, 549, 'Power Bar 12 Outlet', 'CI-01002009', 'Unit', 224, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1499, 549, 'Power Bar 24 Outlet', 'CI-01002010', 'Unit', 448, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1500, 549, 'One time, other', 'CI-01002011', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1501, 551, 'Marketing Fund', 'GH-01001005', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1502, 551, 'Rebate', 'GH-01001004', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1503, 551, 'Revenue Share', 'GH-01001003', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1504, 551, 'Prof. Service', 'GH-01001002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1505, 551, 'Trading', 'GH-01001001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1506, 552, 'Monthly fee for INET-FlexPod Cloud', 'GH-01002001', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1507, 552, 'à¸„à¹ˆà¸² Revernue Share GMO Cloud', 'GH-01002002', 'Project', 0, 0, 'â€¦', '2019-05-12 00:00:09', '60336', 1),
(1508, 552, 'Monthly fee for package Standard Advanced Enterprise Most Apps Server', 'GH-01002003', 'Project', 0, 0, 'Standard Advanced Enterprise Most Apps Server', '2019-05-12 00:00:09', '60336', 1),
(1509, 553, 'Monthly fee for INET-FlexPod Cloud(Package,Bronze) Package : Bronze', 'GH-01003001', 'VM', 1440, 0, 'Package : Bronze', '2019-05-12 00:00:09', '60336', 1),
(1510, 553, 'Monthly fee for INET-FlexPod Cloud(Package,Silver) Package : Silver', 'GH-01003002', 'VM', 2080, 0, 'Package : Silver', '2019-05-12 00:00:09', '60336', 1),
(1511, 553, 'Monthly fee for INET-FlexPod Cloud (Package, Gold) Package : Gold', 'GH-01003003', 'VM', 2640, 0, 'Package : Gold', '2019-05-12 00:00:09', '60336', 1),
(1512, 553, 'Monthly fee forINET-FlexPodCloud(Package,Platinum) Package : Platinum', 'GH-01003004', 'VM', 4400, 0, 'Package : Platinum', '2019-05-12 00:00:09', '60336', 1),
(1513, 553, 'Monthly fee for INET-FlexPod Cloud (Resource Pool) Resource Pool', 'GH-01003005', 'Project', 0, 0, 'Resource Pool', '2019-05-12 00:00:09', '60336', 1),
(1514, 553, 'Monthly fee for INET-FlexPod Cloud Add on CPU', 'GH-01003006', 'VCPU', 240, 0, 'Add on CPU', '2019-05-12 00:00:09', '60336', 1),
(1515, 553, 'Monthly fee for INET-FlexPod Cloud Add on RAM', 'GH-01003007', 'GB', 192, 0, 'Add on RAM', '2019-05-12 00:00:09', '60336', 1),
(1516, 553, 'Monthly fee for INET-FlexPod Cloud Add on Disk (SSD)', 'GH-01003008', 'GB', 3.2, 0, 'Add on Disk (SSD)', '2019-05-12 00:00:09', '60336', 1),
(1517, 553, 'Monthly fee for INET-FlexPod Cloud Add on Remote Desktop License', 'GH-01003009', 'License', 168, 0, 'Add on Remote Desktop License', '2019-05-12 00:00:09', '60336', 1),
(1518, 553, 'VM Fee (BW, Antivirus, Operation) VM Fee (BW, Antivirus, Operation)', 'GH-01003010', 'VM', 560, 0, 'VM Fee (BW, Antivirus, Operation)', '2019-05-12 00:00:09', '60336', 1),
(1519, 553, 'IP  Address IP  Address', 'GH-01003011', 'IP', 80, 0, 'IP  Address', '2019-05-12 00:00:09', '60336', 1),
(1520, 553, 'Monthly fee for INET-FlexPod Cloud Monitoring& Alert', 'GH-01003012', 'VM', 160, 0, 'Monitoring& Alert', '2019-05-12 00:00:09', '60336', 1),
(1521, 553, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Std.', 'GH-01003013', 'License', 408, 0, 'Add on Windows License Std.', '2019-05-12 00:00:09', '60336', 1),
(1522, 553, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Ent.', 'GH-01003014', 'License', 488, 0, 'Add on Windows License Ent.', '2019-05-12 00:00:09', '60336', 1),
(1523, 553, 'Monthly fee for INET-FlexPod Cloud Add on Windows License Datacenter', 'GH-01003015', 'License', 960, 0, 'Add on Windows License Datacenter', '2019-05-12 00:00:09', '60336', 1),
(1524, 553, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Std.', 'GH-01003016', 'License', 4480, 0, 'Add on Microsoft SQL License Std.', '2019-05-12 00:00:09', '60336', 1),
(1525, 553, 'Monthly fee for INET-FlexPod Cloud Add on Microsoft SQL License Ent.', 'GH-01003017', 'License', 8640, 0, 'Add on Microsoft SQL License Ent.', '2019-05-12 00:00:09', '60336', 1),
(1526, 554, 'BaaS (VEEAM) - FlexPod Cloud Backup Service Per VM', 'GH-01004003', 'VM', 640, 0, 'Backup Service Per VM', '2019-05-12 00:00:09', '60336', 1),
(1527, 554, 'BaaS (VEEAM) - FlexPod Cloud Add on vDisk (SSD)', 'GH-01004001', 'GB', 3.2, 0, 'Add on vDisk (SSD)', '2019-05-12 00:00:09', '60336', 1),
(1528, 555, 'Monthly fee for DRaaS (VEEAM) Add on VM', 'GH-01005001', 'VM', 960, 0, 'Add on VM', '2019-05-12 00:00:09', '60336', 1),
(1529, 555, 'Monthly fee for DRaas (VEEAM ,Additional vCPU) Add on vCPU', 'GH-01005002', 'VCPU', 240, 0, 'Add on vCPU', '2019-05-12 00:00:09', '60336', 1),
(1530, 555, 'Monthly fee for DRaas (VEEAM ,Additional vRam) Add on vRam', 'GH-01005003', 'GB', 192, 0, 'Add on vRam', '2019-05-12 00:00:09', '60336', 1),
(1531, 555, 'Monthly fee for DRaas (VEEAM ,Additional vDisk) Add on vDisk', 'GH-01005004', 'GB', 3.2, 0, 'Add on vDisk', '2019-05-12 00:00:09', '60336', 1),
(1532, 555, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 1 VM - 20 VM (One Time)', 'GH-01005005', 'Project', 6400, 1, 'Implement Veeam 1 VM - 20 VM (One Time)', '2019-05-12 00:00:09', '60336', 1),
(1533, 555, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 21 VM - 50 VM (One Time)', 'GH-01005006', 'Project', 12800, 1, 'Implement Veeam 21 VM - 50 VM (One Time)', '2019-05-12 00:00:09', '60336', 1),
(1534, 555, 'Monthly fee for DRaaS (VEEAM) Implement Veeam 51 VM ++  (One Time)', 'GH-01005007', 'Project', 20000, 1, 'Implement Veeam 51 VM ++  (One Time)', '2019-05-12 00:00:09', '60336', 1),
(1535, 555, 'Monthly fee for DRaaS (VEEAM) VFW (NSX)', 'GH-01005008', 'Project', 1600, 0, 'VFW (NSX)', '2019-05-12 00:00:09', '60336', 1),
(1536, 555, 'Monthly fee for DRaaS (VEEAM) VM Gateway(vCPU 8, Ram 8, disk 50 , OS windows)', 'GH-01005009', 'Project', 4824, 0, 'VM Gateway(vCPU 8, Ram 8, disk 50 , OS windows)', '2019-05-12 00:00:09', '60336', 1),
(1537, 556, 'Monthly fee for DBasS-FlexPod Cloud [ package S ] MySQL Enterprise', 'GH-01006001', 'Package', 13600, 0, 'MySQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1538, 556, 'Monthly fee for DBasS-FlexPod Cloud [ package M ] MySQL Enterprise', 'GH-01006002', 'Package', 16800, 0, 'MySQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1539, 556, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MySQL Enterprise', 'GH-01006003', 'Package', 24000, 0, 'MySQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1540, 556, 'Monthly fee for DBasS-FlexPod Cloud [ package S ] MSSQL Enterprise', 'GH-01006004', 'Package', 19680, 0, 'MSSQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1541, 556, 'Monthly fee for DBasS-FlexPod Cloud [ package M ] MSSQL Enterprise', 'GH-01006005', 'Package', 27520, 0, 'MSSQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1542, 556, 'Monthly fee for DBasS-FlexPod Cloud [ package L ] MSSQL Enterprise', 'GH-01006006', 'Package', 40480, 0, 'MSSQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1543, 556, 'Monthly fee for DBasS-FlexPod Cloud [ cluster package S ] MySQL Enterprise', 'GH-01006007', 'Package', 24800, 0, 'MySQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1544, 556, 'Monthly fee for DBasS-FlexPod Cloud [ cluster package M ] MySQL Enterprise', 'GH-01006008', 'Package', 32000, 0, 'MySQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1545, 556, 'Monthly fee for DBasS-FlexPod Cloud [ cluster postgres ] Prostgres', 'GH-01006009', 'Package', 24800, 0, 'Prostgres', '2019-05-12 00:00:09', '60336', 1),
(1546, 556, 'Monthly fee for DBasS-FlexPod Cloud [ cluster package S ] MSSQL Enterprise', 'GH-01006010', 'Package', 39680, 0, 'MSSQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1547, 556, 'Monthly fee for DBasS-FlexPod Cloud [ cluster package M ] MSSQL Enterprise', 'GH-01006011', 'Package', 58640, 0, 'MSSQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1548, 556, 'Monthly fee for DBasS-FlexPod Cloud [ cluster package L ] MSSQL Enterprise', 'GH-01006012', 'Package', 799200, 0, 'MSSQL Enterprise', '2019-05-12 00:00:09', '60336', 1),
(1549, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add On standard cost per unit', 'GH-01006013', 'Project', 0, 0, 'Add On standard cost per unit', '2019-05-12 00:00:09', '60336', 1),
(1550, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on CPU', 'GH-01006014', 'VCPU', 240, 0, 'Add on CPU', '2019-05-12 00:00:09', '60336', 1),
(1551, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on RAM', 'GH-01006015', 'GB', 192, 0, 'Add on RAM', '2019-05-12 00:00:09', '60336', 1);
INSERT INTO `item_info` (`id`, `id_product`, `name`, `item_code`, `units`, `price`, `onetime`, `description`, `create_date`, `create_by`, `inuse`) VALUES
(1552, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Disk (SSD)', 'GH-01006016', 'GB', 3.2, 0, 'Add on Disk (SSD)', '2019-05-12 00:00:09', '60336', 1),
(1553, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Disk Space for Commvault', 'GH-01006017', 'GB', 11.2, 0, 'Add on Disk Space for Commvault', '2019-05-12 00:00:09', '60336', 1),
(1554, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Std.', 'GH-01006018', 'License', 408, 0, 'Add on Windows License Std.', '2019-05-12 00:00:09', '60336', 1),
(1555, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Windows License Ent.', 'GH-01006019', 'License', 488, 0, 'Add on Windows License Ent.', '2019-05-12 00:00:09', '60336', 1),
(1556, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Std.', 'GH-01006020', 'License', 4480, 0, 'Add on Microsoft SQL License Std.', '2019-05-12 00:00:09', '60336', 1),
(1557, 556, 'Add On for DBasS-FlexPod Cloud [ standard cost per unit ] Add on Microsoft SQL License Ent.', 'GH-01006021', 'License', 8640, 0, 'Add on Microsoft SQL License Ent.', '2019-05-12 00:00:09', '60336', 1),
(1558, 557, 'Monthly fee for INETS3 S3', 'GH-01007002', 'GB', 1.6, 0, 'S3', '2019-05-12 00:00:09', '60336', 1),
(1559, 557, 'Monthly fee for INETS3 (Additional Capacity) Additional Capacity', 'GH-01007001', 'GB', 1.6, 0, 'Additional Capacity', '2019-05-12 00:00:09', '60336', 1),
(1560, 558, 'Monthly fee for BaaS(Veeam Off-site)', 'VP-01004002', 'Project', 0, 0, 'Monthly fee for BaaS(Veeam Off-site)  à¸‚à¸¶à¹‰à¸™à¸­à¸¢à¸¹à¹ˆà¸à¸±à¸š Solution', '2019-05-12 00:00:09', '60336', 1),
(1561, 558, 'Monthly fee for INET-MS BaaS (Veeam On-site)', 'VP-01004001', 'Project', 0, 0, 'Monthly fee for INET-MS BaaS (Veeam On-site) à¸‚à¸¶à¹‰à¸™à¸­à¸¢à¸¹à¹ˆà¸à¸±à¸š Solution', '2019-05-12 00:00:09', '60336', 1),
(1562, 559, 'Monthly fee for INET-MS DRaaS (Replica)', 'VP-01003002', 'Project', 0, 0, 'Monthly fee for INET-MS DRaaS (Replica)  à¸‚à¸¶à¹‰à¸™à¸­à¸¢à¸¹à¹ˆà¸à¸±à¸š Solution', '2019-05-12 00:00:09', '60336', 1),
(1563, 559, 'Monthly fee for INET-MS DRaaS (Veeam)', 'VP-01003001', 'Project', 0, 0, 'Monthly fee for INET-MS DRaaS (Veeam)  à¸‚à¸¶à¹‰à¸™à¸­à¸¢à¸¹à¹ˆà¸à¸±à¸š Solution', '2019-05-12 00:00:09', '60336', 1),
(1564, 560, 'Monthly fee for INET-Exchange (Resource Pool)', 'VP-01005004', 'Project', 0, 0, 'Monthly fee for INET-Exchange (Resource Pool) à¸‚à¸¶à¹‰à¸™à¸­à¸¢à¸¹à¹ˆà¸à¸±à¸š Solution', '2019-05-12 00:00:09', '60336', 1),
(1565, 560, 'Monthly fee for INET-Exchange (Enterprise)', 'VP-01005003', 'Account', 279, 0, 'Monthly fee for INET-Exchange (Enterprise)  ', '2019-05-12 00:00:09', '60336', 1),
(1566, 560, 'Monthly fee for INET-Exchange (Standard)', 'VP-01005002', 'Account', 139, 0, 'Monthly fee for INET-Exchange (Standard)  ', '2019-05-12 00:00:09', '60336', 1),
(1567, 560, 'Monthly fee for INET-Exchange (Basic)', 'VP-01005001', 'Account', 69, 0, 'Monthly fee for INET-Exchange (Basic)  ', '2019-05-12 00:00:09', '60336', 1),
(1568, 561, 'Monthly fee for Mail Gateway (Standard)', 'VP-01007001', 'Account', 25, 0, 'Monthly fee for Mail Gateway (Standard)  ', '2019-05-12 00:00:09', '60336', 1),
(1569, 562, 'Marketing  Fund', 'VP-01001004', 'Project', 0, 1, 'Marketing  Fund  ', '2019-05-12 00:00:09', '60336', 1),
(1570, 562, 'Rebate', 'VP-01001003', 'Project', 0, 1, 'Rebate  ', '2019-05-12 00:00:09', '60336', 1),
(1571, 562, 'Prof. Service (OTC: Implement,Migration,Configuration)', 'VP-01001002', 'Project', 0, 1, 'Prof. Service (OTC: Implement,Migration,Configuration)  ', '2019-05-12 00:00:09', '60336', 1),
(1572, 562, 'Trading', 'VP-01001001', 'Project', 0, 1, 'Trading  ', '2019-05-12 00:00:09', '60336', 1),
(1573, 563, 'Monthly fee for Share Point (SP) Add on Disk Storage', 'VP-01008002', 'GB', 4, 0, 'Monthly fee for Share Point (SP) Add on Disk Storage Add on Disk Storage', '2019-05-12 00:00:09', '60336', 1),
(1574, 563, 'Monthly fee for Share Point (SP)  Per Accounts', 'VP-01008001', 'Account', 270, 0, 'Monthly fee for Share Point (SP)  Per Accounts  ', '2019-05-12 00:00:09', '60336', 1),
(1575, 564, 'Monthly fee for Skype for Business(SFB) Per Accounts', 'VP-01009001', 'Account', 270, 0, 'Monthly fee for Skype for Business(SFB) Per Accounts  ', '2019-05-12 00:00:09', '60336', 1),
(1576, 565, 'Monthly fee for INET-SQL DBaaS (Large)', 'VP-01006003', 'Package', 20500, 0, 'Monthly fee for INET-SQL DBaaS (Large)  ', '2019-05-12 00:00:09', '60336', 1),
(1577, 565, 'Monthly fee for INET-SQL DBaaS (Medium)', 'VP-01006002', 'Package', 13750, 0, 'Monthly fee for INET-SQL DBaaS (Medium)  ', '2019-05-12 00:00:09', '60336', 1),
(1578, 565, 'Monthly fee for INET-SQL DBaaS (Smalll)', 'VP-01006001', 'Package', 6900, 0, 'Monthly fee for INET-SQL DBaaS (Smalll)  ', '2019-05-12 00:00:09', '60336', 1),
(1579, 566, 'Manage Service (Monthly:Window Cluster,Window os)', 'VP-01002010', 'Project', 0, 0, 'Manage Service (Monthly:Window Cluster,Window os)  à¸‚à¸¶à¹‰à¸™à¸­à¸¢à¸¹à¹ˆà¸à¸±à¸š Solution', '2019-05-12 00:00:09', '60336', 1),
(1580, 566, 'Monthly fee for Add Remote Desktop License', 'VP-01002012', 'License', 210, 0, 'Monthly fee for Add Remote Desktop License  ', '2019-05-12 00:00:09', '60336', 1),
(1581, 566, 'Monthly fee for Add SQL License', 'VP-01002011', 'License', 5200, 0, 'Monthly fee for Add SQL License  ', '2019-05-12 00:00:09', '60336', 1),
(1582, 566, 'Monthly fee for Additional vDisk', 'VP-01002009', 'GB', 4, 0, 'Monthly fee for Additional vDisk  ', '2019-05-12 00:00:09', '60336', 1),
(1583, 566, 'Monthly fee for Additional vRam', 'VP-01002008', 'GB', 180, 0, 'Monthly fee for Additional vRam  ', '2019-05-12 00:00:09', '60336', 1),
(1584, 566, 'Monthly fee for Additional vCPU', 'VP-01002007', 'VCPU', 350, 0, 'Monthly fee for Additional vCPU  ', '2019-05-12 00:00:09', '60336', 1),
(1585, 566, 'Monthly fee for INET-MS Cloud MonitoringTool(PRTG) End users', 'VP-01002006', 'VM', 1000, 0, 'Monthly fee for INET-MS Cloud MonitoringTool(PRTG) End users End users', '2019-05-12 00:00:09', '60336', 1),
(1586, 566, 'Monthly fee for INET-MS Cloud (Package, Platinum)', 'VP-01002004', 'VM', 5500, 0, 'Monthly fee for INET-MS Cloud (Package, Platinum)  ', '2019-05-12 00:00:09', '60336', 1),
(1587, 566, 'Monthly fee for INET-MS Cloud (Package, Gold)', 'VP-01002003', 'VM', 3600, 0, 'Monthly fee for INET-MS Cloud (Package, Gold)  ', '2019-05-12 00:00:09', '60336', 1),
(1588, 566, 'Monthly fee for INET-MS Cloud (Package, Silver)', 'VP-01002002', 'VM', 2600, 0, 'Monthly fee for INET-MS Cloud (Package, Silver)  ', '2019-05-12 00:00:09', '60336', 1),
(1589, 566, 'Monthly fee for INET-MS Cloud (Package, Bronze)', 'VP-01002001', 'VM', 1800, 0, 'Monthly fee for INET-MS Cloud (Package, Bronze)  ', '2019-05-12 00:00:09', '60336', 1),
(1590, 567, 'Monthly fee for Azure Stack (PaaS)', 'VP-01010002', 'Project', 0, 0, 'Monthly fee for Azure Stack (PaaS)  à¸£à¸²à¸„à¸²à¸¢à¸±à¸‡à¹„à¸¡à¹ˆà¹€à¸£à¸µà¸¢à¸šà¸£à¹‰à¸­à¸¢', '2019-05-12 00:00:09', '60336', 1),
(1591, 567, 'Monthly fee for Azure Stack (IaaS)', 'VP-01010001', 'Project', 0, 0, 'Monthly fee for Azure Stack (IaaS)  à¸£à¸²à¸„à¸²à¸¢à¸±à¸‡à¹„à¸¡à¹ˆà¹€à¸£à¸µà¸¢à¸šà¸£à¹‰à¸­à¸¢', '2019-05-12 00:00:09', '60336', 1),
(1592, 568, 'testing_item', NULL, 'gb', 2.2, 1, NULL, '2019-06-05 16:02:26', '777777', 0);

-- --------------------------------------------------------

--
-- Table structure for table `item_log`
--

CREATE TABLE `item_log` (
  `id` int(11) NOT NULL,
  `id_item` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `item_log`
--

INSERT INTO `item_log` (`id`, `id_item`, `case_log`, `create_date`, `create_by`) VALUES
(524, 818, 'CREATE', '2019-05-12 00:00:09', '60336'),
(525, 819, 'CREATE', '2019-05-12 00:00:09', '60336'),
(526, 820, 'CREATE', '2019-05-12 00:00:09', '60336'),
(527, 821, 'CREATE', '2019-05-12 00:00:09', '60336'),
(528, 822, 'CREATE', '2019-05-12 00:00:09', '60336'),
(529, 823, 'CREATE', '2019-05-12 00:00:09', '60336'),
(530, 824, 'CREATE', '2019-05-12 00:00:09', '60336'),
(531, 825, 'CREATE', '2019-05-12 00:00:09', '60336'),
(532, 826, 'CREATE', '2019-05-12 00:00:09', '60336'),
(533, 827, 'CREATE', '2019-05-12 00:00:09', '60336'),
(534, 828, 'CREATE', '2019-05-12 00:00:09', '60336'),
(535, 829, 'CREATE', '2019-05-12 00:00:09', '60336'),
(536, 830, 'CREATE', '2019-05-12 00:00:09', '60336'),
(537, 831, 'CREATE', '2019-05-12 00:00:09', '60336'),
(538, 832, 'CREATE', '2019-05-12 00:00:09', '60336'),
(539, 833, 'CREATE', '2019-05-12 00:00:09', '60336'),
(540, 834, 'CREATE', '2019-05-12 00:00:09', '60336'),
(541, 835, 'CREATE', '2019-05-12 00:00:09', '60336'),
(542, 836, 'CREATE', '2019-05-12 00:00:09', '60336'),
(543, 837, 'CREATE', '2019-05-12 00:00:09', '60336'),
(544, 838, 'CREATE', '2019-05-12 00:00:09', '60336'),
(545, 839, 'CREATE', '2019-05-12 00:00:09', '60336'),
(546, 840, 'CREATE', '2019-05-12 00:00:09', '60336'),
(547, 841, 'CREATE', '2019-05-12 00:00:09', '60336'),
(548, 842, 'CREATE', '2019-05-12 00:00:09', '60336'),
(549, 843, 'CREATE', '2019-05-12 00:00:09', '60336'),
(550, 844, 'CREATE', '2019-05-12 00:00:09', '60336'),
(551, 845, 'CREATE', '2019-05-12 00:00:09', '60336'),
(552, 846, 'CREATE', '2019-05-12 00:00:09', '60336'),
(553, 847, 'CREATE', '2019-05-12 00:00:09', '60336'),
(554, 848, 'CREATE', '2019-05-12 00:00:09', '60336'),
(555, 849, 'CREATE', '2019-05-12 00:00:09', '60336'),
(556, 850, 'CREATE', '2019-05-12 00:00:09', '60336'),
(557, 851, 'CREATE', '2019-05-12 00:00:09', '60336'),
(558, 852, 'CREATE', '2019-05-12 00:00:09', '60336'),
(559, 853, 'CREATE', '2019-05-12 00:00:09', '60336'),
(560, 854, 'CREATE', '2019-05-12 00:00:09', '60336'),
(561, 855, 'CREATE', '2019-05-12 00:00:09', '60336'),
(562, 856, 'CREATE', '2019-05-12 00:00:09', '60336'),
(563, 857, 'CREATE', '2019-05-12 00:00:09', '60336'),
(564, 858, 'CREATE', '2019-05-12 00:00:09', '60336'),
(565, 859, 'CREATE', '2019-05-12 00:00:09', '60336'),
(566, 860, 'CREATE', '2019-05-12 00:00:09', '60336'),
(567, 861, 'CREATE', '2019-05-12 00:00:09', '60336'),
(568, 862, 'CREATE', '2019-05-12 00:00:09', '60336'),
(569, 863, 'CREATE', '2019-05-12 00:00:09', '60336'),
(570, 864, 'CREATE', '2019-05-12 00:00:09', '60336'),
(571, 865, 'CREATE', '2019-05-12 00:00:09', '60336'),
(572, 866, 'CREATE', '2019-05-12 00:00:09', '60336'),
(573, 867, 'CREATE', '2019-05-12 00:00:09', '60336'),
(574, 868, 'CREATE', '2019-05-12 00:00:09', '60336'),
(575, 869, 'CREATE', '2019-05-12 00:00:09', '60336'),
(576, 870, 'CREATE', '2019-05-12 00:00:09', '60336'),
(577, 871, 'CREATE', '2019-05-12 00:00:09', '60336'),
(578, 872, 'CREATE', '2019-05-12 00:00:09', '60336'),
(579, 873, 'CREATE', '2019-05-12 00:00:09', '60336'),
(580, 874, 'CREATE', '2019-05-12 00:00:09', '60336'),
(581, 875, 'CREATE', '2019-05-12 00:00:09', '60336'),
(582, 876, 'CREATE', '2019-05-12 00:00:09', '60336'),
(583, 877, 'CREATE', '2019-05-12 00:00:09', '60336'),
(584, 878, 'CREATE', '2019-05-12 00:00:09', '60336'),
(585, 879, 'CREATE', '2019-05-12 00:00:09', '60336'),
(586, 880, 'CREATE', '2019-05-12 00:00:09', '60336'),
(587, 881, 'CREATE', '2019-05-12 00:00:09', '60336'),
(588, 882, 'CREATE', '2019-05-12 00:00:09', '60336'),
(589, 883, 'CREATE', '2019-05-12 00:00:09', '60336'),
(590, 884, 'CREATE', '2019-05-12 00:00:09', '60336'),
(591, 885, 'CREATE', '2019-05-12 00:00:09', '60336'),
(592, 886, 'CREATE', '2019-05-12 00:00:09', '60336'),
(593, 887, 'CREATE', '2019-05-12 00:00:09', '60336'),
(594, 888, 'CREATE', '2019-05-12 00:00:09', '60336'),
(595, 889, 'CREATE', '2019-05-12 00:00:09', '60336'),
(596, 890, 'CREATE', '2019-05-12 00:00:09', '60336'),
(597, 891, 'CREATE', '2019-05-12 00:00:09', '60336'),
(598, 892, 'CREATE', '2019-05-12 00:00:09', '60336'),
(599, 893, 'CREATE', '2019-05-12 00:00:09', '60336'),
(600, 894, 'CREATE', '2019-05-12 00:00:09', '60336'),
(601, 895, 'CREATE', '2019-05-12 00:00:09', '60336'),
(602, 896, 'CREATE', '2019-05-12 00:00:09', '60336'),
(603, 897, 'CREATE', '2019-05-12 00:00:09', '60336'),
(604, 898, 'CREATE', '2019-05-12 00:00:09', '60336'),
(605, 899, 'CREATE', '2019-05-12 00:00:09', '60336'),
(606, 900, 'CREATE', '2019-05-12 00:00:09', '60336'),
(607, 901, 'CREATE', '2019-05-12 00:00:09', '60336'),
(608, 902, 'CREATE', '2019-05-12 00:00:09', '60336'),
(609, 903, 'CREATE', '2019-05-12 00:00:09', '60336'),
(610, 904, 'CREATE', '2019-05-12 00:00:09', '60336'),
(611, 905, 'CREATE', '2019-05-12 00:00:09', '60336'),
(612, 906, 'CREATE', '2019-05-12 00:00:09', '60336'),
(613, 907, 'CREATE', '2019-05-12 00:00:09', '60336'),
(614, 908, 'CREATE', '2019-05-12 00:00:09', '60336'),
(615, 909, 'CREATE', '2019-05-12 00:00:09', '60336'),
(616, 910, 'CREATE', '2019-05-12 00:00:09', '60336'),
(617, 911, 'CREATE', '2019-05-12 00:00:09', '60336'),
(618, 912, 'CREATE', '2019-05-12 00:00:09', '60336'),
(619, 913, 'CREATE', '2019-05-12 00:00:09', '60336'),
(620, 914, 'CREATE', '2019-05-12 00:00:09', '60336'),
(621, 915, 'CREATE', '2019-05-12 00:00:09', '60336'),
(622, 916, 'CREATE', '2019-05-12 00:00:09', '60336'),
(623, 917, 'CREATE', '2019-05-12 00:00:09', '60336'),
(624, 918, 'CREATE', '2019-05-12 00:00:09', '60336'),
(625, 919, 'CREATE', '2019-05-12 00:00:09', '60336'),
(626, 920, 'CREATE', '2019-05-12 00:00:09', '60336'),
(627, 921, 'CREATE', '2019-05-12 00:00:09', '60336'),
(628, 922, 'CREATE', '2019-05-12 00:00:09', '60336'),
(629, 923, 'CREATE', '2019-05-12 00:00:09', '60336'),
(630, 924, 'CREATE', '2019-05-12 00:00:09', '60336'),
(631, 925, 'CREATE', '2019-05-12 00:00:09', '60336'),
(632, 926, 'CREATE', '2019-05-12 00:00:09', '60336'),
(633, 927, 'CREATE', '2019-05-12 00:00:09', '60336'),
(634, 928, 'CREATE', '2019-05-12 00:00:09', '60336'),
(635, 929, 'CREATE', '2019-05-12 00:00:09', '60336'),
(636, 930, 'CREATE', '2019-05-12 00:00:09', '60336'),
(637, 931, 'CREATE', '2019-05-12 00:00:09', '60336'),
(638, 932, 'CREATE', '2019-05-12 00:00:09', '60336'),
(639, 933, 'CREATE', '2019-05-12 00:00:09', '60336'),
(640, 934, 'CREATE', '2019-05-12 00:00:09', '60336'),
(641, 935, 'CREATE', '2019-05-12 00:00:09', '60336'),
(642, 936, 'CREATE', '2019-05-12 00:00:09', '60336'),
(643, 937, 'CREATE', '2019-05-12 00:00:09', '60336'),
(644, 938, 'CREATE', '2019-05-12 00:00:09', '60336'),
(645, 939, 'CREATE', '2019-05-12 00:00:09', '60336'),
(646, 940, 'CREATE', '2019-05-12 00:00:09', '60336'),
(647, 941, 'CREATE', '2019-05-12 00:00:09', '60336'),
(648, 942, 'CREATE', '2019-05-12 00:00:09', '60336'),
(649, 943, 'CREATE', '2019-05-12 00:00:09', '60336'),
(650, 944, 'CREATE', '2019-05-12 00:00:09', '60336'),
(651, 945, 'CREATE', '2019-05-12 00:00:09', '60336'),
(652, 946, 'CREATE', '2019-05-12 00:00:09', '60336'),
(653, 947, 'CREATE', '2019-05-12 00:00:09', '60336'),
(654, 948, 'CREATE', '2019-05-12 00:00:09', '60336'),
(655, 949, 'CREATE', '2019-05-12 00:00:09', '60336'),
(656, 950, 'CREATE', '2019-05-12 00:00:09', '60336'),
(657, 951, 'CREATE', '2019-05-12 00:00:09', '60336'),
(658, 952, 'CREATE', '2019-05-12 00:00:09', '60336'),
(659, 953, 'CREATE', '2019-05-12 00:00:09', '60336'),
(660, 954, 'CREATE', '2019-05-12 00:00:09', '60336'),
(661, 955, 'CREATE', '2019-05-12 00:00:09', '60336'),
(662, 956, 'CREATE', '2019-05-12 00:00:09', '60336'),
(663, 957, 'CREATE', '2019-05-12 00:00:09', '60336'),
(664, 958, 'CREATE', '2019-05-12 00:00:09', '60336'),
(665, 959, 'CREATE', '2019-05-12 00:00:09', '60336'),
(666, 960, 'CREATE', '2019-05-12 00:00:09', '60336'),
(667, 961, 'CREATE', '2019-05-12 00:00:09', '60336'),
(668, 962, 'CREATE', '2019-05-12 00:00:09', '60336'),
(669, 963, 'CREATE', '2019-05-12 00:00:09', '60336'),
(670, 964, 'CREATE', '2019-05-12 00:00:09', '60336'),
(671, 965, 'CREATE', '2019-05-12 00:00:09', '60336'),
(672, 966, 'CREATE', '2019-05-12 00:00:09', '60336'),
(673, 967, 'CREATE', '2019-05-12 00:00:09', '60336'),
(674, 968, 'CREATE', '2019-05-12 00:00:09', '60336'),
(675, 969, 'CREATE', '2019-05-12 00:00:09', '60336'),
(676, 970, 'CREATE', '2019-05-12 00:00:09', '60336'),
(677, 971, 'CREATE', '2019-05-12 00:00:09', '60336'),
(678, 972, 'CREATE', '2019-05-12 00:00:09', '60336'),
(679, 973, 'CREATE', '2019-05-12 00:00:09', '60336'),
(680, 974, 'CREATE', '2019-05-12 00:00:09', '60336'),
(681, 975, 'CREATE', '2019-05-12 00:00:09', '60336'),
(682, 976, 'CREATE', '2019-05-12 00:00:09', '60336'),
(683, 977, 'CREATE', '2019-05-12 00:00:09', '60336'),
(684, 978, 'CREATE', '2019-05-12 00:00:09', '60336'),
(685, 979, 'CREATE', '2019-05-12 00:00:09', '60336'),
(686, 980, 'CREATE', '2019-05-12 00:00:09', '60336'),
(687, 981, 'CREATE', '2019-05-12 00:00:09', '60336'),
(688, 982, 'CREATE', '2019-05-12 00:00:09', '60336'),
(689, 983, 'CREATE', '2019-05-12 00:00:09', '60336'),
(690, 984, 'CREATE', '2019-05-12 00:00:09', '60336'),
(691, 985, 'CREATE', '2019-05-12 00:00:09', '60336'),
(692, 986, 'CREATE', '2019-05-12 00:00:09', '60336'),
(693, 987, 'CREATE', '2019-05-12 00:00:09', '60336'),
(694, 988, 'CREATE', '2019-05-12 00:00:09', '60336'),
(695, 989, 'CREATE', '2019-05-12 00:00:09', '60336'),
(696, 990, 'CREATE', '2019-05-12 00:00:09', '60336'),
(697, 991, 'CREATE', '2019-05-12 00:00:09', '60336'),
(698, 992, 'CREATE', '2019-05-12 00:00:09', '60336'),
(699, 993, 'CREATE', '2019-05-12 00:00:09', '60336'),
(700, 994, 'CREATE', '2019-05-12 00:00:09', '60336'),
(701, 995, 'CREATE', '2019-05-12 00:00:09', '60336'),
(702, 996, 'CREATE', '2019-05-12 00:00:09', '60336'),
(703, 997, 'CREATE', '2019-05-12 00:00:09', '60336'),
(704, 998, 'CREATE', '2019-05-12 00:00:09', '60336'),
(705, 999, 'CREATE', '2019-05-12 00:00:09', '60336'),
(706, 1000, 'CREATE', '2019-05-12 00:00:09', '60336'),
(707, 1001, 'CREATE', '2019-05-12 00:00:09', '60336'),
(708, 1002, 'CREATE', '2019-05-12 00:00:09', '60336'),
(709, 1003, 'CREATE', '2019-05-12 00:00:09', '60336'),
(710, 1004, 'CREATE', '2019-05-12 00:00:09', '60336'),
(711, 1005, 'CREATE', '2019-05-12 00:00:09', '60336'),
(712, 1006, 'CREATE', '2019-05-12 00:00:09', '60336'),
(713, 1007, 'CREATE', '2019-05-12 00:00:09', '60336'),
(714, 1008, 'CREATE', '2019-05-12 00:00:09', '60336'),
(715, 1009, 'CREATE', '2019-05-12 00:00:09', '60336'),
(716, 1010, 'CREATE', '2019-05-12 00:00:09', '60336'),
(717, 1011, 'CREATE', '2019-05-12 00:00:09', '60336'),
(718, 1012, 'CREATE', '2019-05-12 00:00:09', '60336'),
(719, 1013, 'CREATE', '2019-05-12 00:00:09', '60336'),
(720, 1014, 'CREATE', '2019-05-12 00:00:09', '60336'),
(721, 1015, 'CREATE', '2019-05-12 00:00:09', '60336'),
(722, 1016, 'CREATE', '2019-05-12 00:00:09', '60336'),
(723, 1017, 'CREATE', '2019-05-12 00:00:09', '60336'),
(724, 1018, 'CREATE', '2019-05-12 00:00:09', '60336'),
(725, 1019, 'CREATE', '2019-05-12 00:00:09', '60336'),
(726, 1020, 'CREATE', '2019-05-12 00:00:09', '60336'),
(727, 1021, 'CREATE', '2019-05-12 00:00:09', '60336'),
(728, 1022, 'CREATE', '2019-05-12 00:00:09', '60336'),
(729, 1023, 'CREATE', '2019-05-12 00:00:09', '60336'),
(730, 1024, 'CREATE', '2019-05-12 00:00:09', '60336'),
(731, 1025, 'CREATE', '2019-05-12 00:00:09', '60336'),
(732, 1026, 'CREATE', '2019-05-12 00:00:09', '60336'),
(733, 1027, 'CREATE', '2019-05-12 00:00:09', '60336'),
(734, 1028, 'CREATE', '2019-05-12 00:00:09', '60336'),
(735, 1029, 'CREATE', '2019-05-12 00:00:09', '60336'),
(736, 1030, 'CREATE', '2019-05-12 00:00:09', '60336'),
(737, 1031, 'CREATE', '2019-05-12 00:00:09', '60336'),
(738, 1032, 'CREATE', '2019-05-12 00:00:09', '60336'),
(739, 1033, 'CREATE', '2019-05-12 00:00:09', '60336'),
(740, 1034, 'CREATE', '2019-05-12 00:00:09', '60336'),
(741, 1035, 'CREATE', '2019-05-12 00:00:09', '60336'),
(742, 1036, 'CREATE', '2019-05-12 00:00:09', '60336'),
(743, 1037, 'CREATE', '2019-05-12 00:00:09', '60336'),
(744, 1038, 'CREATE', '2019-05-12 00:00:09', '60336'),
(745, 1039, 'CREATE', '2019-05-12 00:00:09', '60336'),
(746, 1040, 'CREATE', '2019-05-12 00:00:09', '60336'),
(747, 1041, 'CREATE', '2019-05-12 00:00:09', '60336'),
(748, 1042, 'CREATE', '2019-05-12 00:00:09', '60336'),
(749, 1043, 'CREATE', '2019-05-12 00:00:09', '60336'),
(750, 1044, 'CREATE', '2019-05-12 00:00:09', '60336'),
(751, 1045, 'CREATE', '2019-05-12 00:00:09', '60336'),
(752, 1046, 'CREATE', '2019-05-12 00:00:09', '60336'),
(753, 1047, 'CREATE', '2019-05-12 00:00:09', '60336'),
(754, 1048, 'CREATE', '2019-05-12 00:00:09', '60336'),
(755, 1049, 'CREATE', '2019-05-12 00:00:09', '60336'),
(756, 1050, 'CREATE', '2019-05-12 00:00:09', '60336'),
(757, 1051, 'CREATE', '2019-05-12 00:00:09', '60336'),
(758, 1052, 'CREATE', '2019-05-12 00:00:09', '60336'),
(759, 1053, 'CREATE', '2019-05-12 00:00:09', '60336'),
(760, 1054, 'CREATE', '2019-05-12 00:00:09', '60336'),
(761, 1055, 'CREATE', '2019-05-12 00:00:09', '60336'),
(762, 1056, 'CREATE', '2019-05-12 00:00:09', '60336'),
(763, 1057, 'CREATE', '2019-05-12 00:00:09', '60336'),
(764, 1058, 'CREATE', '2019-05-12 00:00:09', '60336'),
(765, 1059, 'CREATE', '2019-05-12 00:00:09', '60336'),
(766, 1060, 'CREATE', '2019-05-12 00:00:09', '60336'),
(767, 1061, 'CREATE', '2019-05-12 00:00:09', '60336'),
(768, 1062, 'CREATE', '2019-05-12 00:00:09', '60336'),
(769, 1063, 'CREATE', '2019-05-12 00:00:09', '60336'),
(770, 1064, 'CREATE', '2019-05-12 00:00:09', '60336'),
(771, 1065, 'CREATE', '2019-05-12 00:00:09', '60336'),
(772, 1066, 'CREATE', '2019-05-12 00:00:09', '60336'),
(773, 1067, 'CREATE', '2019-05-12 00:00:09', '60336'),
(774, 1068, 'CREATE', '2019-05-12 00:00:09', '60336'),
(775, 1069, 'CREATE', '2019-05-12 00:00:09', '60336'),
(776, 1070, 'CREATE', '2019-05-12 00:00:09', '60336'),
(777, 1071, 'CREATE', '2019-05-12 00:00:09', '60336'),
(778, 1072, 'CREATE', '2019-05-12 00:00:09', '60336'),
(779, 1073, 'CREATE', '2019-05-12 00:00:09', '60336'),
(780, 1074, 'CREATE', '2019-05-12 00:00:09', '60336'),
(781, 1075, 'CREATE', '2019-05-12 00:00:09', '60336'),
(782, 1076, 'CREATE', '2019-05-12 00:00:09', '60336'),
(783, 1077, 'CREATE', '2019-05-12 00:00:09', '60336'),
(784, 1078, 'CREATE', '2019-05-12 00:00:09', '60336'),
(785, 1079, 'CREATE', '2019-05-12 00:00:09', '60336'),
(786, 1080, 'CREATE', '2019-05-12 00:00:09', '60336'),
(787, 1081, 'CREATE', '2019-05-12 00:00:09', '60336'),
(788, 1082, 'CREATE', '2019-05-12 00:00:09', '60336'),
(789, 1083, 'CREATE', '2019-05-12 00:00:09', '60336'),
(790, 1084, 'CREATE', '2019-05-12 00:00:09', '60336'),
(791, 1085, 'CREATE', '2019-05-12 00:00:09', '60336'),
(792, 1086, 'CREATE', '2019-05-12 00:00:09', '60336'),
(793, 1087, 'CREATE', '2019-05-12 00:00:09', '60336'),
(794, 1088, 'CREATE', '2019-05-12 00:00:09', '60336'),
(795, 1089, 'CREATE', '2019-05-12 00:00:09', '60336'),
(796, 1090, 'CREATE', '2019-05-12 00:00:09', '60336'),
(797, 1091, 'CREATE', '2019-05-12 00:00:09', '60336'),
(798, 1092, 'CREATE', '2019-05-12 00:00:09', '60336'),
(799, 1093, 'CREATE', '2019-05-12 00:00:09', '60336'),
(800, 1094, 'CREATE', '2019-05-12 00:00:09', '60336'),
(801, 1095, 'CREATE', '2019-05-12 00:00:09', '60336'),
(802, 1096, 'CREATE', '2019-05-12 00:00:09', '60336'),
(803, 1097, 'CREATE', '2019-05-12 00:00:09', '60336'),
(804, 1098, 'CREATE', '2019-05-12 00:00:09', '60336'),
(805, 1099, 'CREATE', '2019-05-12 00:00:09', '60336'),
(806, 1100, 'CREATE', '2019-05-12 00:00:09', '60336'),
(807, 1101, 'CREATE', '2019-05-12 00:00:09', '60336'),
(808, 1102, 'CREATE', '2019-05-12 00:00:09', '60336'),
(809, 1103, 'CREATE', '2019-05-12 00:00:09', '60336'),
(810, 1104, 'CREATE', '2019-05-12 00:00:09', '60336'),
(811, 1105, 'CREATE', '2019-05-12 00:00:09', '60336'),
(812, 1106, 'CREATE', '2019-05-12 00:00:09', '60336'),
(813, 1107, 'CREATE', '2019-05-12 00:00:09', '60336'),
(814, 1108, 'CREATE', '2019-05-12 00:00:09', '60336'),
(815, 1109, 'CREATE', '2019-05-12 00:00:09', '60336'),
(816, 1110, 'CREATE', '2019-05-12 00:00:09', '60336'),
(817, 1111, 'CREATE', '2019-05-12 00:00:09', '60336'),
(818, 1112, 'CREATE', '2019-05-12 00:00:09', '60336'),
(819, 1113, 'CREATE', '2019-05-12 00:00:09', '60336'),
(820, 1114, 'CREATE', '2019-05-12 00:00:09', '60336'),
(821, 1115, 'CREATE', '2019-05-12 00:00:09', '60336'),
(822, 1116, 'CREATE', '2019-05-12 00:00:09', '60336'),
(823, 1117, 'CREATE', '2019-05-12 00:00:09', '60336'),
(824, 1118, 'CREATE', '2019-05-12 00:00:09', '60336'),
(825, 1119, 'CREATE', '2019-05-12 00:00:09', '60336'),
(826, 1120, 'CREATE', '2019-05-12 00:00:09', '60336'),
(827, 1121, 'CREATE', '2019-05-12 00:00:09', '60336'),
(828, 1122, 'CREATE', '2019-05-12 00:00:09', '60336'),
(829, 1123, 'CREATE', '2019-05-12 00:00:09', '60336'),
(830, 1124, 'CREATE', '2019-05-12 00:00:09', '60336'),
(831, 1125, 'CREATE', '2019-05-12 00:00:09', '60336'),
(832, 1126, 'CREATE', '2019-05-12 00:00:09', '60336'),
(833, 1127, 'CREATE', '2019-05-12 00:00:09', '60336'),
(834, 1128, 'CREATE', '2019-05-12 00:00:09', '60336'),
(835, 1129, 'CREATE', '2019-05-12 00:00:09', '60336'),
(836, 1130, 'CREATE', '2019-05-12 00:00:09', '60336'),
(837, 1131, 'CREATE', '2019-05-12 00:00:09', '60336'),
(838, 1132, 'CREATE', '2019-05-12 00:00:09', '60336'),
(839, 1133, 'CREATE', '2019-05-12 00:00:09', '60336'),
(840, 1134, 'CREATE', '2019-05-12 00:00:09', '60336'),
(841, 1135, 'CREATE', '2019-05-12 00:00:09', '60336'),
(842, 1136, 'CREATE', '2019-05-12 00:00:09', '60336'),
(843, 1137, 'CREATE', '2019-05-12 00:00:09', '60336'),
(844, 1138, 'CREATE', '2019-05-12 00:00:09', '60336'),
(845, 1139, 'CREATE', '2019-05-12 00:00:09', '60336'),
(846, 1140, 'CREATE', '2019-05-12 00:00:09', '60336'),
(847, 1141, 'CREATE', '2019-05-12 00:00:09', '60336'),
(848, 1142, 'CREATE', '2019-05-12 00:00:09', '60336'),
(849, 1143, 'CREATE', '2019-05-12 00:00:09', '60336'),
(850, 1144, 'CREATE', '2019-05-12 00:00:09', '60336'),
(851, 1145, 'CREATE', '2019-05-12 00:00:09', '60336'),
(852, 1146, 'CREATE', '2019-05-12 00:00:09', '60336'),
(853, 1147, 'CREATE', '2019-05-12 00:00:09', '60336'),
(854, 1148, 'CREATE', '2019-05-12 00:00:09', '60336'),
(855, 1149, 'CREATE', '2019-05-12 00:00:09', '60336'),
(856, 1150, 'CREATE', '2019-05-12 00:00:09', '60336'),
(857, 1151, 'CREATE', '2019-05-12 00:00:09', '60336'),
(858, 1152, 'CREATE', '2019-05-12 00:00:09', '60336'),
(859, 1153, 'CREATE', '2019-05-12 00:00:09', '60336'),
(860, 1154, 'CREATE', '2019-05-12 00:00:09', '60336'),
(861, 1155, 'CREATE', '2019-05-12 00:00:09', '60336'),
(862, 1156, 'CREATE', '2019-05-12 00:00:09', '60336'),
(863, 1157, 'CREATE', '2019-05-12 00:00:09', '60336'),
(864, 1158, 'CREATE', '2019-05-12 00:00:09', '60336'),
(865, 1159, 'CREATE', '2019-05-12 00:00:09', '60336'),
(866, 1160, 'CREATE', '2019-05-12 00:00:09', '60336'),
(867, 1161, 'CREATE', '2019-05-12 00:00:09', '60336'),
(868, 1162, 'CREATE', '2019-05-12 00:00:09', '60336'),
(869, 1163, 'CREATE', '2019-05-12 00:00:09', '60336'),
(870, 1164, 'CREATE', '2019-05-12 00:00:09', '60336'),
(871, 1165, 'CREATE', '2019-05-12 00:00:09', '60336'),
(872, 1166, 'CREATE', '2019-05-12 00:00:09', '60336'),
(873, 1167, 'CREATE', '2019-05-12 00:00:09', '60336'),
(874, 1168, 'CREATE', '2019-05-12 00:00:09', '60336'),
(875, 1169, 'CREATE', '2019-05-12 00:00:09', '60336'),
(876, 1170, 'CREATE', '2019-05-12 00:00:09', '60336'),
(877, 1171, 'CREATE', '2019-05-12 00:00:09', '60336'),
(878, 1172, 'CREATE', '2019-05-12 00:00:09', '60336'),
(879, 1173, 'CREATE', '2019-05-12 00:00:09', '60336'),
(880, 1174, 'CREATE', '2019-05-12 00:00:09', '60336'),
(881, 1175, 'CREATE', '2019-05-12 00:00:09', '60336'),
(882, 1176, 'CREATE', '2019-05-12 00:00:09', '60336'),
(883, 1177, 'CREATE', '2019-05-12 00:00:09', '60336'),
(884, 1178, 'CREATE', '2019-05-12 00:00:09', '60336'),
(885, 1179, 'CREATE', '2019-05-12 00:00:09', '60336'),
(886, 1180, 'CREATE', '2019-05-12 00:00:09', '60336'),
(887, 1181, 'CREATE', '2019-05-12 00:00:09', '60336'),
(888, 1182, 'CREATE', '2019-05-12 00:00:09', '60336'),
(889, 1183, 'CREATE', '2019-05-12 00:00:09', '60336'),
(890, 1184, 'CREATE', '2019-05-12 00:00:09', '60336'),
(891, 1185, 'CREATE', '2019-05-12 00:00:09', '60336'),
(892, 1186, 'CREATE', '2019-05-12 00:00:09', '60336'),
(893, 1187, 'CREATE', '2019-05-12 00:00:09', '60336'),
(894, 1188, 'CREATE', '2019-05-12 00:00:09', '60336'),
(895, 1189, 'CREATE', '2019-05-12 00:00:09', '60336'),
(896, 1190, 'CREATE', '2019-05-12 00:00:09', '60336'),
(897, 1191, 'CREATE', '2019-05-12 00:00:09', '60336'),
(898, 1192, 'CREATE', '2019-05-12 00:00:09', '60336'),
(899, 1193, 'CREATE', '2019-05-12 00:00:09', '60336'),
(900, 1194, 'CREATE', '2019-05-12 00:00:09', '60336'),
(901, 1195, 'CREATE', '2019-05-12 00:00:09', '60336'),
(902, 1196, 'CREATE', '2019-05-12 00:00:09', '60336'),
(903, 1197, 'CREATE', '2019-05-12 00:00:09', '60336'),
(904, 1198, 'CREATE', '2019-05-12 00:00:09', '60336'),
(905, 1199, 'CREATE', '2019-05-12 00:00:09', '60336'),
(906, 1200, 'CREATE', '2019-05-12 00:00:09', '60336'),
(907, 1201, 'CREATE', '2019-05-12 00:00:09', '60336'),
(908, 1202, 'CREATE', '2019-05-12 00:00:09', '60336'),
(909, 1203, 'CREATE', '2019-05-12 00:00:09', '60336'),
(910, 1204, 'CREATE', '2019-05-12 00:00:09', '60336'),
(911, 1205, 'CREATE', '2019-05-12 00:00:09', '60336'),
(912, 1206, 'CREATE', '2019-05-12 00:00:09', '60336'),
(913, 1207, 'CREATE', '2019-05-12 00:00:09', '60336'),
(914, 1208, 'CREATE', '2019-05-12 00:00:09', '60336'),
(915, 1209, 'CREATE', '2019-05-12 00:00:09', '60336'),
(916, 1210, 'CREATE', '2019-05-12 00:00:09', '60336'),
(917, 1211, 'CREATE', '2019-05-12 00:00:09', '60336'),
(918, 1212, 'CREATE', '2019-05-12 00:00:09', '60336'),
(919, 1213, 'CREATE', '2019-05-12 00:00:09', '60336'),
(920, 1214, 'CREATE', '2019-05-12 00:00:09', '60336'),
(921, 1215, 'CREATE', '2019-05-12 00:00:09', '60336'),
(922, 1216, 'CREATE', '2019-05-12 00:00:09', '60336'),
(923, 1217, 'CREATE', '2019-05-12 00:00:09', '60336'),
(924, 1218, 'CREATE', '2019-05-12 00:00:09', '60336'),
(925, 1219, 'CREATE', '2019-05-12 00:00:09', '60336'),
(926, 1220, 'CREATE', '2019-05-12 00:00:09', '60336'),
(927, 1221, 'CREATE', '2019-05-12 00:00:09', '60336'),
(928, 1222, 'CREATE', '2019-05-12 00:00:09', '60336'),
(929, 1223, 'CREATE', '2019-05-12 00:00:09', '60336'),
(930, 1224, 'CREATE', '2019-05-12 00:00:09', '60336'),
(931, 1225, 'CREATE', '2019-05-12 00:00:09', '60336'),
(932, 1226, 'CREATE', '2019-05-12 00:00:09', '60336'),
(933, 1227, 'CREATE', '2019-05-12 00:00:09', '60336'),
(934, 1228, 'CREATE', '2019-05-12 00:00:09', '60336'),
(935, 1229, 'CREATE', '2019-05-12 00:00:09', '60336'),
(936, 1230, 'CREATE', '2019-05-12 00:00:09', '60336'),
(937, 1231, 'CREATE', '2019-05-12 00:00:09', '60336'),
(938, 1232, 'CREATE', '2019-05-12 00:00:09', '60336'),
(939, 1233, 'CREATE', '2019-05-12 00:00:09', '60336'),
(940, 1234, 'CREATE', '2019-05-12 00:00:09', '60336'),
(941, 1235, 'CREATE', '2019-05-12 00:00:09', '60336'),
(942, 1236, 'CREATE', '2019-05-12 00:00:09', '60336'),
(943, 1237, 'CREATE', '2019-05-12 00:00:09', '60336'),
(944, 1238, 'CREATE', '2019-05-12 00:00:09', '60336'),
(945, 1239, 'CREATE', '2019-05-12 00:00:09', '60336'),
(946, 1240, 'CREATE', '2019-05-12 00:00:09', '60336'),
(947, 1241, 'CREATE', '2019-05-12 00:00:09', '60336'),
(948, 1242, 'CREATE', '2019-05-12 00:00:09', '60336'),
(949, 1243, 'CREATE', '2019-05-12 00:00:09', '60336'),
(950, 1244, 'CREATE', '2019-05-12 00:00:09', '60336'),
(951, 1245, 'CREATE', '2019-05-12 00:00:09', '60336'),
(952, 1246, 'CREATE', '2019-05-12 00:00:09', '60336'),
(953, 1247, 'CREATE', '2019-05-12 00:00:09', '60336'),
(954, 1248, 'CREATE', '2019-05-12 00:00:09', '60336'),
(955, 1249, 'CREATE', '2019-05-12 00:00:09', '60336'),
(956, 1250, 'CREATE', '2019-05-12 00:00:09', '60336'),
(957, 1251, 'CREATE', '2019-05-12 00:00:09', '60336'),
(958, 1252, 'CREATE', '2019-05-12 00:00:09', '60336'),
(959, 1253, 'CREATE', '2019-05-12 00:00:09', '60336'),
(960, 1254, 'CREATE', '2019-05-12 00:00:09', '60336'),
(961, 1255, 'CREATE', '2019-05-12 00:00:09', '60336'),
(962, 1256, 'CREATE', '2019-05-12 00:00:09', '60336'),
(963, 1257, 'CREATE', '2019-05-12 00:00:09', '60336'),
(964, 1258, 'CREATE', '2019-05-12 00:00:09', '60336'),
(965, 1259, 'CREATE', '2019-05-12 00:00:09', '60336'),
(966, 1260, 'CREATE', '2019-05-12 00:00:09', '60336'),
(967, 1261, 'CREATE', '2019-05-12 00:00:09', '60336'),
(968, 1262, 'CREATE', '2019-05-12 00:00:09', '60336'),
(969, 1263, 'CREATE', '2019-05-12 00:00:09', '60336'),
(970, 1264, 'CREATE', '2019-05-12 00:00:09', '60336'),
(971, 1265, 'CREATE', '2019-05-12 00:00:09', '60336'),
(972, 1266, 'CREATE', '2019-05-12 00:00:09', '60336'),
(973, 1267, 'CREATE', '2019-05-12 00:00:09', '60336'),
(974, 1268, 'CREATE', '2019-05-12 00:00:09', '60336'),
(975, 1269, 'CREATE', '2019-05-12 00:00:09', '60336'),
(976, 1270, 'CREATE', '2019-05-12 00:00:09', '60336'),
(977, 1271, 'CREATE', '2019-05-12 00:00:09', '60336'),
(978, 1272, 'CREATE', '2019-05-12 00:00:09', '60336'),
(979, 1273, 'CREATE', '2019-05-12 00:00:09', '60336'),
(980, 1274, 'CREATE', '2019-05-12 00:00:09', '60336'),
(981, 1275, 'CREATE', '2019-05-12 00:00:09', '60336'),
(982, 1276, 'CREATE', '2019-05-12 00:00:09', '60336'),
(983, 1277, 'CREATE', '2019-05-12 00:00:09', '60336'),
(984, 1278, 'CREATE', '2019-05-12 00:00:09', '60336'),
(985, 1279, 'CREATE', '2019-05-12 00:00:09', '60336'),
(986, 1280, 'CREATE', '2019-05-12 00:00:09', '60336'),
(987, 1281, 'CREATE', '2019-05-12 00:00:09', '60336'),
(988, 1282, 'CREATE', '2019-05-12 00:00:09', '60336'),
(989, 1283, 'CREATE', '2019-05-12 00:00:09', '60336'),
(990, 1284, 'CREATE', '2019-05-12 00:00:09', '60336'),
(991, 1285, 'CREATE', '2019-05-12 00:00:09', '60336'),
(992, 1286, 'CREATE', '2019-05-12 00:00:09', '60336'),
(993, 1287, 'CREATE', '2019-05-12 00:00:09', '60336'),
(994, 1288, 'CREATE', '2019-05-12 00:00:09', '60336'),
(995, 1289, 'CREATE', '2019-05-12 00:00:09', '60336'),
(996, 1290, 'CREATE', '2019-05-12 00:00:09', '60336'),
(997, 1291, 'CREATE', '2019-05-12 00:00:09', '60336'),
(998, 1292, 'CREATE', '2019-05-12 00:00:09', '60336'),
(999, 1293, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1000, 1294, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1001, 1295, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1002, 1296, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1003, 1297, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1004, 1298, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1005, 1299, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1006, 1300, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1007, 1301, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1008, 1302, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1009, 1303, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1010, 1304, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1011, 1305, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1012, 1306, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1013, 1307, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1014, 1308, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1015, 1309, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1016, 1310, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1017, 1311, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1018, 1312, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1019, 1313, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1020, 1314, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1021, 1315, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1022, 1316, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1023, 1317, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1024, 1318, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1025, 1319, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1026, 1320, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1027, 1321, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1028, 1322, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1029, 1323, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1030, 1324, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1031, 1325, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1032, 1326, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1033, 1327, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1034, 1328, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1035, 1329, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1036, 1330, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1037, 1331, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1038, 1332, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1039, 1333, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1040, 1334, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1041, 1335, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1042, 1336, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1043, 1337, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1044, 1338, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1045, 1339, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1046, 1340, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1047, 1341, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1048, 1342, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1049, 1343, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1050, 1344, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1051, 1345, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1052, 1346, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1053, 1347, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1054, 1348, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1055, 1349, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1056, 1350, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1057, 1351, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1058, 1352, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1059, 1353, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1060, 1354, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1061, 1355, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1062, 1356, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1063, 1357, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1064, 1358, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1065, 1359, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1066, 1360, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1067, 1361, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1068, 1362, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1069, 1363, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1070, 1364, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1071, 1365, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1072, 1366, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1073, 1367, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1074, 1368, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1075, 1369, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1076, 1370, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1077, 1371, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1078, 1372, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1079, 1373, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1080, 1374, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1081, 1375, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1082, 1376, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1083, 1377, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1084, 1378, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1085, 1379, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1086, 1380, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1087, 1381, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1088, 1382, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1089, 1383, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1090, 1384, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1091, 1385, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1092, 1386, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1093, 1387, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1094, 1388, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1095, 1389, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1096, 1390, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1097, 1391, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1098, 1392, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1099, 1393, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1100, 1394, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1101, 1395, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1102, 1396, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1103, 1397, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1104, 1398, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1105, 1399, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1106, 1400, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1107, 1401, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1108, 1402, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1109, 1403, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1110, 1404, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1111, 1405, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1112, 1406, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1113, 1407, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1114, 1408, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1115, 1409, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1116, 1410, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1117, 1411, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1118, 1412, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1119, 1413, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1120, 1414, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1121, 1415, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1122, 1416, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1123, 1417, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1124, 1418, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1125, 1419, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1126, 1420, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1127, 1421, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1128, 1422, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1129, 1423, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1130, 1424, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1131, 1425, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1132, 1426, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1133, 1427, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1134, 1428, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1135, 1429, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1136, 1430, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1137, 1431, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1138, 1432, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1139, 1433, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1140, 1434, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1141, 1435, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1142, 1436, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1143, 1437, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1144, 1438, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1145, 1439, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1146, 1440, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1147, 1441, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1148, 1442, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1149, 1443, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1150, 1444, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1151, 1445, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1152, 1446, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1153, 1447, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1154, 1448, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1155, 1449, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1156, 1450, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1157, 1451, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1158, 1452, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1159, 1453, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1160, 1454, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1161, 1455, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1162, 1456, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1163, 1457, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1164, 1458, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1165, 1459, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1166, 1460, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1167, 1461, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1168, 1462, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1169, 1463, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1170, 1464, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1171, 1465, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1172, 1466, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1173, 1467, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1174, 1468, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1175, 1469, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1176, 1470, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1177, 1471, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1178, 1472, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1179, 1473, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1180, 1474, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1181, 1475, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1182, 1476, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1183, 1477, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1184, 1478, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1185, 1479, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1186, 1480, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1187, 1481, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1188, 1482, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1189, 1483, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1190, 1484, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1191, 1485, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1192, 1486, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1193, 1487, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1194, 1488, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1195, 1489, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1196, 1490, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1197, 1491, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1198, 1492, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1199, 1493, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1200, 1494, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1201, 1495, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1202, 1496, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1203, 1497, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1204, 1498, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1205, 1499, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1206, 1500, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1207, 1501, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1208, 1502, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1209, 1503, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1210, 1504, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1211, 1505, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1212, 1506, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1213, 1507, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1214, 1508, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1215, 1509, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1216, 1510, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1217, 1511, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1218, 1512, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1219, 1513, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1220, 1514, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1221, 1515, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1222, 1516, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1223, 1517, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1224, 1518, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1225, 1519, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1226, 1520, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1227, 1521, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1228, 1522, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1229, 1523, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1230, 1524, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1231, 1525, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1232, 1526, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1233, 1527, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1234, 1528, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1235, 1529, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1236, 1530, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1237, 1531, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1238, 1532, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1239, 1533, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1240, 1534, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1241, 1535, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1242, 1536, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1243, 1537, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1244, 1538, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1245, 1539, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1246, 1540, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1247, 1541, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1248, 1542, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1249, 1543, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1250, 1544, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1251, 1545, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1252, 1546, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1253, 1547, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1254, 1548, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1255, 1549, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1256, 1550, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1257, 1551, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1258, 1552, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1259, 1553, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1260, 1554, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1261, 1555, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1262, 1556, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1263, 1557, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1264, 1558, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1265, 1559, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1266, 1560, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1267, 1561, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1268, 1562, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1269, 1563, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1270, 1564, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1271, 1565, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1272, 1566, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1273, 1567, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1274, 1568, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1275, 1569, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1276, 1570, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1277, 1571, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1278, 1572, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1279, 1573, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1280, 1574, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1281, 1575, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1282, 1576, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1283, 1577, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1284, 1578, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1285, 1579, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1286, 1580, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1287, 1581, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1288, 1582, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1289, 1583, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1290, 1584, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1291, 1585, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1292, 1586, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1293, 1587, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1294, 1588, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1295, 1589, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1296, 1590, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1297, 1591, 'CREATE', '2019-05-12 00:00:09', '60336'),
(1298, 820, 'BLOCK', '2019-05-12 20:46:42', '60336'),
(1299, 820, 'UNBLOCK', '2019-05-12 20:46:44', '60336'),
(1300, 1507, 'BLOCK', '2019-05-31 11:38:41', '777777'),
(1301, 1507, 'UNBLOCK', '2019-05-31 11:38:42', '777777'),
(1302, 1518, 'BLOCK', '2019-05-31 11:38:44', '777777'),
(1303, 1518, 'UNBLOCK', '2019-05-31 11:38:45', '777777'),
(1304, 1592, 'CREATE', '2019-06-05 16:02:26', '777777'),
(1305, 1592, 'EDIT', '2019-06-05 16:02:37', '777777'),
(1306, 1592, 'BLOCK', '2019-06-05 16:02:40', '777777');

-- --------------------------------------------------------

--
-- Table structure for table `product_info`
--

CREATE TABLE `product_info` (
  `id` int(11) NOT NULL,
  `id_bd` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `product_code` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_info`
--

INSERT INTO `product_info` (`id`, `id_bd`, `name`, `product_code`, `create_date`, `create_by`, `inuse`) VALUES
(477, 46, 'IBM - VM as a Service', 'GH-04002000', '2019-05-11 16:36:51', '60336', 1),
(478, 46, 'SPARC - VM as a Service', 'GH-05002000', '2019-05-11 16:36:51', '60336', 1),
(479, 46, 'One Time-Trading', 'GH-04001000', '2019-05-11 16:36:51', '60336', 1),
(480, 46, 'IBM - Disaster recovery as a Service', 'GH-04009000', '2019-05-11 16:36:51', '60336', 1),
(481, 46, 'IBM - Infrastructure as a Service', 'GH-08002000', '2019-05-11 16:36:51', '60336', 1),
(482, 47, 'VM as a Service', 'GH-0600200', '2019-05-11 16:36:51', '60336', 1),
(483, 47, 'Analytic as a Service', 'GH-06005000', '2019-05-11 16:36:51', '60336', 1),
(484, 47, 'One Time-Trading', 'GH-06001000', '2019-05-11 16:36:51', '60336', 1),
(485, 47, 'Big data as a Service', 'GH-0600300', '2019-05-11 16:36:51', '60336', 1),
(486, 47, 'Chatbot as a Service', 'GH-0600400', '2019-05-11 16:36:51', '60336', 1),
(487, 48, 'One Time-Trading', 'GH-02001000', '2019-05-11 16:36:51', '60336', 1),
(488, 48, 'Other Service', 'GH-02007000', '2019-05-11 16:36:51', '60336', 1),
(489, 48, 'Hana as a service', 'GH-02006000', '2019-05-11 16:36:51', '60336', 1),
(490, 48, 'Bare Metal as a Service', 'GH-02005000', '2019-05-11 16:36:51', '60336', 1),
(491, 48, 'Backup as a Service', 'GH-02003000', '2019-05-11 16:36:51', '60336', 1),
(492, 48, 'Disaster recovery as a Service', 'GH-02004000', '2019-05-11 16:36:51', '60336', 1),
(493, 48, 'VM as a Service', 'GH-02002000', '2019-05-11 16:36:51', '60336', 1),
(494, 49, 'VM as a Service', 'GH-03002000', '2019-05-11 16:36:51', '60336', 1),
(495, 49, 'Disaster recovery as a Service', 'GH-03003000', '2019-05-11 16:36:51', '60336', 1),
(496, 49, 'Backup as a Service', 'GH-03005000', '2019-05-11 16:36:51', '60336', 1),
(497, 49, 'Database as a Service', 'GH-03006000', '2019-05-11 16:36:51', '60336', 1),
(498, 49, 'Monthly fee for INET-Nutanix Private Cloud', 'GH-03007000', '2019-05-11 16:36:51', '60336', 1),
(499, 49, 'One Time-Trading', 'GH-03001000', '2019-05-11 16:36:51', '60336', 1),
(500, 50, 'One Time-Trading', 'VO-01001000', '2019-05-11 16:36:51', '60336', 1),
(501, 50, 'VDI', 'VO-01002000', '2019-05-11 16:36:51', '60336', 1),
(502, 50, 'Implementation', 'VO-01003000', '2019-05-11 16:36:51', '60336', 1),
(503, 52, 'Talk to me', 'CT-CC001000', '2019-05-11 16:36:51', '60336', 1),
(504, 53, 'Project Management Service', 'nan', '2019-05-11 16:36:51', '60336', 1),
(505, 53, 'Manage service', 'nan', '2019-05-11 16:36:51', '60336', 1),
(506, 53, 'Implementation Monitor (PRTG)', 'nan', '2019-05-11 16:36:51', '60336', 1),
(507, 53, 'Portal Monitoring Service VM', 'nan', '2019-05-11 16:36:51', '60336', 1),
(508, 53, 'Implementation Active Directory (AD)', 'nan', '2019-05-11 16:36:51', '60336', 1),
(509, 53, 'Project Management Service for BCP', 'nan', '2019-05-11 16:36:51', '60336', 1),
(510, 54, 'VM as a Service', 'VP-02002000', '2019-05-11 16:36:51', '60336', 1),
(511, 54, 'Profeesional Service', 'VP-02004000', '2019-05-11 16:36:51', '60336', 1),
(512, 54, 'Creative Design Service', 'VP-02005000', '2019-05-11 16:36:51', '60336', 1),
(513, 55, 'Mail as a Service', 'VO-02001000', '2019-05-11 16:36:51', '60336', 1),
(514, 55, 'Secure drive', 'VO-02002000', '2019-05-11 16:36:51', '60336', 1),
(515, 56, 'Other Service', 'CI-02001000', '2019-05-11 16:36:51', '60336', 1),
(516, 56, 'INET-Standard', 'CI-02002000', '2019-05-11 16:36:51', '60336', 1),
(517, 56, 'INET-Loadbalance', 'CI-02003000', '2019-05-11 16:36:51', '60336', 1),
(518, 56, 'INET-MetroLan', 'CI-02004000', '2019-05-11 16:36:51', '60336', 1),
(519, 56, 'Singtel', 'CI-02005000', '2019-05-11 16:36:51', '60336', 1),
(520, 56, 'Hybrid WAN', 'CI-02006000', '2019-05-11 16:36:51', '60336', 1),
(521, 56, 'Port', 'CI-02006000', '2019-05-11 16:36:51', '60336', 1),
(522, 56, 'Virtual Firewall Forcepoint', 'SC-01002000', '2019-05-11 16:36:51', '60336', 1),
(523, 56, 'Virtual Firewall Palo Alto', 'SC-01003000', '2019-05-11 16:36:51', '60336', 1),
(524, 56, 'INET-WAF', 'SC-01004000', '2019-05-11 16:36:51', '60336', 1),
(525, 56, 'INET-iLog', 'SC-01005000', '2019-05-11 16:36:51', '60336', 1),
(526, 56, 'Virtual Firewall Sophos', 'SC-01006000', '2019-05-11 16:36:51', '60336', 1),
(527, 56, 'INET-DDOS', 'SC-01006000', '2019-05-11 16:36:51', '60336', 1),
(528, 56, 'Virtual Firewall', 'SC-01007000', '2019-05-11 16:36:51', '60336', 1),
(529, 56, 'PBX', 'SC-01008000', '2019-05-11 16:36:51', '60336', 1),
(530, 56, 'INET-Webex', 'S-WX001X00', '2019-05-11 16:36:51', '60336', 1),
(531, 57, 'One Time-Trading', 'MK-01001000', '2019-05-11 16:36:51', '60336', 1),
(532, 57, 'บริการสถานที่', 'MK-01002000', '2019-05-11 16:36:51', '60336', 1),
(533, 57, 'Organizer', 'MK-01003000', '2019-05-11 16:36:51', '60336', 1),
(534, 57, 'Production', 'MK-01004000', '2019-05-11 16:36:51', '60336', 1),
(535, 58, 'Data Center', 'TK-01003000', '2019-05-11 16:36:51', '60336', 1),
(536, 58, 'EDC', 'TK-01004000', '2019-05-11 16:36:51', '60336', 1),
(537, 58, 'Turnkey-ManageService', 'TK-01005000', '2019-05-11 16:36:51', '60336', 1),
(538, 58, 'Backup as a Service', 'TK-01006000', '2019-05-11 16:36:51', '60336', 1),
(539, 58, 'Database as a Service', 'TK-01007000', '2019-05-11 16:36:51', '60336', 1),
(540, 58, 'Cloud Services', 'TK-01008000', '2019-05-11 16:36:51', '60336', 1),
(541, 58, 'Singtel', 'TK-01009000', '2019-05-11 16:36:51', '60336', 1),
(542, 58, 'AI Services', 'TK-01010000', '2019-05-11 16:36:51', '60336', 1),
(543, 58, 'Turnkey-Security', 'TK-01011000', '2019-05-11 16:36:51', '60336', 1),
(544, 58, 'Turnkey-Mobility', 'TK-01012000', '2019-05-11 16:36:51', '60336', 1),
(545, 58, 'Turnkey-VDI', 'TK-01013000', '2019-05-11 16:36:51', '60336', 1),
(546, 58, 'Turnkey-ZimbraMail', 'TK-01014000', '2019-05-11 16:36:51', '60336', 1),
(547, 58, 'Turnkey-ExchangeMail', 'TK-01015001', '2019-05-11 16:36:51', '60336', 1),
(548, 59, 'INET-IDC1', 'CI-01001000', '2019-05-11 16:36:51', '60336', 1),
(549, 59, 'INET-IDC2', 'CI-01002000', '2019-05-11 16:36:51', '60336', 1),
(550, 59, 'INET-IDC3', 'CI-01003000', '2019-05-11 16:36:51', '60336', 1),
(551, 61, 'One Time-Trading', 'GH-01001000', '2019-05-11 16:36:51', '60336', 1),
(552, 61, 'Other Service', 'GH-01002000', '2019-05-11 16:36:51', '60336', 1),
(553, 61, 'VM as a Service', 'GH-01003000', '2019-05-11 16:36:51', '60336', 1),
(554, 61, 'Backup as a Service', 'GH-01004000', '2019-05-11 16:36:51', '60336', 1),
(555, 61, 'Disaster recovery as a Service', 'GH-01005000', '2019-05-11 16:36:51', '60336', 1),
(556, 61, 'Database as a Service', 'GH-01006000', '2019-05-11 16:36:51', '60336', 1),
(557, 61, 'INET-S3 Storage', 'GH-01007000', '2019-05-11 16:36:51', '60336', 1),
(558, 63, 'Backup as a Service', 'VP-01004000\r\n', '2019-05-11 16:36:51', '60336', 1),
(559, 63, 'Disaster recovery as a Service', 'VP-01003000', '2019-05-11 16:36:51', '60336', 1),
(560, 63, 'Exchange Mail as a Service', 'VP-01005000', '2019-05-11 16:36:51', '60336', 1),
(561, 63, 'Mail Gateway', 'VP-01007000', '2019-05-11 16:36:51', '60336', 1),
(562, 63, 'One Time-Trading', 'VP-01001000', '2019-05-11 16:36:51', '60336', 1),
(563, 63, 'SharePoint', 'VP-01008000', '2019-05-11 16:36:51', '60336', 1),
(564, 63, 'Skype for Business', 'VP-01009000', '2019-05-11 16:36:51', '60336', 1),
(565, 63, 'SQL Database as a Service', 'VP-01006000', '2019-05-11 16:36:51', '60336', 1),
(566, 63, 'VM as a Service', 'VP-01002000', '2019-05-11 16:36:51', '60336', 1),
(567, 63, 'Azure Stack', 'VP-01010000', '2019-05-11 16:36:51', '60336', 1),
(568, 61, 'testing_product111', '', '2019-06-05 16:01:38', '777777', 0);

-- --------------------------------------------------------

--
-- Table structure for table `product_log`
--

CREATE TABLE `product_log` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_log`
--

INSERT INTO `product_log` (`id`, `id_product`, `case_log`, `create_date`, `create_by`) VALUES
(329, 477, 'CREATE', '2019-05-11 16:36:51', '60336'),
(330, 478, 'CREATE', '2019-05-11 16:36:51', '60336'),
(331, 479, 'CREATE', '2019-05-11 16:36:51', '60336'),
(332, 480, 'CREATE', '2019-05-11 16:36:51', '60336'),
(333, 481, 'CREATE', '2019-05-11 16:36:51', '60336'),
(334, 482, 'CREATE', '2019-05-11 16:36:51', '60336'),
(335, 483, 'CREATE', '2019-05-11 16:36:51', '60336'),
(336, 484, 'CREATE', '2019-05-11 16:36:51', '60336'),
(337, 485, 'CREATE', '2019-05-11 16:36:51', '60336'),
(338, 486, 'CREATE', '2019-05-11 16:36:51', '60336'),
(339, 487, 'CREATE', '2019-05-11 16:36:51', '60336'),
(340, 488, 'CREATE', '2019-05-11 16:36:51', '60336'),
(341, 489, 'CREATE', '2019-05-11 16:36:51', '60336'),
(342, 490, 'CREATE', '2019-05-11 16:36:51', '60336'),
(343, 491, 'CREATE', '2019-05-11 16:36:51', '60336'),
(344, 492, 'CREATE', '2019-05-11 16:36:51', '60336'),
(345, 493, 'CREATE', '2019-05-11 16:36:51', '60336'),
(346, 494, 'CREATE', '2019-05-11 16:36:51', '60336'),
(347, 495, 'CREATE', '2019-05-11 16:36:51', '60336'),
(348, 496, 'CREATE', '2019-05-11 16:36:51', '60336'),
(349, 497, 'CREATE', '2019-05-11 16:36:51', '60336'),
(350, 498, 'CREATE', '2019-05-11 16:36:51', '60336'),
(351, 499, 'CREATE', '2019-05-11 16:36:51', '60336'),
(352, 500, 'CREATE', '2019-05-11 16:36:51', '60336'),
(353, 501, 'CREATE', '2019-05-11 16:36:51', '60336'),
(354, 502, 'CREATE', '2019-05-11 16:36:51', '60336'),
(355, 503, 'CREATE', '2019-05-11 16:36:51', '60336'),
(356, 504, 'CREATE', '2019-05-11 16:36:51', '60336'),
(357, 505, 'CREATE', '2019-05-11 16:36:51', '60336'),
(358, 506, 'CREATE', '2019-05-11 16:36:51', '60336'),
(359, 507, 'CREATE', '2019-05-11 16:36:51', '60336'),
(360, 508, 'CREATE', '2019-05-11 16:36:51', '60336'),
(361, 509, 'CREATE', '2019-05-11 16:36:51', '60336'),
(362, 510, 'CREATE', '2019-05-11 16:36:51', '60336'),
(363, 511, 'CREATE', '2019-05-11 16:36:51', '60336'),
(364, 512, 'CREATE', '2019-05-11 16:36:51', '60336'),
(365, 513, 'CREATE', '2019-05-11 16:36:51', '60336'),
(366, 514, 'CREATE', '2019-05-11 16:36:51', '60336'),
(367, 515, 'CREATE', '2019-05-11 16:36:51', '60336'),
(368, 516, 'CREATE', '2019-05-11 16:36:51', '60336'),
(369, 517, 'CREATE', '2019-05-11 16:36:51', '60336'),
(370, 518, 'CREATE', '2019-05-11 16:36:51', '60336'),
(371, 519, 'CREATE', '2019-05-11 16:36:51', '60336'),
(372, 520, 'CREATE', '2019-05-11 16:36:51', '60336'),
(373, 521, 'CREATE', '2019-05-11 16:36:51', '60336'),
(374, 522, 'CREATE', '2019-05-11 16:36:51', '60336'),
(375, 523, 'CREATE', '2019-05-11 16:36:51', '60336'),
(376, 524, 'CREATE', '2019-05-11 16:36:51', '60336'),
(377, 525, 'CREATE', '2019-05-11 16:36:51', '60336'),
(378, 526, 'CREATE', '2019-05-11 16:36:51', '60336'),
(379, 527, 'CREATE', '2019-05-11 16:36:51', '60336'),
(380, 528, 'CREATE', '2019-05-11 16:36:51', '60336'),
(381, 529, 'CREATE', '2019-05-11 16:36:51', '60336'),
(382, 530, 'CREATE', '2019-05-11 16:36:51', '60336'),
(383, 531, 'CREATE', '2019-05-11 16:36:51', '60336'),
(384, 532, 'CREATE', '2019-05-11 16:36:51', '60336'),
(385, 533, 'CREATE', '2019-05-11 16:36:51', '60336'),
(386, 534, 'CREATE', '2019-05-11 16:36:51', '60336'),
(387, 535, 'CREATE', '2019-05-11 16:36:51', '60336'),
(388, 536, 'CREATE', '2019-05-11 16:36:51', '60336'),
(389, 537, 'CREATE', '2019-05-11 16:36:51', '60336'),
(390, 538, 'CREATE', '2019-05-11 16:36:51', '60336'),
(391, 539, 'CREATE', '2019-05-11 16:36:51', '60336'),
(392, 540, 'CREATE', '2019-05-11 16:36:51', '60336'),
(393, 541, 'CREATE', '2019-05-11 16:36:51', '60336'),
(394, 542, 'CREATE', '2019-05-11 16:36:51', '60336'),
(395, 543, 'CREATE', '2019-05-11 16:36:51', '60336'),
(396, 544, 'CREATE', '2019-05-11 16:36:51', '60336'),
(397, 545, 'CREATE', '2019-05-11 16:36:51', '60336'),
(398, 546, 'CREATE', '2019-05-11 16:36:51', '60336'),
(399, 547, 'CREATE', '2019-05-11 16:36:51', '60336'),
(400, 548, 'CREATE', '2019-05-11 16:36:51', '60336'),
(401, 549, 'CREATE', '2019-05-11 16:36:51', '60336'),
(402, 550, 'CREATE', '2019-05-11 16:36:51', '60336'),
(403, 551, 'CREATE', '2019-05-11 16:36:51', '60336'),
(404, 552, 'CREATE', '2019-05-11 16:36:51', '60336'),
(405, 553, 'CREATE', '2019-05-11 16:36:51', '60336'),
(406, 554, 'CREATE', '2019-05-11 16:36:51', '60336'),
(407, 555, 'CREATE', '2019-05-11 16:36:51', '60336'),
(408, 556, 'CREATE', '2019-05-11 16:36:51', '60336'),
(409, 557, 'CREATE', '2019-05-11 16:36:51', '60336'),
(410, 558, 'CREATE', '2019-05-11 16:36:51', '60336'),
(411, 559, 'CREATE', '2019-05-11 16:36:51', '60336'),
(412, 560, 'CREATE', '2019-05-11 16:36:51', '60336'),
(413, 561, 'CREATE', '2019-05-11 16:36:51', '60336'),
(414, 562, 'CREATE', '2019-05-11 16:36:51', '60336'),
(415, 563, 'CREATE', '2019-05-11 16:36:51', '60336'),
(416, 564, 'CREATE', '2019-05-11 16:36:51', '60336'),
(417, 565, 'CREATE', '2019-05-11 16:36:51', '60336'),
(418, 566, 'CREATE', '2019-05-11 16:36:51', '60336'),
(419, 567, 'CREATE', '2019-05-11 16:36:51', '60336'),
(420, 486, 'BLOCK', '2019-05-12 20:46:36', '60336'),
(421, 486, 'UNBLOCK', '2019-05-12 20:46:37', '60336'),
(422, 532, 'BLOCK', '2019-05-16 17:35:07', '999999'),
(423, 532, 'UNBLOCK', '2019-05-16 17:35:09', '999999'),
(424, 553, 'BLOCK', '2019-05-31 11:28:24', '777777'),
(425, 553, 'UNBLOCK', '2019-05-31 11:28:25', '777777'),
(426, 553, 'BLOCK', '2019-05-31 11:30:58', '777777'),
(427, 553, 'UNBLOCK', '2019-05-31 11:31:00', '777777'),
(428, 553, 'BLOCK', '2019-05-31 11:38:37', '777777'),
(429, 553, 'UNBLOCK', '2019-05-31 11:38:39', '777777'),
(430, 568, 'CREATE', '2019-06-05 16:01:38', '777777'),
(431, 568, 'EDIT', '2019-06-05 16:01:45', '777777'),
(432, 568, 'EDIT', '2019-06-05 16:01:45', '777777'),
(433, 568, 'BLOCK', '2019-06-05 16:01:47', '777777');

-- --------------------------------------------------------

--
-- Table structure for table `request_info`
--

CREATE TABLE `request_info` (
  `id` int(11) NOT NULL,
  `subject` varchar(255) NOT NULL,
  `main` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_log`
--

CREATE TABLE `request_log` (
  `id` int(11) NOT NULL,
  `id_request` int(11) NOT NULL,
  `case_log` varchar(255) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `request_to`
--

CREATE TABLE `request_to` (
  `id` int(11) NOT NULL,
  `id_request` int(11) NOT NULL,
  `request_to` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user_group_info`
--

CREATE TABLE `user_group_info` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `position_type` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_info`
--

INSERT INTO `user_group_info` (`id`, `name`, `position_type`, `create_date`, `create_by`, `inuse`) VALUES
(1, 'UNIX', 'bd', '2019-05-12 19:18:01', '60336', 1),
(2, 'Dell', 'bd', '2019-05-12 19:18:01', '60336', 1),
(3, 'HPE', 'bd', '2019-05-12 19:18:01', '60336', 1),
(4, 'Nutanix', 'bd', '2019-05-12 19:18:01', '60336', 1),
(5, 'VDI', 'bd', '2019-05-12 19:18:01', '60336', 1),
(6, 'Talk to me', 'bd', '2019-05-12 19:18:01', '60336', 1),
(7, 'Service plus', 'bd', '2019-05-12 19:18:01', '60336', 1),
(8, 'OpenLandScape', 'bd', '2019-05-12 19:18:01', '60336', 1),
(9, 'One Email', 'bd', '2019-05-12 19:18:01', '60336', 1),
(10, 'Network&Security', 'bd', '2019-05-12 19:18:01', '60336', 1),
(11, 'Marketing', 'bd', '2019-05-12 19:18:01', '60336', 1),
(12, 'INET MS', 'bd', '2019-05-12 19:18:01', '60336', 1),
(13, 'IDC', 'bd', '2019-05-12 19:18:01', '60336', 1),
(14, 'Flexpod', 'bd', '2019-05-12 19:18:01', '60336', 1),
(15, 'Atcetera', 'bd', '2019-05-12 19:18:01', '60336', 1),
(16, 'teamlead', 'presale', '2019-05-12 19:22:41', '60336', 1),
(17, 'team1', 'presale', '2019-05-12 19:22:41', '60336', 1),
(18, 'team2', 'presale', '2019-05-12 19:22:41', '60336', 1),
(19, 'team3', 'presale', '2019-05-12 19:22:41', '60336', 1),
(20, 'team4', 'presale', '2019-05-12 19:22:41', '60336', 1),
(21, 'team5', 'presale', '2019-05-12 19:22:41', '60336', 1),
(22, 'team6', 'presale', '2019-05-12 19:22:41', '60336', 1),
(23, 'team7', 'presale', '2019-05-12 19:22:41', '60336', 1),
(24, 'admin', 'admin', '2019-05-12 19:18:01', '60336', 1),
(25, 'cost', 'cost', '2019-05-12 19:18:01', '60336', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_group_relation`
--

CREATE TABLE `user_group_relation` (
  `id` int(11) NOT NULL,
  `id_group` int(11) NOT NULL,
  `id_group_child` int(11) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_group_relation`
--

INSERT INTO `user_group_relation` (`id`, `id_group`, `id_group_child`, `create_date`, `create_by`, `inuse`) VALUES
(1, 24, 1, '2019-05-12 19:44:26', '60336', 1),
(2, 24, 2, '2019-05-12 19:44:26', '60336', 1),
(3, 24, 3, '2019-05-12 19:44:26', '60336', 1),
(4, 24, 4, '2019-05-12 19:44:26', '60336', 1),
(5, 24, 5, '2019-05-12 19:44:26', '60336', 1),
(6, 24, 6, '2019-05-12 19:44:26', '60336', 1),
(7, 24, 7, '2019-05-12 19:44:26', '60336', 1),
(8, 24, 8, '2019-05-12 19:44:26', '60336', 1),
(9, 24, 9, '2019-05-12 19:44:26', '60336', 1),
(10, 24, 10, '2019-05-12 19:44:26', '60336', 1),
(11, 24, 11, '2019-05-12 19:44:26', '60336', 1),
(12, 24, 12, '2019-05-12 19:44:26', '60336', 1),
(13, 24, 13, '2019-05-12 19:44:26', '60336', 1),
(14, 24, 14, '2019-05-12 19:44:26', '60336', 1),
(15, 24, 15, '2019-05-12 19:44:26', '60336', 1),
(16, 24, 16, '2019-05-12 19:44:26', '60336', 1),
(17, 24, 17, '2019-05-12 19:44:26', '60336', 1),
(18, 24, 18, '2019-05-12 19:44:26', '60336', 1),
(19, 24, 19, '2019-05-12 19:44:26', '60336', 1),
(20, 24, 20, '2019-05-12 19:44:26', '60336', 1),
(21, 24, 21, '2019-05-12 19:44:26', '60336', 1),
(22, 24, 22, '2019-05-12 19:44:26', '60336', 1),
(23, 24, 23, '2019-05-12 19:44:26', '60336', 1),
(24, 24, 25, '2019-05-12 19:44:26', '60336', 1),
(25, 16, 17, '2019-05-12 19:46:22', '60336', 1),
(26, 16, 18, '2019-05-12 19:46:22', '60336', 1),
(27, 16, 19, '2019-05-12 19:46:22', '60336', 1),
(28, 16, 20, '2019-05-12 19:46:22', '60336', 1),
(29, 16, 21, '2019-05-12 19:46:22', '60336', 1),
(30, 16, 22, '2019-05-12 19:46:22', '60336', 1),
(31, 16, 23, '2019-05-12 19:46:22', '60336', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `id` varchar(20) NOT NULL,
  `username` varchar(255) NOT NULL,
  `tel` varchar(20) NOT NULL,
  `role` varchar(10) NOT NULL,
  `position` varchar(30) DEFAULT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`id`, `username`, `tel`, `role`, `position`, `create_date`, `create_by`) VALUES
('000000', 'btester', '0655214404', 'user', 'presale', '2019-05-15 15:23:23', '60336'),
('444444', 'btesterlead', '0655214404', 'user', 'leadpresale', '2019-05-16 08:27:08', '60336'),
('555555', 'btestersale', '0655214404', 'user', 'sale', '2019-05-16 08:27:32', '60336'),
('60336', 'godceza500', '088888888', 'admin', 'admin', '2019-05-11 00:00:00', '0'),
('777777', 'btesterbd', '0655214404', 'user', 'bd', '2019-05-16 08:26:39', '60336'),
('888888', 'btest5656', '0655214404', 'user', 'presale', '2019-05-13 16:59:45', '60336'),
('999999', 'btestercost', '0655214404', 'user', 'cost', '2019-05-16 08:24:07', '60336');

-- --------------------------------------------------------

--
-- Table structure for table `user_relation`
--

CREATE TABLE `user_relation` (
  `id` int(11) NOT NULL,
  `id_user` varchar(20) NOT NULL,
  `id_group` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL,
  `inuse` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_relation`
--

INSERT INTO `user_relation` (`id`, `id_user`, `id_group`, `level`, `create_date`, `create_by`, `inuse`) VALUES
(1, '60336', 24, 1, '2019-05-12 19:18:01', '0', 1),
(2, '888888', 24, 1, '2019-05-13 16:59:45', '60336', 0),
(3, '888888', 17, 1, '2019-05-13 17:00:11', '60336', 0),
(4, '000000', 17, 1, '2019-05-15 15:23:23', '60336', 0),
(5, '000000', 20, 1, '2019-05-15 15:23:34', '60336', 0),
(6, '000000', 19, 1, '2019-05-15 15:25:57', '60336', 0),
(7, '000000', 19, 1, '2019-05-15 15:25:58', '60336', 0),
(8, '000000', 19, 1, '2019-05-15 15:25:58', '60336', 0),
(9, '000000', 19, 1, '2019-05-15 15:25:58', '60336', 0),
(10, '000000', 19, 1, '2019-05-15 15:25:58', '60336', 0),
(11, '000000', 19, 1, '2019-05-15 15:25:59', '60336', 0),
(12, '000000', 19, 1, '2019-05-15 15:25:59', '60336', 0),
(13, '000000', 19, 1, '2019-05-15 15:25:59', '60336', 0),
(14, '000000', 19, 1, '2019-05-15 15:26:00', '60336', 0),
(15, '000000', 19, 1, '2019-05-15 15:26:00', '60336', 0),
(16, '000000', 19, 1, '2019-05-15 15:26:00', '60336', 0),
(17, '000000', 19, 1, '2019-05-15 15:26:00', '60336', 0),
(18, '000000', 19, 1, '2019-05-15 15:26:01', '60336', 0),
(19, '000000', 19, 1, '2019-05-15 15:26:01', '60336', 0),
(20, '000000', 19, 1, '2019-05-15 15:26:01', '60336', 0),
(21, '000000', 19, 1, '2019-05-15 15:26:02', '60336', 0),
(22, '000000', 19, 1, '2019-05-15 15:26:02', '60336', 0),
(23, '000000', 19, 1, '2019-05-15 15:26:02', '60336', 0),
(24, '000000', 19, 1, '2019-05-15 15:26:12', '60336', 0),
(25, '000000', 22, 1, '2019-05-15 15:26:42', '60336', 0),
(26, '000000', 19, 1, '2019-05-15 15:29:13', '60336', 0),
(27, '000000', 20, 1, '2019-05-15 15:30:29', '60336', 0),
(28, '888888', 18, 1, '2019-05-15 15:33:11', '60336', 0),
(29, '000000', 18, 1, '2019-05-15 15:33:14', '60336', 0),
(30, '888888', 22, 1, '2019-05-15 15:33:17', '60336', 1),
(31, '000000', 17, 1, '2019-05-15 15:33:21', '60336', 0),
(32, '000000', 17, 1, '2019-05-15 16:18:29', '60336', 1),
(33, '999999', 25, 1, '2019-05-16 08:24:07', '60336', 1),
(34, '777777', 14, 1, '2019-05-16 08:26:39', '60336', 1),
(35, '444444', 16, 1, '2019-05-16 08:27:08', '60336', 1),
(36, '555555', 17, 1, '2019-05-16 08:27:32', '60336', 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_relation_log`
--

CREATE TABLE `user_relation_log` (
  `id` int(11) NOT NULL,
  `id_relation` int(11) NOT NULL,
  `case_log` varchar(10) NOT NULL,
  `create_date` datetime DEFAULT NULL,
  `create_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_relation_log`
--

INSERT INTO `user_relation_log` (`id`, `id_relation`, `case_log`, `create_date`, `create_by`) VALUES
(1, 1, 'CREATE', '2019-05-12 19:18:01', '60336'),
(2, 2, 'CREATE', '2019-05-13 16:59:45', '60336'),
(3, 3, 'CREATE', '2019-05-13 17:00:11', '60336'),
(4, 4, 'CREATE', '2019-05-15 15:23:23', '60336'),
(5, 5, 'CREATE', '2019-05-15 15:23:34', '60336'),
(6, 6, 'CREATE', '2019-05-15 15:25:57', '60336'),
(7, 7, 'CREATE', '2019-05-15 15:25:58', '60336'),
(8, 8, 'CREATE', '2019-05-15 15:25:58', '60336'),
(9, 9, 'CREATE', '2019-05-15 15:25:58', '60336'),
(10, 10, 'CREATE', '2019-05-15 15:25:58', '60336'),
(11, 11, 'CREATE', '2019-05-15 15:25:59', '60336'),
(12, 12, 'CREATE', '2019-05-15 15:25:59', '60336'),
(13, 13, 'CREATE', '2019-05-15 15:25:59', '60336'),
(14, 14, 'CREATE', '2019-05-15 15:26:00', '60336'),
(15, 15, 'CREATE', '2019-05-15 15:26:00', '60336'),
(16, 16, 'CREATE', '2019-05-15 15:26:00', '60336'),
(17, 17, 'CREATE', '2019-05-15 15:26:00', '60336'),
(18, 18, 'CREATE', '2019-05-15 15:26:01', '60336'),
(19, 19, 'CREATE', '2019-05-15 15:26:01', '60336'),
(20, 20, 'CREATE', '2019-05-15 15:26:01', '60336'),
(21, 21, 'CREATE', '2019-05-15 15:26:02', '60336'),
(22, 22, 'CREATE', '2019-05-15 15:26:02', '60336'),
(23, 23, 'CREATE', '2019-05-15 15:26:02', '60336'),
(24, 24, 'CREATE', '2019-05-15 15:26:12', '60336'),
(25, 25, 'CREATE', '2019-05-15 15:26:42', '60336'),
(26, 26, 'EDIT', '2019-05-15 15:29:13', '60336'),
(27, 27, 'EDIT', '2019-05-15 15:30:29', '60336'),
(28, 28, 'EDIT', '2019-05-15 15:33:11', '60336'),
(29, 29, 'EDIT', '2019-05-15 15:33:14', '60336'),
(30, 30, 'EDIT', '2019-05-15 15:33:17', '60336'),
(31, 31, 'EDIT', '2019-05-15 15:33:21', '60336'),
(32, 32, 'EDIT', '2019-05-15 16:18:29', '60336'),
(33, 33, 'CREATE', '2019-05-16 08:24:07', '60336'),
(34, 34, 'CREATE', '2019-05-16 08:26:39', '60336'),
(35, 35, 'CREATE', '2019-05-16 08:27:08', '60336'),
(36, 36, 'CREATE', '2019-05-16 08:27:32', '60336');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bd_info`
--
ALTER TABLE `bd_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bd_log`
--
ALTER TABLE `bd_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bd` (`id_bd`);

--
-- Indexes for table `bom_bd`
--
ALTER TABLE `bom_bd`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_bd_log`
--
ALTER TABLE `bom_bd_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_bd_old`
--
ALTER TABLE `bom_bd_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom_old`);

--
-- Indexes for table `bom_diagram`
--
ALTER TABLE `bom_diagram`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_diagram_old`
--
ALTER TABLE `bom_diagram_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom_old` (`id_bom_old`);

--
-- Indexes for table `bom_item`
--
ALTER TABLE `bom_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_item_old`
--
ALTER TABLE `bom_item_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom_old`);

--
-- Indexes for table `bom_item_price`
--
ALTER TABLE `bom_item_price`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bom_item_price_old`
--
ALTER TABLE `bom_item_price_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom_item` (`id_bom_item_old`);

--
-- Indexes for table `bom_log`
--
ALTER TABLE `bom_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_main`
--
ALTER TABLE `bom_main`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `bom_main_old`
--
ALTER TABLE `bom_main_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom_main` (`id_bom_main`);

--
-- Indexes for table `bom_poc_status`
--
ALTER TABLE `bom_poc_status`
  ADD PRIMARY KEY (`id_bom`);

--
-- Indexes for table `bom_ref_file`
--
ALTER TABLE `bom_ref_file`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_ref_file_old`
--
ALTER TABLE `bom_ref_file_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_sale_log`
--
ALTER TABLE `bom_sale_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_solution_log`
--
ALTER TABLE `bom_solution_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_vm_resource`
--
ALTER TABLE `bom_vm_resource`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom` (`id_bom`);

--
-- Indexes for table `bom_vm_resource_old`
--
ALTER TABLE `bom_vm_resource_old`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bom_old` (`id_bom_old`);

--
-- Indexes for table `item_info`
--
ALTER TABLE `item_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `item_log`
--
ALTER TABLE `item_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_item` (`id_item`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_bd` (`id_bd`);

--
-- Indexes for table `product_log`
--
ALTER TABLE `product_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `request_info`
--
ALTER TABLE `request_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `request_log`
--
ALTER TABLE `request_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_request` (`id_request`);

--
-- Indexes for table `request_to`
--
ALTER TABLE `request_to`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_request` (`id_request`);

--
-- Indexes for table `user_group_info`
--
ALTER TABLE `user_group_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `user_group_relation`
--
ALTER TABLE `user_group_relation`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `user_relation`
--
ALTER TABLE `user_relation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_group` (`id_group`);

--
-- Indexes for table `user_relation_log`
--
ALTER TABLE `user_relation_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_relation` (`id_relation`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bd_info`
--
ALTER TABLE `bd_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT for table `bd_log`
--
ALTER TABLE `bd_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `bom_bd`
--
ALTER TABLE `bom_bd`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=172;

--
-- AUTO_INCREMENT for table `bom_bd_log`
--
ALTER TABLE `bom_bd_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=168;

--
-- AUTO_INCREMENT for table `bom_bd_old`
--
ALTER TABLE `bom_bd_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=115;

--
-- AUTO_INCREMENT for table `bom_diagram`
--
ALTER TABLE `bom_diagram`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;

--
-- AUTO_INCREMENT for table `bom_diagram_old`
--
ALTER TABLE `bom_diagram_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `bom_item`
--
ALTER TABLE `bom_item`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `bom_item_old`
--
ALTER TABLE `bom_item_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=249;

--
-- AUTO_INCREMENT for table `bom_item_price`
--
ALTER TABLE `bom_item_price`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=378;

--
-- AUTO_INCREMENT for table `bom_item_price_old`
--
ALTER TABLE `bom_item_price_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=247;

--
-- AUTO_INCREMENT for table `bom_log`
--
ALTER TABLE `bom_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=86;

--
-- AUTO_INCREMENT for table `bom_main`
--
ALTER TABLE `bom_main`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `bom_main_old`
--
ALTER TABLE `bom_main_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `bom_poc_status`
--
ALTER TABLE `bom_poc_status`
  MODIFY `id_bom` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bom_ref_file`
--
ALTER TABLE `bom_ref_file`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bom_ref_file_old`
--
ALTER TABLE `bom_ref_file_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `bom_sale_log`
--
ALTER TABLE `bom_sale_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=81;

--
-- AUTO_INCREMENT for table `bom_solution_log`
--
ALTER TABLE `bom_solution_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=92;

--
-- AUTO_INCREMENT for table `bom_vm_resource`
--
ALTER TABLE `bom_vm_resource`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `bom_vm_resource_old`
--
ALTER TABLE `bom_vm_resource_old`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `item_info`
--
ALTER TABLE `item_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1593;

--
-- AUTO_INCREMENT for table `item_log`
--
ALTER TABLE `item_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1307;

--
-- AUTO_INCREMENT for table `product_info`
--
ALTER TABLE `product_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=569;

--
-- AUTO_INCREMENT for table `product_log`
--
ALTER TABLE `product_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=434;

--
-- AUTO_INCREMENT for table `request_info`
--
ALTER TABLE `request_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_log`
--
ALTER TABLE `request_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request_to`
--
ALTER TABLE `request_to`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `user_group_info`
--
ALTER TABLE `user_group_info`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `user_group_relation`
--
ALTER TABLE `user_group_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `user_relation`
--
ALTER TABLE `user_relation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- AUTO_INCREMENT for table `user_relation_log`
--
ALTER TABLE `user_relation_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bd_log`
--
ALTER TABLE `bd_log`
  ADD CONSTRAINT `bd_log_ibfk_1` FOREIGN KEY (`id_bd`) REFERENCES `bd_info` (`id`);

--
-- Constraints for table `bom_bd`
--
ALTER TABLE `bom_bd`
  ADD CONSTRAINT `bom_bd_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_bd_log`
--
ALTER TABLE `bom_bd_log`
  ADD CONSTRAINT `bom_bd_log_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_diagram`
--
ALTER TABLE `bom_diagram`
  ADD CONSTRAINT `bom_diagram_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_diagram_old`
--
ALTER TABLE `bom_diagram_old`
  ADD CONSTRAINT `bom_diagram_old_ibfk_1` FOREIGN KEY (`id_bom_old`) REFERENCES `bom_main_old` (`id`);

--
-- Constraints for table `bom_item`
--
ALTER TABLE `bom_item`
  ADD CONSTRAINT `bom_item_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_log`
--
ALTER TABLE `bom_log`
  ADD CONSTRAINT `bom_log_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_main_old`
--
ALTER TABLE `bom_main_old`
  ADD CONSTRAINT `bom_main_old_ibfk_1` FOREIGN KEY (`id_bom_main`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_ref_file`
--
ALTER TABLE `bom_ref_file`
  ADD CONSTRAINT `bom_ref_file_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_ref_file_old`
--
ALTER TABLE `bom_ref_file_old`
  ADD CONSTRAINT `bom_ref_file_old_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_sale_log`
--
ALTER TABLE `bom_sale_log`
  ADD CONSTRAINT `bom_sale_log_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_solution_log`
--
ALTER TABLE `bom_solution_log`
  ADD CONSTRAINT `bom_solution_log_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_vm_resource`
--
ALTER TABLE `bom_vm_resource`
  ADD CONSTRAINT `bom_vm_resource_ibfk_1` FOREIGN KEY (`id_bom`) REFERENCES `bom_main` (`id`);

--
-- Constraints for table `bom_vm_resource_old`
--
ALTER TABLE `bom_vm_resource_old`
  ADD CONSTRAINT `bom_vm_resource_old_ibfk_1` FOREIGN KEY (`id_bom_old`) REFERENCES `bom_main_old` (`id`);

--
-- Constraints for table `item_info`
--
ALTER TABLE `item_info`
  ADD CONSTRAINT `item_info_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product_info` (`id`);

--
-- Constraints for table `item_log`
--
ALTER TABLE `item_log`
  ADD CONSTRAINT `item_log_ibfk_1` FOREIGN KEY (`id_item`) REFERENCES `item_info` (`id`);

--
-- Constraints for table `product_info`
--
ALTER TABLE `product_info`
  ADD CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`id_bd`) REFERENCES `bd_info` (`id`);

--
-- Constraints for table `product_log`
--
ALTER TABLE `product_log`
  ADD CONSTRAINT `product_log_ibfk_1` FOREIGN KEY (`id_product`) REFERENCES `product_info` (`id`);

--
-- Constraints for table `request_log`
--
ALTER TABLE `request_log`
  ADD CONSTRAINT `request_log_ibfk_1` FOREIGN KEY (`id_request`) REFERENCES `request_info` (`id`);

--
-- Constraints for table `request_to`
--
ALTER TABLE `request_to`
  ADD CONSTRAINT `request_to_ibfk_1` FOREIGN KEY (`id_request`) REFERENCES `request_info` (`id`);

--
-- Constraints for table `user_relation`
--
ALTER TABLE `user_relation`
  ADD CONSTRAINT `user_relation_ibfk_2` FOREIGN KEY (`id_group`) REFERENCES `user_group_info` (`id`);

--
-- Constraints for table `user_relation_log`
--
ALTER TABLE `user_relation_log`
  ADD CONSTRAINT `user_relation_log_ibfk_3` FOREIGN KEY (`id_relation`) REFERENCES `user_relation` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
