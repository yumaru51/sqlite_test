/*
 SELECT �Ј�ID, ����, �Z��, �]�^.�Z��CD
 FROM [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^] AS �]�^, [Kawauchi_DB].[dbo].[�Ј��}�X�^] AS �Ѓ^, [Kawauchi_DB].[dbo].[�Z���}�X�^] AS �Z�^
 WHERE �]�^.ID = �Ѓ^.�Ј�ID and �]�^.�Z��CD = �Z�^.�Z��CD
*/

--/*
CREATE PROCEDURE sp_sample @ID varchar(2) AS
--�ϐ����X�g�̐錾
DECLARE @�Ј�ID nvarchar(50),  @���� nvarchar(50), @�Z�� nvarchar(50)

--�J�[�\���̐錾
DECLARE EmpCur CURSOR FOR	--�J�[�\���̖��O��EmpCur
SELECT �Ј�ID, ����, �Z��
 FROM [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^] AS �]�^, [Kawauchi_DB].[dbo].[�Ј��}�X�^] AS �Ѓ^, [Kawauchi_DB].[dbo].[�Z���}�X�^] AS �Z�^
 WHERE �]�^.ID = �Ѓ^.�Ј�ID and �]�^.�Z��CD = �Z�^.�Z��CD and �Z�^.�Z��CD = @ID	--���͂��ꂽID���Ј�ID�ɑ��
 
--�J�[�\�����J��
OPEN EmpCur
 
--FETCH�i�s�̎��o���j
FETCH NEXT FROM EmpCur INTO @�Ј�ID, @����, @�Z��
 
--LOOP
 
WHILE (@@fetch_status = 0)
BEGIN
    --�ϐ����X�g�̒l���o��									���̃��[�v���ɃJ�[�\���̕ϐ��𗘗p����
    PRINT @�Ј�ID + ' ' + @���� + ' ' + @�Z��
    --FETCH�i�s�̎��o���j
    FETCH NEXT FROM EmpCur INTO @�Ј�ID,@����,@�Z��
END
	--PRINT @�Ј�ID + ' ' + @���� + ' ' + @�Z��				���[�v�𔲂�����Ō�̍s���ϐ��ɓ����Ă���I
--�J�[�\�������
CLOSE EmpCur
DEALLOCATE EmpCur

RETURN
--*/