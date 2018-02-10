USE [master]
GO
/****** Object:  Database [series]    Script Date: 10.02.2018 20:39:37 ******/
CREATE DATABASE [series]
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [series].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [series] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [series] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [series] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [series] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [series] SET ARITHABORT OFF 
GO
ALTER DATABASE [series] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [series] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [series] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [series] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [series] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [series] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [series] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [series] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [series] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [series] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [series] SET ALLOW_SNAPSHOT_ISOLATION ON 
GO
ALTER DATABASE [series] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [series] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [series] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [series] SET  MULTI_USER 
GO
ALTER DATABASE [series] SET DB_CHAINING OFF 
GO
ALTER DATABASE [series] SET ENCRYPTION ON
GO
ALTER DATABASE [series] SET QUERY_STORE = ON
GO
ALTER DATABASE [series] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 7), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 10, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO)
GO
USE [series]
GO
/****** Object:  Table [dbo].[Hashtags]    Script Date: 10.02.2018 20:39:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Hashtags](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[HashTag] [varchar](100) NOT NULL,
	[LastTweetId] [varchar](100) NULL,
	[SeriesId] [int] NULL,
	[RowVersion] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
/****** Object:  Table [dbo].[Series]    Script Date: 10.02.2018 20:39:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Series](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Rating] [decimal](18, 0) NOT NULL,
	[VotesCount] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON)
)

GO
ALTER TABLE [dbo].[Series] ADD  DEFAULT ((0)) FOR [Rating]
GO
ALTER TABLE [dbo].[Series] ADD  DEFAULT ((0)) FOR [VotesCount]
GO
ALTER TABLE [dbo].[Hashtags]  WITH CHECK ADD FOREIGN KEY([SeriesId])
REFERENCES [dbo].[Series] ([Id])
GO
USE [master]
GO
ALTER DATABASE [series] SET  READ_WRITE 
GO