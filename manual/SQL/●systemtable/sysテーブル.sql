/*�V�X�e���e�[�u���ꗗ*/

-->�e�[�u�������擾
SELECT *
FROM sys.tables

-->���ږ����擾,object_id���sys.tables�Q��
SELECT *
FROM sys.columns

-->�X�g�A�[�h�v���V�W���[��t�@���N�V����������
SELECT   O.type,
          O.name,
          M.definition
FROM     sys.sql_modules AS M
            INNER JOIN sys.objects AS O
             ON M.object_id = O.object_id
WHERE    M.definition LIKE '%�o�^����%'
ORDER BY O.type,
          O.name;

-->�f�[�^�x�[�X���擾
SELECT *
  FROM sys.databases

SELECT name FROM sys.databases ORDER BY upper(name)