--�t���[�c������̓p�����[�^�Ɏw�肵����A���ނƍ݌ɐ���Ԃ��v���O����
  Create procedure kadai_3 @�t���[�c���� varchar(20) AS
    

  Select FRUTS_MAST.����
		,FRUTS_TABLE.�݌ɐ�
    from FRUTS_TABLE LEFT OUTER JOIN FRUTS_MAST 
	  ON FRUTS_TABLE.�t���[�cCD = FRUTS_MAST.�t���[�cCD
   where FRUTS_MAST.�t���[�c���� = @�t���[�c����

