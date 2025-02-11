

-->MAINの全データ（MAINに無い場合、NULLで結合）
SELECT
	main.[項目1],
	main.[項目2],
	main.[項目3],
	sub.[項目1],
	sub.[項目2],
	sub.[項目3]
FROM table main
LEFT OUTER JOIN table sub
ON main.[キー] = sub.[キー]


-->どちらにも含まれる
SELECT
	main.[項目1],
	main.[項目2],
	main.[項目3],
	sub.[項目1],
	sub.[項目2],
	sub.[項目3]
FROM table main
INNER JOIN table sub
ON main.[キー] = sub.[キー]


-->SUBに無いデータ
SELECT
	main.[項目1],
	main.[項目2],
	main.[項目3],
	sub.[項目1],
	sub.[項目2],
	sub.[項目3]
FROM table main
LEFT OUTER JOIN table sub
ON main.[キー] = sub.[キー]
WHERE sub.[キー] IS NULL

