/*    ==Scripting Parameters==

    Source Server Version : SQL Server 2019 (15.0.2080)
    Source Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Source Database Engine Type : Standalone SQL Server

    Target Server Version : SQL Server 2019
    Target Database Engine Edition : Microsoft SQL Server Enterprise Edition
    Target Database Engine Type : Standalone SQL Server
*/
USE [master]
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyEventProcessingLogin##]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyEventProcessingLogin##')
CREATE LOGIN [##MS_PolicyEventProcessingLogin##] WITH PASSWORD=N'jiBuQ3SplqJ/brP2+mibfepneXtZcwQkk6RyAlKQWcU=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyEventProcessingLogin##] DISABLE
GO
/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [##MS_PolicyTsqlExecutionLogin##]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'##MS_PolicyTsqlExecutionLogin##')
CREATE LOGIN [##MS_PolicyTsqlExecutionLogin##] WITH PASSWORD=N'aQ7Q0Bt+mpM8qNKIig1r5zqYpD+mRjKOtLZKgmLiaj0=', DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=ON
GO
ALTER LOGIN [##MS_PolicyTsqlExecutionLogin##] DISABLE
GO
/****** Object:  Login [NT AUTHORITY\SYSTEM]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT AUTHORITY\SYSTEM')
CREATE LOGIN [NT AUTHORITY\SYSTEM] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT Service\MSSQL$MSSQLSERVER01]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT Service\MSSQL$MSSQLSERVER01')
CREATE LOGIN [NT Service\MSSQL$MSSQLSERVER01] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLAgent$MSSQLSERVER01]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLAgent$MSSQLSERVER01')
CREATE LOGIN [NT SERVICE\SQLAgent$MSSQLSERVER01] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLTELEMETRY$MSSQLSERVER01]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLTELEMETRY$MSSQLSERVER01')
CREATE LOGIN [NT SERVICE\SQLTELEMETRY$MSSQLSERVER01] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\SQLWriter]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\SQLWriter')
CREATE LOGIN [NT SERVICE\SQLWriter] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [NT SERVICE\Winmgmt]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'NT SERVICE\Winmgmt')
CREATE LOGIN [NT SERVICE\Winmgmt] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
/****** Object:  Login [SAMAWIA_CS29100\It Zone]    Script Date: 1/30/2022 7:35:17 PM ******/
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'SAMAWIA_CS29100\It Zone')
CREATE LOGIN [SAMAWIA_CS29100\It Zone] FROM WINDOWS WITH DEFAULT_DATABASE=[master], DEFAULT_LANGUAGE=[us_english]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT Service\MSSQL$MSSQLSERVER01]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLAgent$MSSQLSERVER01]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\SQLWriter]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [NT SERVICE\Winmgmt]
GO
ALTER SERVER ROLE [sysadmin] ADD MEMBER [SAMAWIA_CS29100\It Zone]
GO
USE [Lab_2]
GO
/****** Object:  Table [dbo].[Student-1]    Script Date: 1/30/2022 7:35:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Student-1]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Student-1](
	[Registration No] [int] NULL,
	[Name] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Department] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Session] [int] NULL,
	[CGPA] [int] NULL,
	[Address] [nchar](10) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
) ON [PRIMARY]
END
GO
ALTER AUTHORIZATION ON [dbo].[Student-1] TO  SCHEMA OWNER 
GO
