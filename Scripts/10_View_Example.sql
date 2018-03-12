-- Without view
SELECT p.Name AS Product
	   ,c.Name AS Category
       ,SUM(sp.Quantity) AS TotalQuantity
FROM Product AS p
    LEFT JOIN Category AS c ON c.CategoryId = p.CategoryId
    LEFT JOIN ShopProduct AS sp ON sp.ProductId = p.ProductId
GROUP BY p.ProductId, p.Name, c.Name

-- With view

SELECT ptq.Product AS Product
       ,c.Name AS Category
	   ,ptq.TotalQuantity
FROM v_ProductTotalQuantity AS ptq
    INNER JOIN Category AS c ON c.CategoryId = ptq.CategoryId