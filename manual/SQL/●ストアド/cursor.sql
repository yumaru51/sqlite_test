/*
 SELECT 社員ID, 名称, 住所, 従タ.住所CD
 FROM [Kawauchi_DB].[dbo].[従業員データ] AS 従タ, [Kawauchi_DB].[dbo].[社員マスタ] AS 社タ, [Kawauchi_DB].[dbo].[住所マスタ] AS 住タ
 WHERE 従タ.ID = 社タ.社員ID and 従タ.住所CD = 住タ.住所CD
*/

--/*
CREATE PROCEDURE sp_sample @ID varchar(2) AS
--変数リストの宣言
DECLARE @社員ID nvarchar(50),  @名称 nvarchar(50), @住所 nvarchar(50)

--カーソルの宣言
DECLARE EmpCur CURSOR FOR	--カーソルの名前はEmpCur
SELECT 社員ID, 名称, 住所
 FROM [Kawauchi_DB].[dbo].[従業員データ] AS 従タ, [Kawauchi_DB].[dbo].[社員マスタ] AS 社タ, [Kawauchi_DB].[dbo].[住所マスタ] AS 住タ
 WHERE 従タ.ID = 社タ.社員ID and 従タ.住所CD = 住タ.住所CD and 住タ.住所CD = @ID	--入力されたIDを社員IDに代入
 
--カーソルを開く
OPEN EmpCur
 
--FETCH（行の取り出し）
FETCH NEXT FROM EmpCur INTO @社員ID, @名称, @住所
 
--LOOP
 
WHILE (@@fetch_status = 0)
BEGIN
    --変数リストの値を出力									このループ中にカーソルの変数を利用する
    PRINT @社員ID + ' ' + @名称 + ' ' + @住所
    --FETCH（行の取り出し）
    FETCH NEXT FROM EmpCur INTO @社員ID,@名称,@住所
END
	--PRINT @社員ID + ' ' + @名称 + ' ' + @住所				ループを抜けたら最後の行が変数に入っている！
--カーソルを閉じる
CLOSE EmpCur
DEALLOCATE EmpCur

RETURN
--*/