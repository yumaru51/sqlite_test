REM �T�[�r�X�X�e�[�^�X�m�F��J�n����

@echo off

set SERVICE_NAME=MSSQL$SQLEXPRESS
if not "%1"=="" set SERVICE_NAME=%1

FOR /f "tokens=1,2,3,4,5 USEBACKQ DELIMS=	 " %%A IN (`sc query "%SERVICE_NAME%" ^| findstr -i state`) DO (
REM  if "%%A"=="STATE" if "%%D"=="RUNNING" sc stop  "%SERVICE_NAME%" & GOTO END
 if "%%A"=="STATE" if "%%D"=="STOPPED" sc start "%SERVICE_NAME%" & GOTO END
)

REM :WARN
REM echo ������H
REM pause

REM :END