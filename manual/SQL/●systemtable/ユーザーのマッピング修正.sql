USE [�f�[�^�x�[�X��]

--�}�b�s���O���s�����̂��郆�[�U�[�̒��ו�
EXEC sp_change_users_login 'Report'

--�C���p�N�G��
ALTER USER "mb-user" WITH LOGIN = "mb-user"


--�C���p�N�G��(��̃o�[�W�����ɂĎg�p�ł��Ȃ��Ȃ�)
--EXEC sp_change_users_login 'Update_One', 'unisystem', 'unisystem'