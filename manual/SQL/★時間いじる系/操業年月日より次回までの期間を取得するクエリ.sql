
-->���f�[�^
DECLARE @X table (���ƔN���� varchar(50), solid int)
INSERT INTO @X VALUES('2020-07-18 00:00:00', '550')
INSERT INTO @X VALUES('2020-07-19 00:00:00', '585')
INSERT INTO @X VALUES('2020-07-20 12:00:00', '587')
INSERT INTO @X VALUES('2020-07-20 15:00:00', '586')
INSERT INTO @X VALUES('2020-07-20 16:00:00', '551')
INSERT INTO @X VALUES('2020-07-20 17:00:00', '589')
INSERT INTO @X VALUES('2020-07-21 06:00:00', '600')
SELECT * FROM @X


-->�@�����e�[�u�����������āAA�������ƃf�[�^���傫�����R�[�h������
SELECT A.[���ƔN����], B.[���ƔN����]
FROM @X A, @X B
WHERE A.[���ƔN����] < B.[���ƔN����]
ORDER BY A.���ƔN����


-->�A����f�[�^���ꌏ�ɍi�荞��
SELECT A.[���ƔN����], MIN(B.[���ƔN����]) AS ����f�[�^
FROM @X A
LEFT OUTER JOIN @X B
ON A.[���ƔN����] < B.[���ƔN����]
GROUP BY A.[���ƔN����]


-->�C�͈͂ɕύX���邽�ߎ���f�[�^�u-1���v,�ŐV�̃f�[�^�͎���f�[�^��NULL�ƂȂ邽�ߌŒ�Ŏ���f�[�^��ݒ肷��
SELECT A.[���ƔN����], ISNULL(DATEADD(mi, -1, MIN(B.[���ƔN����])), '2100/01/01') AS ����f�[�^
FROM @X A
LEFT OUTER JOIN @X B
ON A.[���ƔN����] < B.[���ƔN����]
GROUP BY A.[���ƔN����]
