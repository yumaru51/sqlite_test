USE [データベース名]; -- データベース名を指定

SELECT 
    dp.name AS UserName,
    dp.type_desc AS UserType,
    dp.default_schema_name AS DefaultSchema,
    dp.authentication_type_desc AS AuthenticationType,
    dp.create_date AS CreateDate,
    dp.modify_date AS ModifyDate,
    --dp.state_desc AS State,
    dp2.name AS RoleName,
    dp2.type_desc AS RoleType,
    dp2.default_schema_name AS RoleDefaultSchema,
    dp3.permission_name AS PermissionName,
    dp3.state_desc AS PermissionState
FROM sys.database_principals dp
LEFT JOIN sys.database_role_members drm ON dp.principal_id = drm.member_principal_id
LEFT JOIN sys.database_principals dp2 ON drm.role_principal_id = dp2.principal_id
LEFT JOIN sys.database_permissions dp3 ON dp.principal_id = dp3.grantee_principal_id
WHERE dp.type IN ('S', 'U', 'G') -- S: SQLユーザー, U: Windowsユーザー, G: Windowsグループ
ORDER BY dp.name, dp2.name, dp3.permission_name;
