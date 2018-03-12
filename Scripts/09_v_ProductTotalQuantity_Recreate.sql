IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[v_ProductTotalQuantity]'))
BEGIN
    DROP VIEW v_ProductTotalQuantity
END
GO

CREATE VIEW v_ProductTotalQuantity
AS SELECT p.ProductId AS ProductId
       ,p.Name AS Product
	   ,p.CategoryId AS CategoryId
       ,SUM(sp.Quantity) AS TotalQuantity
FROM Product AS p
    LEFT JOIN ShopProduct AS sp ON sp.ProductId = p.ProductId
GROUP BY p.ProductId, p.Name, p.CategoryId