

/*特定の項目でくくって連番を付与*/

-->例　同じ住所の人の連番など、、、
SELECT [id]
      ,[住所]
	  ,ROW_NUMBER() OVER (PARTITION BY [住所] ORDER BY [id]) AS SEQ
FROM [table]
WHERE [住所] = '福岡'
ORDER BY [id]
