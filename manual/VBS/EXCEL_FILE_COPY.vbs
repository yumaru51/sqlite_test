
Set obj = WScript.CreateObject("Excel.Application") 
Set excel = obj.WorkBooks.Open("\\yfileserv\���V�X�e��\USERS\���\PIServer\EXCEL�t�@�C��\YES�m�F(�ΒY�{�C���[).xlsm") 
Set sheet = excel.WorkSheets.Item(1) 
sheet.Cells(1, 2) = "t" 
excel.Saveas("\\Yfileserv\���V�X�e��\�A�v��\PJ�Č�\01_���Y�i���Ǘ��c�[���\�zPJ\01_PI�V�X�e��\90_���̑�\90_TEST\test5.xlsm") 

obj.Quit()