--結合テーブルを参照して新しいテーブルに値挿入するプログラム
Create procedure kadai_1 AS

--変数リストの宣言
  DECLARE @CD varchar(2)
		 ,@フルーツ名称 varchar(20)
		 ,@分類 varchar(20)
		 ,@在庫数 numeric(3)

--カーソルの宣言
  DECLARE EmpCur CURSOR FOR	--カーソルの名前はEmpCur
   Select FRUTS_TABLE.フルーツCD 
	 	 ,FRUTS_MAST.フルーツ名称
		 ,FRUTS_MAST.分類
		 ,FRUTS_TABLE.在庫数
     from FRUTS_TABLE LEFT OUTER JOIN FRUTS_MAST 
	   ON FRUTS_TABLE.フルーツCD = FRUTS_MAST.フルーツCD

--カーソルを開く
  OPEN EmpCur

--FETCH（行の取り出し）
  FETCH NEXT FROM EmpCur INTO @CD
							 ,@フルーツ名称
							 ,@分類
							 ,@在庫数

--LOOP
  WHILE (@@fetch_status = 0)
    BEGIN


    --データを挿入していく
	  INSERT INTO FRUTS_INFO VALUES(@CD 
								   ,@フルーツ名称 
								   ,@分類 
								   ,@在庫数)
    --FETCH（行の取り出し）
      FETCH NEXT FROM EmpCur INTO @CD
							     ,@フルーツ名称
							     ,@分類
							     ,@在庫数
	END

--カーソルを閉じる
  CLOSE EmpCur
  DEALLOCATE EmpCur
