/*
Navicat SQL Server Data Transfer

Source Server         : SQL Server
Source Server Version : 120000
Source Host           : THUPHAM\SQLEXPRESS:1433
Source Database       : CardProcessing_HTTT_HNT
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 120000
File Encoding         : 65001

Date: 2017-06-01 21:14:46
*/


-- ----------------------------
-- Table structure for Account
-- ----------------------------
DROP TABLE [dbo].[Account]
GO
CREATE TABLE [dbo].[Account] (
[Username] varchar(255) NOT NULL ,
[Password] varchar(255) NULL ,
[UserID] varchar(10) NULL ,
[Role] varchar(255) NULL 
)


GO

-- ----------------------------
-- Records of Account
-- ----------------------------
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent01', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00001', N'agent')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent02', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00002', N'agent')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent03', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00003', N'agent')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent04', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00004', N'agent')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent05', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00005', N'agent')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'master', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MASTER0001', N'master')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant01', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00001', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant02', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00002', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant03', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00003', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant04', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00004', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant05', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00005', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant06', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00006', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant07', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00007', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant08', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00008', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant09', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00009', N'merchant')
GO
GO
INSERT INTO [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant10', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00010', N'merchant')
GO
GO

-- ----------------------------
-- Table structure for Agent
-- ----------------------------
DROP TABLE [dbo].[Agent]
GO
CREATE TABLE [dbo].[Agent] (
[AgentID] varchar(10) NOT NULL ,
[AgentName] nvarchar(255) NULL ,
[Address] nvarchar(255) NULL ,
[Phone] varchar(255) NULL ,
[Email] varchar(255) NULL ,
[Status] bit NULL 
)


GO

-- ----------------------------
-- Records of Agent
-- ----------------------------
INSERT INTO [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00001', N'Đại lý 1', N'36 đường Trần Khắc Chân phường Tân Định Quận 1 Hồ Chí Minh', N'097.363.8888', N'agent01@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00002', N'Đại lý 2', N'D31 đường Vườn Lan phường Phường 10 Tân Bình Hồ Chí Minh', N'098.437.3333', N'agent02@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00003', N'Đại lý 3', N'56 đường Phó Cơ Điều Phường 12 Quận 5 Hồ Chí Minh', N'093.350.0555', N'agent03@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00004', N'Đại lý 4', N'199 đường Phó Cơ Điều Quận 11 Hồ Chí Minh', N'096.111.1398', N'agent04@gmail.com', N'1')
GO
GO
INSERT INTO [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00005', N'Đại lý 5', N'283 Đường Trường Chinh Phường 14 Tân Bình, Tp.Hồ Chí Minh', N'096.222.2398', N'agent05@gmail.com', N'1')
GO
GO

-- ----------------------------
-- Table structure for DailyReport
-- ----------------------------
DROP TABLE [dbo].[DailyReport]
GO
CREATE TABLE [dbo].[DailyReport] (
[ReportID] int NOT NULL IDENTITY(1,1) ,
[MerchantID] varchar(10) NULL ,
[MerchantTypeID] varchar(10) NULL ,
[MerchantRegionID] varchar(10) NULL ,
[SaleAmount] decimal(18) NULL ,
[ReturnAmount] decimal(18) NULL ,
[SaleCount] int NULL ,
[ReturnCount] int NULL ,
[DebitCardSaleAmount] decimal(18) NULL ,
[MasterCardSaleAmount] decimal(18) NULL ,
[VisaCardSaleAmount] decimal(18) NULL ,
[DebitCardReturnAmount] decimal(18) NULL DEFAULT '' ,
[MasterCardReturnAmount] decimal(18) NULL ,
[VisaCardReturnAmount] decimal(18) NULL ,
[DebitCardSaleCount] decimal(18) NULL ,
[MasterCardSaleCount] decimal(18) NULL ,
[VisaCardSaleCount] decimal(18) NULL ,
[DebitCardReturnCount] decimal(18) NULL ,
[MasterCardReturnCount] decimal(18) NULL ,
[VisaCardReturnCount] decimal(18) NULL ,
[NetAmount] decimal(18) NULL ,
[NetCount] int NULL ,
[Date] date NULL ,
[AgentID] varchar(10) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[DailyReport]', RESEED, 12)
GO

-- ----------------------------
-- Records of DailyReport
-- ----------------------------
SET IDENTITY_INSERT [dbo].[DailyReport] ON
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'1', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2016-12-31', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'2', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-03-06', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'3', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-04-06', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'4', N'MERCH00001', N'MCT00001', N'MCR00001', N'112000', N'91000', N'4', N'4', N'52000', N'10000', N'50000', N'62000', N'10000', N'19000', N'2', N'1', N'1', N'2', N'1', N'1', N'203000', N'8', N'2017-05-02', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'5', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-05-06', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'6', N'MERCH00002', N'MCT00002', N'MCR00002', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-05-06', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'7', N'MERCH00003', N'MCT00003', N'MCR00003', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-05-06', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'8', N'MERCH00001', N'MCT00001', N'MCR00001', N'112000', N'91000', N'4', N'4', N'52000', N'10000', N'50000', N'62000', N'10000', N'19000', N'2', N'1', N'1', N'2', N'1', N'1', N'203000', N'8', N'2017-05-07', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'10', N'MERCH00001', N'MCT00001', N'MCR00001', N'112000', N'91000', N'4', N'4', N'52000', N'10000', N'50000', N'62000', N'10000', N'19000', N'2', N'1', N'1', N'2', N'1', N'1', N'203000', N'8', N'2017-05-10', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'11', N'MERCH00001', N'MCT00001', N'MCR00001', N'112000', N'91000', N'4', N'4', N'52000', N'10000', N'50000', N'62000', N'10000', N'19000', N'2', N'1', N'1', N'2', N'1', N'1', N'203000', N'8', N'2017-05-26', null)
GO
GO
INSERT INTO [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'12', N'MERCH00001', N'MCT00001', N'MCR00001', N'112000', N'91000', N'4', N'4', N'52000', N'10000', N'50000', N'62000', N'10000', N'19000', N'2', N'1', N'1', N'2', N'1', N'1', N'203000', N'8', N'2017-05-25', null)
GO
GO
SET IDENTITY_INSERT [dbo].[DailyReport] OFF
GO

-- ----------------------------
-- Table structure for Master
-- ----------------------------
DROP TABLE [dbo].[Master]
GO
CREATE TABLE [dbo].[Master] (
[MasterID] varchar(10) NOT NULL ,
[MasterName] nvarchar(255) NULL ,
[Phone] varchar(255) NULL ,
[Email] varchar(255) NULL ,
[Status] bit NULL 
)


GO

-- ----------------------------
-- Records of Master
-- ----------------------------
INSERT INTO [dbo].[Master] ([MasterID], [MasterName], [Phone], [Email], [Status]) VALUES (N'MASTER0001', N'Trung tâm ABC', N'	08.38 36 36 36', N'masterABC@gmail.com', N'1')
GO
GO

-- ----------------------------
-- Table structure for Merchant
-- ----------------------------
DROP TABLE [dbo].[Merchant]
GO
CREATE TABLE [dbo].[Merchant] (
[MerchantID] varchar(10) NOT NULL ,
[MerchantName] nvarchar(255) NULL ,
[Address] nvarchar(255) NULL ,
[Phone] varchar(255) NULL ,
[Email] varchar(255) NULL ,
[Status] bit NULL ,
[MerchantTypeID] varchar(10) NULL ,
[MerchantRegionID] varchar(10) NULL ,
[AgentID] varchar(10) NULL 
)


GO

-- ----------------------------
-- Records of Merchant
-- ----------------------------
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00001', N'Cửa hàng quần áo Xuân Lan', N'371 đường Nguyễn Kiệm phường 3 Gò Vấp, Tp.Hồ Chí Minh', N'098.593.5555', N'merchant01@gmail.com', N'1', N'MCT00001', N'MCR00001', N'AGENT00001')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00002', N'Cửa hàng quần áo Hồng Ngọc', N'1022 đường Nguyễn Văn Quá phường Đông Hưng Thuận Quận 12, Tp.Hồ Chí Minh', N'094.499.5388', N'merchant02@gmail.com', N'1', N'MCT00001', N'MCR00001', N'AGENT00001')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00003', N'Quán ăn Ngon Hết Ý', N'Số 281 đường Nguyễn Chí Thanh Phường 12 Quận 5 TP Hồ Chí Minh', N'091.309.9800', N'merchant03@gmail.com', N'1', N'MCT00002', N'MCR00001', N'AGENT00002')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00004', N'Quán ăn Cô Tấm', N'24H đường Nguyễn Ảnh Thủ Phường Hiệp Thành Quận 12 TP Hồ Chí Minh', N'091.309.9801', N'merchant04@gmail.com', N'1', N'MCT00002', N'MCR00001', N'AGENT00002')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00005', N'Siêu thị Mua gì cũng có', N'154 Trần Văn Trà, quận Cẩm Lệ, Thành phố Đà Nẵng', N'091.309.9802', N'merchant05@gmail.com', N'1', N'MCT00003', N'MCR00002', N'AGENT00003')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00006', N'Siêu thị B''Mart', N'78A Duy Tân, Hải Châu, Đà Nẵng', N'091.309.9803', N'merchant06@gmail.com', N'1', N'MCT00003', N'MCR00002', N'AGENT00003')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00007', N'Nhà hàng Sông Nước', N'561, Đường Âu Cơ, Phường Hòa Khánh Bắc, Quận Liên Chiểu, Thành Phố Đà Nẵng', N'091.309.9804', N'merchant07@gmail.com', N'1', N'MCT00004', N'MCR00002', N'AGENT00004')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00008', N'Nhà hàng Quê Hương', N'Số 53, Đường Kim Mã Thượng, Phường Cống Vị, Quận Ba Đình, Hà Nội', N'091.309.9805', N'merchant08@gmail.com', N'1', N'MCT00004', N'MCR00003', N'AGENT00004')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00009', N'Khách sạn Sức Sống Trẻ', N'45A Nguyễn Chí Thanh, Phường Giảng Võ, quận Ba Đình, Hà Nội', N'091.309.9806', N'merchant09@gmail.com', N'1', N'MCT00005', N'MCR00003', N'AGENT00004')
GO
GO
INSERT INTO [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00010', N'Nhà hàng Thủy Tạ', N'3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh', N'090.686.3336', N'merchant10@gmail.com', N'1', N'MCT00004', N'MCR00001', N'AGENT00004')
GO
GO

-- ----------------------------
-- Table structure for MerchantRegion
-- ----------------------------
DROP TABLE [dbo].[MerchantRegion]
GO
CREATE TABLE [dbo].[MerchantRegion] (
[MerchantRegionID] varchar(10) NOT NULL ,
[MerchantRegionName] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of MerchantRegion
-- ----------------------------
INSERT INTO [dbo].[MerchantRegion] ([MerchantRegionID], [MerchantRegionName]) VALUES (N'MCR00001', N'Miền Nam')
GO
GO
INSERT INTO [dbo].[MerchantRegion] ([MerchantRegionID], [MerchantRegionName]) VALUES (N'MCR00002', N'Miền Trung')
GO
GO
INSERT INTO [dbo].[MerchantRegion] ([MerchantRegionID], [MerchantRegionName]) VALUES (N'MCR00003', N'Miền Bắc')
GO
GO

-- ----------------------------
-- Table structure for MerchantType
-- ----------------------------
DROP TABLE [dbo].[MerchantType]
GO
CREATE TABLE [dbo].[MerchantType] (
[MerchantTypeID] varchar(10) NOT NULL ,
[MerchantTypeName] nvarchar(255) NULL 
)


GO

-- ----------------------------
-- Records of MerchantType
-- ----------------------------
INSERT INTO [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00001', N'Cửa hàng quần áo')
GO
GO
INSERT INTO [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00002', N'Quán ăn')
GO
GO
INSERT INTO [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00003', N'Siêu thị')
GO
GO
INSERT INTO [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00004', N'Nhà hàng')
GO
GO
INSERT INTO [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00005', N'Khách sạn')
GO
GO

-- ----------------------------
-- Table structure for MonthlyReport
-- ----------------------------
DROP TABLE [dbo].[MonthlyReport]
GO
CREATE TABLE [dbo].[MonthlyReport] (
[ReportID] int NOT NULL IDENTITY(1,1) ,
[MerchantID] varchar(10) NULL ,
[MerchantTypeID] varchar(10) NULL ,
[MerchantRegionID] varchar(10) NULL ,
[SaleAmount] decimal(18) NULL ,
[ReturnAmount] decimal(18) NULL ,
[SaleCount] int NULL ,
[ReturnCount] int NULL ,
[DebitCardSaleAmount] decimal(18) NULL ,
[MasterCardSaleAmount] decimal(18) NULL ,
[VisaCardSaleAmount] decimal(18) NULL ,
[DebitCardReturnAmount] decimal(18) NULL DEFAULT '' ,
[MasterCardReturnAmount] decimal(18) NULL ,
[VisaCardReturnAmount] decimal(18) NULL ,
[DebitCardSaleCount] decimal(18) NULL ,
[MasterCardSaleCount] decimal(18) NULL ,
[VisaCardSaleCount] decimal(18) NULL ,
[DebitCardReturnCount] decimal(18) NULL ,
[MasterCardReturnCount] decimal(18) NULL ,
[VisaCardReturnCount] decimal(18) NULL ,
[NetAmount] decimal(18) NULL ,
[NetCount] int NULL ,
[Date] date NULL ,
[AgentID] varchar(10) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[MonthlyReport]', RESEED, 12)
GO

-- ----------------------------
-- Records of MonthlyReport
-- ----------------------------
SET IDENTITY_INSERT [dbo].[MonthlyReport] ON
GO
INSERT INTO [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'1', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2016-12-01', null)
GO
GO
INSERT INTO [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'2', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-03-01', null)
GO
GO
INSERT INTO [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'3', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-04-01', null)
GO
GO
INSERT INTO [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'6', N'MERCH00002', N'MCT00002', N'MCR00002', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-05-01', null)
GO
GO
INSERT INTO [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'7', N'MERCH00003', N'MCT00003', N'MCR00003', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-05-01', null)
GO
GO
INSERT INTO [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'12', N'MERCH00001', N'MCT00001', N'MCR00001', N'670000', N'530000', N'24', N'24', N'310000', N'60000', N'300000', N'360000', N'60000', N'110000', N'12', N'6', N'6', N'12', N'6', N'6', N'1200000', N'48', N'2017-05-01', null)
GO
GO
SET IDENTITY_INSERT [dbo].[MonthlyReport] OFF
GO

-- ----------------------------
-- Table structure for Notification
-- ----------------------------
DROP TABLE [dbo].[Notification]
GO
CREATE TABLE [dbo].[Notification] (
[NotiID] varchar(10) NOT NULL ,
[Detail] nvarchar(255) NULL ,
[Summary] nvarchar(255) NULL ,
[Date] datetime NULL ,
[SenderID] varchar(10) NULL ,
[ReceiverID] varchar(10) NULL ,
[Status] bit NULL 
)


GO

-- ----------------------------
-- Records of Notification
-- ----------------------------

-- ----------------------------
-- Table structure for Parameter
-- ----------------------------
DROP TABLE [dbo].[Parameter]
GO
CREATE TABLE [dbo].[Parameter] (
[ParaID] varchar(10) NOT NULL ,
[Name] nvarchar(255) NULL ,
[Value] nvarchar(255) NULL ,
[Type] nvarchar(255) NULL ,
[Status] bit NULL 
)


GO

-- ----------------------------
-- Records of Parameter
-- ----------------------------

-- ----------------------------
-- Table structure for TransactionDetail
-- ----------------------------
DROP TABLE [dbo].[TransactionDetail]
GO
CREATE TABLE [dbo].[TransactionDetail] (
[TransactionID] int NOT NULL IDENTITY(1,1) ,
[Customer] nvarchar(255) NULL ,
[ProductName] nvarchar(255) NULL ,
[Price] decimal(18) NULL ,
[ProductNumber] int NULL ,
[Amount] decimal(18) NULL ,
[TransactionType] varchar(255) NULL ,
[CreditCardID] varchar(255) NULL ,
[CreditCardType] varchar(255) NULL ,
[MerchantID] varchar(10) NULL ,
[MerchantRegionID] varchar(10) NULL ,
[MerchantTypeID] varchar(10) NULL ,
[Date] datetime NULL ,
[Complete] bit NULL DEFAULT ((0)) 
)


GO
DBCC CHECKIDENT(N'[dbo].[TransactionDetail]', RESEED, 96)
GO

-- ----------------------------
-- Records of TransactionDetail
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TransactionDetail] ON
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'1', N'Nguyễn Văn A', N'Áo thun nam', N'20000', N'1', N'20000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'2', N'Nguyễn Văn B', N'Quần dài', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'3', N'Nguyễn Văn C', N'Quần short', N'15000', N'1', N'15000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'4', N'Nguyễn Văn D', N'Áo gió', N'30000', N'1', N'30000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'5', N'Nguyễn Văn E', N'Áo khoác ngoài', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'6', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'7', N'Nguyễn Văn G', N'Quần Jean', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'8', N'Nguyễn Văn H', N'Nón lưỡi trai', N'10000', N'1', N'10000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2016-12-31 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'9', N'Nguyễn Văn A', N'Áo thun nam', N'20000', N'1', N'20000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'10', N'Nguyễn Văn B', N'Quần dài', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'11', N'Nguyễn Văn C', N'Quần short', N'15000', N'1', N'15000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'12', N'Nguyễn Văn D', N'Áo gió', N'30000', N'1', N'30000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'13', N'Nguyễn Văn E', N'Áo khoác ngoài', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'14', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'15', N'Nguyễn Văn G', N'Quần Jean', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'16', N'Nguyễn Văn H', N'Nón lưỡi trai', N'10000', N'1', N'10000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-03-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'17', N'Nguyễn Văn A', N'Áo thun nam', N'20000', N'1', N'20000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'18', N'Nguyễn Văn B', N'Quần dài', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'19', N'Nguyễn Văn C', N'Quần short', N'15000', N'1', N'15000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'20', N'Nguyễn Văn D', N'Áo gió', N'30000', N'1', N'30000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'21', N'Nguyễn Văn E', N'Áo khoác ngoài', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'22', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'23', N'Nguyễn Văn G', N'Quần Jean', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'24', N'Nguyễn Văn H', N'Nón lưỡi trai', N'10000', N'1', N'10000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-04-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'25', N'Nguyễn Văn A', N'Áo thun nữ', N'30000', N'1', N'30000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'26', N'Nguyễn Văn B', N'Quần dài nam', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'27', N'Nguyễn Văn C', N'Quần short nữ', N'19000', N'1', N'19000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'28', N'Nguyễn Văn D', N'Áo gió đỏ', N'32000', N'1', N'32000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'29', N'Nguyễn Văn E', N'Áo khoác ngoài trắng', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'30', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'31', N'Nguyễn Văn G', N'Quần Jean xanh', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'32', N'Nguyễn Văn H', N'Nón lưỡi trai', N'12000', N'1', N'12000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-02 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'33', N'Nguyễn Văn A', N'Áo thun nam', N'20000', N'1', N'20000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'34', N'Nguyễn Văn B', N'Quần dài', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'35', N'Nguyễn Văn C', N'Quần short', N'15000', N'1', N'15000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'36', N'Nguyễn Văn D', N'Áo gió', N'30000', N'1', N'30000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'37', N'Nguyễn Văn E', N'Áo khoác ngoài', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'38', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'39', N'Nguyễn Văn G', N'Quần Jean', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'40', N'Nguyễn Văn H', N'Nón lưỡi trai', N'10000', N'1', N'10000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'41', N'Nguyễn Văn A', N'Áo thun nam', N'20000', N'1', N'20000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'42', N'Nguyễn Văn B', N'Quần dài', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'43', N'Nguyễn Văn C', N'Quần short', N'15000', N'1', N'15000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'44', N'Nguyễn Văn D', N'Áo gió', N'30000', N'1', N'30000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'45', N'Nguyễn Văn E', N'Áo khoác ngoài', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'46', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'47', N'Nguyễn Văn G', N'Quần Jean', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'48', N'Nguyễn Văn H', N'Nón lưỡi trai', N'10000', N'1', N'10000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'49', N'Nguyễn Văn A', N'Áo thun nam', N'20000', N'1', N'20000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'50', N'Nguyễn Văn B', N'Quần dài', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'51', N'Nguyễn Văn C', N'Quần short', N'15000', N'1', N'15000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'52', N'Nguyễn Văn D', N'Áo gió', N'30000', N'1', N'30000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'53', N'Nguyễn Văn E', N'Áo khoác ngoài', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'54', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'55', N'Nguyễn Văn G', N'Quần Jean', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'56', N'Nguyễn Văn H', N'Nón lưỡi trai', N'10000', N'1', N'10000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', N'2017-05-06 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'57', N'Nguyễn Văn A', N'Áo thun nữ', N'30000', N'1', N'30000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'58', N'Nguyễn Văn B', N'Quần dài nam', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'59', N'Nguyễn Văn C', N'Quần short nữ', N'19000', N'1', N'19000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'60', N'Nguyễn Văn D', N'Áo gió đỏ', N'32000', N'1', N'32000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'61', N'Nguyễn Văn E', N'Áo khoác ngoài trắng', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'62', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'63', N'Nguyễn Văn G', N'Quần Jean xanh', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'64', N'Nguyễn Văn H', N'Nón lưỡi trai', N'12000', N'1', N'12000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-07 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'73', N'Nguyễn Văn A', N'Áo thun nữ', N'30000', N'1', N'30000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'74', N'Nguyễn Văn B', N'Quần dài nam', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'75', N'Nguyễn Văn C', N'Quần short nữ', N'19000', N'1', N'19000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'76', N'Nguyễn Văn D', N'Áo gió đỏ', N'32000', N'1', N'32000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'77', N'Nguyễn Văn E', N'Áo khoác ngoài trắng', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'78', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'79', N'Nguyễn Văn G', N'Quần Jean xanh', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'80', N'Nguyễn Văn H', N'Nón lưỡi trai', N'12000', N'1', N'12000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-10 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'81', N'Nguyễn Văn A', N'Áo thun nữ', N'30000', N'1', N'30000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'82', N'Nguyễn Văn B', N'Quần dài nam', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'83', N'Nguyễn Văn C', N'Quần short nữ', N'19000', N'1', N'19000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'84', N'Nguyễn Văn D', N'Áo gió đỏ', N'32000', N'1', N'32000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'85', N'Nguyễn Văn E', N'Áo khoác ngoài trắng', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'86', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'87', N'Nguyễn Văn G', N'Quần Jean xanh', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'88', N'Nguyễn Văn H', N'Nón lưỡi trai', N'12000', N'1', N'12000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-26 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'89', N'Nguyễn Văn A', N'Áo thun nữ', N'30000', N'1', N'30000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'90', N'Nguyễn Văn B', N'Quần dài nam', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'91', N'Nguyễn Văn C', N'Quần short nữ', N'19000', N'1', N'19000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'92', N'Nguyễn Văn D', N'Áo gió đỏ', N'32000', N'1', N'32000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'93', N'Nguyễn Văn E', N'Áo khoác ngoài trắng', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'94', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'95', N'Nguyễn Văn G', N'Quần Jean xanh', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
INSERT INTO [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'96', N'Nguyễn Văn H', N'Nón lưỡi trai', N'12000', N'1', N'12000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'1')
GO
GO
SET IDENTITY_INSERT [dbo].[TransactionDetail] OFF
GO

-- ----------------------------
-- Table structure for TransactionDetail_Temp
-- ----------------------------
DROP TABLE [dbo].[TransactionDetail_Temp]
GO
CREATE TABLE [dbo].[TransactionDetail_Temp] (
[TransactionID] int NOT NULL IDENTITY(1,1) ,
[Customer] nvarchar(255) NULL ,
[ProductName] nvarchar(255) NULL ,
[Price] decimal(18) NULL ,
[ProductNumber] int NULL ,
[Amount] decimal(18) NULL ,
[TransactionType] varchar(255) NULL ,
[CreditCardID] varchar(255) NULL ,
[CreditCardType] varchar(255) NULL ,
[MerchantID] varchar(10) NULL ,
[MerchantRegionID] varchar(10) NULL ,
[MerchantTypeID] varchar(10) NULL ,
[Date] datetime NULL ,
[Complete] bit NULL DEFAULT ((0)) 
)


GO
DBCC CHECKIDENT(N'[dbo].[TransactionDetail_Temp]', RESEED, 8)
GO

-- ----------------------------
-- Records of TransactionDetail_Temp
-- ----------------------------
SET IDENTITY_INSERT [dbo].[TransactionDetail_Temp] ON
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'1', N'Nguyễn Văn A', N'Áo thun nữ', N'30000', N'1', N'30000', N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'2', N'Nguyễn Văn B', N'Quần dài nam', N'10000', N'1', N'10000', N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'3', N'Nguyễn Văn C', N'Quần short nữ', N'19000', N'1', N'19000', N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'4', N'Nguyễn Văn D', N'Áo gió đỏ', N'32000', N'1', N'32000', N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'5', N'Nguyễn Văn E', N'Áo khoác ngoài trắng', N'40000', N'1', N'40000', N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'6', N'Nguyễn Văn F', N'Áo sơ mi trắng', N'10000', N'1', N'10000', N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'7', N'Nguyễn Văn G', N'Quần Jean xanh', N'50000', N'1', N'50000', N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
INSERT INTO [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (N'8', N'Nguyễn Văn H', N'Nón lưỡi trai', N'12000', N'1', N'12000', N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', N'2017-05-25 00:00:00.000', N'0')
GO
GO
SET IDENTITY_INSERT [dbo].[TransactionDetail_Temp] OFF
GO

-- ----------------------------
-- Table structure for YearlyReport
-- ----------------------------
DROP TABLE [dbo].[YearlyReport]
GO
CREATE TABLE [dbo].[YearlyReport] (
[ReportID] int NOT NULL IDENTITY(1,1) ,
[MerchantID] varchar(10) NULL ,
[MerchantTypeID] varchar(10) NULL ,
[MerchantRegionID] varchar(10) NULL ,
[SaleAmount] decimal(18) NULL ,
[ReturnAmount] decimal(18) NULL ,
[SaleCount] int NULL ,
[ReturnCount] int NULL ,
[DebitCardSaleAmount] decimal(18) NULL ,
[MasterCardSaleAmount] decimal(18) NULL ,
[VisaCardSaleAmount] decimal(18) NULL ,
[DebitCardReturnAmount] decimal(18) NULL DEFAULT '' ,
[MasterCardReturnAmount] decimal(18) NULL ,
[VisaCardReturnAmount] decimal(18) NULL ,
[DebitCardSaleCount] decimal(18) NULL ,
[MasterCardSaleCount] decimal(18) NULL ,
[VisaCardSaleCount] decimal(18) NULL ,
[DebitCardReturnCount] decimal(18) NULL ,
[MasterCardReturnCount] decimal(18) NULL ,
[VisaCardReturnCount] decimal(18) NULL ,
[NetAmount] decimal(18) NULL ,
[NetCount] int NULL ,
[Date] date NULL ,
[AgentID] varchar(10) NULL 
)


GO
DBCC CHECKIDENT(N'[dbo].[YearlyReport]', RESEED, 12)
GO

-- ----------------------------
-- Records of YearlyReport
-- ----------------------------
SET IDENTITY_INSERT [dbo].[YearlyReport] ON
GO
INSERT INTO [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'1', N'MERCH00001', N'MCT00001', N'MCR00001', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2016-01-01', null)
GO
GO
INSERT INTO [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'6', N'MERCH00002', N'MCT00002', N'MCR00002', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-01-01', null)
GO
GO
INSERT INTO [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'7', N'MERCH00003', N'MCT00003', N'MCR00003', N'110000', N'75000', N'4', N'4', N'50000', N'10000', N'50000', N'50000', N'10000', N'15000', N'2', N'1', N'1', N'2', N'1', N'1', N'185000', N'8', N'2017-01-01', null)
GO
GO
INSERT INTO [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (N'12', N'MERCH00001', N'MCT00001', N'MCR00001', N'890000', N'680000', N'32', N'32', N'410000', N'80000', N'400000', N'460000', N'80000', N'140000', N'16', N'8', N'8', N'16', N'8', N'8', N'1570000', N'64', N'2017-01-01', null)
GO
GO
SET IDENTITY_INSERT [dbo].[YearlyReport] OFF
GO

-- ----------------------------
-- Procedure structure for USP_Tao_DailyReport
-- ----------------------------
DROP PROCEDURE [dbo].[USP_Tao_DailyReport]
GO

CREATE PROC [dbo].[USP_Tao_DailyReport]
			@Date DATE,
			@MerchantID VARCHAR(10)
AS 
BEGIN
	
	DELETE FROM DailyReport WHERE Date = @Date AND MerchantID = @MerchantID
	
	DECLARE @DebitCardSaleAmount decimal(18, 0)    , @DebitCardSaleCount int, 
	        @MasterCardSaleAmount decimal(18, 0)   , @MasterCardSaleCount int,
	        @VisaCardSaleAmount decimal(18, 0)     , @VisaCardSaleCount int
	        
	SELECT @DebitCardSaleAmount = SUM(tr.Amount), @DebitCardSaleCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'DEBIT'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @MasterCardSaleAmount = SUM(tr.Amount), @MasterCardSaleCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'MASTER'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @VisaCardSaleAmount = SUM(tr.Amount), @VisaCardSaleCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Ban Hang'
	AND tr.CreditCardType = 'VISA'
	GROUP BY tr.MerchantID,tr.Date

	DECLARE @DebitCardReturnAmount decimal(18, 0)    , @DebitCardReturnCount int, 
	        @MasterCardReturnAmount decimal(18, 0)   , @MasterCardReturnCount int,
	        @VisaCardReturnAmount decimal(18, 0)     , @VisaCardReturnCount int
	        
	SELECT @DebitCardReturnAmount = SUM(tr.Amount), @DebitCardReturnCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'DEBIT'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @MasterCardReturnAmount = SUM(tr.Amount), @MasterCardReturnCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'MASTER'
	GROUP BY tr.MerchantID,tr.Date
	
	SELECT @VisaCardReturnAmount = SUM(tr.Amount), @VisaCardReturnCount = COUNT(tr.MerchantID)
	FROM TransactionDetail tr
	WHERE tr.Complete = 0 
	AND tr.TransactionType = 'Tra Hang'
	AND tr.CreditCardType = 'VISA'
	GROUP BY tr.MerchantID,tr.Date
	
	DECLARE @SaleAmount decimal(18, 0), @ReturnAmount decimal(18, 0), @SaleCount int, @ReturnCount int
	, @NetAmount decimal(18, 0), @NetCount decimal(18, 0)
	set @SaleAmount = @DebitCardSaleAmount + @MasterCardSaleAmount + @VisaCardSaleAmount
	set @ReturnAmount = @DebitCardReturnAmount + @MasterCardReturnAmount + @VisaCardReturnAmount
	set @SaleCount = @DebitCardSaleCount + @MasterCardSaleCount + @VisaCardSaleCount
	set @ReturnCount = @DebitCardReturnCount + @MasterCardReturnCount + @VisaCardReturnCount
	set @NetAmount =  @SaleAmount + @ReturnAmount
	set @NetCount = @SaleCount + @ReturnCount
	DECLARE @MerchantID_1 varchar(10), @MerchantTypeID varchar(10), @MerchantRegionID varchar(10)
	SELECT  @MerchantID_1 = tr.MerchantID,@MerchantTypeID = tr.MerchantTypeID,@MerchantRegionID = tr.MerchantRegionID
	FROM TransactionDetail tr
	WHERE tr.Complete =0 OR tr.Complete IS NULL -- v.1.1
	GROUP BY tr.MerchantID,tr.Date, tr.MerchantRegionID, tr.MerchantTypeID
	
	
	
	---- Processing DailyReport 
	INSERT INTO DailyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date)
	VALUES (@MerchantID_1, @MerchantTypeID, @MerchantRegionID,
	@SaleAmount              ,@ReturnAmount            ,@SaleCount  ,@ReturnCount,
	@DebitCardSaleAmount     ,@MasterCardSaleAmount    ,@VisaCardSaleAmount,
	@DebitCardReturnAmount   ,@MasterCardReturnAmount  ,@VisaCardReturnAmount,
	@DebitCardSaleCount      ,@MasterCardSaleCount     ,@VisaCardSaleCount       ,
	@DebitCardReturnCount    ,@MasterCardReturnCount   ,@VisaCardReturnCount     ,
	@NetAmount               ,@NetCount, @Date)
	
	
	UPDATE TransactionDetail 
	SET Complete = 1
	WHERE Date= @Date AND MerchantID = @MerchantID

END

GO

-- ----------------------------
-- Procedure structure for USP_Tao_MonthReport
-- ----------------------------
DROP PROCEDURE [dbo].[USP_Tao_MonthReport]
GO

CREATE PROC [dbo].[USP_Tao_MonthReport]
			@MerchantID VARCHAR(10),
			@Date DATE
AS 
BEGIN
	
	DELETE FROM MonthlyReport WHERE MONTH(DATE) = MONTH(@Date) AND yEAR(DATE) = YEAR(@Date) AND MerchantID = @MerchantID
	
	INSERT INTO MonthlyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount),   DATEADD(month, DATEDIFF(month, 0, @Date), 0)
	FROM DailyReport
	WHERE MONTH(DATE) = MONTH(@Date) 
	AND YEAR(DATE) = YEAR(@Date)
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID

END

GO

-- ----------------------------
-- Procedure structure for USP_Tao_YearReport
-- ----------------------------
DROP PROCEDURE [dbo].[USP_Tao_YearReport]
GO

CREATE PROC [dbo].[USP_Tao_YearReport]
			@MerchantID VARCHAR(10),
			@Date DATE
AS 
BEGIN
	
	DELETE FROM YearlyReport WHERE YEAR(DATE) = YEAR(@Date) AND MerchantID = @MerchantID
	
	INSERT INTO YearlyReport(MerchantID,MerchantTypeID,MerchantRegionID,
	SaleAmount              ,ReturnAmount            ,SaleCount  ,ReturnCount,
	DebitCardSaleAmount     ,MasterCardSaleAmount    ,VisaCardSaleAmount,
	DebitCardReturnAmount   ,MasterCardReturnAmount  ,VisaCardReturnAmount,
	DebitCardSaleCount      ,MasterCardSaleCount     ,VisaCardSaleCount       ,
	DebitCardReturnCount    ,MasterCardReturnCount   ,VisaCardReturnCount     ,
	NetAmount               ,NetCount, Date)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount),  DATEADD(yy, DATEDIFF(yy, 0, @Date), 0)
	FROM MonthlyReport
	WHERE YEAR(DATE) = YEAR(@Date)
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID

END

GO

-- ----------------------------
-- Procedure structure for USP_TinhToan_LuuDuLieu_BaoCao
-- ----------------------------
DROP PROCEDURE [dbo].[USP_TinhToan_LuuDuLieu_BaoCao]
GO

CREATE PROC [dbo].[USP_TinhToan_LuuDuLieu_BaoCao]
AS 
BEGIN

	UPDATE TransactionDetail_Temp 
	SET CreditCardID = CONVERT(NVARCHAR(32),HashBytes('MD5', CreditCardID),2)
	
	-- Prevent duplicate data
	DECLARE @Date DATE,@CreditCardID VARCHAR(255), @MerchantID VARCHAR(10)
	SELECT TOP 1 @Date = Date , @MerchantID = MerchantID FROM TransactionDetail_Temp
	DELETE FROM TransactionDetail WHERE Date = @Date AND MerchantID = @MerchantID

	INSERT INTO TransactionDetail (Customer,ProductName,Price,ProductNumber,Amount
	,TransactionType,CreditCardID,CreditCardType,MerchantID,MerchantRegionID,
	MerchantTypeID,Date) 
	SELECT Customer,ProductName,Price,ProductNumber,Amount
	,TransactionType,CreditCardID,CreditCardType,MerchantID,MerchantRegionID,
	MerchantTypeID,Date
	FROM TransactionDetail_Temp	

	EXEC USP_Tao_DailyReport @DATE,@MerchantID
	
	EXEC USP_Tao_MonthReport @MerchantID,@DATE
	
	EXEC USP_Tao_YearReport @MerchantID, @Date

END

GO

-- ----------------------------
-- Indexes structure for table Account
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Account
-- ----------------------------
ALTER TABLE [dbo].[Account] ADD PRIMARY KEY ([Username])
GO

-- ----------------------------
-- Indexes structure for table Agent
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Agent
-- ----------------------------
ALTER TABLE [dbo].[Agent] ADD PRIMARY KEY ([AgentID])
GO

-- ----------------------------
-- Indexes structure for table DailyReport
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table DailyReport
-- ----------------------------
ALTER TABLE [dbo].[DailyReport] ADD PRIMARY KEY ([ReportID])
GO

-- ----------------------------
-- Indexes structure for table Master
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Master
-- ----------------------------
ALTER TABLE [dbo].[Master] ADD PRIMARY KEY ([MasterID])
GO

-- ----------------------------
-- Indexes structure for table Merchant
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Merchant
-- ----------------------------
ALTER TABLE [dbo].[Merchant] ADD PRIMARY KEY ([MerchantID])
GO

-- ----------------------------
-- Indexes structure for table MerchantRegion
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table MerchantRegion
-- ----------------------------
ALTER TABLE [dbo].[MerchantRegion] ADD PRIMARY KEY ([MerchantRegionID])
GO

-- ----------------------------
-- Indexes structure for table MerchantType
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table MerchantType
-- ----------------------------
ALTER TABLE [dbo].[MerchantType] ADD PRIMARY KEY ([MerchantTypeID])
GO

-- ----------------------------
-- Indexes structure for table MonthlyReport
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table MonthlyReport
-- ----------------------------
ALTER TABLE [dbo].[MonthlyReport] ADD PRIMARY KEY ([ReportID])
GO

-- ----------------------------
-- Indexes structure for table Notification
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Notification
-- ----------------------------
ALTER TABLE [dbo].[Notification] ADD PRIMARY KEY ([NotiID])
GO

-- ----------------------------
-- Indexes structure for table Parameter
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table Parameter
-- ----------------------------
ALTER TABLE [dbo].[Parameter] ADD PRIMARY KEY ([ParaID])
GO

-- ----------------------------
-- Indexes structure for table TransactionDetail
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table TransactionDetail
-- ----------------------------
ALTER TABLE [dbo].[TransactionDetail] ADD PRIMARY KEY ([TransactionID])
GO

-- ----------------------------
-- Indexes structure for table TransactionDetail_Temp
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table TransactionDetail_Temp
-- ----------------------------
ALTER TABLE [dbo].[TransactionDetail_Temp] ADD PRIMARY KEY ([TransactionID])
GO

-- ----------------------------
-- Indexes structure for table YearlyReport
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table YearlyReport
-- ----------------------------
ALTER TABLE [dbo].[YearlyReport] ADD PRIMARY KEY ([ReportID])
GO
