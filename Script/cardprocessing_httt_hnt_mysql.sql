/*
Navicat MySQL Data Transfer

Source Server         : localhost_mysql
Source Server Version : 50714
Source Host           : localhost:3306
Source Database       : cardprocessing_httt_hnt

Target Server Type    : MYSQL
Target Server Version : 50714
File Encoding         : 65001

Date: 2017-06-09 08:50:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account` (
  `Username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `Password` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `UserID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Role` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`Username`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES ('agent01', '827CCB0EEA8A706C4C34A16891F84E7B', 'AGENT00001', 'agent');
INSERT INTO `account` VALUES ('agent02', '827CCB0EEA8A706C4C34A16891F84E7B', 'AGENT00002', 'agent');
INSERT INTO `account` VALUES ('agent03', '827CCB0EEA8A706C4C34A16891F84E7B', 'AGENT00003', 'agent');
INSERT INTO `account` VALUES ('agent04', '827CCB0EEA8A706C4C34A16891F84E7B', 'AGENT00004', 'agent');
INSERT INTO `account` VALUES ('agent05', '827CCB0EEA8A706C4C34A16891F84E7B', 'AGENT00005', 'agent');
INSERT INTO `account` VALUES ('master', '827CCB0EEA8A706C4C34A16891F84E7B', 'MASTER0001', 'master');
INSERT INTO `account` VALUES ('merchant01', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00001', 'merchant');
INSERT INTO `account` VALUES ('merchant02', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00002', 'merchant');
INSERT INTO `account` VALUES ('merchant03', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00003', 'merchant');
INSERT INTO `account` VALUES ('merchant04', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00004', 'merchant');
INSERT INTO `account` VALUES ('merchant05', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00005', 'merchant');
INSERT INTO `account` VALUES ('merchant06', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00006', 'merchant');
INSERT INTO `account` VALUES ('merchant07', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00007', 'merchant');
INSERT INTO `account` VALUES ('merchant08', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00008', 'merchant');
INSERT INTO `account` VALUES ('merchant09', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00009', 'merchant');
INSERT INTO `account` VALUES ('merchant10', '827CCB0EEA8A706C4C34A16891F84E7B', 'MERCH00010', 'merchant');

-- ----------------------------
-- Table structure for agent
-- ----------------------------
DROP TABLE IF EXISTS `agent`;
CREATE TABLE `agent` (
  `AgentID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `AgentName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`AgentID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of agent
-- ----------------------------
INSERT INTO `agent` VALUES ('AGENT00001', 'Đại lý 1', '36 đường Trần Khắc Chân phường Tân Định Quận 1 Hồ Chí Minh', '097.363.8888', 'agent01@gmail.com', '');
INSERT INTO `agent` VALUES ('AGENT00002', 'Đại lý 2', 'D31 đường Vườn Lan phường Phường 10 Tân Bình Hồ Chí Minh', '098.437.3333', 'agent02@gmail.com', '');
INSERT INTO `agent` VALUES ('AGENT00003', 'Đại lý 3', '56 đường Phó Cơ Điều Phường 12 Quận 5 Hồ Chí Minh', '093.350.0555', 'agent03@gmail.com', '');
INSERT INTO `agent` VALUES ('AGENT00004', 'Đại lý 4', '199 đường Phó Cơ Điều Quận 11 Hồ Chí Minh', '096.111.1398', 'agent04@gmail.com', '');
INSERT INTO `agent` VALUES ('AGENT00005', 'Đại lý 5', '283 Đường Trường Chinh Phường 14 Tân Bình, Tp.Hồ Chí Minh', '096.222.2398', 'agent05@gmail.com', '');

-- ----------------------------
-- Table structure for dailyreport
-- ----------------------------
DROP TABLE IF EXISTS `dailyreport`;
CREATE TABLE `dailyreport` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MerchantID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SaleAmount` decimal(18,0) DEFAULT NULL,
  `ReturnAmount` decimal(18,0) DEFAULT NULL,
  `SaleCount` int(11) DEFAULT NULL,
  `ReturnCount` int(11) DEFAULT NULL,
  `DebitCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `MasterCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `VisaCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `DebitCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `MasterCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `VisaCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `DebitCardSaleCount` decimal(18,0) DEFAULT NULL,
  `MasterCardSaleCount` decimal(18,0) DEFAULT NULL,
  `VisaCardSaleCount` decimal(18,0) DEFAULT NULL,
  `DebitCardReturnCount` decimal(18,0) DEFAULT NULL,
  `MasterCardReturnCount` decimal(18,0) DEFAULT NULL,
  `VisaCardReturnCount` decimal(18,0) DEFAULT NULL,
  `NetAmount` decimal(18,0) DEFAULT NULL,
  `NetCount` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `AgentID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ReportID`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of dailyreport
-- ----------------------------
INSERT INTO `dailyreport` VALUES ('1', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2016-12-31 00:00:00', 'AGENT00001');
INSERT INTO `dailyreport` VALUES ('2', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-03-06 00:00:00', 'AGENT00001');
INSERT INTO `dailyreport` VALUES ('3', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-04-06 00:00:00', 'AGENT00001');

-- ----------------------------
-- Table structure for master
-- ----------------------------
DROP TABLE IF EXISTS `master`;
CREATE TABLE `master` (
  `MasterID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MasterName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`MasterID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of master
-- ----------------------------
INSERT INTO `master` VALUES ('MASTER0001', 'Trung tâm ABC', '	08.38 36 36 36', 'masterABC@gmail.com', '');

-- ----------------------------
-- Table structure for merchant
-- ----------------------------
DROP TABLE IF EXISTS `merchant`;
CREATE TABLE `merchant` (
  `MerchantID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MerchantName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `AgentID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MerchantID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchant
-- ----------------------------
INSERT INTO `merchant` VALUES ('MERCH00001', 'Cửa hàng quần áo Xuân Lan', '371 đường Nguyễn Kiệm phường 3 Gò Vấp, Tp.Hồ Chí Minh', '098.593.5555', 'merchant01@gmail.com', '', 'MCT00001', 'MCR00001', 'AGENT00001');
INSERT INTO `merchant` VALUES ('MERCH00002', 'Cửa hàng quần áo Hồng Ngọc', '1022 đường Nguyễn Văn Quá phường Đông Hưng Thuận Quận 12, Tp.Hồ Chí Minh', '094.499.5388', 'merchant02@gmail.com', '', 'MCT00001', 'MCR00001', 'AGENT00001');
INSERT INTO `merchant` VALUES ('MERCH00003', 'Quán ăn Ngon Hết Ý', 'Số 281 đường Nguyễn Chí Thanh Phường 12 Quận 5 TP Hồ Chí Minh', '091.309.9800', 'merchant03@gmail.com', '', 'MCT00002', 'MCR00001', 'AGENT00002');
INSERT INTO `merchant` VALUES ('MERCH00004', 'Quán ăn Cô Tấm', '24H đường Nguyễn Ảnh Thủ Phường Hiệp Thành Quận 12 TP Hồ Chí Minh', '091.309.9801', 'merchant04@gmail.com', '', 'MCT00002', 'MCR00001', 'AGENT00002');
INSERT INTO `merchant` VALUES ('MERCH00005', 'Siêu thị Mua gì cũng có', '154 Trần Văn Trà, quận Cẩm Lệ, Thành phố Đà Nẵng', '091.309.9802', 'merchant05@gmail.com', '', 'MCT00003', 'MCR00002', 'AGENT00003');
INSERT INTO `merchant` VALUES ('MERCH00006', 'Siêu thị B\'Mart', '78A Duy Tân, Hải Châu, Đà Nẵng', '091.309.9803', 'merchant06@gmail.com', '', 'MCT00003', 'MCR00002', 'AGENT00003');
INSERT INTO `merchant` VALUES ('MERCH00007', 'Nhà hàng Sông Nước', '561, Đường Âu Cơ, Phường Hòa Khánh Bắc, Quận Liên Chiểu, Thành Phố Đà Nẵng', '091.309.9804', 'merchant07@gmail.com', '', 'MCT00004', 'MCR00002', 'AGENT00004');
INSERT INTO `merchant` VALUES ('MERCH00008', 'Nhà hàng Quê Hương', 'Số 53, Đường Kim Mã Thượng, Phường Cống Vị, Quận Ba Đình, Hà Nội', '091.309.9805', 'merchant08@gmail.com', '', 'MCT00004', 'MCR00003', 'AGENT00004');
INSERT INTO `merchant` VALUES ('MERCH00009', 'Khách sạn Sức Sống Trẻ', '45A Nguyễn Chí Thanh, Phường Giảng Võ, quận Ba Đình, Hà Nội', '091.309.9806', 'merchant09@gmail.com', '', 'MCT00005', 'MCR00003', 'AGENT00004');
INSERT INTO `merchant` VALUES ('MERCH00010', 'Nhà hàng Thủy Tạ', '3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh', '090.686.3336', 'merchant10@gmail.com', '', 'MCT00004', 'MCR00001', 'AGENT00004');

-- ----------------------------
-- Table structure for merchantregion
-- ----------------------------
DROP TABLE IF EXISTS `merchantregion`;
CREATE TABLE `merchantregion` (
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MerchantRegionName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MerchantRegionID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchantregion
-- ----------------------------
INSERT INTO `merchantregion` VALUES ('MCR00001', 'Miền Nam');
INSERT INTO `merchantregion` VALUES ('MCR00002', 'Miền Trung');
INSERT INTO `merchantregion` VALUES ('MCR00003', 'Miền Bắc');

-- ----------------------------
-- Table structure for merchanttype
-- ----------------------------
DROP TABLE IF EXISTS `merchanttype`;
CREATE TABLE `merchanttype` (
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `MerchantTypeName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`MerchantTypeID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of merchanttype
-- ----------------------------
INSERT INTO `merchanttype` VALUES ('MCT00001', 'Cửa hàng quần áo');
INSERT INTO `merchanttype` VALUES ('MCT00002', 'Quán ăn');
INSERT INTO `merchanttype` VALUES ('MCT00003', 'Siêu thị');
INSERT INTO `merchanttype` VALUES ('MCT00004', 'Nhà hàng');
INSERT INTO `merchanttype` VALUES ('MCT00005', 'Khách sạn');

-- ----------------------------
-- Table structure for monthlyreport
-- ----------------------------
DROP TABLE IF EXISTS `monthlyreport`;
CREATE TABLE `monthlyreport` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MerchantID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SaleAmount` decimal(18,0) DEFAULT NULL,
  `ReturnAmount` decimal(18,0) DEFAULT NULL,
  `SaleCount` int(11) DEFAULT NULL,
  `ReturnCount` int(11) DEFAULT NULL,
  `DebitCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `MasterCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `VisaCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `DebitCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `MasterCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `VisaCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `DebitCardSaleCount` decimal(18,0) DEFAULT NULL,
  `MasterCardSaleCount` decimal(18,0) DEFAULT NULL,
  `VisaCardSaleCount` decimal(18,0) DEFAULT NULL,
  `DebitCardReturnCount` decimal(18,0) DEFAULT NULL,
  `MasterCardReturnCount` decimal(18,0) DEFAULT NULL,
  `VisaCardReturnCount` decimal(18,0) DEFAULT NULL,
  `NetAmount` decimal(18,0) DEFAULT NULL,
  `NetCount` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `AgentID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ReportID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of monthlyreport
-- ----------------------------
INSERT INTO `monthlyreport` VALUES ('1', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2016-12-01 00:00:00', 'AGENT00001');
INSERT INTO `monthlyreport` VALUES ('2', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-03-01 00:00:00', 'AGENT00001');
INSERT INTO `monthlyreport` VALUES ('3', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-04-01 00:00:00', 'AGENT00001');
INSERT INTO `monthlyreport` VALUES ('4', 'MERCH00001', 'MCT00001', 'MCR00001', '670000', '530000', '24', '24', '310000', '60000', '300000', '360000', '60000', '110000', '12', '6', '6', '12', '6', '6', '140000', '0', '2017-05-01 00:00:00', 'AGENT00001');
INSERT INTO `monthlyreport` VALUES ('5', 'MERCH00002', 'MCT00002', 'MCR00002', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-05-01 00:00:00', 'AGENT00001');
INSERT INTO `monthlyreport` VALUES ('6', 'MERCH00003', 'MCT00003', 'MCR00003', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-05-01 00:00:00', 'AGENT00002');

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification` (
  `NotiID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Summary` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `SenderID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ReceiverID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`NotiID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `ParaID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Value` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Type` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Status` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ParaID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of parameter
-- ----------------------------

-- ----------------------------
-- Table structure for registrationform
-- ----------------------------
DROP TABLE IF EXISTS `registrationform`;
CREATE TABLE `registrationform` (
  `RegID` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `Name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Phone` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Detail` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`RegID`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of registrationform
-- ----------------------------

-- ----------------------------
-- Table structure for transactiondetail
-- ----------------------------
DROP TABLE IF EXISTS `transactiondetail`;
CREATE TABLE `transactiondetail` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProductName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` decimal(18,0) DEFAULT NULL,
  `ProductNumber` int(11) DEFAULT NULL,
  `Amount` decimal(18,0) DEFAULT NULL,
  `TransactionType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreditCardID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreditCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Complete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=MyISAM AUTO_INCREMENT=89 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of transactiondetail
-- ----------------------------
INSERT INTO `transactiondetail` VALUES ('1', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('2', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('3', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('4', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('5', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('6', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('7', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('8', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2016-12-31 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('9', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('10', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('11', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('12', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('13', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('14', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('15', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('16', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-03-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('17', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('18', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('19', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('20', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('21', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('22', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('23', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('24', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-04-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('25', 'Nguyễn Văn A', 'Áo thun nữ', '30000', '1', '30000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('26', 'Nguyễn Văn B', 'Quần dài nam', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('27', 'Nguyễn Văn C', 'Quần short nữ', '19000', '1', '19000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('28', 'Nguyễn Văn D', 'Áo gió đỏ', '32000', '1', '32000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('29', 'Nguyễn Văn E', 'Áo khoác ngoài trắng', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('30', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('31', 'Nguyễn Văn G', 'Quần Jean xanh', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('32', 'Nguyễn Văn H', 'Nón lưỡi trai', '12000', '1', '12000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-10 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('33', 'Nguyễn Văn A', 'Áo thun nữ', '30000', '1', '30000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('34', 'Nguyễn Văn B', 'Quần dài nam', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('35', 'Nguyễn Văn C', 'Quần short nữ', '19000', '1', '19000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('36', 'Nguyễn Văn D', 'Áo gió đỏ', '32000', '1', '32000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('37', 'Nguyễn Văn E', 'Áo khoác ngoài trắng', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('38', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('39', 'Nguyễn Văn G', 'Quần Jean xanh', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('40', 'Nguyễn Văn H', 'Nón lưỡi trai', '12000', '1', '12000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-25 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('41', 'Nguyễn Văn A', 'Áo thun nữ', '30000', '1', '30000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('42', 'Nguyễn Văn B', 'Quần dài nam', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('43', 'Nguyễn Văn C', 'Quần short nữ', '19000', '1', '19000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('44', 'Nguyễn Văn D', 'Áo gió đỏ', '32000', '1', '32000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('45', 'Nguyễn Văn E', 'Áo khoác ngoài trắng', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('46', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('47', 'Nguyễn Văn G', 'Quần Jean xanh', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('48', 'Nguyễn Văn H', 'Nón lưỡi trai', '12000', '1', '12000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-26 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('49', 'Nguyễn Văn A', 'Áo thun nữ', '30000', '1', '30000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('50', 'Nguyễn Văn B', 'Quần dài nam', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('51', 'Nguyễn Văn C', 'Quần short nữ', '19000', '1', '19000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('52', 'Nguyễn Văn D', 'Áo gió đỏ', '32000', '1', '32000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('53', 'Nguyễn Văn E', 'Áo khoác ngoài trắng', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('54', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('55', 'Nguyễn Văn G', 'Quần Jean xanh', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('56', 'Nguyễn Văn H', 'Nón lưỡi trai', '12000', '1', '12000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-02 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('57', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('58', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('59', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('60', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('61', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('62', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('63', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('64', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('65', 'Nguyễn Văn A', 'Áo thun nữ', '30000', '1', '30000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('66', 'Nguyễn Văn B', 'Quần dài nam', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('67', 'Nguyễn Văn C', 'Quần short nữ', '19000', '1', '19000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('68', 'Nguyễn Văn D', 'Áo gió đỏ', '32000', '1', '32000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('69', 'Nguyễn Văn E', 'Áo khoác ngoài trắng', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('70', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('71', 'Nguyễn Văn G', 'Quần Jean xanh', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('72', 'Nguyễn Văn H', 'Nón lưỡi trai', '12000', '1', '12000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00001', 'MCR00001', 'MCT00001', '2017-05-07 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('73', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('74', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('75', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('76', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('77', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('78', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('79', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('80', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00002', 'MCR00002', 'MCT00002', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('81', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('82', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('83', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('84', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('85', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('86', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('87', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');
INSERT INTO `transactiondetail` VALUES ('88', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '');

-- ----------------------------
-- Table structure for transactiondetail_temp
-- ----------------------------
DROP TABLE IF EXISTS `transactiondetail_temp`;
CREATE TABLE `transactiondetail_temp` (
  `TransactionID` int(11) NOT NULL AUTO_INCREMENT,
  `Customer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ProductName` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Price` decimal(18,0) DEFAULT NULL,
  `ProductNumber` int(11) DEFAULT NULL,
  `Amount` decimal(18,0) DEFAULT NULL,
  `TransactionType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreditCardID` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `CreditCardType` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `Complete` bit(1) DEFAULT NULL,
  PRIMARY KEY (`TransactionID`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of transactiondetail_temp
-- ----------------------------
INSERT INTO `transactiondetail_temp` VALUES ('1', 'Nguyễn Văn A', 'Áo thun nam', '20000', '1', '20000', 'Tra Hang', 'D62DB14EF10AF5527EDEBD92E1B264C4', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('2', 'Nguyễn Văn B', 'Quần dài', '10000', '1', '10000', 'Tra Hang', '29E8B2B96404DF45D9EA1CB77A8311A3', 'MASTER', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('3', 'Nguyễn Văn C', 'Quần short', '15000', '1', '15000', 'Tra Hang', 'C233A7CF6E56A4FA55D08EF1B6A762D0', 'VISA', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('4', 'Nguyễn Văn D', 'Áo gió', '30000', '1', '30000', 'Tra Hang', '3C9F7A6A96DE5F147D7115BE464FF352', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('5', 'Nguyễn Văn E', 'Áo khoác ngoài', '40000', '1', '40000', 'Ban Hang', '1C1D7B6DB37746E6AC9B5DD1B4F8BC45', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('6', 'Nguyễn Văn F', 'Áo sơ mi trắng', '10000', '1', '10000', 'Ban Hang', '6EFA0A3055E0398748AD2139BAA68142', 'MASTER', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('7', 'Nguyễn Văn G', 'Quần Jean', '50000', '1', '50000', 'Ban Hang', '3A72137B54E04285622FCAB0E3E230CA', 'VISA', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');
INSERT INTO `transactiondetail_temp` VALUES ('8', 'Nguyễn Văn H', 'Nón lưỡi trai', '10000', '1', '10000', 'Ban Hang', '1C12CEFA71ED97B2996C11E8A4D4B1DE', 'DEBIT', 'MERCH00003', 'MCR00003', 'MCT00003', '2017-05-06 00:00:00', '\0');

-- ----------------------------
-- Table structure for yearlyreport
-- ----------------------------
DROP TABLE IF EXISTS `yearlyreport`;
CREATE TABLE `yearlyreport` (
  `ReportID` int(11) NOT NULL AUTO_INCREMENT,
  `MerchantID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantTypeID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `MerchantRegionID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `SaleAmount` decimal(18,0) DEFAULT NULL,
  `ReturnAmount` decimal(18,0) DEFAULT NULL,
  `SaleCount` int(11) DEFAULT NULL,
  `ReturnCount` int(11) DEFAULT NULL,
  `DebitCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `MasterCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `VisaCardSaleAmount` decimal(18,0) DEFAULT NULL,
  `DebitCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `MasterCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `VisaCardReturnAmount` decimal(18,0) DEFAULT NULL,
  `DebitCardSaleCount` decimal(18,0) DEFAULT NULL,
  `MasterCardSaleCount` decimal(18,0) DEFAULT NULL,
  `VisaCardSaleCount` decimal(18,0) DEFAULT NULL,
  `DebitCardReturnCount` decimal(18,0) DEFAULT NULL,
  `MasterCardReturnCount` decimal(18,0) DEFAULT NULL,
  `VisaCardReturnCount` decimal(18,0) DEFAULT NULL,
  `NetAmount` decimal(18,0) DEFAULT NULL,
  `NetCount` int(11) DEFAULT NULL,
  `Date` datetime DEFAULT NULL,
  `AgentID` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ReportID`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of yearlyreport
-- ----------------------------
INSERT INTO `yearlyreport` VALUES ('1', 'MERCH00001', 'MCT00001', 'MCR00001', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2016-01-01 00:00:00', 'AGENT00001');
INSERT INTO `yearlyreport` VALUES ('2', 'MERCH00001', 'MCT00001', 'MCR00001', '890000', '680000', '32', '32', '410000', '80000', '400000', '460000', '80000', '140000', '16', '8', '8', '16', '8', '8', '210000', '0', '2017-01-01 00:00:00', 'AGENT00001');
INSERT INTO `yearlyreport` VALUES ('3', 'MERCH00002', 'MCT00002', 'MCR00002', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-01-01 00:00:00', 'AGENT00001');
INSERT INTO `yearlyreport` VALUES ('4', 'MERCH00003', 'MCT00003', 'MCR00003', '110000', '75000', '4', '4', '50000', '10000', '50000', '50000', '10000', '15000', '2', '1', '1', '2', '1', '1', '35000', '0', '2017-01-01 00:00:00', 'AGENT00002');
