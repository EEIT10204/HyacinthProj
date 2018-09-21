package model;

import java.util.List;

public interface ACCommentDAO {
	
	public abstract Object selectByACComentID(ACCommentBean bean);
	
	public abstract List<ACCommentBean> selectByActSNum(ACCommentBean bean);
	
	public abstract ACCommentBean insert(ACCommentBean bean);
	
	public abstract ACCommentBean update(ACCommentBean bean);
	
	public abstract ACCommentBean delete(ACCommentBean bean);
}
