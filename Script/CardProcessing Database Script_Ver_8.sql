/****** Object:  Database [CardProcessing_HTTT_HNT]    Script Date: 06/02/2017 14:49:34 ******/
CREATE DATABASE [CardProcessing_HTTT_HNT]
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
/****** Object:  Table [dbo].[TransactionDetail_Temp]    Script Date: 06/02/2017 14:49:36 ******/
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
	[Complete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionDetail_Temp] ON
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (1, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (2, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (3, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (4, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (5, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (6, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (7, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
INSERT [dbo].[TransactionDetail_Temp] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (8, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 0)
SET IDENTITY_INSERT [dbo].[TransactionDetail_Temp] OFF
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 06/02/2017 14:49:36 ******/
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
	[Complete] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[TransactionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[TransactionDetail] ON
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (1, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (2, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (3, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (4, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (5, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (6, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (7, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (8, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A6ED00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (9, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (10, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (11, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (12, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (13, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (14, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (15, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (16, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A72E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (17, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (18, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (19, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (20, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (21, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (22, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (23, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (24, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A74D00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (25, N'Nguyễn Văn A', N'Áo thun nữ', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (26, N'Nguyễn Văn B', N'Quần dài nam', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (27, N'Nguyễn Văn C', N'Quần short nữ', CAST(19000 AS Decimal(18, 0)), 1, CAST(19000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (28, N'Nguyễn Văn D', N'Áo gió đỏ', CAST(32000 AS Decimal(18, 0)), 1, CAST(32000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (29, N'Nguyễn Văn E', N'Áo khoác ngoài trắng', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (30, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (31, N'Nguyễn Văn G', N'Quần Jean xanh', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (32, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(12000 AS Decimal(18, 0)), 1, CAST(12000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (33, N'Nguyễn Văn A', N'Áo thun nữ', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (34, N'Nguyễn Văn B', N'Quần dài nam', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (35, N'Nguyễn Văn C', N'Quần short nữ', CAST(19000 AS Decimal(18, 0)), 1, CAST(19000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (36, N'Nguyễn Văn D', N'Áo gió đỏ', CAST(32000 AS Decimal(18, 0)), 1, CAST(32000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (37, N'Nguyễn Văn E', N'Áo khoác ngoài trắng', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (38, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (39, N'Nguyễn Văn G', N'Quần Jean xanh', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (40, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(12000 AS Decimal(18, 0)), 1, CAST(12000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77E00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (41, N'Nguyễn Văn A', N'Áo thun nữ', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (42, N'Nguyễn Văn B', N'Quần dài nam', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (43, N'Nguyễn Văn C', N'Quần short nữ', CAST(19000 AS Decimal(18, 0)), 1, CAST(19000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (44, N'Nguyễn Văn D', N'Áo gió đỏ', CAST(32000 AS Decimal(18, 0)), 1, CAST(32000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (45, N'Nguyễn Văn E', N'Áo khoác ngoài trắng', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (46, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (47, N'Nguyễn Văn G', N'Quần Jean xanh', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (48, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(12000 AS Decimal(18, 0)), 1, CAST(12000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A77F00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (49, N'Nguyễn Văn A', N'Áo thun nữ', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (50, N'Nguyễn Văn B', N'Quần dài nam', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (51, N'Nguyễn Văn C', N'Quần short nữ', CAST(19000 AS Decimal(18, 0)), 1, CAST(19000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (52, N'Nguyễn Văn D', N'Áo gió đỏ', CAST(32000 AS Decimal(18, 0)), 1, CAST(32000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (53, N'Nguyễn Văn E', N'Áo khoác ngoài trắng', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (54, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (55, N'Nguyễn Văn G', N'Quần Jean xanh', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (56, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(12000 AS Decimal(18, 0)), 1, CAST(12000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76700000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (57, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (58, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (59, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (60, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (61, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (62, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (63, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (64, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (65, N'Nguyễn Văn A', N'Áo thun nữ', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (66, N'Nguyễn Văn B', N'Quần dài nam', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (67, N'Nguyễn Văn C', N'Quần short nữ', CAST(19000 AS Decimal(18, 0)), 1, CAST(19000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (68, N'Nguyễn Văn D', N'Áo gió đỏ', CAST(32000 AS Decimal(18, 0)), 1, CAST(32000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (69, N'Nguyễn Văn E', N'Áo khoác ngoài trắng', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (70, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (71, N'Nguyễn Văn G', N'Quần Jean xanh', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (72, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(12000 AS Decimal(18, 0)), 1, CAST(12000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00001', N'MCR00001', N'MCT00001', CAST(0x0000A76C00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (73, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (74, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (75, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (76, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (77, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (78, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (79, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (80, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00002', N'MCR00002', N'MCT00002', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (81, N'Nguyễn Văn A', N'Áo thun nam', CAST(20000 AS Decimal(18, 0)), 1, CAST(20000 AS Decimal(18, 0)), N'Tra Hang', N'D62DB14EF10AF5527EDEBD92E1B264C4', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (82, N'Nguyễn Văn B', N'Quần dài', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Tra Hang', N'29E8B2B96404DF45D9EA1CB77A8311A3', N'MASTER', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (83, N'Nguyễn Văn C', N'Quần short', CAST(15000 AS Decimal(18, 0)), 1, CAST(15000 AS Decimal(18, 0)), N'Tra Hang', N'C233A7CF6E56A4FA55D08EF1B6A762D0', N'VISA', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (84, N'Nguyễn Văn D', N'Áo gió', CAST(30000 AS Decimal(18, 0)), 1, CAST(30000 AS Decimal(18, 0)), N'Tra Hang', N'3C9F7A6A96DE5F147D7115BE464FF352', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (85, N'Nguyễn Văn E', N'Áo khoác ngoài', CAST(40000 AS Decimal(18, 0)), 1, CAST(40000 AS Decimal(18, 0)), N'Ban Hang', N'1C1D7B6DB37746E6AC9B5DD1B4F8BC45', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (86, N'Nguyễn Văn F', N'Áo sơ mi trắng', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'6EFA0A3055E0398748AD2139BAA68142', N'MASTER', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (87, N'Nguyễn Văn G', N'Quần Jean', CAST(50000 AS Decimal(18, 0)), 1, CAST(50000 AS Decimal(18, 0)), N'Ban Hang', N'3A72137B54E04285622FCAB0E3E230CA', N'VISA', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
INSERT [dbo].[TransactionDetail] ([TransactionID], [Customer], [ProductName], [Price], [ProductNumber], [Amount], [TransactionType], [CreditCardID], [CreditCardType], [MerchantID], [MerchantRegionID], [MerchantTypeID], [Date], [Complete]) VALUES (88, N'Nguyễn Văn H', N'Nón lưỡi trai', CAST(10000 AS Decimal(18, 0)), 1, CAST(10000 AS Decimal(18, 0)), N'Ban Hang', N'1C12CEFA71ED97B2996C11E8A4D4B1DE', N'DEBIT', N'MERCH00003', N'MCR00003', N'MCT00003', CAST(0x0000A76B00000000 AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[TransactionDetail] OFF
/****** Object:  Table [dbo].[RegistrationForm]    Script Date: 06/02/2017 14:49:36 ******/
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
/****** Object:  Table [dbo].[Parameter]    Script Date: 06/02/2017 14:49:36 ******/
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
/****** Object:  Table [dbo].[Notification]    Script Date: 06/02/2017 14:49:36 ******/
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
/****** Object:  Table [dbo].[MonthlyReport]    Script Date: 06/02/2017 14:49:36 ******/
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
	[AgentID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[MonthlyReport] ON
INSERT [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (1, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0x2A3C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (2, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0x843C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (3, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xA33C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (9, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(670000 AS Decimal(18, 0)), CAST(530000 AS Decimal(18, 0)), 24, 24, CAST(310000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(300000 AS Decimal(18, 0)), CAST(360000 AS Decimal(18, 0)), CAST(60000 AS Decimal(18, 0)), CAST(110000 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), CAST(12 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), CAST(6 AS Decimal(18, 0)), CAST(1200000 AS Decimal(18, 0)), 48, CAST(0xC13C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (10, N'MERCH00002', N'MCT00002', N'MCR00002', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xC13C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[MonthlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (11, N'MERCH00003', N'MCT00003', N'MCR00003', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xC13C0B00 AS Date), N'AGENT00002')
SET IDENTITY_INSERT [dbo].[MonthlyReport] OFF
/****** Object:  Table [dbo].[MerchantType]    Script Date: 06/02/2017 14:49:36 ******/
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
/****** Object:  Table [dbo].[MerchantRegion]    Script Date: 06/02/2017 14:49:36 ******/
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
/****** Object:  Table [dbo].[Merchant]    Script Date: 06/02/2017 14:49:36 ******/
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
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00009', N'Khách sạn Sức Sống Trẻ', N'45A Nguyễn Chí Thanh, Phường Giảng Võ, quận Ba Đình, Hà Nội', N'091.309.9806', N'merchant09@gmail.com', 1, N'MCT00005', N'MCR00003', N'AGENT00004')
INSERT [dbo].[Merchant] ([MerchantID], [MerchantName], [Address], [Phone], [Email], [Status], [MerchantTypeID], [MerchantRegionID], [AgentID]) VALUES (N'MERCH00010', N'Nhà hàng Thủy Tạ', N'3, Hòa Bình, Phường 3, Quận 11, TP Hồ Chí Minh', N'090.686.3336', N'merchant10@gmail.com', 1, N'MCT00004', N'MCR00001', N'AGENT00004')
/****** Object:  Table [dbo].[Master]    Script Date: 06/02/2017 14:49:36 ******/
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
INSERT [dbo].[Master] ([MasterID], [MasterName], [Phone], [Email], [Status]) VALUES (N'MASTER0001', N'Trung tâm ABC', N'	08.38 36 36 36', N'masterABC@gmail.com', 1)
/****** Object:  Table [dbo].[DailyReport]    Script Date: 06/02/2017 14:49:36 ******/
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
	[AgentID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[DailyReport] ON
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (1, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0x483C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (2, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0x893C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (3, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xA83C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (4, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(112000 AS Decimal(18, 0)), CAST(91000 AS Decimal(18, 0)), 4, 4, CAST(52000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(62000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(19000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(203000 AS Decimal(18, 0)), 8, CAST(0xCA3C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (5, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(112000 AS Decimal(18, 0)), CAST(91000 AS Decimal(18, 0)), 4, 4, CAST(52000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(62000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(19000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(203000 AS Decimal(18, 0)), 8, CAST(0xD93C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (6, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(112000 AS Decimal(18, 0)), CAST(91000 AS Decimal(18, 0)), 4, 4, CAST(52000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(62000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(19000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(203000 AS Decimal(18, 0)), 8, CAST(0xDA3C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (7, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(112000 AS Decimal(18, 0)), CAST(91000 AS Decimal(18, 0)), 4, 4, CAST(52000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(62000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(19000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(203000 AS Decimal(18, 0)), 8, CAST(0xC23C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (8, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xC63C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (9, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(112000 AS Decimal(18, 0)), CAST(91000 AS Decimal(18, 0)), 4, 4, CAST(52000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(62000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(19000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(203000 AS Decimal(18, 0)), 8, CAST(0xC73C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (10, N'MERCH00002', N'MCT00002', N'MCR00002', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xC63C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[DailyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (11, N'MERCH00003', N'MCT00003', N'MCR00003', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xC63C0B00 AS Date), N'AGENT00002')
SET IDENTITY_INSERT [dbo].[DailyReport] OFF
/****** Object:  Table [dbo].[Agent]    Script Date: 06/02/2017 14:49:36 ******/
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
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00001', N'Đại lý 1', N'36 đường Trần Khắc Chân phường Tân Định Quận 1 Hồ Chí Minh', N'097.363.8888', N'agent01@gmail.com', 1)
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00002', N'Đại lý 2', N'D31 đường Vườn Lan phường Phường 10 Tân Bình Hồ Chí Minh', N'098.437.3333', N'agent02@gmail.com', 1)
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00003', N'Đại lý 3', N'56 đường Phó Cơ Điều Phường 12 Quận 5 Hồ Chí Minh', N'093.350.0555', N'agent03@gmail.com', 1)
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00004', N'Đại lý 4', N'199 đường Phó Cơ Điều Quận 11 Hồ Chí Minh', N'096.111.1398', N'agent04@gmail.com', 1)
INSERT [dbo].[Agent] ([AgentID], [AgentName], [Address], [Phone], [Email], [Status]) VALUES (N'AGENT00005', N'Đại lý 5', N'283 Đường Trường Chinh Phường 14 Tân Bình, Tp.Hồ Chí Minh', N'096.222.2398', N'agent05@gmail.com', 1)
/****** Object:  Table [dbo].[Account]    Script Date: 06/02/2017 14:49:36 ******/
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
PRIMARY KEY CLUSTERED 
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
INSERT [dbo].[Account] ([Username], [Password], [UserID], [Role]) VALUES (N'master', N'827CCB0EEA8A706C4C34A16891F84E7B', N'MASTER0001', N'master')
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
/****** Object:  Table [dbo].[YearlyReport]    Script Date: 06/02/2017 14:49:36 ******/
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
	[AgentID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[ReportID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[YearlyReport] ON
INSERT [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (1, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0xDB3A0B00 AS Date), N'AGENT00001')
INSERT [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (9, N'MERCH00001', N'MCT00001', N'MCR00001', CAST(890000 AS Decimal(18, 0)), CAST(680000 AS Decimal(18, 0)), 32, 32, CAST(410000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(400000 AS Decimal(18, 0)), CAST(460000 AS Decimal(18, 0)), CAST(80000 AS Decimal(18, 0)), CAST(140000 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(16 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(8 AS Decimal(18, 0)), CAST(1570000 AS Decimal(18, 0)), 64, CAST(0x493C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (10, N'MERCH00002', N'MCT00002', N'MCR00002', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0x493C0B00 AS Date), N'AGENT00001')
INSERT [dbo].[YearlyReport] ([ReportID], [MerchantID], [MerchantTypeID], [MerchantRegionID], [SaleAmount], [ReturnAmount], [SaleCount], [ReturnCount], [DebitCardSaleAmount], [MasterCardSaleAmount], [VisaCardSaleAmount], [DebitCardReturnAmount], [MasterCardReturnAmount], [VisaCardReturnAmount], [DebitCardSaleCount], [MasterCardSaleCount], [VisaCardSaleCount], [DebitCardReturnCount], [MasterCardReturnCount], [VisaCardReturnCount], [NetAmount], [NetCount], [Date], [AgentID]) VALUES (11, N'MERCH00003', N'MCT00003', N'MCR00003', CAST(110000 AS Decimal(18, 0)), CAST(75000 AS Decimal(18, 0)), 4, 4, CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(50000 AS Decimal(18, 0)), CAST(10000 AS Decimal(18, 0)), CAST(15000 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(2 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(1 AS Decimal(18, 0)), CAST(185000 AS Decimal(18, 0)), 8, CAST(0x493C0B00 AS Date), N'AGENT00002')
SET IDENTITY_INSERT [dbo].[YearlyReport] OFF
/****** Object:  StoredProcedure [dbo].[USP_Tao_YearReport]    Script Date: 06/02/2017 14:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	NetAmount               ,NetCount, Date, AgentID)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount),  DATEADD(yy, DATEDIFF(yy, 0, @Date), 0), AgentID
	FROM MonthlyReport
	WHERE YEAR(DATE) = YEAR(@Date)
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID, AgentID

	
END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tao_MonthReport]    Script Date: 06/02/2017 14:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	NetAmount               ,NetCount, Date, AgentID)
	SELECT MerchantID, MerchantTypeID, MerchantRegionID,
	SUM(SaleAmount)              ,SUM(ReturnAmount)            ,SUM(SaleCount )             ,SUM(ReturnCount),
	SUM(DebitCardSaleAmount )    ,SUM(MasterCardSaleAmount)    ,SUM(VisaCardSaleAmount)     ,
	SUM(DebitCardReturnAmount )  ,SUM(MasterCardReturnAmount)  ,SUM(VisaCardReturnAmount)   ,
	SUM(DebitCardSaleCount   )   ,SUM(MasterCardSaleCount)     ,SUM(VisaCardSaleCount   )   ,
	SUM(DebitCardReturnCount  )  ,SUM(MasterCardReturnCount)   ,SUM(VisaCardReturnCount )   ,
	SUM(NetAmount          )     ,SUM(NetCount),   DATEADD(month, DATEDIFF(month, 0, @Date), 0), AgentID
	FROM DailyReport
	WHERE MONTH(DATE) = MONTH(@Date) 
	AND YEAR(DATE) = YEAR(@Date)
	AND MerchantID = @MerchantID
	GROUP BY MerchantID, MerchantTypeID, MerchantRegionID, AgentID

END
GO
/****** Object:  StoredProcedure [dbo].[USP_Tao_DailyReport]    Script Date: 06/02/2017 14:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[USP_Tao_DailyReport]
			@Date DATE,
			@MerchantID VARCHAR(10),
			@AgentID VARCHAR(10)
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
	NetAmount               ,NetCount, Date,AgentID )
	VALUES (@MerchantID_1, @MerchantTypeID, @MerchantRegionID,
	@SaleAmount              ,@ReturnAmount            ,@SaleCount  ,@ReturnCount,
	@DebitCardSaleAmount     ,@MasterCardSaleAmount    ,@VisaCardSaleAmount,
	@DebitCardReturnAmount   ,@MasterCardReturnAmount  ,@VisaCardReturnAmount,
	@DebitCardSaleCount      ,@MasterCardSaleCount     ,@VisaCardSaleCount       ,
	@DebitCardReturnCount    ,@MasterCardReturnCount   ,@VisaCardReturnCount     ,
	@NetAmount               ,@NetCount, @Date,@AgentID)
	
	
	UPDATE TransactionDetail 
	SET Complete = 1
	WHERE Date= @Date AND MerchantID = @MerchantID

END
GO
/****** Object:  StoredProcedure [dbo].[USP_TinhToan_LuuDuLieu_BaoCao]    Script Date: 06/02/2017 14:49:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
	
	DECLARE @AgentID VARCHAR(10)
	SELECT @AgentID = AgentID
	FROM Merchant
	WHERE MerchantID = @MerchantID



	EXEC USP_Tao_DailyReport @DATE,@MerchantID,@AgentID
	
	EXEC USP_Tao_MonthReport @MerchantID,@DATE
	
	EXEC USP_Tao_YearReport @MerchantID, @Date

END
GO
/****** Object:  Default [DF__Transacti__Compl__47DBAE45]    Script Date: 06/02/2017 14:49:36 ******/
ALTER TABLE [dbo].[TransactionDetail_Temp] ADD  DEFAULT ((0)) FOR [Complete]
GO
/****** Object:  Default [DF__Transacti__Compl__45F365D3]    Script Date: 06/02/2017 14:49:36 ******/
ALTER TABLE [dbo].[TransactionDetail] ADD  DEFAULT ((0)) FOR [Complete]
GO
/****** Object:  Default [DF__MonthlyRe__Debit__4222D4EF]    Script Date: 06/02/2017 14:49:36 ******/
ALTER TABLE [dbo].[MonthlyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
/****** Object:  Default [DF__DailyRepo__Debit__3C69FB99]    Script Date: 06/02/2017 14:49:36 ******/
ALTER TABLE [dbo].[DailyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
/****** Object:  Default [DF__YearlyRep__Debit__49C3F6B7]    Script Date: 06/02/2017 14:49:36 ******/
ALTER TABLE [dbo].[YearlyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
