package model;

import java.util.List;

public interface MemberHistDAO {
	public abstract List<Object[]> findAllFriendsHistByOne(Integer memberID_A,int page,int num);
	public abstract List<Object[]> findHistBySelf(Integer memberID_A,int page,int num);
}
