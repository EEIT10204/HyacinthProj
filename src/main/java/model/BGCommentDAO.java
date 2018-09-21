package model;

import java.util.List;

public interface BGCommentDAO {
	
	public abstract BGCommentBean selectByACComentID(BGCommentBean bean);
	
	public abstract List<BGCommentBean> selectByBlogSNum(BGCommentBean bean);
	
	public abstract BGCommentBean insert(BGCommentBean bean);
	
	public abstract BGCommentBean update(BGCommentBean bean);
	
	public abstract BGCommentBean delete(BGCommentBean bean);
}
