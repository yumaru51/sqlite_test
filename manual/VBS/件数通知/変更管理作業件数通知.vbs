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

	strCHKUserPath="\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\変更管理\プロト\作業通知\" & UserID

	if objFileSys.FolderExists(strCHKUserPath) Then

		strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\変更管理\プロト\作業通知\" & UserID & "\自分作業"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum1 = objFolder.Files.Count

		strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\変更管理\プロト\作業通知\" & UserID & "\部下作業"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum2 = objFolder.Files.Count

		if(FileNum1>0 AND FileNum2>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"変更管理プロト 作業件数増加通知"

		elseif(FileNum1=0 AND FileNum2>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"変更管理プロト 作業件数増加通知"

		elseif(FileNum1>0 AND FileNum2=0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"変更管理プロト 作業件数増加通知"

		end if

	end if
	
	strCHKUserPath="\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\変更管理\作業通知\" & UserID

	if objFileSys.FolderExists(strCHKUserPath) Then

		strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\変更管理\作業通知\" & UserID & "\自分作業"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum1 = objFolder.Files.Count

		strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\変更管理\作業通知\" & UserID & "\部下作業"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum2 = objFolder.Files.Count

		if(FileNum1>0 AND FileNum2>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"変更管理プロト 作業件数増加通知"

		elseif(FileNum1=0 AND FileNum2>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"変更管理プロト 作業件数増加通知"

		elseif(FileNum1>0 AND FileNum2=0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"変更管理プロト 作業件数増加通知"

		end if

	end if

Set objFileSys = Nothing