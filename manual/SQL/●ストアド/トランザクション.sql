
BEGIN TRY
	BEGIN TRANSACTION 
	-- ================================================
	-- �ʏ폈��
	COMMIT TRANSACTION				-->�g�����U�N�V���������s
	PRINT 'COMMIT TRANSACTION'
	-- ================================================
END TRY


-->�ʏ폈���ŃG���[����������ƃW�����v����
BEGIN CATCH
	-- ================================================
	-- �G���[����
	ROLLBACK TRANSACTION			-->�g�����U�N�V������������
	PRINT ERROR_MESSAGE()
	PRINT 'ROLLBACK TRANSACTION'
	-- ================================================
END CATCH
