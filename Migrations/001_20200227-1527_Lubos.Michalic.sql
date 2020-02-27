-- <Migration ID="3dbc8cc4-f97b-4110-b2ad-c85c86047064" />
GO

PRINT N'Creating [dbo].[states]'
GO
CREATE TABLE [dbo].[states]
(
[country_code] [char] (2) NOT NULL,
[state_code] [varchar] (3) NOT NULL,
[state_name] [varchar] (25) NOT NULL
)
GO
PRINT N'Creating primary key [PK__states__0C51C004908A3947] on [dbo].[states]'
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [PK__states__0C51C004908A3947] PRIMARY KEY CLUSTERED  ([country_code], [state_code])
GO
PRINT N'Adding constraints to [dbo].[states]'
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [UQ__states__9CE427BCED704DFA] UNIQUE NONCLUSTERED  ([country_code], [state_name])
GO
PRINT N'Creating [dbo].[customers]'
GO
CREATE TABLE [dbo].[customers]
(
[customer_id] [int] NOT NULL IDENTITY(1, 1),
[title] [varchar] (10) NOT NULL,
[name] [varchar] (25) NOT NULL,
[address_line1] [varchar] (25) NOT NULL,
[address_line2] [varchar] (25) NULL,
[city] [varchar] (25) NOT NULL,
[postcode] [varchar] (10) NOT NULL,
[state_code] [varchar] (3) NOT NULL,
[country_code] [char] (2) NOT NULL,
[express_shipping] [bit] NULL,
[mobile_number] [bigint] NOT NULL
)
GO
PRINT N'Creating primary key [PK__customer__CD65CB85A3384CE9] on [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [PK__customer__CD65CB85A3384CE9] PRIMARY KEY CLUSTERED  ([customer_id])
GO
PRINT N'Adding constraints to [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [UQ__customer__30462B0FAE3E33E1] UNIQUE NONCLUSTERED  ([mobile_number])
GO
PRINT N'Creating [dbo].[countries]'
GO
CREATE TABLE [dbo].[countries]
(
[country_code] [char] (2) NOT NULL,
[country_name] [varchar] (25) NOT NULL
)
GO
PRINT N'Creating primary key [PK__countrie__3436E9A40C57AADF] on [dbo].[countries]'
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [PK__countrie__3436E9A40C57AADF] PRIMARY KEY CLUSTERED  ([country_code])
GO
PRINT N'Adding constraints to [dbo].[countries]'
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [UQ__countrie__F70188947DA73824] UNIQUE NONCLUSTERED  ([country_name])
GO
PRINT N'Adding foreign keys to [dbo].[states]'
GO
ALTER TABLE [dbo].[states] ADD CONSTRAINT [FK__states__country___286302EC] FOREIGN KEY ([country_code]) REFERENCES [dbo].[countries] ([country_code])
GO
PRINT N'Adding foreign keys to [dbo].[customers]'
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [FK__customers__2C3393D0] FOREIGN KEY ([country_code], [state_code]) REFERENCES [dbo].[states] ([country_code], [state_code])
GO
