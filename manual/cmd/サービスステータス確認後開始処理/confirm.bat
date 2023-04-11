REM サービスステータス確認後開始処理

REM "SQL Server (SQLEXPRESS)"
set SERVICE_NAME=MSSQL$SQLEXPRESS
:LOOP1
FOR /f "tokens=1,2,3,4,5 USEBACKQ DELIMS=	 " %%A IN (`sc query "%SERVICE_NAME%" ^| findstr -i state`) DO (
    if "%%A"=="STATE" if "%%D"=="STOPPED" echo %date% %time% %SERVICE_NAME%_START >>C:\Users\piadmin\Desktop\confirm.txt & timeout 300 & sc start "%SERVICE_NAME%" & GOTO LOOP1
    if "%%A"=="STATE" if "%%D"=="RUNNING" echo %date% %time% %SERVICE_NAME%_OK >>C:\Users\piadmin\Desktop\confirm.txt & GOTO END1
)
:END1

REM "PI AF Application Service"
set SERVICE_NAME=AFService
:LOOP2
FOR /f "tokens=1,2,3,4,5 USEBACKQ DELIMS=	 " %%A IN (`sc query "%SERVICE_NAME%" ^| findstr -i state`) DO (
    if "%%A"=="STATE" if "%%D"=="STOPPED" echo %date% %time% %SERVICE_NAME%_START >>C:\Users\piadmin\Desktop\confirm.txt & timeout 60 & sc start "%SERVICE_NAME%" & GOTO LOOP2
    if "%%A"=="STATE" if "%%D"=="RUNNING" echo %date% %time% %SERVICE_NAME%_OK >>C:\Users\piadmin\Desktop\confirm.txt & GOTO END2
)
:END2

REM "PI Analysis Service"
set SERVICE_NAME=PIAnalysisManager
:LOOP3
FOR /f "tokens=1,2,3,4,5 USEBACKQ DELIMS=	 " %%A IN (`sc query "%SERVICE_NAME%" ^| findstr -i state`) DO (
    if "%%A"=="STATE" if "%%D"=="STOPPED" echo %date% %time% %SERVICE_NAME%_START >>C:\Users\piadmin\Desktop\confirm.txt & timeout 60 & sc start "%SERVICE_NAME%" & GOTO LOOP3
    if "%%A"=="STATE" if "%%D"=="RUNNING" echo %date% %time% %SERVICE_NAME%_OK >>C:\Users\piadmin\Desktop\confirm.txt & GOTO END3
)
:END3

REM "PI Notifications Service"
set SERVICE_NAME=PINotificationsService
:LOOP4
FOR /f "tokens=1,2,3,4,5 USEBACKQ DELIMS=	 " %%A IN (`sc query "%SERVICE_NAME%" ^| findstr -i state`) DO (
    if "%%A"=="STATE" if "%%D"=="STOPPED" echo %date% %time% %SERVICE_NAME%_START >>C:\Users\piadmin\Desktop\confirm.txt & timeout 60 & sc start "%SERVICE_NAME%" & GOTO LOOP4
    if "%%A"=="STATE" if "%%D"=="RUNNING" echo %date% %time% %SERVICE_NAME%_OK >>C:\Users\piadmin\Desktop\confirm.txt & GOTO END4
)
:END4

REM "PI SQL Data Access Server (OLE DB)"
set SERVICE_NAME=PISqlDas
:LOOP5
FOR /f "tokens=1,2,3,4,5 USEBACKQ DELIMS=	 " %%A IN (`sc query "%SERVICE_NAME%" ^| findstr -i state`) DO (
    if "%%A"=="STATE" if "%%D"=="STOPPED" echo %date% %time% %SERVICE_NAME%_START >>C:\Users\piadmin\Desktop\confirm.txt & timeout 60 & sc start "%SERVICE_NAME%" & GOTO LOOP5
    if "%%A"=="STATE" if "%%D"=="RUNNING" echo %date% %time% %SERVICE_NAME%_OK >>C:\Users\piadmin\Desktop\confirm.txt & GOTO END5
)
:END5
