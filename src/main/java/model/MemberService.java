package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public MemberBean login(String memberAccount,String memberPwd) {
		MemberBean bean = memberDAO.findByAccount(memberAccount);
		if(bean!=null && memberPwd.length()!=0) {
			if(bean.getMemberPwd().equals(memberPwd)) {
				return bean;
			}
		}
		return null;
	}
	
	public MemberBean register(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.insert(bean);
			System.out.println("Service"+result);
		}
		return result;
	}
	
	public MemberBean updateProfile(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.update(bean);
		}
		return result;
	}
	public List<MemberBean> searchFriendList(Integer memberID) {
		return this.getSession().createQuery(
				"from ProductBean", MemberBean.class).list();
	}

}
