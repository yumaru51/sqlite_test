SELECT 
-->Œ»Ý‚ÌTableName  
  name AS TableName,
-->V‚µ‚¢TableName  
  'T_' + name AS NewTableName,
-->SQL
  'sp_rename ''' + name + ''',''' + 'T_' + name + '''' + CHAR(10) + 'GO' AS SQL
FROM 
  sys.tables
ORDER BY 
  name