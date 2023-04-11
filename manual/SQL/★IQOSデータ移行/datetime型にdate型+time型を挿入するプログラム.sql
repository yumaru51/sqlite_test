--datetime型にdate型+time型を挿入するプログラム(一つのテーブルのdate型項目とtime型項目を別のテーブルに入れる)
DECLARE @1 varchar(MAX) ,@2 varchar(MAX) ,@3 datetime2(0)


SET @1 = (SELECT [操業日] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [工程] = 'B')
SET @2 = (SELECT [時間] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [工程] = 'B')
SET @3 = @1 + ' ' + @2
PRINT @3

INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([操業日] ,[工程]) VALUES (@3 ,'B')


--datetime型にdate型のデータを挿入すると時間は00:00:00で挿入される
--INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([操業日] ,[工程]) VALUES ((SELECT [操業日] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [工程] = 'B') ,'B')