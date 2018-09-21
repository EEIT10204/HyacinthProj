package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.MemberBean;
import model.MemberDAO;

@Repository
public class MemberDAOHibernate implements MemberDAO{

	
//Framework Object--------------------------	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//CRUD--------------------------
	@Override
	public List<MemberBean> selectAll() {
		return this.getSession().createQuery("from MemberBean", MemberBean.class).list();
	}

	@Override
	public MemberBean findByPK(Integer memberID) {
		return this.getSession().get(MemberBean.class, memberID);
	}
	
	@Override
	public MemberBean findByAccount(String memberAccount) {
		return this.getSession().createQuery("from MemberBean where memberAccount='"+memberAccount+"'", MemberBean.class).uniqueResult();
	}

	@Override
	public MemberBean insert(MemberBean bean) {
		if(bean!=null) {
			MemberBean temp = this.findByAccount(bean.getMemberAccount());
			System.out.println("DAO"+temp);
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public MemberBean update(MemberBean bean) {
		if(bean!=null) {
		   MemberBean temp =this.getSession().get(MemberBean.class,bean.getMemberID());
		   	if(temp!=null) {
		   		return (MemberBean) this.getSession().merge(bean);
		   	}
		}
		return null;
	}

	@Override
	public boolean delete(Integer memberID) {
		MemberBean temp = this.getSession().get(MemberBean.class, memberID);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

	@Override
	public MemberBean findByMail(String memberMail) {
		return this.getSession().createQuery("from MemberBean where memberMail='"+memberMail+"'", MemberBean.class).uniqueResult();
	}

}
