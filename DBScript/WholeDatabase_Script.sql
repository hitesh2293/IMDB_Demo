USE [master]
GO
/****** Object:  Database [IMDB_Demo]    Script Date: 4/18/2019 1:45:20 AM ******/
CREATE DATABASE [IMDB_Demo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IMDB_Demo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IMDB_Demo.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IMDB_Demo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\IMDB_Demo_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [IMDB_Demo] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IMDB_Demo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IMDB_Demo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IMDB_Demo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IMDB_Demo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IMDB_Demo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IMDB_Demo] SET ARITHABORT OFF 
GO
ALTER DATABASE [IMDB_Demo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IMDB_Demo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [IMDB_Demo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IMDB_Demo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IMDB_Demo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IMDB_Demo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IMDB_Demo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IMDB_Demo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IMDB_Demo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IMDB_Demo] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IMDB_Demo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IMDB_Demo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IMDB_Demo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IMDB_Demo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IMDB_Demo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IMDB_Demo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IMDB_Demo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IMDB_Demo] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IMDB_Demo] SET  MULTI_USER 
GO
ALTER DATABASE [IMDB_Demo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IMDB_Demo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IMDB_Demo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IMDB_Demo] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [IMDB_Demo]
GO
/****** Object:  Table [dbo].[lkpGender]    Script Date: 4/18/2019 1:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lkpGender](
	[GenderID] [int] IDENTITY(1,1) NOT NULL,
	[GenderName] [varchar](250) NULL,
	[GenderCode] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lkpUserType]    Script Date: 4/18/2019 1:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lkpUserType](
	[UT_ID] [int] IDENTITY(1,1) NOT NULL,
	[UT_TypeName] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[UT_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MovieAssignement]    Script Date: 4/18/2019 1:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MovieAssignement](
	[MA_ID] [int] IDENTITY(1,1) NOT NULL,
	[MA_MovieID] [int] NULL,
	[MA_UserID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[MA_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Movies]    Script Date: 4/18/2019 1:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Movies](
	[M_ID] [int] IDENTITY(1,1) NOT NULL,
	[M_Name] [varchar](250) NULL,
	[M_YearOfRelease] [varchar](10) NULL,
	[M_Plot] [varchar](max) NULL,
	[M_Poster] [varchar](max) NULL,
	[M_IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[M_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[UserDetails]    Script Date: 4/18/2019 1:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[UserDetails](
	[UD_ID] [int] IDENTITY(1,1) NOT NULL,
	[UD_UserType] [int] NULL,
	[UD_Name] [varchar](250) NULL,
	[UD_Sex] [int] NULL,
	[UD_DOB] [datetime] NULL,
	[UD_Bio] [varchar](max) NULL,
	[UD_IsDeleted] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[UD_ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[lkpGender] ON 

GO
INSERT [dbo].[lkpGender] ([GenderID], [GenderName], [GenderCode]) VALUES (1, N'Male', N'AAAA')
GO
INSERT [dbo].[lkpGender] ([GenderID], [GenderName], [GenderCode]) VALUES (2, N'Female', N'AAAB')
GO
SET IDENTITY_INSERT [dbo].[lkpGender] OFF
GO
SET IDENTITY_INSERT [dbo].[lkpUserType] ON 

GO
INSERT [dbo].[lkpUserType] ([UT_ID], [UT_TypeName]) VALUES (1, N'Actors')
GO
INSERT [dbo].[lkpUserType] ([UT_ID], [UT_TypeName]) VALUES (2, N'Prodcucers')
GO
SET IDENTITY_INSERT [dbo].[lkpUserType] OFF
GO
SET IDENTITY_INSERT [dbo].[MovieAssignement] ON 

GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (1, 1, 1)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (2, 2, 1025)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (3, 2, 1)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (4, 2, 2)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (5, 3, 1029)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (6, 3, 1026)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (7, 3, 1028)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (8, 4, 1030)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (9, 4, 1026)
GO
INSERT [dbo].[MovieAssignement] ([MA_ID], [MA_MovieID], [MA_UserID]) VALUES (10, 4, 1027)
GO
SET IDENTITY_INSERT [dbo].[MovieAssignement] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 

GO
INSERT [dbo].[Movies] ([M_ID], [M_Name], [M_YearOfRelease], [M_Plot], [M_Poster], [M_IsDeleted]) VALUES (1, N'movie name', N'2019', N'secctor 91', N'test.jpg', 0)
GO
INSERT [dbo].[Movies] ([M_ID], [M_Name], [M_YearOfRelease], [M_Plot], [M_Poster], [M_IsDeleted]) VALUES (2, N'test movie UI', N'2019', N'UI Plot', N'Chrysanthemum.jpg', 0)
GO
INSERT [dbo].[Movies] ([M_ID], [M_Name], [M_YearOfRelease], [M_Plot], [M_Poster], [M_IsDeleted]) VALUES (3, N'Happy new year', N'2013', N'mumbai', N'Hydrangeas.jpg', 0)
GO
INSERT [dbo].[Movies] ([M_ID], [M_Name], [M_YearOfRelease], [M_Plot], [M_Poster], [M_IsDeleted]) VALUES (4, N'ABCD', N'2014', N'Ram bagh', N'Koala.jpg', 0)
GO
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[UserDetails] ON 

GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1, 1, N'Test Actor', 1, CAST(N'2019-04-15 23:41:27.787' AS DateTime), N'this bio of test actor', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (2, 1, N'Test Actor 2', 1, CAST(N'2019-04-15 23:41:37.090' AS DateTime), N'this bio of test actor 2', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1002, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1003, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1004, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1005, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1006, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1007, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1008, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1009, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1010, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1011, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1012, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1013, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1014, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1015, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1016, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1017, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1018, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1019, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1020, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1021, 1, N'aaa', NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1022, 1, N'aaa', 1, NULL, N'Entry Actor Bio', NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1023, 1, N'ram kumar', 1, NULL, N'Entry Actor Bio..', NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1024, 1, N'test actor', 1, NULL, N'Entry Actor Bio.', NULL)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1025, 2, N'producer 1', 1, CAST(N'1993-04-04 00:00:00.000' AS DateTime), N'Entry Actor Bio...', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1026, 1, N'Salam Khan', 1, CAST(N'1993-01-01 00:00:00.000' AS DateTime), N'salam khan is the best.', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1027, 1, N'Shahrukh Khan', 1, CAST(N'1993-02-02 00:00:00.000' AS DateTime), N'Shahrukh Khan is the best.', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1028, 1, N'Amitabh Bachchan', 1, CAST(N'1990-03-03 00:00:00.000' AS DateTime), N'Amitabh Bachchan is big of Bollywood.', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1029, 2, N'Karan Johar', 1, CAST(N'1966-05-12 00:00:00.000' AS DateTime), N'Karan Johar.', 0)
GO
INSERT [dbo].[UserDetails] ([UD_ID], [UD_UserType], [UD_Name], [UD_Sex], [UD_DOB], [UD_Bio], [UD_IsDeleted]) VALUES (1030, 2, N'Ekta Kapoor', 2, CAST(N'1995-05-05 00:00:00.000' AS DateTime), N'Ekta Kapoor.', 0)
GO
SET IDENTITY_INSERT [dbo].[UserDetails] OFF
GO
ALTER TABLE [dbo].[MovieAssignement]  WITH CHECK ADD  CONSTRAINT [fk_MovieAssignement_Movies] FOREIGN KEY([MA_MovieID])
REFERENCES [dbo].[Movies] ([M_ID])
GO
ALTER TABLE [dbo].[MovieAssignement] CHECK CONSTRAINT [fk_MovieAssignement_Movies]
GO
ALTER TABLE [dbo].[MovieAssignement]  WITH CHECK ADD  CONSTRAINT [fk_MovieAssignement_UserDetails] FOREIGN KEY([MA_UserID])
REFERENCES [dbo].[UserDetails] ([UD_ID])
GO
ALTER TABLE [dbo].[MovieAssignement] CHECK CONSTRAINT [fk_MovieAssignement_UserDetails]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [fk_UserDetails_lkpGender] FOREIGN KEY([UD_Sex])
REFERENCES [dbo].[lkpGender] ([GenderID])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [fk_UserDetails_lkpGender]
GO
ALTER TABLE [dbo].[UserDetails]  WITH CHECK ADD  CONSTRAINT [fk_UserDetails_lkpUserType] FOREIGN KEY([UD_UserType])
REFERENCES [dbo].[lkpUserType] ([UT_ID])
GO
ALTER TABLE [dbo].[UserDetails] CHECK CONSTRAINT [fk_UserDetails_lkpUserType]
GO
/****** Object:  StoredProcedure [dbo].[usp_GetMovieData]    Script Date: 4/18/2019 1:45:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_GetMovieData]
AS
BEGIN
	SELECT M.M_ID MId
		,M.M_Name MName
		,M.M_YearOfRelease MYearOfRelease
		,M.M_Plot MPlot
		,M.M_Poster MPoster
		,M.M_IsDeleted MIsDeleted
		,Isnull(STUFF((
					SELECT UD_Name + ', '
					FROM MovieAssignement MAA
					INNER JOIN UserDetails UDA ON UDA.UD_ID = MAA.MA_UserID
					WHERE UDA.UD_UserType = 1
						AND UDA.UD_IsDeleted = 0
						AND MAA.MA_MovieID = MA.MA_MovieID
					FOR XML path('')
					), 1, 0, ''), '') AS ActorsName
		,UD.UD_Name AS ProducerName
	FROM MovieAssignement MA
	INNER JOIN Movies M ON M.M_ID = MA.MA_MovieID
	INNER JOIN UserDetails UD ON UD.UD_ID = MA.MA_UserID
		AND UD.UD_UserType = 2
		AND UD.UD_IsDeleted = 0
END
GO
USE [master]
GO
ALTER DATABASE [IMDB_Demo] SET  READ_WRITE 
GO
