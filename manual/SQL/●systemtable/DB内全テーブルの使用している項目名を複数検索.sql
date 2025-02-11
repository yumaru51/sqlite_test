
DECLARE @X TABLE (c_name VARCHAR(50))
/*↓ここにキーワード追加*/
INSERT INTO @X VALUES('原価')
INSERT INTO @X VALUES('利益')
INSERT INTO @X VALUES('設備工程')
INSERT INTO @X VALUES('費用計上工程')
INSERT INTO @X VALUES('仕入先')
INSERT INTO @X VALUES('取引先')
INSERT INTO @X VALUES('発注先')
/*↑ここにキーワード追加*/

DECLARE @c_name VARCHAR(50)
DECLARE @SQL VARCHAR(MAX) = ''
DECLARE column_cursor CURSOR FOR SELECT * FROM @X
OPEN column_cursor
FETCH NEXT FROM column_cursor INTO @c_name
	SET @SQL = @SQL + 'SELECT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE ''%' + @c_name + '%'''
FETCH NEXT FROM column_cursor INTO @c_name
WHILE (@@fetch_status = 0)
BEGIN
    --PRINT @c_name

	SET @SQL = @SQL + '
	 UNION ALL SELECT TABLE_NAME, COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE COLUMN_NAME LIKE ''%' + @c_name + '%'''
	
    FETCH NEXT FROM column_cursor INTO @c_name
END
CLOSE column_cursor
DEALLOCATE column_cursor

EXECUTE(@SQL)
RETURN
