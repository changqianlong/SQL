USE [master]
GO
/****** Object:  Database [StudentDB]    Script Date: 2020/6/22 22:22:32 ******/
CREATE DATABASE [StudentDB] ON  PRIMARY 
( NAME = N'StudentDB', FILENAME = N'D:\Data\DB\StudentDB.ndf' , SIZE = 4160KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'StudentDB_log', FILENAME = N'D:\Data\DB\StudentDB_log.ldf' , SIZE = 1280KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [StudentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [StudentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [StudentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [StudentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [StudentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [StudentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [StudentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [StudentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [StudentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [StudentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [StudentDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [StudentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [StudentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [StudentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [StudentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [StudentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [StudentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [StudentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [StudentDB] SET RECOVERY FULL 
GO
ALTER DATABASE [StudentDB] SET  MULTI_USER 
GO
ALTER DATABASE [StudentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [StudentDB] SET DB_CHAINING OFF 
GO
USE [StudentDB]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 2020/6/22 22:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Course](
	[cno] [int] NOT NULL,
	[cname] [varchar](25) NULL,
	[createtime] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[cno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SC]    Script Date: 2020/6/22 22:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SC](
	[sno] [int] NOT NULL,
	[cno] [int] NOT NULL,
	[grade] [float] NOT NULL,
 CONSTRAINT [PK__SC__905C05330FE6FC24] PRIMARY KEY CLUSTERED 
(
	[sno] ASC,
	[cno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Student]    Script Date: 2020/6/22 22:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Student](
	[sno] [int] NOT NULL,
	[sname] [varchar](20) NULL,
	[ssex] [varchar](2) NULL,
	[sage] [int] NULL,
	[sdept] [varchar](20) NULL,
	[scome] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[sno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[mis_student3]    Script Date: 2020/6/22 22:22:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[mis_student3] as SELECT Student.sname FROM Student,SC,Course WHERE
Student.sno = SC.sno AND Course.cno = SC.cno AND Student.sdept= '信息管理' AND 
Course.cname ='数据库基础A' AND SC.grade >90
GO
INSERT [dbo].[Course] ([cno], [cname], [createtime]) VALUES (1, N'数据库', CAST(0x90400B00 AS Date))
INSERT [dbo].[Course] ([cno], [cname], [createtime]) VALUES (2, N'C# ', CAST(0x7C400B00 AS Date))
INSERT [dbo].[Course] ([cno], [cname], [createtime]) VALUES (3, N'Java', CAST(0xB73D0B00 AS Date))
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (1, 1, 5.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (2, 1, 5.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (2, 3, 3.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (3, 1, 5.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (3, 2, 2.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (3, 3, 3.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (4, 2, 2.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (5, 1, 5.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (6, 1, 5.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (7, 3, 3.1)
INSERT [dbo].[SC] ([sno], [cno], [grade]) VALUES (8, 1, 5.1)
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (1, N'张三', N'男', 18, N'计算机学院', CAST(0x1C400B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (2, N'李四', N'女', 19, N'计算机学院', CAST(0x8A410B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (3, N'王五', N'女', 19, N'计算机学院', CAST(0x8A410B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (4, N'赵六', N'男', 19, N'计算机学院', CAST(0x8A410B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (5, N'珊迪', N'女', 19, N'计算机学院', CAST(0x8A410B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (6, N'海绵宝宝', N'女', 19, N'计算机学院', CAST(0x8A410B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (7, N'派大星', N'女', 19, N'计算机学院', CAST(0x8A410B00 AS Date))
INSERT [dbo].[Student] ([sno], [sname], [ssex], [sage], [sdept], [scome]) VALUES (8, N'乾子大大', N'男', 21, N'计算机学院', CAST(0x8A410B00 AS Date))
ALTER TABLE [dbo].[SC]  WITH CHECK ADD  CONSTRAINT [cno] FOREIGN KEY([cno])
REFERENCES [dbo].[Course] ([cno])
GO
ALTER TABLE [dbo].[SC] CHECK CONSTRAINT [cno]
GO
ALTER TABLE [dbo].[SC]  WITH CHECK ADD  CONSTRAINT [sno] FOREIGN KEY([sno])
REFERENCES [dbo].[Student] ([sno])
GO
ALTER TABLE [dbo].[SC] CHECK CONSTRAINT [sno]
GO
USE [master]
GO
ALTER DATABASE [StudentDB] SET  READ_WRITE 
GO
