Option Explicit

Dim objFileSys
Dim strScriptPath
Dim strCHKUserPath
Dim strCHKDivFilePath
Dim strDeleteFrom
Dim FileNum1
Dim FileNum2
Dim FileNum3
Dim objFolder
Dim UserID
Dim objNetWork
Dim Div

	Set objNetWork = WScript.CreateObject("WScript.Network")
	UserID = objNetWork.UserName
	Set objNetWork = Nothing

	Set objFileSys = CreateObject("Scripting.FileSystemObject")

	strCHKUserPath="\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID

	if objFileSys.FolderExists(strCHKUserPath) Then

		strCHKDivFilePath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������\FACTOP.txt"

		if(objFileSys.FileExists(strCHKDivFilePath))then

			Div="FACTOP"

		else

			strCHKDivFilePath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������\KA.txt"

			if(objFileSys.FileExists(strCHKDivFilePath))then

				Div="KA"

			else	

				strCHKDivFilePath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������\A.txt"

				if(objFileSys.FileExists(strCHKDivFilePath))then

					Div="A"

				else

					strCHKDivFilePath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������\SOUMU.txt"

					if(objFileSys.FileExists(strCHKDivFilePath))then

						Div="SOUMU"

					else

						strCHKDivFilePath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������\GYOKAN.txt"

						if(objFileSys.FileExists(strCHKDivFilePath))then

							Div="GYOKAN"

						else

							strCHKDivFilePath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������\FIN.txt"

							if(objFileSys.FileExists(strCHKDivFilePath))then

								Div="FIN"

							else

								Div="Nor"

							end if

						end if

					end if

				end if
		
			end if

		end if

		strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum1 = objFolder.Files.Count

		strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\" & UserID & "\�������"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum2 = objFolder.Files.Count

		if(Div="KA")then

			strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\user812\�������"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="A")then

			strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\user813\�������"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="SOUMU")then

			strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\user814\�������"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="GYOKAN")then

			strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\user815\�������"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="FIN")then

			strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\user821\�������"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

'		elseif(Div="FACTOP")then
'
'			strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�H�����Ǘ��V�X�e��\��ƒʒm\user777\�������"
'
'			Set objFolder = objFileSys.GetFolder(strScriptPath)
'
'			FileNum3 = objFolder.Files.Count
'
		else

			FileNum3 =0

		end if

		if(FileNum1>0 AND FileNum2>0 AND FileNum3>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) &  "�@�@�@���Ǖ����̍�Ƒ������� : " & FileNum3 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		elseif(FileNum1>0 AND FileNum2>0 AND FileNum3=0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		elseif(FileNum1=0 AND FileNum2>0 AND FileNum3>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) &  "�@�@�@���Ǖ����̍�Ƒ������� : " & FileNum3 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		elseif(FileNum1>0 AND FileNum2=0 AND FileNum3>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) &  "�@�@�@���Ǖ����̍�Ƒ������� : " & FileNum3 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		elseif(FileNum1>0 AND FileNum2=0 AND FileNum3=0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		elseif(FileNum1=0 AND FileNum2>0 AND FileNum3=0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		elseif(FileNum1=0 AND FileNum2=0 AND FileNum3>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@���Ǖ����̍�Ƒ������� : " & FileNum3 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�H���葱�c�[���v���g ��ƌ��������ʒm"

		end if

	end if

Set objFileSys = Nothing