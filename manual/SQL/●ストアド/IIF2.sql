
-->���f�[�^
DECLARE @X TABLE (score INT)
INSERT INTO @X VALUES(60)
INSERT INTO @X VALUES(65)
INSERT INTO @X VALUES(70)
INSERT INTO @X VALUES(75)


--IIF��score��70�ȏ�ł���΍��i�A�����͕s���i�Ƃ���
SELECT score AS �X�R�A,IIF(score >= 70, '���i', '�s���i') ���� FROM @X
