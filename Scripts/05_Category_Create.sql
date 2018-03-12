IF NOT EXISTS (SELECT 1 FROM sysobjects WHERE id = object_id(N'[dbo].[Category]'))
BEGIN
    CREATE TABLE Category(
	    CategoryId INT NOT NULL IDENTITY,
		Name NVARCHAR(100) NOT NULL,
		CONSTRAINT PK_Category PRIMARY KEY (CategoryId)
	)
END