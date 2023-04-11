--datetime型のdate部だけを取り出し別テーブルのtime型と結合してINSERTする
DECLARE @1 varchar(MAX) ,@2 varchar(MAX) ,@3 datetime2(0)


SET @1 = (SELECT [操業日] FROM [Kawauchi_DB].[dbo].[A_test2] WHERE [工程] = 'B')	-->datetime型のテーブルから操業日を取る
SET @1 = Left(@1, 10)																-->YYYY/MM/DDの10桁
SET @2 = (SELECT [時間] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [工程] = 'B')		-->time型のテーブルから時間を取る
SET @3 = @1 + ' ' + @2																-->YYYY/MM/DD TT:MM:SSSS の形式にする
PRINT @3

INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([操業日] ,[工程]) VALUES (@3 ,'B')		-->INSERTする