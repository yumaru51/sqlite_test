
DECLARE @id int
SET @id = 1

WHILE (@id < 10)
BEGIN
	PRINT @id
	SET @id = @id + 1
END