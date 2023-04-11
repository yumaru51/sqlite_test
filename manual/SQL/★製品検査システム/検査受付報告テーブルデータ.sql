SELECT 
       A.依頼NO
	 , B.ロット
	 , D.項目名 AS 検査項目
	 , E.文字 AS 検査値
	 , D.単位
	 , D.試験方法区分
	 , (SELECT F.表記 FROM [mqcdb05].[dbo].[QCTM規格] F WHERE 規格区分 = 1 AND E.項目ID = F.項目ID) 規格
	 , (SELECT G.表記 FROM [mqcdb05].[dbo].[QCTM規格] G WHERE 規格区分 = 2 AND E.項目ID = G.項目ID) 実績値
	 , B.備考
  FROM 
       [mqcdb05].[dbo].[QCTD依頼]				A
	 , [mqcdb05].[dbo].[QCTDテーブルデータ]		B
	 , [mqcdb05].[dbo].[QCTD依頼項目]			C
	 , [mqcdb05].[dbo].[QCTMテーブル項目]		D
	 , [mqcdb05].[dbo].[QCTDテーブルデータ項目]	E
 WHERE 
       A.依頼NO = 1702491							-->依頼NOを選択
   AND A.依頼ID = B.依頼ID							-->「依頼テーブル」より依頼IDを参照
   AND A.依頼ID = C.依頼ID							-->「依頼テーブル」より依頼IDを参照
   AND C.項目ID = D.項目ID							-->依頼IDと検査項目を紐付ける
   AND B.テーブルID = D.テーブルID					-->「テーブルデータテーブル」よりテーブルIDを参照
   AND B.データID = E.データID						-->ロットと検査値を紐付ける
   AND D.項目ID = E.項目ID							-->検査項目と検査値を紐付ける
 ORDER BY E.データID ,B.ロット, D.優先順位