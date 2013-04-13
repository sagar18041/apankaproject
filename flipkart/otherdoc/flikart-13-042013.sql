-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 13, 2013 at 06:55 PM
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
(1, 'Ananda', '91156897878458', 100000000),
(2, 'Aamir', '91185689567458', 300000),
(3, 'NG', '78965898745896', 230),
(4, 'Suvadra', '91156897878457', 10000000),
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=443 ;

--
-- Dumping data for table `flipkart_browsinghistory`
--

INSERT INTO `flipkart_browsinghistory` (`browsingHistoryID`, `ipAddress`, `itemID`, `browseTime`) VALUES
(429, '127.0.0.1', 13, '2013-04-13 16:35:32'),
(430, '127.0.0.1', 13, '2013-04-13 16:35:36'),
(431, '127.0.0.1', 4, '2013-04-13 16:36:08'),
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
(442, '127.0.0.1', 3, '2013-04-13 16:45:25');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `flipkart_category`
--

INSERT INTO `flipkart_category` (`categoryID`, `categoryName`, `status`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `level`) VALUES
(1, 'Clothing', 1, 'system', '2013-03-25 10:46:59', 'system', '0000-00-00 00:00:00', 0),
(2, 'Footwear', 1, 'system', '2013-03-25 10:47:20', 'system', '0000-00-00 00:00:00', 0),
(3, 'Mobile And Accessories', 1, 'system', '2013-03-25 10:48:05', 'system', '0000-00-00 00:00:00', 0),
(4, 'Computers', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(5, 'Watches, Bags & Wallets', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(6, 'Cameras', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(7, 'Books', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(8, 'Home & Kitchen', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(9, 'Daily Personal Needs', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(10, 'Gaming', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(11, 'TV, Video & Audio', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(12, 'Music, Movies & Posters', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(13, 'Baby Care & Toys', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(14, 'Sports & Fitness', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 0),
(15, 'Camera', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 1),
(16, 'Camera Accessories', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 1),
(17, 'Text Books', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 1),
(18, 'eBooks', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 1),
(19, 'Pen and Stationery', 1, 'system', '2013-03-24 15:06:06', 'system', '2013-03-24 15:06:06', 1),
(20, 'Memory Cards', 1, 'system', '2013-03-31 07:30:07', 'system', '0000-00-00 00:00:00', 2),
(21, 'Headphones', 1, 'system', '2013-03-31 07:30:07', 'system', '0000-00-00 00:00:00', 2),
(22, 'Electronics', 1, 'Admin', '2013-03-31 08:34:20', 'Admin', '0000-00-00 00:00:00', 0),
(23, 'democategory', 1, 'Admin', '2013-04-13 16:29:29', 'Admin', '0000-00-00 00:00:00', 1);

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
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `thumbnail` varchar(512) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=14 ;

--
-- Dumping data for table `flipkart_item`
--

INSERT INTO `flipkart_item` (`itemID`, `itemName`, `availableQuantity`, `productID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `thumbnail`) VALUES
(1, 'Nikon Coolpix L27 Point & Shoot (Black)', 10, 1, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00', 'ViewResources/img/nik-blk.jpeg'),
(2, 'Nikon Coolpix L27 Point & Shoot (Red)', 1, 1, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00', 'ViewResources/img/nik-red.jpeg'),
(3, 'Inferno : The New Robert Langdon Thriller (Hardcover)', 5, 3, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00', 'ViewResources/img/inferno-hrd.jpeg'),
(4, 'Inferno : The New Robert Langdon Thriller (Paperback)', 0, 3, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00', 'ViewResources/img/inferno-paperbck.jpeg'),
(5, 'Canon PowerShot A2300 Point & Shoot (Black)', 4, 5, 'system', '2013-04-11 12:13:30', 'system', '0000-00-00 00:00:00', 'ViewResources/img/cam-3.jpeg'),
(8, 'Canon PowerShot A2300 Point & Shoot (Silver)', 2, 5, 'system', '2013-04-11 12:17:23', 'system', '0000-00-00 00:00:00', 'ViewResources/img/cam-4.jpeg'),
(9, 'Canon PowerShot A2300 Point & Shoot (Red)', 0, 5, 'system', '2013-04-11 12:17:23', 'system', '0000-00-00 00:00:00', 'ViewResources/img/cam-5.jpeg'),
(10, 'Canon PowerShot A2300 Point & Shoot (Blue)', 2, 5, 'system', '2013-04-11 12:30:10', 'system', '0000-00-00 00:00:00', 'ViewResources/img/cam-6.jpeg'),
(11, 'Canon PowerShot SX150 IS Point & Shoot (Silver)', 4, 6, 'system', '2013-04-11 12:31:33', 'system', '0000-00-00 00:00:00', 'ViewResources/img/cam-7.jpeg'),
(12, 'Canon PowerShot SX150 IS Point & Shoot (Black)', 4, 6, 'system', '2013-04-11 12:33:02', 'system', '0000-00-00 00:00:00', 'ViewResources/img/cam-8.jpeg'),
(13, 'demoitem1', 0, 8, 'Admin', '2013-04-13 16:25:23', 'Admin', '0000-00-00 00:00:00', 'uploads/itemthumbnails/2343a12f-3434-4ab1-ab23-fc35f21c4c9b-nokia.jpeg');

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
(1, 'Color', 'Black', 0),
(1, 'Type', 'Point & Shoot', 0),
(1, 'Brand', 'Nikon', 0),
(1, 'Optical Sensor Resolution', '16.1 Megapixels', 1),
(1, 'Sensor Type', 'CCD', 0),
(2, 'Color', 'Red', 0),
(2, 'Type', 'Point And Shoot', 0),
(2, 'Brand', 'Nikon', 0),
(2, 'Sensor Type', 'CCD', 0),
(2, 'Optical Sensor Resolution ', '16.1 Megapixels', 1),
(1, 'Price', '400', 2),
(2, 'Price', '1000', 2),
(2, 'Delivery Time', '2-3', 0),
(1, 'Delivery Time', '6-7', 0),
(3, 'Delivery Time', '15-20', 0),
(2, 'Warranty Details', '1 year manufacturer warranty for Phone and 6 months warranty for in the box accessories Samsung India Warranty and Free Transit Insurance.', 0),
(1, 'Warranty Details', '1 Year Accidental Damage Protection (ADP) HP India Warranty and Free Transit Insurance.', 0),
(3, 'Price', '580', 2),
(4, 'Price', '846', 2),
(13, 'demoattrib1', 'demoval1', 2),
(13, 'demoattrib2', 'demoval2', 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Dumping data for table `flipkart_order`
--

INSERT INTO `flipkart_order` (`orderID`, `orderNumber`, `itemID`, `quantity`, `totalPrice`, `emailAddress`, `addressID`, `status`, `shippingCharge`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'OD93800345', 3, 0, 0, 'avipsa.nayak@gmail.com', 1, 'Payment not received', 0, NULL, '2013-03-31 07:41:05', NULL, '0000-00-00 00:00:00'),
(2, 'OD49251053', 3, 0, 0, 'avipsa.nayak@gmail.com', 2, 'Payment not received', 0, NULL, '2013-03-31 07:41:14', NULL, '0000-00-00 00:00:00'),
(3, 'OD69442004', 3, 0, 0, 'avipsa.nayak@gmail.com', 1, 'Payment not received', 0, NULL, '2013-03-31 08:32:20', NULL, '0000-00-00 00:00:00'),
(4, 'OD40332368', 2, 1, 1000, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 06:05:40', NULL, '0000-00-00 00:00:00'),
(6, 'OD61030488', 1, 1, 400, 'avipsa.nayak@gmail.com', 2, 'Processing', 50, NULL, '2013-04-10 07:42:46', NULL, '0000-00-00 00:00:00'),
(7, 'OD47450180', 2, 3, 3000, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 09:49:09', NULL, '0000-00-00 00:00:00'),
(8, 'OD47450180', 3, 1, 580, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 09:50:16', NULL, '0000-00-00 00:00:00'),
(9, 'OD28162490', 2, 1, 1000, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 16:39:04', NULL, '0000-00-00 00:00:00'),
(10, 'OD65385062', 1, 1, 400, 'avipsa.nayak@gmail.com', 1, 'Processing', 50, NULL, '2013-04-12 10:17:38', NULL, '0000-00-00 00:00:00'),
(11, 'OD49456508', 2, 1, 1000, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-13 16:45:33', NULL, '0000-00-00 00:00:00'),
(12, 'OD49456508', 3, 1, 580, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-13 16:45:33', NULL, '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=24 ;

--
-- Dumping data for table `flipkart_path`
--

INSERT INTO `flipkart_path` (`categoryID`, `parentID`, `level`) VALUES
(1, 1, 0),
(2, 2, 0),
(3, 3, 0),
(4, 4, 0),
(5, 5, 0),
(6, 6, 0),
(7, 7, 0),
(8, 8, 0),
(9, 9, 0),
(10, 10, 0),
(11, 11, 0),
(12, 12, 0),
(13, 13, 0),
(14, 14, 0),
(15, 6, 1),
(16, 6, 1),
(17, 7, 1),
(18, 7, 1),
(19, 7, 1),
(20, 16, 2),
(21, 16, 2),
(23, 17, 0);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Dumping data for table `flipkart_product`
--

INSERT INTO `flipkart_product` (`productID`, `productName`, `categoryID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'Nikon Coolpix L27 Point & Shoot', 15, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00'),
(2, 'Sony Cybershot DSC-W610 Point & Shoot ', 15, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00'),
(3, 'Inferno : The New Robert Langdon Thriller', 17, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00'),
(4, 'Fifty Sheds of Grey: A Parody ', 17, 'system', '2013-03-24 13:00:00', 'system', '2013-03-24 13:00:00'),
(5, 'Canon PowerShot A2300 Point & Shoot ', 15, 'system', '2013-04-11 12:11:52', 'system', '0000-00-00 00:00:00'),
(6, 'Canon PowerShot SX150 IS Point & Shoot', 15, 'system', '2013-04-11 12:30:55', 'system', '0000-00-00 00:00:00'),
(7, 'sample', 4, 'Admin', '2013-04-13 15:33:43', 'Admin', '0000-00-00 00:00:00'),
(8, 'demoproduct', 1, 'Admin', '2013-04-13 16:25:16', 'Admin', '0000-00-00 00:00:00');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Dumping data for table `flipkart_productrating`
--

INSERT INTO `flipkart_productrating` (`ratingID`, `ratingStar`, `UserID`, `ProductID`) VALUES
(1, 3, 1, 1),
(2, 5, 2, 1),
(3, 2, 3, 1),
(4, 1, 4, 1),
(5, 4, 2, 2),
(6, 3, 3, 3),
(7, 3, 1, 2),
(8, 3, 1, 2),
(9, 4, 1, 3);

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
(1, 'Good budget camera..', 'Do not expect much, you will be happy... Its better than mobile camera or the best in class if you have budget of 4.0k - 4.5k around...Its good that it comes with all required accessories, so just open the pack and capture the moments.. ', 1, 1, '2013-04-05 01:22:25'),
(2, 'good book', 'Nice Read', 2, 2, '2013-04-05 01:22:25'),
(3, 'A good entry level digital camera', 'Flipkart maintained standards and delivered L27 within 3 days. L27 is my first digital camera. Habituated of the simplicity of a phone camera (I own samsung galaxy note) and the touch screen, the first day with this new toy was frustrating. But after going through the camera manual, I am now convinced with my purchase. Specification wise it is same as L26 though with a smaller screen, but is almost 400 Rs. cheaper. Initial photos were a bit shaky, but as the day passed I was able to take some decent pics. Pouch is nice but without a strap. Over all I am quite satisfied, and will recommend to those who want a decent camera at cheap price. nice one to learn basics of photography', 1, 3, '2013-04-09 22:46:34'),
(4, 'good book must read', 'I must say this book is awesome.', 2, 1, '2013-04-10 05:35:53'),
(5, 'The astonishing new thriller', 'Dan BrownÂ?s new novel, Inferno, features renowned Harvard symbologist Robert Langdon and is set in the heart of Europe, where Langdon is drawn into a harrowing world centred around one of historyÂ?s most enduring and mysterious literary masterpieces.\r\n', 3, 1, '2013-04-10 05:39:32');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `flipkart_shippingaddress`
--

INSERT INTO `flipkart_shippingaddress` (`addressID`, `name`, `streetAddress`, `landmark`, `city`, `stateID`, `pincode`, `phoneNumber`, `userID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'Avipsa Nayak', 'Plot No-433/B, Nuasahi, Nayapalli', '', 'Bhubaneswar', 9, 751012, '9980964252', 1, NULL, '2013-03-22 13:40:31', NULL, NULL),
(2, 'Avipsa Nayak', 'WH-411, International Institute of Information Technology(IIIT-Bangalore), 26/C, Electronics City, Hosur Road', 'Opposite Infosys Gate 1', 'Bangalore', 11, 560100, '9980964252', 1, NULL, '2013-03-22 13:41:40', NULL, NULL);

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
(4, NULL, NULL, NULL, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', 'anand@gmail.com', 0, 1, NULL, '2013-03-29 14:00:38', NULL, NULL);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Dumping data for table `flipkart_wishlist`
--

INSERT INTO `flipkart_wishlist` (`wishlistID`, `userID`, `itemID`) VALUES
(1, 1, 1);

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
('91156897878457', 'password');

-- --------------------------------------------------------

--
-- Structure for view `fielditemview`
--
DROP TABLE IF EXISTS `fielditemview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fielditemview` AS select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `category`,'Name' AS `attrName`,`fsc`.`categoryName` AS `subCategory` from ((((`flipkart_item` `fi` join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`))) union select `fa`.`itemID` AS `itemID`,`fa`.`value` AS `itemName`,`fc`.`categoryName` AS `category`,`fa`.`attribute` AS `attrName`,`fsc`.`categoryName` AS `subCategory` from (((((`flipkart_itemattributes` `fa` join `flipkart_item` `fi` on((`fi`.`itemID` = `fa`.`itemID`))) join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`)));

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
