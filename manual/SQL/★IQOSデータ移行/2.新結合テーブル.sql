 SELECT 
        A.�r���[ID
      , A.����ID
      , A.�t�B�[���hNO
      , A.�t�B�[���h��
      , B.�f�[�^�^ID
      , B.�ėp�敪ID
      , B.���l
      , B.����
      , B.�f�[�^ID


/**************************************************************************
**	���C
**************************************************************************/	


      , CASE
	      WHEN �f�[�^�^ID IS NULL THEN NULL

/**************************************************************************
**	1:���l 
**************************************************************************/
          WHEN �f�[�^�^ID = 1 THEN CAST(B.���l as varchar)

/**************************************************************************
**	3:���� 14:�K�p���� 
**************************************************************************/
		  WHEN �f�[�^�^ID = 3 OR �f�[�^�^ID = 14 THEN CASE 
		                                                WHEN B.���� LIKE '%:%' THEN B.����
													    WHEN CAST(B.���� AS int) >= 2400 THEN CASE
														                                        WHEN (Len(CAST(CAST(B.���� AS int) - 2400 AS varchar)) = 4) THEN Left(CAST(CAST(B.���� AS int) - 2400 AS varchar), 2) + ':' + Right(CAST(CAST(B.���� AS int) - 2400 AS varchar), 2)
													                                            WHEN (Len(CAST(CAST(B.���� AS int) - 2400 AS varchar)) = 3) THEN Left('0' + CAST(CAST(B.���� AS int) - 2400 AS varchar), 2) + ':' + Right('0' + CAST(CAST(B.���� AS int) - 2400 AS varchar), 2)
					                                                                            WHEN (Len(CAST(CAST(B.���� AS int) - 2400 AS varchar)) = 2) THEN Left('00' + CAST(CAST(B.���� AS int) - 2400 AS varchar), 2) + ':' + Right('00' + CAST(CAST(B.���� AS int) - 2400 AS varchar), 2)
                                                                                                WHEN (Len(CAST(CAST(B.���� AS int) - 2400 AS varchar)) = 1) THEN Left('000' + CAST(CAST(B.���� AS int) - 2400 AS varchar), 2) + ':' + Right('000' + CAST(CAST(B.���� AS int) - 2400 AS varchar), 2)
													      								      END
													    WHEN CAST(B.���� AS int) < 2400 THEN CASE
																							   WHEN (Len(B.����) = 4) THEN Left(B.����, 2) + ':' + Right(B.����, 2)
													                                           WHEN (Len(B.����) = 3) THEN Left('0' + B.����, 2) + ':' + Right('0' + B.����, 2)
													    									   WHEN (Len(B.����) = 2) THEN Left('00' + B.����, 2) + ':' + Right('00' + B.����, 2)
													    									   WHEN (Len(B.����) = 1) THEN Left('000' + B.����, 2) + ':' + Right('000' + B.����, 2)
													     									 END
                                                        ELSE B.����
											          END
					
/**************************************************************************
**	7:�}�X�^
**************************************************************************/	
 		  WHEN �f�[�^�^ID = 7 THEN 
					  (SELECT 
						      �ėp����
						 FROM 
							  [mqcdb01arc_test].[dbo].TSTM�ėp
						WHERE 
							  �ėp�敪ID = B.�ėp�敪ID
						  AND  
							  �ėp�R�[�h = B.����)

/**************************************************************************
**	25:�ݔ�
**************************************************************************/	
		  WHEN �f�[�^�^ID = 25 THEN 
		                            (SELECT 
										    �ݔ���
									   FROM 
										    [mqcdb01arc_test].[dbo].TSTM�ݔ�
									  WHERE 
										    �ݔ�ID = B.����)

/**************************************************************************
**	33:�����敪
**************************************************************************/	
		  WHEN �f�[�^�^ID = 33 THEN 
		                            (SELECT 
									        �����敪��
									   FROM 
										    [mqcdb01arc_test].[dbo].TSTS�����敪
									  WHERE 
										    �����敪ID = B.����)

/**************************************************************************
**	6:�N���� 13:�K�p�N���� 
**************************************************************************/
		  WHEN �f�[�^�^ID = 6 OR �f�[�^�^ID = 13 THEN CASE
		                                                WHEN (SUBSTRING(Replace(B.����, ' ', ''), 5, 2) = 04
													      OR SUBSTRING(Replace(B.����, ' ', ''), 5, 2) = 06
													      OR SUBSTRING(Replace(B.����, ' ', ''), 5, 2) = 09
													      OR SUBSTRING(Replace(B.����, ' ', ''), 5, 2) = 11)
													     AND RIGHT(Replace(B.����, ' ', ''), 2) = 31
									                    THEN Left(CAST(CAST(Replace(B.����, ' ', '') AS int) - 1 AS varchar), 4) + '/' + SUBSTRING(CAST(CAST(Replace(B.����, ' ', '') AS int) - 1 AS varchar), 5, 2) + '/' + Right(CAST(CAST(Replace(B.����, ' ', '') AS int) - 1 AS varchar), 2)
						                                     
					                                    WHEN (SUBSTRING(Replace(B.����, ' ', ''), 5, 2) = 02
					                                     AND RIGHT(Replace(B.����, ' ', ''), 2) = 29)
                                                        THEN Left(CAST(CAST(Replace(B.����, ' ', '') AS int) - 1 AS varchar), 4) + '/' + SUBSTRING(CAST(CAST(Replace(B.����, ' ', '') AS int) - 1 AS varchar), 5, 2) + '/' + Right(CAST(CAST(Replace(B.����, ' ', '') AS int) - 1 AS varchar), 2)
                                                        
													    ELSE Left(B.����, 4) + '/' + SUBSTRING(B.����, 5, 2) + '/' + Right(B.����, 2)
													  END

/**************************************************************************
**	11:���t�H��
**************************************************************************/
		  WHEN �f�[�^�^ID = 11 THEN 
		                            (SELECT 
										    �H����
									   FROM  
										    [mqcdb01arc_test].[dbo].[TSTM�H��]
									  WHERE 
											�H��ID = B.����)

/**************************************************************************
**	19:�����ؑ�
**************************************************************************/	
		  WHEN �f�[�^�^ID = 19 THEN 
		                            (SELECT 
										    �V�X�e���R�[�h
									   FROM 
										    [mqcdb01arc_test].[dbo].[TSTS�����ؑ֋敪]
									  WHERE  
										    �����ؑ֋敪 = B.����)

/**************************************************************************
**	17:�z��
**************************************************************************/	
		  WHEN �f�[�^�^ID = 17 THEN 
		                            (SELECT 
										    �z�Ζ�
									   FROM  
										    [mqcdb01arc_test].[dbo].[TSTM�z��]
									  WHERE 
										    �z��ID = B.����)

/**************************************************************************
**	��L�ȊO�͕��������̂܂ܑ}��	NULL�͕�����ł͂Ȃ��̂ŕ����čl����@�L�q���Ȃ��Ă��f�t�H���gNULL�Ȃ̂ŕ��򂵂Ȃ�
**************************************************************************/	
		  ELSE B.����
	    END �l 
		

/**************************************************************************
**	���C
**************************************************************************/			
		
   --INTO �f�[�^�l_10		 
   FROM 
        (SELECT 
                �r���[ID
			  , ����ID
              , �t�B�[���h��
              , �t�B�[���hNO
           FROM 
                [pastdata_ingarc].[dbo].[TSTM�r���[����]
          WHERE 
                �r���[ID =  20055
				) A
           LEFT JOIN
	            (SELECT 
                        C.����ID
                      , D.�f�[�^�^ID
                      , D.�ėp�敪ID
                      , C.���l
                      , C.����
                      , C.�f�[�^ID
	               FROM 
	                    [mqcdb01arc_test].[dbo].[TSTD�e�[�u���f�[�^����]		C
                   LEFT JOIN
                        [mqcdb01arc_test].[dbo].[TSTM�e�[�u������]				D
                     ON 
                        C.����ID = D.����ID) B
                     ON 
					    A.����ID = B.����ID
				  WHERE �f�[�^ID = 752077
                  ORDER BY
                      A.�t�B�[���hNO, �f�[�^�^ID