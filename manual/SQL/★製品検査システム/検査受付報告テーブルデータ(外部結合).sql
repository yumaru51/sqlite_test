SELECT 
       A.�˗�NO
	 , B.���b�g
	 , C.���ږ� AS ��������
	 , D.���� AS �����l
	 , C.�P��
	 , C.�������@�敪
	 , E.�\�L AS �K�i
	 , F.�\�L AS ���ђl
	 , B.���l
  FROM 
       [mqcdb05].[dbo].[QCTD�˗�]				A
	 , [mqcdb05].[dbo].[QCTD�e�[�u���f�[�^]		B
	 , [mqcdb05].[dbo].[QCTD�˗�����]			G
	 , [mqcdb05].[dbo].[QCTM�e�[�u������]		C
	 , [mqcdb05].[dbo].[QCTD�e�[�u���f�[�^����]	D
  LEFT JOIN
	   [mqcdb05].[dbo].[QCTM�K�i]				E
	ON 
	   E.�K�i�敪 = 1								-->�K�i�敪 = 1�̂Ƃ��K�i
   AND D.����ID = E.����ID							-->�����l�ƋK�i��R�t����
  LEFT JOIN
	   [mqcdb05].[dbo].[QCTM�K�i]				F
    ON 
       F.�K�i�敪 = 2								-->�K�i�敪 = 2�̂Ƃ����ђl
   AND D.����ID = F.����ID							-->�����l�Ǝ��ђl��R�t����
 WHERE 
       A.�˗�NO = 1702491							-->�˗�NO��I��
   AND A.�˗�ID = B.�˗�ID							-->�u�˗��e�[�u���v���˗�ID���Q��
   AND A.�˗�ID = G.�˗�ID							-->�u�˗��e�[�u���v���˗�ID���Q��
   AND G.����ID = C.����ID							-->�˗�ID�ƌ������ڂ�R�t����
   AND B.�e�[�u��ID = C.�e�[�u��ID					-->�u�e�[�u���f�[�^�e�[�u���v���e�[�u��ID���Q��
   AND B.�f�[�^ID = D.�f�[�^ID						-->���b�g�ƌ����l��R�t����
   AND C.����ID = D.����ID							-->�������ڂƌ����l��R�t����
 ORDER BY D.�f�[�^ID ,B.���b�g, C.�D�揇��