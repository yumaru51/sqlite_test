
SET @aaaa = REPLACE(@aaaa collate Japanese_CS_AS,@���ϐ���,@�֘A�������ڃR�[�h)
INSERT INTO QC_M3P_WKCALC SELECT @�������ڃR�[�h2,REPLACE(@aaaa collate Japanese_CS_AS,'@','MP')
