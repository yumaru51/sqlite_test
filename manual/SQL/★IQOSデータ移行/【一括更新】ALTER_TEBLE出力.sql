USE [OP_ENTRY_M3P]
GO

DECLARE @TABLE_NAME		NVARCHAR(MAX)
DECLARE @���ږ�			NVARCHAR(MAX)
DECLARE @����			NVARCHAR(MAX)
DECLARE @����			NVARCHAR(MAX)

DECLARE @ALT_SQL		NVARCHAR(MAX)

--**************************************--
------           �����J�n           ------
--**************************************--

BEGIN TRANSACTION

------------------------------------------
------         �J�[�\���錾         ------
------        �e�[�u�����擾        ------
------------------------------------------
DECLARE CUR_TABLE_NAME CURSOR FOR
	SELECT
		  DISTINCT T.NAME			AS �e�[�u����
		, C.NAME					AS ���ږ�
		--, MAX_LENGTH				AS ����
		, CASE WHEN IS_NULLABLE = 1 THEN 'NULL' ELSE 'NOT NULL' END AS NULL����
	FROM
		SYS.OBJECTS T
		INNER JOIN SYS.COLUMNS C ON
		T.OBJECT_ID = C.OBJECT_ID
	WHERE
		T.TYPE = 'U'
	AND (T.NAME LIKE 'T_ST%' OR T.NAME LIKE 'T_TSK%' OR T.NAME LIKE 'T_TTO-%')
	AND type_name(user_type_id) = 'varchar'
	AND (C.NAME LIKE '�������' OR C.NAME LIKE '���F���' OR C.NAME LIKE '���͏��')
	ORDER BY
		T.NAME

-- �J�[�\��OPEN(�e�[�u�����擾)
OPEN CUR_TABLE_NAME

-- FETCH�i�e�[�u�����擾�j
FETCH NEXT FROM CUR_TABLE_NAME INTO @TABLE_NAME
									, @���ږ�
									--, @����
									, @����

-- �e�[�u������ LOOP
WHILE (@@fetch_status = 0)
BEGIN

	-- ALTER���쐬
	SET @ALT_SQL = ''
	SET @ALT_SQL = 'ALTER TABLE '
	SET @ALT_SQL = @ALT_SQL +  ' [' + @TABLE_NAME + ']'
	SET @ALT_SQL = @ALT_SQL +  ' ALTER COLUMN '

--PRINT @���ږ�
--PRINT @����

	-- ���ږ���NO������ꍇ
	IF @���ږ� = '����' OR @���ږ� = '�������' OR @���ږ� = '���F���' OR @���ږ� = '���͏��'
		BEGIN
			SET @ALT_SQL = @ALT_SQL + ' [' + @���ږ� + '] [varchar](10) NOT NULL ;' 
		END

	--ELSE IF @���ږ� =  '����' OR @���ږ� = '������i����' OR @���ږ� = '����X�����[����' OR @���ږ� = '�����O���[�v' OR @���ږ� = '���������' OR @���ږ� = '����������O���[�v' OR @���ږ� = '�����敪' OR @���ږ� = '���F��'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @���ږ� + '] [varchar](20) ' + @���� + ';' 
	--	END

	--ELSE IF @���ږ� = '����' OR @���ږ� = '�����J�n����' OR @���ږ� = 'N2�g�p�J�n����' OR @���ږ� = 'N2�g�p�I������' OR @���ږ� = '�����J�n����' OR @���ږ� = '�J�n����'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @���ږ� + '] [char](5) ' + @���� + ';' 
	--	END

	--ELSE IF @���ږ� = '�O�H��KEY9' OR @���ږ� = '�H��KEY' OR @���ږ� = '�O�H��KEY1' OR @���ږ� = '�O�H��KEY10' OR @���ږ� = '�O�H��KEY2' OR @���ږ� = '�O�H��KEY3' OR @���ږ� = '�O�H��KEY4' OR @���ږ� = '�O�H��KEY5' OR @���ږ� = '�O�H��KEY6' OR @���ږ� = '�O�H��KEY7' OR @���ږ� = '�O�H��KEY8' OR @���ږ� = '��H��KEY1' OR @���ږ� = '��H��KEY10' OR @���ږ� = '��H��KEY2' OR @���ږ� = '��H��KEY3' OR @���ږ� = '��H��KEY4' OR @���ږ� = '��H��KEY5' OR @���ږ� = '��H��KEY6' OR @���ږ� = '��H��KEY7' OR @���ږ� = '��H��KEY8' OR @���ږ� = '��H��KEY9'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @���ږ� + '] [varchar](20) ' + @���� + ';' 
	--	END

	--ELSE IF @���ږ� = '���l'
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @���ږ� + '] [varchar](MAX) ' + @���� + ';' 
	--	END 
	--ELSE 
	--	BEGIN
	--		SET @ALT_SQL = @ALT_SQL + ' [' + @���ږ� + '] [varchar](50) ' + @���� + ';'  
	--	END 
	

	PRINT @ALT_SQL

	-- ���ISQL���s
	EXECUTE(@ALT_SQL)

	FETCH NEXT FROM CUR_TABLE_NAME INTO @TABLE_NAME
										, @���ږ�
										--, @����
										, @����

END

CLOSE CUR_TABLE_NAME
DEALLOCATE CUR_TABLE_NAME

COMMIT TRANSACTION
