Option Explicit

Dim objFileSys
Dim strCHKUserPath
Dim strScriptPath
Dim strDeleteFrom
Dim FileNum1
Dim FileNum2
Dim objFolder
Dim UserID
Dim objNetWork

	Set objNetWork = WScript.CreateObject("WScript.Network")
	UserID = objNetWork.UserName
	Set objNetWork = Nothing

	Set objFileSys = CreateObject("Scripting.FileSystemObject")

	strCHKUserPath="\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�ύX�Ǘ�\�v���g\��ƒʒm\" & UserID

	if objFileSys.FolderExists(strCHKUserPath) Then

		strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�ύX�Ǘ�\�v���g\��ƒʒm\" & UserID & "\�������"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum1 = objFolder.Files.Count

		strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�ύX�Ǘ�\�v���g\��ƒʒm\" & UserID & "\�������"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum2 = objFolder.Files.Count

		if(FileNum1>0 AND FileNum2>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�ύX�Ǘ��v���g ��ƌ��������ʒm"

		elseif(FileNum1=0 AND FileNum2>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�ύX�Ǘ��v���g ��ƌ��������ʒm"

		elseif(FileNum1>0 AND FileNum2=0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�ύX�Ǘ��v���g ��ƌ��������ʒm"

		end if

	end if
	
	strCHKUserPath="\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�ύX�Ǘ�\��ƒʒm\" & UserID

	if objFileSys.FolderExists(strCHKUserPath) Then

		strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�ύX�Ǘ�\��ƒʒm\" & UserID & "\�������"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum1 = objFolder.Files.Count

		strScriptPath = "\\Ydomnserv\common\����ԃt�H���_\�H���葱�ȑf��PJ\�ύX�Ǘ�\��ƒʒm\" & UserID & "\�������"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum2 = objFolder.Files.Count

		if(FileNum1>0 AND FileNum2>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�ύX�Ǘ��v���g ��ƌ��������ʒm"

		elseif(FileNum1=0 AND FileNum2>0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�����̍�Ƒ������� : " & FileNum2 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�ύX�Ǘ��v���g ��ƌ��������ʒm"

		elseif(FileNum1>0 AND FileNum2=0)then

			MsgBox Now & "���_��" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "�@�@�@�l�̍�Ƒ������� : " & FileNum1 &"��" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�@�ł��I�I" ,,"�ύX�Ǘ��v���g ��ƌ��������ʒm"

		end if

	end if

Set objFileSys = Nothing