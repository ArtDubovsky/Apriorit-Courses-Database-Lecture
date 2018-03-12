IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[fn_ProductTotalQuantityByCategory]'))
BEGIN
    DROP FUNCTION fn_ProductTotalQuantityByCategory
END
GO

CREATE FUNCTION fn_ProductTotalQuantityByCategory(
    @categoryId INT
)
RETURNS TABLE
AS RETURN(SELECT p.ProductId AS ProductId
                 ,p.Name AS Product
	             ,SUM(sp.Quantity) AS TotalQuantity
          FROM Product AS p
              LEFT JOIN ShopProduct AS sp ON sp.ProductId = p.ProductId
		  WHERE p.CategoryId = @categoryId
          GROUP BY p.ProductId, p.Name)