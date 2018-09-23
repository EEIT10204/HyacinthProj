package model.dao;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.NoResultException;
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
	
	@Override    //H.C.Chen
	public ActBean findByPK(Integer actSNum) {
		return this.getSession().get(ActBean.class, actSNum);
	}
	
	@Override   //H.C.Chen
	public List<ActBean> findHostedByOne(Integer memberID,String sorting,int p,int num) {
		return this.getSession().createQuery("from ActBean where memberID=:var1 AND actVisibility=1 "
											+"order by "+sorting+" desc",ActBean.class)
								.setParameter("var1", memberID)
//								.setParameter("var2", sorting)
//								.setFirstResult((p-1)*num)
//								.setMaxResults(num)
								.list();
	}
	
	@Override
	public List<ActBean> findByMultiConditions(String keyword, String status, String sorting,int p,int num) {
		return this.getSession().createQuery(
				"from ActBean where (actTitle Like :var1 OR actCity Like :var1 OR actIntro Like :var1) "
				+"AND actStatus= :var2 "
				+"AND actVisibility=1 "
				+"order by "+sorting+" desc"
				,ActBean.class)
		.setParameter("var1","%"+keyword+"%")
		.setParameter("var2", status)
		.setFirstResult((p-1)*num) 
		.setMaxResults(num) 
		.list();
	}

	
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


}
