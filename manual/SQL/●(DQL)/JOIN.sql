

-->MAIN�̑S�f�[�^�iMAIN�ɖ����ꍇ�ANULL�Ō����j
SELECT
	main.[����1],
	main.[����2],
	main.[����3],
	sub.[����1],
	sub.[����2],
	sub.[����3]
FROM table main
LEFT OUTER JOIN table sub
ON main.[�L�[] = sub.[�L�[]


-->�ǂ���ɂ��܂܂��
SELECT
	main.[����1],
	main.[����2],
	main.[����3],
	sub.[����1],
	sub.[����2],
	sub.[����3]
FROM table main
INNER JOIN table sub
ON main.[�L�[] = sub.[�L�[]


-->SUB�ɖ����f�[�^
SELECT
	main.[����1],
	main.[����2],
	main.[����3],
	sub.[����1],
	sub.[����2],
	sub.[����3]
FROM table main
LEFT OUTER JOIN table sub
ON main.[�L�[] = sub.[�L�[]
WHERE sub.[�L�[] IS NULL

