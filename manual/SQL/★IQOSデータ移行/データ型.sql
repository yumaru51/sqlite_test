/****** SSMS の SelectTopNRows コマンドのスクリプト  ******/
SELECT TOP 10000 [データ型ID]
      ,[データ型名]
      ,[システムコード]
      ,[優先順位]
      ,[失効区分]
      ,[登録端末]
      ,[登録日時]
      ,[更新端末]
      ,[更新日時]
  FROM [mqcdb01_test].[dbo].[TSTSデータ型]