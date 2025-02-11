
/*インデックス設定*/

CREATE CLUSTERED INDEX [インデックス名]
	ON [テーブル名] ([列名] ASC)
GO

-- ASCは省略可能
-- 複数カラムの指定可能
-- クラスター化インデックスは1つのテーブルに1つまでしか作成できない
CREATE CLUSTERED INDEX [インデックス名]
	ON [テーブル名] ([列名1],[列名2])
GO
