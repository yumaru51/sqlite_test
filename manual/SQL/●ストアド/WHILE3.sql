
-->元データ
DECLARE @X table (id int, 操業年月日 varchar(50), VALUE int)
INSERT INTO @X VALUES(1, '2020-07-18 00:00:00', '550')
INSERT INTO @X VALUES(2, '2020-07-19 00:00:00', '585')
INSERT INTO @X VALUES(3, '2020-07-20 12:00:00', '587')
INSERT INTO @X VALUES(4, '2020-07-20 15:00:00', '586')
INSERT INTO @X VALUES(5, '2020-07-20 16:00:00', '551')
INSERT INTO @X VALUES(6, '2020-07-20 17:00:00', '589')
INSERT INTO @X VALUES(7, '2020-07-21 06:00:00', '600')
SELECT * FROM @X


DECLARE @id int,@VALUE varchar(MAX) = NULL
SET @id = 1

WHILE (@id < 7)
BEGIN
	SET @VALUE = (SELECT VALUE FROM @X WHERE id = @id)
	PRINT @VALUE
	SET @id = @id + 1
END