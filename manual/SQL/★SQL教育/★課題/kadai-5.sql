--FRUTS_SUM_ZAIKO_INFO�ɑ΂��A���Y�̓}�C�i�X5�A�O���Y�̓v���X10����v���O����
  create procedure kadai_5 AS
  
----�ŏ��Ƀf�[�^�N���A
--  DELETE FROM FRUTS_SUM_ZAIKO_INFO
----TRUNCATE FRUTS_SUM_ZAIKO_INFO

--�ϐ����X�g�̐錾
  DECLARE @�t���[�c�� varchar(20)
		 ,@���� varchar(20)
		 ,@�݌ɐ� numeric(3)

--�J�[�\���̐錾
  DECLARE EmpCur CURSOR FOR	--�J�[�\���̖��O��EmpCur
    Select FRUTS_MAST.�t���[�c���� AS �t���[�c��
          ,FRUTS_MAST.���� AS ����
		  ,SUM(FRUTS_TABLE.�݌ɐ�) AS �݌ɐ�
      from FRUTS_TABLE LEFT OUTER JOIN FRUTS_MAST 
	    ON FRUTS_TABLE.�t���[�cCD = FRUTS_MAST.�t���[�cCD
     group by FRUTS_MAST.�t���[�c����
             ,FRUTS_MAST.����

--�J�[�\�����J��
  OPEN EmpCur

--FETCH�i�s�̎��o���j
  FETCH NEXT FROM EmpCur INTO @�t���[�c��
							 ,@����
							 ,@�݌ɐ�

--LOOP
  WHILE (@@fetch_status = 0)
    BEGIN

    --���Y�̓}�C�i�X5�A�O���Y�̓v���X10�ɍX�V
	  if @���� = '���Y'
	    Begin
	      UPDATE FRUTS_SUM_ZAIKO_INFO SET �݌ɐ� = @�݌ɐ� - 5 where @�t���[�c�� = �t���[�c��
	    End
	  else
	    Begin
	      UPDATE FRUTS_SUM_ZAIKO_INFO SET �݌ɐ� = @�݌ɐ� + 10 where @�t���[�c�� = �t���[�c��
		End

    --FETCH�i�s�̎��o���j
      FETCH NEXT FROM EmpCur INTO @�t���[�c��
							     ,@����
							     ,@�݌ɐ�
	END

--�J�[�\�������
  CLOSE EmpCur
  DEALLOCATE EmpCur
