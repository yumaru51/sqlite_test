
-->SELECT�������ʂ̃e�[�u�����N���G�C�g(�Ⴄ�f�[�^�x�[�X�Ԃ̃e�[�u�����\)
SELECT
  B.[�r���[��],
  A.[����],
  A.[�����敪],
  A.[�r���[ID]
INTO
  [OP_ENTRY_INORG].[dbo].[M_����]
FROM
  [YSQLSERV5].[mqcdb01].[dbo].[TSTM�r���[����] A
LEFT JOIN
  [YSQLSERV5].[mqcdb01].[dbo].[TSTM�r���[] B
ON
  A.�r���[ID = B.�r���[ID
