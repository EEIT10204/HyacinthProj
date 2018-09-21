package model.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ActBean;
import model.ActDAO;

@Repository
public class ActDAOHibernate implements ActDAO {
	

	@Autowired
	private SessionFactory sessionFactory;

	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}

	@Override
	public ActBean selectByPK(int ActSNum) {
		return this.getSession().get(ActBean.class, ActSNum);
	}

	@Override
	public List<ActBean> selectAll() {
		return this.getSession().createQuery("from ActBean",ActBean.class).list();		
	
	}

	@Override
	public ActBean insert(ActBean bean) {
		System.out.println("DAO insert access");
		if(bean != null) {
			this.getSession().save(bean);
		}
		return null;
	}
	
	@Override
	public ActBean update(ActBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteByPK(int ActSNum) {
		ActBean temp = this.getSession().get(ActBean.class, ActSNum);
		if(temp!=null) {
			this.getSession().delete(temp);			
		}
		return false;
	}

	@Override
	public ActBean selectByActID(ActBean bean) {
		Query hqy = this.getSession().createQuery("from ActBean WHERE actID Like '" + bean.getActID() + "'");
		return (ActBean)hqy.getSingleResult();
	}

	@Override
	public List<ActBean> selectTopSix() {
		String HQL = "from ActBean as c order by c.actView desc";
		Session session = getSession();
		Query query = session.createQuery(HQL);
		query.setMaxResults(6);
		return query.getResultList();
	}
	
	@Override
	public List<ActBean> Newset() {
		String HQL = "from ActBean as d order by d.actCreateDate asc";
		Session session = getSession();
		Query query = session.createQuery(HQL);
		query.setMaxResults(6);
		return query.getResultList();
	}
}
