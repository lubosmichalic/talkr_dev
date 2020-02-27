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
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [PK__customer__CD65CB85A3384CE9] PRIMARY KEY CLUSTERED  ([customer_id])
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [UQ__customer__30462B0FAE3E33E1] UNIQUE NONCLUSTERED  ([mobile_number])
GO
ALTER TABLE [dbo].[customers] ADD CONSTRAINT [FK__customers__2C3393D0] FOREIGN KEY ([country_code], [state_code]) REFERENCES [dbo].[states] ([country_code], [state_code])
GO
