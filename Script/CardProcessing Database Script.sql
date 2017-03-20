USE [master]
GO
/****** Object:  Database [HNT_CardProcessing]    Script Date: 20-Mar-17 11:26:58 PM ******/
CREATE DATABASE [HNT_CardProcessing]
GO
USE [HNT_CardProcessing]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentNumber] [nchar](10) NOT NULL,
	[AgentName] [nvarchar](50) NULL,
	[Owner] [nvarchar](50) NULL,
	[Address] [nvarchar](50) NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BackendProcessor]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BackendProcessor](
	[BackendProcessorID] [nchar](10) NOT NULL,
	[BackendProcessorName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_BackendProcessor] PRIMARY KEY CLUSTERED 
(
	[BackendProcessorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[BangThamSo]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BangThamSo](
	[MaThamSo] [nvarchar](50) NOT NULL,
	[TenThamSo] [nvarchar](50) NULL,
	[GiaTri] [nvarchar](50) NULL,
	[LoaiGiaTri] [nvarchar](50) NULL,
	[TinhTrang] [nvarchar](50) NULL,
 CONSTRAINT [PK_BangThamSo] PRIMARY KEY CLUSTERED 
(
	[MaThamSo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ChiTietGiaoDich]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietGiaoDich](
	[MaChiTietGiaoDich] [nchar](10) NOT NULL,
	[SanPham] [nvarchar](50) NULL,
	[GiaTri] [float] NULL,
	[SoLuong] [int] NULL,
	[ThanhTien] [float] NULL,
	[MaGiaoDich] [nchar](10) NULL,
 CONSTRAINT [PK_ChiTietGiaoDich] PRIMARY KEY CLUSTERED 
(
	[MaChiTietGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKhachHang] [nchar](10) NOT NULL,
	[TenKhachHang] [nvarchar](50) NULL,
	[DiaChi] [nvarchar](50) NULL,
	[DienThoai] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKhachHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Merchant]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Merchant](
	[MerchantNumber] [nchar](10) NOT NULL,
	[MerchantName] [nvarchar](50) NULL,
	[BackendProcessorID] [nchar](10) NULL,
	[Owner] [nvarchar](50) NULL,
	[Address] [nvarchar](250) NULL,
	[Phone] [nvarchar](50) NULL,
	[Fax] [nvarchar](50) NULL,
	[Email] [nvarchar](50) NULL,
	[ApprovalDate] [date] NULL,
	[CloseDate] [date] NULL,
	[BankCardDBA] [nchar](50) NULL,
	[FirstActiveDate] [date] NULL,
	[LastActiveDate] [date] NULL,
	[Status] [bit] NULL,
	[MerchantTypeID] [nchar](10) NULL,
	[MerchantRegionID] [nchar](10) NOT NULL,
	[AgentNumber] [nchar](10) NULL,
 CONSTRAINT [PK_Merchant] PRIMARY KEY CLUSTERED 
(
	[MerchantNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantRegion]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantRegion](
	[MerchantRegionID] [nchar](10) NOT NULL,
	[MerchantRegionName] [nvarchar](50) NULL,
 CONSTRAINT [PK_MerchantRegion] PRIMARY KEY CLUSTERED 
(
	[MerchantRegionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantRevenue]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantRevenue](
	[MerchantRevenueID] [nchar](10) NOT NULL,
	[MerchantNumber] [nchar](10) NULL,
	[Revenue] [float] NULL,
	[Day] [date] NULL,
 CONSTRAINT [PK_MerchantRevenue] PRIMARY KEY CLUSTERED 
(
	[MerchantRevenueID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MerchantType]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MerchantType](
	[MerchantTypeID] [nchar](10) NOT NULL,
	[MerchantTypeName] [nvarchar](50) NULL,
	[Status] [bit] NULL,
 CONSTRAINT [PK_MerchantType] PRIMARY KEY CLUSTERED 
(
	[MerchantTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TaiKhoan]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TaiKhoan](
	[MaTK] [nchar](10) NOT NULL,
	[TenDN] [nvarchar](50) NULL,
	[MatKhau] [nvarchar](50) NULL,
	[MaNguoiDung] [nchar](10) NULL,
	[MaVT] [nchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaTK] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TheTinDung]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TheTinDung](
	[MaTheTinDung] [nchar](10) NOT NULL,
	[MaKhachHang] [nchar](10) NULL,
	[HanSuDung] [date] NULL,
 CONSTRAINT [PK_TheTinDung] PRIMARY KEY CLUSTERED 
(
	[MaTheTinDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongBao]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongBao](
	[MaTB] [nchar](10) NOT NULL,
	[NoiDung] [nvarchar](250) NULL,
	[NguoiGui] [nchar](10) NULL,
	[NguoiNhan] [nchar](10) NULL,
	[NgayGui] [date] NULL,
	[TieuDe] [nvarchar](250) NULL,
 CONSTRAINT [PK_ThongBao] PRIMARY KEY CLUSTERED 
(
	[MaTB] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThongTinGiaoDich]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThongTinGiaoDich](
	[MaGiaoDich] [nchar](10) NOT NULL,
	[MaTheTinDung] [nchar](10) NULL,
	[MerchantNumber] [nchar](10) NULL,
	[Date] [date] NULL,
	[Amount] [float] NULL,
 CONSTRAINT [PK_ThongTinGiaoDich] PRIMARY KEY CLUSTERED 
(
	[MaGiaoDich] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VaiTro]    Script Date: 20-Mar-17 11:26:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VaiTro](
	[MaVT] [nchar](10) NOT NULL,
	[TenVT] [nvarchar](50) NULL,
 CONSTRAINT [PK_VaiTro] PRIMARY KEY CLUSTERED 
(
	[MaVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
USE [master]
GO
ALTER DATABASE [HNT_CardProcessing] SET  READ_WRITE 
GO
