
DECLARE @price int
SET @price = 200

IF(@price >= 200)
BEGIN
	PRINT '200�~�ȏ�'
END ELSE
BEGIN
	PRINT '200�~����'
END

SET @price = 100
IF(@price >= 200)
BEGIN
	PRINT '200�~�ȏ�'
END ELSE
BEGIN
	PRINT '200�~����'
END