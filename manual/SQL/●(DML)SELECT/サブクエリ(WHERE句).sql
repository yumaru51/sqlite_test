
--内部結合で名称川内の社員ID, 名称, 住所CD, 役職IDを表示
SELECT 社員ID, 名称, 住所CD, 役職ID FROM [kawauchi_DB].[dbo].[従業員データ] AS 従業員データ INNER JOIN [kawauchi_DB].[dbo].[社員マスタ] AS 社員マスタ ON 従業員データ.ID = 社員マスタ.社員ID
 WHERE 社員マスタ.名称 = '川内'

--サブクエリ使用で名称川内の従業員データ表示
SELECT * FROM [kawauchi_DB].[dbo].[従業員データ] AS 従業員データ
 WHERE 従業員データ.ID = (SELECT [kawauchi_DB].[dbo].[社員マスタ].社員ID FROM [kawauchi_DB].[dbo].[社員マスタ]
 WHERE [kawauchi_DB].[dbo].[社員マスタ].名称 = '川内')

--サブクエリ使用で名称川内の社員ID, 名称, 住所CD, 役職IDを表示
 SELECT [kawauchi_DB].[dbo].[社員マスタ].社員ID, [kawauchi_DB].[dbo].[社員マスタ].名称, 従業員データ.住所CD, 従業員データ.役職ID
  FROM [kawauchi_DB].[dbo].[従業員データ] AS 従業員データ, [kawauchi_DB].[dbo].[社員マスタ]
 WHERE 従業員データ.ID = (SELECT [kawauchi_DB].[dbo].[社員マスタ].社員ID FROM [kawauchi_DB].[dbo].[社員マスタ]
 WHERE [kawauchi_DB].[dbo].[社員マスタ].名称 = '川内') and [kawauchi_DB].[dbo].[社員マスタ].社員ID = 従業員データ.ID

 /*
	社員IDと名称は社員マスタ、住所CDと役職IDは従業員データなのでリレーションになる
	条件指定で
	①従業員データ.IDが = 名称川内の社員ID のときのみの従業員データを表示←サブクエリ利用
	②社員マスタ.社員ID = 従業員データ.IDのときのみの社員マスタを表示←and以降
	リレーションで扱う表の数だけ条件で指定しなければいけない
	従業員データにだけAS使用してるのはスルーで
  */
