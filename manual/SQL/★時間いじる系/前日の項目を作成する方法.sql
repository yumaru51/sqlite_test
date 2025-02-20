
-->元データ
DECLARE @X table (id int, 操業年月日 varchar(50), VALUE int)
INSERT INTO @X VALUES(1, '2020-07-18 00:00:00', '550')
INSERT INTO @X VALUES(2, '2020-07-19 00:00:00', '585')
INSERT INTO @X VALUES(3, '2020-07-20 12:00:00', '587')
INSERT INTO @X VALUES(4, '2020-07-21 15:00:00', '586')
INSERT INTO @X VALUES(5, '2020-07-22 16:00:00', '551')
INSERT INTO @X VALUES(6, '2020-07-23 17:00:00', '589')
INSERT INTO @X VALUES(7, '2020-07-24 06:00:00', '600')
SELECT * FROM @X


SELECT
	TODAY.操業年月日 AS 今日
	,YESTERDAY.操業年月日 AS 昨日
FROM
	(SELECT
	ROW_NUMBER() OVER(ORDER BY 操業年月日 ASC) AS NUM
	, *
	FROM
		@X
	) AS TODAY
LEFT OUTER JOIN 
	(SELECT
	(ROW_NUMBER() OVER(ORDER BY 操業年月日 ASC) + 1) AS NUM
	, *
	FROM
		@X
	) AS YESTERDAY
ON TODAY.NUM = YESTERDAY.NUM