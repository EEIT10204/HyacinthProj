package model.dao;

import java.sql.Timestamp;
import java.util.List;

<<<<<<< HEAD
import javax.persistence.Query;
=======
import javax.persistence.NoResultException;
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ActBean;
import model.ActDAO;
<<<<<<< HEAD

=======
import model.TripBean;
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
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
	
<<<<<<< HEAD
=======
	@Override
	public ActBean selectBymemberIDandcreateDate(ActBean bean) {
		System.out.println("DAO select by memberID and createDate access");
		try {
			ActBean temp = this.getSession().createQuery("from ActBean WHERE memberID = " + bean.getMemberID() + " and actCreateDate = '" + bean.getActCreateDate() + "'" ,ActBean.class).getSingleResult();
			return temp;
		} catch (NoResultException e) {
			return null;
			}
		}


	@Override
	public ActBean selectByPK(int ActSNum) {
		return this.getSession().get(ActBean.class, ActSNum);
	}

	@Override
	public List<ActBean> selectAll() {
		return this.getSession().createQuery("from ActBean",ActBean.class).list();		
	
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
	}

	@Override
	public ActBean insert(ActBean bean) {
		System.out.println("DAO insert access");
		if(bean != null) {
			this.getSession().save(bean);
		}
<<<<<<< HEAD
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
=======
		return bean;
	}
	
//	int memberID, int actSNum, String actID, byte[] actPhoto, String actTitle, String actCity,
//	String actintro, Timestamp actCreateDate, Timestamp actStartTime, Timestamp actEndTime,
//	Timestamp actJoinDeadLine, String actStatus, Integer minParticipants, Integer maxParticipants,
//	Integer participantsNow, Double budget, String payment, Integer actView, Integer actDuration,
//	Integer actVisibility
	@Override
	public ActBean update(ActBean bean) {
		System.out.println("DAO update access");
		if(bean != null) {
			this.getSession().update(bean);
		}
		return bean;
	}

	@Override
	public boolean deleteByPK(int ActSNum) {
		ActBean temp = this.getSession().get(ActBean.class, ActSNum);
		if(temp!=null) {
			this.getSession().delete(temp);
			
		}
		return false;
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
	}
}
