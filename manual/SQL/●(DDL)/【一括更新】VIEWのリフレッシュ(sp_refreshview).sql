
-->VIEW�̃��t���b�V��
EXEC sp_refreshview '�r���[�̖��O';

-->�ꊇ�ōs���ꍇ
SELECT name, 'EXEC sp_refreshview ''' + name + ''';' AS QUERY FROM sys.views

