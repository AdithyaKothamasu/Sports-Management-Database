-- phpMyAdmin SQL Dump
-- version 5.1.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Apr 20, 2024 at 05:47 PM
-- Server version: 5.7.24
-- PHP Version: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lolla`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `PROC1` (IN `aid` INT)   SELECT * FROM playertable WHERE player_id = aid$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc2` (IN `a` INT)   SELECT * FROM event_table WHERE sport_id=a$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc7` (IN `a1` INT)   select count(*) from playertable WHERE player_age>a1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_10` (IN `a1` INT, IN `a2` VARCHAR(20), IN `a3` DATE, IN `a4` VARCHAR(20), IN `a5` INT, IN `a6` INT, IN `a7` INT, IN `a8` INT, IN `a9` INT)   INSERT INTO playertable values(a1,a2,a3,a4,a5,a6,a7,a8,a9)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_11` (IN `a1` INT)   DELETE from event_table WHERE event_id=a1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_3` (IN `a1` INT, IN `a2` INT, IN `a3` INT, IN `a4` INT, IN `a5` INT, IN `a6` INT)   INSERT INTO match_table VALUES(a1,a2,a3,a4,a5,a6)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_4` (IN `a1` INT)   DELETE FROM podium_table WHERE event_id=a1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_5` (IN `a1` INT, IN `a2` VARCHAR(20))   UPDATE sport_table SET sport_name=a2 WHERE sport_id=a1$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_6` ()   UPDATE sport_table SET no_of_events=(SELECT count(*) FROM event_table WHERE sport_id=sport_table.sport_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_8` ()   UPDATE teamtable SET no_of_players=(SELECT count(*) FROM playertable WHERE team_id=teamtable.team_id)$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc_9` (IN `a1` INT, IN `a2` VARCHAR(20), IN `a3` INT, IN `a4` INT, IN `a5` DATE, IN `a6` VARCHAR(20), IN `a7` INT)   INSERT into event_table VALUES(a1,a2,a3,a4,a5,a6,a7)$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `audit_id` int(11) NOT NULL,
  `table_name` varchar(255) DEFAULT NULL,
  `action` varchar(50) DEFAULT NULL,
  `old_data` varchar(21) DEFAULT NULL,
  `new_data` varchar(21) DEFAULT NULL,
  `timestamp` datetime DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `audit_log`
--

INSERT INTO `audit_log` (`audit_id`, `table_name`, `action`, `old_data`, `new_data`, `timestamp`) VALUES
(2, 'event_table', 'INSERT', NULL, '54', '2024-04-15 17:18:57'),
(3, 'playertable', 'INSERT', NULL, 'parth', '2024-04-15 17:19:22'),
(4, 'playertable', 'INSERT', NULL, 'vaishnav', '2024-04-15 18:50:31'),
(5, 'event_table', 'INSERT', NULL, '14', '2024-04-15 22:20:13'),
(6, 'match_table', 'INSERT', NULL, '12', '2024-04-15 22:36:58'),
(7, 'event_table', 'INSERT', NULL, '15', '2024-04-17 15:31:34'),
(10, 'event_table', 'DELETE', '54', NULL, '2024-04-18 20:46:14'),
(14, 'playertable', 'UPDATE', ' Avery Sanchez', ' Avery Sanchez', '2024-04-18 21:07:53'),
(15, 'playertable', 'UPDATE', ' Noah Macias', ' Noah Macias', '2024-04-19 17:31:36'),
(16, 'playertable', 'UPDATE', ' Olivia Alvarez', ' Olivia Alvarez', '2024-04-19 17:32:19'),
(17, 'playertable', 'UPDATE', ' Olivia Alvarez', ' Olivia Alvarez', '2024-04-19 17:34:19'),
(18, 'playertable', 'UPDATE', ' Lucas Alvarado', ' Lucas Alvarado', '2024-04-19 19:39:09'),
(19, 'playertable', 'UPDATE', ' Avery Sanchez', ' Avery Sanchez', '2024-04-19 20:04:13'),
(20, 'match_table', 'INSERT', NULL, '9', '2024-04-20 12:00:10'),
(21, 'match_table', 'DELETE', '12', NULL, '2024-04-20 12:00:22'),
(22, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:24:00'),
(23, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:24:45'),
(24, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:25:26'),
(25, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 12:27:26'),
(26, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:27:26'),
(27, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 12:27:26'),
(28, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 12:27:26'),
(29, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 12:27:26'),
(30, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 12:27:26'),
(31, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 12:27:26'),
(32, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 12:27:26'),
(33, 'event_table', 'UPDATE', '1', '1', '2024-04-20 12:37:02'),
(34, 'event_table', 'UPDATE', '2', '2', '2024-04-20 12:37:02'),
(35, 'event_table', 'UPDATE', '3', '3', '2024-04-20 12:37:02'),
(36, 'event_table', 'UPDATE', '4', '4', '2024-04-20 12:37:02'),
(37, 'event_table', 'UPDATE', '5', '5', '2024-04-20 12:37:02'),
(38, 'event_table', 'UPDATE', '6', '6', '2024-04-20 12:37:02'),
(39, 'event_table', 'UPDATE', '7', '7', '2024-04-20 12:37:02'),
(40, 'event_table', 'UPDATE', '8', '8', '2024-04-20 12:37:02'),
(41, 'event_table', 'UPDATE', '14', '14', '2024-04-20 12:37:02'),
(42, 'event_table', 'UPDATE', '15', '15', '2024-04-20 12:37:02'),
(43, 'event_table', 'UPDATE', '21', '21', '2024-04-20 12:37:02'),
(44, 'playertable', 'UPDATE', ' Ethan Reyes', ' Ethan Reyes', '2024-04-20 12:39:40'),
(45, 'playertable', 'UPDATE', ' Olivia Alvarez', ' Olivia Alvarez', '2024-04-20 12:39:40'),
(46, 'playertable', 'UPDATE', ' Liam Flores', ' Liam Flores', '2024-04-20 12:39:40'),
(47, 'playertable', 'UPDATE', ' Isabella Ramirez', ' Isabella Ramirez', '2024-04-20 12:39:40'),
(48, 'playertable', 'UPDATE', ' Noah Gutierrez', ' Noah Gutierrez', '2024-04-20 12:39:40'),
(49, 'playertable', 'UPDATE', ' Mia Morales', ' Mia Morales', '2024-04-20 12:39:40'),
(50, 'playertable', 'UPDATE', ' Lucas Diaz', ' Lucas Diaz', '2024-04-20 12:39:40'),
(51, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 12:39:40'),
(52, 'playertable', 'UPDATE', ' Sophia Castillo', ' Sophia Castillo', '2024-04-20 12:39:40'),
(53, 'playertable', 'UPDATE', ' Ava Hernandez', ' Ava Hernandez', '2024-04-20 12:39:40'),
(54, 'playertable', 'UPDATE', ' Ethan Aguilar', ' Ethan Aguilar', '2024-04-20 12:39:40'),
(55, 'playertable', 'UPDATE', ' Mia Calderon', ' Mia Calderon', '2024-04-20 12:39:40'),
(56, 'playertable', 'UPDATE', ' Lucas Rojas', ' Lucas Rojas', '2024-04-20 12:39:40'),
(57, 'playertable', 'UPDATE', ' Sophia Gomez', ' Sophia Gomez', '2024-04-20 12:39:40'),
(58, 'playertable', 'UPDATE', ' Noah Ortiz', '', '2024-04-20 12:39:40'),
(59, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 12:56:47'),
(60, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 12:58:12'),
(61, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:58:12'),
(62, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 12:58:12'),
(63, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 12:58:12'),
(64, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 12:58:12'),
(65, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 12:58:12'),
(66, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 12:58:12'),
(67, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 12:58:12'),
(68, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:59:07'),
(69, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 12:59:16'),
(70, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 12:59:16'),
(71, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 12:59:16'),
(72, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 12:59:16'),
(73, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 12:59:16'),
(74, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 12:59:16'),
(75, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 12:59:16'),
(76, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 12:59:16'),
(77, 'playertable', 'UPDATE', ' Ethan Reyes', ' Ethan Reyes', '2024-04-20 13:02:41'),
(78, 'playertable', 'UPDATE', ' Liam Flores', ' Liam Flores', '2024-04-20 13:02:41'),
(79, 'playertable', 'UPDATE', ' Isabella Ramirez', ' Isabella Ramirez', '2024-04-20 13:02:41'),
(80, 'playertable', 'UPDATE', ' Noah Gutierrez', ' Noah Gutierrez', '2024-04-20 13:02:41'),
(81, 'playertable', 'UPDATE', ' Mia Morales', ' Mia Morales', '2024-04-20 13:02:41'),
(82, 'playertable', 'UPDATE', ' Lucas Diaz', ' Lucas Diaz', '2024-04-20 13:02:41'),
(83, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 13:02:41'),
(84, 'playertable', 'UPDATE', ' Sophia Castillo', ' Sophia Castillo', '2024-04-20 13:02:41'),
(85, 'playertable', 'UPDATE', ' Ava Hernandez', ' Ava Hernandez', '2024-04-20 13:02:41'),
(86, 'playertable', 'UPDATE', ' Ethan Aguilar', ' Ethan Aguilar', '2024-04-20 13:02:41'),
(87, 'playertable', 'UPDATE', ' Mia Calderon', ' Mia Calderon', '2024-04-20 13:02:41'),
(88, 'playertable', 'UPDATE', ' Lucas Rojas', ' Lucas Rojas', '2024-04-20 13:02:41'),
(89, 'playertable', 'UPDATE', ' Sophia Gomez', ' Sophia Gomez', '2024-04-20 13:02:41'),
(90, 'playertable', 'UPDATE', ' Ethan Reyes', ' Ethan Reyes', '2024-04-20 13:03:35'),
(91, 'playertable', 'UPDATE', ' Liam Flores', ' Liam Flores', '2024-04-20 13:03:35'),
(92, 'playertable', 'UPDATE', ' Isabella Ramirez', ' Isabella Ramirez', '2024-04-20 13:03:35'),
(93, 'playertable', 'UPDATE', ' Noah Gutierrez', ' Noah Gutierrez', '2024-04-20 13:03:35'),
(94, 'playertable', 'UPDATE', ' Mia Morales', ' Mia Morales', '2024-04-20 13:03:35'),
(95, 'playertable', 'UPDATE', ' Lucas Diaz', ' Lucas Diaz', '2024-04-20 13:03:35'),
(96, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 13:03:35'),
(97, 'playertable', 'UPDATE', ' Sophia Castillo', ' Sophia Castillo', '2024-04-20 13:03:35'),
(98, 'playertable', 'UPDATE', ' Ava Hernandez', ' Ava Hernandez', '2024-04-20 13:03:35'),
(99, 'playertable', 'UPDATE', ' Ethan Aguilar', ' Ethan Aguilar', '2024-04-20 13:03:35'),
(100, 'playertable', 'UPDATE', ' Mia Calderon', ' Mia Calderon', '2024-04-20 13:03:35'),
(101, 'playertable', 'UPDATE', ' Avery Sanchez', ' Avery Sanchez', '2024-04-20 13:05:14'),
(102, 'event_table', 'DELETE', '21', NULL, '2024-04-20 13:06:57'),
(103, 'event_table', 'INSERT', NULL, '16', '2024-04-20 13:13:36'),
(104, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 13:13:36'),
(105, 'event_table', 'UPDATE', '16', '16', '2024-04-20 13:14:22'),
(106, 'team_table', 'UPDATE', '1', '1', '2024-04-20 13:18:29'),
(107, 'team_table', 'UPDATE', '2', '2', '2024-04-20 13:18:29'),
(108, 'team_table', 'UPDATE', '3', '3', '2024-04-20 13:18:29'),
(109, 'team_table', 'UPDATE', '4', '4', '2024-04-20 13:18:29'),
(110, 'team_table', 'UPDATE', '5', '5', '2024-04-20 13:18:29'),
(111, 'team_table', 'UPDATE', '6', '6', '2024-04-20 13:18:29'),
(112, 'team_table', 'UPDATE', '7', '7', '2024-04-20 13:18:29'),
(113, 'team_table', 'UPDATE', '8', '8', '2024-04-20 13:18:29'),
(116, 'playertable', 'INSERT', NULL, '', '2024-04-20 13:27:26'),
(117, 'playertable', 'INSERT', NULL, 'vaishnavii', '2024-04-20 13:28:52'),
(118, 'team_table', 'UPDATE', '7', '7', '2024-04-20 13:28:52'),
(119, 'playertable', 'DELETE', '', NULL, '2024-04-20 13:29:12'),
(120, 'playertable', 'DELETE', 'vaishnav', NULL, '2024-04-20 13:29:16'),
(121, 'playertable', 'DELETE', 'vaishnavii', NULL, '2024-04-20 13:30:00'),
(122, 'playertable', 'DELETE', 'linga', NULL, '2024-04-20 13:30:05'),
(123, 'playertable', 'DELETE', 'vaishnav', NULL, '2024-04-20 13:30:07'),
(124, 'playertable', 'DELETE', 'parth', NULL, '2024-04-20 13:30:10'),
(125, 'playertable', 'DELETE', 'parth', NULL, '2024-04-20 13:30:12'),
(126, 'team_table', 'UPDATE', '1', '1', '2024-04-20 13:30:43'),
(127, 'team_table', 'UPDATE', '2', '2', '2024-04-20 13:30:43'),
(128, 'team_table', 'UPDATE', '3', '3', '2024-04-20 13:30:43'),
(129, 'team_table', 'UPDATE', '4', '4', '2024-04-20 13:30:43'),
(130, 'team_table', 'UPDATE', '5', '5', '2024-04-20 13:30:43'),
(131, 'team_table', 'UPDATE', '6', '6', '2024-04-20 13:30:43'),
(132, 'team_table', 'UPDATE', '7', '7', '2024-04-20 13:30:43'),
(133, 'team_table', 'UPDATE', '8', '8', '2024-04-20 13:30:43'),
(134, 'playertable', 'INSERT', NULL, 'harish', '2024-04-20 13:31:52'),
(135, 'team_table', 'UPDATE', '1', '1', '2024-04-20 13:31:52'),
(136, 'playertable', 'DELETE', 'harish', NULL, '2024-04-20 13:32:11'),
(137, 'team_table', 'UPDATE', '1', '1', '2024-04-20 13:32:16'),
(138, 'team_table', 'UPDATE', '2', '2', '2024-04-20 13:32:16'),
(139, 'team_table', 'UPDATE', '3', '3', '2024-04-20 13:32:16'),
(140, 'team_table', 'UPDATE', '4', '4', '2024-04-20 13:32:16'),
(141, 'team_table', 'UPDATE', '5', '5', '2024-04-20 13:32:16'),
(142, 'team_table', 'UPDATE', '6', '6', '2024-04-20 13:32:16'),
(143, 'team_table', 'UPDATE', '7', '7', '2024-04-20 13:32:16'),
(144, 'team_table', 'UPDATE', '8', '8', '2024-04-20 13:32:16'),
(145, 'match_table', 'INSERT', NULL, '100', '2024-04-20 15:50:19'),
(146, 'match_table', 'INSERT', NULL, '101', '2024-04-20 15:52:03'),
(147, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 18:53:27'),
(148, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:01:12'),
(149, 'playertable', 'UPDATE', ' Noah Macias', ' Noah Macias', '2024-04-20 19:18:56'),
(150, 'playertable', 'UPDATE', ' Noah Macias', ' Noah Macias', '2024-04-20 19:22:03'),
(151, 'playertable', 'UPDATE', ' Mia Morales', ' Mia Morales', '2024-04-20 19:27:37'),
(152, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:05'),
(153, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:16'),
(154, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:16'),
(155, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:17'),
(156, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:17'),
(157, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:18'),
(158, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:18'),
(159, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:19'),
(160, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:20'),
(161, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:25'),
(162, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:26'),
(163, 'playertable', 'UPDATE', ' Emma Soto', ' Emma Soto', '2024-04-20 19:28:26'),
(164, 'playertable', 'UPDATE', ' Sophia Castillo', ' Sophia Castillo', '2024-04-20 19:29:44'),
(165, 'playertable', 'UPDATE', ' Lucas Diaz', ' Lucas Diaz', '2024-04-20 19:35:41'),
(166, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 19:46:14'),
(167, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 19:46:14'),
(168, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:46:14'),
(169, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 19:46:14'),
(170, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 19:46:14'),
(171, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 19:46:14'),
(172, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 19:46:14'),
(173, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 19:46:14'),
(174, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 19:46:14'),
(175, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 19:46:14'),
(176, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:46:14'),
(177, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 19:46:14'),
(178, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 19:46:14'),
(179, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 19:46:14'),
(180, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 19:46:14'),
(181, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 19:46:14'),
(182, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 19:46:15'),
(183, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 19:46:15'),
(184, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:46:15'),
(185, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 19:46:15'),
(186, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 19:46:15'),
(187, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 19:46:15'),
(188, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 19:46:15'),
(189, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 19:46:15'),
(190, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 19:46:15'),
(191, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 19:46:15'),
(192, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:46:15'),
(193, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 19:46:15'),
(194, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 19:46:15'),
(195, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 19:46:15'),
(196, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 19:46:15'),
(197, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 19:46:15'),
(198, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 19:46:27'),
(199, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 19:46:27'),
(200, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:46:27'),
(201, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 19:46:27'),
(202, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 19:46:27'),
(203, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 19:46:27'),
(204, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 19:46:27'),
(205, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 19:46:27'),
(206, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 19:46:28'),
(207, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 19:46:28'),
(208, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 19:46:28'),
(209, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 19:46:28'),
(210, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 19:46:28'),
(211, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 19:46:28'),
(212, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 19:46:28'),
(213, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 19:46:28'),
(214, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 20:08:58'),
(215, 'event_table', 'INSERT', NULL, '17', '2024-04-20 20:08:58'),
(216, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 20:19:13'),
(217, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 20:19:13'),
(218, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 20:19:13'),
(219, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 20:19:13'),
(220, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 20:19:13'),
(221, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 20:19:13'),
(222, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 20:19:13'),
(223, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 20:19:13'),
(224, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 20:23:18'),
(225, 'event_table', 'INSERT', NULL, '18', '2024-04-20 20:23:18'),
(226, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 20:23:23'),
(227, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 20:23:23'),
(228, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 20:23:23'),
(229, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 20:23:23'),
(230, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 20:23:23'),
(231, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 20:23:23'),
(232, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 20:23:23'),
(233, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 20:23:23'),
(234, 'team_table', 'UPDATE', '3', '3', '2024-04-20 21:09:18'),
(235, 'playertable', 'INSERT', NULL, 'srichandra', '2024-04-20 21:09:18'),
(236, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:18:06'),
(237, 'playertable', 'UPDATE', ' Ava Santana', ' Ava Santana', '2024-04-20 21:18:41'),
(238, 'playertable', 'UPDATE', ' Ava Santana', ' Ava Santana', '2024-04-20 21:18:55'),
(239, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:11'),
(240, 'event_table', 'INSERT', NULL, '20', '2024-04-20 21:20:11'),
(241, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:37'),
(242, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:37'),
(243, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:37'),
(244, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:37'),
(245, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:37'),
(246, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:37'),
(247, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:37'),
(248, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:37'),
(249, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:38'),
(250, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:38'),
(251, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:38'),
(252, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:38'),
(253, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:38'),
(254, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:38'),
(255, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:38'),
(256, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:38'),
(257, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:39'),
(258, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:39'),
(259, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:39'),
(260, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:39'),
(261, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:39'),
(262, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:39'),
(263, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:39'),
(264, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:39'),
(265, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:39'),
(266, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:39'),
(267, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:39'),
(268, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:39'),
(269, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:39'),
(270, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:39'),
(271, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:39'),
(272, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:39'),
(273, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:40'),
(274, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:40'),
(275, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:40'),
(276, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:40'),
(277, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:40'),
(278, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:40'),
(279, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:40'),
(280, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:40'),
(281, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:40'),
(282, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:40'),
(283, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:40'),
(284, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:40'),
(285, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:40'),
(286, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:40'),
(287, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:40'),
(288, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:40'),
(289, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 21:20:40'),
(290, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 21:20:40'),
(291, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 21:20:40'),
(292, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 21:20:40'),
(293, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 21:20:40'),
(294, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 21:20:40'),
(295, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 21:20:40'),
(296, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 21:20:40'),
(297, 'team_table', 'UPDATE', '5', '5', '2024-04-20 21:23:18'),
(298, 'playertable', 'INSERT', NULL, 'lolla', '2024-04-20 21:23:18'),
(299, 'event_table', 'DELETE', '20', NULL, '2024-04-20 21:28:28'),
(300, 'event_table', 'DELETE', '17', NULL, '2024-04-20 22:59:10'),
(301, 'sport_table', 'UPDATE', '1', '1', '2024-04-20 22:59:43'),
(302, 'sport_table', 'UPDATE', '2', '2', '2024-04-20 22:59:43'),
(303, 'sport_table', 'UPDATE', '3', '3', '2024-04-20 22:59:43'),
(304, 'sport_table', 'UPDATE', '4', '4', '2024-04-20 22:59:43'),
(305, 'sport_table', 'UPDATE', '5', '5', '2024-04-20 22:59:43'),
(306, 'sport_table', 'UPDATE', '6', '6', '2024-04-20 22:59:43'),
(307, 'sport_table', 'UPDATE', '7', '7', '2024-04-20 22:59:43'),
(308, 'sport_table', 'UPDATE', '8', '8', '2024-04-20 22:59:43');

-- --------------------------------------------------------

--
-- Table structure for table `event_table`
--

CREATE TABLE `event_table` (
  `event_id` int(11) NOT NULL,
  `event_name` varchar(21) NOT NULL,
  `sport_id` int(11) DEFAULT NULL,
  `venue_id` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `previous_record` varchar(20) DEFAULT NULL,
  `no_of_participants` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `event_table`
--

INSERT INTO `event_table` (`event_id`, `event_name`, `sport_id`, `venue_id`, `date`, `previous_record`, `no_of_participants`) VALUES
(1, ' 100m Freestyle', 1, 1, '2024-03-01', ' 51.72', 6),
(2, ' Women\'s Singles', 2, 2, '2024-04-01', ' 2:08:45', 3),
(3, ' Championship Finals', 3, 3, '2024-06-30', ' 2-1', 6),
(4, ' Women\'s Team Final', 4, 4, '2024-08-15', ' 57.84', 5),
(5, ' 100m Dash', 5, 5, '2024-09-01', ' 10.45', 4),
(6, ' Lightweight Title', 6, 6, '2024-10-15', ' 2:15:18', 3),
(7, ' Formula 1 Grand Prix', 7, 7, '2024-11-10', ' 1:10:09', 3),
(8, ' 3x3 Basketball', 8, 8, '2024-12-01', ' 21-19', 4),
(14, '200m freestyle', 1, 5, NULL, NULL, 0),
(15, '200m freestyle', 8, 8, '2024-04-09', NULL, 0),
(16, 'gymnastic boys', 4, 1, '2024-04-03', 'NO', 0),
(18, 'lollasgames', 5, 5, '2024-05-25', '89', 30);

--
-- Triggers `event_table`
--
DELIMITER $$
CREATE TRIGGER `autoinc` AFTER INSERT ON `event_table` FOR EACH ROW UPDATE sport_table
SET no_of_events = no_of_events + 1
WHERE new.sport_id=sport_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logevent_delete` AFTER DELETE ON `event_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('event_table', 'DELETE', OLD.event_id, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logevent_insert` AFTER INSERT ON `event_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('event_table', 'INSERT', NULL, NEW.event_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logevent_update` AFTER UPDATE ON `event_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('event_table', 'UPDATE', OLD.event_id, NEW.event_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `has_table`
--

CREATE TABLE `has_table` (
  `event_id` int(11) DEFAULT NULL,
  `sport_id` int(11) DEFAULT NULL,
  `location` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `has_table`
--

INSERT INTO `has_table` (`event_id`, `sport_id`, `location`) VALUES
(1, 1, ''),
(2, 2, ''),
(3, 3, ''),
(4, 4, ''),
(5, 5, ''),
(6, 6, ''),
(7, 7, ''),
(8, 8, '');

-- --------------------------------------------------------

--
-- Table structure for table `match_table`
--

CREATE TABLE `match_table` (
  `match_id` int(11) NOT NULL,
  `win_player_id` int(11) DEFAULT NULL,
  `lose_player_id` int(11) DEFAULT NULL,
  `win_team_id` int(11) DEFAULT NULL,
  `lose_team_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `match_table`
--

INSERT INTO `match_table` (`match_id`, `win_player_id`, `lose_player_id`, `win_team_id`, `lose_team_id`, `event_id`) VALUES
(1, 1, 7, 1, 1, 1),
(2, 2, 11, 2, 2, 2),
(3, 3, 6, 3, 3, 3),
(4, 4, 18, 4, 4, 4),
(5, 5, 19, 5, 5, 5),
(6, 9, 15, 7, 7, 6),
(7, 10, 20, 8, 8, 7),
(8, 8, 14, 6, 6, 8),
(9, 5, 7, 1, 4, 3),
(100, 6, 6, 6, 6, 6),
(101, 7, 7, 7, 7, 7);

--
-- Triggers `match_table`
--
DELIMITER $$
CREATE TRIGGER `logmatch_delete` AFTER DELETE ON `match_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('match_table', 'DELETE', OLD.match_id, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logmatch_insert` AFTER INSERT ON `match_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('match_table', 'INSERT', NULL, NEW.match_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logmatch_update` AFTER UPDATE ON `match_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('match_table', 'UPDATE', OLD.match_id, NEW.match_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `playertable`
--

CREATE TABLE `playertable` (
  `player_ID` int(11) NOT NULL,
  `player_name` varchar(20) NOT NULL,
  `dob` date DEFAULT NULL,
  `player_gender` varchar(20) DEFAULT NULL,
  `rep_body_id` int(11) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `player_age` int(11) DEFAULT NULL,
  `exp` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `playertable`
--

INSERT INTO `playertable` (`player_ID`, `player_name`, `dob`, `player_gender`, `rep_body_id`, `team_id`, `event_id`, `player_age`, `exp`) VALUES
(1, ' Avery Sanchez', '1990-08-15', ' Female', 1, 1, 1, 41, 6),
(2, ' Ethan Reyes', '1985-04-22', ' Male', 2, 2, 2, 39, 0),
(3, ' Olivia Alvarez', '1993-11-07', ' Female', 3, 3, 3, 42, 2),
(4, ' Liam Flores', '1987-06-30', ' Male', 4, 4, 4, 37, 0),
(5, ' Isabella Ramirez', '1991-02-14', ' Female', 5, 5, 5, 33, 0),
(6, ' Noah Gutierrez', '1988-09-18', ' Male', 3, 3, 3, 36, 0),
(7, ' Mia Morales', '1995-05-03', ' Female', 1, 1, 1, 7, -22),
(8, ' Lucas Diaz', '1992-12-25', ' Male', 6, 6, 6, 34, 2),
(9, ' Emma Soto', '1986-07-09', ' Female', 7, 7, 7, 9, -29),
(10, ' Sophia Castillo', '1989-03-28', ' Female', 8, 8, 8, 10, -25),
(11, ' Ava Hernandez', '1993-09-11', ' Female', 2, 2, 2, 31, 0),
(12, ' Ethan Aguilar', '1985-01-27', ' Male', 3, 3, 3, 39, 0),
(13, ' Mia Calderon', '1991-05-19', ' Female', 3, 3, 3, 33, 0),
(14, ' Lucas Rojas', '1995-08-01', ' Male', 6, 6, 6, 29, 0),
(15, ' Sophia Gomez', '1987-10-24', ' Female', 7, 7, 7, 37, 0),
(16, '', '1993-02-18', ' Male', 1, 1, 1, 31, 0),
(17, ' Ava Santana', '1990-06-02', ' Female', 1, 1, 1, 38, 4),
(18, ' Ethan Marquez', '1996-03-15', ' Male', 4, 4, 4, 28, 0),
(19, ' Isabella Suarez', '1988-11-23', ' Female', 5, 5, 5, 36, 0),
(20, ' Emma Garcia', '1989-12-08', ' Female', 8, 8, 8, 35, 0),
(21, ' Liam Ramos', '1992-07-06', ' Male', 2, 2, 2, 32, 0),
(22, ' Mia Vargas', '1986-04-12', ' Female', 3, 3, 3, 38, 0),
(23, ' Lucas Alvarado', '1995-10-28', ' Male', 6, 6, 6, 37, 8),
(24, ' Sophia Cruz', '1987-09-05', ' Female', 7, 7, 7, 37, 0),
(25, ' Noah Macias', '1993-01-22', ' Male', 1, 1, 1, 25, -7),
(26, ' Ava Vega', '1990-07-14', ' Female', 1, 1, 1, 34, 0),
(27, ' Ethan Jimenez', '1996-04-20', ' Male', 4, 4, 4, 28, 0),
(28, ' Isabella Serrano', '1988-08-30', ' Female', 5, 5, 5, 36, 0),
(29, ' Emma Mendoza', '1986-03-27', ' Female', 3, 3, 3, 38, 0),
(30, ' Liam Campos', '1989-09-16', ' Male', 8, 8, 8, 35, 0),
(56, 'srichandra', '2022-06-06', 'Male', 1, 3, 4, 12, 31),
(100, 'lolla', '2004-06-06', 'Male', 4, 5, 3, 10, 0);

--
-- Triggers `playertable`
--
DELIMITER $$
CREATE TRIGGER `autoincplayer` AFTER INSERT ON `playertable` FOR EACH ROW UPDATE teamtable SET no_of_players=no_of_players+1 where team_id=new.team_id
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logplayer_delete` AFTER DELETE ON `playertable` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, action, old_data, new_data)
    VALUES ('playertable', 'DELETE', OLD.player_name, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logplayer_insert` AFTER INSERT ON `playertable` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, action, old_data, new_data)
    VALUES ('playertable', 'INSERT', NULL, NEW.player_name);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logplayer_update` AFTER UPDATE ON `playertable` FOR EACH ROW BEGIN
    INSERT INTO audit_log (table_name, action, old_data, new_data)
    VALUES ('playertable', 'UPDATE', OLD.player_name, NEW.player_name);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trr1` BEFORE UPDATE ON `playertable` FOR EACH ROW SET new.exp=old.exp+new.player_age-old.player_age
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `player_event_table`
--

CREATE TABLE `player_event_table` (
  `player_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `player_event_table`
--

INSERT INTO `player_event_table` (`player_id`, `event_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 3),
(7, 1),
(8, 6),
(9, 7),
(10, 8),
(11, 2),
(12, 3),
(13, 3),
(14, 6),
(15, 7),
(16, 1),
(17, 1),
(18, 4),
(19, 5),
(20, 8),
(21, 2),
(22, 3),
(23, 6),
(24, 7),
(25, 1),
(26, 1),
(27, 4),
(28, 5),
(29, 3),
(30, 8);

-- --------------------------------------------------------

--
-- Table structure for table `plays_in_1_table`
--

CREATE TABLE `plays_in_1_table` (
  `player_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `latest_record_1` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plays_in_1_table`
--

INSERT INTO `plays_in_1_table` (`player_id`, `event_id`, `latest_record_1`) VALUES
(1, 1, ' 51.72'),
(2, 2, ' 2:08:45'),
(3, 3, ' 2-1'),
(4, 4, ' 57.84'),
(5, 5, ' 10.45'),
(6, 3, ' 2-1'),
(7, 1, ' 51.72'),
(8, 6, ' 2:15:18'),
(9, 7, ' 1:10:09'),
(10, 8, ' 21-19'),
(11, 2, ' 2:08:45'),
(12, 3, ' 2-1'),
(13, 3, ' 2-1'),
(14, 6, ' 2:15:18'),
(15, 7, ' 1:10:09'),
(16, 1, ' 51.72'),
(17, 1, ' 51.72'),
(18, 4, ' 57.84'),
(19, 5, ' 10.45'),
(20, 8, ' 21-19'),
(21, 2, ' 2:08:45'),
(22, 3, ' 2-1'),
(23, 6, ' 2:15:18'),
(24, 7, ' 1:10:09'),
(25, 1, ' 51.72'),
(26, 1, ' 51.72'),
(27, 4, ' 57.84'),
(28, 5, ' 10.45'),
(29, 3, ' 2-1'),
(30, 8, ' 21-19');

-- --------------------------------------------------------

--
-- Table structure for table `plays_in_2_table`
--

CREATE TABLE `plays_in_2_table` (
  `team_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `latest_record_2` varchar(8) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `plays_in_2_table`
--

INSERT INTO `plays_in_2_table` (`team_id`, `event_id`, `latest_record_2`) VALUES
(1, 1, ' 51.72'),
(1, 2, ' 2:08:45'),
(2, 1, ' 51.72'),
(2, 2, ' 2:08:45'),
(3, 3, ' 2-1'),
(3, 6, ' 2:15:18'),
(4, 3, ' 2-1'),
(4, 4, ' 57.84'),
(5, 4, ' 57.84'),
(5, 5, ' 10.45'),
(6, 5, ' 10.45'),
(6, 6, ' 2:15:18'),
(7, 7, ' 1:10:09'),
(7, 8, ' 1:10:09'),
(8, 7, ' 21-19'),
(8, 8, ' 21-19');

-- --------------------------------------------------------

--
-- Table structure for table `podium_table`
--

CREATE TABLE `podium_table` (
  `event_id` int(11) DEFAULT NULL,
  `first_place_player_id` int(11) DEFAULT NULL,
  `second_place_player_id` int(11) DEFAULT NULL,
  `third_place_player_id` int(11) DEFAULT NULL,
  `first_place_team_id` int(11) DEFAULT NULL,
  `second_place_team_id` int(11) DEFAULT NULL,
  `third_place_team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `podium_table`
--

INSERT INTO `podium_table` (`event_id`, `first_place_player_id`, `second_place_player_id`, `third_place_player_id`, `first_place_team_id`, `second_place_team_id`, `third_place_team_id`) VALUES
(1, 1, 7, 25, 1, 1, 1),
(2, 2, 11, 21, 2, 2, 2),
(4, 4, 18, 27, 4, 4, 4),
(5, 5, 19, 28, 5, 5, 5),
(6, 9, 15, 24, 7, 7, 7),
(8, 8, 14, 23, 6, 6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `representing_body_table`
--

CREATE TABLE `representing_body_table` (
  `rep_body_id` int(11) NOT NULL,
  `name` varchar(27) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `representing_body_table`
--

INSERT INTO `representing_body_table` (`rep_body_id`, `name`) VALUES
(1, ' National Sports Commission'),
(2, ' Regional Sports Federation'),
(3, ' State Athletic Association'),
(4, ' City Sports Board'),
(5, ' District Sports Union'),
(6, ' Provincial Sports Council'),
(7, ' County Sports Organization'),
(8, ' Municipal Sports Authority');

--
-- Triggers `representing_body_table`
--
DELIMITER $$
CREATE TRIGGER `logrepbody_delete` AFTER DELETE ON `representing_body_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('rep_body_table', 'DELETE', OLD.rep_body_id, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logrepbody_insert` AFTER INSERT ON `representing_body_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('rep_body_table', 'INSERT', NULL, NEW.rep_body_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logrepbody_update` AFTER UPDATE ON `representing_body_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('rep_body_table', 'UPDATE', OLD.rep_body_id, NEW.rep_body_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `sport_table`
--

CREATE TABLE `sport_table` (
  `sport_id` int(11) NOT NULL,
  `sport_name` varchar(11) DEFAULT NULL,
  `no_of_events` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sport_table`
--

INSERT INTO `sport_table` (`sport_id`, `sport_name`, `no_of_events`) VALUES
(1, ' Swimming', 2),
(2, 'TableTennis', 1),
(3, 'Football', 1),
(4, ' Gymnastics', 2),
(5, ' Athletics', 2),
(6, ' MMA', 1),
(7, 'running', 1),
(8, ' Basketball', 2);

--
-- Triggers `sport_table`
--
DELIMITER $$
CREATE TRIGGER `logsport_delete` AFTER DELETE ON `sport_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('sport_table', 'DELETE', OLD.sport_id, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logsport_insert` AFTER INSERT ON `sport_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('sport_table', 'INSERT', NULL, NEW.sport_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logsport_update` AFTER UPDATE ON `sport_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('sport_table', 'UPDATE', OLD.sport_id, NEW.sport_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `teamtable`
--

CREATE TABLE `teamtable` (
  `team_id` int(11) NOT NULL,
  `name` varchar(9) DEFAULT NULL,
  `rep_body_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL,
  `no_of_players` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `teamtable`
--

INSERT INTO `teamtable` (`team_id`, `name`, `rep_body_id`, `event_id`, `no_of_players`) VALUES
(1, ' Sharks', 1, 1, 6),
(2, ' Eagles', 2, 2, 3),
(3, ' Tigers', 3, 3, 7),
(4, ' Panthers', 4, 4, 3),
(5, ' Jaguars', 5, 5, 4),
(6, ' Lions', 6, 6, 3),
(7, ' Falcons', 7, 7, 3),
(8, ' Hawks', 8, 8, 3);

--
-- Triggers `teamtable`
--
DELIMITER $$
CREATE TRIGGER `logteam_delete` AFTER DELETE ON `teamtable` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('team_table', 'DELETE', OLD.team_id, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logteam_insert` AFTER INSERT ON `teamtable` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('team_table', 'INSERT', NULL, NEW.team_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logteam_update` AFTER UPDATE ON `teamtable` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('team_table', 'UPDATE', OLD.team_id, NEW.team_id);
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `team_event_table`
--

CREATE TABLE `team_event_table` (
  `team_id` int(11) DEFAULT NULL,
  `event_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `team_event_table`
--

INSERT INTO `team_event_table` (`team_id`, `event_id`) VALUES
(1, 1),
(1, 2),
(2, 1),
(2, 2),
(3, 3),
(3, 6),
(4, 3),
(4, 4),
(5, 4),
(5, 5),
(6, 5),
(6, 6),
(7, 7),
(7, 8),
(8, 7),
(8, 8);

-- --------------------------------------------------------

--
-- Table structure for table `venue_table`
--

CREATE TABLE `venue_table` (
  `venue_id` int(11) NOT NULL,
  `name` varchar(17) DEFAULT NULL,
  `location` varchar(13) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `venue_table`
--

INSERT INTO `venue_table` (`venue_id`, `name`, `location`) VALUES
(1, ' Aquatic Center', ' Oceanview'),
(2, ' Tennis Stadium', ' Sportsville'),
(3, ' Football Arena', ' Athletictown'),
(4, ' Gymnastics Hall', ' Acroville'),
(5, ' Athletics Track', ' Runnerstown'),
(6, ' MMA Octagon', ' Fightopolis'),
(7, ' Racing Circuit', ' Speedway'),
(8, ' Basketball Court', ' Hoopsville');

--
-- Triggers `venue_table`
--
DELIMITER $$
CREATE TRIGGER `logvenue_delete` AFTER DELETE ON `venue_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('venue_table', 'DELETE', OLD.venue_id, NULL);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logvenue_insert` AFTER INSERT ON `venue_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('venue_table', 'INSERT', NULL, NEW.venue_id);
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `logvenue_update` AFTER UPDATE ON `venue_table` FOR EACH ROW BEGIN
INSERT INTO audit_log (table_name, action, old_data, new_data)
VALUES ('venue_table', 'UPDATE', OLD.venue_id, NEW.venue_id);
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`audit_id`);

--
-- Indexes for table `event_table`
--
ALTER TABLE `event_table`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `event_id` (`event_id`,`event_name`,`sport_id`,`venue_id`,`date`,`previous_record`,`no_of_participants`),
  ADD KEY `event_table_fk1` (`sport_id`),
  ADD KEY `event_table_fk2` (`venue_id`),
  ADD KEY `event_id_2` (`event_id`,`event_name`,`sport_id`,`venue_id`,`date`,`previous_record`,`no_of_participants`);

--
-- Indexes for table `has_table`
--
ALTER TABLE `has_table`
  ADD KEY `event_id` (`event_id`,`sport_id`),
  ADD KEY `has_table_fk2` (`sport_id`);

--
-- Indexes for table `match_table`
--
ALTER TABLE `match_table`
  ADD PRIMARY KEY (`match_id`),
  ADD KEY `match_id` (`match_id`,`win_player_id`,`lose_player_id`,`win_team_id`,`lose_team_id`,`event_id`),
  ADD KEY `match_table_fk1` (`win_player_id`),
  ADD KEY `match_table_fk2` (`lose_player_id`),
  ADD KEY `match_table_fk3` (`win_team_id`),
  ADD KEY `match_table_fk4` (`lose_team_id`),
  ADD KEY `match_table_fk5` (`event_id`);

--
-- Indexes for table `playertable`
--
ALTER TABLE `playertable`
  ADD PRIMARY KEY (`player_ID`),
  ADD KEY `player_ID` (`player_ID`,`player_name`,`dob`,`player_gender`,`rep_body_id`,`team_id`,`event_id`,`player_age`),
  ADD KEY `playertable_fk1` (`rep_body_id`),
  ADD KEY `playertable_fk2` (`team_id`),
  ADD KEY `playertable_fk3` (`event_id`),
  ADD KEY ` player_age` (`player_age`),
  ADD KEY `exp` (`exp`);

--
-- Indexes for table `player_event_table`
--
ALTER TABLE `player_event_table`
  ADD KEY `player_id` (`player_id`,`event_id`),
  ADD KEY `player_event_table_fk2` (`event_id`);

--
-- Indexes for table `plays_in_1_table`
--
ALTER TABLE `plays_in_1_table`
  ADD KEY `player_id` (`player_id`,`event_id`,`latest_record_1`),
  ADD KEY `plays_in_1_table_fk2` (`event_id`);

--
-- Indexes for table `plays_in_2_table`
--
ALTER TABLE `plays_in_2_table`
  ADD KEY `team_id` (`team_id`,`event_id`,`latest_record_2`),
  ADD KEY `team_id_2` (`team_id`,`event_id`,`latest_record_2`),
  ADD KEY `team_id_3` (`team_id`,`event_id`,`latest_record_2`),
  ADD KEY `team_id_4` (`team_id`,`event_id`,`latest_record_2`),
  ADD KEY `plays_in_2_fk2` (`event_id`);

--
-- Indexes for table `podium_table`
--
ALTER TABLE `podium_table`
  ADD KEY `event_id` (`event_id`,`first_place_player_id`,`second_place_player_id`,`third_place_player_id`,`first_place_team_id`,`second_place_team_id`,`third_place_team_id`),
  ADD KEY `podium_table_fk2` (`first_place_player_id`),
  ADD KEY `podium_table_fk3` (`second_place_player_id`),
  ADD KEY `podium_table_fk4` (`third_place_player_id`),
  ADD KEY `podium_table_fk5` (`first_place_team_id`),
  ADD KEY `podium_table_fk6` (`second_place_team_id`),
  ADD KEY `podium_table_fk7` (`third_place_team_id`);

--
-- Indexes for table `representing_body_table`
--
ALTER TABLE `representing_body_table`
  ADD PRIMARY KEY (`rep_body_id`),
  ADD KEY `rep_body_id` (`rep_body_id`,`name`);

--
-- Indexes for table `sport_table`
--
ALTER TABLE `sport_table`
  ADD PRIMARY KEY (`sport_id`),
  ADD KEY `sport_id` (`sport_id`,`sport_name`),
  ADD KEY `sport_id_2` (`sport_id`,`sport_name`),
  ADD KEY `sport_id_3` (`sport_id`,`sport_name`,`no_of_events`);

--
-- Indexes for table `teamtable`
--
ALTER TABLE `teamtable`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `team_id` (`team_id`,`name`,`rep_body_id`,`event_id`),
  ADD KEY `team_id_2` (`team_id`,`name`,`rep_body_id`,`event_id`),
  ADD KEY `teamtable_fk1` (`rep_body_id`),
  ADD KEY `teamtable_fk2` (`event_id`),
  ADD KEY `no_of_players` (`no_of_players`);

--
-- Indexes for table `team_event_table`
--
ALTER TABLE `team_event_table`
  ADD KEY `team_id` (`team_id`,`event_id`),
  ADD KEY `team_event_table_fk2` (`event_id`);

--
-- Indexes for table `venue_table`
--
ALTER TABLE `venue_table`
  ADD PRIMARY KEY (`venue_id`),
  ADD KEY `venue_id` (`venue_id`,`name`,`location`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `audit_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=309;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `event_table`
--
ALTER TABLE `event_table`
  ADD CONSTRAINT `event_table_fk1` FOREIGN KEY (`sport_id`) REFERENCES `sport_table` (`sport_id`),
  ADD CONSTRAINT `event_table_fk2` FOREIGN KEY (`venue_id`) REFERENCES `venue_table` (`venue_id`);

--
-- Constraints for table `has_table`
--
ALTER TABLE `has_table`
  ADD CONSTRAINT `has_table_fk1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`),
  ADD CONSTRAINT `has_table_fk2` FOREIGN KEY (`sport_id`) REFERENCES `sport_table` (`sport_id`);

--
-- Constraints for table `match_table`
--
ALTER TABLE `match_table`
  ADD CONSTRAINT `match_table_fk1` FOREIGN KEY (`win_player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `match_table_fk2` FOREIGN KEY (`lose_player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `match_table_fk3` FOREIGN KEY (`win_team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `match_table_fk4` FOREIGN KEY (`lose_team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `match_table_fk5` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);

--
-- Constraints for table `playertable`
--
ALTER TABLE `playertable`
  ADD CONSTRAINT `playertable_fk1` FOREIGN KEY (`rep_body_id`) REFERENCES `representing_body_table` (`rep_body_id`),
  ADD CONSTRAINT `playertable_fk2` FOREIGN KEY (`team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `playertable_fk3` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);

--
-- Constraints for table `player_event_table`
--
ALTER TABLE `player_event_table`
  ADD CONSTRAINT `player_event_table_fk1` FOREIGN KEY (`player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `player_event_table_fk2` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);

--
-- Constraints for table `plays_in_1_table`
--
ALTER TABLE `plays_in_1_table`
  ADD CONSTRAINT `plays_in_1_table_fk1` FOREIGN KEY (`player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `plays_in_1_table_fk2` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);

--
-- Constraints for table `plays_in_2_table`
--
ALTER TABLE `plays_in_2_table`
  ADD CONSTRAINT `plays_in_2_fk1` FOREIGN KEY (`team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `plays_in_2_fk2` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);

--
-- Constraints for table `podium_table`
--
ALTER TABLE `podium_table`
  ADD CONSTRAINT `podium_table_fk1` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`),
  ADD CONSTRAINT `podium_table_fk2` FOREIGN KEY (`first_place_player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `podium_table_fk3` FOREIGN KEY (`second_place_player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `podium_table_fk4` FOREIGN KEY (`third_place_player_id`) REFERENCES `playertable` (`player_ID`),
  ADD CONSTRAINT `podium_table_fk5` FOREIGN KEY (`first_place_team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `podium_table_fk6` FOREIGN KEY (`second_place_team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `podium_table_fk7` FOREIGN KEY (`third_place_team_id`) REFERENCES `teamtable` (`team_id`);

--
-- Constraints for table `teamtable`
--
ALTER TABLE `teamtable`
  ADD CONSTRAINT `teamtable_fk1` FOREIGN KEY (`rep_body_id`) REFERENCES `representing_body_table` (`rep_body_id`),
  ADD CONSTRAINT `teamtable_fk2` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);

--
-- Constraints for table `team_event_table`
--
ALTER TABLE `team_event_table`
  ADD CONSTRAINT `team_event_table_fk1` FOREIGN KEY (`team_id`) REFERENCES `teamtable` (`team_id`),
  ADD CONSTRAINT `team_event_table_fk2` FOREIGN KEY (`event_id`) REFERENCES `event_table` (`event_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
