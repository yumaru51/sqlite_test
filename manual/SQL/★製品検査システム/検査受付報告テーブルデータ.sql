SELECT 
       A.�˗�NO
	 , B.���b�g
	 , D.���ږ� AS ��������
	 , E.���� AS �����l
	 , D.�P��
	 , D.�������@�敪
	 , (SELECT F.�\�L FROM [mqcdb05].[dbo].[QCTM�K�i] F WHERE �K�i�敪 = 1 AND E.����ID = F.����ID) �K�i
	 , (SELECT G.�\�L FROM [mqcdb05].[dbo].[QCTM�K�i] G WHERE �K�i�敪 = 2 AND E.����ID = G.����ID) ���ђl
	 , B.���l
  FROM 
       [mqcdb05].[dbo].[QCTD�˗�]				A
	 , [mqcdb05].[dbo].[QCTD�e�[�u���f�[�^]		B
	 , [mqcdb05].[dbo].[QCTD�˗�����]			C
	 , [mqcdb05].[dbo].[QCTM�e�[�u������]		D
	 , [mqcdb05].[dbo].[QCTD�e�[�u���f�[�^����]	E
 WHERE 
       A.�˗�NO = 1702491							-->�˗�NO��I��
   AND A.�˗�ID = B.�˗�ID							-->�u�˗��e�[�u���v���˗�ID���Q��
   AND A.�˗�ID = C.�˗�ID							-->�u�˗��e�[�u���v���˗�ID���Q��
   AND C.����ID = D.����ID							-->�˗�ID�ƌ������ڂ�R�t����
   AND B.�e�[�u��ID = D.�e�[�u��ID					-->�u�e�[�u���f�[�^�e�[�u���v���e�[�u��ID���Q��
   AND B.�f�[�^ID = E.�f�[�^ID						-->���b�g�ƌ����l��R�t����
   AND D.����ID = E.����ID							-->�������ڂƌ����l��R�t����
 ORDER BY E.�f�[�^ID ,B.���b�g, D.�D�揇��