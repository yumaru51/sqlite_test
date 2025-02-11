USE [データベース名]

--マッピングが不整合のあるユーザーの調べ方
EXEC sp_change_users_login 'Report'

--修正用クエリ
ALTER USER "mb-user" WITH LOGIN = "mb-user"


--修正用クエリ(後のバージョンにて使用できなくなる)
--EXEC sp_change_users_login 'Update_One', 'unisystem', 'unisystem'