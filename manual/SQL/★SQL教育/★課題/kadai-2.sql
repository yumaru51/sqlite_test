--�݌ɐ��̍��v��Ԃ��v���O����
  create procedure kadai_2 AS
  
  DECLARE @���v�݌ɐ� int
  
  --���v(�Z���N�g�ō��v�l��\��)
  --select @���v�݌ɐ� = SUM(�݌ɐ�)
  --from FRUTS_TABLE
    

  --�Ԃ�l
	SET @���v�݌ɐ� = (select SUM(�݌ɐ�) AS ���v�݌ɐ�
		  			     from FRUTS_TABLE)


  --�m�F(DB���ŏo�͂����Ă�̂�NG)
  --print @���v�݌ɐ� 


--�l��Ԃ�	�X�g�A�h�v���V�[�W�����Łuprint @RC�v����		  
  RETURN @���v�݌ɐ�