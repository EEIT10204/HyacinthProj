package model;

import java.util.List;

public interface MemberActDAO {
	public abstract Object[] findFollowsAttenders(Integer actSNum);
	public abstract List<Object[]> findJoinedByOne(Integer memberID,String sorting,int p,int num);
	public abstract List<Object[]> findFollowedByOne(Integer memberID,String sorting,int p,int num);
	public abstract MemberActBean insert(MemberActBean bean);
	public abstract MemberActBean update(MemberActBean bean);
	public abstract MemberActBean delete(int ActSNum);
	public abstract MemberActBean select(MemberActBean bean);
	public abstract MemberActBean selectBymemberID(int memberID);

}
