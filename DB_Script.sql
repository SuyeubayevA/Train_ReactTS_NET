USE [master]
GO
/****** Object:  Database [ReactNetTest]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  User [WebAPITest]    Script Date: 11/13/2021 3:33:05 PM ******/
CREATE USER [WebAPITest] FOR LOGIN [WebAPITest] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [WebAPITest]
GO
/****** Object:  UserDefinedTableType [dbo].[OrdersTempTable]    Script Date: 11/13/2021 3:33:05 PM ******/
CREATE TYPE [dbo].[OrdersTempTable] AS TABLE(
	[OrderId] [nvarchar](300) NULL,
	[goodId] [int] NULL,
	[status] [nvarchar](100) NULL,
	[address] [nvarchar](300) NULL,
	[CartNumber] [nvarchar](300) NULL,
	[Quantity] [int] NULL
)
GO
/****** Object:  UserDefinedTableType [dbo].[test]    Script Date: 11/13/2021 3:33:05 PM ******/
CREATE TYPE [dbo].[test] AS TABLE(
	[Id] [int] NOT NULL,
	[Name] [nvarchar](128) NULL
)
GO
/****** Object:  Table [dbo].[Good]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  Table [dbo].[OrderLog]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  Table [dbo].[Orders]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  Table [dbo].[Role]    Script Date: 11/13/2021 3:33:05 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleId] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserProfile]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[AddOrderLog]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[p_addOrders]    Script Date: 11/13/2021 3:33:05 PM ******/
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
/****** Object:  StoredProcedure [dbo].[p_getOrderInfo]    Script Date: 11/13/2021 3:33:05 PM ******/
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
