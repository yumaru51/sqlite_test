@echo off
set username2=app_admin
set password=support@

start "" "C:\Users\%USERNAME%\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup\sendpassword.vbs" %password%
start /wait runas /savecred /user:%username2% "cmd /c ftype htmlfile=C:\Program Files\Google\Chrome\Application\chrome.exe"