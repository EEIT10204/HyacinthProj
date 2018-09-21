package model;

import java.util.List;

public interface MembershipDAO {
	public abstract Boolean checkSame(MembershipBean bean);
	public abstract MembershipBean sendFriendRequest(MembershipBean bean);
	public abstract Boolean rejectFriendRequest(MembershipBean bean);
	public abstract List<MemberBean> selectWhoIsMyFriend(Integer memberID_A);
	
	
	public abstract Boolean accpetFriendRequest(MembershipBean bean);
	
}
