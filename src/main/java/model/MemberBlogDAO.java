package model;

import java.util.List;

public interface MemberBlogDAO {
	public abstract Object[] findSavesAVGScores(Integer blogSNum);
	public abstract List<Object[]> findSavedByOne(Integer memberID,String sorting,int p,int num);
}
