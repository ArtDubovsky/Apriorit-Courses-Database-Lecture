IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[tr_LogDelivery]'))
BEGIN
    DROP TRIGGER tr_LogDelivery
END
GO

CREATE TRIGGER tr_LogDelivery
ON ShopProduct
FOR INSERT AS 
BEGIN 
    INSERT INTO DeliveryLog(
	    ShopId
		,ProductId
		,Quantity
		,DeliveryDate
	)
	SELECT i.ShopId
	       ,i.ProductId
		   ,i.Quantity
		   ,i.LastDelivery
	FROM INSERTED AS i 
END
