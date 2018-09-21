package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ActBean;
import model.ActDAO;


@Repository
public class ActDAOHibernate implements ActDAO {

	
//Framework Object--------------------------	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//CRUD--------------------------	
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

}
