WITH rec as (


/***�ŏ�K�w***/
  SELECT
         1 AS �K�w									-->�ŏ�K�w�Ȃ̂ŊK�w=1
       , �t���[��ID									-->�ŏ�K�w�̃t���[��ID
       , CAST('' AS NVARCHAR(20)) �r���[ID			-->�ŏ�K�w�Ȃ̂Ńr���[�Ȃ�(���͂���Ȃ�)
       , �t���[���� AS �ŏ�ʃt���[��				-->�ŏ�K�w�Ȃ̂ōŏ�ʃt���[��
       , �t���[����									-->�t���[����
       , �e�t���[��ID								-->�ŏ�K�w�Ȃ̂Őe�t���[��ID�Ȃ�
       , CAST(�t���[���� AS NVARCHAR(50))  FULLPATH	-->�ŏ�K�w�Ȃ̂Ńt���[�������p�X
    FROM 
	     [mqcdb04_test].[dbo].[TSTM�t���[��]		
   WHERE 
         �e�t���[��ID is NULL						-->�e�t���[��ID�Ȃ��Ƃ��ŏ�K�w
/***�ŏ�K�w***/


/***�t���[���e�[�u���̊K�w�S���@�������S���I����Ă��玟�ɂ���***/
UNION ALL
  SELECT
         A.�K�w + 1															-->�ォ��J��Ԃ����
       , B.�t���[��ID														-->�t���[��ID
       , CAST('' AS NVARCHAR(20)) �r���[ID									-->�t���[���e�[�u���̊K�w�Ȃ̂Ńr���[�Ȃ�(���͂���Ȃ�)
       , A.�ŏ�ʃt���[��													-->�ŏ�ʃt���[���͌Œ�
       , B.�t���[����														-->�t���[����
       , B.�e�t���[��ID														-->�e�t���[��ID
       , CAST(A.FULLPATH + '\' + B.�t���[���� AS NVARCHAR(50))  FULLPATH	-->�t���[���������Ɍq���Ă���
    FROM 
         rec A																-->��O�̃e�[�u���̂���
       , [mqcdb04_test].[dbo].[TSTM�t���[��] B
   WHERE 
         A.�t���[��ID = B.�e�t���[��ID										-->A.�t���[��ID���e B.�e�t���[��ID���q 
/***�t���[���e�[�u���̊K�w�S���@�������S���I����Ă��玟�ɂ���***/


/***�r���[�e�[�u���̊K�w �r���[�̊K�w�͂Ȃ��̂ň�񂾂�������������Ȃ��@�t���[��ID�������Ƃɂ��J��Ԃ��Ȃ�***/
UNION ALL
  SELECT
         A.�K�w + 1														-->�ォ��J��Ԃ����
       , '' �t���[��ID													-->�����艺�̊K�w���Ȃ��̂Ńt���[��ID�͏���
       , CAST(C.�r���[ID AS NVARCHAR(20)) �r���[ID						-->�r���[ID(���͂���Ȃ�)�t���[��ID����r���[���R�[�h�Ƃ��Ă���̂ŎQ�Ƃ��Ȃ�����
       , A.�ŏ�ʃt���[��												-->�ŏ�ʃt���[���͌Œ�
       , C.�^�C�g��														-->�^�C�g����(�r���[��)�@�ŏ����߂�ꂽ[�t���[����]�ɓ���
       , C.�t���[��ID													-->�e�t���[��ID �����L�[�Ȃ̂Ńt���[��ID���e�t���[��ID�ɂȂ�
       , CAST(A.FULLPATH + '\' + C.�^�C�g�� AS NVARCHAR(50)) FULLPATH	-->�^�C�g���������Ɍq���Ă���
    FROM 
         rec A
       , [mqcdb04_test].[dbo].[TSTM�t���[���r���[] C
   WHERE 
         A.�t���[��ID = C.�t���[��ID									-->�t���[���e�[�u���ƃt���[���r���[�e�[�u��������
/***�r���[�e�[�u���̊K�w �r���[�̊K�w�͂Ȃ��̂ň�񂾂�������������Ȃ��@�t���[��ID�������Ƃɂ��J��Ԃ��Ȃ�***/


  )
  SELECT * FROM rec
   WHERE FULLPATH LIKE '%�l�}�g����%'
   ORDER BY FULLPATH