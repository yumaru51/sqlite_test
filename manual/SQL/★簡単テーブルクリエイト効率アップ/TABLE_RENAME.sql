SELECT 
-->���݂�TableName  
  name AS TableName,
-->�V����TableName  
  'T_' + name AS NewTableName,
-->SQL
  'sp_rename ''' + name + ''',''' + 'T_' + name + '''' + CHAR(10) + 'GO' AS SQL
FROM 
  sys.tables
ORDER BY 
  name