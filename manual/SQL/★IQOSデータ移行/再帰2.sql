WITH test AS
  (SELECT 1 AS '''1����30�܂ŌJ��Ԃ�''' --> �A���J�[�}���o
    UNION ALL
   SELECT 
          ['1����30�܂ŌJ��Ԃ�'] + 1 --> �ċA�����o 
     FROM 
          test
    WHERE 
          test.['1����30�܂ŌJ��Ԃ�'] < 30)
 
 SELECT * FROM test;