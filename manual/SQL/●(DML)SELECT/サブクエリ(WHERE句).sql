
--���������Ŗ��̐���̎Ј�ID, ����, �Z��CD, ��EID��\��
SELECT �Ј�ID, ����, �Z��CD, ��EID FROM [kawauchi_DB].[dbo].[�]�ƈ��f�[�^] AS �]�ƈ��f�[�^ INNER JOIN [kawauchi_DB].[dbo].[�Ј��}�X�^] AS �Ј��}�X�^ ON �]�ƈ��f�[�^.ID = �Ј��}�X�^.�Ј�ID
 WHERE �Ј��}�X�^.���� = '���'

--�T�u�N�G���g�p�Ŗ��̐���̏]�ƈ��f�[�^�\��
SELECT * FROM [kawauchi_DB].[dbo].[�]�ƈ��f�[�^] AS �]�ƈ��f�[�^
 WHERE �]�ƈ��f�[�^.ID = (SELECT [kawauchi_DB].[dbo].[�Ј��}�X�^].�Ј�ID FROM [kawauchi_DB].[dbo].[�Ј��}�X�^]
 WHERE [kawauchi_DB].[dbo].[�Ј��}�X�^].���� = '���')

--�T�u�N�G���g�p�Ŗ��̐���̎Ј�ID, ����, �Z��CD, ��EID��\��
 SELECT [kawauchi_DB].[dbo].[�Ј��}�X�^].�Ј�ID, [kawauchi_DB].[dbo].[�Ј��}�X�^].����, �]�ƈ��f�[�^.�Z��CD, �]�ƈ��f�[�^.��EID
  FROM [kawauchi_DB].[dbo].[�]�ƈ��f�[�^] AS �]�ƈ��f�[�^, [kawauchi_DB].[dbo].[�Ј��}�X�^]
 WHERE �]�ƈ��f�[�^.ID = (SELECT [kawauchi_DB].[dbo].[�Ј��}�X�^].�Ј�ID FROM [kawauchi_DB].[dbo].[�Ј��}�X�^]
 WHERE [kawauchi_DB].[dbo].[�Ј��}�X�^].���� = '���') and [kawauchi_DB].[dbo].[�Ј��}�X�^].�Ј�ID = �]�ƈ��f�[�^.ID

 /*
	�Ј�ID�Ɩ��͎̂Ј��}�X�^�A�Z��CD�Ɩ�EID�͏]�ƈ��f�[�^�Ȃ̂Ń����[�V�����ɂȂ�
	�����w���
	�@�]�ƈ��f�[�^.ID�� = ���̐���̎Ј�ID �̂Ƃ��݂̂̏]�ƈ��f�[�^��\�����T�u�N�G�����p
	�A�Ј��}�X�^.�Ј�ID = �]�ƈ��f�[�^.ID�̂Ƃ��݂̂̎Ј��}�X�^��\����and�ȍ~
	�����[�V�����ň����\�̐����������Ŏw�肵�Ȃ���΂����Ȃ�
	�]�ƈ��f�[�^�ɂ���AS�g�p���Ă�̂̓X���[��
  */
