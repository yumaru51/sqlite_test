 SELECT 
        A.ビューID
      , A.項目ID
      , A.フィールドNO
      , A.フィールド名
      , B.データ型ID
      , B.汎用区分ID
      , B.数値
      , B.文字
      , B.データID


/**************************************************************************
**	改修
**************************************************************************/	


      , CASE
	      WHEN データ型ID IS NULL THEN NULL

/**************************************************************************
**	1:数値 
**************************************************************************/
          WHEN データ型ID = 1 THEN CAST(B.数値 as varchar)

/**************************************************************************
**	3:時刻 14:適用時刻 
**************************************************************************/
		  WHEN データ型ID = 3 OR データ型ID = 14 THEN CASE 
		                                                WHEN B.文字 LIKE '%:%' THEN B.文字
													    WHEN CAST(B.文字 AS int) >= 2400 THEN CASE
														                                        WHEN (Len(CAST(CAST(B.文字 AS int) - 2400 AS varchar)) = 4) THEN Left(CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2) + ':' + Right(CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2)
													                                            WHEN (Len(CAST(CAST(B.文字 AS int) - 2400 AS varchar)) = 3) THEN Left('0' + CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2) + ':' + Right('0' + CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2)
					                                                                            WHEN (Len(CAST(CAST(B.文字 AS int) - 2400 AS varchar)) = 2) THEN Left('00' + CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2) + ':' + Right('00' + CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2)
                                                                                                WHEN (Len(CAST(CAST(B.文字 AS int) - 2400 AS varchar)) = 1) THEN Left('000' + CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2) + ':' + Right('000' + CAST(CAST(B.文字 AS int) - 2400 AS varchar), 2)
													      								      END
													    WHEN CAST(B.文字 AS int) < 2400 THEN CASE
																							   WHEN (Len(B.文字) = 4) THEN Left(B.文字, 2) + ':' + Right(B.文字, 2)
													                                           WHEN (Len(B.文字) = 3) THEN Left('0' + B.文字, 2) + ':' + Right('0' + B.文字, 2)
													    									   WHEN (Len(B.文字) = 2) THEN Left('00' + B.文字, 2) + ':' + Right('00' + B.文字, 2)
													    									   WHEN (Len(B.文字) = 1) THEN Left('000' + B.文字, 2) + ':' + Right('000' + B.文字, 2)
													     									 END
                                                        ELSE B.文字
											          END
					
/**************************************************************************
**	7:マスタ
**************************************************************************/	
 		  WHEN データ型ID = 7 THEN 
					  (SELECT 
						      汎用名称
						 FROM 
							  [mqcdb01arc_test].[dbo].TSTM汎用
						WHERE 
							  汎用区分ID = B.汎用区分ID
						  AND  
							  汎用コード = B.文字)

/**************************************************************************
**	25:設備
**************************************************************************/	
		  WHEN データ型ID = 25 THEN 
		                            (SELECT 
										    設備名
									   FROM 
										    [mqcdb01arc_test].[dbo].TSTM設備
									  WHERE 
										    設備ID = B.文字)

/**************************************************************************
**	33:時刻区分
**************************************************************************/	
		  WHEN データ型ID = 33 THEN 
		                            (SELECT 
									        時刻区分名
									   FROM 
										    [mqcdb01arc_test].[dbo].TSTS時刻区分
									  WHERE 
										    時刻区分ID = B.文字)

/**************************************************************************
**	6:年月日 13:適用年月日 
**************************************************************************/
		  WHEN データ型ID = 6 OR データ型ID = 13 THEN CASE
		                                                WHEN (SUBSTRING(Replace(B.文字, ' ', ''), 5, 2) = 04
													      OR SUBSTRING(Replace(B.文字, ' ', ''), 5, 2) = 06
													      OR SUBSTRING(Replace(B.文字, ' ', ''), 5, 2) = 09
													      OR SUBSTRING(Replace(B.文字, ' ', ''), 5, 2) = 11)
													     AND RIGHT(Replace(B.文字, ' ', ''), 2) = 31
									                    THEN Left(CAST(CAST(Replace(B.文字, ' ', '') AS int) - 1 AS varchar), 4) + '/' + SUBSTRING(CAST(CAST(Replace(B.文字, ' ', '') AS int) - 1 AS varchar), 5, 2) + '/' + Right(CAST(CAST(Replace(B.文字, ' ', '') AS int) - 1 AS varchar), 2)
						                                     
					                                    WHEN (SUBSTRING(Replace(B.文字, ' ', ''), 5, 2) = 02
					                                     AND RIGHT(Replace(B.文字, ' ', ''), 2) = 29)
                                                        THEN Left(CAST(CAST(Replace(B.文字, ' ', '') AS int) - 1 AS varchar), 4) + '/' + SUBSTRING(CAST(CAST(Replace(B.文字, ' ', '') AS int) - 1 AS varchar), 5, 2) + '/' + Right(CAST(CAST(Replace(B.文字, ' ', '') AS int) - 1 AS varchar), 2)
                                                        
													    ELSE Left(B.文字, 4) + '/' + SUBSTRING(B.文字, 5, 2) + '/' + Right(B.文字, 2)
													  END

/**************************************************************************
**	11:送液工程
**************************************************************************/
		  WHEN データ型ID = 11 THEN 
		                            (SELECT 
										    工程名
									   FROM  
										    [mqcdb01arc_test].[dbo].[TSTM工程]
									  WHERE 
											工程ID = B.文字)

/**************************************************************************
**	19:銘柄切替
**************************************************************************/	
		  WHEN データ型ID = 19 THEN 
		                            (SELECT 
										    システムコード
									   FROM 
										    [mqcdb01arc_test].[dbo].[TSTS銘柄切替区分]
									  WHERE  
										    銘柄切替区分 = B.文字)

/**************************************************************************
**	17:鉱石
**************************************************************************/	
		  WHEN データ型ID = 17 THEN 
		                            (SELECT 
										    鉱石名
									   FROM  
										    [mqcdb01arc_test].[dbo].[TSTM鉱石]
									  WHERE 
										    鉱石ID = B.文字)

/**************************************************************************
**	上記以外は文字をそのまま挿入	NULLは文字列ではないので分けて考える　記述しなくてもデフォルトNULLなので分岐しない
**************************************************************************/	
		  ELSE B.文字
	    END 値 
		

/**************************************************************************
**	改修
**************************************************************************/			
		
   --INTO データ値_10		 
   FROM 
        (SELECT 
                ビューID
			  , 項目ID
              , フィールド名
              , フィールドNO
           FROM 
                [pastdata_ingarc].[dbo].[TSTMビュー項目]
          WHERE 
                ビューID =  20055
				) A
           LEFT JOIN
	            (SELECT 
                        C.項目ID
                      , D.データ型ID
                      , D.汎用区分ID
                      , C.数値
                      , C.文字
                      , C.データID
	               FROM 
	                    [mqcdb01arc_test].[dbo].[TSTDテーブルデータ項目]		C
                   LEFT JOIN
                        [mqcdb01arc_test].[dbo].[TSTMテーブル項目]				D
                     ON 
                        C.項目ID = D.項目ID) B
                     ON 
					    A.項目ID = B.項目ID
				  WHERE データID = 752077
                  ORDER BY
                      A.フィールドNO, データ型ID