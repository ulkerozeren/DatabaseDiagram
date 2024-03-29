USE [master]
GO
/****** Object:  Database [BuyIt]    Script Date: 24.07.2019 21:17:35 ******/
CREATE DATABASE [BuyIt]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BuyIt', FILENAME = N'C:\Users\ulker.ozeren\BuyIt.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BuyIt_log', FILENAME = N'C:\Users\ulker.ozeren\BuyIt_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BuyIt] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BuyIt].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BuyIt] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BuyIt] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BuyIt] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BuyIt] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BuyIt] SET ARITHABORT OFF 
GO
ALTER DATABASE [BuyIt] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BuyIt] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BuyIt] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BuyIt] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BuyIt] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BuyIt] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BuyIt] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BuyIt] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BuyIt] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BuyIt] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BuyIt] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BuyIt] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BuyIt] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BuyIt] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BuyIt] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BuyIt] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BuyIt] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BuyIt] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BuyIt] SET  MULTI_USER 
GO
ALTER DATABASE [BuyIt] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BuyIt] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BuyIt] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BuyIt] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BuyIt] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BuyIt] SET QUERY_STORE = OFF
GO
USE [BuyIt]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [BuyIt]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Addresses](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AddressDescription] [nchar](250) NOT NULL,
	[AddressType] [int] NOT NULL,
	[ObjectState] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AnnouncementPreferences]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AnnouncementPreferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](10) NOT NULL,
 CONSTRAINT [PK_AnnouncementPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nchar](50) NOT NULL,
	[Description] [nchar](250) NOT NULL,
	[ObjectState] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsActive] [int] NOT NULL,
	[ParentId] [int] NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerAnnouncemnetPreferences]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerAnnouncemnetPreferences](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[AnnouncementPreferenceId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerAnnouncemnetPreferences] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CustomerDiscountCoupons]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerDiscountCoupons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[DiscountCouponsId] [int] NOT NULL,
 CONSTRAINT [PK_CustomerDiscountCoupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](50) NOT NULL,
	[Surname] [nchar](50) NOT NULL,
	[TCKN] [bigint] NOT NULL,
	[Email] [nchar](10) NOT NULL,
	[MobilePhone] [nchar](20) NOT NULL,
	[RoleId] [int] NOT NULL,
	[IsActive] [int] NOT NULL,
	[ObjectState] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Departments]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Departments](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Departments] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DiscountCoupons]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DiscountCoupons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](50) NOT NULL,
 CONSTRAINT [PK_DiscountCoupons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nchar](20) NOT NULL,
	[LastName] [nchar](20) NOT NULL,
	[TitleId] [int] NOT NULL,
	[BirtDate] [datetime] NOT NULL,
	[HireDate] [datetime] NOT NULL,
	[Address] [nchar](60) NOT NULL,
	[City] [nchar](15) NOT NULL,
	[PostalCode] [nchar](10) NOT NULL,
	[Country] [nchar](15) NOT NULL,
	[TCKN] [bigint] NOT NULL,
	[Email] [nchar](10) NOT NULL,
	[MobilePhone] [nchar](20) NOT NULL,
	[DepartmentId] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[OrderDate] [datetime] NOT NULL,
	[ShippedDate] [datetime] NOT NULL,
	[ShipAddress] [nchar](100) NOT NULL,
	[ShipCountry] [nchar](15) NOT NULL,
	[ShipCity] [nchar](15) NOT NULL,
	[ShipPostalCode] [nchar](10) NOT NULL,
	[ObjectState] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsActive] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[ProductName] [nchar](100) NOT NULL,
	[UnitPrice] [money] NOT NULL,
	[UnitsOfStok] [int] NOT NULL,
	[ObjectState] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[IsActive] [int] NOT NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Titles]    Script Date: 24.07.2019 21:17:35 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Titles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Description] [nchar](50) NOT NULL,
 CONSTRAINT [PK_Titles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Addresses_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Addresses] CHECK CONSTRAINT [FK_Addresses_Customers]
GO
ALTER TABLE [dbo].[CustomerAnnouncemnetPreferences]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAnnouncemnetPreferences_AnnouncementPreferences] FOREIGN KEY([AnnouncementPreferenceId])
REFERENCES [dbo].[AnnouncementPreferences] ([Id])
GO
ALTER TABLE [dbo].[CustomerAnnouncemnetPreferences] CHECK CONSTRAINT [FK_CustomerAnnouncemnetPreferences_AnnouncementPreferences]
GO
ALTER TABLE [dbo].[CustomerAnnouncemnetPreferences]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAnnouncemnetPreferences_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[CustomerAnnouncemnetPreferences] CHECK CONSTRAINT [FK_CustomerAnnouncemnetPreferences_Customers]
GO
ALTER TABLE [dbo].[CustomerDiscountCoupons]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDiscountCoupons_Customers] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[CustomerDiscountCoupons] CHECK CONSTRAINT [FK_CustomerDiscountCoupons_Customers]
GO
ALTER TABLE [dbo].[CustomerDiscountCoupons]  WITH CHECK ADD  CONSTRAINT [FK_CustomerDiscountCoupons_DiscountCoupons] FOREIGN KEY([DiscountCouponsId])
REFERENCES [dbo].[DiscountCoupons] ([Id])
GO
ALTER TABLE [dbo].[CustomerDiscountCoupons] CHECK CONSTRAINT [FK_CustomerDiscountCoupons_DiscountCoupons]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Departments] FOREIGN KEY([DepartmentId])
REFERENCES [dbo].[Departments] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Departments]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Titles] FOREIGN KEY([Id])
REFERENCES [dbo].[Titles] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Titles]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([Id])
REFERENCES [dbo].[Customers] ([Id])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
USE [master]
GO
ALTER DATABASE [BuyIt] SET  READ_WRITE 
GO
