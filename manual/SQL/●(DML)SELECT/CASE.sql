-->CASE 条件分岐
 DECLARE @X	varchar(50) = '男',@Y varchar(50) = '女'
 
-->単純CASE式
SELECT
CASE @X
    WHEN '男' THEN 1
    WHEN '女' THEN 2
    ELSE 99
END 

-->検索CASE式
SELECT
CASE
    WHEN @X = '男' THEN 1
    WHEN @X = '女' THEN 2
    ELSE 99
END 
