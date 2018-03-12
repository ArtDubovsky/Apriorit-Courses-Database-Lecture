IF NOT EXISTS (SELECT 1 FROM Category)
BEGIN
    INSERT INTO Category(
	    Name
	)
	VALUES ('Dairy'),
	       ('Meat'),
		   ('Drink')
END

IF NOT EXISTS (SELECT 1 FROM Shop)
BEGIN
    INSERT INTO Shop(
	    Name
		,Address
		,City
		,Country
	)
	VALUES 
	(
	    'ATB'
		,'Petra Kalnyshevskogo Ave, 34A'
		,'Dnipro'
		,'Ukraine'
	),
	(
	    'Brusnichka'
		,'Slobozhanskyi Ave, 73'
		,'Dnipro'
		,'Ukraine'
	)
END

IF NOT EXISTS (SELECT 1 FROM Product)
BEGIN
    DECLARE @tempProducts TABLE(
	    ProductName NVARCHAR(200),
		CategoryName NVARCHAR(100)
	)

	INSERT INTO @tempProducts(
	    ProductName,
		CategoryName
	)
	VALUES 
	('Zlagoda Milk 0%', 'Dairy'),
	('Cheese Zvenigorodskyi', 'Dairy'),
	('Vershkova Sausage', 'Meat'),
	('Ice Tea with lemon', 'Drink')


    INSERT INTO Product(
	    Name,
		CategoryId
	)
	SELECT tp.ProductName AS Name
	       ,c.CategoryId AS CategoryId
	FROM @tempProducts AS tp
	    INNER JOIN Category AS c ON c.Name = tp.CategoryName


	INSERT INTO ShopProduct(
	    ShopId
		,ProductId
		,Quantity
		,LastDelivery
	)
	SELECT s.ShopId AS ShopId
	       ,p.ProductId
		   ,10 AS Quantity
		   ,GETDATE() AS LastDelivery
	FROM Shop AS s
	    CROSS JOIN Product AS p

END