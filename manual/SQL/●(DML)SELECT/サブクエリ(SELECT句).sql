
SELECT [Kawauchi_DB].[dbo].[Customer].CustomerID,

       CustomerName,

       /*年齢を出す(詳しくはhttp://jehupc.exblog.jp/9075644/)*/

       --INT((INT(Format(DATE(),'yyyymmdd')) - INT(Customer.Birthday) )/ 10000) AS Age ,

       /*前回利用日を出す副問い合わせ*/

       ( SELECT MAX(UseDate)

         FROM   [Kawauchi_DB].[dbo].[UseHistory] AS UseHistory2

         WHERE   UseHistory2.UseDate    < '20090310'

           /*副問い合わせの外のフィールドの値を条件に用いる*/

           AND   UseHistory2.CustomerID = Customer.CustomerID

       ) AS LastUseDate

FROM  [Kawauchi_DB].[dbo].[UseHistory]

       INNER JOIN [Kawauchi_DB].[dbo].[Customer]

       ON     UseHistory.CustomerID = Customer.CustomerID

WHERE  UseHistory.UseDate           = '20090310'
