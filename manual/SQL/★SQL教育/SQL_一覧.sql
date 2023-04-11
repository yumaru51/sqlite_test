
/* 基本DML(Data Manipulation Language) */

-->SELECT/
SELECT * FROM テーブル名 WHERE 条件文

-->INSERT/
INSERT (INTO) テーブル名(フィールド名1, フィールド名2...) VALUES (値1,値2...)
INSERT (INTO) テーブル名 VALUES (値1,値2...)

-->UPDATE/
UPDATE テーブル名 SET フィールド名1 = 値1, フィールド名2 = 値2 WHERE 条件文

-->DELETE/
DELETE FROM テーブル名 WHERE 条件文



/* 基本DDL(Data Definition Language) */

-->CREATE/
CREATE TABLE テーブル名 (フィールド1 型, フィールド2 型...)
CREATE VIEW 

-->DROP/
DROP TABLE テーブル名

-->ALTER/
ALTER TABLE テーブル名 ADD フィールド1 型



/* 応用DML(Data Manipulation Language) */

-->重複をなくす
SELECT DISTINCT 列名 FROM テーブル名

-->複数の値を一気に指定
SELECT * FROM テーブル名 WHERE 列名 IN (値1,値2)

-->件数を制限する
SELECT TOP X 列名 FROM テーブル名

-->間を示す
SELECT 列名 FROM テーブル名 WHERE 列名 BETWEEN A AND B

-->別名をつける
SELECT 列名 AS 別名 FROM
SELECT 列名 FROM テーブル名 AS 別名

-->テーブルなしのSELECT文
SELECT '' AS 別名
SELECT '' 別名

-->加工した行を追加
SELECT 列名, '' AS 別名 FROM テーブル名

-->SELECTした結果をそのままテーブルに挿入
SELECT * INTO テーブル名 FROM テーブル名

-->SELECT結果データを登録
INSERT INTO テーブル名 (column1, column2) SELECT columna, columnb FROM テーブル名



/* 基本DCL(Data Control Language) */

-->USE/

-->GO/

-->BEGIN/

-->COMMIT/

-->ROLLBACK/

-->EXEC/
表の名前を変更する
EXEC sp_rename '現在のテーブル名','変更するテーブル名'
表の列名を変更する
EXEC sp_rename 'テーブル名.現在の列名','変更する列名'
