
/*TRY...CATCH 構造の確認*/
BEGIN TRY
    SELECT 1/0
END TRY
BEGIN CATCH
    THROW
END CATCH


/*
TRY...CATCH 構造の影響を受けないエラー
　・重大度が 10 以下の警告または情報メッセージ。
　・重大度が 20 以上で、そのセッションの SQL Server データベース エンジン タスク処理を終了させるエラー。
　　重大度が 20 以上のエラーが発生し、データベース接続が切断されない場合、TRY...CATCH によってエラーが処理されます。
　・クライアントの割り込み要求や中断されたクライアント接続などのアテンション。
　・システム管理者による KILL ステートメントを使用したセッションの終了。
https://docs.microsoft.com/ja-jp/sql/t-sql/language-elements/try-catch-transact-sql?view=sql-server-ver15
*/

BEGIN TRY  
    -- Table does not exist; object name resolution  
    -- error not caught.  
    SELECT * FROM NonexistentTable;  
END TRY  
BEGIN CATCH  
    SELECT   
        ERROR_NUMBER() AS ErrorNumber  
       ,ERROR_MESSAGE() AS ErrorMessage;  
END CATCH  
