-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Apr 03, 2013 at 07:53 PM
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
  `accountNumber` int(16) NOT NULL,
  `balance` float DEFAULT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
  `cardNumber` int(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expiryMonth` varchar(3) NOT NULL,
  `expiryYear` int(4) NOT NULL,
  `accountNumber` int(16) NOT NULL,
  `creditLimit` float NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `debitcard`
--

CREATE TABLE IF NOT EXISTS `debitcard` (
  `cardNumber` int(16) NOT NULL,
  `cvv` int(3) NOT NULL,
  `expiryMonth` varchar(3) NOT NULL,
  `expiryYear` int(4) NOT NULL,
  `accountNumber` int(16) NOT NULL,
  PRIMARY KEY (`cardNumber`),
  KEY `accountNumber` (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Stand-in structure for view `fielditemview`
--
CREATE TABLE IF NOT EXISTS `fielditemview` (
`itemID` int(11)
,`itemName` varchar(120)
,`categoryName` varchar(30)
);
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
  PRIMARY KEY (`categoryID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=23 ;

--
-- Dumping data for table `flipkart_category`
--

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
  `productID` int(10) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `thumbnail` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`itemID`),
  KEY `productID` (`productID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `flipkart_item`
--

INSERT INTO `flipkart_item` (`itemID`, `itemName`, `productID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`, `thumbnail`) VALUES
(1, 'Nikon Coolpix L27 Point & Shoot (Black)', 1, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', NULL),
(2, 'Nikon Coolpix L27 Point & Shoot (Red)', 1, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', NULL),
(3, 'Inferno : The New Robert Langdon Thriller (Hardcover)', 3, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', NULL),
(4, 'Inferno : The New Robert Langdon Thriller (Paperback)', 3, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_itemattributes`
--

CREATE TABLE IF NOT EXISTS `flipkart_itemattributes` (
  `itemID` int(10) NOT NULL,
  `attribute` varchar(50) NOT NULL,
  `value` varchar(50) NOT NULL,
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
(1, 'price', '400', 2),
(2, 'price', '1000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_order`
--

CREATE TABLE IF NOT EXISTS `flipkart_order` (
  `orderID` int(10) NOT NULL AUTO_INCREMENT,
  `orderNumber` varchar(20) NOT NULL,
  `itemID` int(10) NOT NULL,
  `emailAddress` varchar(50) NOT NULL,
  `addressID` int(10) NOT NULL,
  `status` varchar(30) NOT NULL,
  `createdBy` varchar(45) DEFAULT NULL,
  `createdOn` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `modifiedBy` varchar(45) DEFAULT NULL,
  `modifiedOn` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`orderID`),
  KEY `addressID` (`addressID`),
  KEY `itemID` (`itemID`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Dumping data for table `flipkart_order`
--

INSERT INTO `flipkart_order` (`orderID`, `orderNumber`, `itemID`, `emailAddress`, `addressID`, `status`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'OD93800345', 3, 'avipsa.nayak@gmail.com', 1, 'Payment not received', NULL, '2013-03-31 13:11:05', NULL, '0000-00-00 00:00:00'),
(2, 'OD49251053', 3, 'avipsa.nayak@gmail.com', 2, 'Payment not received', NULL, '2013-03-31 13:11:14', NULL, '0000-00-00 00:00:00'),
(3, 'OD69442004', 3, 'avipsa.nayak@gmail.com', 1, 'Payment not received', NULL, '2013-03-31 14:02:20', NULL, '0000-00-00 00:00:00');

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
('6abf41dd-6988-4a78-a979-ca39f0ed4f16', 'avipsa.nayak@gmail.com');

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

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
(21, 16, 2);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Dumping data for table `flipkart_product`
--

INSERT INTO `flipkart_product` (`productID`, `productName`, `categoryID`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'Nikon Coolpix L27 Point & Shoot', 15, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00'),
(2, 'Sony Cybershot DSC-W610 Point & Shoot ', 15, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00'),
(3, 'Inferno : The New Robert Langdon Thriller', 17, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00'),
(4, 'Fifty Sheds of Grey: A Parody ', 17, 'system', '2013-03-24 18:30:00', 'system', '2013-03-24 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `flipkart_seller`
--

CREATE TABLE IF NOT EXISTS `flipkart_seller` (
  `sellerID` int(10) NOT NULL AUTO_INCREMENT,
  `sellerName` varchar(30) NOT NULL,
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
(1, 'Avipsa Nayak', 'Plot No-433/B, Nuasahi, Nayapalli', '', 'Bhubaneswar', 9, 751012, '9980964252', 1, NULL, '2013-03-22 19:10:31', NULL, NULL),
(2, 'Avipsa Nayak', 'WH-411, International Institute of Information Technology(IIIT-Bangalore), 26/C, Electronics City, Hosur Road', 'Opposite Infosys Gate 1', 'Bangalore', 11, 560100, '9980964252', 1, NULL, '2013-03-22 19:11:40', NULL, NULL);

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
  `emailAddress` varchar(50) NOT NULL,
  `role` int(10) NOT NULL,
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

INSERT INTO `flipkart_userinfo` (`userID`, `firstName`, `lastName`, `contactNumber`, `gender`, `password`, `emailAddress`, `role`, `createdBy`, `createdOn`, `modifiedBy`, `modifiedOn`) VALUES
(1, 'Avipsa', 'Nayak', '9980964252', '2', 'bed128365216c019988915ed3add75fb', 'avipsa.nayak@gmail.com', 0, NULL, '2013-03-21 13:44:22', NULL, '2013-03-21 13:44:33'),
(2, NULL, NULL, NULL, NULL, 'aamir', 'aamirshaad.alam@gmail.com', 0, NULL, '2013-03-29 17:54:57', NULL, NULL),
(3, NULL, NULL, NULL, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', 'aamir.alam@gmail.com', 0, NULL, '2013-03-29 18:04:41', NULL, NULL),
(4, NULL, NULL, NULL, NULL, '5f4dcc3b5aa765d61d8327deb882cf99', 'anand@gmail.com', 0, NULL, '2013-03-29 19:30:38', NULL, NULL);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `netbanking`
--

CREATE TABLE IF NOT EXISTS `netbanking` (
  `accountNumber` int(16) NOT NULL DEFAULT '0',
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`accountNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure for view `fielditemview`
--
DROP TABLE IF EXISTS `fielditemview`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `fielditemview` AS select `fi`.`itemID` AS `itemID`,`fi`.`itemName` AS `itemName`,`fc`.`categoryName` AS `categoryName` from (((`flipkart_item` `fi` join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`))) union select `fa`.`itemID` AS `itemID`,`fa`.`value` AS `value`,`fc`.`categoryName` AS `categoryName` from ((((`flipkart_itemattributes` `fa` join `flipkart_item` `fi` on((`fi`.`itemID` = `fa`.`itemID`))) join `flipkart_product` `fp` on((`fi`.`productID` = `fp`.`productID`))) join `flipkart_path` `fpa` on((`fpa`.`categoryID` = `fp`.`categoryID`))) join `flipkart_category` `fc` on((`fc`.`categoryID` = `fpa`.`parentID`)));

--
-- Constraints for dumped tables
--

--
-- Constraints for table `banktransaction`
--
ALTER TABLE `banktransaction`
  ADD CONSTRAINT `banktransaction_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `bank` (`customerID`),
  ADD CONSTRAINT `banktransaction_ibfk_2` FOREIGN KEY (`orderID`) REFERENCES `flipkart_order` (`orderID`);

--
-- Constraints for table `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`);

--
-- Constraints for table `debitcard`
--
ALTER TABLE `debitcard`
  ADD CONSTRAINT `debitcard_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`);

--
-- Constraints for table `flipkart_images`
--
ALTER TABLE `flipkart_images`
  ADD CONSTRAINT `flipkart_images_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`);

--
-- Constraints for table `flipkart_item`
--
ALTER TABLE `flipkart_item`
  ADD CONSTRAINT `flipkart_item_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `flipkart_product` (`productID`);

--
-- Constraints for table `flipkart_itemattributes`
--
ALTER TABLE `flipkart_itemattributes`
  ADD CONSTRAINT `flipkart_itemattributes_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`);

--
-- Constraints for table `flipkart_order`
--
ALTER TABLE `flipkart_order`
  ADD CONSTRAINT `flipkart_order_ibfk_1` FOREIGN KEY (`addressID`) REFERENCES `flipkart_shippingaddress` (`addressID`),
  ADD CONSTRAINT `flipkart_order_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `flipkart_path`
--
ALTER TABLE `flipkart_path`
  ADD CONSTRAINT `flipkart_path_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `flipkart_category` (`categoryID`),
  ADD CONSTRAINT `flipkart_path_ibfk_2` FOREIGN KEY (`parentID`) REFERENCES `flipkart_category` (`categoryID`);

--
-- Constraints for table `flipkart_product`
--
ALTER TABLE `flipkart_product`
  ADD CONSTRAINT `flipkart_product_ibfk_1` FOREIGN KEY (`categoryID`) REFERENCES `flipkart_category` (`categoryID`);

--
-- Constraints for table `flipkart_sellertransaction`
--
ALTER TABLE `flipkart_sellertransaction`
  ADD CONSTRAINT `flipkart_sellertransaction_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`),
  ADD CONSTRAINT `flipkart_sellertransaction_ibfk_2` FOREIGN KEY (`sellerID`) REFERENCES `flipkart_seller` (`sellerID`);

--
-- Constraints for table `flipkart_shippingaddress`
--
ALTER TABLE `flipkart_shippingaddress`
  ADD CONSTRAINT `flipkart_shippingaddress_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`),
  ADD CONSTRAINT `flipkart_shippingaddress_ibfk_2` FOREIGN KEY (`stateID`) REFERENCES `flipkart_state` (`stateID`);

--
-- Constraints for table `flipkart_wishlist`
--
ALTER TABLE `flipkart_wishlist`
  ADD CONSTRAINT `flipkart_wishlist_ibfk_1` FOREIGN KEY (`userID`) REFERENCES `flipkart_userinfo` (`userID`),
  ADD CONSTRAINT `flipkart_wishlist_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `flipkart_item` (`itemID`);

--
-- Constraints for table `netbanking`
--
ALTER TABLE `netbanking`
  ADD CONSTRAINT `netbanking_ibfk_1` FOREIGN KEY (`accountNumber`) REFERENCES `bank` (`accountNumber`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
