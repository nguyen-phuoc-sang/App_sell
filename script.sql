USE [master]
GO
/****** Object:  Database [EdwardEcomerce]    Script Date: 11/26/2022 4:49:26 PM ******/
CREATE DATABASE [EdwardEcomerce]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EdwardEcomerce', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EdwardEcomerce.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EdwardEcomerce_log', FILENAME = N'D:\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\EdwardEcomerce_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [EdwardEcomerce] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EdwardEcomerce].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EdwardEcomerce] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET ARITHABORT OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [EdwardEcomerce] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EdwardEcomerce] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EdwardEcomerce] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EdwardEcomerce] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EdwardEcomerce] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [EdwardEcomerce] SET  MULTI_USER 
GO
ALTER DATABASE [EdwardEcomerce] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EdwardEcomerce] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EdwardEcomerce] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EdwardEcomerce] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EdwardEcomerce] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EdwardEcomerce] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [EdwardEcomerce] SET QUERY_STORE = OFF
GO
USE [EdwardEcomerce]
GO
/****** Object:  User [Edward]    Script Date: 11/26/2022 4:49:26 PM ******/
CREATE USER [Edward] FOR LOGIN [Edward] WITH DEFAULT_SCHEMA=[Edward]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [Edward]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [Edward]
GO
ALTER ROLE [db_datareader] ADD MEMBER [Edward]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [Edward]
GO
/****** Object:  Schema [Edward]    Script Date: 11/26/2022 4:49:27 PM ******/
CREATE SCHEMA [Edward]
GO
/****** Object:  Schema [kynalabc]    Script Date: 11/26/2022 4:49:27 PM ******/
CREATE SCHEMA [kynalabc]
GO
/****** Object:  Table [Edward].[Bill]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[Bill](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IDUser] [int] NULL,
	[IDSeller] [int] NULL,
	[IDvoucher] [int] NULL,
	[DateCreate] [date] NULL,
	[DateReceived] [date] NULL,
	[Status] [nvarchar](255) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[BillDetail]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[BillDetail](
	[IDBill] [int] NOT NULL,
	[IDClotheProperties] [int] NOT NULL,
	[Quantity] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_BillDetail] PRIMARY KEY CLUSTERED 
(
	[IDBill] ASC,
	[IDClotheProperties] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[Category]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[Category](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](255) NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[Clothes]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[Clothes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[IDseller] [int] NULL,
	[idCategory] [int] NULL,
	[des] [nvarchar](255) NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Clothes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[Clothes_Properties]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[Clothes_Properties](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDClothes] [int] NULL,
	[size] [nvarchar](50) NULL,
	[Quantily] [int] NULL,
	[Price] [float] NULL,
 CONSTRAINT [PK_Clothes_Properties] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[Favorites]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[Favorites](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDClothes] [int] NULL,
	[IDUser] [int] NULL,
 CONSTRAINT [PK_Favorites] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[ImgUrls]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[ImgUrls](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDClothes] [int] NULL,
	[ImgUrl] [nvarchar](255) NULL,
 CONSTRAINT [PK_ImgUrls] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[People]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[People](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Mail] [nvarchar](50) NULL,
	[Password] [nvarchar](255) NULL,
	[PhoneNumber] [nvarchar](20) NULL,
	[Role] [int] NULL,
	[img] [nvarchar](255) NULL,
	[Address] [nvarchar](50) NULL,
 CONSTRAINT [PK_People] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Edward].[Voucher]    Script Date: 11/26/2022 4:49:27 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Edward].[Voucher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[IDSeller] [int] NULL,
	[ratio] [int] NULL,
 CONSTRAINT [PK_Voucher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Edward].[Bill] ON 

INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (1, 2, 8, 57, CAST(N'2022-07-03' AS Date), CAST(N'2022-04-06' AS Date), N'Zathin')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (2, 6, 3, 15, CAST(N'2021-12-07' AS Date), CAST(N'2022-08-22' AS Date), N'Treeflex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (3, 8, 2, 65, CAST(N'2022-04-12' AS Date), CAST(N'2022-08-08' AS Date), N'Latlux')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (4, 4, 9, 98, CAST(N'2022-01-05' AS Date), CAST(N'2022-08-17' AS Date), N'Aerified')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (5, 9, 4, 10, CAST(N'2021-12-30' AS Date), CAST(N'2021-11-04' AS Date), N'Zamit')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (6, 4, 4, 92, CAST(N'2022-09-25' AS Date), CAST(N'2022-06-09' AS Date), N'Bamity')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (7, 7, 5, 62, CAST(N'2021-12-02' AS Date), CAST(N'2022-10-20' AS Date), N'Mat Lam Tam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (8, 3, 2, 40, CAST(N'2021-11-04' AS Date), CAST(N'2022-06-09' AS Date), N'Keylex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (9, 8, 10, 83, CAST(N'2021-11-25' AS Date), CAST(N'2022-02-25' AS Date), N'Alphazap')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (10, 9, 8, 87, CAST(N'2022-04-12' AS Date), CAST(N'2022-10-26' AS Date), N'Regrant')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (11, 6, 5, 100, CAST(N'2022-09-24' AS Date), CAST(N'2022-07-10' AS Date), N'Lotstring')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (12, 7, 6, 1, CAST(N'2022-10-23' AS Date), CAST(N'2022-01-19' AS Date), N'Redhold')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (13, 5, 1, 60, CAST(N'2022-01-28' AS Date), CAST(N'2022-09-10' AS Date), N'Bamity')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (14, 8, 7, 87, CAST(N'2022-04-24' AS Date), CAST(N'2022-06-15' AS Date), N'Toughjoyfax')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (15, 10, 4, 20, CAST(N'2022-09-24' AS Date), CAST(N'2022-01-13' AS Date), N'Cardify')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (16, 2, 9, 33, CAST(N'2021-12-06' AS Date), CAST(N'2022-08-10' AS Date), N'Holdlamis')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (17, 6, 4, 61, CAST(N'2022-04-14' AS Date), CAST(N'2021-11-24' AS Date), N'Lotstring')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (18, 4, 5, 82, CAST(N'2022-07-05' AS Date), CAST(N'2022-06-08' AS Date), N'Veribet')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (19, 9, 2, 67, CAST(N'2022-05-11' AS Date), CAST(N'2022-04-17' AS Date), N'Ventosanzap')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (20, 10, 6, 36, CAST(N'2022-07-21' AS Date), CAST(N'2022-04-09' AS Date), N'Prodder')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (21, 2, 7, 90, CAST(N'2021-12-14' AS Date), CAST(N'2022-04-02' AS Date), N'Opela')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (22, 10, 9, 43, CAST(N'2022-03-11' AS Date), CAST(N'2022-05-30' AS Date), N'Rank')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (23, 3, 10, 83, CAST(N'2022-01-19' AS Date), CAST(N'2022-02-23' AS Date), N'Wrapsafe')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (24, 5, 5, 75, CAST(N'2022-04-09' AS Date), CAST(N'2022-08-27' AS Date), N'Fixflex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (25, 4, 4, 5, CAST(N'2022-06-30' AS Date), CAST(N'2022-01-02' AS Date), N'Kanlam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (26, 6, 5, 35, CAST(N'2022-08-21' AS Date), CAST(N'2022-04-02' AS Date), N'Treeflex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (27, 7, 4, 90, CAST(N'2022-06-13' AS Date), CAST(N'2021-11-17' AS Date), N'Biodex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (28, 10, 9, 99, CAST(N'2021-11-07' AS Date), CAST(N'2022-04-28' AS Date), N'Zaam-Dox')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (29, 5, 1, 72, CAST(N'2022-03-13' AS Date), CAST(N'2022-03-10' AS Date), N'Tresom')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (30, 1, 7, 42, CAST(N'2022-11-02' AS Date), CAST(N'2022-09-27' AS Date), N'Gembucket')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (31, 9, 1, 65, CAST(N'2022-09-25' AS Date), CAST(N'2021-11-28' AS Date), N'Hatity')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (32, 5, 9, 91, CAST(N'2021-11-05' AS Date), CAST(N'2022-09-07' AS Date), N'Greenlam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (33, 4, 5, 56, CAST(N'2021-12-07' AS Date), CAST(N'2022-08-26' AS Date), N'Bigtax')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (34, 7, 3, 46, CAST(N'2022-01-10' AS Date), CAST(N'2022-06-30' AS Date), N'Ronstring')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (35, 3, 4, 31, CAST(N'2022-08-23' AS Date), CAST(N'2022-08-22' AS Date), N'Gembucket')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (36, 10, 2, 93, CAST(N'2022-05-18' AS Date), CAST(N'2022-01-28' AS Date), N'Aerified')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (37, 7, 6, 68, CAST(N'2022-04-28' AS Date), CAST(N'2022-03-16' AS Date), N'Zamit')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (38, 3, 1, 70, CAST(N'2022-08-18' AS Date), CAST(N'2022-04-05' AS Date), N'Flowdesk')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (39, 9, 3, 21, CAST(N'2022-10-29' AS Date), CAST(N'2022-01-11' AS Date), N'Zathin')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (40, 4, 7, 99, CAST(N'2022-05-09' AS Date), CAST(N'2022-02-05' AS Date), N'Cardify')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (41, 8, 1, 1, CAST(N'2021-12-21' AS Date), CAST(N'2021-12-11' AS Date), N'Span')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (42, 9, 7, 7, CAST(N'2022-08-28' AS Date), CAST(N'2021-11-18' AS Date), N'Bitchip')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (43, 2, 6, 31, CAST(N'2022-10-17' AS Date), CAST(N'2022-06-26' AS Date), N'Hatity')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (44, 6, 8, 99, CAST(N'2022-05-08' AS Date), CAST(N'2022-06-07' AS Date), N'Lotlux')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (45, 10, 3, 46, CAST(N'2021-11-27' AS Date), CAST(N'2022-09-06' AS Date), N'Wrapsafe')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (46, 8, 5, 5, CAST(N'2022-05-19' AS Date), CAST(N'2022-05-03' AS Date), N'Keylex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (47, 10, 9, 24, CAST(N'2022-07-07' AS Date), CAST(N'2022-08-19' AS Date), N'Mat Lam Tam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (48, 9, 1, 98, CAST(N'2022-09-23' AS Date), CAST(N'2022-03-23' AS Date), N'Latlux')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (49, 2, 8, 4, CAST(N'2022-07-31' AS Date), CAST(N'2021-11-29' AS Date), N'Stringtough')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (50, 6, 7, 74, CAST(N'2022-01-03' AS Date), CAST(N'2022-10-13' AS Date), N'Fix San')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (51, 5, 7, 67, CAST(N'2022-09-26' AS Date), CAST(N'2021-11-11' AS Date), N'Pannier')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (52, 10, 3, 10, CAST(N'2021-12-15' AS Date), CAST(N'2022-03-03' AS Date), N'Domainer')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (53, 6, 4, 57, CAST(N'2022-03-15' AS Date), CAST(N'2022-05-22' AS Date), N'Wrapsafe')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (54, 9, 6, 71, CAST(N'2022-07-14' AS Date), CAST(N'2022-01-23' AS Date), N'Zamit')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (55, 1, 10, 70, CAST(N'2022-06-19' AS Date), CAST(N'2022-09-02' AS Date), N'Flowdesk')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (56, 9, 6, 23, CAST(N'2022-02-28' AS Date), CAST(N'2021-11-18' AS Date), N'Opela')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (57, 2, 5, 57, CAST(N'2022-09-27' AS Date), CAST(N'2021-11-28' AS Date), N'Voltsillam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (58, 8, 4, 52, CAST(N'2022-03-23' AS Date), CAST(N'2022-10-18' AS Date), N'Viva')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (59, 4, 9, 80, CAST(N'2022-04-26' AS Date), CAST(N'2022-08-26' AS Date), N'Transcof')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (60, 7, 3, 90, CAST(N'2022-06-14' AS Date), CAST(N'2022-07-29' AS Date), N'Wrapsafe')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (61, 1, 3, 18, CAST(N'2022-10-13' AS Date), CAST(N'2022-08-02' AS Date), N'It')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (62, 3, 9, 3, CAST(N'2021-12-29' AS Date), CAST(N'2022-05-08' AS Date), N'Asoka')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (63, 8, 2, 70, CAST(N'2022-05-16' AS Date), CAST(N'2021-12-27' AS Date), N'Gembucket')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (64, 4, 7, 69, CAST(N'2022-09-16' AS Date), CAST(N'2022-02-01' AS Date), N'Ronstring')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (65, 10, 1, 10, CAST(N'2022-11-03' AS Date), CAST(N'2022-10-06' AS Date), N'Veribet')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (66, 9, 1, 39, CAST(N'2021-11-04' AS Date), CAST(N'2022-02-23' AS Date), N'Wrapsafe')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (67, 3, 7, 84, CAST(N'2022-08-16' AS Date), CAST(N'2022-05-14' AS Date), N'Hatity')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (68, 2, 8, 95, CAST(N'2022-01-01' AS Date), CAST(N'2022-05-17' AS Date), N'Stringtough')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (69, 4, 9, 99, CAST(N'2022-03-04' AS Date), CAST(N'2022-02-25' AS Date), N'Namfix')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (70, 6, 10, 49, CAST(N'2022-02-13' AS Date), CAST(N'2022-02-28' AS Date), N'Subin')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (71, 4, 7, 28, CAST(N'2022-07-11' AS Date), CAST(N'2022-11-01' AS Date), N'Konklux')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (72, 7, 5, 61, CAST(N'2021-12-04' AS Date), CAST(N'2022-02-08' AS Date), N'Cookley')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (73, 8, 6, 18, CAST(N'2022-07-24' AS Date), CAST(N'2021-11-05' AS Date), N'Asoka')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (74, 3, 8, 88, CAST(N'2022-08-17' AS Date), CAST(N'2022-01-26' AS Date), N'Andalax')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (75, 9, 4, 77, CAST(N'2022-06-27' AS Date), CAST(N'2021-11-27' AS Date), N'Rank')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (76, 4, 7, 35, CAST(N'2022-02-02' AS Date), CAST(N'2022-05-29' AS Date), N'Bitchip')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (77, 5, 5, 3, CAST(N'2022-05-31' AS Date), CAST(N'2022-07-23' AS Date), N'Lotlux')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (78, 3, 6, 63, CAST(N'2022-10-03' AS Date), CAST(N'2022-01-09' AS Date), N'Zoolab')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (79, 8, 10, 13, CAST(N'2022-04-04' AS Date), CAST(N'2022-08-17' AS Date), N'Greenlam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (80, 6, 2, 21, CAST(N'2021-11-09' AS Date), CAST(N'2022-02-03' AS Date), N'Kanlam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (81, 1, 8, 61, CAST(N'2022-04-20' AS Date), CAST(N'2022-09-28' AS Date), N'Duobam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (82, 7, 1, 78, CAST(N'2022-02-19' AS Date), CAST(N'2022-10-10' AS Date), N'Alpha')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (83, 2, 4, 89, CAST(N'2022-04-01' AS Date), CAST(N'2022-05-29' AS Date), N'Fixflex')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (84, 8, 6, 52, CAST(N'2022-09-05' AS Date), CAST(N'2021-12-26' AS Date), N'Home Ing')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (85, 10, 5, 45, CAST(N'2022-01-16' AS Date), CAST(N'2022-02-25' AS Date), N'Domainer')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (86, 3, 8, 68, CAST(N'2022-05-09' AS Date), CAST(N'2022-03-12' AS Date), N'Hatity')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (87, 2, 2, 84, CAST(N'2022-06-11' AS Date), CAST(N'2022-07-10' AS Date), N'Job')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (88, 10, 9, 96, CAST(N'2022-01-25' AS Date), CAST(N'2022-10-07' AS Date), N'Veribet')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (89, 5, 7, 3, CAST(N'2021-12-13' AS Date), CAST(N'2022-06-24' AS Date), N'Tres-Zap')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (90, 4, 4, 57, CAST(N'2022-06-09' AS Date), CAST(N'2021-12-05' AS Date), N'Zontrax')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (91, 9, 5, 34, CAST(N'2022-01-10' AS Date), CAST(N'2022-10-21' AS Date), N'Flexidy')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (92, 6, 3, 38, CAST(N'2022-03-15' AS Date), CAST(N'2022-02-02' AS Date), N'Zaam-Dox')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (93, 10, 4, 79, CAST(N'2022-10-05' AS Date), CAST(N'2021-12-05' AS Date), N'Fintone')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (94, 4, 2, 39, CAST(N'2022-08-16' AS Date), CAST(N'2022-04-01' AS Date), N'Bigtax')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (95, 7, 1, 24, CAST(N'2022-10-13' AS Date), CAST(N'2022-01-09' AS Date), N'Job')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (96, 9, 2, 47, CAST(N'2022-04-15' AS Date), CAST(N'2022-02-21' AS Date), N'Cardify')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (97, 3, 8, 40, CAST(N'2022-05-08' AS Date), CAST(N'2022-01-24' AS Date), N'Tin')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (98, 10, 5, 96, CAST(N'2021-12-31' AS Date), CAST(N'2022-03-15' AS Date), N'Mat Lam Tam')
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (99, 2, 10, 15, CAST(N'2022-08-02' AS Date), CAST(N'2022-03-03' AS Date), N'Domainer')
GO
INSERT [Edward].[Bill] ([id], [IDUser], [IDSeller], [IDvoucher], [DateCreate], [DateReceived], [Status]) VALUES (100, 7, 3, 10, CAST(N'2022-11-02' AS Date), CAST(N'2022-09-29' AS Date), N'Zontrax')
SET IDENTITY_INSERT [Edward].[Bill] OFF
GO
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (2, 79, 97, 1153.72)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (3, 73, 73, 2076.21)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (4, 47, 88, 1416.36)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (4, 82, 43, 1182.46)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (5, 83, 58, 8290.12)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (7, 39, 19, 927.98)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (8, 11, 85, 6048.98)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (9, 83, 38, 598.7)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (10, 31, 24, 3109.06)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (10, 89, 76, 3564.53)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (11, 9, 97, 5560.65)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (11, 47, 1, 5130.93)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (11, 50, 26, 1973.45)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (13, 6, 64, 1631.59)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (13, 56, 59, 6457.63)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (15, 1, 48, 7979.87)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (15, 4, 8, 6851.9)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (15, 5, 57, 2015.79)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (15, 40, 90, 1963.62)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (15, 96, 38, 9047.88)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (16, 51, 32, 3220.57)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (16, 66, 88, 5792.3)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (17, 93, 46, 5847.73)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (18, 52, 80, 9958.26)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (18, 70, 26, 2251.28)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (19, 35, 62, 5953.09)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (19, 97, 86, 112.84)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (21, 22, 82, 4184.36)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (21, 25, 62, 3432.07)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (21, 32, 46, 2140.13)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (22, 63, 14, 1018.23)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (23, 89, 29, 4654.65)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (24, 86, 8, 9109.58)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (25, 71, 64, 6673.35)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (26, 42, 88, 5284.05)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (26, 68, 100, 3080.74)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (27, 25, 100, 2635.42)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (27, 27, 30, 9967.15)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (27, 92, 10, 5975.77)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (28, 24, 45, 6734)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (28, 65, 42, 8950.34)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (29, 79, 82, 9193.26)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (30, 69, 23, 9328.58)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (33, 27, 36, 1067.41)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (33, 61, 67, 946.87)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (33, 62, 50, 2483.33)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (34, 55, 63, 2340.3)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (35, 90, 57, 9523.87)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (37, 67, 94, 6501.61)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (38, 40, 27, 2476.38)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (38, 100, 74, 4211.83)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (39, 29, 51, 4158.93)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (39, 43, 89, 9048.05)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (41, 4, 34, 9171.16)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (41, 45, 98, 9950.76)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (42, 63, 43, 3460.93)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (42, 66, 68, 956.79)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (43, 88, 48, 4286.27)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (44, 8, 6, 7901.98)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (44, 85, 97, 7157.29)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (45, 64, 76, 5280.3)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (47, 31, 1, 4246.84)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (47, 43, 35, 3620.36)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (48, 7, 52, 3303.5)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (49, 1, 67, 7086.65)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (53, 77, 92, 3288.6)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (54, 15, 64, 2616.18)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (54, 59, 62, 5262.95)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (57, 99, 13, 4723.1)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (59, 17, 77, 9454.58)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (60, 51, 20, 1756.06)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (61, 18, 98, 8802.05)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (61, 38, 49, 552.01)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (63, 2, 22, 4337.05)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (64, 69, 50, 4868.38)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (68, 16, 42, 4464.78)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (68, 77, 47, 8056.84)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (70, 28, 79, 7400.24)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (74, 73, 37, 5461.95)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (75, 77, 4, 7863.65)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (76, 72, 25, 6489.67)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (78, 53, 85, 6862.84)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (79, 71, 45, 4557.5)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (81, 4, 58, 7552.77)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (82, 58, 70, 5934.18)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (83, 65, 8, 2328.01)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (83, 78, 44, 3302.61)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (84, 52, 98, 9182.88)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (85, 22, 26, 2539.38)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (89, 27, 80, 9793.55)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (89, 39, 82, 7335.79)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (90, 21, 57, 3102.55)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (90, 38, 15, 4797.92)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (90, 39, 84, 6827.79)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (90, 77, 5, 8347.27)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (95, 3, 33, 5456.52)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (96, 80, 5, 4782.19)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (97, 36, 67, 4149.2)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (100, 11, 34, 409.25)
INSERT [Edward].[BillDetail] ([IDBill], [IDClotheProperties], [Quantity], [Price]) VALUES (100, 62, 63, 3198.47)
GO
SET IDENTITY_INSERT [Edward].[Category] ON 

INSERT [Edward].[Category] ([id], [Name]) VALUES (1, N'Ventosanzap')
INSERT [Edward].[Category] ([id], [Name]) VALUES (2, N'Opela')
INSERT [Edward].[Category] ([id], [Name]) VALUES (3, N'Span')
INSERT [Edward].[Category] ([id], [Name]) VALUES (4, N'Cardguard')
INSERT [Edward].[Category] ([id], [Name]) VALUES (5, N'Stim')
INSERT [Edward].[Category] ([id], [Name]) VALUES (6, N'Andalax')
INSERT [Edward].[Category] ([id], [Name]) VALUES (7, N'Prodder')
INSERT [Edward].[Category] ([id], [Name]) VALUES (8, N'Flexidy')
INSERT [Edward].[Category] ([id], [Name]) VALUES (9, N'Tresom')
INSERT [Edward].[Category] ([id], [Name]) VALUES (10, N'Fixflex')
SET IDENTITY_INSERT [Edward].[Category] OFF
GO
SET IDENTITY_INSERT [Edward].[Clothes] ON 

INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (1, 39, 5, N'Puce', N'Ooba')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (2, 50, 7, N'Maroon', N'Livefish')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (3, 92, 8, N'Goldenrod', N'Yozio')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (4, 87, 1, N'Blue', N'Yabox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (5, 77, 9, N'Green', N'Zoomzone')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (6, 20, 5, N'Crimson', N'Skivee')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (7, 93, 4, N'Mauv', N'Abata')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (8, 39, 7, N'Turquoise', N'Oyoyo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (9, 56, 8, N'Blue', N'Ntags')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (10, 82, 6, N'Purple', N'Devpoint')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (11, 92, 8, N'Green', N'Roodel')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (12, 6, 3, N'Khaki', N'Mycat')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (13, 18, 7, N'Pink', N'Topicstorm')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (14, 3, 10, N'Teal', N'Dynabox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (15, 94, 2, N'Fuscia', N'Ntags')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (16, 2, 1, N'Turquoise', N'Skyba')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (17, 63, 2, N'Fuscia', N'Buzzdog')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (18, 78, 9, N'Maroon', N'Aimbu')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (19, 28, 10, N'Turquoise', N'Youspan')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (20, 32, 6, N'Indigo', N'Jayo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (21, 52, 2, N'Purple', N'Oloo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (22, 47, 3, N'Fuscia', N'Babbleset')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (23, 79, 7, N'Red', N'Vipe')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (24, 83, 9, N'Orange', N'Jabbertype')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (25, 31, 8, N'Mauv', N'Latz')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (26, 73, 4, N'Pink', N'Realblab')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (27, 13, 9, N'Aquamarine', N'Skimia')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (28, 80, 5, N'Aquamarine', N'Eire')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (29, 85, 3, N'Aquamarine', N'Jayo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (30, 84, 7, N'Red', N'Ooba')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (31, 24, 9, N'Maroon', N'Fadeo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (32, 59, 3, N'Turquoise', N'Gabcube')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (33, 76, 7, N'Orange', N'Twitterlist')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (34, 86, 8, N'Aquamarine', N'Topicblab')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (35, 12, 1, N'Turquoise', N'Yadel')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (36, 16, 10, N'Pink', N'Brainbox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (37, 97, 5, N'Red', N'Ozu')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (38, 49, 7, N'Indigo', N'Yabox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (39, 11, 4, N'Fuscia', N'Snaptags')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (40, 78, 3, N'Purple', N'Katz')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (41, 8, 3, N'Goldenrod', N'Twitterlist')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (42, 99, 9, N'Orange', N'Mita')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (43, 25, 6, N'Indigo', N'Npath')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (44, 58, 2, N'Purple', N'Browsebug')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (45, 62, 4, N'Green', N'Blogtags')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (46, 56, 1, N'Orange', N'Roomm')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (47, 11, 6, N'Pink', N'Eabox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (48, 21, 5, N'Blue', N'Babblestorm')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (49, 45, 3, N'Indigo', N'Skibox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (50, 68, 4, N'Pink', N'Jayo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (51, 83, 6, N'Pink', N'Skinder')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (52, 21, 5, N'Crimson', N'Skyba')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (53, 26, 4, N'Red', N'Quamba')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (54, 33, 2, N'Teal', N'Divavu')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (55, 34, 8, N'Aquamarine', N'Oyope')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (56, 67, 4, N'Teal', N'Brainlounge')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (57, 29, 7, N'Fuscia', N'Talane')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (58, 20, 6, N'Puce', N'Flashdog')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (59, 77, 9, N'Puce', N'Skiptube')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (60, 28, 5, N'Orange', N'Myworks')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (61, 82, 4, N'Puce', N'Rhynoodle')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (62, 44, 9, N'Indigo', N'Linklinks')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (63, 86, 3, N'Crimson', N'Talane')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (64, 36, 10, N'Teal', N'Divavu')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (65, 11, 7, N'Pink', N'Chatterbridge')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (66, 100, 4, N'Violet', N'Aimbo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (67, 88, 5, N'Khaki', N'Digitube')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (68, 83, 7, N'Goldenrod', N'Jatri')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (69, 97, 8, N'Violet', N'Rhynyx')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (70, 12, 3, N'Aquamarine', N'Skivee')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (71, 40, 6, N'Yellow', N'Eamia')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (72, 41, 10, N'Aquamarine', N'Babbleblab')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (73, 43, 1, N'Yellow', N'Jabberstorm')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (74, 78, 9, N'Puce', N'Feedfire')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (75, 18, 4, N'Fuscia', N'Linklinks')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (76, 92, 7, N'Khaki', N'Demizz')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (77, 35, 8, N'Green', N'Ailane')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (78, 100, 3, N'Maroon', N'Rhynoodle')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (79, 26, 4, N'Green', N'Zoovu')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (80, 27, 10, N'Maroon', N'Livetube')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (81, 66, 1, N'Turquoise', N'Latz')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (82, 86, 6, N'Aquamarine', N'Vinte')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (83, 3, 8, N'Indigo', N'Brainbox')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (84, 19, 7, N'Aquamarine', N'Photobean')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (85, 5, 5, N'Purple', N'Flashspan')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (86, 96, 9, N'Orange', N'Quaxo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (87, 76, 1, N'Green', N'Latz')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (88, 57, 2, N'Goldenrod', N'Meejo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (89, 24, 7, N'Indigo', N'Eare')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (90, 99, 10, N'Khaki', N'Skyndu')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (91, 64, 10, N'Maroon', N'Vidoo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (92, 31, 5, N'Yellow', N'Riffpath')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (93, 29, 1, N'Turquoise', N'Yakidoo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (94, 18, 7, N'Puce', N'Jazzy')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (95, 86, 6, N'Blue', N'Kaymbo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (96, 88, 3, N'Pink', N'Yodel')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (97, 22, 8, N'Yellow', N'Gabvine')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (98, 21, 1, N'Puce', N'Jayo')
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (99, 41, 2, N'Red', N'Yakitri')
GO
INSERT [Edward].[Clothes] ([id], [IDseller], [idCategory], [des], [Name]) VALUES (100, 46, 10, N'Red', N'Eabox')
SET IDENTITY_INSERT [Edward].[Clothes] OFF
GO
SET IDENTITY_INSERT [Edward].[Clothes_Properties] ON 

INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (1, 53, N'S', 13, 33.86)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (2, 69, N'M', 54, 69.74)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (3, 19, N'M', 22, 931.34)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (4, 6, N'XL', 19, 476.92)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (5, 65, N'M', 21, 866.86)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (6, 6, N'2XL', 51, 20.75)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (7, 18, N'L', 2, 209.03)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (8, 50, N'S', 84, 757.49)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (9, 59, N'XS', 33, 189.3)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (10, 42, N'L', 77, 76.81)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (11, 94, N'XL', 41, 496.08)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (12, 33, N'S', 13, 756.11)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (13, 72, N'S', 34, 608.21)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (14, 98, N'XL', 98, 519.84)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (15, 84, N'M', 67, 463.43)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (16, 77, N'2XL', 30, 908.82)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (17, 96, N'2XL', 61, 948.49)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (18, 89, N'2XL', 58, 389.59)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (19, 50, N'M', 74, 209.11)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (20, 51, N'S', 69, 360.11)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (21, 47, N'3XL', 16, 238.43)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (22, 37, N'L', 61, 584.33)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (23, 99, N'S', 23, 876.85)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (24, 1, N'2XL', 91, 391.44)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (25, 19, N'XL', 72, 432.48)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (26, 44, N'2XL', 76, 893.11)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (27, 89, N'M', 20, 965.2)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (28, 62, N'2XL', 4, 625)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (29, 27, N'XS', 72, 152.53)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (30, 35, N'M', 73, 465.74)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (31, 16, N'3XL', 94, 903.34)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (32, 81, N'XL', 86, 668.09)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (33, 79, N'L', 55, 412.16)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (34, 71, N'L', 43, 904.82)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (35, 3, N'XL', 100, 810.97)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (36, 98, N'M', 10, 996.51)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (37, 14, N'XS', 6, 205.57)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (38, 50, N'L', 22, 224.22)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (39, 16, N'L', 60, 104.48)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (40, 13, N'2XL', 98, 797.33)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (41, 95, N'3XL', 67, 41.18)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (42, 37, N'2XL', 8, 998.84)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (43, 75, N'XS', 20, 880.78)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (44, 9, N'2XL', 73, 134.64)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (45, 33, N'XS', 53, 485.04)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (46, 14, N'S', 40, 83.94)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (47, 48, N'L', 47, 676.63)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (48, 42, N'L', 45, 802.78)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (49, 37, N'M', 72, 133.27)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (50, 77, N'XL', 28, 693.54)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (51, 32, N'M', 52, 227.13)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (52, 34, N'XS', 97, 32.99)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (53, 44, N'XL', 74, 337.71)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (54, 79, N'L', 90, 405.3)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (55, 5, N'XS', 72, 553.71)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (56, 3, N'L', 10, 711.64)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (57, 57, N'2XL', 30, 850.18)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (58, 28, N'XS', 56, 764.57)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (59, 26, N'L', 88, 646)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (60, 100, N'M', 6, 814.04)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (61, 43, N'L', 81, 146.86)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (62, 89, N'XL', 63, 364.84)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (63, 17, N'XL', 97, 62.5)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (64, 70, N'S', 82, 148.52)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (65, 96, N'S', 95, 551.95)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (66, 55, N'L', 29, 771.43)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (67, 9, N'S', 88, 39.71)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (68, 27, N'S', 83, 916.82)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (69, 78, N'XL', 81, 747.57)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (70, 24, N'3XL', 99, 178.32)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (71, 49, N'XL', 68, 572.61)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (72, 72, N'XL', 83, 931.49)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (73, 58, N'3XL', 32, 48.51)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (74, 48, N'L', 60, 484.76)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (75, 31, N'3XL', 60, 93.41)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (76, 2, N'L', 48, 684.76)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (77, 5, N'XL', 40, 957.04)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (78, 45, N'M', 75, 185.76)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (79, 43, N'XS', 68, 457.62)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (80, 71, N'XS', 84, 900.84)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (81, 44, N'L', 58, 68.72)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (82, 99, N'S', 100, 516.59)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (83, 77, N'S', 70, 841.87)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (84, 12, N'S', 9, 615.98)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (85, 46, N'L', 85, 155.67)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (86, 94, N'2XL', 47, 263.31)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (87, 54, N'XL', 29, 644.7)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (88, 62, N'XL', 79, 939.35)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (89, 49, N'3XL', 81, 57.3)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (90, 37, N'S', 57, 671.2)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (91, 93, N'XL', 94, 667.88)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (92, 32, N'XS', 62, 609.52)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (93, 8, N'3XL', 37, 579.22)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (94, 2, N'L', 21, 957.43)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (95, 52, N'2XL', 62, 485.34)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (96, 60, N'2XL', 67, 844.1)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (97, 85, N'M', 47, 109.32)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (98, 82, N'3XL', 57, 136)
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (99, 75, N'XL', 21, 337.58)
GO
INSERT [Edward].[Clothes_Properties] ([ID], [IDClothes], [size], [Quantily], [Price]) VALUES (100, 91, N'M', 73, 143.3)
SET IDENTITY_INSERT [Edward].[Clothes_Properties] OFF
GO
SET IDENTITY_INSERT [Edward].[Favorites] ON 

INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (1, 28, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (2, 24, 2)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (3, 40, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (4, 8, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (5, 86, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (6, 64, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (7, 57, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (8, 37, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (9, 32, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (10, 83, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (11, 61, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (12, 13, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (13, 96, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (14, 83, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (15, 55, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (16, 33, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (17, 18, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (18, 9, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (19, 7, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (20, 79, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (21, 96, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (22, 27, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (23, 90, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (24, 21, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (25, 100, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (26, 89, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (27, 77, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (28, 15, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (29, 95, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (30, 47, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (31, 93, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (32, 62, 2)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (33, 4, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (34, 78, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (35, 55, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (36, 87, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (37, 7, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (38, 55, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (39, 4, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (40, 39, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (41, 84, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (42, 12, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (43, 36, 2)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (44, 92, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (45, 57, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (46, 40, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (47, 15, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (48, 87, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (49, 96, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (50, 55, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (51, 62, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (52, 55, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (53, 40, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (54, 86, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (55, 10, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (56, 66, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (57, 27, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (58, 29, 2)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (59, 69, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (60, 5, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (61, 25, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (62, 46, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (63, 66, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (64, 52, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (65, 32, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (66, 42, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (67, 25, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (68, 97, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (69, 29, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (70, 73, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (71, 58, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (72, 35, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (73, 59, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (74, 7, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (75, 32, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (76, 21, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (77, 31, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (78, 3, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (79, 14, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (80, 87, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (81, 58, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (82, 75, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (83, 30, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (84, 100, 2)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (85, 91, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (86, 58, 2)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (87, 91, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (88, 69, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (89, 84, 1)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (90, 100, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (91, 5, 7)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (92, 16, 10)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (93, 15, 4)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (94, 70, 9)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (95, 35, 8)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (96, 59, 6)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (97, 37, 3)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (98, 35, 5)
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (99, 70, 2)
GO
INSERT [Edward].[Favorites] ([ID], [IDClothes], [IDUser]) VALUES (100, 34, 10)
SET IDENTITY_INSERT [Edward].[Favorites] OFF
GO
SET IDENTITY_INSERT [Edward].[ImgUrls] ON 

INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (1, 52, N'http://dummyimage.com/161x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (2, 64, N'http://dummyimage.com/129x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (3, 18, N'http://dummyimage.com/160x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (4, 99, N'http://dummyimage.com/169x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (5, 98, N'http://dummyimage.com/118x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (6, 60, N'http://dummyimage.com/168x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (7, 100, N'http://dummyimage.com/161x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (8, 8, N'http://dummyimage.com/104x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (9, 34, N'http://dummyimage.com/185x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (10, 48, N'http://dummyimage.com/172x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (11, 66, N'http://dummyimage.com/236x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (12, 87, N'http://dummyimage.com/168x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (13, 30, N'http://dummyimage.com/184x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (14, 2, N'http://dummyimage.com/172x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (15, 31, N'http://dummyimage.com/231x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (16, 69, N'http://dummyimage.com/188x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (17, 33, N'http://dummyimage.com/200x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (18, 25, N'http://dummyimage.com/112x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (19, 67, N'http://dummyimage.com/243x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (20, 97, N'http://dummyimage.com/211x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (21, 100, N'http://dummyimage.com/210x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (22, 22, N'http://dummyimage.com/168x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (23, 70, N'http://dummyimage.com/113x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (24, 46, N'http://dummyimage.com/110x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (25, 74, N'http://dummyimage.com/249x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (26, 67, N'http://dummyimage.com/177x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (27, 88, N'http://dummyimage.com/139x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (28, 51, N'http://dummyimage.com/202x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (29, 58, N'http://dummyimage.com/183x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (30, 7, N'http://dummyimage.com/146x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (31, 91, N'http://dummyimage.com/208x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (32, 31, N'http://dummyimage.com/158x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (33, 63, N'http://dummyimage.com/199x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (34, 4, N'http://dummyimage.com/202x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (35, 94, N'http://dummyimage.com/164x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (36, 65, N'http://dummyimage.com/245x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (37, 10, N'http://dummyimage.com/210x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (38, 41, N'http://dummyimage.com/157x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (39, 88, N'http://dummyimage.com/136x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (40, 38, N'http://dummyimage.com/180x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (41, 61, N'http://dummyimage.com/118x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (42, 88, N'http://dummyimage.com/215x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (43, 48, N'http://dummyimage.com/135x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (44, 80, N'http://dummyimage.com/103x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (45, 67, N'http://dummyimage.com/182x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (46, 79, N'http://dummyimage.com/124x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (47, 65, N'http://dummyimage.com/105x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (48, 28, N'http://dummyimage.com/117x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (49, 29, N'http://dummyimage.com/130x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (50, 18, N'http://dummyimage.com/225x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (51, 31, N'http://dummyimage.com/240x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (52, 23, N'http://dummyimage.com/234x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (53, 24, N'http://dummyimage.com/176x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (54, 27, N'http://dummyimage.com/131x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (55, 50, N'http://dummyimage.com/215x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (56, 86, N'http://dummyimage.com/181x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (57, 50, N'http://dummyimage.com/150x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (58, 58, N'http://dummyimage.com/104x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (59, 77, N'http://dummyimage.com/196x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (60, 95, N'http://dummyimage.com/177x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (61, 42, N'http://dummyimage.com/162x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (62, 22, N'http://dummyimage.com/136x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (63, 58, N'http://dummyimage.com/144x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (64, 33, N'http://dummyimage.com/183x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (65, 93, N'http://dummyimage.com/232x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (66, 51, N'http://dummyimage.com/160x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (67, 10, N'http://dummyimage.com/154x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (68, 28, N'http://dummyimage.com/178x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (69, 62, N'http://dummyimage.com/214x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (70, 84, N'http://dummyimage.com/158x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (71, 26, N'http://dummyimage.com/186x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (72, 40, N'http://dummyimage.com/207x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (73, 88, N'http://dummyimage.com/127x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (74, 89, N'http://dummyimage.com/217x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (75, 11, N'http://dummyimage.com/184x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (76, 100, N'http://dummyimage.com/108x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (77, 13, N'http://dummyimage.com/242x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (78, 75, N'http://dummyimage.com/132x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (79, 66, N'http://dummyimage.com/180x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (80, 57, N'http://dummyimage.com/200x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (81, 84, N'http://dummyimage.com/148x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (82, 76, N'http://dummyimage.com/164x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (83, 57, N'http://dummyimage.com/245x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (84, 77, N'http://dummyimage.com/241x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (85, 95, N'http://dummyimage.com/205x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (86, 68, N'http://dummyimage.com/109x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (87, 7, N'http://dummyimage.com/203x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (88, 11, N'http://dummyimage.com/113x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (89, 30, N'http://dummyimage.com/227x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (90, 14, N'http://dummyimage.com/217x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (91, 38, N'http://dummyimage.com/128x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (92, 11, N'http://dummyimage.com/180x100.png/dddddd/000000')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (93, 57, N'http://dummyimage.com/209x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (94, 71, N'http://dummyimage.com/216x100.png/5fa2dd/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (95, 14, N'http://dummyimage.com/124x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (96, 51, N'http://dummyimage.com/196x100.png/ff4444/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (97, 63, N'http://dummyimage.com/155x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (98, 27, N'http://dummyimage.com/151x100.png/cc0000/ffffff')
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (99, 30, N'http://dummyimage.com/206x100.png/5fa2dd/ffffff')
GO
INSERT [Edward].[ImgUrls] ([ID], [IDClothes], [ImgUrl]) VALUES (100, 87, N'http://dummyimage.com/180x100.png/cc0000/ffffff')
SET IDENTITY_INSERT [Edward].[ImgUrls] OFF
GO
SET IDENTITY_INSERT [Edward].[People] ON 

INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (1, N'Marlee Rawlin', N'mrawlin0@diigo.com', N'p9Iqrr6FYEj0', N'+62 (319) 229-5062', 2, N'http://dummyimage.com/156x100.png/dddddd/000000', N'3 Spaight Crossing')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (2, N'Elora Tolland', N'etolland1@ted.com', N'17mIiEaN1YD', N'+55 (685) 307-7052', 1, N'http://dummyimage.com/243x100.png/dddddd/000000', N'45 Linden Lane')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (3, N'Jermayne Vivyan', N'jvivyan2@topsy.com', N'sDg3iTFaI', N'+48 (243) 683-0476', 3, N'http://dummyimage.com/215x100.png/5fa2dd/ffffff', N'757 Lotheville Court')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (4, N'Erick Blaydon', N'eblaydon3@census.gov', N'syHnOaQaC', N'+86 (732) 447-8783', 1, N'http://dummyimage.com/110x100.png/5fa2dd/ffffff', N'464 Johnson Hill')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (5, N'Dulciana Rawlence', N'drawlence4@cmu.edu', N'Vlpd6VxU', N'+7 (823) 184-3710', 2, N'http://dummyimage.com/103x100.png/cc0000/ffffff', N'23 Butterfield Point')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (6, N'Eustacia O''Quin', N'eoquin5@bing.com', N'114hfHuL', N'+86 (591) 865-7505', 3, N'http://dummyimage.com/199x100.png/dddddd/000000', N'28 Crowley Park')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (7, N'Dolorita Sarle', N'dsarle6@forbes.com', N'YeCZCAKx5B', N'+420 (478) 242-6936', 1, N'http://dummyimage.com/158x100.png/5fa2dd/ffffff', N'0 Gina Way')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (8, N'Ryan Orrow', N'rorrow7@omniture.com', N's5ugDdi2t', N'+502 (552) 493-1745', 1, N'http://dummyimage.com/136x100.png/dddddd/000000', N'39 Kropf Crossing')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (9, N'Spike Rickesies', N'srickesies8@mit.edu', N'ww6BSXHxuCFX', N'+86 (403) 445-6678', 1, N'http://dummyimage.com/105x100.png/5fa2dd/ffffff', N'8 Eggendart Lane')
INSERT [Edward].[People] ([ID], [Name], [Mail], [Password], [PhoneNumber], [Role], [img], [Address]) VALUES (10, N'Jorrie Liddy', N'jliddy9@accuweather.com', N'R3wZENfsJ', N'+1 (387) 791-2791', 3, N'http://dummyimage.com/203x100.png/dddddd/000000', N'3 Pleasure Way')
SET IDENTITY_INSERT [Edward].[People] OFF
GO
SET IDENTITY_INSERT [Edward].[Voucher] ON 

INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (1, 7, 76)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (2, 2, 85)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (3, 3, 46)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (4, 1, 61)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (5, 8, 7)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (6, 8, 76)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (7, 3, 10)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (8, 6, 19)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (9, 10, 65)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (10, 7, 9)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (11, 3, 40)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (12, 7, 44)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (13, 9, 16)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (14, 4, 5)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (15, 1, 31)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (16, 8, 56)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (17, 3, 42)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (18, 10, 17)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (19, 5, 61)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (20, 9, 99)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (21, 5, 27)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (22, 10, 35)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (23, 6, 96)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (24, 4, 3)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (25, 7, 24)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (26, 1, 8)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (27, 6, 50)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (28, 10, 40)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (29, 4, 11)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (30, 7, 2)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (31, 9, 87)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (32, 5, 9)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (33, 6, 42)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (34, 2, 32)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (35, 8, 4)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (36, 9, 7)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (37, 5, 87)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (38, 1, 46)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (39, 2, 34)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (40, 10, 55)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (41, 4, 6)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (42, 6, 85)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (43, 8, 16)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (44, 9, 49)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (45, 5, 80)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (46, 6, 86)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (47, 9, 55)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (48, 1, 71)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (49, 7, 19)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (50, 10, 19)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (51, 9, 26)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (52, 8, 76)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (53, 4, 2)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (54, 3, 92)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (55, 2, 70)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (56, 1, 31)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (57, 5, 50)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (58, 4, 14)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (59, 9, 84)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (60, 6, 7)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (61, 6, 85)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (62, 4, 61)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (63, 8, 9)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (64, 1, 83)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (65, 2, 94)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (66, 6, 43)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (67, 1, 95)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (68, 8, 91)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (69, 3, 91)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (70, 5, 31)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (71, 4, 11)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (72, 1, 15)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (73, 6, 27)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (74, 3, 12)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (75, 2, 22)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (76, 9, 61)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (77, 8, 40)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (78, 2, 71)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (79, 7, 3)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (80, 1, 40)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (81, 9, 31)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (82, 3, 84)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (83, 2, 38)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (84, 5, 27)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (85, 7, 71)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (86, 6, 11)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (87, 7, 56)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (88, 10, 51)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (89, 8, 95)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (90, 4, 96)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (91, 8, 33)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (92, 7, 93)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (93, 3, 88)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (94, 5, 10)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (95, 9, 92)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (96, 4, 96)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (97, 7, 34)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (98, 6, 46)
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (99, 9, 32)
GO
INSERT [Edward].[Voucher] ([ID], [IDSeller], [ratio]) VALUES (100, 10, 96)
SET IDENTITY_INSERT [Edward].[Voucher] OFF
GO
ALTER TABLE [Edward].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_People] FOREIGN KEY([IDSeller])
REFERENCES [Edward].[People] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[Bill] CHECK CONSTRAINT [FK_Bill_People]
GO
ALTER TABLE [Edward].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Voucher] FOREIGN KEY([IDvoucher])
REFERENCES [Edward].[Voucher] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[Bill] CHECK CONSTRAINT [FK_Bill_Voucher]
GO
ALTER TABLE [Edward].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Bill] FOREIGN KEY([IDBill])
REFERENCES [Edward].[Bill] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Bill]
GO
ALTER TABLE [Edward].[BillDetail]  WITH CHECK ADD  CONSTRAINT [FK_BillDetail_Clothes_Properties] FOREIGN KEY([IDClotheProperties])
REFERENCES [Edward].[Clothes_Properties] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[BillDetail] CHECK CONSTRAINT [FK_BillDetail_Clothes_Properties]
GO
ALTER TABLE [Edward].[Clothes]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Category] FOREIGN KEY([idCategory])
REFERENCES [Edward].[Category] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[Clothes] CHECK CONSTRAINT [FK_Clothes_Category]
GO
ALTER TABLE [Edward].[Clothes_Properties]  WITH CHECK ADD  CONSTRAINT [FK_Clothes_Properties_Clothes] FOREIGN KEY([IDClothes])
REFERENCES [Edward].[Clothes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[Clothes_Properties] CHECK CONSTRAINT [FK_Clothes_Properties_Clothes]
GO
ALTER TABLE [Edward].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_Clothes] FOREIGN KEY([IDClothes])
REFERENCES [Edward].[Clothes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[Favorites] CHECK CONSTRAINT [FK_Favorites_Clothes]
GO
ALTER TABLE [Edward].[Favorites]  WITH CHECK ADD  CONSTRAINT [FK_Favorites_People] FOREIGN KEY([IDUser])
REFERENCES [Edward].[People] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[Favorites] CHECK CONSTRAINT [FK_Favorites_People]
GO
ALTER TABLE [Edward].[ImgUrls]  WITH CHECK ADD  CONSTRAINT [FK_ImgUrls_Clothes] FOREIGN KEY([IDClothes])
REFERENCES [Edward].[Clothes] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [Edward].[ImgUrls] CHECK CONSTRAINT [FK_ImgUrls_Clothes]
GO
USE [master]
GO
ALTER DATABASE [EdwardEcomerce] SET  READ_WRITE 
GO
