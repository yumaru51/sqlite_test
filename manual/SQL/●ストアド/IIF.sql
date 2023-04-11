
-->iif 条件分岐
 DECLARE @X	int = 5,@Y int = -7

 -->正の数の時値を表示、負の数の時値を0
 SELECT iif(@X>0, @X, 0) AS 正の数, iif(@Y>0, @Y, 0) AS 負の数
 -->負の数の時値を表示、正の数の時値を0
 SELECT iif(@X<0, @X, 0) AS 正の数, iif(@Y<0, @Y, 0) AS 負の数