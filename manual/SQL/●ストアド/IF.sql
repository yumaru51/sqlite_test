
DECLARE @price int
SET @price = 200

IF(@price >= 200)
BEGIN
	PRINT '200â~à»è„'
END ELSE
BEGIN
	PRINT '200â~ñ¢ñû'
END

SET @price = 100
IF(@price >= 200)
BEGIN
	PRINT '200â~à»è„'
END ELSE
BEGIN
	PRINT '200â~ñ¢ñû'
END