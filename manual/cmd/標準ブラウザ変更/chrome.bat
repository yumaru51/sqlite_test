@echo off
set username=app_admin
set password=support@

start C:\Users\y-kawauchi\Desktop\sendpassword.vbs %password%
start /wait runas /savecred /user:%username% "cmd /c ftype htmlfile=C:\Program Files\Google\Chrome\Application\chrome.exe"

