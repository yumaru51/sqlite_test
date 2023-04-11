
/* 変数 */

-->変数宣言/
DECLARE @変数名 データ型

-->値代入/
SET @変数名 = 値

-->テーブルとして出力/
SELECT @変数
SELECT @変数 AS 別名
SELECT @変数 別名
SELECT 別名 = @変数

-->文字として出力/
PRINT @変数

-->SELECT結果を変数に代入/
SELECT @変数 = 列名 FROM テーブル名 WEHRE 条件



/* 関数 */

-->処理結果に情報を表示する/
PRINT '文字'
PRINT GETDATE()

-->条件分岐①/
CASE [比較対象] WHEN [条件の値1] THEN [表示する値1] WHEN [条件の値2] THEN [表示する値2] … ELSE [表示する値] END [列名]
CASE WHEN [条件1] THEN [表示する値1] WHEN [条件2] THEN [表示する値2] … ELSE [表示する値] END [列名]

-->条件分岐②/
SELECT IIF (条件, TRUE, FALSE) FROM テーブル名

-->型の一時変換/
CAST(列名 AS VARCHAR)
CONVERT(VARCHAR,列名) 


