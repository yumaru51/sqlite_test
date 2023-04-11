--指定したテーブルの最後の行だけを削除していくプログラム
CREATE PROCEDURE kadai_6 AS
  
--変数リストの宣言
  DECLARE @フルーツ名 varchar(20)
		, @分類 varchar(20)
	    , @在庫数 numeric(3)
	    , @4 int
		, @5 int
	    , @i int

--カーソルの宣言
  DECLARE EmpCur CURSOR FOR	--カーソルの名前はEmpCur
	SELECT フルーツ名 ,分類 ,在庫数
	FROM FRUTS_SUM_ZAIKO_INFO

--カーソルを開く
  OPEN EmpCur

--FETCH（行の取り出し）
  FETCH NEXT FROM EmpCur INTO @フルーツ名
							 ,@分類
							 ,@在庫数

--LOOP
  WHILE (@@fetch_status = 0)
    BEGIN

    --FETCH（行の取り出し）
      FETCH NEXT FROM EmpCur INTO @フルーツ名
							     ,@分類
							     ,@在庫数
	END

  DELETE FROM FRUTS_SUM_ZAIKO_INFO WHERE フルーツ名 = @フルーツ名

--カーソルを閉じる
  CLOSE EmpCur
  DEALLOCATE EmpCur

RETURN