/*システムテーブル一覧*/

-->テーブル名等取得
SELECT *
FROM sys.tables

-->項目名等取得,object_idよりsys.tables参照
SELECT *
FROM sys.columns

-->ストアードプロシジャーやファンクション内検索
SELECT   O.type,
          O.name,
          M.definition
FROM     sys.sql_modules AS M
            INNER JOIN sys.objects AS O
             ON M.object_id = O.object_id
WHERE    M.definition LIKE '%登録日時%'
ORDER BY O.type,
          O.name;

-->データベース情報取得
SELECT *
  FROM sys.databases

SELECT name FROM sys.databases ORDER BY upper(name)