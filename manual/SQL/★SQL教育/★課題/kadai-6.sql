--�w�肵���e�[�u���̍Ō�̍s�������폜���Ă����v���O����
CREATE PROCEDURE kadai_6 AS
  
--�ϐ����X�g�̐錾
  DECLARE @�t���[�c�� varchar(20)
		, @���� varchar(20)
	    , @�݌ɐ� numeric(3)
	    , @4 int
		, @5 int
	    , @i int

--�J�[�\���̐錾
  DECLARE EmpCur CURSOR FOR	--�J�[�\���̖��O��EmpCur
	SELECT �t���[�c�� ,���� ,�݌ɐ�
	FROM FRUTS_SUM_ZAIKO_INFO

--�J�[�\�����J��
  OPEN EmpCur

--FETCH�i�s�̎��o���j
  FETCH NEXT FROM EmpCur INTO @�t���[�c��
							 ,@����
							 ,@�݌ɐ�

--LOOP
  WHILE (@@fetch_status = 0)
    BEGIN

    --FETCH�i�s�̎��o���j
      FETCH NEXT FROM EmpCur INTO @�t���[�c��
							     ,@����
							     ,@�݌ɐ�
	END

  DELETE FROM FRUTS_SUM_ZAIKO_INFO WHERE �t���[�c�� = @�t���[�c��

--�J�[�\�������
  CLOSE EmpCur
  DEALLOCATE EmpCur

RETURN