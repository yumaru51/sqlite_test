
-->別名をつける
SELECT 1 AS 'Return Value1'
SELECT 1 AS [Return Value2]
SELECT 1 ReturnValue3			-->非推奨
SELECT 'Return Value4' = 1

DECLARE @TEST INT = 1
SELECT 'Return Value5' = @TEST

