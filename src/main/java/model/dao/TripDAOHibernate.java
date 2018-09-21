package model.dao;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.ActBean;
import model.TripBean;
import model.TripDAO;

@Repository
public class TripDAOHibernate implements TripDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public TripBean selectByPK(int ActSNum) {
		return this.getSession().get(TripBean.class, ActSNum);
	}

	@Override
	public TripBean select(TripBean bean) {
		System.out.println("DAO select by ActSNum access");
		try {
			TripBean temp = this.getSession().createQuery("from TripBean WHERE ActSNum LIKE '" + bean.getActSNum() + "'",TripBean.class).getSingleResult();
			return temp;
		} catch (NoResultException e) {
			return null;
		}

	}

	@Override
	public List<TripBean> selectAll() {
		return this.getSession().createQuery("from TripBean",TripBean.class).list();		
	}

	@Override
	public TripBean insert(TripBean bean) {
		System.out.println("DAO insert access");
		if(bean != null) {
			this.getSession().save(bean);
		}
		return bean;
	}

	@Override
	public TripBean update(TripBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public TripBean delete(int ActSNum) {
		TripBean temp = this.getSession().get(TripBean.class, ActSNum);
		if(temp!=null) {
			this.getSession().delete(temp);
			
		}
		return temp;
	}
	
	
	@Override
	public List<TripBean> select(int ActSNum) {
		return this.getSession().createQuery("from TripBean WHERE ActSNum =' " + ActSNum + " ' ",TripBean.class).list();	
	
	}

	
}



