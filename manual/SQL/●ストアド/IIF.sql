
-->iif ��������
 DECLARE @X	int = 5,@Y int = -7

 -->���̐��̎��l��\���A���̐��̎��l��0
 SELECT iif(@X>0, @X, 0) AS ���̐�, iif(@Y>0, @Y, 0) AS ���̐�
 -->���̐��̎��l��\���A���̐��̎��l��0
 SELECT iif(@X<0, @X, 0) AS ���̐�, iif(@Y<0, @Y, 0) AS ���̐�