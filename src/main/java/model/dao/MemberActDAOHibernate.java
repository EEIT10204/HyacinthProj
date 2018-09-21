package model.dao;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ActBean;
import model.MemberActBean;
import model.MemberActDAO;
import model.TripBean;
@Repository
public class MemberActDAOHibernate implements MemberActDAO {
	
	@Autowired 
	private SessionFactory sessionFactory;

	
	public Session getSession() {
		return sessionFactory.getCurrentSession(); 
	} 

	@Override
	public MemberActBean insert(MemberActBean bean) {
		System.out.println("DAO insert access");
		if(bean != null) {
			this.getSession().save(bean);
		}
		return bean;
	}

	@Override
	public MemberActBean update(MemberActBean bean) {
		System.out.println("DAO update access");
		if(bean != null) {
			this.getSession().update(bean);
		}
		return bean;
	}

	@Override
	public MemberActBean delete(int ActSNum) {
		MemberActBean temp = this.getSession().get(MemberActBean.class, ActSNum);
		if(temp!=null) {
			this.getSession().delete(temp);
			
		}
		return temp;
	} 
	@Override
	public MemberActBean select(MemberActBean bean) {
		System.out.println("DAO select by ActSNum and MemberID access");
		try {
			MemberActBean temp = this.getSession().createQuery("from MemberActBean WHERE memberID = " + bean.getMemberID() + " and actSNum = " + bean.getActSNum() ,MemberActBean.class).getSingleResult();
			System.out.println("temp=" +temp.toString());
			return temp;
			
		} catch (NoResultException e) {
			return null;
		}

	}
	@Override
	public MemberActBean selectBymemberID(int memberID) {
		return this.getSession().get(MemberActBean.class, memberID);
		 
	} 

}
