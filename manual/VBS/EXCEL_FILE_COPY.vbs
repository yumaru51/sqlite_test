
Set obj = WScript.CreateObject("Excel.Application") 
Set excel = obj.WorkBooks.Open("\\yfileserv\情報システム\USERS\川内\PIServer\EXCELファイル\YES確認(石炭ボイラー).xlsm") 
Set sheet = excel.WorkSheets.Item(1) 
sheet.Cells(1, 2) = "t" 
excel.Saveas("\\Yfileserv\情報システム\アプリ\PJ案件\01_生産品質管理ツール構築PJ\01_PIシステム\90_その他\90_TEST\test5.xlsm") 

obj.Quit()