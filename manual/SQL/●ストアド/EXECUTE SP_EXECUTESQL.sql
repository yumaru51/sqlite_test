
/*���ږ��A�e�[�u�����𓮓I�ɂ������ꍇ�A���I�N�G���𗘗p����*/

DECLARE @TABLE			NVARCHAR(MAX) = 'T_CR-EL_�_30309'
DECLARE @BRAND			NVARCHAR(MAX) = 'FT-4000T'
DECLARE @LOT_NUMBER		NVARCHAR(MAX) = '0550'
DECLARE @SQL_Query1		NVARCHAR(MAX) = NULL
DECLARE @SQL_Query2		NVARCHAR(MAX) = NULL
DECLARE @i				NVARCHAR(MAX) = NULL


SET @SQL_Query1 = 'SELECT @OUT = COUNT(*) FROM [' + @TABLE + '] WHERE [����] = @BRANDINPUT AND [���b�gNO] = @LOT_NUMBERINPUT'
SET @SQL_Query2 = '@BRANDINPUT NVARCHAR(MAX), @LOT_NUMBERINPUT NVARCHAR(MAX), @OUT NVARCHAR(MAX) OUTPUT'


PRINT @TABLE + @BRAND + @LOT_NUMBER

EXECUTE SP_EXECUTESQL
	@SQL_Query1							-->���s����SQL
  , @SQL_Query2							-->�����Ŏg���ϐ��̒�`(�O���֓n���ꍇ��OUTPUT������)
  , @BRANDINPUT = @BRAND				-->�����ϐ��ւ̑����(����)
  , @LOT_NUMBERINPUT = @LOT_NUMBER		-->�����ϐ��ւ̑����(����)
  , @OUT = @i OUTPUT					-->�O���ϐ��ւ̑����(�o��)


PRINT @SQL_Query1
PRINT @SQL_Query2
PRINT @i
