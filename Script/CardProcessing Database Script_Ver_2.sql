USE [master]
GO
/****** Object:  Database [CardProcessing_HTTT_HNT]    Script Date: 04/30/2017 14:47:22 ******/
CREATE DATABASE [CardProcessing_HTTT_HNT] ON  PRIMARY 
( NAME = N'CardProcessing_HTTT_HNT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CardProcessing_HTTT_HNT.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CardProcessing_HTTT_HNT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.SQLEXPRESS\MSSQL\DATA\CardProcessing_HTTT_HNT_log.LDF' , SIZE = 768KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CardProcessing_HTTT_HNT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET ANSI_NULLS OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET ANSI_PADDING OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET ARITHABORT OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET AUTO_CLOSE ON
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET  ENABLE_BROKER
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET  READ_WRITE
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET RECOVERY SIMPLE
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET  MULTI_USER
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET DB_CHAINING OFF
GO
USE [CardProcessing_HTTT_HNT]
GO
/****** Object:  Table [dbo].[YearlyReport]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[YearlyReport](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[MerchantID] [varchar](10) NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[SaleAmount] [decimal](18, 0) NULL,
	[ReturnAmount] [decimal](18, 0) NULL,
	[SaleCount] [int] NULL,
	[ReturnCount] [int] NULL,
	[DebitCardSaleAmount] [decimal](18, 0) NULL,
	[MasterCardSaleAmount] [decimal](18, 0) NULL,
	[VisaCardSaleAmount] [decimal](18, 0) NULL,
	[DebitCardReturnAmount] [decimal](18, 0) NULL,
	[MasterCardReturnAmount] [decimal](18, 0) NULL,
	[VisaCardReturnAmount] [decimal](18, 0) NULL,
	[DebitCardSaleCount] [decimal](18, 0) NULL,
	[MasterCardSaleCount] [decimal](18, 0) NULL,
	[VisaCardSaleCount] [decimal](18, 0) NULL,
	[DebitCardReturnCount] [decimal](18, 0) NULL,
	[MasterCardReturnCount] [decimal](18, 0) NULL,
	[VisaCardReturnCount] [decimal](18, 0) NULL,
	[NetAmount] [decimal](18, 0) NULL,
	[NetCount] [int] NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionDetail_Temp]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionDetail_Temp](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[Price] [decimal](18, 0) NULL,
	[ProductNumber] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[TransactionType] [varchar](255) NULL,
	[CreditCardID] [varchar](255) NULL,
	[CreditCardType] [varchar](255) NULL,
	[MerchantID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TransactionDetail](
	[TransactionID] [int] IDENTITY(1,1) NOT NULL,
	[Customer] [nvarchar](255) NULL,
	[ProductName] [nvarchar](255) NULL,
	[Price] [decimal](18, 0) NULL,
	[ProductNumber] [int] NULL,
	[Amount] [decimal](18, 0) NULL,
	[TransactionType] [varchar](255) NULL,
	[CreditCardID] [varchar](255) NULL,
	[CreditCardType] [varchar](255) NULL,
	[MerchantID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[Date] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistrationForm]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RegistrationForm](
	[RegID] [varchar](10) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Detail] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[RegID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Parameter](
	[ParaID] [varchar](10) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Value] [nvarchar](255) NULL,
	[Type] [nvarchar](255) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ParaID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Notification](
	[NotiID] [varchar](10) NOT NULL,
	[Detail] [nvarchar](255) NULL,
	[Summary] [nvarchar](255) NULL,
	[Date] [datetime] NULL,
	[SenderID] [varchar](10) NULL,
	[ReceiverID] [varchar](10) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[NotiID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonthlyReport]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MonthlyReport](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[MerchantID] [varchar](10) NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[SaleAmount] [decimal](18, 0) NULL,
	[ReturnAmount] [decimal](18, 0) NULL,
	[SaleCount] [int] NULL,
	[ReturnCount] [int] NULL,
	[DebitCardSaleAmount] [decimal](18, 0) NULL,
	[MasterCardSaleAmount] [decimal](18, 0) NULL,
	[VisaCardSaleAmount] [decimal](18, 0) NULL,
	[DebitCardReturnAmount] [decimal](18, 0) NULL,
	[MasterCardReturnAmount] [decimal](18, 0) NULL,
	[VisaCardReturnAmount] [decimal](18, 0) NULL,
	[DebitCardSaleCount] [decimal](18, 0) NULL,
	[MasterCardSaleCount] [decimal](18, 0) NULL,
	[VisaCardSaleCount] [decimal](18, 0) NULL,
	[DebitCardReturnCount] [decimal](18, 0) NULL,
	[MasterCardReturnCount] [decimal](18, 0) NULL,
	[VisaCardReturnCount] [decimal](18, 0) NULL,
	[NetAmount] [decimal](18, 0) NULL,
	[NetCount] [int] NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantType](
	[MerchantTypeID] [varchar](10) NOT NULL,
	[MerchantTypeName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MerchantTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00001', N'Cửa hàng quần áo')
INSERT [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00002', N'Quán ăn')
INSERT [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00003', N'Siêu thị')
INSERT [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00004', N'Nhà hàng')
INSERT [dbo].[MerchantType] ([MerchantTypeID], [MerchantTypeName]) VALUES (N'MCT00005', N'Khách sạn')
/****** Object:  Table [dbo].[MerchantRegion]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MerchantRegion](
	[MerchantRegionID] [varchar](10) NOT NULL,
	[MerchantRegionName] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[MerchantRegionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[MerchantRegion] ([MerchantRegionID], [MerchantRegionName]) VALUES (N'MCR00001', N'Miền Nam')
INSERT [dbo].[MerchantRegion] ([MerchantRegionID], [MerchantRegionName]) VALUES (N'MCR00002', N'Miền Trung')
INSERT [dbo].[MerchantRegion] ([MerchantRegionID], [MerchantRegionName]) VALUES (N'MCR00003', N'Miền Bắc')
/****** Object:  Table [dbo].[Merchant]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantID] [varchar](10) NOT NULL,
	[MerchantName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Status] [bit] NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[AgentID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MerchantID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00001', N'Cửa hàng quần áo Xuân Lan', N'371 đường Nguyễn Kiệm phường 3 Gò Vấp, Tp.Hồ Chí Minh', N'098.593.5555', N'merchant01@gmail.com', 1, N'MCT00001', N'MCR00001', N'AGENT00001')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00002', N'Cửa hàng quần áo Hồng Ngọc', N'1022 đường Nguyễn Văn Quá phường Đông Hưng Thuận Quận 12, Tp.Hồ Chí Minh', N'094.499.5388', N'merchant02@gmail.com', 1, N'MCT00001', N'MCR00001', N'AGENT00001')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00003', N'Quán ăn Ngon Hết Ý', N'Số 281 đường Nguyễn Chí Thanh Phường 12 Quận 5 TP Hồ Chí Minh', N'091.309.9800', N'merchant03@gmail.com', 1, N'MCT00002', N'MCR00001', N'AGENT00002')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00004', N'Quán ăn Cô Tấm', N'24H đường Nguyễn Ảnh Thủ Phường Hiệp Thành Quận 12 TP Hồ Chí Minh', N'091.309.9801', N'merchant04@gmail.com', 1, N'MCT00002', N'MCR00001', N'AGENT00002')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00005', N'Siêu thị Mua gì cũng có', N'154 Trần Văn Trà, quận Cẩm Lệ, Thành phố Đà Nẵng', N'091.309.9802', N'merchant05@gmail.com', 1, N'MCT00003', N'MCR00002', N'AGENT00003')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00006', N'Siêu thị B''Mart', N'78A Duy Tân, Hải Châu, Đà Nẵng', N'091.309.9803', N'merchant06@gmail.com', 1, N'MCT00003', N'MCR00002', N'AGENT00003')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00007', N'Nhà hàng Sông Nước', N'561, Đường Âu Cơ, Phường Hòa Khánh Bắc, Quận Liên Chiểu, Thành Phố Đà Nẵng', N'091.309.9804', N'merchant07@gmail.com', 1, N'MCT00004', N'MCR00002', N'AGENT00004')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00008', N'Nhà hàng Quê Hương', N'Số 53, Đường Kim Mã Thượng, Phường Cống Vị, Quận Ba Đình, Hà Nội', N'091.309.9805', N'merchant08@gmail.com', 1, N'MCT00004', N'MCR00003', N'AGENT00004')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00009', N'Khách sạn Sức Sống Trẻ', N'45A Nguyễn Chí Thanh, Phường Giảng Võ, quận Ba Đình, Hà Nội', N'091.309.9806', N'merchant09@gmail.com', 1, N'MCT00005', N'MCR00003', N'AGENT00005')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00010', N'Nhà hàng Thủy Tạ', N'3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh', N'090.686.3336', N'merchantTest@gmail.com', 1, N'MCT00004', N'MCR00001', N'AGENT00004')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00011', N'Nhà hàng Thủy Tạ', N'3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh', N'090.686.3336', N'merchantTest@gmail.com', 1, N'MCT00004', N'MCR00001', N'AGENT00004')
/****** Object:  Table [dbo].[Master]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Master](
	[MasterID] [varchar](10) NOT NULL,
	[MasterName] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[MasterID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Master] ([MasterID], [MasterName], [Phone], [Email], [Status]) VALUES (N'MASTER0001', N'Trung tâm 1', N'	08.38 36 36 36', N'master01@gmail.com', 1)
INSERT [dbo].[Master] ([MasterID], [MasterName], [Phone], [Email], [Status]) VALUES (N'MASTER0002', N'Trung tâm 2', N'	08.38 98 98 98', N'master02@gmail.com', 1)
/****** Object:  Table [dbo].[DailyReport]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DailyReport](
	[ReportID] [int] IDENTITY(1,1) NOT NULL,
	[MerchantID] [varchar](10) NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[SaleAmount] [decimal](18, 0) NULL,
	[ReturnAmount] [decimal](18, 0) NULL,
	[SaleCount] [int] NULL,
	[ReturnCount] [int] NULL,
	[DebitCardSaleAmount] [decimal](18, 0) NULL,
	[MasterCardSaleAmount] [decimal](18, 0) NULL,
	[VisaCardSaleAmount] [decimal](18, 0) NULL,
	[DebitCardReturnAmount] [decimal](18, 0) NULL,
	[MasterCardReturnAmount] [decimal](18, 0) NULL,
	[VisaCardReturnAmount] [decimal](18, 0) NULL,
	[DebitCardSaleCount] [decimal](18, 0) NULL,
	[MasterCardSaleCount] [decimal](18, 0) NULL,
	[VisaCardSaleCount] [decimal](18, 0) NULL,
	[DebitCardReturnCount] [decimal](18, 0) NULL,
	[MasterCardReturnCount] [decimal](18, 0) NULL,
	[VisaCardReturnCount] [decimal](18, 0) NULL,
	[NetAmount] [decimal](18, 0) NULL,
	[NetCount] [int] NULL,
	[Date] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [varchar](10) NOT NULL,
	[AgentName] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Status] [bit] NULL,
	[MasterID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status], [MasterID]) VALUES (N'AGENT00001', N'Đại lý 1', N'36 đường Trần Khắc Chân phường Tân Định Quận 1 Hồ Chí Minh', N'097.363.8888', N'agent01@gmail.com', 1, N'MASTER0001')
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status], [MasterID]) VALUES (N'AGENT00002', N'Đại lý 2', N'D31 đường Vườn Lan phường Phường 10 Tân Bình Hồ Chí Minh', N'098.437.3333', N'agent02@gmail.com', 1, N'MASTER0001')
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status], [MasterID]) VALUES (N'AGENT00003', N'Đại lý 3', N'56 đường Phó Cơ Điều Phường 12 Quận 5 Hồ Chí Minh', N'093.350.0555', N'agent03@gmail.com', 1, N'MASTER0001')
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status], [MasterID]) VALUES (N'AGENT00004', N'Đại lý 4', N'199 đường Phó Cơ Điều Quận 11 Hồ Chí Minh', N'096.111.1398', N'agent04@gmail.com', 1, N'MASTER0001')
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status], [MasterID]) VALUES (N'AGENT00005', N'Đại lý 5', N'283 Đường Trường Chinh Phường 14 Tân Bình, Tp.Hồ Chí Minh', N'096.222.2398', N'agent05@gmail.com', 1, N'MASTER0001')
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status], [MasterID]) VALUES (N'AGENT00006', N'Đại lý 8', N'3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh', N'090.686.3336', N'agentTest@gmail.com', 1, N'MASTER0001')
/****** Object:  Table [dbo].[Account]    Script Date: 04/30/2017 14:47:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Account](
	[Username] [varchar](255) NOT NULL,
	[Password] [varchar](255) NULL,
	[UserID] [varchar](10) NULL,
	[Role] [varchar](255) NULL,
 CONSTRAINT [PK__Account__536C85E5101ADA59] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent01', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00001', N'agent')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent02', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00002', N'agent')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent03', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00003', N'agent')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent04', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00004', N'agent')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'agent05', N'827CCB0EEA8A706C4C34A16891F84E7B', N'AGENT00005', N'agent')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'master01', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MASTER0001', N'master')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'master02', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MASTER0002', N'master')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant01', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00001', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant02', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00002', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant03', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00003', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant04', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00004', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant05', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00005', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant06', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00006', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant07', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00007', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant08', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00008', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant09', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00009', N'merchant')
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'merchant10', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MERCH00010', N'merchant')
/****** Object:  Default [DF__YearlyRep__Debit__32E0915F]    Script Date: 04/30/2017 14:47:23 ******/
ALTER TABLE [dbo].[YearlyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
/****** Object:  Default [DF__MonthlyRe__Debit__31EC6D26]    Script Date: 04/30/2017 14:47:23 ******/
ALTER TABLE [dbo].[MonthlyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
/****** Object:  Default [DF__DailyRepo__Debit__30F848ED]    Script Date: 04/30/2017 14:47:23 ******/
ALTER TABLE [dbo].[DailyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
