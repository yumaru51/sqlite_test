USE [OP_ENTRY_M3P]
GO

DECLARE @TABLE_NAME		NVARCHAR(MAX)
DECLARE @項目名			NVARCHAR(MAX)
DECLARE @許可			NVARCHAR(MAX)
DECLARE @長さ			NVARCHAR(MAX)

DECLARE @ALT_SQL		NVARCHAR(MAX)

--**************************************--
------           処理開始           ------
--**************************************--

BEGIN TRANSACTION

------------------------------------------
------         カーソル宣言         ------
------        テーブル名取得        ------
------------------------------------------
DECLARE CUR_TABLE_NAME CURSOR FOR
	SELECT
		  DISTINCT T.NAME			AS テーブル名
		, C.NAME					AS 項目名
		--, MAX_LENGTH				AS 長さ
		, CASE WHEN IS_NULLABLE = 1 THEN 'NULL' ELSE 'NOT NULL' END AS NULL許可
	FROM
		SYS.OBJECTS T
		INNER JOIN SYS.COLUMNS C ON
		T.OBJECT_ID = C.OBJECT_ID
	WHERE
		T.TYPE = 'U'
	AND (T.NAME LIKE 'T_ST%' OR T.NAME LIKE 'T_TSK%' OR T.NAME LIKE 'T_TTO-%')
	AND type_name(user_type_id) = 'varchar'
	AND (C.NAME LIKE '署名状態' OR C.NAME LIKE '承認状態' OR C.NAME LIKE '入力状態')
	ORDER BY
		T.NAME

-- カーソルOPEN(テーブル名取得)
OPEN CUR_TABLE_NAME

-- FETCH（テーブル名取得）
FETCH NEXT FROM CUR_TABLE_NAME INTO @TABLE_NAME
									, @項目名
									--, @長さ
									, @許可

-- テーブル名分 LOOP
WHILE (@@fetch_status = 0)
BEGIN

	-- ALTER文作成
	SET @ALT_SQL = ''
	SET @ALT_SQL = 'ALTER TABLE '
	SET @ALT_SQL = @ALT_SQL +  ' [' + @TABLE_NAME + ']'
	SET @ALT_SQL = @ALT_SQL +  ' ALTER COLUMN '

--PRINT @項目名
--PRINT @属性

	-- 項目名にNOがある場合
	IF @項目名 = '署名' OR @項目名 = '署名状態' OR @項目名 = '承認状態' OR @項目名 = '入力状態'
		BEGIN
			SET @ALT_SQL = @ALT_SQL + ' [' + @項目名 + '] [varchar](10) NOT NULL ;' 
		END

	--ELSE IF @項目名 =  '銘柄' OR @項目名 = '回収製品銘柄' OR @項目名 = '受入スラリー銘柄' OR @項目名 = '銘柄グループ' OR @項目名 = '投入先銘柄' OR @項目名 = '投入先銘柄グループ' OR @項目名 = '時刻区分' OR @項目名 = '承認者'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @項目名 + '] [varchar](20) ' + @許可 + ';' 
	--	END

	--ELSE IF @項目名 = '時刻' OR @項目名 = '処理開始時刻' OR @項目名 = 'N2使用開始時間' OR @項目名 = 'N2使用終了時間' OR @項目名 = '処理開始時間' OR @項目名 = '開始時刻'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @項目名 + '] [char](5) ' + @許可 + ';' 
	--	END

	--ELSE IF @項目名 = '前工程KEY9' OR @項目名 = '工程KEY' OR @項目名 = '前工程KEY1' OR @項目名 = '前工程KEY10' OR @項目名 = '前工程KEY2' OR @項目名 = '前工程KEY3' OR @項目名 = '前工程KEY4' OR @項目名 = '前工程KEY5' OR @項目名 = '前工程KEY6' OR @項目名 = '前工程KEY7' OR @項目名 = '前工程KEY8' OR @項目名 = '後工程KEY1' OR @項目名 = '後工程KEY10' OR @項目名 = '後工程KEY2' OR @項目名 = '後工程KEY3' OR @項目名 = '後工程KEY4' OR @項目名 = '後工程KEY5' OR @項目名 = '後工程KEY6' OR @項目名 = '後工程KEY7' OR @項目名 = '後工程KEY8' OR @項目名 = '後工程KEY9'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @項目名 + '] [varchar](20) ' + @許可 + ';' 
	--	END

	--ELSE IF @項目名 = '備考'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @項目名 + '] [varchar](MAX) ' + @許可 + ';' 
	--	END 
	--ELSE 
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @項目名 + '] [varchar](50) ' + @許可 + ';'  
	--	END 
	

	PRINT @ALT_SQL

	-- 動的SQL実行
	EXECUTE(@ALT_SQL)

	FETCH NEXT FROM CUR_TABLE_NAME INTO @TABLE_NAME
										, @項目名
										--, @長さ
										, @許可

END

CLOSE CUR_TABLE_NAME
DEALLOCATE CUR_TABLE_NAME

COMMIT TRANSACTION
