
BEGIN TRY
	BEGIN TRANSACTION 
	-- ================================================
	-- 通常処理
	COMMIT TRANSACTION				-->トランザクションを実行
	PRINT 'COMMIT TRANSACTION'
	-- ================================================
END TRY


-->通常処理でエラーが発生するとジャンプする
BEGIN CATCH
	-- ================================================
	-- エラー処理
	ROLLBACK TRANSACTION			-->トランザクションを取り消し
	PRINT ERROR_MESSAGE()
	PRINT 'ROLLBACK TRANSACTION'
	-- ================================================
END CATCH
