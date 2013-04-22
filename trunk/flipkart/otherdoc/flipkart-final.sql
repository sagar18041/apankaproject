-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 22, 2013 at 01:53 PM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `flipkart`
--
CREATE DATABASE `flipkart` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `flipkart`;

-- --------------------------------------------------------

--
-- Table structure for table `bank`
--

CREATE TABLE IF NOT EXISTS `bank` (
  `customerID` int(10) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(30) NOT NULL,
  `accountNumber` varchar(30) NOT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `bank`
--

INSERT INTO `bank` (`customerID`, `customerName`, `accountNumber`, `balance`) VALUES
(1, 'Ananda', '91156897878458', 99897700),
(2, 'Aamir', '91185689567458', 300000),
(3, 'NG', '78965898745896', 230),
(4, 'Suvadra', '91156897878457', 9928170),
(5, 'dipan', '32256989656325', 10000000);

-- --------------------------------------------------------

--
-- Table structure for table `banktransaction`
--

CREATE TABLE IF NOT EXISTS `banktransaction` (
  `transactionID` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` int(10) NOT NULL,
  `orderID` int(10) NOT NULL,
  `transactionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  `paymentType` varchar(30) NOT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `customerID` (`customerID`),
  KEY `orderID` (`orderID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `banktransaction`
--

INSERT INTO `banktransaction` (`transactionID`, `customerID`, `orderID`, `transactionTime`, `amount`, `paymentType`) VALUES
(1, 1, 27, '2013-04-16 09:29:48', 25569, 'creditCard'),
(2, 4, 34, '2013-04-16 12:22:14', 14500, 'netBanking'),
(3, 4, 35, '2013-04-16 12:32:20', 4841, 'netBanking'),
(4, 1, 36, '2013-04-16 13:18:14', 76707, 'creditCard'),
(5, 4, 37, '2013-04-16 13:48:29', 37990, 'netBanking'),
(6, 4, 38, '2013-04-16 13:48:29', 14500, 'netBanking');

-- --------------------------------------------------------

--
-- Table structure for table `creditcard`
--

CREATE TABLE IF NOT EXISTS `creditcard` (
  `cardNumber` varchar(30) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expiryMonth` varchar(3) NOT NULL,
  `expiryYear` int(4) NOT NULL,
  `accountNumber` varchar(30) NOT NULL,
  `creditLimit` float NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `creditcard`
--

INSERT INTO `creditcard` (`cardNumber`, `cvv`, `expiryMonth`, `expiryYear`, `accountNumber`, `creditLimit`, `password`) VALUES
('9119897856895869', 256, '06', 2018, '91156897878458', 100000, '2569');

-- --------------------------------------------------------

--
-- Table structure for table `debitcard`
--

CREATE TABLE IF NOT EXISTS `debitcard` (
  `cardNumber` varchar(30) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expiryMonth` varchar(3) NOT NULL,
  `expiryYear` int(4) NOT NULL,
  `accountNumber` varchar(30) NOT NULL,
  `password` varchar(128) NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `debitcard`
--

INSERT INTO `debitcard` (`cardNumber`, `cvv`, `expiryMonth`, `expiryYear`, `accountNumber`, `password`) VALUES
('9889696356589784', 569, '11', 2017, '78965898745896', '1236');

-- --------------------------------------------------------

--
-- Stand-in structure for view `fielditemview`
--
CREATE TABLE IF NOT EXISTS `fielditemview` (
`itemID` int(11)
,`itemName` varchar(256)
,`category` varchar(30)
,`attrName` varchar(50)
,`subCategory` varchar(30)
,`subsubCategory` varchar(30)
);
-- --------------------------------------------------------

--
-- Table structure for table `flipkart_browsinghistory`
--

CREATE TABLE IF NOT EXISTS `flipkart_browsinghistory` (
  `browsingHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ipAddress` varchar(20) NOT NULL,
  `itemID` int(11) NOT NULL,
  `browseTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`browsingHistoryID`),
  KEY `userID` (`itemID`),
  KEY `prodcutID` (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=740 ;

--
-- Dumping data for table `flipkart_browsinghistory`
--

INSERT INTO `flipkart_browsinghistory` (`browsingHistoryID`, `ipAddress`, `itemID`, `browseTime`) VALUES
(429, '127.0.0.1', 13, '2013-04-13 16:35:32'),
(430, '127.0.0.1', 13, '2013-04-13 16:35:36'),
(432, '127.0.0.1', 3, '2013-04-13 16:36:21'),
(433, '127.0.0.1', 4, '2013-04-13 16:36:50'),
(434, '127.0.0.1', 3, '2013-04-13 16:36:52'),
(435, '127.0.0.1', 3, '2013-04-13 16:42:41'),
(436, '127.0.0.1', 2, '2013-04-13 16:42:47'),
(437, '127.0.0.1', 8, '2013-04-13 16:42:55'),
(438, '127.0.0.1', 2, '2013-04-13 16:44:26'),
(439, '127.0.0.1', 2, '2013-04-13 16:45:02'),
(440, '127.0.0.1', 2, '2013-04-13 16:45:06'),
(441, '127.0.0.1', 4, '2013-04-13 16:45:22'),
(442, '127.0.0.1', 3, '2013-04-13 16:45:25'),
(443, '127.0.0.1', 3, '2013-04-13 17:12:07'),
(444, '127.0.0.1', 3, '2013-04-13 17:35:03'),
(445, '127.0.0.1', 3, '2013-04-13 17:35:50'),
(446, '127.0.0.1', 3, '2013-04-13 17:36:31'),
(447, '127.0.0.1', 3, '2013-04-13 17:37:02'),
(448, '127.0.0.1', 3, '2013-04-13 17:39:51'),
(449, '127.0.0.1', 3, '2013-04-13 17:45:42'),
(450, '127.0.0.1', 3, '2013-04-13 17:51:44'),
(451, '127.0.0.1', 3, '2013-04-13 17:52:10'),
(452, '127.0.0.1', 3, '2013-04-13 17:52:30'),
(453, '127.0.0.1', 3, '2013-04-13 17:52:56'),
(454, '127.0.0.1', 3, '2013-04-13 17:53:33'),
(455, '127.0.0.1', 3, '2013-04-13 17:54:19'),
(456, '127.0.0.1', 3, '2013-04-13 17:54:36'),
(457, '127.0.0.1', 3, '2013-04-13 17:54:51'),
(458, '127.0.0.1', 3, '2013-04-13 17:54:57'),
(459, '127.0.0.1', 3, '2013-04-13 17:55:00'),
(460, '127.0.0.1', 3, '2013-04-13 17:55:11'),
(461, '127.0.0.1', 3, '2013-04-13 17:55:26'),
(462, '127.0.0.1', 3, '2013-04-13 17:55:41'),
(463, '127.0.0.1', 3, '2013-04-13 17:55:51'),
(464, '127.0.0.1', 3, '2013-04-13 17:56:06'),
(465, '127.0.0.1', 3, '2013-04-13 17:56:21'),
(466, '127.0.0.1', 4, '2013-04-13 17:56:33'),
(467, '127.0.0.1', 4, '2013-04-13 17:56:56'),
(468, '127.0.0.1', 4, '2013-04-13 17:57:15'),
(469, '127.0.0.1', 4, '2013-04-13 17:58:01'),
(470, '127.0.0.1', 4, '2013-04-13 17:58:36'),
(471, '127.0.0.1', 4, '2013-04-13 17:59:01'),
(472, '127.0.0.1', 4, '2013-04-13 18:02:26'),
(473, '127.0.0.1', 4, '2013-04-13 18:03:26'),
(474, '127.0.0.1', 4, '2013-04-13 18:03:51'),
(475, '127.0.0.1', 4, '2013-04-13 18:05:07'),
(476, '127.0.0.1', 4, '2013-04-13 18:06:29'),
(477, '127.0.0.1', 4, '2013-04-13 18:06:39'),
(478, '127.0.0.1', 4, '2013-04-13 18:07:19'),
(479, '127.0.0.1', 4, '2013-04-13 18:07:48'),
(480, '127.0.0.1', 4, '2013-04-13 18:08:14'),
(481, '127.0.0.1', 4, '2013-04-13 18:08:37'),
(482, '127.0.0.1', 4, '2013-04-13 18:08:59'),
(483, '127.0.0.1', 4, '2013-04-13 18:09:19'),
(484, '127.0.0.1', 4, '2013-04-13 18:10:31'),
(485, '127.0.0.1', 4, '2013-04-13 18:11:11'),
(486, '127.0.0.1', 1, '2013-04-14 13:22:47'),
(487, '127.0.0.1', 1, '2013-04-14 13:23:40'),
(488, '127.0.0.1', 1, '2013-04-14 13:30:42'),
(489, '127.0.0.1', 1, '2013-04-14 13:35:18'),
(490, '127.0.0.1', 2, '2013-04-14 13:45:25'),
(491, '127.0.0.1', 2, '2013-04-14 13:54:03'),
(492, '127.0.0.1', 2, '2013-04-14 14:00:03'),
(493, '127.0.0.1', 2, '2013-04-14 15:32:34'),
(494, '127.0.0.1', 14, '2013-04-14 15:34:03'),
(495, '127.0.0.1', 14, '2013-04-14 15:34:20'),
(496, '127.0.0.1', 15, '2013-04-14 15:41:33'),
(497, '127.0.0.1', 15, '2013-04-14 15:51:40'),
(498, '127.0.0.1', 15, '2013-04-14 15:51:53'),
(499, '127.0.0.1', 14, '2013-04-14 15:51:55'),
(500, '127.0.0.1', 15, '2013-04-14 15:51:58'),
(501, '127.0.0.1', 15, '2013-04-14 15:52:05'),
(502, '127.0.0.1', 15, '2013-04-14 15:52:05'),
(503, '127.0.0.1', 15, '2013-04-14 15:52:05'),
(504, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(505, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(506, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(507, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(508, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(509, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(510, '127.0.0.1', 15, '2013-04-14 15:52:06'),
(511, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(512, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(513, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(514, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(515, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(516, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(517, '127.0.0.1', 15, '2013-04-14 15:52:07'),
(518, '127.0.0.1', 15, '2013-04-14 15:52:08'),
(519, '127.0.0.1', 15, '2013-04-14 15:52:08'),
(520, '127.0.0.1', 15, '2013-04-14 15:52:08'),
(521, '127.0.0.1', 15, '2013-04-14 15:52:08'),
(522, '127.0.0.1', 14, '2013-04-14 15:53:02'),
(523, '127.0.0.1', 16, '2013-04-14 16:04:40'),
(524, '127.0.0.1', 17, '2013-04-14 16:04:52'),
(525, '127.0.0.1', 15, '2013-04-14 16:06:34'),
(526, '127.0.0.1', 15, '2013-04-14 16:08:01'),
(527, '127.0.0.1', 14, '2013-04-14 16:08:14'),
(528, '127.0.0.1', 14, '2013-04-14 16:10:52'),
(529, '127.0.0.1', 15, '2013-04-14 16:14:27'),
(530, '127.0.0.1', 16, '2013-04-14 16:16:49'),
(531, '127.0.0.1', 17, '2013-04-14 16:17:05'),
(532, '127.0.0.1', 14, '2013-04-14 16:17:14'),
(533, '127.0.0.1', 14, '2013-04-15 04:36:07'),
(534, '127.0.0.1', 16, '2013-04-16 02:50:14'),
(535, '127.0.0.1', 16, '2013-04-16 02:50:26'),
(536, '127.0.0.1', 17, '2013-04-16 02:50:56'),
(537, '127.0.0.1', 14, '2013-04-16 02:51:29'),
(538, '127.0.0.1', 14, '2013-04-16 02:51:43'),
(539, '127.0.0.1', 16, '2013-04-16 02:52:01'),
(540, '127.0.0.1', 14, '2013-04-16 04:22:52'),
(541, '127.0.0.1', 17, '2013-04-16 04:22:56'),
(542, '127.0.0.1', 15, '2013-04-16 04:54:26'),
(543, '127.0.0.1', 15, '2013-04-16 04:54:39'),
(544, '127.0.0.1', 17, '2013-04-16 05:12:49'),
(545, '127.0.0.1', 14, '2013-04-16 05:12:59'),
(546, '127.0.0.1', 14, '2013-04-16 05:13:59'),
(547, '127.0.0.1', 15, '2013-04-16 05:14:05'),
(548, '127.0.0.1', 14, '2013-04-16 05:16:16'),
(549, '127.0.0.1', 17, '2013-04-16 05:17:04'),
(550, '127.0.0.1', 14, '2013-04-16 05:17:20'),
(551, '127.0.0.1', 17, '2013-04-16 05:17:28'),
(552, '127.0.0.1', 17, '2013-04-16 05:17:34'),
(553, '127.0.0.1', 15, '2013-04-16 05:32:17'),
(554, '127.0.0.1', 18, '2013-04-16 05:32:20'),
(555, '127.0.0.1', 19, '2013-04-16 08:21:43'),
(556, '127.0.0.1', 19, '2013-04-16 08:21:58'),
(557, '127.0.0.1', 20, '2013-04-16 08:22:00'),
(558, '127.0.0.1', 21, '2013-04-16 08:22:02'),
(559, '127.0.0.1', 22, '2013-04-16 08:22:05'),
(560, '127.0.0.1', 19, '2013-04-16 08:27:58'),
(561, '127.0.0.1', 19, '2013-04-16 09:04:52'),
(562, '127.0.0.1', 22, '2013-04-16 09:05:06'),
(563, '127.0.0.1', 17, '2013-04-16 09:05:12'),
(564, '127.0.0.1', 22, '2013-04-16 09:05:55'),
(565, '127.0.0.1', 22, '2013-04-16 09:12:15'),
(566, '127.0.0.1', 22, '2013-04-16 09:12:19'),
(567, '127.0.0.1', 22, '2013-04-16 09:12:19'),
(568, '127.0.0.1', 22, '2013-04-16 09:12:19'),
(569, '127.0.0.1', 22, '2013-04-16 09:12:19'),
(570, '127.0.0.1', 22, '2013-04-16 09:12:19'),
(571, '127.0.0.1', 22, '2013-04-16 09:12:20'),
(572, '127.0.0.1', 22, '2013-04-16 09:12:20'),
(573, '127.0.0.1', 22, '2013-04-16 09:12:20'),
(574, '127.0.0.1', 22, '2013-04-16 09:12:21'),
(575, '127.0.0.1', 22, '2013-04-16 09:12:21'),
(576, '127.0.0.1', 22, '2013-04-16 09:12:21'),
(577, '127.0.0.1', 22, '2013-04-16 09:12:21'),
(578, '127.0.0.1', 22, '2013-04-16 09:12:21'),
(579, '127.0.0.1', 22, '2013-04-16 09:12:24'),
(580, '127.0.0.1', 22, '2013-04-16 09:12:24'),
(581, '127.0.0.1', 22, '2013-04-16 09:12:24'),
(582, '127.0.0.1', 22, '2013-04-16 09:12:24'),
(583, '127.0.0.1', 22, '2013-04-16 09:12:24'),
(584, '127.0.0.1', 22, '2013-04-16 09:12:25'),
(585, '127.0.0.1', 22, '2013-04-16 09:12:25'),
(586, '127.0.0.1', 22, '2013-04-16 09:12:25'),
(587, '127.0.0.1', 22, '2013-04-16 09:12:25'),
(588, '127.0.0.1', 22, '2013-04-16 09:12:25'),
(589, '127.0.0.1', 22, '2013-04-16 09:12:26'),
(590, '127.0.0.1', 22, '2013-04-16 09:12:26'),
(591, '127.0.0.1', 22, '2013-04-16 09:12:26'),
(592, '127.0.0.1', 22, '2013-04-16 09:12:26'),
(593, '127.0.0.1', 22, '2013-04-16 09:12:26'),
(594, '127.0.0.1', 22, '2013-04-16 09:12:27'),
(595, '127.0.0.1', 22, '2013-04-16 09:12:27'),
(596, '127.0.0.1', 22, '2013-04-16 09:12:27'),
(597, '127.0.0.1', 22, '2013-04-16 09:12:27'),
(598, '127.0.0.1', 22, '2013-04-16 09:12:27'),
(599, '127.0.0.1', 22, '2013-04-16 09:12:28'),
(600, '127.0.0.1', 22, '2013-04-16 09:12:28'),
(601, '127.0.0.1', 26, '2013-04-16 09:25:40'),
(602, '127.0.0.1', 24, '2013-04-16 09:25:56'),
(603, '127.0.0.1', 23, '2013-04-16 09:26:04'),
(604, '127.0.0.1', 24, '2013-04-16 09:26:36'),
(605, '127.0.0.1', 24, '2013-04-16 09:26:50'),
(606, '127.0.0.1', 26, '2013-04-16 09:38:21'),
(607, '127.0.0.1', 22, '2013-04-16 09:38:33'),
(608, '127.0.0.1', 24, '2013-04-16 09:38:46'),
(609, '127.0.0.1', 22, '2013-04-16 09:38:52'),
(610, '127.0.0.1', 21, '2013-04-16 09:41:01'),
(611, '127.0.0.1', 17, '2013-04-16 09:41:17'),
(612, '127.0.0.1', 14, '2013-04-16 09:41:27'),
(613, '127.0.0.1', 24, '2013-04-16 09:43:27'),
(614, '127.0.0.1', 24, '2013-04-16 09:52:31'),
(615, '127.0.0.1', 20, '2013-04-16 09:52:40'),
(616, '127.0.0.1', 20, '2013-04-16 09:53:11'),
(617, '127.0.0.1', 20, '2013-04-16 09:53:49'),
(618, '127.0.0.1', 14, '2013-04-16 09:53:58'),
(619, '127.0.0.1', 14, '2013-04-16 09:54:34'),
(620, '127.0.0.1', 14, '2013-04-16 09:54:41'),
(621, '127.0.0.1', 14, '2013-04-16 09:54:46'),
(622, '127.0.0.1', 14, '2013-04-16 09:54:53'),
(623, '127.0.0.1', 14, '2013-04-16 09:56:12'),
(624, '127.0.0.1', 14, '2013-04-16 09:56:34'),
(625, '127.0.0.1', 19, '2013-04-16 09:56:43'),
(626, '127.0.0.1', 19, '2013-04-16 09:57:12'),
(627, '127.0.0.1', 19, '2013-04-16 09:57:25'),
(628, '127.0.0.1', 19, '2013-04-16 09:57:52'),
(629, '127.0.0.1', 14, '2013-04-16 09:58:21'),
(630, '127.0.0.1', 15, '2013-04-16 10:06:03'),
(631, '127.0.0.1', 19, '2013-04-16 10:06:13'),
(632, '127.0.0.1', 28, '2013-04-16 11:09:41'),
(633, '127.0.0.1', 26, '2013-04-16 11:09:59'),
(634, '127.0.0.1', 26, '2013-04-16 11:10:15'),
(635, '127.0.0.1', 23, '2013-04-16 11:10:49'),
(636, '127.0.0.1', 23, '2013-04-16 11:11:53'),
(637, '127.0.0.1', 28, '2013-04-16 11:12:07'),
(638, '127.0.0.1', 14, '2013-04-16 11:12:26'),
(639, '127.0.0.1', 28, '2013-04-16 11:12:43'),
(640, '127.0.0.1', 32, '2013-04-16 11:13:35'),
(641, '127.0.0.1', 29, '2013-04-16 11:13:57'),
(642, '127.0.0.1', 23, '2013-04-16 11:14:31'),
(643, '127.0.0.1', 24, '2013-04-16 11:14:37'),
(644, '127.0.0.1', 22, '2013-04-16 12:05:45'),
(645, '127.0.0.1', 14, '2013-04-16 12:05:58'),
(646, '127.0.0.1', 21, '2013-04-16 12:07:58'),
(647, '127.0.0.1', 21, '2013-04-16 12:08:08'),
(648, '127.0.0.1', 21, '2013-04-16 12:08:08'),
(649, '127.0.0.1', 21, '2013-04-16 12:08:08'),
(650, '127.0.0.1', 21, '2013-04-16 12:08:08'),
(651, '127.0.0.1', 21, '2013-04-16 12:08:09'),
(652, '127.0.0.1', 21, '2013-04-16 12:08:09'),
(653, '127.0.0.1', 21, '2013-04-16 12:08:09'),
(654, '127.0.0.1', 21, '2013-04-16 12:08:09'),
(655, '127.0.0.1', 21, '2013-04-16 12:08:09'),
(656, '127.0.0.1', 21, '2013-04-16 12:08:13'),
(657, '127.0.0.1', 21, '2013-04-16 12:08:13'),
(658, '127.0.0.1', 21, '2013-04-16 12:08:13'),
(659, '127.0.0.1', 21, '2013-04-16 12:08:13'),
(660, '127.0.0.1', 21, '2013-04-16 12:08:13'),
(661, '127.0.0.1', 21, '2013-04-16 12:08:14'),
(662, '127.0.0.1', 21, '2013-04-16 12:08:14'),
(663, '127.0.0.1', 21, '2013-04-16 12:08:14'),
(664, '127.0.0.1', 21, '2013-04-16 12:08:14'),
(665, '127.0.0.1', 21, '2013-04-16 12:08:14'),
(666, '127.0.0.1', 21, '2013-04-16 12:08:15'),
(667, '127.0.0.1', 21, '2013-04-16 12:08:15'),
(668, '127.0.0.1', 21, '2013-04-16 12:08:15'),
(669, '127.0.0.1', 21, '2013-04-16 12:08:15'),
(670, '127.0.0.1', 21, '2013-04-16 12:08:15'),
(671, '127.0.0.1', 21, '2013-04-16 12:08:15'),
(672, '127.0.0.1', 21, '2013-04-16 12:08:16'),
(673, '127.0.0.1', 21, '2013-04-16 12:08:16'),
(674, '127.0.0.1', 21, '2013-04-16 12:08:16'),
(675, '127.0.0.1', 21, '2013-04-16 12:08:16'),
(676, '127.0.0.1', 14, '2013-04-16 12:15:27'),
(677, '127.0.0.1', 22, '2013-04-16 12:21:47'),
(678, '127.0.0.1', 14, '2013-04-16 12:21:55'),
(679, '127.0.0.1', 24, '2013-04-16 12:22:27'),
(680, '127.0.0.1', 22, '2013-04-16 12:32:02'),
(681, '127.0.0.1', 14, '2013-04-16 12:32:45'),
(682, '127.0.0.1', 24, '2013-04-16 12:56:38'),
(683, '127.0.0.1', 24, '2013-04-16 12:58:52'),
(684, '127.0.0.1', 24, '2013-04-16 13:24:06'),
(685, '127.0.0.1', 24, '2013-04-16 13:24:34'),
(686, '127.0.0.1', 24, '2013-04-16 13:24:34'),
(687, '127.0.0.1', 24, '2013-04-16 13:24:34'),
(688, '127.0.0.1', 24, '2013-04-16 13:24:34'),
(689, '127.0.0.1', 24, '2013-04-16 13:24:34'),
(690, '127.0.0.1', 24, '2013-04-16 13:24:34'),
(691, '127.0.0.1', 24, '2013-04-16 13:24:35'),
(692, '127.0.0.1', 24, '2013-04-16 13:24:35'),
(693, '127.0.0.1', 24, '2013-04-16 13:24:35'),
(694, '127.0.0.1', 24, '2013-04-16 13:24:35'),
(695, '127.0.0.1', 24, '2013-04-16 13:24:35'),
(696, '127.0.0.1', 24, '2013-04-16 13:24:35'),
(697, '127.0.0.1', 24, '2013-04-16 13:24:36'),
(698, '127.0.0.1', 24, '2013-04-16 13:24:36'),
(699, '127.0.0.1', 24, '2013-04-16 13:24:36'),
(700, '127.0.0.1', 24, '2013-04-16 13:24:36'),
(701, '127.0.0.1', 24, '2013-04-16 13:24:36'),
(702, '127.0.0.1', 24, '2013-04-16 13:24:37'),
(703, '127.0.0.1', 24, '2013-04-16 13:24:37'),
(704, '127.0.0.1', 24, '2013-04-16 13:24:37'),
(705, '127.0.0.1', 24, '2013-04-16 13:24:37'),
(706, '127.0.0.1', 24, '2013-04-16 13:24:37'),
(707, '127.0.0.1', 24, '2013-04-16 13:24:37'),
(708, '127.0.0.1', 24, '2013-04-16 13:24:38'),
(709, '127.0.0.1', 24, '2013-04-16 13:24:38'),
(710, '127.0.0.1', 24, '2013-04-16 13:24:38'),
(711, '127.0.0.1', 14, '2013-04-16 13:32:21'),
(712, '127.0.0.1', 14, '2013-04-16 13:32:46'),
(713, '127.0.0.1', 22, '2013-04-16 13:33:11'),
(714, '127.0.0.1', 20, '2013-04-16 13:33:25'),
(715, '127.0.0.1', 22, '2013-04-16 13:33:28'),
(716, '127.0.0.1', 19, '2013-04-16 13:33:30'),
(717, '127.0.0.1', 23, '2013-04-16 13:44:08'),
(718, '127.0.0.1', 23, '2013-04-16 13:44:58'),
(719, '127.0.0.1', 23, '2013-04-16 13:45:25'),
(720, '127.0.0.1', 14, '2013-04-16 13:46:03'),
(721, '127.0.0.1', 14, '2013-04-16 15:43:21'),
(722, '127.0.0.1', 14, '2013-04-16 15:44:24'),
(723, '127.0.0.1', 14, '2013-04-16 15:44:37'),
(724, '127.0.0.1', 14, '2013-04-20 03:32:01'),
(725, '127.0.0.1', 14, '2013-04-20 03:33:09'),
(726, '127.0.0.1', 24, '2013-04-20 03:37:23'),
(727, '127.0.0.1', 24, '2013-04-20 03:37:47'),
(728, '127.0.0.1', 24, '2013-04-20 03:37:54'),
(729, '127.0.0.1', 24, '2013-04-20 03:38:36'),
(730, '127.0.0.1', 24, '2013-04-20 03:44:08'),
(731, '127.0.0.1', 14, '2013-04-20 03:44:13'),
(732, '127.0.0.1', 14, '2013-04-20 03:45:03'),
(733, '127.0.0.1', 14, '2013-04-20 03:45:26'),
(734, '127.0.0.1', 14, '2013-04-20 03:45:35'),
(735, '127.0.0.1', 15, '2013-04-20 03:45:39'),
(736, '127.0.0.1', 14, '2013-04-20 03:45:53'),
(737, '127.0.0.1', 14, '2013-04-20 03:46:07'),
(738, '127.0.0.1', 14, '2013-04-20 03:46:28'),
(739, '127.0.0.1', 14, '2013-04-22 11:50:50');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_category`
--

CREATE TABLE IF NOT EXISTS `flipkart_category` (
  `categoryID` int(10) NOT NULL AUTO_INCREMENT,
  `categoryName` varchar(30) NOT NULL,
  `status` int(1) DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`categoryID`),
  UNIQUE KEY `categoryName` (`categoryName`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `flipkart_category`
--

INSERT INTO `flipkart_category` (`categoryID`, `categoryName`, `status`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `level`) VALUES
(24, 'Mobiles & Accessories ', 1, 'Admin', '2013-04-14 14:15:48', 'Admin', '0000-00-00 00:00:00', 0),
(25, 'Computer', 1, 'Admin', '2013-04-14 14:16:51', 'Admin', '0000-00-00 00:00:00', 0),
(26, 'Cameras', 1, 'Admin', '2013-04-14 14:17:16', 'Admin', '0000-00-00 00:00:00', 0),
(27, 'Books', 1, 'Admin', '2013-04-14 14:17:33', 'Admin', '0000-00-00 00:00:00', 0),
(28, 'Gaming', 1, 'Admin', '2013-04-14 14:17:44', 'Admin', '0000-00-00 00:00:00', 0),
(29, 'TV, Video & Audio', 1, 'Admin', '2013-04-14 14:18:45', 'Admin', '0000-00-00 00:00:00', 0),
(30, 'Watches, Bags & Wallets', 1, 'Admin', '2013-04-14 14:19:19', 'Admin', '0000-00-00 00:00:00', 0),
(31, 'Laptop', 1, 'Admin', '2013-04-14 14:32:53', 'Admin', '0000-00-00 00:00:00', 1),
(32, 'Laptop Accessories ', 1, 'Admin', '2013-04-14 14:33:51', 'Admin', '0000-00-00 00:00:00', 1),
(33, 'Mobile', 1, 'Admin', '2013-04-14 14:35:08', 'Admin', '0000-00-00 00:00:00', 1),
(34, 'Mobiles Accessories ', 1, 'Admin', '2013-04-14 14:36:02', 'Admin', '0000-00-00 00:00:00', 1),
(35, 'Fiction', 1, 'Admin', '2013-04-14 14:36:43', 'Admin', '0000-00-00 00:00:00', 1),
(36, 'Educational ', 1, 'Admin', '2013-04-14 14:37:02', 'Admin', '0000-00-00 00:00:00', 1),
(37, 'Camera', 1, 'Admin', '2013-04-14 14:37:29', 'Admin', '0000-00-00 00:00:00', 1),
(38, 'Camera Accessories ', 1, 'Admin', '2013-04-14 14:37:58', 'Admin', '0000-00-00 00:00:00', 1),
(39, 'Television', 1, 'Admin', '2013-04-14 14:38:34', 'Admin', '0000-00-00 00:00:00', 1),
(40, 'Audio ', 1, 'Admin', '2013-04-14 14:39:08', 'Admin', '0000-00-00 00:00:00', 1),
(41, 'Platform', 1, 'Admin', '2013-04-14 14:40:04', 'Admin', '0000-00-00 00:00:00', 1),
(42, 'Games', 1, 'Admin', '2013-04-14 14:40:20', 'Admin', '0000-00-00 00:00:00', 1),
(43, 'Watches', 1, 'Admin', '2013-04-14 14:41:12', 'Admin', '0000-00-00 00:00:00', 1),
(44, 'Bags', 1, 'Admin', '2013-04-14 14:41:36', 'Admin', '0000-00-00 00:00:00', 1),
(45, 'Wallets', 1, 'Admin', '2013-04-14 14:41:53', 'Admin', '0000-00-00 00:00:00', 1),
(46, 'Video', 1, 'Admin', '2013-04-14 14:42:36', 'Admin', '0000-00-00 00:00:00', 1),
(48, 'Memory Cards', 1, 'Admin', '2013-04-14 14:48:36', 'Admin', '0000-00-00 00:00:00', 2),
(49, 'Teens', 1, 'Admin', '2013-04-14 14:49:35', 'Admin', '0000-00-00 00:00:00', 2),
(50, 'External Hard Disk', 1, 'Admin', '2013-04-14 14:50:07', 'Admin', '0000-00-00 00:00:00', 2),
(51, 'Samsung ', 1, 'Admin', '2013-04-14 14:51:18', 'Admin', '0000-00-00 00:00:00', 2),
(52, 'Lenses ', 1, 'Admin', '2013-04-14 14:51:46', 'Admin', '0000-00-00 00:00:00', 2),
(53, 'Home Theaters  ', 1, 'Admin', '2013-04-14 14:52:33', 'Admin', '0000-00-00 00:00:00', 2),
(54, 'Academics ', 1, 'Admin', '2013-04-14 14:52:53', 'Admin', '0000-00-00 00:00:00', 2),
(55, 'Nikon', 1, 'Admin', '2013-04-14 14:53:12', 'Admin', '0000-00-00 00:00:00', 2),
(56, 'Action', 1, 'Admin', '2013-04-14 14:54:06', 'Admin', '0000-00-00 00:00:00', 2),
(57, 'FastTrack', 1, 'Admin', '2013-04-14 14:54:18', 'Admin', '0000-00-00 00:00:00', 2),
(58, 'MP3 Players', 1, 'Admin', '2013-04-14 14:54:42', 'Admin', '0000-00-00 00:00:00', 2),
(59, 'PS3', 1, 'Admin', '2013-04-14 14:54:57', 'Admin', '0000-00-00 00:00:00', 2),
(60, 'Video Players ', 1, 'Admin', '2013-04-14 14:55:19', 'Admin', '0000-00-00 00:00:00', 2),
(61, 'Hand Bag', 1, 'Admin', '2013-04-14 14:56:31', 'Admin', '0000-00-00 00:00:00', 2),
(62, 'Gucci', 1, 'Admin', '2013-04-14 14:56:57', 'Admin', '0000-00-00 00:00:00', 2),
(63, 'Asus', 1, 'Admin', '2013-04-14 14:57:13', 'Admin', '0000-00-00 00:00:00', 2);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_images`
--

CREATE TABLE IF NOT EXISTS `flipkart_images` (
  `imageID` int(10) NOT NULL AUTO_INCREMENT,
  `itemID` int(10) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_item`
--

CREATE TABLE IF NOT EXISTS `flipkart_item` (
  `itemID` int(10) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(120) NOT NULL,
  `availableQuantity` int(11) NOT NULL,
  `productID` int(10) NOT NULL,
  `thresholdflag` int(11) NOT NULL DEFAULT '0',
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `thumbnail` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=34 ;

--
-- Dumping data for table `flipkart_item`
--

INSERT INTO `flipkart_item` (`itemID`, `itemName`, `availableQuantity`, `productID`, `thresholdflag`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `thumbnail`) VALUES
(14, 'Samsung Galaxy S Advance i9070 (Metallic Black)', 98, 9, 0, 'Admin', '2013-04-14 15:28:52', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/2dcf36aa-ca03-4be0-a7c6-fab89251ab70-samsung-galaxy-s-advance-i9070-275x275-imadjz45mes3brqx.jpeg'),
(15, 'SanDisk Memory Card MicroSDHC 8GB', 15, 10, 0, 'Admin', '2013-04-14 15:36:48', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/8ec1aab1-a644-4a03-ab14-aa61d83bd01f-sandisk-microsdhc-8gb-275x275-imadfyvyfhps2qd5.jpeg'),
(16, 'Economic Survey 2012-13', 10, 11, 0, 'Admin', '2013-04-14 15:57:55', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/0f5ded12-7898-4e3b-821c-0435c629b678-economic-survey-2012-13-275x275-imadgpgnqyat5gn3.jpeg'),
(17, 'Come on Inner Peace!: I Don''t Have All Day!', 20, 12, 0, 'Admin', '2013-04-14 16:01:11', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/eb3c7c89-d160-4f42-8798-af842c1cc0d4-come-on-inner-peace-i-don-t-have-all-day-275x275-imadjyq4vhyaf2xx.jpeg'),
(18, 'SanDisk Memory Card MicroSDHC 16GB', 0, 10, 0, 'Admin', '2013-04-16 05:29:58', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/c2a97c2c-1ea4-4d7f-adb4-bc8bfa369305-sandisk-microsdhc-16gb-275x275-imad74mkhqtfz2se.jpeg'),
(19, 'Nikon Coolpix L27 Point & Shoot (Black)', 10, 13, 0, 'Admin', '2013-04-16 08:12:06', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/b9caffab-b54a-4616-aa7d-e0daef482ff8-nikon-coolpix-l27-point-shoot-275x275-imadg4kfqby5bjss.jpeg'),
(20, 'Nikon Coolpix L27 Point & Shoot (White)', 10, 13, 0, 'Admin', '2013-04-16 08:12:30', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/2cf7d5c6-d1cd-4e79-afda-dd108308aedb-nikon-coolpix-l27-point-shoot-275x275-imadgx992zgbjnbp.jpeg'),
(21, 'Nikon Coolpix L27 Point & Shoot (Purple)', 10, 13, 0, 'Admin', '2013-04-16 08:13:04', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/d8149539-8501-416e-902a-b079315fd50e-nikon-coolpix-l27-point-shoot-275x275-imadgx994dzpgdze.jpeg'),
(22, 'Nikon Coolpix L27 Point & Shoot (Red)', 99, 13, 0, 'Admin', '2013-04-16 08:13:31', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/1f65816a-b333-4983-be56-f961fef506a0-nikon-coolpix-l27-point-shoot-275x275-imadgx99k6dydyde.jpeg'),
(23, 'HP Pavilion G6-2313AX Laptop (APU Quad Core A10/ 6GB/ 1TB/ DOS/ 2.5GB Graph) (Imprint Sparkling Black)', 9, 14, 10, 'Admin', '2013-04-16 08:33:37', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/547f9200-3216-4a16-ae03-606f0d9a1e11-hp-pavilion-notebook-g6-2313ax-275x275-imadhdm37amk9fua.jpeg'),
(24, 'Combo of Sony PS3 500 GB', 7, 15, 0, 'Admin', '2013-04-16 08:36:50', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/baa3ef0a-1081-4fae-b48e-61007c5573fd-275x275-imadeujge5ynkax5.jpeg'),
(25, 'Panasonic TH-L24X5D LED 24 inches Full HD Television', 10, 16, 0, 'Admin', '2013-04-16 08:40:28', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/ac0e988f-80ba-46a4-a08e-d940ea9641eb-panasonic-th-l24x5d-275x275-imadbhvtrnm2hhp4.jpeg'),
(26, 'Q&Q Digital Watch - For Men (Black)', 10, 17, 0, 'Admin', '2013-04-16 08:46:29', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/29b4d838-95b9-4224-aebe-408ff5ee3744-m010j001y-q-q-275x275-imadfcjm2fqbhbfz.jpeg'),
(27, 'DigiFlip Wizard CB001 Camera Bag', 0, 18, 0, 'Admin', '2013-04-16 10:03:05', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/a30cc80c-da86-482e-a637-2ca9066e00ca-digiflip-wizard-cb001-275x275-imadbrnxefmbcehu.jpeg'),
(28, '6-7 Tablet & e-book Reader Sleeve', 10, 19, 0, 'Admin', '2013-04-16 10:08:07', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/b89a1723-a467-4abc-86b1-6c98bac08827-case-logic-lapst-107-275x275-imadazy5vpkbsc24.jpeg'),
(29, 'God Of War: Ascension (Games, PS3)', 100, 20, 0, 'Admin', '2013-04-16 10:11:39', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/f466d912-d906-4b1a-b5df-87fd69602995-god-of-war-ascension-275x275-imadbyvwkbthgth8.jpeg'),
(30, 'Philips GoGear SoundDot 2 GB MP3 Player (Pink)', 0, 21, 0, 'Admin', '2013-04-16 10:14:31', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/ebe9c897-09fd-4a9e-b12c-d16923691284-philips-gogear-sounddot-275x275-imadj4zgszxqjcp2.jpeg'),
(31, 'Philips PD7030 Portable DVD Player', 50, 22, 0, 'Admin', '2013-04-16 10:17:45', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/eec8c49c-4071-4879-9de0-3f32dede32f9-philips-pd7030-275x275-imad3wg3vjrz97sr.jpeg'),
(32, 'Guess Lorrine Hand Bag - For Women (Black)', 100, 23, 0, 'Admin', '2013-04-16 10:22:17', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/87ea3c9b-3969-45bd-b45f-1a94259be735-vg286111-guess-hand-bag-lorrine-275x275-imadh2zqfjq3zpwn.jpeg'),
(33, 'Hidekraft Wallet - For Men (Brown)', 100, 24, 0, 'Admin', '2013-04-16 10:26:37', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/221a8e11-7a11-4587-a81d-cf7ac7a6cb72-wlbrpu0086c-hidekraft-wallet-275x275-imadazsxkuzydndz.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_itemattributes`
--

CREATE TABLE IF NOT EXISTS `flipkart_itemattributes` (
  `itemID` int(10) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL,
  `priorityLevel` tinyint(4) NOT NULL DEFAULT '0',
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flipkart_itemattributes`
--

INSERT INTO `flipkart_itemattributes` (`itemID`, `attribute`, `value`, `priorityLevel`) VALUES
(14, 'Operating Freq', 'GSM - 850, 900, 1900; UMTS - 2100', 0),
(14, 'OS', 'Android v2.3 (Gingerbread)', 0),
(14, 'User Interface', 'TouchWiz 4.0', 0),
(14, 'Processor', '1 GHz ARM Cortex-A9, Dual Core', 1),
(14, 'Price', '14500', 2),
(14, 'Warranty Details', '1 year manufacturer warranty for Phone and 6 months warranty for in the box accessories Samsung India Warranty and Free Transit Insurance.', 0),
(15, 'Card Type', 'MicroSDHC', 0),
(15, 'Camera Resolution - 5 megapixel', '5200 Photos', 0),
(15, 'Price', '330', 2),
(15, 'Warranty Details', '5 Years SanDisk India Warranty and Free Transit Insurance', 0),
(14, 'Delivery Time', '4-5', 0),
(15, 'Delivery Time', '2-3', 0),
(16, 'Publisher', 'Oxford University Press', 0),
(16, 'Publication Year', '2013', 0),
(16, 'ISBN-13', '9780198095439', 0),
(16, 'Price', '308', 2),
(16, 'Delivery Time', '2-3', 0),
(17, 'Publisher', 'Grapevine Publishers', 0),
(17, 'Publication Year', '2013', 0),
(17, 'ISBN-13', '9789381841303', 0),
(17, 'Price', '75', 2),
(17, 'Delivery Time', '2-3', 0),
(17, 'Test Attrib', 'test value', 0),
(18, 'Card Type', 'MicroSDHC', 0),
(18, 'Memory size', '16 GB', 0),
(18, 'Delivery Time', '2-3 ', 0),
(18, 'Warranty Details', '5 Years SanDisk India Warranty and Free Transit Insurance.', 1),
(18, 'Price', '650', 2),
(22, 'Optical Sensor Resolution (in MegaPixel)', '16.1 Megapixels', 0),
(22, 'Optical Zoom', '5x', 0),
(22, 'Digital Zoom', '4x', 0),
(22, 'Delivery Time', '2-3', 0),
(22, 'Price', '4841', 2),
(20, 'Optical Sensor Resolution (in MegaPixel)', '16.1 Megapixels', 0),
(20, 'Optical Zoom', '5x', 0),
(20, 'Digital Zoom', '4x', 0),
(20, 'Delivery Time', '2-3', 0),
(20, 'Price', '4841', 2),
(21, 'Optical Sensor Resolution (in MegaPixel)', '16.1 Megapixels', 0),
(21, 'Optical Zoom', '5x', 0),
(21, 'Digital Zoom', '4x', 0),
(21, 'Delivery Time', '2-3', 0),
(21, 'Price', '4841', 2),
(19, 'Optical Sensor Resolution (in MegaPixel)', '16.1 Megapixels', 0),
(19, 'Optical Zoom', '5x', 0),
(19, 'Digital Zoom', '0', 0),
(19, 'Delivery Time', '2-3', 0),
(19, 'Price', '4841', 2),
(23, 'Processor', 'APU Quad Core A10', 0),
(23, 'Clock Speed', '2.3 GHz With Turbo Core Technology Upto 3.2 GHz', 0),
(23, 'System Memory', '6 GB DDR3', 0),
(23, 'Delivery Time', '2-3', 0),
(23, 'Price', '37990', 2),
(24, 'Model', 'PS3 500 GB', 0),
(24, 'Key Features', 'USB 2.0, HDMI Output, Ethernet Connection', 0),
(24, 'Delivery Time', '2-3 ', 0),
(24, 'Price', '25569', 2),
(25, 'TV Type', 'Full HD, LED TV', 0),
(25, 'Screen Size & Resolution	', '42"  ', 0),
(25, 'Delivery Time', '2-3', 0),
(25, 'Price', '15999', 2),
(26, 'Type', 'Digital', 0),
(26, 'Alarm Clock', '5 Alarm Settings', 0),
(26, 'Delivery Time', '2-3', 0),
(26, 'Price', '1211', 2),
(25, 'Panel Type', 'LED LCD Panel', 0),
(27, 'Type', 'DSLR Backpack, Multi Use, Toploading Bag, Backpack', 0),
(27, 'Capacity', 'SLR Camera Mounted with Lens 2 - 3 Additional Lenses, Flash Gun and Other Accessories', 0),
(27, 'Delivery Time', '2-3', 0),
(27, 'Warranty Details', '12 Months', 1),
(27, 'Price', '1299', 2),
(28, 'Color', 'Black', 0),
(28, 'Brand', 'Case Logic', 0),
(28, 'Type', 'Sleeves/Slip Cases', 0),
(28, 'Capacity', '7 inch', 0),
(28, 'Delivery Time', '2-3', 0),
(28, 'Warranty Details', '25 Years Replacement Warranty Case Logic India Warranty and Free Transit Insurance.', 1),
(28, 'Price', ' 895', 2),
(29, 'Platform', 'PS3', 0),
(29, 'Publisher', 'Sony Computer Entertainment', 0),
(29, 'Genre', 'Action-Adventure', 1),
(29, 'Delivery Time', '2-3', 0),
(29, 'Price', '2999', 2),
(30, 'Memory Size', '2 GB', 0),
(30, 'Audio File Format', 'MP3, WAV, WMA', 0),
(30, 'Delivery Time', '2-3', 0),
(30, 'Price', '1599', 2),
(31, 'Display Type', '7 TFT LCD', 0),
(31, 'Display Resolution', '480 x 234', 0),
(31, 'Audio Playback Formats', 'CD, CD-RW, MP3-CD, CD-R', 0),
(31, 'MP3 Bit Rates', '32 - 320 kbps', 0),
(31, 'Delivery Time', '2-3', 0),
(31, 'Warranty Details', '1 Year Philips India Warranty and Free Transit Insurance', 1),
(31, 'Price', '7399', 2),
(32, 'Type', 'Hand Bag', 0),
(32, 'Style Code', 'VG286111', 0),
(32, 'Color Code', 'Black', 0),
(32, 'Delivery Time', '2-3', 0),
(32, 'Price', '5738', 2),
(33, 'Material', 'Nappa Leather', 0),
(33, 'Number of Pockets', '4', 0),
(33, 'Delivery Time', '2-3', 0),
(33, 'Warranty Details', '6 Months Warranty', 1),
(33, 'Price', '559', 2),
(14, 'demo', 'demo', 0);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_offer`
--

CREATE TABLE IF NOT EXISTS `flipkart_offer` (
  `offerID` int(11) NOT NULL AUTO_INCREMENT,
  `itemID` int(11) NOT NULL,
  `offerPercent` int(11) NOT NULL,
  `validDate` datetime NOT NULL,
  PRIMARY KEY (`offerID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flipkart_offer`
--

INSERT INTO `flipkart_offer` (`offerID`, `itemID`, `offerPercent`, `validDate`) VALUES
(1, 14, 10, '2013-04-20 10:26:00'),
(2, 15, 5, '2013-04-15 12:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_order`
--

CREATE TABLE IF NOT EXISTS `flipkart_order` (
  `orderID` int(10) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(20) NOT NULL,
  `itemID` int(10) NOT NULL,
  `quantity` int(10) NOT NULL,
  `totalPrice` double NOT NULL,
  `emailAddress` varchar(128) NOT NULL,
  `addressID` int(10) NOT NULL,
  `status` varchar(30) NOT NULL,
  `shippingCharge` double NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`orderID`),
  KEY `addressID` (`addressID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=39 ;

--
-- Dumping data for table `flipkart_order`
--

INSERT INTO `flipkart_order` (`orderID`, `orderNumber`, `itemID`, `quantity`, `totalPrice`, `emailAddress`, `addressID`, `status`, `shippingCharge`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(18, 'OD91901514', 14, 1, 14500, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-14 16:08:29', NULL, '0000-00-00 00:00:00'),
(19, 'OD90135822', 16, 1, 308, 'avipsa.nayak@gmail.com', 2, 'Processing', 0, NULL, '2013-04-16 02:50:33', NULL, '0000-00-00 00:00:00'),
(20, 'OD90135822', 17, 1, 75, 'avipsa.nayak@gmail.com', 2, 'Processing', 0, NULL, '2013-04-16 02:51:03', NULL, '0000-00-00 00:00:00'),
(21, 'OD90135822', 14, 1, 14500, 'avipsa.nayak@gmail.com', 2, 'Processing', 0, NULL, '2013-04-16 02:51:34', NULL, '0000-00-00 00:00:00'),
(22, 'OD54736195', 15, 1, 330, 'avipsa.nayak@gmail.com', 1, 'Processing', 50, NULL, '2013-04-16 04:54:44', NULL, '0000-00-00 00:00:00'),
(23, 'OD79896326', 14, 1, 14500, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-16 05:13:24', NULL, '0000-00-00 00:00:00'),
(24, 'OD89711913', 14, 1, 14500, 'avipsa.nayak@gmail.com', 2, 'Processing', 0, NULL, '2013-04-16 05:16:21', NULL, '0000-00-00 00:00:00'),
(26, 'OD19235028', 22, 1, 4841, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-16 09:06:06', NULL, '0000-00-00 00:00:00'),
(27, 'OD96831324', 24, 1, 25569, 'avipsa.nayak@gmail.com', 1, 'Delievered', 0, NULL, '2013-04-16 09:26:59', NULL, '0000-00-00 00:00:00'),
(30, 'OD87211037', 29, 1, 2999, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-16 11:14:02', NULL, '0000-00-00 00:00:00'),
(31, 'OD87211037', 24, 1, 25569, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-16 11:14:42', NULL, '0000-00-00 00:00:00'),
(32, 'OD40543651', 14, 1, 14500, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-16 12:06:05', NULL, '0000-00-00 00:00:00'),
(33, 'OD26273813', 14, 1, 14500, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-16 12:15:37', NULL, '0000-00-00 00:00:00'),
(34, 'OD64059002', 14, 1, 14500, 'avipsa.nayak@gmail.com', 1, 'Delievered', 0, NULL, '2013-04-16 12:22:00', NULL, '0000-00-00 00:00:00'),
(35, 'OD56066716', 22, 1, 4841, 'avipsa.nayak@gmail.com', 1, 'Delievered', 0, NULL, '2013-04-16 12:32:07', NULL, '0000-00-00 00:00:00'),
(36, 'OD14333109', 24, 3, 76707, 'avipsa.nayak@gmail.com', 3, 'Delievered', 0, NULL, '2013-04-16 13:09:37', NULL, '0000-00-00 00:00:00'),
(37, 'OD31099039', 23, 1, 37990, 'avipsa.nayak@gmail.com', 3, 'Delievered', 0, NULL, '2013-04-16 13:47:10', NULL, '0000-00-00 00:00:00'),
(38, 'OD31099039', 14, 1, 14500, 'avipsa.nayak@gmail.com', 1, 'Delievered', 0, NULL, '2013-04-16 13:47:10', NULL, '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_password_change_requests`
--

CREATE TABLE IF NOT EXISTS `flipkart_password_change_requests` (
  `requestID` varchar(128) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `flipkart_password_change_requests`
--

INSERT INTO `flipkart_password_change_requests` (`requestID`, `emailAddress`) VALUES
('2f427d20-5a60-431b-9e38-a9628c457fe1', 'rahul.vit09@gmail.com'),
('470adc7a-2914-48ba-a434-b1318cdd4e2d', 'aamirshaad.alam@gmail.com'),
('b710af2e-8b0f-42dc-831b-c8ff57696ea0', 'avipsa.nayak@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_path`
--

CREATE TABLE IF NOT EXISTS `flipkart_path` (
  `categoryID` int(10) NOT NULL AUTO_INCREMENT,
  `parentID` int(10) NOT NULL,
  `level` smallint(6) NOT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `flipkart_path_ibfk_2` (`parentID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=64 ;

--
-- Dumping data for table `flipkart_path`
--

INSERT INTO `flipkart_path` (`categoryID`, `parentID`, `level`) VALUES
(24, 24, 0),
(25, 25, 0),
(26, 26, 0),
(27, 27, 0),
(28, 28, 0),
(29, 29, 0),
(30, 30, 0),
(31, 25, 1),
(32, 25, 1),
(33, 24, 1),
(34, 24, 1),
(35, 27, 1),
(36, 27, 1),
(37, 26, 1),
(38, 26, 1),
(39, 29, 1),
(40, 29, 1),
(41, 28, 1),
(42, 28, 1),
(43, 30, 1),
(44, 30, 1),
(45, 30, 1),
(46, 29, 1),
(48, 34, 2),
(49, 35, 2),
(50, 32, 2),
(51, 33, 2),
(52, 38, 2),
(53, 39, 2),
(54, 36, 2),
(55, 37, 2),
(56, 42, 2),
(57, 43, 2),
(58, 40, 2),
(59, 41, 2),
(60, 46, 2),
(61, 44, 2),
(62, 45, 2),
(63, 31, 2);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_product`
--

CREATE TABLE IF NOT EXISTS `flipkart_product` (
  `productID` int(10) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `categoryID` int(10) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`productID`),
  KEY `categoryID` (`categoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Dumping data for table `flipkart_product`
--

INSERT INTO `flipkart_product` (`productID`, `productName`, `categoryID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(9, 'Samsung Galaxy S Advance i9070', 51, 'Admin', '2013-04-14 15:28:14', 'Admin', '0000-00-00 00:00:00'),
(10, 'SanDisk Memory Card MicroSDHC 8GB', 48, 'Admin', '2013-04-14 15:36:30', 'Admin', '0000-00-00 00:00:00'),
(11, 'Economic Survey 2012-13 ', 36, 'Admin', '2013-04-14 15:56:56', 'Admin', '0000-00-00 00:00:00'),
(12, 'Come on Inner Peace!: I Don''t Have All Day!', 35, 'Admin', '2013-04-14 16:00:40', 'Admin', '0000-00-00 00:00:00'),
(13, 'Nikon Coolpix L27 Point & Shoot', 37, 'Admin', '2013-04-16 08:11:18', 'Admin', '0000-00-00 00:00:00'),
(14, 'HP Pavilion G6-2313AX Laptop (APU Quad Core A10/ 6GB/ 1TB/ DOS/ 2.5GB Graph)', 31, 'Admin', '2013-04-16 08:33:18', 'Admin', '0000-00-00 00:00:00'),
(15, 'Combo of Sony PS3 500 GB', 41, 'Admin', '2013-04-16 08:35:52', 'Admin', '0000-00-00 00:00:00'),
(16, 'Panasonic TH-L24X5D LED 24 inches Full HD Television', 39, 'Admin', '2013-04-16 08:39:07', 'Admin', '0000-00-00 00:00:00'),
(17, 'Q&Q Digital Watch - For Men', 43, 'Admin', '2013-04-16 08:45:22', 'Admin', '0000-00-00 00:00:00'),
(18, 'DigiFlip Wizard CB001 Camera Bag', 38, 'Admin', '2013-04-16 10:02:34', 'Admin', '0000-00-00 00:00:00'),
(19, '6-7 Tablet & e-book Reader Sleeve', 32, 'Admin', '2013-04-16 10:07:28', 'Admin', '0000-00-00 00:00:00'),
(20, 'God Of War: Ascension', 42, 'Admin', '2013-04-16 10:11:04', 'Admin', '0000-00-00 00:00:00'),
(21, 'Philips GoGear SoundDot 2 GB MP3 Player', 40, 'Admin', '2013-04-16 10:13:51', 'Admin', '0000-00-00 00:00:00'),
(22, 'Philips PD7030 Portable DVD Player', 46, 'Admin', '2013-04-16 10:17:21', 'Admin', '0000-00-00 00:00:00'),
(23, 'Guess Lorrine Hand Bag - For Women', 44, 'Admin', '2013-04-16 10:22:00', 'Admin', '0000-00-00 00:00:00'),
(24, 'Hidekraft Wallet - For Men', 45, 'Admin', '2013-04-16 10:26:10', 'Admin', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_productrating`
--

CREATE TABLE IF NOT EXISTS `flipkart_productrating` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `ratingStar` tinyint(4) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`ratingID`),
  KEY `UserID` (`UserID`,`ProductID`),
  KEY `ProductID` (`ProductID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `flipkart_productrating`
--

INSERT INTO `flipkart_productrating` (`ratingID`, `ratingStar`, `UserID`, `ProductID`) VALUES
(1, 3, 1, 12),
(2, 4, 1, 15),
(3, 4, 1, 13),
(4, 5, 1, 9),
(5, 5, 1, 15);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_productreview`
--

CREATE TABLE IF NOT EXISTS `flipkart_productreview` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `reviewTitle` varchar(512) NOT NULL,
  `reviewText` longtext NOT NULL,
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewID`),
  KEY `productID` (`productID`,`userID`),
  KEY `userID` (`userID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Dumping data for table `flipkart_productreview`
--

INSERT INTO `flipkart_productreview` (`reviewID`, `reviewTitle`, `reviewText`, `productID`, `userID`, `reviewDate`) VALUES
(1, 'good book must read', 'good read', 12, 1, '2013-04-16 05:17:46'),
(2, 'good', 'nice', 15, 1, '2013-04-16 09:36:43'),
(3, 'Oh My God', 'This is so awesome.', 13, 1, '2013-04-16 09:39:31'),
(4, 'This phone sucks!!', 'Don''t buy this crap', 9, 1, '2013-04-16 09:42:01'),
(5, 'Good PS3, buymore', 'good', 15, 1, '2013-04-16 13:24:01');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_seller`
--

CREATE TABLE IF NOT EXISTS `flipkart_seller` (
  `sellerID` int(10) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(30) NOT NULL,
  `sellerEmailID` varchar(128) NOT NULL,
  PRIMARY KEY (`sellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_sellertransaction`
--

CREATE TABLE IF NOT EXISTS `flipkart_sellertransaction` (
  `transactionID` int(10) NOT NULL AUTO_INCREMENT,
  `sellerID` int(10) NOT NULL,
  `itemID` int(10) NOT NULL,
  `quantity` int(10) NOT NULL DEFAULT '0',
  `totalPrice` float DEFAULT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`transactionID`),
  KEY `itemID` (`itemID`),
  KEY `sellerID` (`sellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_shippingaddress`
--

CREATE TABLE IF NOT EXISTS `flipkart_shippingaddress` (
  `addressID` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `streetAddress` varchar(216) NOT NULL,
  `landmark` varchar(100) NOT NULL,
  `city` varchar(50) NOT NULL,
  `stateID` int(10) NOT NULL,
  `pincode` int(10) NOT NULL,
  `phoneNumber` varchar(20) NOT NULL,
  `userID` int(10) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`addressID`),
  KEY `flipkart_shippingaddress_ibfk_1` (`userID`),
  KEY `flipkart_shippingaddress_ibfk_2` (`stateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `flipkart_shippingaddress`
--

INSERT INTO `flipkart_shippingaddress` (`addressID`, `name`, `streetAddress`, `landmark`, `city`, `stateID`, `pincode`, `phoneNumber`, `userID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'Avipsa Nayak', 'Plot No-433/B, Nuasahi, Nayapalli', '', 'Bhubaneswar', 9, 751012, '9980964252', 1, NULL, '2013-03-22 13:40:31', NULL, NULL),
(2, 'Avipsa Nayak', 'WH-411, International Institute of Information Technology(IIIT-Bangalore), 26/C, Electronics City, Hosur Road', 'Opposite Infosys Gate 1', 'Bangalore', 11, 560100, '9980964252', 1, NULL, '2013-03-22 13:41:40', NULL, NULL),
(3, 'dinesha', '23, jayanagar', 'coffee day shop', 'bangalore', 11, 560001, '1234567890', 1, NULL, '2013-04-16 13:09:37', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_state`
--

CREATE TABLE IF NOT EXISTS `flipkart_state` (
  `stateID` int(10) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stateID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Dumping data for table `flipkart_state`
--

INSERT INTO `flipkart_state` (`stateID`, `stateName`) VALUES
(1, 'Andaman and Nicobar'),
(2, 'Andhra Pradesh'),
(3, 'Arunachal Pradesh'),
(4, 'Assam'),
(5, 'Bihar'),
(6, 'Chandigarh'),
(7, 'Chattisgarh'),
(8, 'Delhi'),
(9, 'Odisha'),
(10, 'Daman and Diu'),
(11, 'Karnataka');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_userinfo`
--

CREATE TABLE IF NOT EXISTS `flipkart_userinfo` (
  `userID` int(10) NOT NULL AUTO_INCREMENT,
  `firstName` varchar(30) DEFAULT NULL,
  `lastName` varchar(30) DEFAULT NULL,
  `contactNumber` varchar(10) DEFAULT NULL,
  `gender` varchar(10) DEFAULT NULL,
  `password` varchar(128) NOT NULL,
  `emailAddress` varchar(128) NOT NULL,
  `role` int(10) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `createdBy` varchar(50) DEFAULT NULL,
  `createdOn` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(50) DEFAULT NULL,
  `modifiedOn` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`userID`),
  UNIQUE KEY `emailAddress_UNIQUE` (`emailAddress`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `flipkart_userinfo`
--

INSERT INTO `flipkart_userinfo` (`userID`, `firstName`, `lastName`, `contactNumber`, `gender`, `password`, `emailAddress`, `role`, `status`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'Avipsa', 'Nayak', '9980964252', '2', '5f4dcc3b5aa765d61d8327deb882cf99', 'avipsa.nayak@gmail.com', 0, 1, NULL, '2013-03-21 08:14:22', NULL, '2013-03-21 08:14:33'),
(2, 'Aamir', 'Alam', '8904470724', '1', '5f4dcc3b5aa765d61d8327deb882cf99', 'aamirshaad.alam@gmail.com', 0, 1, NULL, '2013-03-29 12:24:57', NULL, NULL),
(3, 'Aamir', 'Alam', '9902549784', 'Male', '5f4dcc3b5aa765d61d8327deb882cf99', 'aamir.alam@gmail.com', 0, 1, NULL, '2013-03-29 12:34:41', NULL, NULL),
(4, NULL, NULL, NULL, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', 'rahul.vit09@gmail.com', 0, 1, NULL, '2013-04-16 12:40:23', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_wishlist`
--

CREATE TABLE IF NOT EXISTS `flipkart_wishlist` (
  `wishlistID` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `itemID` int(10) NOT NULL,
  PRIMARY KEY (`wishlistID`),
  KEY `userID` (`userID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `flipkart_wishlist`
--

INSERT INTO `flipkart_wishlist` (`wishlistID`, `userID`, `itemID`) VALUES
(2, 1, 14),
(3, 1, 24);

-- --------------------------------------------------------

--
-- Table structure for table `netbanking`
--

CREATE TABLE IF NOT EXISTS `netbanking` (
  `accountNumber` varchar(30) NOT NULL DEFAULT '0',
  `password` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `netbanking`
--

INSERT INTO `netbanking` (`accountNumber`, `password`) VALUES
('91156897878457', '5f4dcc3b5aa765d61d8327deb882cf99');

-- --------------------------------------------------------

--
-- Structure for view `fielditemview`
--
DROP TABLE IF EXISTS `fielditemview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fielditemview` AS select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `category`,'Name' AS `attrName`,`fsc`.`categoryName` AS `subCategory`,`fssc`.`categoryName` AS `subsubCategory` from ((((((`flipkart_item` `fi` join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fssc` on((`fssc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`parentID`))) join `flipkart_path` `fpc` on((`fpc`.`categoryID` = `fsc`.`categoryID`))) join `flipkart_category` `fc` on((`fpc`.`parentID` = `fc`.`categoryID`))) where (`fpa`.`level` = 2) union select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `category`,'Name' AS `attrName`,`fsc`.`categoryName` AS `subCategory`,'' AS `subsubCategory` from ((((`flipkart_item` `fi` join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`))) where (`fpa`.`level` = 1) union select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `category`,'Name' AS `attrName`,'' AS `subCategory`,'' AS `subsubCategory` from (((`flipkart_item` `fi` join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`categoryID`))) where (`fpa`.`level` = 0) union select `fa`.`itemID` AS `itemID`,`fa`.`value` AS `itemName`,`fc`.`categoryName` AS `category`,`fa`.`attribute` AS `attrName`,`fsc`.`categoryName` AS `subCategory`,`fssc`.`categoryName` AS `subsubCategory` from (((((((`flipkart_itemattributes` `fa` join `flipkart_item` `fi` on((`fi`.`itemID` = `fa`.`itemID`))) join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fssc` on((`fssc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`parentID`))) join `flipkart_path` `fpc` on((`fpc`.`categoryID` = `fsc`.`categoryID`))) join `flipkart_category` `fc` on((`fpc`.`parentID` = `fc`.`categoryID`))) where (`fpa`.`level` = 2) union select `fa`.`itemID` AS `itemID`,`fa`.`value` AS `itemName`,`fc`.`categoryName` AS `category`,`fa`.`attribute` AS `attrName`,`fsc`.`categoryName` AS `subCategory`,'' AS `subsubCategory` from (((((`flipkart_itemattributes` `fa` join `flipkart_item` `fi` on((`fi`.`itemID` = `fa`.`itemID`))) join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`))) where (`fpa`.`level` = 1) union select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `category`,'Name' AS `attrName`,'' AS `subCategory`,'' AS `subsubCategory` from ((((`flipkart_itemattributes` `fa` join `flipkart_item` `fi` on((`fi`.`itemID` = `fa`.`itemID`))) join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`categoryID`))) where (`fpa`.`level` = 0);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banktransaction`
--
ALTER TABLE `banktransaction`
  ADD CONSTRAINT `banktransaction_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `bank` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `banktransaction_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `flipkart_order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `debitcard`
--
ALTER TABLE `debitcard`
  ADD CONSTRAINT `debitcard_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_images`
--
ALTER TABLE `flipkart_images`
  ADD CONSTRAINT `flipkart_images_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_item`
--
ALTER TABLE `flipkart_item`
  ADD CONSTRAINT `flipkart_item_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `flipkart_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_itemattributes`
--
ALTER TABLE `flipkart_itemattributes`
  ADD CONSTRAINT `flipkart_itemattributes_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_offer`
--
ALTER TABLE `flipkart_offer`
  ADD CONSTRAINT `flipkart_offer_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_order`
--
ALTER TABLE `flipkart_order`
  ADD CONSTRAINT `flipkart_order_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `flipkart_shippingaddress` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_order_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_path`
--
ALTER TABLE `flipkart_path`
  ADD CONSTRAINT `flipkart_path_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `flipkart_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_path_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `flipkart_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_product`
--
ALTER TABLE `flipkart_product`
  ADD CONSTRAINT `flipkart_product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `flipkart_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_productrating`
--
ALTER TABLE `flipkart_productrating`
  ADD CONSTRAINT `flipkart_productrating_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_productrating_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `flipkart_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_productreview`
--
ALTER TABLE `flipkart_productreview`
  ADD CONSTRAINT `flipkart_productreview_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `flipkart_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_productreview_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_sellertransaction`
--
ALTER TABLE `flipkart_sellertransaction`
  ADD CONSTRAINT `flipkart_sellertransaction_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_sellertransaction_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `flipkart_seller` (`sellerID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_shippingaddress`
--
ALTER TABLE `flipkart_shippingaddress`
  ADD CONSTRAINT `flipkart_shippingaddress_ibfk_3` FOREIGN KEY (`stateID`) REFERENCES `flipkart_state` (`stateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_shippingaddress_ibfk_4` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_wishlist`
--
ALTER TABLE `flipkart_wishlist`
  ADD CONSTRAINT `flipkart_wishlist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `flipkart_wishlist_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `netbanking`
--
ALTER TABLE `netbanking`
  ADD CONSTRAINT `netbanking_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
