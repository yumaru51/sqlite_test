--在庫数の合計を返すプログラム
  create procedure kadai_2 AS
  
  DECLARE @合計在庫数 int
  
  --合計(セレクトで合計値を表示)
  --select @合計在庫数 = SUM(在庫数)
  --from FRUTS_TABLE
    

  --返り値
	SET @合計在庫数 = (select SUM(在庫数) AS 合計在庫数
		  			     from FRUTS_TABLE)


  --確認(DB側で出力させてるのでNG)
  --print @合計在庫数 


--値を返す	ストアドプロシージャ側で「print @RC」する		  
  RETURN @合計在庫数