CREATE TABLE [dbo].[countries]
(
[country_code] [char] (2) NOT NULL,
[country_name] [varchar] (25) NOT NULL
)
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [PK__countrie__3436E9A40C57AADF] PRIMARY KEY CLUSTERED  ([country_code])
GO
ALTER TABLE [dbo].[countries] ADD CONSTRAINT [UQ__countrie__F70188947DA73824] UNIQUE NONCLUSTERED  ([country_name])
GO
