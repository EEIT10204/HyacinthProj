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
import model.MemberHistDAO;

@Repository
public class MemberHistDAOHibernate implements MemberHistDAO {

	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			MemberHistDAO memberHistDAO = (MemberHistDAO) context.getBean("memberHistDAOHibernate");

//			List<Object[]> select = memberHistDAO.findAllFriendsHistByMemberID_A(1,1,3);
//			System.out.println("Total="+select.size());
//			for (Object[] objects : select) {
//				System.out.println("objects[0]="+((MemberHistBean)objects[0]).getMemberID());
//				System.out.println("objects[1]="+objects[1]);		
//				System.out.println("objects[2]="+objects[2]);		
//				System.out.println("objects[3]="+objects[3]);		
//			}
//			
			List<Object[]> select1 = memberHistDAO.findAllFriendsHistByOne(1,1,5);
			System.out.println("Total="+select1.size());
			for (Object[] objects : select1) {
				System.out.println("objects[0]="+objects[0]);
				System.out.println("objects[1]="+objects[1]);		
			}


			
			
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

	@Override
	public List<Object[]> findAllFriendsHistByOne(Integer memberID_A, int page, int num) {
		String subSql = "select a.memberID_B "
				+ "from MembershipBean as a left join MembershipBean as b on a.memberID_B=b.memberID_A "
				+ "where b.memberID_B=a.memberID_A AND a.memberID_A=:var1";
		
		String mainSql="select mhb,mb from MemberHistBean as mhb "+
				"join MemberBean as mb on mhb.memberID = mb.memberID "+ 
				"AND mhb.memberID in ("+subSql+") order by mhb.histTime desc"
				;

		Query<Object[]> query = this.getSession().createQuery(mainSql,Object[].class);
		query.setParameter("var1", memberID_A);
		int p=(page-1)*num;
		query.setFirstResult(p);//0 6 12 ... 
		query.setMaxResults(num);
		return query.list();
	}
	
	
	@Override
	public List<Object[]> findHistBySelf(Integer memberID_A, int page, int num) {		
		String mainSql="select mhb,mb from MemberHistBean as mhb "+
				"join MemberBean as mb on mhb.memberID = mb.memberID "+ 
				"AND mhb.memberID = :var1 order by mhb.histTime desc"
				;
		Query<Object[]> query = this.getSession().createQuery(mainSql,Object[].class);
		query.setParameter("var1", memberID_A);
		int p=(page-1)*num;
		query.setFirstResult(p);//0 6 12 ... 
		query.setMaxResults(num);
		return query.list();
	}

}
