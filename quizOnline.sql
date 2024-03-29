USE [master]
GO
/****** Object:  Database [QuizOnlineNeverDie]    Script Date: 1/29/2021 2:23:03 PM ******/
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
/****** Object:  Table [dbo].[tblAccount]    Script Date: 1/29/2021 2:23:03 PM ******/
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
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 1/29/2021 2:23:03 PM ******/
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
/****** Object:  Table [dbo].[tblQuizHistory]    Script Date: 1/29/2021 2:23:03 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuizHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
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
/****** Object:  Table [dbo].[tblRole]    Script Date: 1/29/2021 2:23:03 PM ******/
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
/****** Object:  Table [dbo].[tblStatus]    Script Date: 1/29/2021 2:23:03 PM ******/
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
/****** Object:  Table [dbo].[tblSubject]    Script Date: 1/29/2021 2:23:03 PM ******/
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
INSERT [dbo].[tblAccount] ([email], [name], [password], [role], [status]) VALUES (N'thai2@gmail.com', N'Dang Quoc Thai', N'bff68a757103548c8cc212b27b74126db610bf0116f629f76a93416fdbac1bc5', 2, 1)
INSERT [dbo].[tblAccount] ([email], [name], [password], [role], [status]) VALUES (N'thai3@gmail.com', N'Thai', N'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3', 2, 1)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q1', N'Yasuo có bao nhiêu trang phục ? ( Không tính trang phục mặc định )', N'1', N'3', N'5', N'9', N'9', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q10', N'
Which land does Yasuo usually go?', N'Mid', N'Top', N'Bot', N'Jungle', N'Mid', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q11', N'_________ computing refers to applications and services that run on a distributed network using virtualized resources.', N'Distributed', N'Cloud', N'Soft', N'Parallel', N'Cloud', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q12', N'Point out the wrong statement :', N'The massive scale of cloud computing systems was enabled by the popularization of the Internet', N'Soft computing represents a real paradigm shift in the way in which systems are deployed', N'Cloud computing makes the long-held dream of utility computing possible with a pay-as-you-go, infinitely scalable, universally available system', N'All of the mentioned', N'Soft computing represents a real paradigm shift in the way in which systems are deployed', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q13', N'________ as a utility is a dream that dates from the beginning of the computing industry itself.', N'Model', N'Computing', N'Software', N'All of the mentioned', N'Software', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q14', N'Which of the following is essential concept related to Cloud ?', N'Reliability', N'Productivity', N'Abstraction', N'All of the mentioned', N'Reliability', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q15', N'Point out the wrong statement :', N'All applications benefit from deployment in the cloud', N'All applications benefit from deployment in the cloud', N'Cloud computing is revolutionary, even if the technology it is built on is evolutionary', N'None of the mentioned', N'Cloud computing is revolutionary, even if the technology it is built on is evolutionary', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q16', N'Which of the following cloud concept is related to pooling and sharing of resources ?', N'Polymorphism', N'Abstraction', N'Virtualization', N'None of the mentioned', N'Polymorphism', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q17', N'________ has many of the characteristics of what is now being called cloud computing.', N'Internet', N'Softwares', N'Web Service', N'All of the mentioned', N'Web Service', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q18', N'Which of the following can be identified as cloud ?', N'Web Applications', N'Intranet', N'Hadoop', N'All of the mentioned', N'Intranet', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q19', N'Which of the following can be identified as cloud ?', N'real', N'virtual', N'cloud', N'none of the mentioned', N'virtual', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q2', N'Yasuo''s nickname is?', N'Indomitable Soul', N'The Unforgettable', N'The Swordsman Village', N'
Romantic Tourists', N'The Unforgettable', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q20', N'Which of the following is Cloud Platform by Amazon ?', N'Azure', N'AWS', N'Cloudera', N'All of the mentioned', N'Azure', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q21', N'_________ model consists of the particular types of services that you can access on a cloud computing platform.', N'Service', N'Deployment', N'Application', N'None of the mentioned', N'Deployment', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q22', N'Point out the correct statement :', N'The use of the word "cloud" makes reference to the two essential concepts', N'Cloud computing abstracts systems by pooling and sharing resources', N'Cloud computing is nothing more than the Internet', N'All of the mentioned', N'Cloud computing abstracts systems by pooling and sharing resources', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q23', N'________ refers to the location and management of the cloud''s infrastructure', N'Service', N'Deployment', N'Application', N'None of the mentioned', N'None of the mentioned', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q24', N'Which of the following is deployment model ?', N'public', N'private', N'hybrid', N'all of the mentioned', N'private', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q25', N'Point out the wrong statement :', N'Cloud Computing has two distinct sets of models', N'Amazon has built a worldwide network of datacenters to service its search engine', N'Azure enables .NET Framework applications to run over the Internet', N'None of the mentioned', N'None of the mentioned', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q26', N'Which of the following is best known service model ?', N'SaaS', N'IaaS', N'PaaS', N'All of the mentioned', N'IaaS', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q27', N'The __________ model originally did not require a cloud to use virtualization to pool resources.', N'NEFT', N'NIST', N'NIT', N'All of the mentioned', N'NIT', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q28', N'_______ model attempts to categorize a cloud network based on four dimensional factors.', N'Cloud Square', N'Cloud Service', N'Cloud Cube', N'All of the mentioned', N'All of the mentioned', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q29', N'How many types of dimensions exists in Cloud Cube Model ?', N'1', N'2', N'3', N'4', N'1', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q3', N'What is Yasuo''s RP price?', N'69 RP', N'90 RP', N'88 RP', N'99 RP', N'99 RP', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q30', N'Which of the following dimension is related to organization''s boundaries ', N'Physical location of data', N'Ownership', N'Security boundary', N'All of the mentioned', N'Ownership', CAST(N'2021-01-26' AS Date), N'PRC391', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q4', N'Yasuo''s brother''s name?', N'Yaone', N'Yone', N'Yohn', N'Yahn', N'Yone', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q5', N'
Quotes quoted by Yasuo in the legend?', N'
"I am a swordsman! Go and travel with the winds!"', N'
"Excellent wind sword skills, those who get in the way will die!"', N'"The story of a sword rewritten in blood"', N'
"I''ll find it out with the elder killer!"', N'"The story of a sword rewritten in blood"', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q6', N'Where are Yasuo''s enemies (Aurelion sol, Leona, Ahri, Kalista, Shyvana, Sona, Teemo, Rek''Sai, Garen, Quinn)', N'All', N'Ahri, Leona', N'Kalista, Aurelion Sol và Shyvana', N'None', N'None', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q7', N'
Yasuo''s last skill was named?', N'The power of Lang Visitors', N'Last breath', N'Steel tempest', N'
4 Strike Last breath', N'Last breath', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q8', N'
Yasuo''s passive has a name?', N'
Dao Of Lang Visitors', N'Last breath', N'Wind wall', N'
Lang Guest Tuong Tran', N'
Dao Of Lang Visitors', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
INSERT [dbo].[tblQuestion] ([id], [question_content], [answer_1], [answer_2], [answer_3], [answer_4], [answer_correct], [createDate], [subjectID], [status]) VALUES (N'Q9', N'
[Super Hard] Yasuo''s eyes color?', N'Brown', N'White', N'Black', N'Gray', N'Black', CAST(N'2021-01-25' AS Date), N'Yasuo', 2)
SET IDENTITY_INSERT [dbo].[tblQuizHistory] ON 

INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (1, N'dangquocthai.fedev@gmail.com', N'Yasuo', 2, 1, CAST(N'00:00:02' AS Time), CAST(N'2021-01-26 06:11:03.057' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (2, N'dangquocthai.fedev@gmail.com', N'Yasuo', 2, 1, CAST(N'00:00:02' AS Time), CAST(N'2021-01-26 07:54:13.757' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (3, N'dangquocthai.fedev@gmail.com', N'Yasuo', 0, 0, CAST(N'00:00:03' AS Time), CAST(N'2021-01-26 07:57:23.290' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (4, N'dangquocthai.fedev@gmail.com', N'Yasuo', 0, 0, CAST(N'00:00:27' AS Time), CAST(N'2021-01-26 08:00:02.090' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (5, N'dangquocthai.fedev@gmail.com', N'Yasuo', 4, 2, CAST(N'00:00:29' AS Time), CAST(N'2021-01-26 08:02:25.223' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (6, N'dangquocthai.fedev@gmail.com', N'Yasuo', 10, 5, CAST(N'00:00:16' AS Time), CAST(N'2021-01-26 08:09:48.500' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (7, N'dangquocthai.fedev@gmail.com', N'Yasuo', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 08:15:40.337' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (8, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, NULL, CAST(N'2021-01-26 08:21:59.370' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (9, N'dangquocthai.fedev@gmail.com', N'Yasuo', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 08:24:58.720' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (10, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:02' AS Time), CAST(N'2021-01-26 08:26:59.993' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (11, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 08:28:02.007' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (12, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:13' AS Time), CAST(N'2021-01-26 08:34:26.210' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (13, N'dangquocthai.fedev@gmail.com', N'Yasuo', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 08:35:44.430' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (14, N'dangquocthai.fedev@gmail.com', N'Yasuo', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 08:43:12.170' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (15, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 09:02:09.403' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (16, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 09:02:16.500' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (17, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:04' AS Time), CAST(N'2021-01-26 14:48:01.447' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (18, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 14:48:11.827' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (19, N'thai3@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:02' AS Time), CAST(N'2021-01-26 14:50:33.810' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (20, N'dangquocthai.fedev@gmail.com', N'PRC391', 6, 3, CAST(N'00:00:58' AS Time), CAST(N'2021-01-26 15:03:20.213' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (21, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 15:04:57.793' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (22, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:03' AS Time), CAST(N'2021-01-26 15:14:14.777' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (23, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 15:16:48.577' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (24, N'dangquocthai.fedev@gmail.com', N'Yasuo', 2, 1, CAST(N'00:00:02' AS Time), CAST(N'2021-01-26 15:16:56.953' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (25, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-26 18:44:26.853' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (26, N'dangquocthai.fedev@gmail.com', N'Yasuo', 10, 5, CAST(N'00:00:15' AS Time), CAST(N'2021-01-27 03:16:09.113' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (27, N'dangquocthai.fedev@gmail.com', N'Yasuo', 6, 3, CAST(N'00:00:20' AS Time), CAST(N'2021-01-27 14:33:11.337' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (28, N'dangquocthai.fedev@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:05' AS Time), CAST(N'2021-01-29 00:03:51.663' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (29, N'thai2@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:03' AS Time), CAST(N'2021-01-29 07:12:15.423' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (30, N'thai2@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:03' AS Time), CAST(N'2021-01-29 07:12:51.217' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (31, N'thai2@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:01' AS Time), CAST(N'2021-01-29 07:13:29.043' AS DateTime))
INSERT [dbo].[tblQuizHistory] ([id], [accountEmail], [subjectID], [point], [num_of_correct_answer], [time], [date]) VALUES (32, N'thai2@gmail.com', N'PRC391', 0, 0, CAST(N'00:00:02' AS Time), CAST(N'2021-01-29 07:14:30.540' AS DateTime))
SET IDENTITY_INSERT [dbo].[tblQuizHistory] OFF
INSERT [dbo].[tblRole] ([role], [description]) VALUES (1, N'Admin     ')
INSERT [dbo].[tblRole] ([role], [description]) VALUES (2, N'Student   ')
INSERT [dbo].[tblStatus] ([status], [description]) VALUES (1, N'New       ')
INSERT [dbo].[tblStatus] ([status], [description]) VALUES (2, N'Active    ')
INSERT [dbo].[tblStatus] ([status], [description]) VALUES (3, N'deActive  ')
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [quizTime], [numberQuestion], [status]) VALUES (N'PRC391', N'Cloud Computing', 30, 5, 2)
INSERT [dbo].[tblSubject] ([subjectID], [subjectName], [quizTime], [numberQuestion], [status]) VALUES (N'Yasuo', N'Yasuo - TT7', 10, 5, 2)
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
