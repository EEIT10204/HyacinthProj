package model;

import java.util.List;

public interface ACCommentDAO {
	
	public abstract Object selectByACComentID(ACCommentBean bean);
	
	public abstract List<ACCommentBean> selectByActSNum(ACCommentBean bean);
	
	public abstract ACCommentBean insert(ACCommentBean bean);
	
	public abstract ACCommentBean update(ACCommentBean bean);
	
	public abstract ACCommentBean delete(ACCommentBean bean);

	public abstract Integer findCommentsNum(Integer actSNum);
	
	public abstract List<Object[]> findCommRows(Integer actSNum,int first, int num);
	
	public abstract ACCommentBean insertCommRow(ACCommentBean bean);
}
