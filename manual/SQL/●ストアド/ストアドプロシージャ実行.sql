USE [OP_ENTRY_INORG]
GO

DECLARE	@return_value int

-->EXEC	@return_value = ストアド名称
EXEC	@return_value = [dbo].[酸化チタン_CL法_トレース採番MAIN処理]
-->		@変数 = N'値',
		@TODAYS_DATE_CAL = N'2021-12-07 00:00:00',
		@TODAYS_DATE = N'2021-12-07 23:59:00'

SELECT	'Return Value' = @return_value

GO
