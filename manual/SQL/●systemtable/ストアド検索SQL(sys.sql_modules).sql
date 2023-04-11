
/*サーバー内の全DBの全ストアド内の文字を検索する*/
SELECT   O.type,	
         O.name,	
         M.definition	
FROM     sys.sql_modules AS M	
            INNER JOIN sys.objects AS O	
				ON M.object_id = O.object_id	
WHERE    M.definition LIKE '%検索キーワード%'	
ORDER BY O.type,	
         O.name;	
