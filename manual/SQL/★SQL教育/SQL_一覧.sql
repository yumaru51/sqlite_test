
/* ��{DML(Data Manipulation Language) */

-->SELECT/
SELECT * FROM �e�[�u���� WHERE ������

-->INSERT/
INSERT (INTO) �e�[�u����(�t�B�[���h��1, �t�B�[���h��2...) VALUES (�l1,�l2...)
INSERT (INTO) �e�[�u���� VALUES (�l1,�l2...)

-->UPDATE/
UPDATE �e�[�u���� SET �t�B�[���h��1 = �l1, �t�B�[���h��2 = �l2 WHERE ������

-->DELETE/
DELETE FROM �e�[�u���� WHERE ������



/* ��{DDL(Data Definition Language) */

-->CREATE/
CREATE TABLE �e�[�u���� (�t�B�[���h1 �^, �t�B�[���h2 �^...)
CREATE VIEW 

-->DROP/
DROP TABLE �e�[�u����

-->ALTER/
ALTER TABLE �e�[�u���� ADD �t�B�[���h1 �^



/* ���pDML(Data Manipulation Language) */

-->�d�����Ȃ���
SELECT DISTINCT �� FROM �e�[�u����

-->�����̒l����C�Ɏw��
SELECT * FROM �e�[�u���� WHERE �� IN (�l1,�l2)

-->�����𐧌�����
SELECT TOP X �� FROM �e�[�u����

-->�Ԃ�����
SELECT �� FROM �e�[�u���� WHERE �� BETWEEN A AND B

-->�ʖ�������
SELECT �� AS �ʖ� FROM
SELECT �� FROM �e�[�u���� AS �ʖ�

-->�e�[�u���Ȃ���SELECT��
SELECT '' AS �ʖ�
SELECT '' �ʖ�

-->���H�����s��ǉ�
SELECT ��, '' AS �ʖ� FROM �e�[�u����

-->SELECT�������ʂ����̂܂܃e�[�u���ɑ}��
SELECT * INTO �e�[�u���� FROM �e�[�u����

-->SELECT���ʃf�[�^��o�^
INSERT INTO �e�[�u���� (column1, column2) SELECT columna, columnb FROM �e�[�u����



/* ��{DCL(Data Control Language) */

-->USE/

-->GO/

-->BEGIN/

-->COMMIT/

-->ROLLBACK/

-->EXEC/
�\�̖��O��ύX����
EXEC sp_rename '���݂̃e�[�u����','�ύX����e�[�u����'
�\�̗񖼂�ύX����
EXEC sp_rename '�e�[�u����.���݂̗�','�ύX�����'
