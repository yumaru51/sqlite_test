/*存在確認のみ*/
IF EXISTS(SELECT * 
          FROM   sys.columns 
          WHERE  NAME = N'＜列名＞'  
          AND    Object_ID = OBJECT_ID(N'＜テーブル名＞')
	)
    --存在したときの処理
	SELECT '存在した'
ELSE
    --存在しないときの処理
	SELECT '存在しない'
