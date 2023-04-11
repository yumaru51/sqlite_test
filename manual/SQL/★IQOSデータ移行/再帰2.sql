WITH test AS
  (SELECT 1 AS '''1から30まで繰り返す''' --> アンカーマンバ
    UNION ALL
   SELECT 
          ['1から30まで繰り返す'] + 1 --> 再帰メンバ 
     FROM 
          test
    WHERE 
          test.['1から30まで繰り返す'] < 30)
 
 SELECT * FROM test;