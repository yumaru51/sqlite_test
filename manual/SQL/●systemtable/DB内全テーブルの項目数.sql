SELECT O.name AS TableName, COUNT(C.name) AS ColumnCount 
FROM sys.objects O INNER JOIN sys.columns C ON O.object_id = C.object_id AND O.type = 'U'
GROUP BY O.name