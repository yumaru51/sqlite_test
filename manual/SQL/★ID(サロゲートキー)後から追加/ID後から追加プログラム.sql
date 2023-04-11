
-->TOP1じゃなくて、カーソル回してWHERE句に一意となる条件を追加でUPDATEでよさそう。
-->ROW_NUMBER()を使うべき

/*********************************************************************************************
***CREATE TABLE ATEST(ID int ,Name varchar(50) ,Score int ,[Address] varchar(50) ,FLAG int)
***INSERT INTO ATEST VALUES(NULL ,'川内' ,100 ,'三重' ,0),(NULL ,'山田' ,90 ,'三重' ,0),(NULL ,'田中' ,80 ,'三重' ,0),(NULL ,'渡辺' ,70 ,'三重' ,0),(NULL ,'鈴木' ,60 ,'三重' ,0)
***
***SELECT TOP 1 を利用して上から一行だけ取得することでカーソルを使わないですむ
***IDを追加したやつにFLAGを設定して取得する行をずらしていく
***ループの条件はテーブルの行数を指定する 
**********************************************************************************************/

DECLARE 
        @Name varchar(50) = NULL		-->上から一行取得するために重複不可の値
	  , @SQL varchar(MAX)				-->SQLステートメント
	  , @ID int = 1						-->IDを追加するためのID変数　


  WHILE (@ID <= 5)
  BEGIN 


        SET @Name = (SELECT 
		        		    TOP 1 Name
				       FROM 
					        ATEST
				      WHERE 
					        FLAG = 0)

        SET @SQL = 'UPDATE 
                           ATEST
                       SET 
                           FLAG = 1
                         ,   ID = ' + CAST(@ID AS varchar(50) ) + '
                     WHERE 
                           Name =''' + @Name + ''''
        EXEC(@SQL)
        SET @ID += 1


  END