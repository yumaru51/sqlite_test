
SELECT MAX(�Z���̌���) AS AVG_Detail --�ォ�痘�p����FROM��ł́u�Z���̌����v���g���Ă���AMAX����Ȃ���AVG�Ȃǂ̏W�v�֐����g���Ă݂�Ƃ킩��₷��
FROM
 (SELECT [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^].�Z��CD, COUNT(*) AS �Z���̌���
  FROM [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^]
  GROUP BY [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^].�Z��CD
  ) AS �G�C���A�X���K�v

  /*
  ��x�������s���ē�����e�[�u�����m�F�I�I
  SELECT [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^].�Z��CD, COUNT(*) AS �Z���̌���
  FROM [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^]
  GROUP BY [Kawauchi_DB].[dbo].[�]�ƈ��f�[�^].�Z��CD
  ���̌�A���̃e�[�u������K�v�E���p�ł���ȃf�[�^���l����Ƃ킩��₷��
  
  �Z��CD���̌����e�[�u������ő�l���o�͂���v���O����
  */
