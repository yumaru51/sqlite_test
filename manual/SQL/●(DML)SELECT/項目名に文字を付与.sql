
SELECT '[MP'+[関連検査項目コード]+']'
FROM [ISKFMP_test].[dbo].[TM_数式]
WHERE 検査項目コード = '0045'
ORDER BY [検査項目コード], [関連検査項目コード]
