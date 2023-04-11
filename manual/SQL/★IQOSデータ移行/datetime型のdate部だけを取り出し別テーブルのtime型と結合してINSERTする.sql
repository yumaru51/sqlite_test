--datetimeŒ^‚Ìdate•”‚¾‚¯‚ðŽæ‚èo‚µ•Êƒe[ƒuƒ‹‚ÌtimeŒ^‚ÆŒ‹‡‚µ‚ÄINSERT‚·‚é
DECLARE @1 varchar(MAX) ,@2 varchar(MAX) ,@3 datetime2(0)


SET @1 = (SELECT [‘€‹Æ“ú] FROM [Kawauchi_DB].[dbo].[A_test2] WHERE [H’ö] = 'B')	-->datetimeŒ^‚Ìƒe[ƒuƒ‹‚©‚ç‘€‹Æ“ú‚ðŽæ‚é
SET @1 = Left(@1, 10)																-->YYYY/MM/DD‚Ì10Œ…
SET @2 = (SELECT [ŽžŠÔ] FROM [Kawauchi_DB].[dbo].[A_test3] WHERE [H’ö] = 'B')		-->timeŒ^‚Ìƒe[ƒuƒ‹‚©‚çŽžŠÔ‚ðŽæ‚é
SET @3 = @1 + ' ' + @2																-->YYYY/MM/DD TT:MM:SSSS ‚ÌŒ`Ž®‚É‚·‚é
PRINT @3

INSERT INTO [Kawauchi_DB].[dbo].[A_test2] ([‘€‹Æ“ú] ,[H’ö]) VALUES (@3 ,'B')		-->INSERT‚·‚é