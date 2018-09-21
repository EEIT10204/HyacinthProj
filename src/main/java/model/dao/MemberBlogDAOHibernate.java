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
import model.MemberBlogBean;
import model.MemberBlogDAO;

@Repository
public class MemberBlogDAOHibernate implements MemberBlogDAO {
	
	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			MemberBlogDAO memberBlogDAO = (MemberBlogDAO) context.getBean("memberBlogDAOHibernate");
//			Object[] commentsNum = memberBlogDAO.findSavesAVGScores(2);
//			System.out.println("Saves="+commentsNum[0]+",AVGScores="+commentsNum[1]);

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
	public Object[] findSavesAVGScores(Integer blogSNum) {
//		Object[] objArray = new Object[2];
		Object[] objArray= this.getSession()
				.createQuery("select sum(CAST(isLike as int)),AVG(score) from MemberBlogBean " 
							+ "where blogSNum=:var1",Object[].class)
				.setParameter("var1", blogSNum)
				.uniqueResult();

		//在此判斷Service會錯，原因未知
//		System.out.println("objArray="+objArray[0]+","+objArray[1]);
//		if(objArray[0]==null) {
//			objArray[0]=0;
//		}
//		System.out.println("objArray="+objArray[0]+","+objArray[1]);
		return objArray;
	}
	
	@Override  //H.C.Chen
	public List<Object[]> findSavedByOne(Integer memberID,String sorting,int p,int num) {
		return this.getSession().createQuery(
				"select mb,b,m from MemberBlogBean as mb "
				+"join BlogBean as b on mb.blogSNum = b.blogSNum AND mb.memberID=:var1 AND mb.isLike=1 AND b.blogVisibility=1 "					
				+"join MemberBean as m on m.memberID=b.memberID "
				+"order by b."+sorting, Object[].class)
				.setParameter("var1", memberID)
//				.setFirstResult((p-1)*num)
//				.setMaxResults(num)
				.list();
	}



}
