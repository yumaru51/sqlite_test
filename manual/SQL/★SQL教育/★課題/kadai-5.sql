--FRUTS_SUM_ZAIKO_INFOに対し、国産はマイナス5個、外国産はプラス10個するプログラム
  create procedure kadai_5 AS
  
----最初にデータクリア
--  DELETE FROM FRUTS_SUM_ZAIKO_INFO
----TRUNCATE FRUTS_SUM_ZAIKO_INFO

--変数リストの宣言
  DECLARE @フルーツ名 varchar(20)
		 ,@分類 varchar(20)
		 ,@在庫数 numeric(3)

--カーソルの宣言
  DECLARE EmpCur CURSOR FOR	--カーソルの名前はEmpCur
    Select FRUTS_MAST.フルーツ名称 AS フルーツ名
          ,FRUTS_MAST.分類 AS 分類
		  ,SUM(FRUTS_TABLE.在庫数) AS 在庫数
      from FRUTS_TABLE LEFT OUTER JOIN FRUTS_MAST 
	    ON FRUTS_TABLE.フルーツCD = FRUTS_MAST.フルーツCD
     group by FRUTS_MAST.フルーツ名称
             ,FRUTS_MAST.分類

--カーソルを開く
  OPEN EmpCur

--FETCH（行の取り出し）
  FETCH NEXT FROM EmpCur INTO @フルーツ名
							 ,@分類
							 ,@在庫数

--LOOP
  WHILE (@@fetch_status = 0)
    BEGIN

    --国産はマイナス5個、外国産はプラス10個に更新
	  if @分類 = '国産'
	    Begin
	      UPDATE FRUTS_SUM_ZAIKO_INFO SET 在庫数 = @在庫数 - 5 where @フルーツ名 = フルーツ名
	    End
	  else
	    Begin
	      UPDATE FRUTS_SUM_ZAIKO_INFO SET 在庫数 = @在庫数 + 10 where @フルーツ名 = フルーツ名
		End

    --FETCH（行の取り出し）
      FETCH NEXT FROM EmpCur INTO @フルーツ名
							     ,@分類
							     ,@在庫数
	END

--カーソルを閉じる
  CLOSE EmpCur
  DEALLOCATE EmpCur
