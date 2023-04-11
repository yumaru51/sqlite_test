
-->元データ
DECLARE @X table (操業年月日 varchar(50), solid int)
INSERT INTO @X VALUES('2020-07-18 00:00:00', '550')
INSERT INTO @X VALUES('2020-07-19 00:00:00', '585')
INSERT INTO @X VALUES('2020-07-20 12:00:00', '587')
INSERT INTO @X VALUES('2020-07-20 15:00:00', '586')
INSERT INTO @X VALUES('2020-07-20 16:00:00', '551')
INSERT INTO @X VALUES('2020-07-20 17:00:00', '589')
INSERT INTO @X VALUES('2020-07-21 06:00:00', '600')
SELECT * FROM @X


-->①同じテーブルを結合して、Aよりも操業データが大きいレコードを結合
SELECT A.[操業年月日], B.[操業年月日]
FROM @X A, @X B
WHERE A.[操業年月日] < B.[操業年月日]
ORDER BY A.操業年月日


-->②次回データを一件に絞り込み
SELECT A.[操業年月日], MIN(B.[操業年月日]) AS 次回データ
FROM @X A
LEFT OUTER JOIN @X B
ON A.[操業年月日] < B.[操業年月日]
GROUP BY A.[操業年月日]


-->④範囲に変更するため次回データ「-1分」,最新のデータは次回データがNULLとなるため固定で次回データを設定する
SELECT A.[操業年月日], ISNULL(DATEADD(mi, -1, MIN(B.[操業年月日])), '2100/01/01') AS 次回データ
FROM @X A
LEFT OUTER JOIN @X B
ON A.[操業年月日] < B.[操業年月日]
GROUP BY A.[操業年月日]
