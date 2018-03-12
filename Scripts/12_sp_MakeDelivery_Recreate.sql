IF EXISTS (SELECT 1 FROM dbo.sysobjects WHERE ID = OBJECT_ID(N'[dbo].[sp_MakeDelivery]'))
BEGIN
    DROP PROCEDURE sp_MakeDelivery
END
GO

CREATE PROCEDURE sp_MakeDelivery(
    @productId INT
	,@shopId INT
	,@quantity INT
)
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM ShopProduct 
	               WHERE ProductId = @productId AND ShopId = @shopId)
	BEGIN
	    INSERT INTO ShopProduct(
		    ProductId
			,ShopId
			,Quantity
			,LastDelivery
		)
		VALUES(
		    @productId
			,@shopId
			,@quantity
			,GETDATE()
		)
	END
	ELSE
	BEGIN
	    UPDATE ShopProduct
		SET Quantity = Quantity + @quantity
		    ,LastDelivery = GETDATE()
		WHERE ShopId = @shopId 
		    AND ProductId = @productId
	END
END