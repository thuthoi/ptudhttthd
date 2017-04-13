USE [master]
GO
/****** Object:  Database [CardProcessing_HTTT_HNT]    Script Date: 13-Apr-17 4:44:04 PM ******/
CREATE DATABASE [CardProcessing_HTTT_HNT]
GO
USE [CardProcessing_HTTT_HNT]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 13-Apr-17 4:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [varchar](10) NOT NULL,
	[AgentName] [nvarchar](255) NULL,
	[Owner] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[Status] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DailyReport]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Master]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 13-Apr-17 4:44:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantID] [varchar](10) NOT NULL,
	[MerchantName] [nvarchar](255) NULL,
	[Owner] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Phone] [varchar](255) NULL,
	[Email] [varchar](255) NULL,
	[ApprovalDate] [date] NULL,
	[Status] [bit] NULL,
	[MerchantTypeID] [varchar](10) NULL,
	[MerchantRegionID] [varchar](10) NULL,
	[AgentID] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MerchantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantRegion]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MonthlyReport]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Notification]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Parameter]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RegistrationForm]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TransactionDetail]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[YearlyReport]    Script Date: 13-Apr-17 4:44:04 PM ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DailyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
ALTER TABLE [dbo].[MonthlyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
ALTER TABLE [dbo].[YearlyReport] ADD  DEFAULT ('') FOR [DebitCardReturnAmount]
GO
USE [master]
GO
ALTER DATABASE [CardProcessing_HTTT_HNT] SET  READ_WRITE 
GO
