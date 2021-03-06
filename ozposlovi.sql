USE [master]
GO
/****** Object:  Database [Ozposlovi]    Script Date: 12.7.2020. 16:51:19 ******/
CREATE DATABASE [Ozposlovi]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Ozposlovi', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Ozposlovi.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Ozposlovi_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Ozposlovi_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Ozposlovi] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Ozposlovi].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Ozposlovi] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Ozposlovi] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Ozposlovi] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Ozposlovi] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Ozposlovi] SET ARITHABORT OFF 
GO
ALTER DATABASE [Ozposlovi] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Ozposlovi] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Ozposlovi] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Ozposlovi] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Ozposlovi] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Ozposlovi] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Ozposlovi] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Ozposlovi] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Ozposlovi] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Ozposlovi] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Ozposlovi] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Ozposlovi] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Ozposlovi] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Ozposlovi] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Ozposlovi] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Ozposlovi] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Ozposlovi] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Ozposlovi] SET RECOVERY FULL 
GO
ALTER DATABASE [Ozposlovi] SET  MULTI_USER 
GO
ALTER DATABASE [Ozposlovi] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Ozposlovi] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Ozposlovi] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Ozposlovi] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Ozposlovi] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Ozposlovi', N'ON'
GO
ALTER DATABASE [Ozposlovi] SET QUERY_STORE = OFF
GO
USE [Ozposlovi]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[CategoryName] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobCategories]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobCategories](
	[JobId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
 CONSTRAINT [PK_JobCategories] PRIMARY KEY CLUSTERED 
(
	[JobId] ASC,
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobLocations]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobLocations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[JobId] [int] NOT NULL,
	[LocationId] [int] NOT NULL,
	[DetailedLocation] [nvarchar](max) NULL,
 CONSTRAINT [PK_JobLocations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Jobs]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Jobs](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[JobName] [nvarchar](255) NOT NULL,
	[JobResponsibilities] [text] NULL,
	[JobRequirments] [text] NULL,
	[JobDescription] [text] NOT NULL,
	[WorktimeId] [int] NOT NULL,
	[WorktimeDescription] [nvarchar](max) NULL,
	[PaymentId] [int] NOT NULL,
	[PaymentDescription] [nvarchar](max) NULL,
	[EndDate] [datetime2](7) NOT NULL,
	[IsFeatured] [bit] NOT NULL,
	[IsPremium] [bit] NOT NULL,
 CONSTRAINT [PK_Jobs] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[JobUsers]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[JobUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[JobId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[JobName] [nvarchar](255) NOT NULL,
	[JobDescription] [text] NOT NULL,
 CONSTRAINT [PK_JobUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[CityName] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Locations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleUseCases]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUseCases](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [int] NOT NULL,
	[UseCaseId] [int] NOT NULL,
	[Data] [nvarchar](max) NULL,
	[UsrCaseName] [nvarchar](max) NULL,
 CONSTRAINT [PK_RoleUseCases] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UseCaseLoggers]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UseCaseLoggers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UseCaseDatetime] [datetime2](7) NOT NULL,
	[UserId] [int] NULL,
	[UseCaseName] [nvarchar](max) NULL,
	[Data] [nvarchar](max) NULL,
 CONSTRAINT [PK_UseCaseLoggers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 12.7.2020. 16:51:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[DeletedAt] [datetime2](7) NULL,
	[CreatedAt] [datetime2](7) NOT NULL,
	[ModifiedAt] [datetime2](7) NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Surname] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](450) NOT NULL,
	[Phone] [int] NULL,
	[Birthdate] [datetime2](7) NOT NULL,
	[CvPath] [nvarchar](max) NULL,
	[AvatarPath] [nvarchar](max) NULL,
	[AvatarAlt] [nvarchar](max) NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200526122030_Added_locations_and_categories', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200526123921_Added_jobs_and_cat_loc_configurations', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200526125815_Added_jobs_configuration_and_jobcat_relation', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200526131440_Added_jobloc_relation', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200526140450_Added_users', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200526142912_Added_jobuser_relation_and_userconfig', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200619174649_Added_inital_data_for_categories', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200619174939_Added_inital_data_for_categories-activated', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200620142953_added_roles_and_config', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200620151608_added_usecaselogger_and_user_relation', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200620153208_added_rolesusecases', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200620160614_added_user_use_cases', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200626140041_removed_jobcat_and_jobloc_delete_options', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200626155123_added_more_user_usecases', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627101944_added_usecaseloging_options', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627104156_added_usecaseloging_usernull_options', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627140530_added_more_userusecases', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200627144847_added_more_userusecases_2', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200629151616_added_more_usecases_3', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200629160007_added_more_usecases_4', N'3.1.4')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20200630091125_added_more_usecases_5', N'3.1.4')
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (1, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'IT Oblast')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (2, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Menadzment')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (3, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Administriranje')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (4, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Dizajn')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (5, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Ekonomija')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (6, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Ostalo')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (7, 0, 1, CAST(N'2020-06-24T15:16:59.4660028' AS DateTime2), CAST(N'2020-06-24T14:33:29.8921234' AS DateTime2), CAST(N'2020-06-24T15:17:04.1868400' AS DateTime2), N'Nova Kategorija Izmena')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (8, 1, 0, NULL, CAST(N'2020-07-01T12:04:08.5062434' AS DateTime2), NULL, N'Anketiranje')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (9, 1, 0, NULL, CAST(N'2020-07-01T12:04:21.5589812' AS DateTime2), NULL, N'Administrativni poslovi')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (10, 1, 0, NULL, CAST(N'2020-07-01T12:04:32.0630108' AS DateTime2), NULL, N'Fizički poslovi')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (11, 1, 0, NULL, CAST(N'2020-07-01T12:04:39.4875069' AS DateTime2), NULL, N'Deklarisanje robe')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (12, 1, 0, NULL, CAST(N'2020-07-01T12:04:48.0873226' AS DateTime2), NULL, N'Magacioneri')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (13, 1, 0, NULL, CAST(N'2020-07-01T12:04:55.4256730' AS DateTime2), NULL, N'Promocije')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (14, 1, 0, NULL, CAST(N'2020-07-01T12:05:02.5021298' AS DateTime2), NULL, N'Prodaja')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (15, 1, 0, NULL, CAST(N'2020-07-01T12:05:08.3977375' AS DateTime2), NULL, N'Deljenje flajera')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (16, 1, 0, NULL, CAST(N'2020-07-01T16:04:54.3193966' AS DateTime2), NULL, N'Kuriri')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (17, 1, 0, NULL, CAST(N'2020-07-01T16:05:05.1435493' AS DateTime2), NULL, N'Konobari')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (18, 1, 0, NULL, CAST(N'2020-07-01T16:05:13.0596221' AS DateTime2), NULL, N'Rad u fast food-u')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (19, 1, 0, NULL, CAST(N'2020-07-01T16:05:56.7846371' AS DateTime2), NULL, N'Šankeri')
INSERT [dbo].[Categories] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CategoryName]) VALUES (20, 1, 0, NULL, CAST(N'2020-07-12T16:44:00.8391773' AS DateTime2), NULL, N'Hostese')
SET IDENTITY_INSERT [dbo].[Categories] OFF
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1007, 1)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1008, 1)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1009, 1)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1010, 1)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1015, 1)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (2, 2)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1011, 2)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1019, 2)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1020, 2)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (2, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (3, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (4, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1012, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1013, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1018, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1021, 3)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1, 4)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (3, 5)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (4, 5)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1018, 5)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1006, 9)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1021, 9)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1004, 10)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1005, 10)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1014, 10)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1016, 10)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1003, 12)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1005, 12)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1014, 12)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1016, 12)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1004, 14)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1006, 14)
INSERT [dbo].[JobCategories] ([JobId], [CategoryId]) VALUES (1017, 19)
SET IDENTITY_INSERT [dbo].[JobLocations] ON 

INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (2, 1, 0, NULL, CAST(N'2020-06-26T13:44:15.6405138' AS DateTime2), NULL, 2, 1, NULL)
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (3, 1, 0, NULL, CAST(N'2020-06-26T13:44:15.6405191' AS DateTime2), NULL, 2, 1002, N'Opis Lokacije')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (6, 1, 0, NULL, CAST(N'2020-06-26T16:16:53.4403022' AS DateTime2), NULL, 1, 1002, N'Beograd Izmena')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (7, 1, 0, NULL, CAST(N'2020-06-28T13:30:22.9739328' AS DateTime2), NULL, 3, 1002, N'Beograd Izmena')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (8, 1, 0, NULL, CAST(N'2020-06-28T13:30:37.9561655' AS DateTime2), NULL, 4, 1002, N'Beograd Izmena')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1005, 1, 0, NULL, CAST(N'2020-07-01T13:15:47.7173852' AS DateTime2), NULL, 1003, 1002, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1006, 1, 0, NULL, CAST(N'2020-07-01T13:22:26.3960797' AS DateTime2), NULL, 1004, 1004, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1007, 1, 0, NULL, CAST(N'2020-07-01T13:27:25.5511527' AS DateTime2), NULL, 1005, 2003, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1008, 1, 0, NULL, CAST(N'2020-07-01T13:29:29.0760958' AS DateTime2), NULL, 1006, 2005, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1009, 1, 0, NULL, CAST(N'2020-07-01T13:35:07.9702000' AS DateTime2), NULL, 1007, 1, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1010, 1, 0, NULL, CAST(N'2020-07-01T13:40:11.7464592' AS DateTime2), NULL, 1008, 1, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1011, 1, 0, NULL, CAST(N'2020-07-01T15:42:45.8154572' AS DateTime2), NULL, 1009, 2003, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1012, 1, 0, NULL, CAST(N'2020-07-01T15:45:25.2840568' AS DateTime2), NULL, 1010, 2003, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1013, 1, 0, NULL, CAST(N'2020-07-01T15:47:12.3428531' AS DateTime2), NULL, 1011, 2005, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1014, 1, 0, NULL, CAST(N'2020-07-01T15:51:28.5242964' AS DateTime2), NULL, 1012, 2004, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1015, 1, 0, NULL, CAST(N'2020-07-01T15:55:56.0798356' AS DateTime2), NULL, 1013, 2004, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1016, 1, 0, NULL, CAST(N'2020-07-01T15:58:06.6737253' AS DateTime2), NULL, 1014, 1, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1017, 1, 0, NULL, CAST(N'2020-07-01T15:58:06.6737334' AS DateTime2), NULL, 1014, 1004, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1018, 1, 0, NULL, CAST(N'2020-07-01T15:58:06.6737405' AS DateTime2), NULL, 1014, 1002, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1019, 1, 0, NULL, CAST(N'2020-07-01T16:00:52.7199180' AS DateTime2), NULL, 1015, 1004, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1020, 1, 0, NULL, CAST(N'2020-07-01T16:00:52.7199185' AS DateTime2), NULL, 1015, 1002, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1021, 1, 0, NULL, CAST(N'2020-07-01T16:08:59.6323613' AS DateTime2), NULL, 1016, 1, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1022, 1, 0, NULL, CAST(N'2020-07-01T16:11:53.8285060' AS DateTime2), NULL, 1017, 2005, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1023, 1, 0, NULL, CAST(N'2020-07-01T16:14:25.4322633' AS DateTime2), NULL, 1018, 1, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1024, 1, 0, NULL, CAST(N'2020-07-01T16:16:15.6081447' AS DateTime2), NULL, 1019, 1, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1025, 1, 0, NULL, CAST(N'2020-07-01T16:22:12.7479997' AS DateTime2), NULL, 1020, 2005, N'Detaljnija lokacija')
INSERT [dbo].[JobLocations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [LocationId], [DetailedLocation]) VALUES (1026, 1, 0, NULL, CAST(N'2020-07-01T16:28:28.5792719' AS DateTime2), NULL, 1021, 1, N'Detaljnija lokacija')
SET IDENTITY_INSERT [dbo].[JobLocations] OFF
SET IDENTITY_INSERT [dbo].[Jobs] ON 

INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1, 1, 0, NULL, CAST(N'2020-06-25T15:56:09.4493901' AS DateTime2), CAST(N'2020-06-26T15:25:21.0298675' AS DateTime2), N'Prvi Posao Izmena', N'Odgovornosti posla Izmena', N'Zahtevi posla Izmena', N'Opis posla Izmena', 0, N'5 dana u ned 8-16 Izmena', 0, N'2000', CAST(N'2020-07-29T00:00:00.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (2, 0, 1, CAST(N'2020-06-26T16:26:12.0248719' AS DateTime2), CAST(N'2020-06-26T13:44:15.6400401' AS DateTime2), CAST(N'2020-06-26T16:26:12.0791806' AS DateTime2), N'Drugi posao', N'Odgovornosti posla dva', N'Zahtevi posla dva', N'Opis posla dva', 1, N'', 2, N'', CAST(N'2020-07-29T00:00:00.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (3, 1, 0, NULL, CAST(N'2020-06-28T13:30:22.9735566' AS DateTime2), NULL, N'Najnovoji Posao', N'Odgovornosti posla Izmena', N'Zahtevi posla Izmena', N'Opis posla Izmena', 0, N'5 dana u ned 8-16 Izmena', 0, N'2000', CAST(N'2020-07-29T00:00:00.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (4, 1, 0, NULL, CAST(N'2020-06-28T13:30:37.9561526' AS DateTime2), NULL, N'Najnovoji Posao 3', N'Odgovornosti posla Izmena', N'Zahtevi posla Izmena', N'Opis posla Izmena', 0, N'5 dana u ned 8-16 Izmena', 0, N'2000', CAST(N'2020-07-29T00:00:00.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1003, 1, 0, NULL, CAST(N'2020-07-01T13:15:47.7159658' AS DateTime2), NULL, N'Magacioner', N'Odgovornost na radu', N'Mogu i studenti i nezaposlena lica', N'Fizicki poslovi, odvajanje robe', 0, N'8 Sati', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1004, 1, 0, NULL, CAST(N'2020-07-01T13:22:26.3960563' AS DateTime2), NULL, N'Kurir', N'Rad na dostavi', N'Poseduje vozacku dozvolu B kategorije,Nije krivicno osidivan,', N'Poželjno da ima iskustva na traženim poslovima, Poželjno je da bude mlada osoba ,Zainteresovan je da duži vremenski period bude angažovan', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1005, 1, 0, NULL, CAST(N'2020-07-01T13:27:25.5510609' AS DateTime2), NULL, N'Magacioner u kurirskoj službi u Beogradu', N'Magacinska manipulacija pošiljkama, utovar, istovar robe,Strecovanje paleta sa robom', N'Orijentisanost na timski rad i pozitivan stav u radu, Fokusiranost na ostvarenje radnih zadataka,Iskustvo u radu u magacinu', N'Kompanija D Express je najsigurnija i najperspektivnija ekspresna kurirska služba, koja obavlja prijem, prenos I kurirsku dostavu pošiljaka na podrucju Srbije.', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1006, 1, 0, NULL, CAST(N'2020-07-01T13:29:29.0760786' AS DateTime2), NULL, N'Operater u call centru', N'Javljanje na dolazne pozive i odgovaranje na e-mailove, Kreiranje naloga za preuzimanje pošiljaka', N'Dinamicna osoba, Dobre komunikacione veštine, Veštine rada na racunaru', N'Kompanija D Express je najsigurnija i najperspektivnija ekspresna kurirska služba, koja obavlja prijem, prenos I kurirsku dostavu pošiljaka na podrucju Srbije.', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1007, 1, 0, NULL, CAST(N'2020-07-01T13:35:07.9701808' AS DateTime2), NULL, N'Middle Front-End Developer', N'We are looking for highly motivated and driven specialists who deliver results and are willing to share their expertise with the team of like-minded people.', N'Excellent knowledge and understanding of native JavaScript and ES6 (2+ years), Excellent knowledge and understanding of CSS, and a CSS preprocessor (SASS), Excellent knowledge on making responsive components and web pages', N'Citrus Systems is a rapidly growing company, which specializes in product development for online game platforms and e-commerce.Citrus Systems values your ambition and your desire for further personal and professional growth. We offer great opportunities for advancement of your career and professional growth for both experienced IT specialists and fresh university graduates.', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1008, 1, 0, NULL, CAST(N'2020-07-01T13:40:11.7464145' AS DateTime2), NULL, N'Junior ScrumMaster', N'Definition of guidelines for agile processes in the team, Set and monitor definition of ready and definition of done, Providence of team metrics in a transparent way', N'2+ years experience as a ScrumMaster or Project Manager, Understanding of software development lifecycle, Experience in software development is a plus', N'Being a part of establishing a Swiss based subsidiary - TX Services in Belgrade, Top talent deserves a competitive salary ,Develop yourself and work on interesting projects in an open-minded and diverse culture', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1009, 1, 0, NULL, CAST(N'2020-07-01T15:42:45.8151366' AS DateTime2), NULL, N'Senior Android Engineer', N'You will design, implement, test and deliver new features for our Android App, You love to support and mentor other engineers and share your expert knowledge with the engineering teams', N'Proficiency in building native Android Apps in Java and Kotlin, Experience with Android SDKs and related frameworks like Android Jetpack, Data Binding, Google Play Services, Firebase and Instant Apps', N'Being a part of establishing a Swiss-based subsidiary - TX Services in Belgrade, Top talent deserves a competitive salary, Develop yourself and work on interesting projects in an open-minded and diverse culture We are on the move – and want to keep moving. We are farsighted. We are proactive. We are courageous. We are TX.', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1010, 1, 0, NULL, CAST(N'2020-07-01T15:45:25.2840494' AS DateTime2), NULL, N'Junior .NET Developer', N'We are looking for experienced software engineers to grow our Belgrade CPQ team and help us move to cloud native infrastructure and microservices.', N'Good programming fundamentals and knowledge of .NET/C#, 0-3 years’ experience developing web applications', N'Work on challenging cloud project used by biggest companies in the world, Competitive compensation and bonus plan, Private health insurance for you and your family and voluntary private pension', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1011, 1, 0, NULL, CAST(N'2020-07-01T15:47:12.3428473' AS DateTime2), NULL, N'Sourcing Analyst', N'You are passionate about understanding the company business and customer needs to influence improvement of the business with focus on customer satisfaction. Being customer oriented you see the customer first and consider the impact on the customer when taking decisions. ', N'You have a university degree in Logistics, Economics, Business Administration or related or 1-2 years experience in the area of expertise', N'The purpose of the role is to take direct responsibility for securing fulfillment on the market in an end-to-end perspective by enabling the prerequisites for excellent quality in execution', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1012, 1, 0, NULL, CAST(N'2020-07-01T15:51:28.5242532' AS DateTime2), NULL, N'Payroll and Administration Specialist', N'In the role as Payroll and Administration Specialist, you are responsible to deliver end-to-end payroll processes to the served business units and co-workers according to IKEA policies and directions, legal standards and country-specific requirements ', N'You have previous experience of working in the Payroll field, You are familiar with administration tasks within the Human Resources department, You are passionate about delivering a high standard of service', N'Perform in an accurate, compliant and timely manner pre-payroll activities: checking the entries of the working time and personnel master data related to the payroll processing and off-cycle payments in the IT IS system by the payroll calendar, global and country statutory requirements.', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1013, 1, 0, NULL, CAST(N'2020-07-01T15:55:56.0798295' AS DateTime2), NULL, N'Menadžer prodaje', N'Dnevna komunikacija sa klijentima u vezi sa statusom tekucih, kao i pokretanju novih projekata, Vodenje projektnih sastanaka sa predstavnicima razvoja i proizvodnje u cilju realizacije uzoraka ili serijske proizvodnje ', N'Fakultetsko obrazovanje (prednost za diplomirane ekonomiste), 2+ godine radnog iskustva u oblasti prodaje, ', N'Kao Key Account Manager u uspešnoj domacoj kompaniji BG Reklam, koja je snažno orijentisana na rast na tržištima zapadne Evrope, imacete priliku da samostalno vodite projekte sa najvecim svetskim kompanijama kao što su Samsung, Philips, Google, Philip Morris, Logitech, Loreal i drugi!Ocekuje vas saradnja sa multifunkcionalnim timovima industrijskih dizajnera, mašinskih inženjera i vrhunskih tehnicara u doradi, u cilju nadmašivanja klijentovih ocekivanja.', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1014, 1, 0, NULL, CAST(N'2020-07-01T15:58:06.6736983' AS DateTime2), NULL, N'Radnik u KFC restoranu', N'Sve ', N'Nema ', N'Sve najlepse', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1015, 1, 0, NULL, CAST(N'2020-07-01T16:00:52.7199132' AS DateTime2), NULL, N'Senior .NET Engineer', N'Gathering information and designing solution architecture, Writing clean, testable code using .NET programming languages, Developing technical specifications and architecture ', N'10+ years of experience working as a Software Engineer. Ability to focus and get done the most important task in a very dynamic working environment ', N'We are looking for an experienced Senior .NET Engineer with near native English proficiency to work in our Belgrade office.Senior .NET Developer responsibilities include participating in the entire software development life cycle, debugging applications and configuring existingsystems. ', 1, N'', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 1)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1016, 1, 0, NULL, CAST(N'2020-07-01T16:08:59.6323547' AS DateTime2), NULL, N'Magacinski radnik', N'Obavlja poslove vezane za magacin i robu koja se u njemu nalazi, vrši prijem robe u magacin, što obuhvata kontrolu kvantiteta i kvaliteta primljene robe i vodenje evidencije o prijemu, Odvajanje robe po fakturama/racunima ', N'Strucna sprema NK – I stepen ili srednja strucna sprema, Organizovanost, tacnost, pedantnost i odgovornost', N'Stalnim širenjem asortimana robe, distributivne i maloprodajne mreže, preko 270 zaposlenih stremi ostvarenju zajednicke vizije, a to je najefikasnija distribucija, poštovani i uvažavani poslovni partner svim klijentima, odgovornost prema svim zaposlenima, tržištu i životnoj sredini. Pozivamo Vas da se pridružite uspešnom timu kompanije koja neprestano raste i razvija se, prijavom na radno mesto:MAGACINSKI RADNIK ', 0, N'Pon -Petak ', 0, N'150', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1017, 1, 0, NULL, CAST(N'2020-07-01T16:11:53.8285011' AS DateTime2), NULL, N'Barista', N' ', N'', N'Mogu da konkurišu i osobe koje nemaju iskustva, uz profesionalnu obuku imace priliku da savladaju sve veštine potrebne za dalji profesionalni razvoj. ', 0, N'Pon -Petak 16 - 23 ', 1, N'35000', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1018, 1, 0, NULL, CAST(N'2020-07-01T16:14:25.4322584' AS DateTime2), NULL, N'Account Manager', N'Realizacija planova prodaje paketa telekomunikacionih usluga pravnim licima, Svakodnevni obilazak kompanija ', N'Minimalno IV stepen strucne spreme, Razvijene komunikacione sposobnosti, Prodornost i istrajnost', N'Kompanija Telemax - strateški partner Telekoma Srbije zbog proširenja obima posla pojacava sastav prodajnog tima u Biznis sektoru.Za naše Regionalne centre tražimo ambiciozne i motivisane kandidate za poziciju Account Manager ', 0, N'Svaki radni dan 8 - 16 ', 1, N'70000', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1019, 1, 0, NULL, CAST(N'2020-07-01T16:16:15.6081412' AS DateTime2), NULL, N'Menadžer za poslovnu analizu', N'Upravljanje timom u sektoru plana i analize podataka, Analizira, ocenjuje i izveštava ', N'Visoko obrazovanje - prednost ETF, FON, Matematicki fakultet, Minimum tri godine radnog iskustva na istim ili slicnim poslovima', N'Rad u pozitivnom, dinamicnom i stimulativnom okruženju, strucnu obuku, dobre uslove za rad i mogucnost da u potpunosti iskažete svoje profesionalne sposobnosti ', 0, N'Svaki radni dan 8 - 16 ', 0, N'400', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1020, 1, 0, NULL, CAST(N'2020-07-01T16:22:12.7479940' AS DateTime2), NULL, N'Marketing menadžer', N'Definisanje i implementacija marketing strategije kompanije, Istraživanje, analiziranje i nadgledanje svih faktora koji uticu na tržišne šanse, sastavljanje preporuka i predloga promena u cilju unapredenja marketing poslovanja i procesa ', N'Iskustvo na istim ili slicnim poslovima, Iskustvo u upravljanju timom', N'Regionalni lider u proizvodnji i prodaji stocne hrane traži: Marketing menadžera ', 0, N'Pon -Sub 8 - 16 ', 1, N'50000', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 1, 0)
INSERT [dbo].[Jobs] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobName], [JobResponsibilities], [JobRequirments], [JobDescription], [WorktimeId], [WorktimeDescription], [PaymentId], [PaymentDescription], [EndDate], [IsFeatured], [IsPremium]) VALUES (1021, 1, 0, NULL, CAST(N'2020-07-01T16:28:28.5792654' AS DateTime2), NULL, N'ATM Specialist - Mobi banka', N'Organisation and management of ATM activation and deactivation process, Monitoring of acquiring network,Organisation of interventions necessary for unobstracted work of the ATMs ', N'Minimum IV level of education, English language knowledge', N'Work in a dynamic environment, Great benefits, Competitive conditions ', 1, N' ', 2, N'', CAST(N'2020-08-08T17:16:40.0000000' AS DateTime2), 0, 0)
SET IDENTITY_INSERT [dbo].[Jobs] OFF
SET IDENTITY_INSERT [dbo].[JobUsers] ON 

INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (2, 0, 1, CAST(N'2020-06-27T17:30:33.2908364' AS DateTime2), CAST(N'2020-06-27T16:14:59.3926806' AS DateTime2), CAST(N'2020-06-27T17:30:33.3161418' AS DateTime2), 1, 4, 0, N'Prvi Posao Izmena', N'Opis posla Izmena')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (3, 1, 0, NULL, CAST(N'2020-06-28T13:38:07.8758412' AS DateTime2), NULL, 3, 4, 0, N'Najnovoji Posao', N'Opis posla Izmena')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (4, 0, 1, CAST(N'2020-06-28T18:27:51.7180273' AS DateTime2), CAST(N'2020-06-28T13:38:15.2530116' AS DateTime2), CAST(N'2020-06-28T18:27:51.7407874' AS DateTime2), 4, 4, 1, N'Najnovoji Posao 3', N'Opis posla Izmena')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (5, 1, 0, NULL, CAST(N'2020-06-28T13:38:40.3575077' AS DateTime2), NULL, 1, 4, 0, N'Prvi Posao Izmena', N'Opis posla Izmena')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (6, 1, 0, NULL, CAST(N'2020-06-30T13:47:48.5997845' AS DateTime2), NULL, 3, 5, 0, N'Naziv posla', N'Opis posla ')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (7, 1, 0, NULL, CAST(N'2020-06-30T13:48:19.8290206' AS DateTime2), NULL, 1, 5, 0, N'Naziv posla', N'Opis posla ')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (1002, 1, 0, NULL, CAST(N'2020-07-01T16:39:15.4615623' AS DateTime2), NULL, 1006, 4, 0, N'Naziv posla koji se dobija sa fronta', N'Opis posla koji se dobija sa fronta ')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (1003, 1, 0, NULL, CAST(N'2020-07-01T16:39:20.1103608' AS DateTime2), NULL, 1007, 4, 0, N'Naziv posla koji se dobija sa fronta', N'Opis posla koji se dobija sa fronta ')
INSERT [dbo].[JobUsers] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [JobId], [UserId], [Status], [JobName], [JobDescription]) VALUES (1004, 1, 0, NULL, CAST(N'2020-07-01T16:39:24.4350360' AS DateTime2), NULL, 1004, 4, 0, N'Naziv posla koji se dobija sa fronta', N'Opis posla koji se dobija sa fronta ')
SET IDENTITY_INSERT [dbo].[JobUsers] OFF
SET IDENTITY_INSERT [dbo].[Locations] ON 

INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (1, 1, 0, NULL, CAST(N'2020-05-27T13:41:32.3660717' AS DateTime2), NULL, N'Beograd')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2, 0, 1, CAST(N'2020-05-28T11:33:26.5072680' AS DateTime2), CAST(N'2020-05-27T13:55:37.5876961' AS DateTime2), CAST(N'2020-05-28T11:33:26.5538243' AS DateTime2), N'Novi Sad')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (1002, 1, 0, NULL, CAST(N'2020-06-19T15:32:21.5588756' AS DateTime2), NULL, N'Kragujevac')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (1004, 1, 0, NULL, CAST(N'2020-06-19T15:39:15.5238683' AS DateTime2), NULL, N'Nis')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (1005, 1, 0, NULL, CAST(N'2020-06-24T12:56:04.1171910' AS DateTime2), CAST(N'2020-06-24T13:01:11.3585956' AS DateTime2), N'Kraljevo Izmena')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2002, 1, 0, NULL, CAST(N'2020-07-01T12:07:13.1999220' AS DateTime2), NULL, N'Priština')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2003, 1, 0, NULL, CAST(N'2020-07-01T12:07:25.3824120' AS DateTime2), NULL, N'Leskovac')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2004, 1, 0, NULL, CAST(N'2020-07-01T12:07:35.3687357' AS DateTime2), NULL, N'Subotica')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2005, 1, 0, NULL, CAST(N'2020-07-01T12:07:49.9687319' AS DateTime2), NULL, N'Zrenjanin')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2006, 1, 0, NULL, CAST(N'2020-07-01T12:07:55.3851605' AS DateTime2), NULL, N'Pančevo')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2007, 1, 0, NULL, CAST(N'2020-07-01T12:08:00.6627380' AS DateTime2), NULL, N'Čačak')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2008, 1, 0, NULL, CAST(N'2020-07-01T12:08:06.3183702' AS DateTime2), NULL, N'Novi Pazar')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2009, 1, 0, NULL, CAST(N'2020-07-01T12:08:12.0895313' AS DateTime2), NULL, N'Kraljevo')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2010, 1, 0, NULL, CAST(N'2020-07-12T16:45:53.2920076' AS DateTime2), NULL, N'Smederevo')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2011, 1, 0, NULL, CAST(N'2020-07-12T16:46:00.7674150' AS DateTime2), NULL, N'Valjevo')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2012, 1, 0, NULL, CAST(N'2020-07-12T16:46:07.4513299' AS DateTime2), NULL, N'Kruševac')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2013, 1, 0, NULL, CAST(N'2020-07-12T16:46:15.9588518' AS DateTime2), NULL, N'Vranje')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2014, 1, 0, NULL, CAST(N'2020-07-12T16:46:24.6034292' AS DateTime2), NULL, N'Šabac')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2015, 1, 0, NULL, CAST(N'2020-07-12T16:47:11.4484640' AS DateTime2), NULL, N'Užice')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2016, 1, 0, NULL, CAST(N'2020-07-12T16:47:21.7327511' AS DateTime2), NULL, N'Sombor')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2017, 1, 0, NULL, CAST(N'2020-07-12T16:47:26.7676807' AS DateTime2), NULL, N'Požarevac')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2018, 1, 0, NULL, CAST(N'2020-07-12T16:47:33.4354090' AS DateTime2), NULL, N'Zaječar')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2019, 1, 0, NULL, CAST(N'2020-07-12T16:48:59.6274899' AS DateTime2), NULL, N'Sremska Mitrovica')
INSERT [dbo].[Locations] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [CityName]) VALUES (2020, 1, 0, NULL, CAST(N'2020-07-12T16:49:05.5216013' AS DateTime2), NULL, N'Jagodina')
SET IDENTITY_INSERT [dbo].[Locations] OFF
SET IDENTITY_INSERT [dbo].[Roles] ON 

INSERT [dbo].[Roles] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [RoleName]) VALUES (1, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'Admin')
INSERT [dbo].[Roles] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [RoleName]) VALUES (2, 1, 0, NULL, CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), NULL, N'User')
SET IDENTITY_INSERT [dbo].[Roles] OFF
SET IDENTITY_INSERT [dbo].[RoleUseCases] ON 

INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (1, 2, 3, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (2, 2, 4, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (3, 2, 6, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (4, 2, 11, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (5, 2, 12, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (6, 2, 16, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (7, 2, 17, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (8, 2, 18, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (9, 2, 23, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (10, 2, 24, NULL, NULL)
INSERT [dbo].[RoleUseCases] ([Id], [RoleId], [UseCaseId], [Data], [UsrCaseName]) VALUES (11, 2, 25, NULL, NULL)
SET IDENTITY_INSERT [dbo].[RoleUseCases] OFF
SET IDENTITY_INSERT [dbo].[UseCaseLoggers] ON 

INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (2, CAST(N'2020-06-27T12:48:42.7677245' AS DateTime2), NULL, N'Get locations ', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (3, CAST(N'2020-06-27T12:51:39.0661591' AS DateTime2), NULL, N'Get Categories', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (4, CAST(N'2020-06-27T13:16:40.6145679' AS DateTime2), 4, N'Get locations ', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (5, CAST(N'2020-06-27T13:55:19.5173846' AS DateTime2), NULL, N'EF Get usecase log', N'{"UserId":0,"UseCaseDateBefore":null,"UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (6, CAST(N'2020-06-27T13:57:21.6307733' AS DateTime2), NULL, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":null,"UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (7, CAST(N'2020-06-27T13:59:49.8198086' AS DateTime2), NULL, N'EF Get usecase log', N'{"UserId":4,"UseCaseDateBefore":null,"UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (8, CAST(N'2020-06-27T14:04:51.0030352' AS DateTime2), NULL, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":"2020-06-28T00:00:00","UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (9, CAST(N'2020-06-27T14:05:14.7080396' AS DateTime2), NULL, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":"2020-06-06T00:00:00","UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (10, CAST(N'2020-06-27T14:05:28.1446884' AS DateTime2), NULL, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":null,"UseCaseDateAfter":"2020-06-06T00:00:00","PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (11, CAST(N'2020-06-27T16:01:03.0520049' AS DateTime2), NULL, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (12, CAST(N'2020-06-27T16:07:29.3188645' AS DateTime2), 4, N'User creates new job vacancie', N'{"JobId":1,"JobName":"Prvi Posao Izmena","JobDescription":"Opis posla Izmena"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (13, CAST(N'2020-06-27T16:08:02.7049592' AS DateTime2), 4, N'User creates new job vacancie', N'{"JobId":1,"JobName":"Prvi Posao Izmena","JobDescription":"Opis posla Izmena"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (14, CAST(N'2020-06-27T16:14:58.8024220' AS DateTime2), 4, N'User creates new job vacancie', N'{"JobId":1,"JobName":"Prvi Posao Izmena","JobDescription":"Opis posla Izmena"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (15, CAST(N'2020-06-27T16:51:59.3084709' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (16, CAST(N'2020-06-27T16:52:49.2440763' AS DateTime2), 4, N'Get users applications', N'{"JobName":"a","PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (17, CAST(N'2020-06-27T16:52:57.4987793' AS DateTime2), 4, N'Get users applications', N'{"JobName":"aasdasdff","PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (18, CAST(N'2020-06-27T16:55:00.4201709' AS DateTime2), 2, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":null,"UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (19, CAST(N'2020-06-27T17:26:28.2722342' AS DateTime2), 2, N'EF Soft delete users job vacancie', N'2')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (20, CAST(N'2020-06-27T17:29:03.6646813' AS DateTime2), 2, N'EF Soft delete users job vacancie', N'2')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (21, CAST(N'2020-06-27T17:30:32.7300281' AS DateTime2), 4, N'EF Soft delete users job vacancie', N'2')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (22, CAST(N'2020-06-27T17:30:43.6798675' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (23, CAST(N'2020-06-28T13:30:22.3174806' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Najnovoji Posao","JobResponsibilities":"Odgovornosti posla Izmena","JobRequirments":"Zahtevi posla Izmena","JobDescription":"Opis posla Izmena","WorktimeId":0,"WorktimeDescription":"5 dana u ned 8-16 Izmena","PaymentId":0,"PaymentDescription":"2000","EndDate":"2020-07-29T00:00:00","IsFeatured":true,"IsPremium":false,"Categories":[{"Id":3,"CategoryName":null},{"Id":5,"CategoryName":null}],"Locations":[{"Id":1002,"CityName":null,"DetailedLocation":"Beograd Izmena"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (24, CAST(N'2020-06-28T13:30:27.4819320' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (25, CAST(N'2020-06-28T13:30:37.8889040' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Najnovoji Posao 3","JobResponsibilities":"Odgovornosti posla Izmena","JobRequirments":"Zahtevi posla Izmena","JobDescription":"Opis posla Izmena","WorktimeId":0,"WorktimeDescription":"5 dana u ned 8-16 Izmena","PaymentId":0,"PaymentDescription":"2000","EndDate":"2020-07-29T00:00:00","IsFeatured":true,"IsPremium":false,"Categories":[{"Id":3,"CategoryName":null},{"Id":5,"CategoryName":null}],"Locations":[{"Id":1002,"CityName":null,"DetailedLocation":"Beograd Izmena"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (26, CAST(N'2020-06-28T13:30:41.8999768' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (27, CAST(N'2020-06-28T13:38:01.4006871' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (28, CAST(N'2020-06-28T13:38:07.6338766' AS DateTime2), 4, N'User creates new job vacancie', N'{"JobId":3,"JobName":"Najnovoji Posao","JobDescription":"Opis posla Izmena","JobEndDate":null,"Status":null,"UserId":null,"Username":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (29, CAST(N'2020-06-28T13:38:15.2159743' AS DateTime2), 4, N'User creates new job vacancie', N'{"JobId":4,"JobName":"Najnovoji Posao 3","JobDescription":"Opis posla Izmena","JobEndDate":null,"Status":null,"UserId":null,"Username":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (30, CAST(N'2020-06-28T13:38:17.7588843' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (31, CAST(N'2020-06-28T13:38:35.8668556' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (32, CAST(N'2020-06-28T13:38:40.3343150' AS DateTime2), 4, N'User creates new job vacancie', N'{"JobId":1,"JobName":"Prvi Posao Izmena","JobDescription":"Opis posla Izmena","JobEndDate":null,"Status":null,"UserId":null,"Username":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (33, CAST(N'2020-06-28T13:38:44.3198667' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (34, CAST(N'2020-06-28T13:43:09.8535318' AS DateTime2), 3, N'EF get all  job vacancies by users', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (35, CAST(N'2020-06-28T13:43:32.7431522' AS DateTime2), 3, N'EF get all  job vacancies by users', N'{"JobName":null,"UserId":4,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (36, CAST(N'2020-06-28T13:43:39.3787511' AS DateTime2), 3, N'EF get all  job vacancies by users', N'{"JobName":null,"UserId":2,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (37, CAST(N'2020-06-28T13:43:51.0700593' AS DateTime2), 3, N'EF get all  job vacancies by users', N'{"JobName":null,"UserId":null,"JobId":1,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (38, CAST(N'2020-06-28T17:37:36.8114218' AS DateTime2), 3, N'EF get all  job vacancies by users', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (39, CAST(N'2020-06-28T17:37:52.5528404' AS DateTime2), 3, N'EF get job vacancie by ID', N'3')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (40, CAST(N'2020-06-28T17:38:02.6211062' AS DateTime2), 3, N'EF get job vacancie by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (41, CAST(N'2020-06-28T18:04:38.3403175' AS DateTime2), 3, N'EF Status change', N'{"Id":4,"JobId":0,"JobName":null,"JobDescription":null,"JobEndDate":null,"Status":1,"UserId":null,"Username":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (42, CAST(N'2020-06-28T18:05:06.9501476' AS DateTime2), 3, N'EF get job vacancie by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (43, CAST(N'2020-06-28T18:27:46.1747317' AS DateTime2), 3, N'EF get job vacancie by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (44, CAST(N'2020-06-28T18:27:51.6603178' AS DateTime2), 3, N'EF Soft delete job vacancie by Id', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (45, CAST(N'2020-06-28T18:27:57.6899094' AS DateTime2), 3, N'EF get all  job vacancies by users', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (46, CAST(N'2020-06-29T14:23:35.0348768' AS DateTime2), NULL, N'Get locations ', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (47, CAST(N'2020-06-29T14:34:15.6204309' AS DateTime2), 3, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":null,"UseCaseDateAfter":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (48, CAST(N'2020-06-29T14:34:24.4920809' AS DateTime2), 3, N'EF Get usecase log', N'{"UserId":null,"UseCaseDateBefore":null,"UseCaseDateAfter":null,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (49, CAST(N'2020-06-29T17:25:08.9402078' AS DateTime2), 4, N'EF get user info by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (50, CAST(N'2020-06-29T17:26:55.8433310' AS DateTime2), 4, N'EF get user info by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (51, CAST(N'2020-06-29T17:42:24.7015783' AS DateTime2), 4, N'EF get user info by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (52, CAST(N'2020-06-29T18:04:09.7048400' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"bla bla","NewPassword":"Bla bla"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (53, CAST(N'2020-06-29T18:04:20.7221460' AS DateTime2), 4, N'EF get user info by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (54, CAST(N'2020-06-29T18:04:53.5532759' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"MilosUser123456789","NewPassword":"MilosUser123456789"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (55, CAST(N'2020-06-29T18:07:41.2246075' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"asdasdsad","NewPassword":"MilosUser123456789"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (56, CAST(N'2020-06-29T18:09:17.8891907' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"asdasdsad","NewPassword":"MilosUser123456789"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (57, CAST(N'2020-06-29T18:12:03.2621768' AS DateTime2), 4, N'EF get user info by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (58, CAST(N'2020-06-29T18:12:12.2377012' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"asdasdsad","NewPassword":"MilosUser123456789"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (59, CAST(N'2020-06-29T18:12:23.4428131' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"MilosUser123456789","NewPassword":"MilosUser123456789"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (60, CAST(N'2020-06-30T11:15:06.3476395' AS DateTime2), 4, N'EF Update user info', N'{"UserId":4,"Username":"MilosUserIzmena","Name":"Milos Izmena","Surname":"Prezime Izmena","Phone":692233145,"Birthdate":"1997-04-16T00:00:00","AvatarAlt":"Opis Slike","Avatar":{"ContentDisposition":"form-data; name=\"Avatar\"; filename=\"man-300x300.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Avatar\"; filename=\"man-300x300.png\""],"Content-Type":["image/png"]},"Length":66316,"Name":"Avatar","FileName":"man-300x300.png"},"Cv":{"ContentDisposition":"form-data; name=\"Cv\"; filename=\"Petar Ristic.pdf\"","ContentType":"application/pdf","Headers":{"Content-Disposition":["form-data; name=\"Cv\"; filename=\"Petar Ristic.pdf\""],"Content-Type":["application/pdf"]},"Length":241077,"Name":"Cv","FileName":"Petar Ristic.pdf"}}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (61, CAST(N'2020-06-30T11:18:15.2654057' AS DateTime2), 4, N'EF Update user info', N'{"UserId":4,"Username":"MilosUserIzmena","Name":"Milos Izmena","Surname":"Prezime Izmena","Phone":692233145,"Birthdate":"1997-04-16T00:00:00","AvatarAlt":"Opis Slike","Avatar":{"ContentDisposition":"form-data; name=\"Avatar\"; filename=\"man-300x300.png\"","ContentType":"image/png","Headers":{"Content-Disposition":["form-data; name=\"Avatar\"; filename=\"man-300x300.png\""],"Content-Type":["image/png"]},"Length":66316,"Name":"Avatar","FileName":"man-300x300.png"},"Cv":{"ContentDisposition":"form-data; name=\"Cv\"; filename=\"Petar Ristic.pdf\"","ContentType":"application/pdf","Headers":{"Content-Disposition":["form-data; name=\"Cv\"; filename=\"Petar Ristic.pdf\""],"Content-Type":["application/pdf"]},"Length":241077,"Name":"Cv","FileName":"Petar Ristic.pdf"}}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (62, CAST(N'2020-06-30T11:18:22.4226157' AS DateTime2), 4, N'EF get user info by ID', N'4')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (63, CAST(N'2020-06-30T11:24:22.7111727' AS DateTime2), 4, N'EF Change password of user', N'{"UserId":4,"OldPassword":"MilosUser123456789","NewPassword":"aads"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (64, CAST(N'2020-06-30T11:47:55.6232063' AS DateTime2), 3, N'EF Get all Users', N'{"Name":null,"Surname":null,"Birthdate":null,"RoleId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (65, CAST(N'2020-06-30T11:49:34.7844929' AS DateTime2), 3, N'EF Get all Users', N'{"Name":null,"Surname":null,"Birthdate":null,"RoleId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (66, CAST(N'2020-06-30T11:49:54.7961631' AS DateTime2), 3, N'EF Get all Users', N'{"Name":null,"Surname":null,"Birthdate":null,"RoleId":2,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (67, CAST(N'2020-06-30T13:43:10.6340130' AS DateTime2), NULL, N'Add new user to the system', N'{"Username":"Provera","Password":"Pass12345","Name":"Ime","Surname":"Prezime","Email":"user@gmail.com","Phone":691122333,"Birthdate":"1998-06-16T00:00:00","AvatarAlt":null,"RoleId":0,"Avatar":null,"Cv":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (68, CAST(N'2020-06-30T13:45:05.5283224' AS DateTime2), NULL, N'Add new user to the system', N'{"Username":"Provera","Password":"Pass12345","Name":"Ime","Surname":"Prezime","Email":"user@gmail.com","Phone":691122333,"Birthdate":"1998-06-16T00:00:00","AvatarAlt":null,"RoleId":2,"Avatar":null,"Cv":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (69, CAST(N'2020-06-30T13:46:19.0716182' AS DateTime2), NULL, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (70, CAST(N'2020-06-30T13:47:48.2183989' AS DateTime2), 5, N'User creates new job vacancie', N'{"Id":null,"JobId":3,"JobName":"Naziv posla","JobDescription":"Opis posla ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (71, CAST(N'2020-06-30T13:47:53.5518802' AS DateTime2), 5, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (72, CAST(N'2020-06-30T13:48:16.1845944' AS DateTime2), 5, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (73, CAST(N'2020-06-30T13:48:19.8124732' AS DateTime2), 5, N'User creates new job vacancie', N'{"Id":null,"JobId":1,"JobName":"Naziv posla","JobDescription":"Opis posla ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (74, CAST(N'2020-06-30T13:48:23.5087153' AS DateTime2), 5, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (75, CAST(N'2020-06-30T13:48:51.8018000' AS DateTime2), 5, N'EF get user info by ID', N'5')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (76, CAST(N'2020-06-30T13:52:29.9161157' AS DateTime2), 3, N'EF Get all Users', N'{"Username":null,"Name":null,"Surname":null,"Birthdate":null,"RoleId":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1002, CAST(N'2020-07-01T12:04:07.7613103' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Anketiranje"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1003, CAST(N'2020-07-01T12:04:21.5148052' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Administrativni poslovi"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1004, CAST(N'2020-07-01T12:04:32.0433065' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Fizički poslovi"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1005, CAST(N'2020-07-01T12:04:39.4012218' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Deklarisanje robe"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1006, CAST(N'2020-07-01T12:04:48.0555115' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Magacioneri"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1007, CAST(N'2020-07-01T12:04:55.3839380' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Promocije"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1008, CAST(N'2020-07-01T12:05:02.4812621' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Prodaja"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1009, CAST(N'2020-07-01T12:05:08.3541895' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Deljenje flajera"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1010, CAST(N'2020-07-01T12:05:10.5285161' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Deljenje flajera"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1011, CAST(N'2020-07-01T12:05:48.3383754' AS DateTime2), 3, N'Get Categories', N'{"Name":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1012, CAST(N'2020-07-01T12:07:13.0680428' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Priština","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1013, CAST(N'2020-07-01T12:07:25.3501350' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Leskovac","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1014, CAST(N'2020-07-01T12:07:35.3080595' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Subotica","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1015, CAST(N'2020-07-01T12:07:49.9141486' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Zrenjanin","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1016, CAST(N'2020-07-01T12:07:55.3667412' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Pančevo","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1017, CAST(N'2020-07-01T12:08:00.6234213' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Čačak","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1018, CAST(N'2020-07-01T12:08:06.2765958' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Novi Pazar","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1019, CAST(N'2020-07-01T12:08:12.0711274' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Kraljevo","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1020, CAST(N'2020-07-01T13:00:24.5663570' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1021, CAST(N'2020-07-01T13:06:54.1357482' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacioner","JobResponsibilities":"Odgovornost na radu","JobRequirments":"Mogu i studenti i nezaposlena lica","JobDescription":"Fizicki poslovi, odvajanje robe","WorktimeId":0,"WorktimeDescription":"8 Sati","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":12,"CategoryName":null}],"Locations":[{"Id":7,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1022, CAST(N'2020-07-01T13:08:00.2213328' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacioner","JobResponsibilities":"Odgovornost na radu","JobRequirments":"Mogu i studenti i nezaposlena lica","JobDescription":"Fizicki poslovi, odvajanje robe","WorktimeId":0,"WorktimeDescription":"8 Sati","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":12,"CategoryName":null}],"Locations":[{"Id":2,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1023, CAST(N'2020-07-01T13:09:56.6302227' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacioner","JobResponsibilities":"Odgovornost na radu","JobRequirments":"Mogu i studenti i nezaposlena lica","JobDescription":"Fizicki poslovi, odvajanje robe","WorktimeId":0,"WorktimeDescription":"8 Sati","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":12,"CategoryName":null}],"Locations":[{"Id":2,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1024, CAST(N'2020-07-01T13:11:56.9747001' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacioner","JobResponsibilities":"Odgovornost na radu","JobRequirments":"Mogu i studenti i nezaposlena lica","JobDescription":"Fizicki poslovi, odvajanje robe","WorktimeId":0,"WorktimeDescription":"8 Sati","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":12,"CategoryName":null}],"Locations":[{"Id":2,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1025, CAST(N'2020-07-01T13:15:43.3681388' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacioner","JobResponsibilities":"Odgovornost na radu","JobRequirments":"Mogu i studenti i nezaposlena lica","JobDescription":"Fizicki poslovi, odvajanje robe","WorktimeId":0,"WorktimeDescription":"8 Sati","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":12,"CategoryName":null}],"Locations":[{"Id":1002,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
GO
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1026, CAST(N'2020-07-01T13:15:54.1921761' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1027, CAST(N'2020-07-01T13:21:24.1021718' AS DateTime2), NULL, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1028, CAST(N'2020-07-01T13:22:08.7278589' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Kurir","JobResponsibilities":"Rad na dostavi","JobRequirments":"Poseduje vozačku dozvolu B kategorije,Nije krivično osiđivan,","JobDescription":"Poželjno da ima iskustva na traženim poslovima, Poželjno je da bude mlađa osoba ,Zainteresovan je da duži vremenski period bude angažovan","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":true,"Categories":[{"Id":10,"CategoryName":null},{"Id":14,"CategoryName":null}],"Locations":[{"Id":1003,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1029, CAST(N'2020-07-01T13:22:26.3127448' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Kurir","JobResponsibilities":"Rad na dostavi","JobRequirments":"Poseduje vozačku dozvolu B kategorije,Nije krivično osiđivan,","JobDescription":"Poželjno da ima iskustva na traženim poslovima, Poželjno je da bude mlađa osoba ,Zainteresovan je da duži vremenski period bude angažovan","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":true,"Categories":[{"Id":10,"CategoryName":null},{"Id":14,"CategoryName":null}],"Locations":[{"Id":1004,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1030, CAST(N'2020-07-01T13:22:37.5833663' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1031, CAST(N'2020-07-01T13:27:25.4917835' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacioner u kurirskoj službi u Beogradu","JobResponsibilities":"Magacinska manipulacija pošiljkama, utovar, istovar robe,Strečovanje paleta sa robom","JobRequirments":"Orijentisanost na timski rad i pozitivan stav u radu, Fokusiranost na ostvarenje radnih zadataka,Iskustvo u radu u magacinu","JobDescription":"Kompanija D Express je najsigurnija i najperspektivnija ekspresna kurirska služba, koja obavlja prijem, prenos I kurirsku dostavu pošiljaka na području Srbije.","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":12,"CategoryName":null},{"Id":10,"CategoryName":null}],"Locations":[{"Id":2003,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1032, CAST(N'2020-07-01T13:27:30.1059401' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1033, CAST(N'2020-07-01T13:29:28.9975407' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Operater u call centru","JobResponsibilities":"Javljanje na dolazne pozive i odgovaranje na e-mailove, Kreiranje naloga za preuzimanje pošiljaka","JobRequirments":"Dinamična osoba, Dobre komunikacione veštine, Veštine rada na računaru","JobDescription":"Kompanija D Express je najsigurnija i najperspektivnija ekspresna kurirska služba, koja obavlja prijem, prenos I kurirsku dostavu pošiljaka na području Srbije.","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":14,"CategoryName":null},{"Id":9,"CategoryName":null}],"Locations":[{"Id":2005,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1034, CAST(N'2020-07-01T13:29:33.2200828' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1035, CAST(N'2020-07-01T13:35:07.8928919' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Middle Front-End Developer","JobResponsibilities":"We are looking for highly motivated and driven specialists who deliver results and are willing to share their expertise with the team of like-minded people.","JobRequirments":"Excellent knowledge and understanding of native JavaScript and ES6 (2+ years), Excellent knowledge and understanding of CSS, and a CSS preprocessor (SASS), Excellent knowledge on making responsive components and web pages","JobDescription":"Citrus Systems is a rapidly growing company, which specializes in product development for online game platforms and e-commerce.Citrus Systems values your ambition and your desire for further personal and professional growth. We offer great opportunities for advancement of your career and professional growth for both experienced IT specialists and fresh university graduates.","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":1,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1036, CAST(N'2020-07-01T13:35:12.1593262' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1037, CAST(N'2020-07-01T13:40:02.5747628' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1038, CAST(N'2020-07-01T13:40:11.6026494' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Junior ScrumMaster","JobResponsibilities":"Definition of guidelines for agile processes in the team, Set and monitor definition of ready and definition of done, Providence of team metrics in a transparent way","JobRequirments":"2+ years experience as a ScrumMaster or Project Manager, Understanding of software development lifecycle, Experience in software development is a plus","JobDescription":"Being a part of establishing a Swiss based subsidiary - TX Services in Belgrade, Top talent deserves a competitive salary ,Develop yourself and work on interesting projects in an open-minded and diverse culture","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":1,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1039, CAST(N'2020-07-01T13:40:16.6544174' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1040, CAST(N'2020-07-01T13:42:34.9695053' AS DateTime2), NULL, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1041, CAST(N'2020-07-01T15:42:29.7655438' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1042, CAST(N'2020-07-01T15:42:45.6457073' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Senior Android Engineer","JobResponsibilities":"You will design, implement, test and deliver new features for our Android App, You love to support and mentor other engineers and share your expert knowledge with the engineering teams","JobRequirments":"Proficiency in building native Android Apps in Java and Kotlin, Experience with Android SDKs and related frameworks like Android Jetpack, Data Binding, Google Play Services, Firebase and Instant Apps","JobDescription":"Being a part of establishing a Swiss-based subsidiary - TX Services in Belgrade, Top talent deserves a competitive salary, Develop yourself and work on interesting projects in an open-minded and diverse culture We are on the move – and want to keep moving. We are farsighted. We are proactive. We are courageous. We are TX.","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":false,"Categories":[{"Id":1,"CategoryName":null}],"Locations":[{"Id":2003,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1043, CAST(N'2020-07-01T15:42:49.8072247' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1044, CAST(N'2020-07-01T15:45:25.2633593' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Junior .NET Developer","JobResponsibilities":"We are looking for experienced software engineers to grow our Belgrade CPQ team and help us move to cloud native infrastructure and microservices.","JobRequirments":"Good programming fundamentals and knowledge of .NET/C#, 0-3 years’ experience developing web applications","JobDescription":"Work on challenging cloud project used by biggest companies in the world, Competitive compensation and bonus plan, Private health insurance for you and your family and voluntary private pension","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":true,"Categories":[{"Id":1,"CategoryName":null}],"Locations":[{"Id":2003,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1045, CAST(N'2020-07-01T15:45:30.2008151' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1046, CAST(N'2020-07-01T15:47:12.3164677' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Sourcing Analyst","JobResponsibilities":"You are passionate about understanding the company business and customer needs to influence improvement of the business with focus on customer satisfaction. Being customer oriented you see the customer first and consider the impact on the customer when taking decisions. ","JobRequirments":"You have a university degree in Logistics, Economics, Business Administration or related or 1-2 years experience in the area of expertise","JobDescription":"The purpose of the role is to take direct responsibility for securing fulfillment on the market in an end-to-end perspective by enabling the prerequisites for excellent quality in execution","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":2,"CategoryName":null}],"Locations":[{"Id":2005,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1047, CAST(N'2020-07-01T15:47:16.9640279' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1048, CAST(N'2020-07-01T15:47:27.1819187' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1049, CAST(N'2020-07-01T15:51:28.2229807' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Payroll and Administration Specialist","JobResponsibilities":"In the role as Payroll and Administration Specialist, you are responsible to deliver end-to-end payroll processes to the served business units and co-workers according to IKEA policies and directions, legal standards and country-specific requirements ","JobRequirments":"You have previous experience of working in the Payroll field, You are familiar with administration tasks within the Human Resources department, You are passionate about delivering a high standard of service","JobDescription":"Perform in an accurate, compliant and timely manner pre-payroll activities: checking the entries of the working time and personnel master data related to the payroll processing and off-cycle payments in the IT IS system by the payroll calendar, global and country statutory requirements.","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":3,"CategoryName":null}],"Locations":[{"Id":2004,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1050, CAST(N'2020-07-01T15:51:33.2747727' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1051, CAST(N'2020-07-01T15:55:55.9943256' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Menadžer prodaje","JobResponsibilities":"Dnevna komunikacija sa klijentima u vezi sa statusom tekućih, kao i pokretanju novih projekata, Vođenje projektnih sastanaka sa predstavnicima razvoja i proizvodnje u cilju realizacije uzoraka ili serijske proizvodnje ","JobRequirments":"Fakultetsko obrazovanje (prednost za diplomirane ekonomiste), 2+ godine radnog iskustva u oblasti prodaje, ","JobDescription":"Kao Key Account Manager u uspešnoj domaćoj kompaniji BG Reklam, koja je snažno orijentisana na rast na tržištima zapadne Evrope, imaćete priliku da samostalno vodite projekte sa najvećim svetskim kompanijama kao što su Samsung, Philips, Google, Philip Morris, Logitech, Loreal i drugi!Očekuje vas saradnja sa multifunkcionalnim timovima industrijskih dizajnera, mašinskih inženjera i vrhunskih tehničara u doradi, u cilju nadmašivanja klijentovih očekivanja.","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":3,"CategoryName":null}],"Locations":[{"Id":2004,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1052, CAST(N'2020-07-01T15:55:58.6826283' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1053, CAST(N'2020-07-01T15:57:30.5950230' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1054, CAST(N'2020-07-01T15:57:35.1152682' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Radnik u KFC restoranu","JobResponsibilities":"Sve ","JobRequirments":"Nema ","JobDescription":"Sve najlepse","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":10,"CategoryName":null},{"Id":12,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":2,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":1002,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1055, CAST(N'2020-07-01T15:57:53.8630400' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Radnik u KFC restoranu","JobResponsibilities":"Sve ","JobRequirments":"Nema ","JobDescription":"Sve najlepse","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":10,"CategoryName":null},{"Id":12,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":1003,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":1002,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1056, CAST(N'2020-07-01T15:58:06.6158605' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Radnik u KFC restoranu","JobResponsibilities":"Sve ","JobRequirments":"Nema ","JobDescription":"Sve najlepse","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":10,"CategoryName":null},{"Id":12,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":1004,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":1002,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1057, CAST(N'2020-07-01T15:58:10.5265271' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1058, CAST(N'2020-07-01T16:00:52.7014569' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Senior .NET Engineer","JobResponsibilities":"Gathering information and designing solution architecture, Writing clean, testable code using .NET programming languages, Developing technical specifications and architecture ","JobRequirments":"10+ years of experience working as a Software Engineer. Ability to focus and get done the most important task in a very dynamic working environment ","JobDescription":"We are looking for an experienced Senior .NET Engineer with near native English proficiency to work in our Belgrade office.Senior .NET Developer responsibilities include participating in the entire software development life cycle, debugging applications and configuring existingsystems. ","WorktimeId":1,"WorktimeDescription":"","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":true,"Categories":[{"Id":1,"CategoryName":null}],"Locations":[{"Id":1004,"CityName":null,"DetailedLocation":"Detaljnija lokacija"},{"Id":1002,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1059, CAST(N'2020-07-01T16:00:56.4626859' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1060, CAST(N'2020-07-01T16:04:54.2696712' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Kuriri"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1061, CAST(N'2020-07-01T16:05:05.1200071' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Konobari"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1062, CAST(N'2020-07-01T16:05:12.9819723' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Rad u fast food-u"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1063, CAST(N'2020-07-01T16:05:56.7693620' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Šankeri"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1064, CAST(N'2020-07-01T16:08:59.5521743' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Magacinski radnik","JobResponsibilities":"Obavlja poslove vezane za magacin i robu koja se u njemu nalazi, vrši prijem robe u magacin, što obuhvata kontrolu kvantiteta i kvaliteta primljene robe i vođenje evidencije o prijemu, Odvajanje robe po fakturama/računima ","JobRequirments":"Stručna sprema NK – I stepen ili srednja stručna sprema, Organizovanost, tačnost, pedantnost i odgovornost","JobDescription":"Stalnim širenjem asortimana robe, distributivne i maloprodajne mreže, preko 270 zaposlenih stremi ostvarenju zajedničke vizije, a to je najefikasnija distribucija, poštovani i uvažavani poslovni partner svim klijentima, odgovornost prema svim zaposlenima, tržištu i životnoj sredini. Pozivamo Vas da se pridružite uspešnom timu kompanije koja neprestano raste i razvija se, prijavom na radno mesto:MAGACINSKI RADNIK ","WorktimeId":0,"WorktimeDescription":"Pon -Petak ","PaymentId":0,"PaymentDescription":"150","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":12,"CategoryName":null},{"Id":10,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1065, CAST(N'2020-07-01T16:09:03.4148773' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1066, CAST(N'2020-07-01T16:11:48.8508692' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1067, CAST(N'2020-07-01T16:11:53.7638251' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Barista","JobResponsibilities":" ","JobRequirments":"","JobDescription":"Mogu da konkurišu i osobe koje nemaju iskustva, uz profesionalnu obuku imaće priliku da savladaju sve veštine potrebne za dalji profesionalni razvoj. ","WorktimeId":0,"WorktimeDescription":"Pon -Petak 16 - 23 ","PaymentId":1,"PaymentDescription":"35000","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":false,"Categories":[{"Id":19,"CategoryName":null}],"Locations":[{"Id":2005,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1068, CAST(N'2020-07-01T16:11:56.1992534' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1069, CAST(N'2020-07-01T16:14:25.4170270' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Account Manager","JobResponsibilities":"Realizacija planova prodaje paketa telekomunikacionih usluga pravnim licima, Svakodnevni obilazak kompanija ","JobRequirments":"Minimalno IV stepen stručne spreme, Razvijene komunikacione sposobnosti, Prodornost i istrajnost","JobDescription":"Kompanija Telemax - strateški partner Telekoma Srbije zbog proširenja obima posla pojačava sastav prodajnog tima u Biznis sektoru.Za naše Regionalne centre tražimo ambiciozne i motivisane kandidate za poziciju Account Manager ","WorktimeId":0,"WorktimeDescription":"Svaki radni dan 8 - 16 ","PaymentId":1,"PaymentDescription":"70000","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":false,"Categories":[{"Id":3,"CategoryName":null},{"Id":5,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1070, CAST(N'2020-07-01T16:14:30.1442836' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1071, CAST(N'2020-07-01T16:16:15.5905131' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Menadžer za poslovnu analizu","JobResponsibilities":"Upravljanje timom u sektoru plana i analize podataka, Analizira, ocenjuje i izveštava ","JobRequirments":"Visoko obrazovanje - prednost ETF, FON, Matematički fakultet, Minimum tri godine radnog iskustva na istim ili sličnim poslovima","JobDescription":"Rad u pozitivnom, dinamičnom i stimulativnom okruženju, stručnu obuku, dobre uslove za rad i mogućnost da u potpunosti iskažete svoje profesionalne sposobnosti ","WorktimeId":0,"WorktimeDescription":"Svaki radni dan 8 - 16 ","PaymentId":0,"PaymentDescription":"400","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":2,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1072, CAST(N'2020-07-01T16:16:20.8713373' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1073, CAST(N'2020-07-01T16:22:12.6866765' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"Marketing menadžer","JobResponsibilities":"Definisanje i implementacija marketing strategije kompanije, Istraživanje, analiziranje i nadgledanje svih faktora koji utiču na tržišne šanse, sastavljanje preporuka i predloga promena u cilju unapređenja marketing poslovanja i procesa ","JobRequirments":"Iskustvo na istim ili sličnim poslovima, Iskustvo u upravljanju timom","JobDescription":"Regionalni lider u proizvodnji i prodaji stočne hrane traži: Marketing menadžera ","WorktimeId":0,"WorktimeDescription":"Pon -Sub 8 - 16 ","PaymentId":1,"PaymentDescription":"50000","EndDate":"2020-08-08T17:16:40","IsFeatured":true,"IsPremium":false,"Categories":[{"Id":2,"CategoryName":null}],"Locations":[{"Id":2005,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1074, CAST(N'2020-07-01T16:22:16.0192865' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":2}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1075, CAST(N'2020-07-01T16:23:20.2586201' AS DateTime2), 3, N'Get single job by ID', N'1010')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1076, CAST(N'2020-07-01T16:28:28.5661004' AS DateTime2), 3, N'Add new job', N'{"Id":0,"JobName":"ATM Specialist - Mobi banka","JobResponsibilities":"Organisation and management of ATM activation and deactivation process, Monitoring of acquiring network,Organisation of interventions necessary for unobstracted work of the ATMs ","JobRequirments":"Minimum IV level of education, English language knowledge","JobDescription":"Work in a dynamic environment, Great benefits, Competitive conditions ","WorktimeId":1,"WorktimeDescription":" ","PaymentId":2,"PaymentDescription":"","EndDate":"2020-08-08T17:16:40","IsFeatured":false,"IsPremium":false,"Categories":[{"Id":3,"CategoryName":null},{"Id":9,"CategoryName":null}],"Locations":[{"Id":1,"CityName":null,"DetailedLocation":"Detaljnija lokacija"}]}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1077, CAST(N'2020-07-01T16:28:34.5655080' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1078, CAST(N'2020-07-01T16:28:46.8342158' AS DateTime2), 3, N'Get all jobs', N'{"Name":null,"Worktime":null,"Payment":null,"Enddate":null,"IsFeatured":false,"IsPremium":false,"PerPage":10,"Page":3}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1079, CAST(N'2020-07-01T16:38:21.2244224' AS DateTime2), 4, N'User creates new job vacancie', N'{"Id":null,"JobId":1546546,"JobName":"Naziv posla","JobDescription":"Opis posla ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1080, CAST(N'2020-07-01T16:39:15.3561473' AS DateTime2), 4, N'User creates new job vacancie', N'{"Id":null,"JobId":1006,"JobName":"Naziv posla koji se dobija sa fronta","JobDescription":"Opis posla koji se dobija sa fronta ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1081, CAST(N'2020-07-01T16:39:20.0824055' AS DateTime2), 4, N'User creates new job vacancie', N'{"Id":null,"JobId":1007,"JobName":"Naziv posla koji se dobija sa fronta","JobDescription":"Opis posla koji se dobija sa fronta ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1082, CAST(N'2020-07-01T16:39:24.4171016' AS DateTime2), 4, N'User creates new job vacancie', N'{"Id":null,"JobId":1004,"JobName":"Naziv posla koji se dobija sa fronta","JobDescription":"Opis posla koji se dobija sa fronta ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1083, CAST(N'2020-07-01T16:39:26.1838731' AS DateTime2), 4, N'User creates new job vacancie', N'{"Id":null,"JobId":1004,"JobName":"Naziv posla koji se dobija sa fronta","JobDescription":"Opis posla koji se dobija sa fronta ","JobEndDate":null,"Status":null,"UserId":null,"Username":null,"Name":null,"Surname":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1084, CAST(N'2020-07-01T16:39:35.6069991' AS DateTime2), 4, N'Get users applications', N'{"JobName":null,"UserId":null,"JobId":null,"Status":null,"PerPage":10,"Page":1}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1085, CAST(N'2020-07-12T16:44:00.3341166' AS DateTime2), 3, N'Add new category EF', N'{"Id":0,"CategoryName":"Hostese"}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1086, CAST(N'2020-07-12T16:45:53.2000948' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Smederevo","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1087, CAST(N'2020-07-12T16:46:00.6859908' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Valjevo","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1088, CAST(N'2020-07-12T16:46:07.4303548' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Kruševac","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1089, CAST(N'2020-07-12T16:46:15.9136782' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Vranje","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1090, CAST(N'2020-07-12T16:46:24.5291771' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Šabac","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1091, CAST(N'2020-07-12T16:47:11.4040648' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Užice","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1092, CAST(N'2020-07-12T16:47:21.6984345' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Sombor","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1093, CAST(N'2020-07-12T16:47:26.7371468' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Požarevac","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1094, CAST(N'2020-07-12T16:47:33.3850156' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Zaječar","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1095, CAST(N'2020-07-12T16:48:59.5634764' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Sremska Mitrovica","DetailedLocation":null}')
INSERT [dbo].[UseCaseLoggers] ([Id], [UseCaseDatetime], [UserId], [UseCaseName], [Data]) VALUES (1096, CAST(N'2020-07-12T16:49:05.4676819' AS DateTime2), 3, N'Add new location to the system', N'{"Id":0,"CityName":"Jagodina","DetailedLocation":null}')
SET IDENTITY_INSERT [dbo].[UseCaseLoggers] OFF
SET IDENTITY_INSERT [dbo].[Users] ON 

INSERT [dbo].[Users] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [Username], [Password], [Name], [Surname], [Email], [Phone], [Birthdate], [CvPath], [AvatarPath], [AvatarAlt], [RoleId]) VALUES (2, 1, 0, NULL, CAST(N'2020-06-21T15:41:05.7457131' AS DateTime2), NULL, N'TestUsername', N'Testpass', N'TEst', N'Testic', N'mail@gmail.com', 633363996, CAST(N'1981-11-12T00:00:00.0000000' AS DateTime2), N'b1acc856-79a7-467d-929d-23611dd3fe44MilanPeuracaCV.pdf', N'e443da1a-40c2-43e7-a8cb-6d367ee79846.png', N'AltTest', 2)
INSERT [dbo].[Users] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [Username], [Password], [Name], [Surname], [Email], [Phone], [Birthdate], [CvPath], [AvatarPath], [AvatarAlt], [RoleId]) VALUES (3, 1, 0, NULL, CAST(N'2020-06-21T16:29:25.5360788' AS DateTime2), NULL, N'MilosSi9', N'Milos123456789', N'Milos', N'Simic', N'milos@gmail.com', 633363996, CAST(N'1998-11-12T00:00:00.0000000' AS DateTime2), N'a6474089-e27f-4092-a9a0-4bf1be89938dMilanPeuracaCV.pdf', N'5c6211fb-3912-40db-b5ef-54df748a92aa.png', N'Opis Slike Profilne', 1)
INSERT [dbo].[Users] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [Username], [Password], [Name], [Surname], [Email], [Phone], [Birthdate], [CvPath], [AvatarPath], [AvatarAlt], [RoleId]) VALUES (4, 1, 0, NULL, CAST(N'2020-06-21T16:34:03.2673938' AS DateTime2), CAST(N'2020-06-30T11:18:15.7613065' AS DateTime2), N'MilosUserIzmena', N'MilosUser123456789', N'Milos Izmena', N'Prezime Izmena', N'milossimicbz@gmail.com', 692233145, CAST(N'1997-04-16T00:00:00.0000000' AS DateTime2), N'89b8ea83-f921-4f6b-814e-0c6870319b2bPetar Ristic.pdf', N'ac881aed-41d4-450d-9bb6-52deebdc5016.png', N'Opis Slike', 2)
INSERT [dbo].[Users] ([Id], [IsActive], [IsDeleted], [DeletedAt], [CreatedAt], [ModifiedAt], [Username], [Password], [Name], [Surname], [Email], [Phone], [Birthdate], [CvPath], [AvatarPath], [AvatarAlt], [RoleId]) VALUES (5, 1, 0, NULL, CAST(N'2020-06-30T13:45:09.3643204' AS DateTime2), NULL, N'Provera', N'Pass12345', N'Ime', N'Prezime', N'user@gmail.com', 691122333, CAST(N'1998-06-16T00:00:00.0000000' AS DateTime2), N'', N'basicavatar.jpg', N'basic-avatar', 2)
SET IDENTITY_INSERT [dbo].[Users] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Categories_CategoryName]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Categories_CategoryName] ON [dbo].[Categories]
(
	[CategoryName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobCategories_CategoryId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_JobCategories_CategoryId] ON [dbo].[JobCategories]
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobLocations_JobId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_JobLocations_JobId] ON [dbo].[JobLocations]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobLocations_LocationId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_JobLocations_LocationId] ON [dbo].[JobLocations]
(
	[LocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobUsers_JobId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_JobUsers_JobId] ON [dbo].[JobUsers]
(
	[JobId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_JobUsers_UserId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_JobUsers_UserId] ON [dbo].[JobUsers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Locations_CityName]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Locations_CityName] ON [dbo].[Locations]
(
	[CityName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Roles_RoleName]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Roles_RoleName] ON [dbo].[Roles]
(
	[RoleName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RoleUseCases_RoleId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_RoleUseCases_RoleId] ON [dbo].[RoleUseCases]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UseCaseLoggers_UserId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_UseCaseLoggers_UserId] ON [dbo].[UseCaseLoggers]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Email]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Email] ON [dbo].[Users]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Users_RoleId]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE NONCLUSTERED INDEX [IX_Users_RoleId] ON [dbo].[Users]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Users_Username]    Script Date: 12.7.2020. 16:51:21 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [dbo].[Users]
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'emptyavatar.jpg') FOR [AvatarPath]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT (N'basic-avatar') FOR [AvatarAlt]
GO
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [RoleId]
GO
ALTER TABLE [dbo].[JobCategories]  WITH CHECK ADD  CONSTRAINT [FK_JobCategories_Categories_CategoryId] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Categories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobCategories] CHECK CONSTRAINT [FK_JobCategories_Categories_CategoryId]
GO
ALTER TABLE [dbo].[JobCategories]  WITH CHECK ADD  CONSTRAINT [FK_JobCategories_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobCategories] CHECK CONSTRAINT [FK_JobCategories_Jobs_JobId]
GO
ALTER TABLE [dbo].[JobLocations]  WITH CHECK ADD  CONSTRAINT [FK_JobLocations_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[JobLocations] CHECK CONSTRAINT [FK_JobLocations_Jobs_JobId]
GO
ALTER TABLE [dbo].[JobLocations]  WITH CHECK ADD  CONSTRAINT [FK_JobLocations_Locations_LocationId] FOREIGN KEY([LocationId])
REFERENCES [dbo].[Locations] ([Id])
GO
ALTER TABLE [dbo].[JobLocations] CHECK CONSTRAINT [FK_JobLocations_Locations_LocationId]
GO
ALTER TABLE [dbo].[JobUsers]  WITH CHECK ADD  CONSTRAINT [FK_JobUsers_Jobs_JobId] FOREIGN KEY([JobId])
REFERENCES [dbo].[Jobs] ([Id])
GO
ALTER TABLE [dbo].[JobUsers] CHECK CONSTRAINT [FK_JobUsers_Jobs_JobId]
GO
ALTER TABLE [dbo].[JobUsers]  WITH CHECK ADD  CONSTRAINT [FK_JobUsers_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[JobUsers] CHECK CONSTRAINT [FK_JobUsers_Users_UserId]
GO
ALTER TABLE [dbo].[RoleUseCases]  WITH CHECK ADD  CONSTRAINT [FK_RoleUseCases_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[RoleUseCases] CHECK CONSTRAINT [FK_RoleUseCases_Roles_RoleId]
GO
ALTER TABLE [dbo].[UseCaseLoggers]  WITH CHECK ADD  CONSTRAINT [FK_UseCaseLoggers_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[Users] ([Id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[UseCaseLoggers] CHECK CONSTRAINT [FK_UseCaseLoggers_Users_UserId]
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[Users] CHECK CONSTRAINT [FK_Users_Roles_RoleId]
GO
USE [master]
GO
ALTER DATABASE [Ozposlovi] SET  READ_WRITE 
GO
