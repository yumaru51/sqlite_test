
/*テーブル作成時の注意　NULLの設定は引き継ぐが、主キーやIDENTITYの設定は引き継がないので注意*/

-->SELECTした結果のテーブルをクリエイト(違うデータベース間のテーブルも可能)
SELECT
  B.[ビュー名],
  A.[銘柄],
  A.[失効区分],
  A.[ビューID]
INTO
  [OP_ENTRY_INORG].[dbo].[M_銘柄]
FROM
  [YSQLSERV5].[mqcdb01].[dbo].[TSTMビュー銘柄] A
LEFT JOIN
  [YSQLSERV5].[mqcdb01].[dbo].[TSTMビュー] B
ON
  A.ビューID = B.ビューID
