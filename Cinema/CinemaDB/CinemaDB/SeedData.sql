﻿/*
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
go

DELETE FROM [dbo].[Customers]
DBCC CHECKIDENT (Customers, RESEED, 1)
go

DELETE FROM [dbo].[Movies]
DBCC CHECKIDENT (Movies, RESEED, 1)
go

DELETE FROM [dbo].[Halls]
DBCC CHECKIDENT (Halls, RESEED, 1)
go

DELETE FROM [dbo].[Snacks]
DBCC CHECKIDENT (Snacks, RESEED, 1)
go

DELETE FROM [dbo].[Schedules]
DBCC CHECKIDENT (Schedules, RESEED, 1)
go

INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'N/A',N'N/A',N'N/A',N'N/A')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'John',N'River',N'7788881234',N'johnr@gmail.com')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'Ruby',N'Kava',N'6046959983',N'rubyk@gmail.com')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Phone],[Email]) VALUES (N'Teddy',N'Bear',N'6043424763',N'ttd@gmail.com')
INSERT INTO [dbo].[Customers]([FirstName], [LastName], [Email], [Phone]) VALUES (N'Mai', N'Hoang', N'mrhoangmai93@gmail.com', N'6043964139')
go

SET IDENTITY_INSERT [dbo].[Halls] ON
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (1, N'Hall 1', 4, 4)
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (2, N'Hall 2', 4, 4)
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (3, N'Hall 3', 4, 4)
INSERT INTO [dbo].[Halls] ([HallId], [HallName], [NMaxColum], [NMaxRow]) VALUES (4, N'Hall 4', 4, 4)
SET IDENTITY_INSERT [dbo].[Halls] OFF
go

INSERT INTO [dbo].[Movies] ([Name],[Director], [Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Mission Impossible 6',
N'David',N'Another Tom Cruise action movie',120,40)
INSERT INTO [dbo].[Movies] ([Name], [Director],[Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Thor',
N'James',N'Marvel studio proudly present',140,43)
INSERT INTO [dbo].[Movies] ([Name],[Director], [Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Kill Bill',
N'Frank',N'Famour action movie',114,39)
INSERT INTO [dbo].[Movies] ([Name],[Director], [Description], [Duration_Minutes],[InitialPrice]) VALUES (N'Venom',
N'Eric',N'Venom from Marvel Universe',150,49)
go

INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Pepsi 500ml',2.0)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Pepsi 300ml can', 1.8)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Coke 500ml', 2.2)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Popcorn small', 2.5)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Popcorn medium', 3.5)
INSERT INTO [dbo].[Snacks]([Name], [Price]) VALUES (N'Popcorn super', 4.5)
go


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
go


INSERT INTO [dbo].[Orders]([CustomerId] ,[ScheduleId],[TicketIdentifier],[OrderTotal],[OrderDateTime] ) 
VALUES (1, 2,N'Txsoijdsjoij', 1000,'2018-10-08 12:35:29. 1234567')
INSERT INTO [dbo].[Orders]([CustomerId] ,[ScheduleId],[TicketIdentifier],[OrderTotal],[OrderDateTime] ) 
VALUES (2, 4,N'Txssijdsjoig', 250,'2018-12-01 16:35:29. 1234567')
INSERT INTO [dbo].[Orders]([CustomerId] ,[ScheduleId],[TicketIdentifier],[OrderTotal],[OrderDateTime] ) 
VALUES (2, 3,N'Txssijcvtyoa', 333,'2018-11-15 19:00:00. 1234567')
INSERT INTO [dbo].[Orders]([CustomerId] ,[ScheduleId],[TicketIdentifier],[OrderTotal],[OrderDateTime] ) 
VALUES (3, 8,N'Txssijdsfdwe', 44,'2018-11-15 19:00:00. 1234567')
go

DELETE FROM [dbo].[SeatsOrders]
DBCC CHECKIDENT (SeatsOrders, RESEED, 1)
go

INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,1,1)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,2,1)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,3,1)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,4,1)

INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (2,1,1)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (2,2,1)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (2,3,1)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (2,4,1)

INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,1,2)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,2,2)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (3,1,2)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (3,2,2)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,1,3)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,2,3)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,3,4)
INSERT INTO [dbo].[SeatsOrders]([Row],[Column],[OrderId] ) 
VALUES (1,4,4)
go