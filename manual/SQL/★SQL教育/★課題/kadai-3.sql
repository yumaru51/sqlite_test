--フルーツ名を入力パラメータに指定したら、分類と在庫数を返すプログラム
  Create procedure kadai_3 @フルーツ名称 varchar(20) AS
    

  Select FRUTS_MAST.分類
		,FRUTS_TABLE.在庫数
    from FRUTS_TABLE LEFT OUTER JOIN FRUTS_MAST 
	  ON FRUTS_TABLE.フルーツCD = FRUTS_MAST.フルーツCD
   where FRUTS_MAST.フルーツ名称 = @フルーツ名称

