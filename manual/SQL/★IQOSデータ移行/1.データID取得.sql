SELECT 
	                        データID
						  , 操業年月日
						  , 登録日時
						  , 更新日時
					   FROM 
						    [mqcdb01arc_test].[dbo].TSTDテーブルデータ
					  WHERE 
						    ビューID = 20055
				      ORDER BY
					        データID
						  , 操業年月日