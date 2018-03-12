IF NOT EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[DeliveryLog]'))
BEGIN
    CREATE TABLE DeliveryLog(
	    DeliveryId INT IDENTITY,
		ShopId INT,
		ProductId INT,
		DeliveryDate DATE,
		Quantity INT,
		CONSTRAINT PK_DeliveryLog PRIMARY KEY (DeliveryId),
		CONSTRAINT FK_DeliveryLog_Shop FOREIGN KEY (ShopId) REFERENCES Shop(ShopId),
		CONSTRAINT FK_DeliveryLog_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId) 
	)
END
GO