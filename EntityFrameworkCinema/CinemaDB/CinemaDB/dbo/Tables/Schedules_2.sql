﻿CREATE TABLE [dbo].[Schedules] (
    [ScheduleId]    INT            NOT NULL IDENTITY,
	
    [HallId] INT NOT NULL, 
	[MovieId]       INT            NOT NULL,
    [StartTime]     TIME NOT NULL,
    
    [A1] BIT NOT NULL DEFAULT 0, 
	[A2] BIT NOT NULL DEFAULT 0, 
	[A3] BIT NOT NULL DEFAULT 0, 
	[A4] BIT NOT NULL DEFAULT 0, 
	[B1] BIT NOT NULL DEFAULT 0, 
	[B2] BIT NOT NULL DEFAULT 0, 
	[B3] BIT NOT NULL DEFAULT 0, 
	[B4] BIT NOT NULL DEFAULT 0, 
	[C1] BIT NOT NULL DEFAULT 0, 
	[C2] BIT NOT NULL DEFAULT 0, 
	[C3] BIT NOT NULL DEFAULT 0, 
	[C4] BIT NOT NULL DEFAULT 0, 
	[D1] BIT NOT NULL DEFAULT 0, 
	[D2] BIT NOT NULL DEFAULT 0, 
	[D3] BIT NOT NULL DEFAULT 0, 
	[D4] BIT NOT NULL DEFAULT 0, 
	[E1] BIT NOT NULL DEFAULT 0, 
	[E2] BIT NOT NULL DEFAULT 0, 
	[E3] BIT NOT NULL DEFAULT 0, 
	[E4] BIT NOT NULL DEFAULT 0, 

    
    PRIMARY KEY CLUSTERED ([ScheduleId] ASC),
    CONSTRAINT [FK_dbo.Schedules_dbo.Movies_MovieId] FOREIGN KEY ([MovieId]) REFERENCES [dbo].[Movies] ([MovieId]) ON DELETE CASCADE,
	CONSTRAINT [FK_dbo.Schedules_dbo.Hall_HallId] FOREIGN KEY ([HallId]) REFERENCES [dbo].[Hall] ([Id]) ON DELETE CASCADE
);