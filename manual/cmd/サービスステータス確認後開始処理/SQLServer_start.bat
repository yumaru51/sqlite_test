
REM 起動チェックができていないのでNG

timeout 300
net start "SQL Server (SQLEXPRESS)"
timeout 60
net start "PI AF Application Service"
net start "PI Analysis Service"
net start "PI Notifications Service"
net start "PI SQL Data Access Server (OLE DB)"