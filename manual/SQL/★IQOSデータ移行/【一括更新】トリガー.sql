

DECLARE @テーブル名		NVARCHAR(MAX)
DECLARE @トリガー名		NVARCHAR(MAX)

DECLARE @DROP_SQL		NVARCHAR(MAX)
DECLARE @CREATE_SQL		NVARCHAR(MAX)
DECLARE @INS_SQL		NVARCHAR(MAX)
DECLARE @旧項目			NVARCHAR(MAX)
DECLARE @新項目			NVARCHAR(MAX)
DECLARE @テーブル項目	NVARCHAR(MAX)
DECLARE @BKUP_SQL		NVARCHAR(MAX)

DECLARE @LOOP_CNT		INT

--**************************************--
------           処理開始           ------
--**************************************--

BEGIN TRANSACTION


/**************************************--
-->テーブル名とトリガー名抽出
SELECT
	A.name AS [テーブル名],
	B.name AS [トリガー名]
FROM
	sys.tables AS A,
	sys.triggers AS B
WHERE A.object_id = B.parent_id 
**************************************/

------------------------------------------
------         カーソル宣言         ------
------        テーブル名取得        ------
------------------------------------------
DECLARE CUR_TABLE_NAME CURSOR FOR
	SELECT	 [テーブル名]
			,[トリガー名]
	FROM [OP_ENTRY_M3P].[dbo].[TEST_TABLE]

-- カーソルOPEN(テーブル名取得)
OPEN CUR_TABLE_NAME

-- FETCH（テーブル名取得）
FETCH NEXT FROM CUR_TABLE_NAME INTO @テーブル名, @トリガー名

-- テーブル名分 LOOP
WHILE (@@fetch_status = 0)
BEGIN

	SET @CREATE_SQL = 'ALTER TRIGGER [dbo].[' + @トリガー名 + ']' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   ON [dbo].[' + @テーブル名 + ']' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   FOR INSERT, UPDATE  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' AS ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   DECLARE  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   @time DATETIME = NULL -->登録日時 ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' BEGIN ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   SET NOCOUNT ON; ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->カーソルの宣言(カーソルの名前はINSERTCURSOR) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' DECLARE INSERTCURSOR CURSOR FOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' SELECT [登録日時] ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '       FROM INSERTED ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->カーソルを開く ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' OPEN INSERTCURSOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->FETCH NEXT(カーソルを進める)&(値の取り出し) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' FETCH NEXT FROM INSERTCURSOR INTO @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->LOOP ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' WHILE (@@fetch_status = 0) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' BEGIN ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     -->[変更日時]更新処理 [登録日時]をキーに更新 ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '         UPDATE [' + @テーブル名 + '] SET [変更日時] = GETDATE(), [工程KEY] = [銘柄] + ''#'' + [ランNO] + ''#'' + [バッチNO] WHERE [登録日時] = @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     -->[署名FLAG]更新処理 [登録日時]をキーに更新 ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '         UPDATE [' + @テーブル名 + '] SET 署名状態 = ''署名済'' WHERE 署名 IS NOT NULL AND 署名状態 = ''未署名'' AND [登録日時] = @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     -->FETCH NEXT(カーソルを進める)&(値の取り出し) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     FETCH NEXT FROM INSERTCURSOR INTO @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' END ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->カーソルを閉じる ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' CLOSE INSERTCURSOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' DEALLOCATE INSERTCURSOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' END ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
 

	PRINT @CREATE_SQL

	-- 動的SQL実行
	--EXECUTE(@BKUP_SQL)
	--EXECUTE(@DROP_SQL)
	EXECUTE(@CREATE_SQL)
	--EXECUTE(@INS_SQL)

	FETCH NEXT FROM CUR_TABLE_NAME INTO @テーブル名, @トリガー名

END
CLOSE CUR_TABLE_NAME
DEALLOCATE CUR_TABLE_NAME

COMMIT TRANSACTION
