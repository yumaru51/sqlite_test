--�����e�[�u�����Q�Ƃ��ĐV�����e�[�u���ɒl�}������v���O����
Create procedure kadai_1 AS

--�ϐ����X�g�̐錾
  DECLARE @CD varchar(2)
		 ,@�t���[�c���� varchar(20)
		 ,@���� varchar(20)
		 ,@�݌ɐ� numeric(3)

--�J�[�\���̐錾
  DECLARE EmpCur CURSOR FOR	--�J�[�\���̖��O��EmpCur
   Select FRUTS_TABLE.�t���[�cCD 
	 	 ,FRUTS_MAST.�t���[�c����
		 ,FRUTS_MAST.����
		 ,FRUTS_TABLE.�݌ɐ�
     from FRUTS_TABLE LEFT OUTER JOIN FRUTS_MAST 
	   ON FRUTS_TABLE.�t���[�cCD = FRUTS_MAST.�t���[�cCD

--�J�[�\�����J��
  OPEN EmpCur

--FETCH�i�s�̎��o���j
  FETCH NEXT FROM EmpCur INTO @CD
							 ,@�t���[�c����
							 ,@����
							 ,@�݌ɐ�

--LOOP
  WHILE (@@fetch_status = 0)
    BEGIN


    --�f�[�^��}�����Ă���
	  INSERT INTO FRUTS_INFO VALUES(@CD 
								   ,@�t���[�c���� 
								   ,@���� 
								   ,@�݌ɐ�)
    --FETCH�i�s�̎��o���j
      FETCH NEXT FROM EmpCur INTO @CD
							     ,@�t���[�c����
							     ,@����
							     ,@�݌ɐ�
	END

--�J�[�\�������
  CLOSE EmpCur
  DEALLOCATE EmpCur
