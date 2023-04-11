
IF EXISTS(SELECT * 
          FROM   sys.columns 
          WHERE  NAME = N'ƒ—ñ–¼„'  
          AND    Object_ID = OBJECT_ID(N'ƒƒe[ƒuƒ‹–¼„')
	)
    --‘¶Ý‚µ‚½‚Æ‚«‚Ìˆ—
	SELECT '‘¶Ý‚µ‚½'
ELSE
    --‘¶Ý‚µ‚È‚¢‚Æ‚«‚Ìˆ—
	SELECT '‘¶Ý‚µ‚È‚¢'    
