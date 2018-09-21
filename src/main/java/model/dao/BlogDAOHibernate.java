package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.BlogBean;
import model.BlogDAO;

@Repository
public class BlogDAOHibernate implements BlogDAO{
	
	public static void main(String[] args) {
		
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			
			BlogDAO blogDAO = (BlogDAO) context.getBean("blogDAOHibernate");
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}	
	}
	
	
	
//Framework Object--------------------------	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
//CRUD--------------------------	
	@Override   //H.C.Chen
	public BlogBean findByPK(Integer blogSNum) {
		return this.getSession().get(BlogBean.class, blogSNum);
	}

	@Override  //H.C.Chen
	public List<BlogBean> findPostedByOne(Integer memberID,String sorting,int p,int num) {
		return this.getSession().createQuery("from BlogBean where memberID=:var1 AND blogVisibility=1 "
											+"order by "+sorting+" desc",BlogBean.class)
								.setParameter("var1", memberID)
//								.setParameter("var2", sorting)
//								.setFirstResult((p-1)*num)
//								.setMaxResults(num)
								.list();
	}

}
