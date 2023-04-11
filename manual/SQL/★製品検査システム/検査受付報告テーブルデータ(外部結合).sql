SELECT 
       A.依頼NO
	 , B.ロット
	 , C.項目名 AS 検査項目
	 , D.文字 AS 検査値
	 , C.単位
	 , C.試験方法区分
	 , E.表記 AS 規格
	 , F.表記 AS 実績値
	 , B.備考
  FROM 
       [mqcdb05].[dbo].[QCTD依頼]				A
	 , [mqcdb05].[dbo].[QCTDテーブルデータ]		B
	 , [mqcdb05].[dbo].[QCTD依頼項目]			G
	 , [mqcdb05].[dbo].[QCTMテーブル項目]		C
	 , [mqcdb05].[dbo].[QCTDテーブルデータ項目]	D
  LEFT JOIN
	   [mqcdb05].[dbo].[QCTM規格]				E
	ON 
	   E.規格区分 = 1								-->規格区分 = 1のとき規格
   AND D.項目ID = E.項目ID							-->検査値と規格を紐付ける
  LEFT JOIN
	   [mqcdb05].[dbo].[QCTM規格]				F
    ON 
       F.規格区分 = 2								-->規格区分 = 2のとき実績値
   AND D.項目ID = F.項目ID							-->検査値と実績値を紐付ける
 WHERE 
       A.依頼NO = 1702491							-->依頼NOを選択
   AND A.依頼ID = B.依頼ID							-->「依頼テーブル」より依頼IDを参照
   AND A.依頼ID = G.依頼ID							-->「依頼テーブル」より依頼IDを参照
   AND G.項目ID = C.項目ID							-->依頼IDと検査項目を紐付ける
   AND B.テーブルID = C.テーブルID					-->「テーブルデータテーブル」よりテーブルIDを参照
   AND B.データID = D.データID						-->ロットと検査値を紐付ける
   AND C.項目ID = D.項目ID							-->検査項目と検査値を紐付ける
 ORDER BY D.データID ,B.ロット, C.優先順位