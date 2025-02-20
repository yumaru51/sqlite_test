USE [OP_ENTRY_M3P]
GO

DECLARE @TABLE_NAME		NVARCHAR(MAX)
DECLARE @Ú¼			NVARCHAR(MAX)
DECLARE @Â			NVARCHAR(MAX)
DECLARE @·³			NVARCHAR(MAX)

DECLARE @ALT_SQL		NVARCHAR(MAX)

--**************************************--
------           Jn           ------
--**************************************--

BEGIN TRANSACTION

------------------------------------------
------         J[\é¾         ------
------        e[u¼æ¾        ------
------------------------------------------
DECLARE CUR_TABLE_NAME CURSOR FOR
	SELECT
		  DISTINCT T.NAME			AS e[u¼
		, C.NAME					AS Ú¼
		--, MAX_LENGTH				AS ·³
		, CASE WHEN IS_NULLABLE = 1 THEN 'NULL' ELSE 'NOT NULL' END AS NULLÂ
	FROM
		SYS.OBJECTS T
		INNER JOIN SYS.COLUMNS C ON
		T.OBJECT_ID = C.OBJECT_ID
	WHERE
		T.TYPE = 'U'
	AND (T.NAME LIKE 'T_ST%' OR T.NAME LIKE 'T_TSK%' OR T.NAME LIKE 'T_TTO-%')
	AND type_name(user_type_id) = 'varchar'
	AND (C.NAME LIKE '¼óÔ' OR C.NAME LIKE '³FóÔ' OR C.NAME LIKE 'üÍóÔ')
	ORDER BY
		T.NAME

-- J[\OPEN(e[u¼æ¾)
OPEN CUR_TABLE_NAME

-- FETCHie[u¼æ¾j
FETCH NEXT FROM CUR_TABLE_NAME INTO @TABLE_NAME
									, @Ú¼
									--, @·³
									, @Â

-- e[u¼ª LOOP
WHILE (@@fetch_status = 0)
BEGIN

	-- ALTER¶ì¬
	SET @ALT_SQL = ''
	SET @ALT_SQL = 'ALTER TABLE '
	SET @ALT_SQL = @ALT_SQL +  ' [' + @TABLE_NAME + ']'
	SET @ALT_SQL = @ALT_SQL +  ' ALTER COLUMN '

--PRINT @Ú¼
--PRINT @®«

	-- Ú¼ÉNOª éê
	IF @Ú¼ = '¼' OR @Ú¼ = '¼óÔ' OR @Ú¼ = '³FóÔ' OR @Ú¼ = 'üÍóÔ'
		BEGIN
			SET @ALT_SQL = @ALT_SQL + ' [' + @Ú¼ + '] [varchar](10) NOT NULL ;' 
		END

	--ELSE IF @Ú¼ =  'Á¿' OR @Ú¼ = 'ñû»iÁ¿' OR @Ú¼ = 'óüX[Á¿' OR @Ú¼ = 'Á¿O[v' OR @Ú¼ = 'üæÁ¿' OR @Ú¼ = 'üæÁ¿O[v' OR @Ú¼ = 'æª' OR @Ú¼ = '³FÒ'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @Ú¼ + '] [varchar](20) ' + @Â + ';' 
	--	END

	--ELSE IF @Ú¼ = '' OR @Ú¼ = 'Jn' OR @Ú¼ = 'N2gpJnÔ' OR @Ú¼ = 'N2gpI¹Ô' OR @Ú¼ = 'JnÔ' OR @Ú¼ = 'Jn'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @Ú¼ + '] [char](5) ' + @Â + ';' 
	--	END

	--ELSE IF @Ú¼ = 'OHöKEY9' OR @Ú¼ = 'HöKEY' OR @Ú¼ = 'OHöKEY1' OR @Ú¼ = 'OHöKEY10' OR @Ú¼ = 'OHöKEY2' OR @Ú¼ = 'OHöKEY3' OR @Ú¼ = 'OHöKEY4' OR @Ú¼ = 'OHöKEY5' OR @Ú¼ = 'OHöKEY6' OR @Ú¼ = 'OHöKEY7' OR @Ú¼ = 'OHöKEY8' OR @Ú¼ = 'ãHöKEY1' OR @Ú¼ = 'ãHöKEY10' OR @Ú¼ = 'ãHöKEY2' OR @Ú¼ = 'ãHöKEY3' OR @Ú¼ = 'ãHöKEY4' OR @Ú¼ = 'ãHöKEY5' OR @Ú¼ = 'ãHöKEY6' OR @Ú¼ = 'ãHöKEY7' OR @Ú¼ = 'ãHöKEY8' OR @Ú¼ = 'ãHöKEY9'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @Ú¼ + '] [varchar](20) ' + @Â + ';' 
	--	END

	--ELSE IF @Ú¼ = 'õl'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @Ú¼ + '] [varchar](MAX) ' + @Â + ';' 
	--	END 
	--ELSE 
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @Ú¼ + '] [varchar](50) ' + @Â + ';'  
	--	END 
	

	PRINT @ALT_SQL

	-- ®ISQLÀs
	EXECUTE(@ALT_SQL)

	FETCH NEXT FROM CUR_TABLE_NAME INTO @TABLE_NAME
										, @Ú¼
										--, @·³
										, @Â

END

CLOSE CUR_TABLE_NAME
DEALLOCATE CUR_TABLE_NAME

COMMIT TRANSACTION
