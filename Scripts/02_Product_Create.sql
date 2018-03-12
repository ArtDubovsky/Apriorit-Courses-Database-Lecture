IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE id = object_id(N'[dbo].[Product]'))
BEGIN
    CREATE TABLE Product(
	    ProductId INT NOT NULL IDENTITY,
		Name NVARCHAR(200) NOT NULL,
		CONSTRAINT PK_Product PRIMARY KEY (ProductId)
	)
END