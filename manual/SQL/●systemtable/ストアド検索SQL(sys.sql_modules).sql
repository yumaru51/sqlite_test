
/*�T�[�o�[���̑SDB�̑S�X�g�A�h���̕�������������*/
SELECT   O.type,	
         O.name,	
         M.definition	
FROM     sys.sql_modules AS M	
            INNER JOIN sys.objects AS O	
				ON M.object_id = O.object_id	
WHERE    M.definition LIKE '%�����L�[���[�h%'	
ORDER BY O.type,	
         O.name;	
