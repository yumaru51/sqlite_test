/******************************************************************************
**【名称】	
**【分類】	
**【説明】	
**【作成日】2017/6/01
**【作者】	川内
*******************************************************************************/
CREATE TRIGGER [dbo].[TRG_INS_T_WORKTIME]
ON [dbo].T_WORKTIME
AFTER INSERT AS
BEGIN


  SET NOCOUNT ON


  /*Idを追加 最大値から+1ずつしていく*/
  UPDATE T_WORKTIME
     SET T_WORKTIME.WORKTIMEID = (SELECT MAX(WORKTIMEID) FROM T_WORKTIME) + 1
   WHERE
         WORKTIMEID IS NULL			-->MotionBoardで未定値=NULL挿入なのでNULLで一致


  /*同じIdのやつは削除*/
  DELETE FROM T_WORKTIME WHERE T_WORKTIME.WORKTIMEID = (SELECT WORKTIMEID FROM INSERTED)


END