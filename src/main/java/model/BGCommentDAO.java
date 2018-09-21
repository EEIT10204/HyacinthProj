package model;

import java.util.List;

public interface BGCommentDAO {
	public abstract Integer findCommentsNum(Integer blogSNum);
	public abstract List<Object[]> findCommRows(Integer blogSNum,int page, int num);
	public abstract BGCommentBean insertCommRow(BGCommentBean bean);
}
