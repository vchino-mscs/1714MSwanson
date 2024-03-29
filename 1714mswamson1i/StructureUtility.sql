USE [master]
GO
/****** Object:  Database [Structure Utilities]    Script Date: 9/27/2019 5:09:39 PM ******/
CREATE DATABASE [Structure Utilities]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Structure Utilities', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Structure Utilities.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Structure Utilities_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Structure Utilities_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Structure Utilities] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Structure Utilities].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Structure Utilities] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Structure Utilities] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Structure Utilities] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Structure Utilities] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Structure Utilities] SET ARITHABORT OFF 
GO
ALTER DATABASE [Structure Utilities] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Structure Utilities] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Structure Utilities] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Structure Utilities] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Structure Utilities] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Structure Utilities] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Structure Utilities] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Structure Utilities] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Structure Utilities] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Structure Utilities] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Structure Utilities] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Structure Utilities] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Structure Utilities] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Structure Utilities] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Structure Utilities] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Structure Utilities] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Structure Utilities] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Structure Utilities] SET RECOVERY FULL 
GO
ALTER DATABASE [Structure Utilities] SET  MULTI_USER 
GO
ALTER DATABASE [Structure Utilities] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Structure Utilities] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Structure Utilities] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Structure Utilities] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Structure Utilities] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Structure Utilities', N'ON'
GO
ALTER DATABASE [Structure Utilities] SET QUERY_STORE = OFF
GO
USE [Structure Utilities]
GO
/****** Object:  Table [dbo].[Company]    Script Date: 9/27/2019 5:09:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Company](
	[CompanyId] [int] NOT NULL,
	[Adress] [nvarchar](50) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[City] [nvarchar](50) NOT NULL,
	[ZipCode] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Company] PRIMARY KEY CLUSTERED 
(
	[CompanyId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employee]    Script Date: 9/27/2019 5:09:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employee](
	[EmployeeId] [int] NOT NULL,
	[FirstName] [nvarchar](25) NOT NULL,
	[LastName] [nvarchar](25) NOT NULL,
	[HiringDate] [smalldatetime] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[Position] [nvarchar](25) NOT NULL,
	[HourlyRate] [smallmoney] NOT NULL,
	[EfficiencyPerWeek] [nvarchar](25) NOT NULL,
	[EarnedHoursPerWeel] [nchar](10) NOT NULL,
 CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Structure]    Script Date: 9/27/2019 5:09:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Structure](
	[StructureId] [int] NOT NULL,
	[PartId] [int] NOT NULL,
	[RequiredHours] [nvarchar](25) NOT NULL,
	[Lenght] [nvarchar](25) NOT NULL,
	[Weight] [nvarchar](25) NOT NULL,
	[NumberOfSeams] [int] NOT NULL,
	[NumberOfBases] [int] NOT NULL,
	[Thickness] [nchar](10) NULL,
 CONSTRAINT [PK_Structure] PRIMARY KEY CLUSTERED 
(
	[StructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Structure Requirements]    Script Date: 9/27/2019 5:09:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Structure Requirements](
	[StructureId] [int] NOT NULL,
	[PartId] [nvarchar](25) NOT NULL,
	[Lenght] [nvarchar](50) NOT NULL,
	[Thickness] [nvarchar](25) NOT NULL,
	[HoursRequired] [nvarchar](25) NOT NULL,
	[FinishingType] [nvarchar](50) NOT NULL,
	[CostPerHour] [smallmoney] NOT NULL,
	[InchesOfDefect] [nvarchar](25) NOT NULL,
	[DeliveryDate] [date] NOT NULL,
 CONSTRAINT [PK_Structure Requirements] PRIMARY KEY CLUSTERED 
(
	[StructureId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Team Cordinator]    Script Date: 9/27/2019 5:09:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Team Cordinator](
	[TeamCordinatorId] [int] NOT NULL,
	[Shift] [nvarchar](10) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Team Cordinator] PRIMARY KEY CLUSTERED 
(
	[TeamCordinatorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Company] ([CompanyId], [Adress], [State], [City], [ZipCode]) VALUES (1, N'1520 Richfield Rd', N'WI', N'Hager City', N'54044     ')
INSERT [dbo].[Company] ([CompanyId], [Adress], [State], [City], [ZipCode]) VALUES (2, N'1300 Portlan Ave', N'TX', N'Austin', N'73301     ')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [HiringDate], [DepartmentId], [Position], [HourlyRate], [EfficiencyPerWeek], [EarnedHoursPerWeel]) VALUES (1, N'Oscar', N'Ruiz', CAST(N'2000-05-05T00:00:00' AS SmallDateTime), 25, N'Press', 20.0000, N'85%', N'40        ')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [HiringDate], [DepartmentId], [Position], [HourlyRate], [EfficiencyPerWeek], [EarnedHoursPerWeel]) VALUES (2, N'Jake', N'Peterson', CAST(N'2015-02-28T00:00:00' AS SmallDateTime), 30, N'Layout', 22.0000, N'92%', N'40        ')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [HiringDate], [DepartmentId], [Position], [HourlyRate], [EfficiencyPerWeek], [EarnedHoursPerWeel]) VALUES (3, N'Marcus', N'Peterson', CAST(N'2010-05-05T00:00:00' AS SmallDateTime), 35, N'LongSeam', 22.0000, N'94%', N'40        ')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [HiringDate], [DepartmentId], [Position], [HourlyRate], [EfficiencyPerWeek], [EarnedHoursPerWeel]) VALUES (4, N'Isaac', N'Jones', CAST(N'2012-04-15T00:00:00' AS SmallDateTime), 45, N'Painting', 20.0000, N'95%', N'40        ')
INSERT [dbo].[Employee] ([EmployeeId], [FirstName], [LastName], [HiringDate], [DepartmentId], [Position], [HourlyRate], [EfficiencyPerWeek], [EarnedHoursPerWeel]) VALUES (5, N'David', N'Books', CAST(N'2000-07-18T00:00:00' AS SmallDateTime), 30, N'Layout', 22.0000, N'80%', N'36        ')
INSERT [dbo].[Structure] ([StructureId], [PartId], [RequiredHours], [Lenght], [Weight], [NumberOfSeams], [NumberOfBases], [Thickness]) VALUES (10001, 4000, N'72', N'500 inch', N'7500 lbs', 2, 4, N'.50       ')
INSERT [dbo].[Structure] ([StructureId], [PartId], [RequiredHours], [Lenght], [Weight], [NumberOfSeams], [NumberOfBases], [Thickness]) VALUES (10002, 4001, N'48', N'450 inch', N'4550 lbs', 2, 2, N'.375      ')
INSERT [dbo].[Structure] ([StructureId], [PartId], [RequiredHours], [Lenght], [Weight], [NumberOfSeams], [NumberOfBases], [Thickness]) VALUES (10003, 4003, N'40', N'600 inch', N'2800 lbs', 1, 6, N'.250      ')
INSERT [dbo].[Structure] ([StructureId], [PartId], [RequiredHours], [Lenght], [Weight], [NumberOfSeams], [NumberOfBases], [Thickness]) VALUES (10004, 7001, N'120', N'420 inch', N'8500 lbs', 2, 2, N'.563      ')
INSERT [dbo].[Structure Requirements] ([StructureId], [PartId], [Lenght], [Thickness], [HoursRequired], [FinishingType], [CostPerHour], [InchesOfDefect], [DeliveryDate]) VALUES (10001, N'4000', N'500 inch', N'.50 inch', N'72', N'Allweather', 150.0000, N'0', CAST(N'2019-12-20' AS Date))
INSERT [dbo].[Structure Requirements] ([StructureId], [PartId], [Lenght], [Thickness], [HoursRequired], [FinishingType], [CostPerHour], [InchesOfDefect], [DeliveryDate]) VALUES (10002, N'4001', N'450 inch', N'.375 inch', N'48', N'Allweather', 120.0000, N'15', CAST(N'2020-01-15' AS Date))
INSERT [dbo].[Structure Requirements] ([StructureId], [PartId], [Lenght], [Thickness], [HoursRequired], [FinishingType], [CostPerHour], [InchesOfDefect], [DeliveryDate]) VALUES (10003, N'4003', N'600 inch', N'.250 inch', N'40', N'Allweather', 100.0000, N'24', CAST(N'2020-02-04' AS Date))
INSERT [dbo].[Structure Requirements] ([StructureId], [PartId], [Lenght], [Thickness], [HoursRequired], [FinishingType], [CostPerHour], [InchesOfDefect], [DeliveryDate]) VALUES (10004, N'7001', N'420 inch', N'.563 inch', N'120', N'Silver', 250.0000, N'0', CAST(N'2020-05-15' AS Date))
INSERT [dbo].[Team Cordinator] ([TeamCordinatorId], [Shift], [FirstName], [LastName], [PhoneNumber]) VALUES (1, N'2', N'Brian', N'Zimmer', N'651-111-0001')
INSERT [dbo].[Team Cordinator] ([TeamCordinatorId], [Shift], [FirstName], [LastName], [PhoneNumber]) VALUES (2, N'1', N'Joe', N'Smith', N'651-112-0002')
INSERT [dbo].[Team Cordinator] ([TeamCordinatorId], [Shift], [FirstName], [LastName], [PhoneNumber]) VALUES (3, N'1', N'Jason', N'Linder', N'651-113-0003')
INSERT [dbo].[Team Cordinator] ([TeamCordinatorId], [Shift], [FirstName], [LastName], [PhoneNumber]) VALUES (4, N'2', N'Dale', N'Jones', N'651-114-0004')
USE [master]
GO
ALTER DATABASE [Structure Utilities] SET  READ_WRITE 
GO
