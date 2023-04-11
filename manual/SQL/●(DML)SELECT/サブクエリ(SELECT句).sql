
SELECT [Kawauchi_DB].[dbo].[Customer].CustomerID,

       CustomerName,

       /*�N����o��(�ڂ�����http://jehupc.exblog.jp/9075644/)*/

       --INT((INT(Format(DATE(),'yyyymmdd')) - INT(Customer.Birthday) )/ 10000) AS Age ,

       /*�O�񗘗p�����o�����₢���킹*/

       ( SELECT MAX(UseDate)

         FROM   [Kawauchi_DB].[dbo].[UseHistory] AS UseHistory2

         WHERE   UseHistory2.UseDate    < '20090310'

           /*���₢���킹�̊O�̃t�B�[���h�̒l�������ɗp����*/

           AND   UseHistory2.CustomerID = Customer.CustomerID

       ) AS LastUseDate

FROM  [Kawauchi_DB].[dbo].[UseHistory]

       INNER JOIN [Kawauchi_DB].[dbo].[Customer]

       ON     UseHistory.CustomerID = Customer.CustomerID

WHERE  UseHistory.UseDate           = '20090310'
