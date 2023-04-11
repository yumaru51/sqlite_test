
-->元データ
DECLARE @X TABLE (score INT)
INSERT INTO @X VALUES(60)
INSERT INTO @X VALUES(65)
INSERT INTO @X VALUES(70)
INSERT INTO @X VALUES(75)


--IIFでscoreが70以上であれば合格、未満は不合格とする
SELECT score AS スコア,IIF(score >= 70, '合格', '不合格') 合否 FROM @X
