package model;

import java.util.List;

public interface ACCommentDAO {
	public abstract Integer findCommentsNum(Integer actSNum);
	public abstract List<Object[]> findCommRows(Integer actSNum,int first, int num);
	public abstract ACCommentBean insertCommRow(ACCommentBean bean);
}
