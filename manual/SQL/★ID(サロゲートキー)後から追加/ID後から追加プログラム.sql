
-->TOP1����Ȃ��āA�J�[�\���񂵂�WHERE��Ɉ�ӂƂȂ������ǉ���UPDATE�ł悳�����B
-->ROW_NUMBER()���g���ׂ�

/*********************************************************************************************
***CREATE TABLE ATEST(ID int ,Name varchar(50) ,Score int ,[Address] varchar(50) ,FLAG int)
***INSERT INTO ATEST VALUES(NULL ,'���' ,100 ,'�O�d' ,0),(NULL ,'�R�c' ,90 ,'�O�d' ,0),(NULL ,'�c��' ,80 ,'�O�d' ,0),(NULL ,'�n��' ,70 ,'�O�d' ,0),(NULL ,'���' ,60 ,'�O�d' ,0)
***
***SELECT TOP 1 �𗘗p���ďォ���s�����擾���邱�ƂŃJ�[�\�����g��Ȃ��ł���
***ID��ǉ��������FLAG��ݒ肵�Ď擾����s�����炵�Ă���
***���[�v�̏����̓e�[�u���̍s�����w�肷�� 
**********************************************************************************************/

DECLARE 
        @Name varchar(50) = NULL		-->�ォ���s�擾���邽�߂ɏd���s�̒l
	  , @SQL varchar(MAX)				-->SQL�X�e�[�g�����g
	  , @ID int = 1						-->ID��ǉ����邽�߂�ID�ϐ��@


  WHILE (@ID <= 5)
  BEGIN 


        SET @Name = (SELECT 
		        		    TOP 1 Name
				       FROM 
					        ATEST
				      WHERE 
					        FLAG = 0)

        SET @SQL = 'UPDATE 
                           ATEST
                       SET 
                           FLAG = 1
                         ,   ID = ' + CAST(@ID AS varchar(50) ) + '
                     WHERE 
                           Name =''' + @Name + ''''
        EXEC(@SQL)
        SET @ID += 1


  END