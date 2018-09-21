package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.MemberActDAO;

@Repository
public class MemberActDAOHibernate implements MemberActDAO {

	
	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			MemberActDAO memberActDAO = (MemberActDAO) context.getBean("memberActDAOHibernate");
			Object[] commentsNum = memberActDAO.findFollowsAttenders(1);
			System.out.println("Follows="+commentsNum[0]+",Attenders="+commentsNum[1]);
			
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
	@Override  //H.C.Chen
	public Object[] findFollowsAttenders(Integer actSNum) {// CONVERT無法執行，所以用CAST。另外INT必須為小寫才能執行
//		Object[] objArray = new Object[2];
		Object[] objArray = this.getSession()
				.createQuery("select sum(CAST(isLike as int)),sum(CAST(isAttend as int)) from MemberActBean " 
							+ "where actSNum=:var1",Object[].class)
				.setParameter("var1", actSNum)
				.uniqueResult();
//		if(objArray[0]==null) { objArray[0]=0; }
//		if(objArray[1]==null) { objArray[1]=0; }
		return objArray;
	}
	
	@Override  //H.C.Chen
	public List<Object[]> findJoinedByOne(Integer memberID,String sorting,int p,int num) {
		return this.getSession().createQuery(
				"select ma,a,m from MemberActBean as ma "
				+"join ActBean as a on ma.actSNum = a.actSNum AND ma.memberID=:var1 AND ma.isAttend=1 AND a.actVisibility=1 "					
				+"join MemberBean as m on m.memberID=a.memberID "
				+"order by a."+sorting, Object[].class)
				.setParameter("var1", memberID)
//				.setFirstResult((p-1)*num)
//				.setMaxResults(num)
				.list();
	}
	
	@Override  //H.C.Chen
	public List<Object[]> findFollowedByOne(Integer memberID,String sorting,int p,int num) {
		return this.getSession().createQuery(
				"select ma,a,m from MemberActBean as ma "
				+"join ActBean as a on ma.actSNum = a.actSNum AND ma.memberID=:var1 AND ma.isLike=1 AND a.actVisibility=1 "					
				+"join MemberBean as m on m.memberID=a.memberID "
				+"order by a."+sorting, Object[].class)
				.setParameter("var1", memberID)
//				.setFirstResult((p-1)*num)
//				.setMaxResults(num)
				.list();
	}

}
