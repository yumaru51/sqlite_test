--datetime�^��date�^+time�^��}������v���O����(��̃e�[�u����date�^���ڂ�time�^���ڂ�ʂ̃e�[�u���ɓ����)
DECLARE @1 varchar(MAX) ,@2 varchar(MAX) ,@3 datetime2(0)


SET @1 = (SELECT [���Ɠ�] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [�H��] = 'B')
SET @2 = (SELECT [����] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [�H��] = 'B')
SET @3 = @1 + ' ' + @2
PRINT @3

INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([���Ɠ�] ,[�H��]) VALUES (@3 ,'B')


--datetime�^��date�^�̃f�[�^��}������Ǝ��Ԃ�00:00:00�ő}�������
--INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([���Ɠ�] ,[�H��]) VALUES ((SELECT [���Ɠ�] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [�H��] = 'B') ,'B')