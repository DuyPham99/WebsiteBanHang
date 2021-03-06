USE [master]
GO
/****** Object:  Database [WebsiteBanHang]    Script Date: 6/16/2020 10:05:53 PM ******/
CREATE DATABASE [WebsiteBanHang] ON  PRIMARY 
( NAME = N'WebsiteBanHang', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\WebsiteBanHang.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WebsiteBanHang_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10.SQLEXPRESS\MSSQL\DATA\WebsiteBanHang_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WebsiteBanHang] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebsiteBanHang].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebsiteBanHang] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebsiteBanHang] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebsiteBanHang] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebsiteBanHang] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [WebsiteBanHang] SET  MULTI_USER 
GO
ALTER DATABASE [WebsiteBanHang] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebsiteBanHang] SET DB_CHAINING OFF 
GO
USE [WebsiteBanHang]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 6/16/2020 10:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[mail] [nvarchar](50) NOT NULL,
	[password] [nvarchar](100) NOT NULL,
	[fullName] [nvarchar](50) NOT NULL,
	[phoneNumber] [nvarchar](50) NOT NULL,
	[status] [int] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[mail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cart]    Script Date: 6/16/2020 10:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cart](
	[emailCustomer] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [int] NOT NULL,
 CONSTRAINT [PK_Cart_1] PRIMARY KEY CLUSTERED 
(
	[emailCustomer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Item]    Script Date: 6/16/2020 10:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Item](
	[idProduct] [nvarchar](50) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [int] NOT NULL,
	[pathImage] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Item_1] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC,
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[itemTransaction]    Script Date: 6/16/2020 10:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[itemTransaction](
	[idTransaction] [int] NOT NULL,
	[idProduct] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [int] NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[discount] [int] NOT NULL,
	[price] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 6/16/2020 10:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[idProduct] [nvarchar](50) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](500) NOT NULL,
	[kind] [nvarchar](50) NOT NULL,
	[price] [int] NOT NULL,
	[amount] [int] NOT NULL,
	[discount] [int] NOT NULL,
	[pathImage] [nvarchar](max) NOT NULL,
	[stt] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[idProduct] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Transaction]    Script Date: 6/16/2020 10:05:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Transaction](
	[idTransaction] [int] IDENTITY(1,1) NOT NULL,
	[phoneNumber] [nchar](10) NOT NULL,
	[fullName] [nchar](50) NOT NULL,
	[date] [datetime] NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[provine] [nvarchar](50) NOT NULL,
	[total] [int] NOT NULL,
	[status] [int] NOT NULL,
	[note] [nvarchar](max) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[dicount] [int] NOT NULL,
 CONSTRAINT [PK_Transaction] PRIMARY KEY CLUSTERED 
(
	[idTransaction] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [dbo].[Cart]  WITH CHECK ADD  CONSTRAINT [FK_Cart_Account] FOREIGN KEY([emailCustomer])
REFERENCES [dbo].[Account] ([mail])
GO
ALTER TABLE [dbo].[Cart] CHECK CONSTRAINT [FK_Cart_Account]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Cart] FOREIGN KEY([email])
REFERENCES [dbo].[Cart] ([emailCustomer])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Cart]
GO
ALTER TABLE [dbo].[Item]  WITH CHECK ADD  CONSTRAINT [FK_Item_Product] FOREIGN KEY([idProduct])
REFERENCES [dbo].[Product] ([idProduct])
GO
ALTER TABLE [dbo].[Item] CHECK CONSTRAINT [FK_Item_Product]
GO
ALTER TABLE [dbo].[itemTransaction]  WITH CHECK ADD  CONSTRAINT [FK_itemTransaction_Transaction] FOREIGN KEY([idTransaction])
REFERENCES [dbo].[Transaction] ([idTransaction])
GO
ALTER TABLE [dbo].[itemTransaction] CHECK CONSTRAINT [FK_itemTransaction_Transaction]
GO
USE [master]
GO
ALTER DATABASE [WebsiteBanHang] SET  READ_WRITE 
GO
