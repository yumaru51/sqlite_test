

  sp_rename       "?test"      ,"test"

  sp_rename        "test        .?test",    "test"    , 'COLUMN'

  SELECT * FROM    "test"

                       1             2
                       2             1            2
                       2