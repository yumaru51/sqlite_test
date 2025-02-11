
SELECT MAX(住所の件数) AS AVG_Detail --後から利用するFROM句での「住所の件数」を使っている、MAXじゃなくてAVGなどの集計関数を使ってみるとわかりやすい
FROM
 (SELECT [Kawauchi_DB].[dbo].[従業員データ].住所CD, COUNT(*) AS 住所の件数
  FROM [Kawauchi_DB].[dbo].[従業員データ]
  GROUP BY [Kawauchi_DB].[dbo].[従業員データ].住所CD
  ) AS エイリアスが必要

  /*
  一度下を実行して得られるテーブルを確認！！
  SELECT [Kawauchi_DB].[dbo].[従業員データ].住所CD, COUNT(*) AS 住所の件数
  FROM [Kawauchi_DB].[dbo].[従業員データ]
  GROUP BY [Kawauchi_DB].[dbo].[従業員データ].住所CD
  その後、そのテーブルから必要・利用できるなデータを考えるとわかりやすい
  
  住所CD毎の件数テーブルから最大値を出力するプログラム
  */
