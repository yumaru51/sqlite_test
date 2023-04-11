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

	strCHKUserPath="\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID

	if objFileSys.FolderExists(strCHKUserPath) Then

		strCHKDivFilePath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部署情報\FACTOP.txt"

		if(objFileSys.FileExists(strCHKDivFilePath))then

			Div="FACTOP"

		else

			strCHKDivFilePath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部署情報\KA.txt"

			if(objFileSys.FileExists(strCHKDivFilePath))then

				Div="KA"

			else	

				strCHKDivFilePath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部署情報\A.txt"

				if(objFileSys.FileExists(strCHKDivFilePath))then

					Div="A"

				else

					strCHKDivFilePath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部署情報\SOUMU.txt"

					if(objFileSys.FileExists(strCHKDivFilePath))then

						Div="SOUMU"

					else

						strCHKDivFilePath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部署情報\GYOKAN.txt"

						if(objFileSys.FileExists(strCHKDivFilePath))then

							Div="GYOKAN"

						else

							strCHKDivFilePath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部署情報\FIN.txt"

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

		strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\自分作業"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum1 = objFolder.Files.Count

		strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\" & UserID & "\部下作業"

		Set objFolder = objFileSys.GetFolder(strScriptPath)

		FileNum2 = objFolder.Files.Count

		if(Div="KA")then

			strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\user812\自分作業"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="A")then

			strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\user813\自分作業"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="SOUMU")then

			strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\user814\自分作業"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="GYOKAN")then

			strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\user815\自分作業"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

		elseif(Div="FIN")then

			strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\user821\自分作業"

			Set objFolder = objFileSys.GetFolder(strScriptPath)

			FileNum3 = objFolder.Files.Count

'		elseif(Div="FACTOP")then
'
'			strScriptPath = "\\Ydomnserv\common\部門間フォルダ\工事手続簡素化PJ\工事情報管理システム\作業通知\user777\自分作業"
'
'			Set objFolder = objFileSys.GetFolder(strScriptPath)
'
'			FileNum3 = objFolder.Files.Count
'
		else

			FileNum3 =0

		end if

		if(FileNum1>0 AND FileNum2>0 AND FileNum3>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) &  "　　　所管部署の作業増加件数 : " & FileNum3 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		elseif(FileNum1>0 AND FileNum2>0 AND FileNum3=0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		elseif(FileNum1=0 AND FileNum2>0 AND FileNum3>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) &  "　　　所管部署の作業増加件数 : " & FileNum3 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		elseif(FileNum1>0 AND FileNum2=0 AND FileNum3>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) &  "　　　所管部署の作業増加件数 : " & FileNum3 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		elseif(FileNum1>0 AND FileNum2=0 AND FileNum3=0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　個人の作業増加件数 : " & FileNum1 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		elseif(FileNum1=0 AND FileNum2>0 AND FileNum3=0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　部下の作業増加件数 : " & FileNum2 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		elseif(FileNum1=0 AND FileNum2=0 AND FileNum3>0)then

			MsgBox Now & "時点で" & Chr(13) & Chr(10) & "" & Chr(13) & Chr(10) & "　　　所管部署の作業増加件数 : " & FileNum3 &"件" & Chr(13) & Chr(10) & ""  & Chr(13) & Chr(10) & "　　　　　　　　　　　　　　　　　　　　　　　　です！！" ,,"工事手続ツールプロト 作業件数増加通知"

		end if

	end if

Set objFileSys = Nothing