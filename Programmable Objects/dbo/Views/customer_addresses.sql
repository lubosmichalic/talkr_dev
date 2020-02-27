IF OBJECT_ID('[dbo].[customer_addresses]') IS NOT NULL
	DROP VIEW [dbo].[customer_addresses];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE VIEW [dbo].[customer_addresses] AS
    SELECT  customer_id,
            address_line1 + ', '
              + ISNULL(address_line2 + ', ', '')
              + city + ', '
              + postcode + ', '
              + CASE state_name WHEN '' THEN '' ELSE state_name + ', ' END
              + country_name AS address
    FROM    dbo.customers
    JOIN    dbo.states ON states.state_code = customers.state_code AND states.country_code = customers.country_code
    JOIN    dbo.countries ON countries.country_code = customers.country_code
GO
