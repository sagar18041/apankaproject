-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               5.1.67-community - MySQL Community Server (GPL)
-- Server OS:                    Win32
-- HeidiSQL version:             7.0.0.4156
-- Date/time:                    2013-04-10 20:51:19
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;

-- Dumping database structure for flipkart
CREATE DATABASE IF NOT EXISTS `flipkart` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `flipkart`;


-- Dumping structure for table flipkart.bank
CREATE TABLE IF NOT EXISTS `bank` (
  `customerID` int(10) NOT NULL AUTO_INCREMENT,
  `customerName` varchar(30) NOT NULL,
  `accountNumber` int(16) NOT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.bank: ~0 rows (approximately)
/*!40000 ALTER TABLE `bank` DISABLE KEYS */;
/*!40000 ALTER TABLE `bank` ENABLE KEYS */;


-- Dumping structure for table flipkart.banktransaction
CREATE TABLE IF NOT EXISTS `banktransaction` (
  `transactionID` int(10) NOT NULL AUTO_INCREMENT,
  `customerID` int(10) NOT NULL,
  `orderID` int(10) NOT NULL,
  `transactionTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `amount` float DEFAULT NULL,
  `paymentType` varchar(30) NOT NULL,
  PRIMARY KEY (`transactionID`),
  KEY `customerID` (`customerID`),
  KEY `orderID` (`orderID`),
  CONSTRAINT `banktransaction_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `bank` (`customerID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `banktransaction_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `flipkart_order` (`orderID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.banktransaction: ~0 rows (approximately)
/*!40000 ALTER TABLE `banktransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `banktransaction` ENABLE KEYS */;


-- Dumping structure for table flipkart.creditcard
CREATE TABLE IF NOT EXISTS `creditcard` (
  `cardNumber` int(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expiryMonth` varchar(3) NOT NULL,
  `expiryYear` int(4) NOT NULL,
  `accountNumber` int(16) NOT NULL,
  `creditLimit` float NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `accountNumber` (`accountNumber`),
  CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.creditcard: ~0 rows (approximately)
/*!40000 ALTER TABLE `creditcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `creditcard` ENABLE KEYS */;


-- Dumping structure for table flipkart.debitcard
CREATE TABLE IF NOT EXISTS `debitcard` (
  `cardNumber` int(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expiryMonth` varchar(3) NOT NULL,
  `expiryYear` int(4) NOT NULL,
  `accountNumber` int(16) NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `accountNumber` (`accountNumber`),
  CONSTRAINT `debitcard_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.debitcard: ~0 rows (approximately)
/*!40000 ALTER TABLE `debitcard` DISABLE KEYS */;
/*!40000 ALTER TABLE `debitcard` ENABLE KEYS */;


-- Dumping structure for view flipkart.fielditemview
-- Creating temporary table to overcome VIEW dependency errors
CREATE TABLE `fielditemview` (
	`itemID` INT(11) NOT NULL,
	`itemName` VARCHAR(256) NOT NULL COLLATE 'latin1_swedish_ci',
	`category` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci',
	`attrName` VARCHAR(50) NOT NULL COLLATE 'latin1_swedish_ci',
	`subCategory` VARCHAR(30) NOT NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;


-- Dumping structure for table flipkart.flipkart_browsinghistory
CREATE TABLE IF NOT EXISTS `flipkart_browsinghistory` (
  `browsingHistoryID` int(11) NOT NULL AUTO_INCREMENT,
  `ipAddress` varchar(20) NOT NULL,
  `itemID` int(11) NOT NULL,
  `browseTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`browsingHistoryID`),
  KEY `userID` (`itemID`),
  KEY `prodcutID` (`itemID`)
) ENGINE=InnoDB AUTO_INCREMENT=329 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_browsinghistory: ~76 rows (approximately)
/*!40000 ALTER TABLE `flipkart_browsinghistory` DISABLE KEYS */;
INSERT INTO `flipkart_browsinghistory` (`browsingHistoryID`, `ipAddress`, `itemID`, `browseTime`) VALUES
	(252, '127.0.0.1', 3, '2013-04-10 11:01:06'),
	(253, '127.0.0.1', 2, '2013-04-10 11:01:27'),
	(254, '127.0.0.1', 2, '2013-04-10 11:01:32'),
	(255, '127.0.0.1', 3, '2013-04-10 11:01:35'),
	(256, '127.0.0.1', 4, '2013-04-10 11:01:41'),
	(257, '127.0.0.1', 4, '2013-04-10 11:02:05'),
	(258, '127.0.0.1', 4, '2013-04-10 11:02:08'),
	(259, '127.0.0.1', 4, '2013-04-10 11:02:16'),
	(260, '127.0.0.1', 1, '2013-04-10 11:02:29'),
	(261, '127.0.0.1', 1, '2013-04-10 11:02:38'),
	(262, '127.0.0.1', 1, '2013-04-10 11:02:41'),
	(263, '127.0.0.1', 1, '2013-04-10 11:02:43'),
	(264, '127.0.0.1', 3, '2013-04-10 11:02:53'),
	(265, '127.0.0.1', 3, '2013-04-10 11:02:55'),
	(266, '127.0.0.1', 3, '2013-04-10 11:02:56'),
	(267, '127.0.0.1', 3, '2013-04-10 11:02:58'),
	(268, '127.0.0.1', 3, '2013-04-10 11:02:59'),
	(269, '127.0.0.1', 3, '2013-04-10 11:03:00'),
	(270, '127.0.0.1', 3, '2013-04-10 11:03:00'),
	(271, '127.0.0.1', 3, '2013-04-10 11:03:01'),
	(272, '127.0.0.1', 1, '2013-04-10 11:03:08'),
	(273, '127.0.0.1', 2, '2013-04-10 11:03:37'),
	(274, '127.0.0.1', 3, '2013-04-10 11:03:42'),
	(275, '127.0.0.1', 4, '2013-04-10 11:08:01'),
	(276, '127.0.0.1', 2, '2013-04-10 11:08:31'),
	(277, '127.0.0.1', 3, '2013-04-10 11:08:33'),
	(278, '127.0.0.1', 4, '2013-04-10 11:08:38'),
	(279, '127.0.0.1', 1, '2013-04-10 11:13:50'),
	(280, '127.0.0.1', 1, '2013-04-10 11:18:37'),
	(281, '127.0.0.1', 3, '2013-04-10 11:31:32'),
	(282, '127.0.0.1', 1, '2013-04-10 11:34:01'),
	(283, '127.0.0.1', 2, '2013-04-10 11:34:15'),
	(284, '127.0.0.1', 2, '2013-04-10 11:34:41'),
	(285, '127.0.0.1', 2, '2013-04-10 11:35:20'),
	(286, '127.0.0.1', 2, '2013-04-10 11:38:09'),
	(287, '127.0.0.1', 4, '2013-04-10 11:40:12'),
	(288, '127.0.0.1', 2, '2013-04-10 11:40:59'),
	(289, '127.0.0.1', 2, '2013-04-10 12:45:10'),
	(290, '127.0.0.1', 2, '2013-04-10 12:48:59'),
	(291, '127.0.0.1', 2, '2013-04-10 12:49:40'),
	(292, '127.0.0.1', 2, '2013-04-10 12:54:05'),
	(293, '127.0.0.1', 2, '2013-04-10 12:54:16'),
	(294, '127.0.0.1', 2, '2013-04-10 13:02:00'),
	(295, '127.0.0.1', 2, '2013-04-10 13:03:26'),
	(296, '127.0.0.1', 1, '2013-04-10 13:10:08'),
	(297, '127.0.0.1', 1, '2013-04-10 13:10:33'),
	(298, '127.0.0.1', 1, '2013-04-10 13:10:42'),
	(299, '127.0.0.1', 2, '2013-04-10 13:12:17'),
	(300, '127.0.0.1', 2, '2013-04-10 13:17:14'),
	(301, '127.0.0.1', 2, '2013-04-10 13:17:34'),
	(302, '127.0.0.1', 2, '2013-04-10 13:18:09'),
	(303, '127.0.0.1', 2, '2013-04-10 13:19:41'),
	(304, '127.0.0.1', 2, '2013-04-10 13:19:57'),
	(305, '127.0.0.1', 3, '2013-04-10 13:23:32'),
	(306, '127.0.0.1', 3, '2013-04-10 13:37:49'),
	(307, '127.0.0.1', 1, '2013-04-10 13:38:18'),
	(308, '127.0.0.1', 1, '2013-04-10 13:38:39'),
	(309, '127.0.0.1', 4, '2013-04-10 13:38:46'),
	(310, '127.0.0.1', 4, '2013-04-10 13:39:43'),
	(311, '127.0.0.1', 4, '2013-04-10 13:40:01'),
	(312, '127.0.0.1', 2, '2013-04-10 13:40:07'),
	(313, '127.0.0.1', 1, '2013-04-10 13:40:10'),
	(314, '127.0.0.1', 1, '2013-04-10 13:42:27'),
	(315, '127.0.0.1', 4, '2013-04-10 13:42:31'),
	(316, '127.0.0.1', 2, '2013-04-10 13:42:46'),
	(317, '127.0.0.1', 4, '2013-04-10 13:42:52'),
	(318, '127.0.0.1', 4, '2013-04-10 13:44:08'),
	(319, '127.0.0.1', 4, '2013-04-10 13:45:52'),
	(320, '127.0.0.1', 2, '2013-04-10 13:46:13'),
	(321, '127.0.0.1', 4, '2013-04-10 13:46:16'),
	(322, '127.0.0.1', 2, '2013-04-10 13:46:48'),
	(323, '127.0.0.1', 4, '2013-04-10 13:46:55'),
	(324, '127.0.0.1', 2, '2013-04-10 15:08:15'),
	(325, '127.0.0.1', 2, '2013-04-10 15:10:26'),
	(326, '127.0.0.1', 2, '2013-04-10 15:11:11'),
	(327, '127.0.0.1', 2, '2013-04-10 15:12:27'),
	(328, '127.0.0.1', 3, '2013-04-10 15:20:10');
/*!40000 ALTER TABLE `flipkart_browsinghistory` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_category
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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_category: ~22 rows (approximately)
/*!40000 ALTER TABLE `flipkart_category` DISABLE KEYS */;
INSERT INTO `flipkart_category` (`categoryID`, `categoryName`, `status`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `level`) VALUES
	(1, 'Clothing', 1, 'system', '2013-03-25 16:16:59', 'system', '0000-00-00 00:00:00', 0),
	(2, 'Footwear', 1, 'system', '2013-03-25 16:17:20', 'system', '0000-00-00 00:00:00', 0),
	(3, 'Mobile And Accessories', 1, 'system', '2013-03-25 16:18:05', 'system', '0000-00-00 00:00:00', 0),
	(4, 'Computers', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(5, 'Watches, Bags & Wallets', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(6, 'Cameras', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(7, 'Books', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(8, 'Home & Kitchen', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(9, 'Daily Personal Needs', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(10, 'Gaming', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(11, 'TV, Video & Audio', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(12, 'Music, Movies & Posters', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(13, 'Baby Care & Toys', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(14, 'Sports & Fitness', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 0),
	(15, 'Camera', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 1),
	(16, 'Camera Accessories', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 1),
	(17, 'Text Books', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 1),
	(18, 'eBooks', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 1),
	(19, 'Pen and Stationery', 1, 'system', '2013-03-24 20:36:06', 'system', '2013-03-24 20:36:06', 1),
	(20, 'Memory Cards', 1, 'system', '2013-03-31 13:00:07', 'system', '0000-00-00 00:00:00', 2),
	(21, 'Headphones', 1, 'system', '2013-03-31 13:00:07', 'system', '0000-00-00 00:00:00', 2),
	(22, 'Electronics', 1, 'Admin', '2013-03-31 14:04:20', 'Admin', '0000-00-00 00:00:00', 0);
/*!40000 ALTER TABLE `flipkart_category` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_images
CREATE TABLE IF NOT EXISTS `flipkart_images` (
  `imageID` int(10) NOT NULL AUTO_INCREMENT,
  `itemID` int(10) NOT NULL,
  `path` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imageID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `flipkart_images_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_images: ~0 rows (approximately)
/*!40000 ALTER TABLE `flipkart_images` DISABLE KEYS */;
/*!40000 ALTER TABLE `flipkart_images` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_item
CREATE TABLE IF NOT EXISTS `flipkart_item` (
  `itemID` int(10) NOT NULL AUTO_INCREMENT,
  `itemName` varchar(120) NOT NULL,
  `availableQuantity` int(11) NOT NULL,
  `productID` int(10) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `thumbnail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `productID` (`productID`),
  CONSTRAINT `flipkart_item_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `flipkart_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_item: ~4 rows (approximately)
/*!40000 ALTER TABLE `flipkart_item` DISABLE KEYS */;
INSERT INTO `flipkart_item` (`itemID`, `itemName`, `availableQuantity`, `productID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `thumbnail`) VALUES
	(1, 'Nikon Coolpix L27 Point & Shoot (Black)', 10, 1, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', 'ViewResources/img/nik-blk.jpeg'),
	(2, 'Nikon Coolpix L27 Point & Shoot (Red)', 1, 1, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', 'ViewResources/img/nik-red.jpeg'),
	(3, 'Inferno : The New Robert Langdon Thriller (Hardcover)', 5, 3, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', 'ViewResources/img/inferno-hrd.jpeg'),
	(4, 'Inferno : The New Robert Langdon Thriller (Paperback)', 0, 3, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', 'ViewResources/img/inferno-paperbck.jpeg');
/*!40000 ALTER TABLE `flipkart_item` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_itemattributes
CREATE TABLE IF NOT EXISTS `flipkart_itemattributes` (
  `itemID` int(10) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(256) NOT NULL,
  `priorityLevel` tinyint(4) NOT NULL DEFAULT '0',
  KEY `itemID` (`itemID`),
  CONSTRAINT `flipkart_itemattributes_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_itemattributes: ~19 rows (approximately)
/*!40000 ALTER TABLE `flipkart_itemattributes` DISABLE KEYS */;
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
	(4, 'Price', '846', 2);
/*!40000 ALTER TABLE `flipkart_itemattributes` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_order
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
  KEY `itemID` (`itemID`),
  CONSTRAINT `flipkart_order_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `flipkart_shippingaddress` (`addressID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_order_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_order: ~5 rows (approximately)
/*!40000 ALTER TABLE `flipkart_order` DISABLE KEYS */;
INSERT INTO `flipkart_order` (`orderID`, `orderNumber`, `itemID`, `quantity`, `totalPrice`, `emailAddress`, `addressID`, `status`, `shippingCharge`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
	(1, 'OD93800345', 3, 0, 0, 'avipsa.nayak@gmail.com', 1, 'Payment not received', 0, NULL, '2013-03-31 13:11:05', NULL, '0000-00-00 00:00:00'),
	(2, 'OD49251053', 3, 0, 0, 'avipsa.nayak@gmail.com', 2, 'Payment not received', 0, NULL, '2013-03-31 13:11:14', NULL, '0000-00-00 00:00:00'),
	(3, 'OD69442004', 3, 0, 0, 'avipsa.nayak@gmail.com', 1, 'Payment not received', 0, NULL, '2013-03-31 14:02:20', NULL, '0000-00-00 00:00:00'),
	(4, 'OD40332368', 2, 1, 1000, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 11:35:40', NULL, '0000-00-00 00:00:00'),
	(6, 'OD61030488', 1, 1, 400, 'avipsa.nayak@gmail.com', 2, 'Processing', 50, NULL, '2013-04-10 13:12:46', NULL, '0000-00-00 00:00:00'),
	(7, 'OD47450180', 2, 3, 3000, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 15:19:09', NULL, '0000-00-00 00:00:00'),
	(8, 'OD47450180', 3, 1, 580, 'avipsa.nayak@gmail.com', 1, 'Processing', 0, NULL, '2013-04-10 15:20:16', NULL, '0000-00-00 00:00:00');
/*!40000 ALTER TABLE `flipkart_order` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_password_change_requests
CREATE TABLE IF NOT EXISTS `flipkart_password_change_requests` (
  `requestID` varchar(128) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  PRIMARY KEY (`requestID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_password_change_requests: ~3 rows (approximately)
/*!40000 ALTER TABLE `flipkart_password_change_requests` DISABLE KEYS */;
INSERT INTO `flipkart_password_change_requests` (`requestID`, `emailAddress`) VALUES
	('2f427d20-5a60-431b-9e38-a9628c457fe1', 'rahul.vit09@gmail.com'),
	('470adc7a-2914-48ba-a434-b1318cdd4e2d', 'aamirshaad.alam@gmail.com'),
	('b710af2e-8b0f-42dc-831b-c8ff57696ea0', 'avipsa.nayak@gmail.com');
/*!40000 ALTER TABLE `flipkart_password_change_requests` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_path
CREATE TABLE IF NOT EXISTS `flipkart_path` (
  `categoryID` int(10) NOT NULL AUTO_INCREMENT,
  `parentID` int(10) NOT NULL,
  `level` smallint(6) NOT NULL,
  PRIMARY KEY (`categoryID`),
  KEY `flipkart_path_ibfk_2` (`parentID`),
  CONSTRAINT `flipkart_path_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `flipkart_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_path_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `flipkart_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_path: ~21 rows (approximately)
/*!40000 ALTER TABLE `flipkart_path` DISABLE KEYS */;
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
	(21, 16, 2);
/*!40000 ALTER TABLE `flipkart_path` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_product
CREATE TABLE IF NOT EXISTS `flipkart_product` (
  `productID` int(10) NOT NULL AUTO_INCREMENT,
  `productName` varchar(100) NOT NULL,
  `categoryID` int(10) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`productID`),
  KEY `categoryID` (`categoryID`),
  CONSTRAINT `flipkart_product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `flipkart_category` (`categoryID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_product: ~4 rows (approximately)
/*!40000 ALTER TABLE `flipkart_product` DISABLE KEYS */;
INSERT INTO `flipkart_product` (`productID`, `productName`, `categoryID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
	(1, 'Nikon Coolpix L27 Point & Shoot', 15, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00'),
	(2, 'Sony Cybershot DSC-W610 Point & Shoot ', 15, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00'),
	(3, 'Inferno : The New Robert Langdon Thriller', 17, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00'),
	(4, 'Fifty Sheds of Grey: A Parody ', 17, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00');
/*!40000 ALTER TABLE `flipkart_product` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_productrating
CREATE TABLE IF NOT EXISTS `flipkart_productrating` (
  `ratingID` int(11) NOT NULL AUTO_INCREMENT,
  `ratingStar` tinyint(4) NOT NULL,
  `UserID` int(11) NOT NULL,
  `ProductID` int(11) NOT NULL,
  PRIMARY KEY (`ratingID`),
  KEY `UserID` (`UserID`,`ProductID`),
  KEY `ProductID` (`ProductID`),
  CONSTRAINT `flipkart_productrating_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_productrating_ibfk_2` FOREIGN KEY (`ProductID`) REFERENCES `flipkart_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_productrating: ~9 rows (approximately)
/*!40000 ALTER TABLE `flipkart_productrating` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `flipkart_productrating` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_productreview
CREATE TABLE IF NOT EXISTS `flipkart_productreview` (
  `reviewID` int(11) NOT NULL AUTO_INCREMENT,
  `reviewTitle` varchar(512) NOT NULL,
  `reviewText` longtext NOT NULL,
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `reviewDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`reviewID`),
  KEY `productID` (`productID`,`userID`),
  KEY `userID` (`userID`),
  CONSTRAINT `flipkart_productreview_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `flipkart_product` (`productID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_productreview_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_productreview: ~5 rows (approximately)
/*!40000 ALTER TABLE `flipkart_productreview` DISABLE KEYS */;
INSERT INTO `flipkart_productreview` (`reviewID`, `reviewTitle`, `reviewText`, `productID`, `userID`, `reviewDate`) VALUES
	(1, 'Good budget camera..', 'Do not expect much, you will be happy... Its better than mobile camera or the best in class if you have budget of 4.0k - 4.5k around...Its good that it comes with all required accessories, so just open the pack and capture the moments.. ', 1, 1, '2013-04-05 06:52:25'),
	(2, 'good book', 'Nice Read', 2, 2, '2013-04-05 06:52:25'),
	(3, 'A good entry level digital camera', 'Flipkart maintained standards and delivered L27 within 3 days. L27 is my first digital camera. Habituated of the simplicity of a phone camera (I own samsung galaxy note) and the touch screen, the first day with this new toy was frustrating. But after going through the camera manual, I am now convinced with my purchase. Specification wise it is same as L26 though with a smaller screen, but is almost 400 Rs. cheaper. Initial photos were a bit shaky, but as the day passed I was able to take some decent pics. Pouch is nice but without a strap. Over all I am quite satisfied, and will recommend to those who want a decent camera at cheap price. nice one to learn basics of photography', 1, 3, '2013-04-10 04:16:34'),
	(4, 'good book must read', 'I must say this book is awesome.', 2, 1, '2013-04-10 11:05:53'),
	(5, 'The astonishing new thriller', 'Dan BrownÂ?s new novel, Inferno, features renowned Harvard symbologist Robert Langdon and is set in the heart of Europe, where Langdon is drawn into a harrowing world centred around one of historyÂ?s most enduring and mysterious literary masterpieces.\r\n', 3, 1, '2013-04-10 11:09:32');
/*!40000 ALTER TABLE `flipkart_productreview` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_seller
CREATE TABLE IF NOT EXISTS `flipkart_seller` (
  `sellerID` int(10) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(30) NOT NULL,
  PRIMARY KEY (`sellerID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_seller: ~0 rows (approximately)
/*!40000 ALTER TABLE `flipkart_seller` DISABLE KEYS */;
/*!40000 ALTER TABLE `flipkart_seller` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_sellertransaction
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
  KEY `sellerID` (`sellerID`),
  CONSTRAINT `flipkart_sellertransaction_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_sellertransaction_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `flipkart_seller` (`sellerID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_sellertransaction: ~0 rows (approximately)
/*!40000 ALTER TABLE `flipkart_sellertransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `flipkart_sellertransaction` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_shippingaddress
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
  KEY `flipkart_shippingaddress_ibfk_2` (`stateID`),
  CONSTRAINT `flipkart_shippingaddress_ibfk_3` FOREIGN KEY (`stateID`) REFERENCES `flipkart_state` (`stateID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_shippingaddress_ibfk_4` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_shippingaddress: ~2 rows (approximately)
/*!40000 ALTER TABLE `flipkart_shippingaddress` DISABLE KEYS */;
INSERT INTO `flipkart_shippingaddress` (`addressID`, `name`, `streetAddress`, `landmark`, `city`, `stateID`, `pincode`, `phoneNumber`, `userID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
	(1, 'Avipsa Nayak', 'Plot No-433/B, Nuasahi, Nayapalli', '', 'Bhubaneswar', 9, 751012, '9980964252', 1, NULL, '2013-03-22 19:10:31', NULL, NULL),
	(2, 'Avipsa Nayak', 'WH-411, International Institute of Information Technology(IIIT-Bangalore), 26/C, Electronics City, Hosur Road', 'Opposite Infosys Gate 1', 'Bangalore', 11, 560100, '9980964252', 1, NULL, '2013-03-22 19:11:40', NULL, NULL);
/*!40000 ALTER TABLE `flipkart_shippingaddress` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_state
CREATE TABLE IF NOT EXISTS `flipkart_state` (
  `stateID` int(10) NOT NULL AUTO_INCREMENT,
  `stateName` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stateID`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_state: ~11 rows (approximately)
/*!40000 ALTER TABLE `flipkart_state` DISABLE KEYS */;
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
/*!40000 ALTER TABLE `flipkart_state` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_userinfo
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_userinfo: ~4 rows (approximately)
/*!40000 ALTER TABLE `flipkart_userinfo` DISABLE KEYS */;
INSERT INTO `flipkart_userinfo` (`userID`, `firstName`, `lastName`, `contactNumber`, `gender`, `password`, `emailAddress`, `role`, `status`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
	(1, 'Avipsa', 'Nayak', '9980964252', '2', '5f4dcc3b5aa765d61d8327deb882cf99', 'avipsa.nayak@gmail.com', 0, 1, NULL, '2013-03-21 13:44:22', NULL, '2013-03-21 13:44:33'),
	(2, 'Aamir', 'Alam', '8904470724', '1', '5f4dcc3b5aa765d61d8327deb882cf99', 'aamirshaad.alam@gmail.com', 0, 1, NULL, '2013-03-29 17:54:57', NULL, NULL),
	(3, 'Aamir', 'Alam', '9902549784', 'Male', '5f4dcc3b5aa765d61d8327deb882cf99', 'aamir.alam@gmail.com', 0, 1, NULL, '2013-03-29 18:04:41', NULL, NULL),
	(4, NULL, NULL, NULL, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', 'anand@gmail.com', 0, 1, NULL, '2013-03-29 19:30:38', NULL, NULL);
/*!40000 ALTER TABLE `flipkart_userinfo` ENABLE KEYS */;


-- Dumping structure for table flipkart.flipkart_wishlist
CREATE TABLE IF NOT EXISTS `flipkart_wishlist` (
  `wishlistID` int(10) NOT NULL AUTO_INCREMENT,
  `userID` int(10) NOT NULL,
  `itemID` int(10) NOT NULL,
  PRIMARY KEY (`wishlistID`),
  KEY `userID` (`userID`),
  KEY `itemID` (`itemID`),
  CONSTRAINT `flipkart_wishlist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `flipkart_wishlist_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.flipkart_wishlist: ~1 rows (approximately)
/*!40000 ALTER TABLE `flipkart_wishlist` DISABLE KEYS */;
INSERT INTO `flipkart_wishlist` (`wishlistID`, `userID`, `itemID`) VALUES
	(5, 1, 2);
/*!40000 ALTER TABLE `flipkart_wishlist` ENABLE KEYS */;


-- Dumping structure for table flipkart.netbanking
CREATE TABLE IF NOT EXISTS `netbanking` (
  `accountNumber` int(16) NOT NULL DEFAULT '0',
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`),
  CONSTRAINT `netbanking_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- Dumping data for table flipkart.netbanking: ~0 rows (approximately)
/*!40000 ALTER TABLE `netbanking` DISABLE KEYS */;
/*!40000 ALTER TABLE `netbanking` ENABLE KEYS */;


-- Dumping structure for view flipkart.fielditemview
-- Removing temporary table and create final VIEW structure
DROP TABLE IF EXISTS `fielditemview`;
CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` VIEW `fielditemview` AS select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `category`,'Name' AS `attrName`,`fsc`.`categoryName` AS `subCategory` from ((((`flipkart_item` `fi` join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`))) union select `fa`.`itemID` AS `itemID`,`fa`.`value` AS `itemName`,`fc`.`categoryName` AS `category`,`fa`.`attribute` AS `attrName`,`fsc`.`categoryName` AS `subCategory` from (((((`flipkart_itemattributes` `fa` join `flipkart_item` `fi` on((`fi`.`itemID` = `fa`.`itemID`))) join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fsc` on((`fsc`.`categoryID` = `fpa`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`))) ;
/*!40014 SET FOREIGN_KEY_CHECKS=1 */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
