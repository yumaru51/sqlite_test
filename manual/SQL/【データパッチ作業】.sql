/*�����O�Ə������EXCEL�Ȃǂŕۑ����Ă�������*/
/*���ۂɏ�������ۂ�COMMIT�̃R�����g�A�E�g���O���AROLLBACK���R�����g�A�E�g*/

BEGIN TRAN

-------------------------------------------------->�����O
SELECT main.phenomenon_id2 , sub.phenomenon_id
FROM
	[fms].[dbo].[fms_equipmenthistoryreport] main
LEFT OUTER JOIN
	[fms].[dbo].[fms_phenomenon] sub
	ON sub.id = main.phenomenon_id
WHERE 
	main.phenomenon_id IS NOT NULL


-------------------------------------------------->����
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


-------------------------------------------------->������
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
