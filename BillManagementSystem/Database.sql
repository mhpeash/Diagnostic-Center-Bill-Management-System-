USE [master]
GO
/****** Object:  Database [DiagnosticCenterDBFinal]    Script Date: 05-Jun-16 11:10:56 AM ******/
CREATE DATABASE [DiagnosticCenterDBFinal]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DiagnosticCenterDBFinal', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\DATA\DiagnosticCenterDBFinal.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'DiagnosticCenterDBFinal_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLSERVER\MSSQL\DATA\DiagnosticCenterDBFinal_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DiagnosticCenterDBFinal].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET ARITHABORT OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET  DISABLE_BROKER 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET  MULTI_USER 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [DiagnosticCenterDBFinal]
GO
/****** Object:  Table [dbo].[Patient]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Patient](
	[PatientId] [int] IDENTITY(1,1) NOT NULL,
	[PatientName] [nvarchar](50) NULL,
	[DOB] [date] NULL,
	[BillNo]  AS ('B-'+right('0000'+CONVERT([varchar](5),[PatientId]),(5))) PERSISTED,
	[MobileNo] [varchar](50) NULL,
	[TotalAmount] [decimal](18, 0) NULL,
	[DueDate] [date] NULL,
	[PaymentStatus] [varchar](10) NULL,
 CONSTRAINT [PK_Patient] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PatientTests]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PatientTests](
	[PatientId] [int] NOT NULL,
	[TestId] [int] NOT NULL,
	[RequestDate] [date] NULL,
 CONSTRAINT [PK_PatientTests_1] PRIMARY KEY CLUSTERED 
(
	[PatientId] ASC,
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Tests]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tests](
	[TestId] [int] IDENTITY(1,1) NOT NULL,
	[TestName] [varchar](max) NULL,
	[TestFee] [decimal](18, 0) NULL,
	[TestTypeId] [int] NULL,
 CONSTRAINT [PK_Tests] PRIMARY KEY CLUSTERED 
(
	[TestId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestType]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestType](
	[TestTypeId] [int] IDENTITY(1,1) NOT NULL,
	[TestTypeName] [varchar](50) NULL,
 CONSTRAINT [PK_TestType] PRIMARY KEY CLUSTERED 
(
	[TestTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[DateWiseTestReport]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[DateWiseTestReport]

as 

SELECT  t.TestId,t.TestName, t.TestFee, count(t.TestId) as TestCount,count(t.TestId)*t.TestFee AS TotalFee, pt.RequestDate FROM Tests T
left JOIN PatientTests pt
ON t.TestId = pt.[TestId] 
group by t.TestName, t.TestFee,pt.RequestDate,t.TestId





GO
/****** Object:  View [dbo].[DateWiseTestTypeReport]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[DateWiseTestTypeReport] 
AS 
SELECT  tt.TestTypeName,t.TestFee, count(t.TestId) as TestCount,count(t.TestId)*t.TestFee AS TotalFee, pt.RequestDate
FROM TestType tt
FULL JOIN Tests t ON tt.TestTypeId = t.TestTypeId
FULL JOIN PatientTests pt ON t.TestId =pt.TestId
group by t.TestName, t.TestFee,pt.RequestDate, tt.TestTypeName



GO
/****** Object:  View [dbo].[ViewTests]    Script Date: 05-Jun-16 11:10:56 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ViewTests]
AS
SELECT t.TestName, t.TestFee, ty.TestTypeName FROM [dbo].[Tests] t
INNER JOIN [dbo].[TestType] ty
ON t.[TestTypeId] = ty.[TestTypeId]






GO
SET ANSI_PADDING ON
SET IDENTITY_INSERT [dbo].[Patient] ON 

INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [MobileNo], [TotalAmount], [DueDate], [PaymentStatus]) VALUES (1, N'shuvo', CAST(0xF0390B00 AS Date), N'01704532101', CAST(0 AS Decimal(18, 0)), CAST(0x723B0B00 AS Date), N'False')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [MobileNo], [TotalAmount], [DueDate], [PaymentStatus]) VALUES (2, N'rahat', CAST(0x79380B00 AS Date), N'12345321234', CAST(400 AS Decimal(18, 0)), CAST(0x723B0B00 AS Date), N'True')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [MobileNo], [TotalAmount], [DueDate], [PaymentStatus]) VALUES (3, N'piash', CAST(0x63370B00 AS Date), N'01932542111', CAST(700 AS Decimal(18, 0)), CAST(0x723B0B00 AS Date), N'True')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [MobileNo], [TotalAmount], [DueDate], [PaymentStatus]) VALUES (4, N'sharlin', CAST(0x25150B00 AS Date), N'01734532345', CAST(700 AS Decimal(18, 0)), CAST(0x723B0B00 AS Date), N'False')
INSERT [dbo].[Patient] ([PatientId], [PatientName], [DOB], [MobileNo], [TotalAmount], [DueDate], [PaymentStatus]) VALUES (5, N'sdg', CAST(0x783B0B00 AS Date), N'34544444444', CAST(550 AS Decimal(18, 0)), CAST(0x753B0B00 AS Date), N'False')
SET IDENTITY_INSERT [dbo].[Patient] OFF
SET ANSI_PADDING OFF
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (1, 3, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (2, 3, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (3, 1, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (3, 2, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (3, 3, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (4, 1, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (4, 2, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (4, 3, CAST(0x723B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (5, 2, CAST(0x753B0B00 AS Date))
INSERT [dbo].[PatientTests] ([PatientId], [TestId], [RequestDate]) VALUES (5, 3, CAST(0x753B0B00 AS Date))
SET IDENTITY_INSERT [dbo].[Tests] ON 

INSERT [dbo].[Tests] ([TestId], [TestName], [TestFee], [TestTypeId]) VALUES (1, N'RBS', CAST(344 AS Decimal(18, 0)), 5)
INSERT [dbo].[Tests] ([TestId], [TestName], [TestFee], [TestTypeId]) VALUES (2, N'S. Creatinine', CAST(344 AS Decimal(18, 0)), 5)
INSERT [dbo].[Tests] ([TestId], [TestName], [TestFee], [TestTypeId]) VALUES (3, N'Hand X-ray', CAST(444 AS Decimal(18, 0)), 6)
INSERT [dbo].[Tests] ([TestId], [TestName], [TestFee], [TestTypeId]) VALUES (4, N'Test', CAST(333 AS Decimal(18, 0)), 8)
SET IDENTITY_INSERT [dbo].[Tests] OFF
SET IDENTITY_INSERT [dbo].[TestType] ON 

INSERT [dbo].[TestType] ([TestTypeId], [TestTypeName]) VALUES (5, N'Blood')
INSERT [dbo].[TestType] ([TestTypeId], [TestTypeName]) VALUES (6, N'X-Ray')
INSERT [dbo].[TestType] ([TestTypeId], [TestTypeName]) VALUES (7, N'USG')
INSERT [dbo].[TestType] ([TestTypeId], [TestTypeName]) VALUES (8, N'Test')
INSERT [dbo].[TestType] ([TestTypeId], [TestTypeName]) VALUES (9, N'UCG')
SET IDENTITY_INSERT [dbo].[TestType] OFF
ALTER TABLE [dbo].[Patient] ADD  CONSTRAINT [DF_PaymentStatus]  DEFAULT (N'False') FOR [PaymentStatus]
GO
ALTER TABLE [dbo].[PatientTests]  WITH CHECK ADD  CONSTRAINT [FK_PatientTests_Patient] FOREIGN KEY([PatientId])
REFERENCES [dbo].[Patient] ([PatientId])
GO
ALTER TABLE [dbo].[PatientTests] CHECK CONSTRAINT [FK_PatientTests_Patient]
GO
ALTER TABLE [dbo].[PatientTests]  WITH CHECK ADD  CONSTRAINT [FK_PatientTests_Tests] FOREIGN KEY([TestId])
REFERENCES [dbo].[Tests] ([TestId])
GO
ALTER TABLE [dbo].[PatientTests] CHECK CONSTRAINT [FK_PatientTests_Tests]
GO
USE [master]
GO
ALTER DATABASE [DiagnosticCenterDBFinal] SET  READ_WRITE 
GO
