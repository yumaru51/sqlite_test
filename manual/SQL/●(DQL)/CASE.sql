-->CASE ðªò
 DECLARE @X	varchar(50) = 'j',@Y varchar(50) = ''
 
-->PCASE®
SELECT
CASE @X
    WHEN 'j' THEN 1
    WHEN '' THEN 2
    ELSE 99
END 

-->õCASE®
SELECT
CASE
    WHEN @X = 'j' THEN 1
    WHEN @X = '' THEN 2
    ELSE 99
END 
