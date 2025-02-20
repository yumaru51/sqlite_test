
/* WITH・共通テーブル式(CTE) */

/*
一時テーブルを作っているイメージ。
用途は、ストアド中に同じSQLを何度も使う場合、最初にWITHでテーブルを宣言しておくと
行が省略できる。

注意事項
-->WITHの前に文を記述している場合「;」で終了する。
-->複数続ける場合は「,」で続けて記述する。
　WITH テーブル名 AS (
　SQL
　)
*/

DECLARE @X TABLE (name varchar(50),count int)
INSERT INTO @X VALUES('A', 12);
INSERT INTO @X VALUES('B', 17);
INSERT INTO @X VALUES('C', 12);
INSERT INTO @X VALUES('D', 19);
INSERT INTO @X VALUES('A', 306);
INSERT INTO @X VALUES('B', 51);
INSERT INTO @X VALUES('C', 31);
INSERT INTO @X VALUES('D', 88);

WITH TEST AS(
  SELECT
    name,SUM(count) 合計
  FROM
    @X
  GROUP BY
    name
)

SELECT
  *
FROM
  TEST