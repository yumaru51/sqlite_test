
DECLARE @X TABLE (c_name VARCHAR(50))
/*�������ɃL�[���[�h�ǉ�*/
INSERT INTO @X VALUES('����')
INSERT INTO @X VALUES('���v')
INSERT INTO @X VALUES('�ݔ��H��')
INSERT INTO @X VALUES('��p�v��H��')
INSERT INTO @X VALUES('�d����')
INSERT INTO @X VALUES('�����')
INSERT INTO @X VALUES('������')
/*�������ɃL�[���[�h�ǉ�*/

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
