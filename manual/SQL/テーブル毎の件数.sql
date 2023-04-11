SELECT OBJ.name AS TableName, IND.rows
FROM sys.objects AS OBJ
JOIN sys.sysindexes AS IND
ON OBJ.object_id = IND.id AND IND.indid < 2
WHERE OBJ.type = 'U'
ORDER BY IND.rows DESC;