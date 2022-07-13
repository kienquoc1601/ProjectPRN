USE [master]
GO
/****** Object:  Database [academicDB]    Script Date: 7/13/2022 10:51:11 PM ******/
CREATE DATABASE [academicDB] ON  PRIMARY 
( NAME = N'academicDB', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\academicDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'academicDB_log', FILENAME = N'D:\SQL\MSSQL15.SQLEXPRESS\MSSQL\DATA\academicDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [academicDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [academicDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [academicDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [academicDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [academicDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [academicDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [academicDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [academicDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [academicDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [academicDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [academicDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [academicDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [academicDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [academicDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [academicDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [academicDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [academicDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [academicDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [academicDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [academicDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [academicDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [academicDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [academicDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [academicDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [academicDB] SET  MULTI_USER 
GO
ALTER DATABASE [academicDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [academicDB] SET DB_CHAINING OFF 
GO
USE [academicDB]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](150) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[admin] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[course_id] [int] NOT NULL,
	[teacher_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[semester] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Course] PRIMARY KEY CLUSTERED 
(
	[course_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[fid] [int] NOT NULL,
	[fname] [varchar](50) NOT NULL,
	[url] [varchar](max) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GradeItem]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GradeItem](
	[grade_item_id] [int] NOT NULL,
	[course_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[weight] [float] NOT NULL,
 CONSTRAINT [PK_GradeItem] PRIMARY KEY CLUSTERED 
(
	[grade_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Major]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Major](
	[major_id] [int] NOT NULL,
	[major_name] [varchar](50) NOT NULL,
	[major_code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Major] PRIMARY KEY CLUSTERED 
(
	[major_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[MajorSubject]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MajorSubject](
	[major_id] [int] NOT NULL,
	[subject_id] [int] NOT NULL,
 CONSTRAINT [PK_MajorSubject] PRIMARY KEY CLUSTERED 
(
	[major_id] ASC,
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[rid] [int] NOT NULL,
	[rname] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleAccount]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleAccount](
	[rid] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
 CONSTRAINT [PK_RoleAccount] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RoleFeature]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleFeature](
	[rid] [int] NOT NULL,
	[fid] [int] NOT NULL,
 CONSTRAINT [PK_RoleFeature] PRIMARY KEY CLUSTERED 
(
	[rid] ASC,
	[fid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Student]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[student_id] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
	[major_id] [int] NOT NULL,
	[name] [varchar](50) NOT NULL,
	[img_src] [varchar](50) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
	[roll_number] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentGrade]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentGrade](
	[grade_item_id] [int] NOT NULL,
	[student_id] [int] NOT NULL,
	[grade_date] [date] NOT NULL,
	[score] [float] NOT NULL,
 CONSTRAINT [PK_StudentGrade] PRIMARY KEY CLUSTERED 
(
	[grade_item_id] ASC,
	[student_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[subject_id] [int] NOT NULL,
	[subject_name] [varchar](50) NOT NULL,
	[subject_code] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Subject] PRIMARY KEY CLUSTERED 
(
	[subject_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Teacher]    Script Date: 7/13/2022 10:51:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[teacher_id] [int] NOT NULL,
	[username] [varchar](150) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[img_src] [varchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[teacher_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password], [admin]) VALUES (N'hung1521', N'hung', 0)
INSERT [dbo].[Account] ([username], [password], [admin]) VALUES (N'manh21', N'manh', 1)
INSERT [dbo].[Account] ([username], [password], [admin]) VALUES (N'quoc1501', N'quoc', 0)
GO
INSERT [dbo].[Course] ([course_id], [teacher_id], [subject_id], [name], [semester]) VALUES (1, 1, 1, N'MAE21', N'spring21')
INSERT [dbo].[Course] ([course_id], [teacher_id], [subject_id], [name], [semester]) VALUES (2, 1, 2, N'PRJ21', N'summer21')
GO
INSERT [dbo].[GradeItem] ([grade_item_id], [course_id], [name], [weight]) VALUES (1, 1, N'Assignment 1', 10)
INSERT [dbo].[GradeItem] ([grade_item_id], [course_id], [name], [weight]) VALUES (2, 1, N'Assignment 2 ', 10)
INSERT [dbo].[GradeItem] ([grade_item_id], [course_id], [name], [weight]) VALUES (3, 1, N'Progress Test 1', 10)
INSERT [dbo].[GradeItem] ([grade_item_id], [course_id], [name], [weight]) VALUES (4, 2, N'Assignment 1 ', 10)
GO
INSERT [dbo].[Major] ([major_id], [major_name], [major_code]) VALUES (1, N'Software engineering', N'SE')
INSERT [dbo].[Major] ([major_id], [major_name], [major_code]) VALUES (2, N'Artificial intelligent', N'AI')
GO
INSERT [dbo].[Student] ([student_id], [username], [major_id], [name], [img_src], [gender], [dob], [roll_number]) VALUES (1, N'quoc1501', 1, N'bui kien quoc', N'aaa', 1, CAST(N'2001-01-16' AS Date), N'se1501')
INSERT [dbo].[Student] ([student_id], [username], [major_id], [name], [img_src], [gender], [dob], [roll_number]) VALUES (2, N'hung1521', 2, N'vu hung', N'bbb', 0, CAST(N'2001-09-05' AS Date), N'ai1521')
GO
INSERT [dbo].[StudentGrade] ([grade_item_id], [student_id], [grade_date], [score]) VALUES (1, 1, CAST(N'2022-05-05' AS Date), 5)
INSERT [dbo].[StudentGrade] ([grade_item_id], [student_id], [grade_date], [score]) VALUES (2, 1, CAST(N'2022-06-06' AS Date), 6)
INSERT [dbo].[StudentGrade] ([grade_item_id], [student_id], [grade_date], [score]) VALUES (4, 1, CAST(N'2022-06-06' AS Date), 7)
GO
INSERT [dbo].[Subject] ([subject_id], [subject_name], [subject_code]) VALUES (1, N'math101', N'MAE')
INSERT [dbo].[Subject] ([subject_id], [subject_name], [subject_code]) VALUES (2, N'program101', N'PRJ')
GO
INSERT [dbo].[Teacher] ([teacher_id], [username], [name], [img_src], [email]) VALUES (1, N'manh21', N'tien manh', N'ccc', N'manh21')
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Subject]
GO
ALTER TABLE [dbo].[Course]  WITH CHECK ADD  CONSTRAINT [FK_Course_Teacher] FOREIGN KEY([teacher_id])
REFERENCES [dbo].[Teacher] ([teacher_id])
GO
ALTER TABLE [dbo].[Course] CHECK CONSTRAINT [FK_Course_Teacher]
GO
ALTER TABLE [dbo].[GradeItem]  WITH CHECK ADD  CONSTRAINT [FK_GradeItem_Course] FOREIGN KEY([course_id])
REFERENCES [dbo].[Course] ([course_id])
GO
ALTER TABLE [dbo].[GradeItem] CHECK CONSTRAINT [FK_GradeItem_Course]
GO
ALTER TABLE [dbo].[MajorSubject]  WITH CHECK ADD  CONSTRAINT [FK_MajorSubject_Major] FOREIGN KEY([major_id])
REFERENCES [dbo].[Major] ([major_id])
GO
ALTER TABLE [dbo].[MajorSubject] CHECK CONSTRAINT [FK_MajorSubject_Major]
GO
ALTER TABLE [dbo].[MajorSubject]  WITH CHECK ADD  CONSTRAINT [FK_MajorSubject_Subject] FOREIGN KEY([subject_id])
REFERENCES [dbo].[Subject] ([subject_id])
GO
ALTER TABLE [dbo].[MajorSubject] CHECK CONSTRAINT [FK_MajorSubject_Subject]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccount_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_RoleAccount_Account]
GO
ALTER TABLE [dbo].[RoleAccount]  WITH CHECK ADD  CONSTRAINT [FK_RoleAccount_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[RoleAccount] CHECK CONSTRAINT [FK_RoleAccount_Role]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Feature] FOREIGN KEY([fid])
REFERENCES [dbo].[Feature] ([fid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Feature]
GO
ALTER TABLE [dbo].[RoleFeature]  WITH CHECK ADD  CONSTRAINT [FK_RoleFeature_Role] FOREIGN KEY([rid])
REFERENCES [dbo].[Role] ([rid])
GO
ALTER TABLE [dbo].[RoleFeature] CHECK CONSTRAINT [FK_RoleFeature_Role]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Account]
GO
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Major] FOREIGN KEY([major_id])
REFERENCES [dbo].[Major] ([major_id])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Major]
GO
ALTER TABLE [dbo].[StudentGrade]  WITH CHECK ADD  CONSTRAINT [FK_StudentGrade_GradeItem] FOREIGN KEY([grade_item_id])
REFERENCES [dbo].[GradeItem] ([grade_item_id])
GO
ALTER TABLE [dbo].[StudentGrade] CHECK CONSTRAINT [FK_StudentGrade_GradeItem]
GO
ALTER TABLE [dbo].[StudentGrade]  WITH CHECK ADD  CONSTRAINT [FK_StudentGrade_Student] FOREIGN KEY([student_id])
REFERENCES [dbo].[Student] ([student_id])
GO
ALTER TABLE [dbo].[StudentGrade] CHECK CONSTRAINT [FK_StudentGrade_Student]
GO
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Account] FOREIGN KEY([username])
REFERENCES [dbo].[Account] ([username])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Account]
GO
USE [master]
GO
ALTER DATABASE [academicDB] SET  READ_WRITE 
GO
