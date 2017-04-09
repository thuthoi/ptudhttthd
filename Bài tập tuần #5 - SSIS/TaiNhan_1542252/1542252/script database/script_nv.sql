USE [master]
GO
/****** Object:  Database [demo_ssis]    Script Date: 09-Apr-17 5:50:55 PM ******/
CREATE DATABASE [demo_ssis]
GO
USE [demo_ssis]
GO
/****** Object:  Table [dbo].[nhanvien]    Script Date: 09-Apr-17 5:50:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[nhanvien](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[manv] [varchar](50) NULL,
	[hoten] [varchar](50) NULL,
	[diachi] [varchar](50) NULL,
	[email] [varchar](50) NULL,
	[luong] [money] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
USE [master]
GO
ALTER DATABASE [demo_ssis] SET  READ_WRITE 
GO