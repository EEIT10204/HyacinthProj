package model;

public  interface MemberActDAO {
	
	public abstract MemberActBean insert(MemberActBean bean);

	public abstract MemberActBean update(MemberActBean bean);

	public abstract MemberActBean delete(int ActSNum);
	
	public abstract MemberActBean select(MemberActBean bean);
	
	public abstract MemberActBean selectBymemberID(int memberID);

}
