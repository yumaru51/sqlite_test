
IF EXISTS(SELECT * 
          FROM   sys.columns 
          WHERE  NAME = N'���񖼁�'  
          AND    Object_ID = OBJECT_ID(N'���e�[�u������')
	)
    --���݂����Ƃ��̏���
	SELECT '���݂���'
ELSE
    --���݂��Ȃ��Ƃ��̏���
	SELECT '���݂��Ȃ�'    
