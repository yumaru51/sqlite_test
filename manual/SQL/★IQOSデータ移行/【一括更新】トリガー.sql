

DECLARE @�e�[�u����		NVARCHAR(MAX)
DECLARE @�g���K�[��		NVARCHAR(MAX)

DECLARE @DROP_SQL		NVARCHAR(MAX)
DECLARE @CREATE_SQL		NVARCHAR(MAX)
DECLARE @INS_SQL		NVARCHAR(MAX)
DECLARE @������			NVARCHAR(MAX)
DECLARE @�V����			NVARCHAR(MAX)
DECLARE @�e�[�u������	NVARCHAR(MAX)
DECLARE @BKUP_SQL		NVARCHAR(MAX)

DECLARE @LOOP_CNT		INT

--**************************************--
------           �����J�n           ------
--**************************************--

BEGIN TRANSACTION


/**************************************--
-->�e�[�u�����ƃg���K�[�����o
SELECT
	A.name AS [�e�[�u����],
	B.name AS [�g���K�[��]
FROM
	sys.tables AS A,
	sys.triggers AS B
WHERE A.object_id = B.parent_id 
**************************************/

------------------------------------------
------         �J�[�\���錾         ------
------        �e�[�u�����擾        ------
------------------------------------------
DECLARE CUR_TABLE_NAME CURSOR FOR
	SELECT	 [�e�[�u����]
			,[�g���K�[��]
	FROM [OP_ENTRY_M3P].[dbo].[TEST_TABLE]

-- �J�[�\��OPEN(�e�[�u�����擾)
OPEN CUR_TABLE_NAME

-- FETCH�i�e�[�u�����擾�j
FETCH NEXT FROM CUR_TABLE_NAME INTO @�e�[�u����, @�g���K�[��

-- �e�[�u������ LOOP
WHILE (@@fetch_status = 0)
BEGIN

	SET @CREATE_SQL = 'ALTER TRIGGER [dbo].[' + @�g���K�[�� + ']' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   ON [dbo].[' + @�e�[�u���� + ']' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   FOR INSERT, UPDATE  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' AS ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   DECLARE  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   @time DATETIME = NULL -->�o�^���� ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' BEGIN ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '   SET NOCOUNT ON; ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->�J�[�\���̐錾(�J�[�\���̖��O��INSERTCURSOR) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' DECLARE INSERTCURSOR CURSOR FOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' SELECT [�o�^����] ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '       FROM INSERTED ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->�J�[�\�����J�� ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' OPEN INSERTCURSOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->FETCH NEXT(�J�[�\����i�߂�)&(�l�̎��o��) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' FETCH NEXT FROM INSERTCURSOR INTO @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->LOOP ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' WHILE (@@fetch_status = 0) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' BEGIN ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     -->[�ύX����]�X�V���� [�o�^����]���L�[�ɍX�V ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '         UPDATE [' + @�e�[�u���� + '] SET [�ύX����] = GETDATE(), [�H��KEY] = [����] + ''#'' + [����NO] + ''#'' + [�o�b�`NO] WHERE [�o�^����] = @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     -->[����FLAG]�X�V���� [�o�^����]���L�[�ɍX�V ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '         UPDATE [' + @�e�[�u���� + '] SET ������� = ''������'' WHERE ���� IS NOT NULL AND ������� = ''������'' AND [�o�^����] = @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     -->FETCH NEXT(�J�[�\����i�߂�)&(�l�̎��o��) ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '     FETCH NEXT FROM INSERTCURSOR INTO @time ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' END ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' -->�J�[�\������� ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' CLOSE INSERTCURSOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' DEALLOCATE INSERTCURSOR ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + ' END ' +  NCHAR(13) + NCHAR(10)
	SET @CREATE_SQL = @CREATE_SQL + '  ' +  NCHAR(13) + NCHAR(10)
 

	PRINT @CREATE_SQL

	-- ���ISQL���s
	--EXECUTE(@BKUP_SQL)
	--EXECUTE(@DROP_SQL)
	EXECUTE(@CREATE_SQL)
	--EXECUTE(@INS_SQL)

	FETCH NEXT FROM CUR_TABLE_NAME INTO @�e�[�u����, @�g���K�[��

END
CLOSE CUR_TABLE_NAME
DEALLOCATE CUR_TABLE_NAME

COMMIT TRANSACTION
