﻿/*
Deployment script for CinemaDB

This code was generated by a tool.
Changes to this file may cause incorrect behavior and will be lost if
the code is regenerated.
*/

GO
SET ANSI_NULLS, ANSI_PADDING, ANSI_WARNINGS, ARITHABORT, CONCAT_NULL_YIELDS_NULL, QUOTED_IDENTIFIER ON;

SET NUMERIC_ROUNDABORT OFF;


GO
:setvar DatabaseName "CinemaDB"
:setvar DefaultFilePrefix "CinemaDB"
:setvar DefaultDataPath "C:\Users\Alecn\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"
:setvar DefaultLogPath "C:\Users\Alecn\AppData\Local\Microsoft\Microsoft SQL Server Local DB\Instances\MSSQLLocalDB\"

GO
:on error exit
GO
/*
Detect SQLCMD mode and disable script execution if SQLCMD mode is not supported.
To re-enable the script after enabling SQLCMD mode, execute the following:
SET NOEXEC OFF; 
*/
:setvar __IsSqlCmdEnabled "True"
GO
IF N'$(__IsSqlCmdEnabled)' NOT LIKE N'True'
    BEGIN
        PRINT N'SQLCMD mode must be enabled to successfully execute this script.';
        SET NOEXEC ON;
    END


GO
USE [master];


GO

IF (DB_ID(N'$(DatabaseName)') IS NOT NULL) 
BEGIN
    ALTER DATABASE [$(DatabaseName)]
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE [$(DatabaseName)];
END

GO
PRINT N'Creating $(DatabaseName)...'
GO
CREATE DATABASE [$(DatabaseName)]
    ON 
    PRIMARY(NAME = [$(DatabaseName)], FILENAME = N'$(DefaultDataPath)$(DefaultFilePrefix)_Primary.mdf')
    LOG ON (NAME = [$(DatabaseName)_log], FILENAME = N'$(DefaultLogPath)$(DefaultFilePrefix)_Primary.ldf') COLLATE SQL_Latin1_General_CP1_CI_AS
GO
USE [$(DatabaseName)];


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ANSI_NULLS ON,
                ANSI_PADDING ON,
                ANSI_WARNINGS ON,
                ARITHABORT ON,
                CONCAT_NULL_YIELDS_NULL ON,
                NUMERIC_ROUNDABORT OFF,
                QUOTED_IDENTIFIER ON,
                ANSI_NULL_DEFAULT ON,
                CURSOR_DEFAULT LOCAL,
                RECOVERY FULL,
                CURSOR_CLOSE_ON_COMMIT OFF,
                AUTO_CREATE_STATISTICS ON,
                AUTO_SHRINK OFF,
                AUTO_UPDATE_STATISTICS ON,
                RECURSIVE_TRIGGERS OFF 
            WITH ROLLBACK IMMEDIATE;
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CLOSE OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET ALLOW_SNAPSHOT_ISOLATION OFF;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET READ_COMMITTED_SNAPSHOT OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_UPDATE_STATISTICS_ASYNC OFF,
                PAGE_VERIFY NONE,
                DATE_CORRELATION_OPTIMIZATION OFF,
                DISABLE_BROKER,
                PARAMETERIZATION SIMPLE,
                SUPPLEMENTAL_LOGGING OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET TRUSTWORTHY OFF,
        DB_CHAINING OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
IF IS_SRVROLEMEMBER(N'sysadmin') = 1
    BEGIN
        IF EXISTS (SELECT 1
                   FROM   [master].[dbo].[sysdatabases]
                   WHERE  [name] = N'$(DatabaseName)')
            BEGIN
                EXECUTE sp_executesql N'ALTER DATABASE [$(DatabaseName)]
    SET HONOR_BROKER_PRIORITY OFF 
    WITH ROLLBACK IMMEDIATE';
            END
    END
ELSE
    BEGIN
        PRINT N'The database settings cannot be modified. You must be a SysAdmin to apply these settings.';
    END


GO
ALTER DATABASE [$(DatabaseName)]
    SET TARGET_RECOVERY_TIME = 0 SECONDS 
    WITH ROLLBACK IMMEDIATE;


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET FILESTREAM(NON_TRANSACTED_ACCESS = OFF),
                CONTAINMENT = NONE 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET AUTO_CREATE_STATISTICS ON(INCREMENTAL = OFF),
                MEMORY_OPTIMIZED_ELEVATE_TO_SNAPSHOT = OFF,
                DELAYED_DURABILITY = DISABLED 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE (QUERY_CAPTURE_MODE = ALL, DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_PLANS_PER_QUERY = 200, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 367), MAX_STORAGE_SIZE_MB = 100) 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE [$(DatabaseName)]
            SET QUERY_STORE = OFF 
            WITH ROLLBACK IMMEDIATE;
    END


GO
IF EXISTS (SELECT 1
           FROM   [master].[dbo].[sysdatabases]
           WHERE  [name] = N'$(DatabaseName)')
    BEGIN
        ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
        ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
        ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
    END


GO
IF fulltextserviceproperty(N'IsFulltextInstalled') = 1
    EXECUTE sp_fulltext_database 'enable';


GO
PRINT N'Creating [dbo].[Customers]...';


GO
CREATE TABLE [dbo].[Customers] (
    [CustomerId] INT           IDENTITY (1, 1) NOT NULL,
    [FirstName]  VARCHAR (MAX) NOT NULL,
    [LastName]   VARCHAR (MAX) NOT NULL,
    [Email]      VARCHAR (MAX) NOT NULL,
    [Phone]      VARCHAR (MAX) NOT NULL,
    PRIMARY KEY CLUSTERED ([CustomerId] ASC)
);


GO
PRINT N'Creating [dbo].[Halls]...';


GO
CREATE TABLE [dbo].[Halls] (
    [HallId]    INT          IDENTITY (1, 1) NOT NULL,
    [HallName]  VARCHAR (50) NOT NULL,
    [NMaxRow]   INT          NOT NULL,
    [NMaxColum] INT          NOT NULL,
    PRIMARY KEY CLUSTERED ([HallId] ASC)
);


GO
PRINT N'Creating [dbo].[Movies]...';


GO
CREATE TABLE [dbo].[Movies] (
    [MovieId]          INT           IDENTITY (1, 1) NOT NULL,
    [Name]             VARCHAR (MAX) NOT NULL,
    [Description]      VARCHAR (MAX) NOT NULL,
    [Director]         VARCHAR (MAX) NOT NULL,
    [Duration_Minutes] INT           NOT NULL,
    [InitialPrice]     MONEY         NOT NULL,
    PRIMARY KEY CLUSTERED ([MovieId] ASC)
);


GO
PRINT N'Creating [dbo].[Orders]...';


GO
CREATE TABLE [dbo].[Orders] (
    [OrderId]          INT            IDENTITY (1, 1) NOT NULL,
    [CustomerId]       INT            NULL,
    [ScheduleId]       INT            NULL,
    [OrderTotal]       MONEY          NULL,
    [OrderDateTime]    DATETIME2 (7)  NULL,
    [TicketIdentifier] NVARCHAR (MAX) NULL,
    PRIMARY KEY CLUSTERED ([OrderId] ASC)
);


GO
PRINT N'Creating [dbo].[OrdersSnacks]...';


GO
CREATE TABLE [dbo].[OrdersSnacks] (
    [Id]         INT   IDENTITY (1, 1) NOT NULL,
    [OrderId]    INT   NOT NULL,
    [SnackId]    INT   NOT NULL,
    [Quantity]   INT   NOT NULL,
    [UnitPrice]  MONEY NOT NULL,
    [OrderTotal] MONEY NOT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Schedules]...';


GO
CREATE TABLE [dbo].[Schedules] (
    [ScheduleId] INT      IDENTITY (1, 1) NOT NULL,
    [HallId]     INT      NOT NULL,
    [MovieId]    INT      NOT NULL,
    [StartTime]  TIME (7) NOT NULL,
    PRIMARY KEY CLUSTERED ([ScheduleId] ASC)
);


GO
PRINT N'Creating [dbo].[SeatsOrders]...';


GO
CREATE TABLE [dbo].[SeatsOrders] (
    [Id]      INT NOT NULL,
    [Row]     INT NULL,
    [Column]  INT NULL,
    [OrderId] INT NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC)
);


GO
PRINT N'Creating [dbo].[Snacks]...';


GO
CREATE TABLE [dbo].[Snacks] (
    [SnackId] INT           IDENTITY (1, 1) NOT NULL,
    [Name]    VARCHAR (MAX) NOT NULL,
    [Price]   MONEY         NOT NULL,
    PRIMARY KEY CLUSTERED ([SnackId] ASC)
);


GO
PRINT N'Creating [dbo].[FK_dbo.Orders_dbo.Customers_CustomerId]...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [FK_dbo.Orders_dbo.Customers_CustomerId] FOREIGN KEY ([CustomerId]) REFERENCES [dbo].[Customers] ([CustomerId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Orders_dbo.Schedules_ScheduleId]...';


GO
ALTER TABLE [dbo].[Orders]
    ADD CONSTRAINT [FK_dbo.Orders_dbo.Schedules_ScheduleId] FOREIGN KEY ([ScheduleId]) REFERENCES [dbo].[Schedules] ([ScheduleId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.OrdersSnacks_dbo.Order_OrderId]...';


GO
ALTER TABLE [dbo].[OrdersSnacks]
    ADD CONSTRAINT [FK_dbo.OrdersSnacks_dbo.Order_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.OrdersSnacks_dbo.Snacke_SnakeId]...';


GO
ALTER TABLE [dbo].[OrdersSnacks]
    ADD CONSTRAINT [FK_dbo.OrdersSnacks_dbo.Snacke_SnakeId] FOREIGN KEY ([SnackId]) REFERENCES [dbo].[Snacks] ([SnackId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Schedules_dbo.Movies_MovieId]...';


GO
ALTER TABLE [dbo].[Schedules]
    ADD CONSTRAINT [FK_dbo.Schedules_dbo.Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [dbo].[Movies] ([MovieId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.Schedules_dbo.Halls_HallId]...';


GO
ALTER TABLE [dbo].[Schedules]
    ADD CONSTRAINT [FK_dbo.Schedules_dbo.Halls_HallId] FOREIGN KEY ([HallId]) REFERENCES [dbo].[Halls] ([HallId]) ON DELETE CASCADE;


GO
PRINT N'Creating [dbo].[FK_dbo.SeatsOrders_dbo.Orders_OrderId]...';


GO
ALTER TABLE [dbo].[SeatsOrders]
    ADD CONSTRAINT [FK_dbo.SeatsOrders_dbo.Orders_OrderId] FOREIGN KEY ([OrderId]) REFERENCES [dbo].[Orders] ([OrderId]) ON DELETE CASCADE;


GO
-- Refactoring step to update target server with deployed transaction logs

IF OBJECT_ID(N'dbo.__RefactorLog') IS NULL
BEGIN
    CREATE TABLE [dbo].[__RefactorLog] (OperationKey UNIQUEIDENTIFIER NOT NULL PRIMARY KEY)
    EXEC sp_addextendedproperty N'microsoft_database_tools_support', N'refactoring log', N'schema', N'dbo', N'table', N'__RefactorLog'
END
GO
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '3da8c71f-b612-4ebd-9b9e-187125340e27')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('3da8c71f-b612-4ebd-9b9e-187125340e27')
IF NOT EXISTS (SELECT OperationKey FROM [dbo].[__RefactorLog] WHERE OperationKey = '950aa8c2-8d73-4b36-98bc-ce192d61a180')
INSERT INTO [dbo].[__RefactorLog] (OperationKey) values ('950aa8c2-8d73-4b36-98bc-ce192d61a180')

GO

GO
/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
DELETE from dbo.[Orders]
DBCC CHECKIDENT (Orders, RESEED, 1)
GO

DELETE FROM [dbo].[Customers]
DBCC CHECKIDENT (Customers, RESEED, 1)
GO

DELETE FROM [dbo].[Movies]
DBCC CHECKIDENT (Movies, RESEED, 1)
GO

DELETE FROM [dbo].[Halls]
DBCC CHECKIDENT (Halls, RESEED, 1)
GO

DELETE FROM [dbo].[Snacks]
DBCC CHECKIDENT (Snacks, RESEED, 1)
GO

DELETE FROM [dbo].[Schedules]
DBCC CHECKIDENT (Schedules, RESEED, 1)
GO

INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'N/A',N'N/A',N'N/A',N'N/A')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'John',N'River',N'7788881234',N'johnr@gmail.com')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'Ruby',N'Kava',N'6046959983',N'rubyk@gmail.com')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'Teddy',N'Bear',N'6043424763',N'ttd@gmail.com')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Email], [Phone]) VALUES (N'Mai', N'Hoang', N'mrhoangmai93@gmail.com', N'6043964139')
GO

SET IDENTITY_INSERT [dbo].[Halls] ON
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (1, N'Hall 1', 4, 4)
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (2, N'Hall 2', 4, 4)
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (3, N'Hall 3', 4, 4)
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (4, N'Hall 4', 4, 4)
SET IDENTITY_INSERT [dbo].[Halls] OFF
GO

INSERT INTO [dbo].[Movies] ([Name],[Director], [Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Mission Impossible 6',
N'David',N'Another Tom Cruise action movie',120,40)
INSERT INTO [dbo].[Movies] ([Name], [Director],[Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Thor',
N'James',N'Marvel studio proudly present',140,43)
INSERT INTO [dbo].[Movies] ([Name],[Director], [Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Kill Bill',
N'Frank',N'Famour action movie',114,39)
INSERT INTO [dbo].[Movies] ([Name],[Director], [Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Venom',
N'Eric',N'Venom from Marvel Universe',150,49)
GO

INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Pepsi 500ml',2.0)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Pepsi 300ml can', 1.8)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Coke 500ml', 2.2)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Popcorn small', 2.5)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Popcorn medium', 3.5)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Popcorn super', 4.5)
GO


INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (2,2,'09:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (2,2,'12:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (2,2,'15:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (2,2,'18:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (2,2,'21:00:00.0000000')

INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (3,3,'09:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (3,3,'11:30:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (3,3,'14:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (3,3,'16:30:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (3,3,'19:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (3,3,'21:30:00.0000000')

INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (4,4,'09:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (4,4,'11:30:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (4,4,'14:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (4,4,'16:30:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (4,4,'19:00:00.0000000')
INSERT INTO [dbo].[Schedules]([HallId],[MovieId],[StartTime]) VALUES (4,4,'21:30:00.0000000')
GO

GO
DECLARE @VarDecimalSupported AS BIT;

SELECT @VarDecimalSupported = 0;

IF ((ServerProperty(N'EngineEdition') = 3)
    AND (((@@microsoftversion / power(2, 24) = 9)
          AND (@@microsoftversion & 0xffff >= 3024))
         OR ((@@microsoftversion / power(2, 24) = 10)
             AND (@@microsoftversion & 0xffff >= 1600))))
    SELECT @VarDecimalSupported = 1;

IF (@VarDecimalSupported > 0)
    BEGIN
        EXECUTE sp_db_vardecimal_storage_format N'$(DatabaseName)', 'ON';
    END


GO
PRINT N'Update complete.';


GO
