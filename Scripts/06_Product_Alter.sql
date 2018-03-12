IF NOT EXISTS(SELECT 1 FROM sys.columns 
              WHERE Name = N'CategoryId'
			      AND object_id = object_id(N'[dbo].[Product]'))
BEGIN
    ALTER TABLE Product
	ADD CategoryId INT NULL

	ALTER TABLE Product
	ADD CONSTRAINT FK_Product_Category FOREIGN KEY (CategoryId) REFERENCES Category(CategoryId) 
END