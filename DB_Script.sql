USE [master]
GO
/****** Object:  Database [ReactNetTest]    Script Date: 11/14/2021 2:20:31 PM ******/
CREATE DATABASE [ReactNetTest]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ReactNetTest', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReactNetTest.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ReactNetTest_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\ReactNetTest_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [ReactNetTest] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ReactNetTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ReactNetTest] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ReactNetTest] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ReactNetTest] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ReactNetTest] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ReactNetTest] SET ARITHABORT OFF 
GO
ALTER DATABASE [ReactNetTest] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ReactNetTest] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ReactNetTest] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ReactNetTest] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ReactNetTest] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ReactNetTest] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ReactNetTest] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ReactNetTest] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ReactNetTest] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ReactNetTest] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ReactNetTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ReactNetTest] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ReactNetTest] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ReactNetTest] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ReactNetTest] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ReactNetTest] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ReactNetTest] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ReactNetTest] SET RECOVERY FULL 
GO
ALTER DATABASE [ReactNetTest] SET  MULTI_USER 
GO
ALTER DATABASE [ReactNetTest] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ReactNetTest] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ReactNetTest] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ReactNetTest] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ReactNetTest] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [ReactNetTest] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'ReactNetTest', N'ON'
GO
ALTER DATABASE [ReactNetTest] SET QUERY_STORE = OFF
GO
USE [ReactNetTest]
GO
/****** Object:  User [WebAPITest]    Script Date: 11/14/2021 2:20:31 PM ******/
CREATE USER [WebAPITest] FOR LOGIN [WebAPITest] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [WebAPITest]
GO
/****** Object:  UserDefinedTableType [dbo].[OrdersTempTable]    Script Date: 11/14/2021 2:20:31 PM ******/
CREATE TYPE [dbo].[OrdersTempTable] AS TABLE(
	[OrderId] [nvarchar](300) NULL,
	[goodId] [int] NULL,
	[status] [nvarchar](100) NULL,
	[address] [nvarchar](300) NULL,
	[CartNumber] [nvarchar](300) NULL,
	[Quantity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[test]    Script Date: 11/14/2021 2:20:31 PM ******/
CREATE TYPE [dbo].[test] AS TABLE(
	[Id] [int] NOT NULL,
	[Name] [nvarchar](128) NULL
)
GO
/****** Object:  Table [dbo].[Good]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Good](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[ImgSrc] [nvarchar](300) NULL,
	[Price] [decimal](12, 2) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderLog]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderLog](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[orderId] [nvarchar](300) NULL,
	[message] [nvarchar](max) NULL,
	[logDate] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [nvarchar](300) NULL,
	[goodId] [nvarchar](300) NULL,
	[status] [nvarchar](200) NULL,
	[address] [nvarchar](300) NULL,
	[CartNumber] [nvarchar](200) NULL,
	[Quantity] [int] NULL,
	[orderDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserProfile](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](300) NULL,
	[RoleId] [int] NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Good] ON 

INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (1, N'Рубашка', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hf4/ha3/34200617353246/mtrend-art40100-00-16534-belyj-xxl-101561790-1.jpg', CAST(11000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (2, N'IPhone 12', N'https://media.wired.com/photos/5b9a9073359b1371926e43dd/master/pass/iPhoneSE-617939746.jpg', CAST(521000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (4, N'Samsung Fold', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/ha0/hd9/44393575251998/samsung-galaxy-z-fold-3-12-256gb-cernyj-102033284-1.jpg', CAST(700000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (5, N'Samsung Fold 3', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h80/h16/32224142557214/samsung-galaxy-fold-12-512gb-cernyj-1005284-1.jpg', CAST(1000000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (6, N'Холодильник Indesit ES 18 белый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h1e/h17/32035984900126/indesit-es-18-belyj-2701642-1.jpg', CAST(130000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (7, N'Холодильник Midea MDRS619FGF25 серебристый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hfc/h78/34018679750686/midea-mdrs619fgf25-serebristyj-101752878-1.jpg', CAST(255000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (8, N'Чехол Smart Family CHH52M С голубыми цветами фламинго М', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hf4/h76/34354403934238/smart-family-chh52m-s-golubymi-cvetami-flamingo-m-101351722-1-Container.jpg', CAST(7800.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (9, N'Джинсы Colin’s CL1053010 синие 28/L30', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hb2/h85/34166888693790/colin-s-cl1053010-sinie-28-l30-101624120-1.jpg', CAST(6950.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (10, N'Электрогриль Delonghi MultiGrill CGH 1030D серебристый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h38/hd7/31681212252190/delonghi-multigrill-cgh-1030d-silver-12600018-1.jpg', CAST(150000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (11, N'Стиральная машина LG F2M5HS6S серебристый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hf5/hc9/31588629643294/lg-f2m5hs6s-serebristyj-3601448-1.jpg', CAST(174400.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (12, N'Пылесос Samsung VCC4520S3R/XEV красный', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h13/hc2/31592496726046/samsung-vcc4520s3r-xev-krasnyj-3700926-1.jpg', CAST(31669.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (13, N'Пылесос Karcher VC 3 Premium белый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h52/h21/31633788436510/karcher-vc-3-premium-belyj-3700709-1.jpg', CAST(52799.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (14, N'Настольная электропечь ASEL TT 23 красный', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h71/h07/31509475164190/asel-tt-23-krasnyj-2500566-1.jpg', CAST(20500.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (15, N'Кухонный комбайн Thermomix TM6 белый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/hd5/ha5/33399277027358/thermomix-tm6-belyj-101073636-1.jpg', CAST(795000.00 AS Decimal(12, 2)))
INSERT [dbo].[Good] ([Id], [Name], [ImgSrc], [Price]) VALUES (16, N'Утюг Polaris PIR 2430K черный-серый', N'https://resources.cdn-kaspi.kz/shop/medias/sys_master/images/images/h91/h70/34566191087646/polaris-pir-2430k-cernyj-seryj-101689537-1.jpg', CAST(13322.00 AS Decimal(12, 2)))
SET IDENTITY_INSERT [dbo].[Good] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderLog] ON 

INSERT [dbo].[OrderLog] ([Id], [orderId], [message], [logDate]) VALUES (3, N'2797fdff-e4bf-4d87-8fa0-d40f5a000b26', N'Добавил первый IPhone 12 общая сумма 521000 
 Добавил еще один IPhone 12стало (2) общая сумма 1042000 
 Добавил первый Рубашка общая сумма 1053000 
 Добавил еще один Рубашкастало (2) общая сумма 1064000 
 Добавил первый Холодильник Indesit ES 18 белый общая сумма 1194000 
 Добавил еще один Холодильник Indesit ES 18 белыйстало (2) общая сумма 1324000 
 Добавил еще один Холодильник Indesit ES 18 белыйстало (3) общая сумма 1454000 
 Добавил еще один Холодильник Indesit ES 18 белыйстало (4) общая сумма 1584000 
 Удалил Холодильник Indesit ES 18 белый осталось(3) общая сумма 1454000 
 Добавил первый Samsung Fold 3 общая сумма 2454000 
 Добавил еще один Samsung Fold 3стало (2) общая сумма 3454000 
 Добавил еще один Samsung Fold 3стало (3) общая сумма 4454000 
 Удалил Samsung Fold 3 осталось(2) общая сумма 3454000 
 Удалил Samsung Fold 3 осталось(1) общая сумма 2454000 
 Добавил первый Джинсы Colin’s CL1053010 синие 28/L30 общая сумма 2460950 
 Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (2) общая сумма 2467900 
 Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (3) общая сумма 2474850 
 Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (4) общая сумма 2481800 
 Удалил Джинсы Colin’s CL1053010 синие 28/L30 осталось(3) общая сумма 2474850 
 Удалил Джинсы Colin’s CL1053010 синие 28/L30 осталось(2) общая сумма 2467900 
 Удалил Джинсы Colin’s CL1053010 синие 28/L30 осталось(1) общая сумма 2460950 
 ', CAST(N'2021-11-13T14:43:12.657' AS DateTime))
INSERT [dbo].[OrderLog] ([Id], [orderId], [message], [logDate]) VALUES (4, N'b3399503-3d2c-4c16-81a5-b8ca1db09557', N'Добавил первый Samsung Fold общая сумма 700000 
 <br/>Добавил еще один Samsung Foldстало (2) общая сумма 1400000 
 <br/>Добавил первый IPhone 12 общая сумма 1921000 
 <br/>Добавил еще один IPhone 12стало (2) общая сумма 2442000 
 <br/>Добавил еще один IPhone 12стало (3) общая сумма 2963000 
 <br/>Удалил IPhone 12 осталось(2) общая сумма 2442000 
 <br/>Добавил первый Рубашка общая сумма 2453000 
 <br/>Добавил еще один Рубашкастало (2) общая сумма 2464000 
 <br/>Добавил еще один Рубашкастало (3) общая сумма 2475000 
 <br/>Добавил первый Samsung Fold 3 общая сумма 3475000 
 <br/>Добавил еще один Samsung Fold 3стало (2) общая сумма 4475000 
 <br/>Удалил Samsung Fold 3 осталось(1) общая сумма 3475000 
 <br/>Удалил единственный Samsung Fold 3 общая сумма 2475000 
 <br/>Добавил первый Samsung Fold 3 общая сумма 3475000 
 <br/>Добавил первый Джинсы Colin’s CL1053010 синие 28/L30 общая сумма 3481950 
 <br/>Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (2) общая сумма 3488900 
 <br/>Удалил Джинсы Colin’s CL1053010 синие 28/L30 осталось(1) общая сумма 3481950 
 <br/>Заполняет данные о клиенте <br/>отправлен на обработку к менеджеру', CAST(N'2021-11-13T15:25:43.697' AS DateTime))
INSERT [dbo].[OrderLog] ([Id], [orderId], [message], [logDate]) VALUES (5, N'b8fb1479-0258-49e9-a11c-43817f6790ae', N'Добавил первый IPhone 12 общая сумма 521000 
 <br>;Добавил еще один IPhone 12стало (2) общая сумма 1042000 
 <br>;Добавил еще один IPhone 12стало (3) общая сумма 1563000 
 <br>;Добавил первый Рубашка общая сумма 1574000 
 <br>;Добавил еще один Рубашкастало (2) общая сумма 1585000 
 <br>;Удалил Рубашка осталось(1) общая сумма 1574000 
 <br>;Добавил первый Джинсы Colin’s CL1053010 синие 28/L30 общая сумма 1580950 
 <br>;Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (2) общая сумма 1587900 
 <br>;Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (3) общая сумма 1594850 
 <br>;Удалил Джинсы Colin’s CL1053010 синие 28/L30 осталось(2) общая сумма 1587900 
 <br>;Добавил первый Чехол Smart Family CHH52M С голубыми цветами фламинго М общая сумма 1595700 
 <br>;Добавил еще один Чехол Smart Family CHH52M С голубыми цветами фламинго Мстало (2) общая сумма 1603500 
 <br>;Добавил еще один Чехол Smart Family CHH52M С голубыми цветами фламинго Мстало (3) общая сумма 1611300 
 <br>;Добавил еще один Чехол Smart Family CHH52M С голубыми цветами фламинго Мстало (4) общая сумма 1619100 
 <br>;Удалил Чехол Smart Family CHH52M С голубыми цветами фламинго М осталось(3) общая сумма 1611300 
 <br>;Удалил Чехол Smart Family CHH52M С голубыми цветами фламинго М осталось(2) общая сумма 1603500 
 <br>;Заполняет данные о клиенте <br>;отправлен на обработку к менеджеру', CAST(N'2021-11-13T15:28:35.170' AS DateTime))
INSERT [dbo].[OrderLog] ([Id], [orderId], [message], [logDate]) VALUES (6, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'Добавил первый Рубашка общая сумма 11000 
 <br>;Добавил еще один Рубашкастало (2) общая сумма 22000 
 <br>;Добавил первый IPhone 12 общая сумма 543000 
 <br>;Добавил еще один IPhone 12стало (2) общая сумма 1064000 
 <br>;Добавил еще один IPhone 12стало (3) общая сумма 1585000 
 <br>;Удалил IPhone 12 осталось(2) общая сумма 1064000 
 <br>;Добавил первый Samsung Fold общая сумма 1764000 
 <br>;Добавил еще один Samsung Foldстало (2) общая сумма 2464000 
 <br>;Добавил еще один Samsung Foldстало (3) общая сумма 3164000 
 <br>;Добавил еще один Samsung Foldстало (4) общая сумма 3864000 
 <br>;Добавил первый Холодильник Midea MDRS619FGF25 серебристый общая сумма 4119000 
 <br>;Добавил еще один Холодильник Midea MDRS619FGF25 серебристыйстало (2) общая сумма 4374000 
 <br>;Добавил еще один Холодильник Midea MDRS619FGF25 серебристыйстало (3) общая сумма 4629000 
 <br>;Добавил еще один Холодильник Midea MDRS619FGF25 серебристыйстало (4) общая сумма 4884000 
 <br>;Удалил Холодильник Midea MDRS619FGF25 серебристый осталось(3) общая сумма 4629000 
 <br>;Удалил Холодильник Midea MDRS619FGF25 серебристый осталось(2) общая сумма 4374000 
 <br>;Добавил первый Джинсы Colin’s CL1053010 синие 28/L30 общая сумма 4380950 
 <br>;Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (2) общая сумма 4387900 
 <br>;Добавил первый Чехол Smart Family CHH52M С голубыми цветами фламинго М общая сумма 4395700 
 <br>;Добавил еще один Чехол Smart Family CHH52M С голубыми цветами фламинго Мстало (2) общая сумма 4403500 
 <br>;Добавил еще один Чехол Smart Family CHH52M С голубыми цветами фламинго Мстало (3) общая сумма 4411300 
 <br>;Заполняет данные о клиенте <br>;отправлен на обработку к менеджеру', CAST(N'2021-11-13T16:18:13.333' AS DateTime))
INSERT [dbo].[OrderLog] ([Id], [orderId], [message], [logDate]) VALUES (7, N'53d82da5-3b07-44f0-8ea4-c64b59ffe57f', N'Добавил первый IPhone 12 общая сумма 521000 
 <br>;Добавил еще один IPhone 12стало (2) общая сумма 1042000 
 <br>;Добавил первый Samsung Fold 3 общая сумма 2042000 
 <br>;Добавил еще один Samsung Fold 3стало (2) общая сумма 3042000 
 <br>;Добавил первый Холодильник Indesit ES 18 белый общая сумма 3172000 
 <br>;Добавил еще один Холодильник Indesit ES 18 белыйстало (2) общая сумма 3302000 
 <br>;Добавил еще один Холодильник Indesit ES 18 белыйстало (3) общая сумма 3432000 
 <br>;Добавил первый Холодильник Midea MDRS619FGF25 серебристый общая сумма 3687000 
 <br>;Добавил еще один Холодильник Midea MDRS619FGF25 серебристыйстало (2) общая сумма 3942000 
 <br>;Удалил Холодильник Midea MDRS619FGF25 серебристый осталось(1) общая сумма 3687000 
 <br>;Заполняет данные о клиенте <br>;отправлен на обработку к менеджеру', CAST(N'2021-11-14T09:39:03.337' AS DateTime))
INSERT [dbo].[OrderLog] ([Id], [orderId], [message], [logDate]) VALUES (8, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'Добавил первый Кухонный комбайн Thermomix TM6 белый общая сумма 795000 
 <br>;Добавил еще один Кухонный комбайн Thermomix TM6 белыйстало (2) общая сумма 1590000 
 <br>;Удалил Кухонный комбайн Thermomix TM6 белый осталось(1) общая сумма 795000 
 <br>;Добавил первый Пылесос Samsung VCC4520S3R/XEV красный общая сумма 826669 
 <br>;Добавил еще один Пылесос Samsung VCC4520S3R/XEV красныйстало (2) общая сумма 858338 
 <br>;Удалил Пылесос Samsung VCC4520S3R/XEV красный осталось(1) общая сумма 826669 
 <br>;Добавил первый Стиральная машина LG F2M5HS6S серебристый общая сумма 1001069 
 <br>;Добавил первый Джинсы Colin’s CL1053010 синие 28/L30 общая сумма 1008019 
 <br>;Добавил еще один Джинсы Colin’s CL1053010 синие 28/L30стало (2) общая сумма 1014969 
 <br>;Добавил первый Чехол Smart Family CHH52M С голубыми цветами фламинго М общая сумма 1022769 
 <br>;Добавил еще один Чехол Smart Family CHH52M С голубыми цветами фламинго Мстало (2) общая сумма 1030569 
 <br>;Добавил первый IPhone 12 общая сумма 1551569 
 <br>;Добавил первый Рубашка общая сумма 1562569 
 <br>;Добавил еще один Рубашкастало (2) общая сумма 1573569 
 <br>;Добавил еще один Рубашкастало (3) общая сумма 1584569 
 <br>;Заполняет данные о клиенте <br>;отправлен на обработку к менеджеру', CAST(N'2021-11-14T13:57:41.180' AS DateTime))
SET IDENTITY_INSERT [dbo].[OrderLog] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 

INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (75, N'b3399503-3d2c-4c16-81a5-b8ca1db09557', N'4', N'SUCCESS', N'werqw', N'123412341234', 2, CAST(N'2021-11-13T15:25:43.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (76, N'b3399503-3d2c-4c16-81a5-b8ca1db09557', N'2', N'SUCCESS', N'werqw', N'123412341234', 2, CAST(N'2021-11-13T15:25:43.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (77, N'b3399503-3d2c-4c16-81a5-b8ca1db09557', N'1', N'SUCCESS', N'werqw', N'123412341234', 3, CAST(N'2021-11-13T15:25:43.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (78, N'b3399503-3d2c-4c16-81a5-b8ca1db09557', N'5', N'SUCCESS', N'werqw', N'123412341234', 1, CAST(N'2021-11-13T15:25:43.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (79, N'b3399503-3d2c-4c16-81a5-b8ca1db09557', N'9', N'SUCCESS', N'werqw', N'123412341234', 1, CAST(N'2021-11-13T15:25:43.683' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (80, N'b8fb1479-0258-49e9-a11c-43817f6790ae', N'2', N'PROCEED', N'qrwerqwr', N'123412344234', 3, CAST(N'2021-11-13T15:28:35.170' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (81, N'b8fb1479-0258-49e9-a11c-43817f6790ae', N'1', N'PROCEED', N'qrwerqwr', N'123412344234', 1, CAST(N'2021-11-13T15:28:35.170' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (82, N'b8fb1479-0258-49e9-a11c-43817f6790ae', N'9', N'PROCEED', N'qrwerqwr', N'123412344234', 2, CAST(N'2021-11-13T15:28:35.170' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (83, N'b8fb1479-0258-49e9-a11c-43817f6790ae', N'8', N'PROCEED', N'qrwerqwr', N'123412344234', 2, CAST(N'2021-11-13T15:28:35.170' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (84, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'1', N'PROCEED', N'qwerqwer', N'123412341234', 2, CAST(N'2021-11-13T16:18:13.323' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (85, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'2', N'PROCEED', N'qwerqwer', N'123412341234', 2, CAST(N'2021-11-13T16:18:13.323' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (86, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'4', N'PROCEED', N'qwerqwer', N'123412341234', 4, CAST(N'2021-11-13T16:18:13.323' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (87, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'7', N'PROCEED', N'qwerqwer', N'123412341234', 2, CAST(N'2021-11-13T16:18:13.323' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (88, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'9', N'PROCEED', N'qwerqwer', N'123412341234', 2, CAST(N'2021-11-13T16:18:13.323' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (89, N'9bdb6d13-a983-4cff-8b5c-04897e56cfd7', N'8', N'PROCEED', N'qwerqwer', N'123412341234', 3, CAST(N'2021-11-13T16:18:13.323' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (94, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'15', N'SUCCESS', N'qerqw', N'12341234', 1, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (95, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'12', N'SUCCESS', N'qerqw', N'12341234', 1, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (96, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'11', N'SUCCESS', N'qerqw', N'12341234', 1, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (97, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'9', N'SUCCESS', N'qerqw', N'12341234', 2, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (98, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'8', N'SUCCESS', N'qerqw', N'12341234', 2, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (99, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'2', N'SUCCESS', N'qerqw', N'12341234', 1, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
INSERT [dbo].[Orders] ([Id], [OrderId], [goodId], [status], [address], [CartNumber], [Quantity], [orderDate]) VALUES (100, N'a76345c9-27f5-48e9-bc5b-ccc640b562ee', N'1', N'SUCCESS', N'qerqw', N'12341234', 3, CAST(N'2021-11-14T13:57:41.173' AS DateTime))
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleId], [RoleName]) VALUES (2, N'Менеджер')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[UserProfile] ON 

INSERT [dbo].[UserProfile] ([UserId], [Name], [RoleId]) VALUES (1, N'Админ', 2)
SET IDENTITY_INSERT [dbo].[UserProfile] OFF
GO
/****** Object:  StoredProcedure [dbo].[AddOrderLog]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[AddOrderLog]
       -- Add the parameters for the stored procedure here
       @OrderId nvarchar(300),
       @Message nvarchar(max)
AS
BEGIN
       insert into dbo.OrderLog
    (
      orderId,
      message,
      logDate
    )
    select @OrderId, @Message, GETDATE()
END
GO
/****** Object:  StoredProcedure [dbo].[p_addOrders]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[p_addOrders] 
	@OrdersTempTable OrdersTempTable readonly
AS
BEGIN
	insert into Orders (OrderId, address, status, CartNumber, goodId, Quantity, orderDate)
	select ott.OrderId, ott.address, ott.status, ott.CartNumber, ott.goodId, ott.Quantity, getDate() from @OrdersTempTable ott
END
GO
/****** Object:  StoredProcedure [dbo].[p_getOrderInfo]    Script Date: 11/14/2021 2:20:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[p_getOrderInfo] 
	@Id nvarchar(300)
AS
BEGIN
	select 
		OrderId, status, address, CartNumber, g.Name, Quantity, g.Price*Quantity commonPrice, orderDate, '' as logmessage
    from Orders o
		inner join Good g on g.Id = o.goodId
    where o.OrderId = @Id
    group by OrderId, status, address, CartNumber, orderDate, g.Price, Quantity, g.Name
	union
	select 
		orderId as OrderId, '' as status, '' as address, '' as CartNumber, '' as Name, 0 as Quantity, 0 as commonPrice, logDate as orderDate, message as logmessage
	from OrderLog where orderId = @Id
	order by orderDate
END
GO
USE [master]
GO
ALTER DATABASE [ReactNetTest] SET  READ_WRITE 
GO
