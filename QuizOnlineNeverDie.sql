USE [master]
GO
/****** Object:  Database [QuizOnlineNeverDie]    Script Date: 1/22/2021 5:00:09 PM ******/
CREATE DATABASE [QuizOnlineNeverDie]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuizOnlineNeverDie', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuizOnlineNeverDie.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'QuizOnlineNeverDie_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\QuizOnlineNeverDie_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [QuizOnlineNeverDie] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuizOnlineNeverDie].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuizOnlineNeverDie] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET RECOVERY FULL 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET  MULTI_USER 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuizOnlineNeverDie] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [QuizOnlineNeverDie] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuizOnlineNeverDie', N'ON'
GO
USE [QuizOnlineNeverDie]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 1/22/2021 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[email] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](max) NULL,
	[role] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 1/22/2021 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[id] [nvarchar](10) NOT NULL,
	[question_content] [nvarchar](max) NULL,
	[answer_1] [nvarchar](max) NULL,
	[answer_2] [nvarchar](max) NULL,
	[answer_3] [nvarchar](max) NULL,
	[answer_4] [nvarchar](max) NULL,
	[answer_correct] [nvarchar](max) NULL,
	[createDate] [date] NULL,
	[subjectID] [nvarchar](10) NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblQuizHistory]    Script Date: 1/22/2021 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizHistory](
	[id] [int] NOT NULL,
	[accountEmail] [nvarchar](50) NULL,
	[subjectID] [nvarchar](10) NULL,
	[point] [float] NULL,
	[num_of_correct_answer] [int] NULL,
	[time] [time](7) NULL,
	[date] [datetime] NULL,
 CONSTRAINT [PK_tblQuizHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblRole]    Script Date: 1/22/2021 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblRole](
	[role] [int] NOT NULL,
	[description] [nchar](10) NULL,
 CONSTRAINT [PK_tblRole] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblStatus]    Script Date: 1/22/2021 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblStatus](
	[status] [int] NOT NULL,
	[description] [nchar](10) NULL,
 CONSTRAINT [PK_tblStatus] PRIMARY KEY CLUSTERED 
(
	[status] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 1/22/2021 5:00:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[subjectID] [nvarchar](10) NOT NULL,
	[subjectName] [nvarchar](50) NULL,
	[quizTime] [int] NULL,
	[numberQuestion] [int] NULL,
	[status] [int] NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
INSERT [dbo].[tblAccount] ([email], [name], [password], [role], [status]) VALUES (N'dangquocthai.fedev@gmail.com', N'Thai front-end dev', N'bff68a757103548c8cc212b27b74126db610bf0116f629f76a93416fdbac1bc5', 2, 1)
INSERT [dbo].[tblAccount] ([email], [name], [password], [role], [status]) VALUES (N'dangquocthai07061998@gmail.com', N'Dang Quoc Thai', N'bff68a757103548c8cc212b27b74126db610bf0116f629f76a93416fdbac1bc5', 1, 1)
INSERT [dbo].[tblRole] ([role], [description]) VALUES (1, N'Admin     ')
INSERT [dbo].[tblRole] ([role], [description]) VALUES (2, N'Student   ')
INSERT [dbo].[tblStatus] ([status], [description]) VALUES (1, N'New       ')
INSERT [dbo].[tblStatus] ([status], [description]) VALUES (2, N'Active    ')
INSERT [dbo].[tblStatus] ([status], [description]) VALUES (3, N'deActive  ')
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblRole] FOREIGN KEY([role])
REFERENCES [dbo].[tblRole] ([role])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblRole]
GO
ALTER TABLE [dbo].[tblAccount]  WITH CHECK ADD  CONSTRAINT [FK_tblAccount_tblStatus] FOREIGN KEY([status])
REFERENCES [dbo].[tblStatus] ([status])
GO
ALTER TABLE [dbo].[tblAccount] CHECK CONSTRAINT [FK_tblAccount_tblStatus]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblStatus] FOREIGN KEY([status])
REFERENCES [dbo].[tblStatus] ([status])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblStatus]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubject]
GO
ALTER TABLE [dbo].[tblQuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizHistory_tblAccount] FOREIGN KEY([accountEmail])
REFERENCES [dbo].[tblAccount] ([email])
GO
ALTER TABLE [dbo].[tblQuizHistory] CHECK CONSTRAINT [FK_tblQuizHistory_tblAccount]
GO
ALTER TABLE [dbo].[tblQuizHistory]  WITH CHECK ADD  CONSTRAINT [FK_tblQuizHistory_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuizHistory] CHECK CONSTRAINT [FK_tblQuizHistory_tblSubject]
GO
ALTER TABLE [dbo].[tblSubject]  WITH CHECK ADD  CONSTRAINT [FK_tblSubject_tblStatus] FOREIGN KEY([status])
REFERENCES [dbo].[tblStatus] ([status])
GO
ALTER TABLE [dbo].[tblSubject] CHECK CONSTRAINT [FK_tblSubject_tblStatus]
GO
USE [master]
GO
ALTER DATABASE [QuizOnlineNeverDie] SET  READ_WRITE 
GO
