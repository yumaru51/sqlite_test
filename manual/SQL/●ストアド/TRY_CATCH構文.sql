
/*TRY...CATCH �\���̊m�F*/
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH
    THROW
END CATCH


/*
TRY...CATCH �\���̉e�����󂯂Ȃ��G���[
�@�E�d��x�� 10 �ȉ��̌x���܂��͏�񃁃b�Z�[�W�B
�@�E�d��x�� 20 �ȏ�ŁA���̃Z�b�V������ SQL Server �f�[�^�x�[�X �G���W�� �^�X�N�������I��������G���[�B
�@�@�d��x�� 20 �ȏ�̃G���[���������A�f�[�^�x�[�X�ڑ����ؒf����Ȃ��ꍇ�ATRY...CATCH �ɂ���ăG���[����������܂��B
�@�E�N���C�A���g�̊��荞�ݗv���⒆�f���ꂽ�N���C�A���g�ڑ��Ȃǂ̃A�e���V�����B
�@�E�V�X�e���Ǘ��҂ɂ�� KILL �X�e�[�g�����g���g�p�����Z�b�V�����̏I���B
https://docs.microsoft.com/ja-jp/sql/t-sql/language-elements/try-catch-transact-sql?view=sql-server-ver15
*/

BEGIN TRY  
    -- Table does not exist; object name resolution  
    -- error not caught.  
    SELECT * FROM NonexistentTable;  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH  
