
/***セキュリティグループコード***
app_common
batch_user
genexus_user
ISK\SO001_F
ISK\SO001_R
ISK\SO004_R
ISK\SO004_W
ISK\SO019_F
ISK\SO025_W
ISK\SY003_W
ISK\SY024_W
ISK\SY026_W
ISK\SY027_W
ISK\SY028_W
ISK\SY029_W
ISK\SY030_W
ISK\SY031_W
ISK\SY032_W
ISK\SY033_W
ISK\SY058_W
ISK\SY064_W
web_user
****/

DECLARE @DB1 NVARCHAR(50) = 'SapR3'
DECLARE @USER1 NVARCHAR(50) = 'ISK\m-takamori'
DECLARE @DB2 NVARCHAR(50) = 'SapR3_honbanikou'
DECLARE @USER2 NVARCHAR(50) = 'ISK\m-takamori'

EXEC('USE ' + @DB1 + 
--USE SapR3_honbanikou; -- データベース名を指定
'
SELECT 
    dp.name AS UserName,
    dp2.name AS RoleName,
    dp.type_desc AS UserType,
    dp.default_schema_name AS DefaultSchema,
    dp.create_date AS CreateDate,
    dp.modify_date AS ModifyDate,
    dp2.type_desc AS RoleType
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals dp2 ON drm.role_principal_id = dp2.principal_id
LEFT JOIN sys.database_permissions dp3 ON dp.principal_id = dp3.grantee_principal_id
WHERE dp.type IN (''S'', ''U'', ''G'') -- S: SQLユーザー, U: Windowsユーザー, G: Windowsグループ
AND dp.name  = ''' + @USER1 + ''' -- セキュリティグループコードを指定
ORDER BY dp.name, dp2.name, dp3.permission_name;
')

EXEC('USE ' + @DB2 + 
--USE SapR3_honbanikou; -- データベース名を指定
'
SELECT 
    dp.name AS UserName,
    dp2.name AS RoleName,
    dp.type_desc AS UserType,
    dp.default_schema_name AS DefaultSchema,
    dp.create_date AS CreateDate,
    dp.modify_date AS ModifyDate,
    dp2.type_desc AS RoleType
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals dp2 ON drm.role_principal_id = dp2.principal_id
LEFT JOIN sys.database_permissions dp3 ON dp.principal_id = dp3.grantee_principal_id
WHERE dp.type IN (''S'', ''U'', ''G'') -- S: SQLユーザー, U: Windowsユーザー, G: Windowsグループ
AND dp.name  = ''' + @USER2 + ''' -- セキュリティグループコードを指定
ORDER BY dp.name, dp2.name, dp3.permission_name;
')
