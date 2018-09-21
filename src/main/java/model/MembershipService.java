package model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MembershipService {

	@Autowired
	private MembershipDAO membershipDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	public MembershipBean sendFriendRequest(MembershipBean bean) {
		Boolean temp = membershipDAO.checkSame(bean);
		if (temp == false) {
			System.out.println("成功送出交友邀請");
			return membershipDAO.sendFriendRequest(bean);
		} else {
			System.out.println("送出交友邀請失敗,原因:已送過");
			return null;
		} 

	}

	public String rejectFriendRequest(MembershipBean bean) {
		Integer reverse1 = bean.getMemberID_A();
		Integer reverse2 = bean.getMemberID_B();
		bean.setMemberID_A(reverse2);
		bean.setMemberID_B(reverse1);
		System.out.println("reverseBean: "+bean);
		Boolean temp = membershipDAO.checkSame(bean);
		System.out.println("ServiceBean: "+temp);
		if (temp ==true) {
			membershipDAO.rejectFriendRequest(bean);
			System.out.println("成功拒絕好友邀請");
			return "成功拒絕好友邀請";
		}else {
			System.out.println("無邀請可拒絕");
			return "無邀請可拒絕";
		}
	}
	public List<MemberBean> friendList(Integer memberID_A){
		List<MemberBean> list = membershipDAO.selectWhoIsMyFriend(memberID_A);
		System.out.println("好友BEAN:"+list);
		return list;
		
	}
	public String deleteFriend(MembershipBean bean) {
		Boolean tmp1 = membershipDAO.rejectFriendRequest(bean);
		Integer reverse1 = bean.getMemberID_A();
		Integer reverse2 = bean.getMemberID_B();
		bean.setMemberID_A(reverse2);
		bean.setMemberID_B(reverse1);
		Boolean tmp2 = membershipDAO.rejectFriendRequest(bean);
		if(tmp1==true && tmp2==true) {
			return "刪除好友成功";
		}else {
			return "你們還不是好友哦";
		}
		
		
	}

}
