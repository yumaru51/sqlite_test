
SET @aaaa = REPLACE(@aaaa collate Japanese_CS_AS,@式変数名,@関連検査項目コード)
INSERT INTO QC_M3P_WKCALC SELECT @検査項目コード2,REPLACE(@aaaa collate Japanese_CS_AS,'@','MP')
