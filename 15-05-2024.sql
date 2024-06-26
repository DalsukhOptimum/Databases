USE [master]
GO
/****** Object:  Database [EventModule]    Script Date: 15-05-2024 18:48:17 ******/
CREATE DATABASE [EventModule]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'EventModule', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EventModule.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'EventModule_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\EventModule_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [EventModule] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [EventModule].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [EventModule] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [EventModule] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [EventModule] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [EventModule] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [EventModule] SET ARITHABORT OFF 
GO
ALTER DATABASE [EventModule] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [EventModule] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [EventModule] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [EventModule] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [EventModule] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [EventModule] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [EventModule] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [EventModule] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [EventModule] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [EventModule] SET  ENABLE_BROKER 
GO
ALTER DATABASE [EventModule] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [EventModule] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [EventModule] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [EventModule] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [EventModule] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [EventModule] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [EventModule] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [EventModule] SET RECOVERY FULL 
GO
ALTER DATABASE [EventModule] SET  MULTI_USER 
GO
ALTER DATABASE [EventModule] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [EventModule] SET DB_CHAINING OFF 
GO
ALTER DATABASE [EventModule] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [EventModule] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [EventModule] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [EventModule] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'EventModule', N'ON'
GO
ALTER DATABASE [EventModule] SET QUERY_STORE = ON
GO
ALTER DATABASE [EventModule] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [EventModule]
GO
/****** Object:  User [IIS APPPOOL\Dalsukh_Event]    Script Date: 15-05-2024 18:48:17 ******/
CREATE USER [IIS APPPOOL\Dalsukh_Event] FOR LOGIN [IIS APPPOOL\Dalsukh_Event] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_accessadmin] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_securityadmin] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_ddladmin] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_backupoperator] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_datareader] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_datawriter] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_denydatareader] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
ALTER ROLE [db_denydatawriter] ADD MEMBER [IIS APPPOOL\Dalsukh_Event]
GO
/****** Object:  Table [dbo].[ActivityTbl]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ActivityTbl](
	[ActivityId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Price] [bigint] NULL,
	[EventId] [bigint] NOT NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[CreatedDateTime] [datetime] NOT NULL,
	[UpdatedDateTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ActivityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AdminTbl]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AdminTbl](
	[AdminTblId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Address] [varchar](100) NOT NULL,
	[UpdatedTime] [datetime] NULL,
	[CreatedDatetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[AdminTblId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[EventTbl]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[EventTbl](
	[EventId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[StartDate] [datetime] NOT NULL,
	[EndDate] [datetime] NOT NULL,
	[Description] [varchar](max) NOT NULL,
	[Image] [varchar](max) NOT NULL,
	[IsActive] [bigint] NOT NULL,
	[IsPublish] [bigint] NOT NULL,
	[CreadDateTime] [datetime] NOT NULL,
	[UpdatedDatetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[EventId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OPT_Store]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OPT_Store](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](320) NULL,
	[OTP] [varchar](7) NULL,
	[GeneratedDatetime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PaneltyTbl]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PaneltyTbl](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](320) NULL,
	[CreadTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Template]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Template](
	[Template_Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](255) NOT NULL,
	[Subject] [varchar](255) NOT NULL,
	[Body] [varchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Template_Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLoginTbl]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLoginTbl](
	[UserLoginTblId] [bigint] IDENTITY(1,1) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ISActive] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserLoginTblId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserTbl]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserTbl](
	[UserTblId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Email] [varchar](320) NOT NULL,
	[Mobile] [varchar](10) NOT NULL,
	[Address] [varchar](200) NOT NULL,
	[CreatedTime] [datetime] NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UpdatedTime] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserTblId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ActivityTbl] ON 

INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (10002, N'Voting ', N'Do voting,
It’s in your hand to change the world.', 100, 60100, CAST(N'2024-05-07T14:16:00.000' AS DateTime), CAST(N'2024-05-08T14:16:00.000' AS DateTime), CAST(N'2024-05-06T14:17:00.657' AS DateTime), NULL)
INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (10003, N'fgdfg', N'dfgdfg', 0, 60101, CAST(N'2024-05-06T16:03:00.000' AS DateTime), CAST(N'2024-05-07T16:03:00.000' AS DateTime), CAST(N'2024-05-06T16:03:45.207' AS DateTime), NULL)
INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (20002, N'ghfgh', N'fgfgh', 0, 60103, CAST(N'2024-05-22T10:10:00.000' AS DateTime), CAST(N'2024-05-23T10:10:00.000' AS DateTime), CAST(N'2024-05-09T10:10:59.563' AS DateTime), NULL)
INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (30002, N'sse', N'asdasd', 0, 60104, CAST(N'2024-05-14T11:41:00.000' AS DateTime), CAST(N'2024-05-14T11:41:00.000' AS DateTime), CAST(N'2024-05-10T11:41:31.050' AS DateTime), NULL)
INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (30003, N'fsdf', N'fdfg', 0, 70099, CAST(N'2024-07-19T11:42:00.000' AS DateTime), CAST(N'2024-07-20T11:42:00.000' AS DateTime), CAST(N'2024-05-10T11:42:26.590' AS DateTime), NULL)
INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (30004, N'sdfsxdf', N'fsdf', 0, 80099, CAST(N'2024-06-12T12:10:00.000' AS DateTime), CAST(N'2024-06-13T12:10:00.000' AS DateTime), CAST(N'2024-05-10T12:10:29.513' AS DateTime), NULL)
INSERT [dbo].[ActivityTbl] ([ActivityId], [Name], [Description], [Price], [EventId], [StartDate], [EndDate], [CreatedDateTime], [UpdatedDateTime]) VALUES (30005, N'gfdgdf', N'fgdfgfg', 9000, 60107, CAST(N'2024-05-15T17:02:00.000' AS DateTime), CAST(N'2024-05-16T17:02:00.000' AS DateTime), CAST(N'2024-05-10T17:02:44.963' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[ActivityTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[AdminTbl] ON 

INSERT [dbo].[AdminTbl] ([AdminTblId], [Name], [Email], [Password], [Mobile], [Address], [UpdatedTime], [CreatedDatetime]) VALUES (1, N'Dalsukh', N'naneradalsukh@gmail.com', N'Dal@2002', N'7573942052', N'Dwarka', NULL, CAST(N'2024-04-03T15:58:27.607' AS DateTime))
SET IDENTITY_INSERT [dbo].[AdminTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[EventTbl] ON 

INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60100, N'Election', CAST(N'2024-05-07T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'Your vote is your voice.', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\14-16-14.jpg', 1, 1, CAST(N'2024-05-06T14:16:14.630' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60101, N'fdZSDfsd', CAST(N'2024-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-07T00:00:00.000' AS DateTime), N'sdfsdf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\15-53-03.jpg', 1, 0, CAST(N'2024-05-06T15:53:03.740' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60102, N'vdfg', CAST(N'2024-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'fgdfgdfg', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\15-58-57.jpg', 1, 0, CAST(N'2024-05-06T15:58:57.123' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60103, N'werwer', CAST(N'2024-05-22T00:00:00.000' AS DateTime), CAST(N'2024-05-30T00:00:00.000' AS DateTime), N'erert', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\15-59-05.jpg', 1, 1, CAST(N'2024-05-06T15:59:05.290' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60104, N'erert', CAST(N'2024-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-14T00:00:00.000' AS DateTime), N'erterte', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\15-59-13.jpg', 0, 1, CAST(N'2024-05-06T15:59:13.203' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60105, N'rerrer', CAST(N'2024-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'ertert', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\15-59-31.jpg', 1, 0, CAST(N'2024-05-06T15:59:31.857' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60106, N'dasdas', CAST(N'2024-05-06T00:00:00.000' AS DateTime), CAST(N'2024-05-08T00:00:00.000' AS DateTime), N'dasdsd', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\16-14-43.jpg', 1, 0, CAST(N'2024-05-06T16:14:43.827' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60107, N'dasdas', CAST(N'2024-05-14T00:00:00.000' AS DateTime), CAST(N'2024-05-16T00:00:00.000' AS DateTime), N'dsddfsdf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\16-14-54.jpg', 1, 1, CAST(N'2024-05-06T16:14:54.010' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (60108, N'dasdsdd', CAST(N'2024-05-15T00:00:00.000' AS DateTime), CAST(N'2024-05-17T00:00:00.000' AS DateTime), N'sdsddf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\16-15-08.jpg', 1, 0, CAST(N'2024-05-06T16:15:08.977' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (70099, N'adsdf', CAST(N'2024-07-19T00:00:00.000' AS DateTime), CAST(N'2024-08-01T00:00:00.000' AS DateTime), N'sdfsdfdf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\17-14-32.jpg', 1, 1, CAST(N'2024-05-08T17:14:32.670' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (70100, N'dasd', CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-08-08T00:00:00.000' AS DateTime), N'sddsdf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\17-14-57.jpg', 1, 0, CAST(N'2024-05-08T17:14:57.467' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (70101, N'sdfsdf', CAST(N'2024-05-08T00:00:00.000' AS DateTime), CAST(N'2024-05-09T00:00:00.000' AS DateTime), N'sdfsdf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\17-15-06.jpg', 1, 0, CAST(N'2024-05-08T17:15:06.303' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (70102, N'sdfsdff', CAST(N'2024-07-17T00:00:00.000' AS DateTime), CAST(N'2024-07-31T00:00:00.000' AS DateTime), N'sdfsdf', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\17-15-21.jpg', 1, 0, CAST(N'2024-05-08T17:15:21.727' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (70103, N'dasdzsd', CAST(N'2024-08-14T00:00:00.000' AS DateTime), CAST(N'2024-08-27T00:00:00.000' AS DateTime), N'asdasd', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\17-16-10.jpg', 1, 0, CAST(N'2024-05-08T17:16:10.870' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (70104, N'sdasd', CAST(N'2024-12-09T00:00:00.000' AS DateTime), CAST(N'2024-12-11T00:00:00.000' AS DateTime), N'asdasd', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\18-04-58.jpg', 1, 0, CAST(N'2024-05-08T18:04:58.620' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (80099, N'ffsdf', CAST(N'2024-06-12T00:00:00.000' AS DateTime), CAST(N'2024-06-13T00:00:00.000' AS DateTime), N'fsdffgsdffg', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\12-10-10.jpg', 1, 1, CAST(N'2024-05-10T12:10:11.150' AS DateTime), NULL)
INSERT [dbo].[EventTbl] ([EventId], [Name], [StartDate], [EndDate], [Description], [Image], [IsActive], [IsPublish], [CreadDateTime], [UpdatedDatetime]) VALUES (80100, N'asfsdgsd', CAST(N'2024-05-11T00:00:00.000' AS DateTime), CAST(N'2024-05-15T00:00:00.000' AS DateTime), N'sdgdfgdfg', N'C:\Users\dalsu\OneDrive\Desktop\Intern\EventModule\EventModule\Images\17-02-24.jpg', 1, 0, CAST(N'2024-05-10T17:02:24.927' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[EventTbl] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Template] ON 

INSERT [dbo].[tbl_Template] ([Template_Id], [Name], [Subject], [Body]) VALUES (1, N'OTP', N'One Time Password', N'<div style="font-family: Helvetica,Arial,sans-serif;min-width:1000px;overflow:auto;line-height:2">
  <div style="margin:50px auto;width:70%;padding:20px 0">
    <div style="border-bottom:1px solid #eee">
      <a href="" style="font-size:1.4em;color: #00466a;text-decoration:none;font-weight:600">Optimum</a>
    </div>
    <p style="font-size:1.1em">Hi,</p>
    <p>Thank you for choosing Optimum. Use the following OTP to complete your Sign Up procedures. OTP is valid for 5 minutes</p>
    <h2 style="background: #00466a;margin: 0 auto;width: max-content;padding: 0 10px;color: #fff;border-radius: 4px;">[OTP]</h2>
    <p style="font-size:0.9em;">Regards,<br />Dalsukh</p>
    <hr style="border:none;border-top:1px solid #eee" />
    <div style="float:right;padding:8px 0;color:#aaa;font-size:0.8em;line-height:1;font-weight:300">
      <p>Optimum Financial PVT LTD</p>
      <p>1221,1222 Iconic Shyamal</p>
      <p>Ahmedabad</p>
    </div>
  </div>
</div>')
SET IDENTITY_INSERT [dbo].[tbl_Template] OFF
GO
SET IDENTITY_INSERT [dbo].[UserTbl] ON 

INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (7, N'Nanera Dalsukh', N'naneradalsukh@gmail.com', N'7573942025', N'Dwarka', CAST(N'2024-04-03T15:58:27.607' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (8, N'virat kohli', N'virat@gmail.com', N'7573942025', N'jamnagar', CAST(N'2024-04-03T16:01:47.510' AS DateTime), N'Vir@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (9, N'Robert', N'robert@gmail.com', N'4566544565', N'Jamnagar', CAST(N'2024-04-04T17:07:39.900' AS DateTime), N'dfgfgfg', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (10, N'Robert', N'thisiscoder@gmail.com', N'1236457898', N'dsadigugtggggggggggggg', CAST(N'2024-04-10T13:42:04.217' AS DateTime), N'iggh', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (11, N'demo', N'demo@gmail.com', N'4566544565', N'sassasdasdasdddddddddddd', CAST(N'2024-04-10T13:43:36.753' AS DateTime), N'dfvf', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (12, N'sdcbcx', N'dd@gmail.com', N'4566544565', N'wwedffdfdf', CAST(N'2024-04-10T13:45:27.733' AS DateTime), N'ghgfhhh', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (13, N'bgnhgh', N'ok@gmail.com', N'4566544565', N'weawear', CAST(N'2024-04-10T13:56:43.370' AS DateTime), N'sdzdfdf', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (14, N'new joine', N'joine@gmail.com', N'4566544565', N'dsdff', CAST(N'2024-04-16T11:51:42.397' AS DateTime), N'Joine@gmail.com', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (15, N'anurag', N'100', N'3', N'AddPrice', CAST(N'2024-04-17T18:05:40.600' AS DateTime), N'2123', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (16, N'Nanera Dalsukh', N'neneradalsukh@gmail.com', N'4566544565', N'Jamnagar', CAST(N'2024-04-22T11:11:32.710' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (18, N'anurag', N'pupose@gmail.com', N'3222222222', N'AddPrice', CAST(N'2024-04-25T11:45:16.570' AS DateTime), N'2123', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (20, N'dfdddddddddd', N'd@gmail.com', N'4566544565', N'ddddddddddd', CAST(N'2024-04-25T11:54:49.843' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (21, N'asasasd', N'b@gmail.com', N'4566544565', N'dfdfd', CAST(N'2024-04-25T12:02:42.660' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (22, N'Amit', N'amit@gmail.com', N'4566544565', N'surat', CAST(N'2024-04-25T12:26:41.090' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (23, N'dhaval', N'dhaval@gmail.com', N'7896452310', N'Bhanvad', CAST(N'2024-04-29T10:56:18.300' AS DateTime), N'Dha@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (24, N'nitish', N'nitish@gmial.com', N'6565656565', N'Jamnagar', CAST(N'2024-04-29T12:41:12.170' AS DateTime), N'Nit@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (26, N'karena hemant', N'hemantkarena@gmail.com', N'2587413698', N'bhanvad', CAST(N'2024-04-30T11:36:32.300' AS DateTime), N'Hem@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (10026, N'Dhaval', N'amitpipaliya26@gmail.com', N'3216549789', N'dasdzd', CAST(N'2024-05-14T13:11:14.517' AS DateTime), N'Amit@123', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (10027, N'dalsukh', N'dalsukhnaneradalsukhnanera@gmail.com', N'7573942052', N'Bhanvad', CAST(N'2024-05-14T13:13:25.260' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (10028, N'Dalsukh', N'neneradalsukhh@gmail.com', N'8899889989', N'Jamnagar', CAST(N'2024-05-14T14:11:27.123' AS DateTime), N'Dal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (10029, N'Naresh', N'naneradalsukh27@gmail.com', N'4566545525', N'Jamnagar', CAST(N'2024-05-14T14:30:32.890' AS DateTime), N'Nal@2002', NULL)
INSERT [dbo].[UserTbl] ([UserTblId], [Name], [Email], [Mobile], [Address], [CreatedTime], [Password], [UpdatedTime]) VALUES (10030, N'sasdasd', N'adityajsn1299@gmail.com', N'1234567895', N'Jamnagar', CAST(N'2024-05-14T15:51:24.860' AS DateTime), N'Dal@2002', NULL)
SET IDENTITY_INSERT [dbo].[UserTbl] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__AdminTbl__A9D105343322D447]    Script Date: 15-05-2024 18:48:18 ******/
ALTER TABLE [dbo].[AdminTbl] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserLogi__A9D10534AD5EA8DE]    Script Date: 15-05-2024 18:48:18 ******/
ALTER TABLE [dbo].[UserLoginTbl] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__UserTbl__A9D10534B907F20D]    Script Date: 15-05-2024 18:48:18 ******/
ALTER TABLE [dbo].[UserTbl] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[ActivityTbl]  WITH CHECK ADD FOREIGN KEY([EventId])
REFERENCES [dbo].[EventTbl] ([EventId])
GO
/****** Object:  StoredProcedure [dbo].[Add_Activity_SP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <04-04-2024>
-- Description:	<for Adding an activity>
-- =============================================
CREATE proc [dbo].[Add_Activity_SP] --'uno','playing uno',1,'2024-04-03 15:58:27.607','2024-04-04 15:58:27.607'
@Name varchar(100),
@Description  varchar(100),
@EventId bigint,
@StartDate datetime,
@EndDate datetime

as 
begin
declare @Id bigint ;
--first check that activity is already exists or not 
select @Id = ActivityId from ActivityTbl where Name = @Name AND EventId = @EventId ;

if @Id IS NOT NULL
begin
select 'Already Exists Activity' as ResponseMessage, 0 as ID 
return
end

--checking that there is any events or not 
declare @cnt bigint ;
select @cnt = COUNT(EventId) from EventTbl ;

if @cnt = 0
begin
select 'there is no events' as ResponseMessage, 0 as ID
return end 

insert into ActivityTbl values(@Name,@Description,0,@EventId,@StartDate,@EndDate,GETDATE(),null);
select 'Addedd successfully' as ResponseMessage, 1 as ID 
end 

GO
/****** Object:  StoredProcedure [dbo].[Add_Event_SP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <04-04-2024>
-- Description:	<for Adding an Event>
-- =============================================
CREATE proc [dbo].[Add_Event_SP]
@Name varchar(100),
@Description varchar(MAX),
@StartDate datetime,
@Enddate datetime,
@Image varchar(MAX)

as
begin


insert into EventTbl values(@Name,@StartDate,@Enddate,@Description,@Image,1,0,GETDATE(),null);
select 'Addedd successfully' as ResponseMessage, 1 as ID 
end 





GO
/****** Object:  StoredProcedure [dbo].[LoginSP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <04-04-2024>
-- Description:	<for Login user or Admin>
-- =============================================
CREATE proc  [dbo].[LoginSP] 
@Email varchar(320),
@Password varchar(100),
@Flag varchar(100)
as
begin 
--checking that flag is provided or not 
if @Flag IS null
begin
select 'Please Provide flag' as ResponseMessage, 0 as ID 
return 
end 

declare  @Id bigint ; 
--for user login check email and password 
if @Flag = 'UserLogin'
begin
select @Id = UserTBLId from UserTbl where Email = @Email AND Password = @Password ;  

if @Id is null
begin
select 'provided credetails is wrong' as ResponseMessage , 0 as ID 
return
end
select 'Login successfully' as ResponseMessage, 1 as ID
end

--for Admin login check email and password
if @Flag = 'AdminLogin'
begin
select @Id = AdminTblId from AdminTbl where Email = @Email AND Password = @Password ;  
if @Id is null
begin
select 'provided credetails is wrong' as ResponseMessage , 0 as ID 
return
end
--and if Email and Password is right so sending Login successfully
select 'Login successfully' as ResponseMessage, 1 as ID
end

if @Flag = 'UserExists'
begin
select @Id = UserTBLId from UserTbl where Email = @Email ;  
if @Id is null
begin
select 'you are not Exists' as ResponseMessage , 0 as ID 
return
end
--and if Email and Password is right so sending Login successfully
select 'User Exists' as ResponseMessage, 1 as ID
end

if @Flag = 'UpdatePassword'
begin
update UserTbl set Password = @Password where Email = @Email ;
select 'Password Updated Successfully' as ResponseMessage, 1 as ID
end

end 



GO
/****** Object:  StoredProcedure [dbo].[MonthwiseSP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[MonthwiseSP]
@Month bigint

as 
begin

declare @count bigint ;
select @count = COUNT(EventId) from EventTbl where  MONTH(StartDate) = @Month AND IsActive = 1;
if @count = 0
begin
select 'DO not have any Events' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select EventId,Name,StartDate,EndDate,Description,Image,IsPublish from EventTbl  where  MONTH(StartDate) = @Month AND IsActive = 1  
end

GO
/****** Object:  StoredProcedure [dbo].[OTP_Veryfication_SP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <12-05-2024>
-- Description:	<for Verifying OTP>
-- =============================================
CREATE proc [dbo].[OTP_Veryfication_SP] --'naneradalsukh@gmail.com','3785'
@Email varchar(320),
@OTP varchar(7)
as begin
declare @cnt bigint ;
declare @RealOTP varchar(7)
--deleteting from OTP Store Table whoever's Time Exccexd 1 Minute
delete from OPT_Store where GETDATE() > DATEADD(mi, 1,GeneratedDatetime); 
select @cnt = COUNT(Id)  from OPT_Store where Email = @Email ;
if (@cnt = 0)
begin 
select 'you do not have any OTP generated' as ResponseMessage, 0 as ID
return
end

--selecting Last OTP by order by ID and selecting Top 1
select top (1)  @RealOTP =  OTP from OPT_Store where Email = @Email order by Id DESC
--comparing The OTP is it is right so send success Message
if (@RealOTP = @OTP)
begin
select 'otp is currect' as ResponseMessage, 1 as ID 
delete from OPT_Store where Email = @Email
end

--if not the valid so sending Failure Message
else
begin
select 'otp is incorrect' as ResponseMessage, 0 as ID 
end

end



GO
/****** Object:  StoredProcedure [dbo].[Publish_AddPrice_SP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <04-04-2024>
-- Description:	<for Adding Price,publish or Delete>
-- =============================================
CREATE proc [dbo].[Publish_AddPrice_SP]
@Price bigint,
@ActivityId bigint,
@EventId bigint,
@Flag varchar(100)
as
begin

if @Flag = 'Publish'
begin

declare @count bigint ;
select @count = COUNT(ActivityId) from ActivityTbl where EventId = @EventId ;

if @count = 0
begin 
select 'You can not publish this becuase you have to first add atleast one activity' as ResponseMessage, 0 as ID
return 
end

update EventTbl set IsPublish =1 where EventId = @EventId ;
select 'Publish successfully' as ResponseMessage, 1 as ID
end 

if @Flag = 'AddPrice'
begin
update ActivityTbl set Price = @Price where ActivityId = @ActivityId ;
select 'Updated Successfully' as ResponseMessage, 1 as ID 
end

if @Flag = 'DeleteEvent'
begin

declare @EventDeleteId bigint ;
select @EventDeleteId = EventId from EventTbl where EventId = @EventId ;

if @EventDeleteId IS NULL
begin
select 'please provide valid EventId' as ResponseMessage, 0 as ID 
return 
end

update EventTbl set IsActive = 0 where EventId = @EventId ;
select 'Deleted Successfully' as ResponseMessage, 1 as ID 
end

if @Flag = 'UnPublish'
begin
update EventTbl set IsPublish =0 where EventId = @EventId ;
select 'UnPublish successfully' as ResponseMessage, 1 as ID
end
end 
GO
/****** Object:  StoredProcedure [dbo].[RegisterUser_SP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <04-04-2024>
-- Description:	<for Register User>
-- =============================================

CREATE proc  [dbo].[RegisterUser_SP]  --'Dalsukh','naneradalsukh@gmail.com','4566544568','Dwarka','Dal@2002'
@Name varchar(100),
@Email varchar(320),
@Mobile varchar(10),
@Address varchar(100),
@Password varchar(100)
as
begin 
declare @Id bigint ;
select @Id = UserTblId from UserTbl where Email = @Email ;

--first check if user is already registered or not 
if @Id IS NOT NULL
begin 
select 'User is already Registered' as Resultmessage, 0 as ID
return
end 

insert into UserTbl values(@Name,@Email,@Mobile,@Address,GETDATE(),@Password,null) ;
select 'Register Successfully' as Resultmessage,1 as ID;
select UserTblId,Name,Email,Mobile,Address,CreatedTime,Password from UserTbl where Email = @Email ;
end
GO
/****** Object:  StoredProcedure [dbo].[Showing_Event_Activity_SP]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <04-04-2024>
-- Description:	<for showing an Event or Activity>
-- =============================================
CREATE proc [dbo].[Showing_Event_Activity_SP] --1,'Monthwise'
@EventId bigint,
@Flag varchar(1000)

as 
begin 

declare @count bigint ;

if @Flag IS NULL
begin
select 'please provide valid flag' as ResponseMessage, 0 as ID 
return
end

--showing only non published Events 


if @Flag = 'AdminEvents'
begin
select @count = COUNT(EventId) from EventTbl where IsPublish = 0 AND EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1
if @count = 0
begin
select 'Do not have any Event To publish' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select [EventId],[Name],[StartDate],[EndDate],[Description],[Image] from EventTbl where IsPublish = 0 AND EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1
end

--showing only published Events 
if @Flag = 'EmployeeEvent'

begin
select @count = COUNT(EventId) from EventTbl where IsPublish = 1 AND EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1;
if @count = 0
begin
select 'DO not have any scheduled by Admin' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select EventId, Name,StartDate,EndDate,Description,Image from EventTbl  where IsPublish = 1 AND  EndDate >=CONVERT(date, GETDATE())
AND IsActive = 1
end

--showing all the Activities 
if @Flag = 'ActibityShow'
begin


select @count = COUNT(ActivityId) from ActivityTbl where EventId = @EventId ;
if @count = 0
begin
select 'Do not have any activity yet' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select Name,Description,Price,EventId,StartDate,EndDate from ActivityTbl where EventId = @EventId ;
end 

--showing only Activities which don't have price
if @Flag = 'AdminActibityShow'
begin


select @count = COUNT(ActivityId) from ActivityTbl where EventId = @EventId AND Price = 0 ;
if @count = 0
begin
select 'Do not have any activity to add price' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select ActivityId,Name,Description,Price,EventId,StartDate,EndDate from ActivityTbl where EventId = @EventId AND Price = 0;
end 

--showing only on going Events 
if @Flag = 'Ongoing-Events'
begin


select @count = COUNT(EventId) from EventTbl where IsPublish = 1 AND (CONVERT(date, GETDATE()) between StartDate AND EndDate) AND IsActive = 1;
if @count = 0
begin
select 'DO not have any scheduled by Admin' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select EventId,Name,StartDate,EndDate,Description,Image from EventTbl  where IsPublish = 1 AND (CONVERT(date, GETDATE()) between StartDate AND EndDate) AND IsActive = 1;

end

--showing only upcoming Events 
if @Flag = 'Upcoming-Events'
begin


select @count = COUNT(EventId) from EventTbl where IsPublish = 1 AND StartDate>CONVERT(date, GETDATE()) AND IsActive = 1;
if @count = 0
begin
select 'DO not have any scheduled by Admin' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select EventId,Name,StartDate,EndDate,Description,Image from EventTbl  where IsPublish = 1 AND StartDate >CONVERT(date, GETDATE()) AND IsActive = 1;

end

--showing all the Events 
if @Flag = 'AllEvent'

begin
select @count = COUNT(EventId) from EventTbl where   EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1;
if @count = 0
begin
select 'DO not have any Events' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select EventId,Name,StartDate,EndDate,Description,Image,IsPublish from EventTbl  where  EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1
end

--this is for showing how much Events In Month
if @Flag = 'Monthwise'
begin
select @count = COUNT(EventId) from EventTbl where   EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1 AND IsPublish=1;
if @count = 0
begin
select 'DO not have any Events' as ResponseMessage, 0 as ID
return 
end

select 'Fetched Successfully' as ResponseMessage, 1 as ID 
select MONTH(StartDate) as Month,count(EventId) as count from (select * from EventTbl where  EndDate >=CONVERT(date, GETDATE()) AND IsActive = 1 AND IsPublish=1) EventTbl group by MONTH(StartDate) 
end 
end

GO
/****** Object:  StoredProcedure [dbo].[sp_GetTemplate]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Nanera Dalsukh>
-- Create date: <12-05-2024>
-- Description:	<for Generate OTP and Returning Template>
-- =============================================
CREATE PROC [dbo].[sp_GetTemplate] --"OTP",'naneradalsukh@gmail.com'
@Name VARCHAR(255),
@Email varchar(320)
AS
 BEGIN
declare @increase bigint ;
declare @increaseRegular bigint ;
declare @cnt bigint ;
declare @OTP bigint ;
set @increase = 15 ;
set @increaseRegular = 1 

--delete from panelty table whoever's time is exceed 15 minutes
delete from PaneltyTbl where GETDATE() > DATEADD(mi, @increase,CreadTime); 
select @cnt = COUNT(Id) from PaneltyTbl where Email = @Email ;

--if user is in panelty table so we return back and don't generate OTP
if (@cnt  > 0)
begin
select 'you can try after some time you are still in 15 minute loop' as ResponseMessage,0 as ID 
return
end

--delete from  OTP_Store whoever's time exceed 1 minute
delete from OPT_Store where GETDATE() > DATEADD(mi, @increaseRegular,GeneratedDatetime); 

select @cnt= COUNT(Id) from OPT_Store where Email = @Email ;

--if in table already 3 OTP so we will show the message and enter that EmailId User to Panelty Table
if(@cnt >= 3)
begin
select 'you already generated three OTPs try after 15 minutes' as ResponseMessage,0 as ID
insert into PaneltyTbl values(@Email,GETDATE());
return
end

 select @OTP = floor(1000 + RAND() * 8999);  
 insert into OPT_Store values(@Email,@otp,getdate());

 --sending Template to the User for Mail
 select @OTP as otp,'fetched successfully' as ResponseMessage, 1 as ID 
    SELECT Subject,Body
    FROM tbl_Template
    WHERE Name = @Name
	
 END
GO
/****** Object:  StoredProcedure [dbo].[SPUpdateEvent]    Script Date: 15-05-2024 18:48:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[SPUpdateEvent]
@Name varchar(100),
@Description varchar(MAX),
@StartDate datetime,
@EndDate datetime,
@Image varchar(MAX),
@EventId bigint 

as begin


declare @Id bigint ;
select @Id = EventId from EventTbl where EventId = @EventId 

--first check EventId is valid or not 
if @EventId IS NULL
begin
select 'not valid Event' as ResponseMessage, 0 as ID
return
end
--if EventId is valid so update the Event 
update EventTbl set Name = @Name, Description = @Description, StartDate = @StartDate, EndDate = @EndDate, Image = @Image,UpdatedDatetime = GETDATE() where EventId = @EventId;
delete from ActivityTbl where (CONVERT(date, StartDate) < CONVERT(date, @StartDate) OR CONVERT(date, EndDate) > CONVERT(date, @EndDate)) AND EventId = @EventId;
select 'Updated successfully' as ResponseMessage, 1 as ID
end

select * from EventTbl;
GO
USE [master]
GO
ALTER DATABASE [EventModule] SET  READ_WRITE 
GO
