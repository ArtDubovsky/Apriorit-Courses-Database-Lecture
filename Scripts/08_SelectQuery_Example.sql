SELECT p.ProductId AS ProductId
       ,p.Name AS Product
       ,SUM(sp.Quantity) AS TotalQuantity
FROM Product AS p
    LEFT JOIN ShopProduct AS sp ON sp.ProductId = p.ProductId
GROUP BY p.ProductId, p.Name