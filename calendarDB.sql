USE [master]
GO
/****** Object:  Database [calendarDB]    Script Date: 7/13/2022 10:57:58 PM ******/
CREATE DATABASE [calendarDB] ON  PRIMARY 
( NAME = N'calendarDB', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\calendarDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'calendarDB_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\calendarDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [calendarDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [calendarDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [calendarDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [calendarDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [calendarDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [calendarDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [calendarDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [calendarDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [calendarDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [calendarDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [calendarDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [calendarDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [calendarDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [calendarDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [calendarDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [calendarDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [calendarDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [calendarDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [calendarDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [calendarDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [calendarDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [calendarDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [calendarDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [calendarDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [calendarDB] SET  MULTI_USER 
GO
ALTER DATABASE [calendarDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [calendarDB] SET DB_CHAINING OFF 
GO
USE [calendarDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/13/2022 10:57:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Event]    Script Date: 7/13/2022 10:57:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Event](
	[event_id] [int] IDENTITY(1,1) NOT NULL,
	[user_id] [int] NOT NULL,
	[event_name] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_Event] PRIMARY KEY CLUSTERED 
(
	[event_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupEvent]    Script Date: 7/13/2022 10:57:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupEvent](
	[group_id] [int] IDENTITY(1,1) NOT NULL,
	[admin_id] [int] NOT NULL,
	[event_name] [varchar](50) NOT NULL,
	[description] [varchar](max) NOT NULL,
	[date] [date] NOT NULL,
 CONSTRAINT [PK_GroupEvent] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupUser]    Script Date: 7/13/2022 10:57:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupUser](
	[group_id] [int] NOT NULL,
	[user_id] [int] NOT NULL,
 CONSTRAINT [PK_GroupUser] PRIMARY KEY CLUSTERED 
(
	[group_id] ASC,
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/13/2022 10:57:58 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](50) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [admin]) VALUES (N'hung', N'hung2001', 0)
INSERT [dbo].[Account] ([username], [password], [admin]) VALUES (N'manh', N'manh69', 0)
INSERT [dbo].[Account] ([username], [password], [admin]) VALUES (N'quoc', N'quoc1601', 1)
GO
SET IDENTITY_INSERT [dbo].[Event] ON 

INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (1, 1, N'di choi', N'di choi o times city', CAST(N'2022-07-08' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (2, 1, N'di hoc ', N'di hoc o truong ', CAST(N'2022-08-07' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (3, 1, N'danh dien tu', N'di net o gaming x ', CAST(N'2022-10-05' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (4, 1, N'hop nhom ', N'hop nhom lam bai tap', CAST(N'2022-08-07' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (5, 1, N'hahaha123', N'du ma aaaaaaaaaa', CAST(N'2022-07-13' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (6, 1, N'lululu', N'a sdasgasdad', CAST(N'2022-07-14' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (7, 1, N'testing', N'testingtestingtestingtesting', CAST(N'2022-08-05' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (8, 5, N'quoc event', N'event cua quoc', CAST(N'2022-07-13' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (9, 5, N'quocevent', N'sjdfihappskdsd', CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (10, 5, N'dasdas', N'dasdasdasdasd', CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (11, 5, N'dsadasdsad', N'dsdasdsadasdasd', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (12, 5, N'dsadasd', N'sdaddsdsdsd', CAST(N'2022-07-01' AS Date))
INSERT [dbo].[Event] ([event_id], [user_id], [event_name], [description], [date]) VALUES (13, 5, N'abc123', N'abciasniodfajspd', CAST(N'2022-07-13' AS Date))
SET IDENTITY_INSERT [dbo].[Event] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([user_id], [username]) VALUES (1, N'hung')
INSERT [dbo].[User] ([user_id], [username]) VALUES (4, N'manh')
INSERT [dbo].[User] ([user_id], [username]) VALUES (5, N'quoc')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Event]  WITH CHECK ADD  CONSTRAINT [FK_Event_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[Event] CHECK CONSTRAINT [FK_Event_User]
GO
ALTER TABLE [dbo].[GroupUser]  WITH CHECK ADD  CONSTRAINT [FK_GroupUser_GroupEvent] FOREIGN KEY([group_id])
REFERENCES [dbo].[GroupEvent] ([group_id])
GO
ALTER TABLE [dbo].[GroupUser] CHECK CONSTRAINT [FK_GroupUser_GroupEvent]
GO
ALTER TABLE [dbo].[GroupUser]  WITH CHECK ADD  CONSTRAINT [FK_GroupUser_User] FOREIGN KEY([user_id])
REFERENCES [dbo].[User] ([user_id])
GO
ALTER TABLE [dbo].[GroupUser] CHECK CONSTRAINT [FK_GroupUser_User]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Account]
GO
USE [master]
GO
ALTER DATABASE [calendarDB] SET  READ_WRITE 
GO
