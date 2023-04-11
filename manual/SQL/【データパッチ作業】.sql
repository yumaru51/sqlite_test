/*処理前と処理後をEXCELなどで保存しておくこと*/
/*実際に処理する際はCOMMITのコメントアウトを外し、ROLLBACKをコメントアウト*/

BEGIN TRAN

-------------------------------------------------->処理前
SELECT main.phenomenon_id2 , sub.phenomenon_id
FROM
	[fms].[dbo].[fms_equipmenthistoryreport] main
LEFT OUTER JOIN
	[fms].[dbo].[fms_phenomenon] sub
	ON sub.id = main.phenomenon_id
WHERE 
	main.phenomenon_id IS NOT NULL


-------------------------------------------------->処理
UPDATE main 
SET main.phenomenon_id2 = sub.phenomenon_id
FROM
	[fms].[dbo].[fms_equipmenthistoryreport] main
LEFT OUTER JOIN
	[fms].[dbo].[fms_phenomenon] sub
	ON sub.id = main.phenomenon_id
WHERE 
	main.phenomenon_id IS NOT NULL
	AND main.phenomenon_id2 IS NULL


-------------------------------------------------->処理後
SELECT main.phenomenon_id2 , sub.phenomenon_id
FROM
	[fms].[dbo].[fms_equipmenthistoryreport] main
LEFT OUTER JOIN
	[fms].[dbo].[fms_phenomenon] sub
	ON sub.id = main.phenomenon_id
WHERE 
	main.phenomenon_id IS NOT NULL

--COMMIT
ROLLBACK
