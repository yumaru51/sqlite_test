BEGIN TRY
  -- TRY�u���b�N���Ɏ��s����Transact-SQL�X�e�[�g�����g���L�q����
  SELECT 1/0;
  -- ERROR�ȍ~�̏����͎��s����Ȃ�
  SELECT 'test';
END TRY
BEGIN CATCH
  -- CATCH�u���b�N���ɃG���[�����̃R�[�h���L�q����
  SELECT
    ERROR_NUMBER() AS ErrorNumber,
    ERROR_SEVERITY() AS ErrorSeverity,
    ERROR_STATE() AS ErrorState,
    ERROR_PROCEDURE() AS ErrorProcedure,
    ERROR_LINE() AS ErrorLine,
    ERROR_MESSAGE() AS ErrorMessage;
END CATCH