IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE id = object_id(N'[dbo].[ShopProduct]'))
BEGIN
    CREATE TABLE ShopProduct(
	    ShopId INT NOT NULL,
		ProductId INT NOT NULL,
		Quantity INT NOT NULL,
		LastDelivery DATE NOT NULL,
		CONSTRAINT PK_ShopProduct PRIMARY KEY (ShopId, ProductId),
		CONSTRAINT FK_ShopProduct_Shop FOREIGN KEY (ShopId) REFERENCES Shop(ShopId),
		CONSTRAINT FK_ShopProduct_Product FOREIGN KEY (ProductId) REFERENCES Product(ProductId)
	)
END