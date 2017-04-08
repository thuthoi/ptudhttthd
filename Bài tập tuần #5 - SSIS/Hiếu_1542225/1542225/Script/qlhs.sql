/*
Navicat SQL Server Data Transfer

Source Server         : SqlServer
Source Server Version : 120000
Source Host           : HAINZ\SQLEXPRESS:1433
Source Database       : qlhs
Source Schema         : dbo

Target Server Type    : SQL Server
Target Server Version : 120000
File Encoding         : 65001

Date: 2017-04-08 15:34:08
*/


-- ----------------------------
-- Table structure for HocSinh
-- ----------------------------
DROP TABLE [dbo].[HocSinh]
GO
CREATE TABLE [dbo].[HocSinh] (
[id] int NOT NULL IDENTITY(1,1) ,
[mahs] varchar(50) NULL ,
[hoten] nvarchar(100) NULL ,
[diachi] nvarchar(100) NULL ,
[email] varchar(100) NULL ,
[sdt] varchar(15) NULL ,
[diem] float(53) NULL 
)


GO

-- ----------------------------
-- Indexes structure for table HocSinh
-- ----------------------------

-- ----------------------------
-- Primary Key structure for table HocSinh
-- ----------------------------
ALTER TABLE [dbo].[HocSinh] ADD PRIMARY KEY ([id])
GO
