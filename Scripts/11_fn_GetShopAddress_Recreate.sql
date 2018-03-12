IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[fn_GetShopAddress]'))
BEGIN
    DROP FUNCTION fn_GetShopAddress
END
GO

CREATE FUNCTION fn_GetShopAddress(
    @shopId INT
)
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @fullAddress NVARCHAR(MAX)
    SELECT TOP 1 @fullAddress = ISNULL(Address, '') + ', ' 
	                            + ISNULL(City, '') + ', ' 
				                + ISNULL(Country, '')
	FROM Shop
	WHERE ShopId = @shopId

	RETURN(@fullAddress);
END