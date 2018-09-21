package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberBean;
import model.MembershipBean;
import model.MembershipDAO;

@Repository
public class MembershipDAOHibernate implements MembershipDAO {

	// Framework Object--------------------------
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override //已測試
	public Boolean checkSame(MembershipBean bean) {
		Query<MembershipBean> query=this.getSession().createQuery("from MembershipBean where memberID_A = :arg1 and memberID_B = :arg2",MembershipBean.class);
		query.setParameter("arg1", bean.getMemberID_A());
		query.setParameter("arg2", bean.getMemberID_B());
		if(query.uniqueResult()!=null) {
			return true;
		}else {
			return false;
		}
	}
	
	@Override //已測試
	public MembershipBean sendFriendRequest(MembershipBean bean) {	
		if(bean!=null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;

	}
	@Override //已測試
	public Boolean rejectFriendRequest(MembershipBean bean) {
		String hql = "DELETE FROM MembershipBean WHERE memberID_A = ?0 and memberID_B = ?1";
		Query<?> query = this.getSession().createQuery(hql);
		query.setParameter(0, bean.getMemberID_A());
		query.setParameter(1, bean.getMemberID_B());
		int result = query.executeUpdate();
		if (result != 0) {
			return true;
		}
		return false;
	}

	@Override //已測試
	public List<MemberBean> selectWhoIsMyFriend(Integer memberID_A) {
		String hql = "from MemberBean where memberID in(select a.memberID_B from MembershipBean as a Left JoiN MembershipBean as b on a.memberID_B=b.memberID_A where b.memberID_B=a.memberID_A and a.memberID_A=?0) order by memberID";
		Query<MemberBean> query = this.getSession().createQuery(hql,MemberBean.class);
		query.setParameter(0, memberID_A);
		System.out.println(query.list());
		return query.list();
	}


	@Override
	public Boolean accpetFriendRequest(MembershipBean bean) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

//	@Override
//	public List<Integer> whoAddMe(Integer memberID_A) {
//		String hql ="select memberID_A from MembershipBean where memberID_B = ?0";
//		Query<Integer> query = this.getSession().createQuery(hql,Integer.class);
//		query.setParameter(0, memberID_A);
//		return query.list();
//		return null;
//	}
//
//	@Override
//	public List<Integer> whoIadd(Integer memberID_A) {
//		String hql ="select memberID_A from MembershipBean where memberID_A = ?0";
//		Query<Integer> query = this.getSession().createQuery(hql,Integer.class);
//		query.setParameter(0, memberID_A);
//		return query.list();
//		return null;
//	}


	


	// CRUD--------------------------

}
