--datetime�^��date�����������o���ʃe�[�u����time�^�ƌ�������INSERT����
DECLARE @1 varchar(MAX) ,@2 varchar(MAX) ,@3 datetime2(0)


SET @1 = (SELECT [���Ɠ�] FROM [Kawauchi_DB].[dbo].[A_test2] WHERE [�H��] = 'B')	-->datetime�^�̃e�[�u�����瑀�Ɠ������
SET @1 = Left(@1, 10)																-->YYYY/MM/DD��10��
SET @2 = (SELECT [����] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [�H��] = 'B')		-->time�^�̃e�[�u�����玞�Ԃ����
SET @3 = @1 + ' ' + @2																-->YYYY/MM/DD TT:MM:SSSS �̌`���ɂ���
PRINT @3

INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([���Ɠ�] ,[�H��]) VALUES (@3 ,'B')		-->INSERT����