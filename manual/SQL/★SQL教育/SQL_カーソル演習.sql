/* カーソル */

-->カーソル/
FETCH NEXT | PRIOR | FIRST | LAST

-->カーソル演習/
DECLARE @item_name varchar(50), @price int
DECLARE TEST CURSOR FOR
SELECT 
  [item_name],
  [price]
FROM [Takahama_DB].[dbo].[my_items2]
OPEN TEST
FETCH NEXT FROM TEST INTO @item_name,@price
WHILE @@FETCH_STATUS = 0
BEGIN 

PRINT @item_name + 'の値段は' + CAST(@price as varchar) + '円です'
--IF(@price >= 200)
--BEGIN
--PRINT @item_name + 'は200円以上なので買います'
--END ELSE IF(@price < 200)
--BEGIN
--PRINT @item_name + 'は200円未満なので買いません'
--END

FETCH NEXT FROM TEST INTO @item_name,@price
END
CLOSE TEST
DEALLOCATE TEST