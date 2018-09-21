package model;

import java.util.List;

public interface MemberActDAO {
	public abstract Object[] findFollowsAttenders(Integer actSNum);
	public abstract List<Object[]> findJoinedByOne(Integer memberID,String sorting,int p,int num);
	public abstract List<Object[]> findFollowedByOne(Integer memberID,String sorting,int p,int num);
}
