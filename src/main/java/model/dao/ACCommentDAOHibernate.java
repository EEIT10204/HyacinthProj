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
import model.ACCommentBean;
import model.ACCommentDAO;

@Repository
public class ACCommentDAOHibernate implements ACCommentDAO {

	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			ACCommentDAO act_CommentDAO = (ACCommentDAO) context.getBean("ACCommentDAOHibernate");
			
//			Integer commentsNum = act_CommentDAO.findCommentsNum(1);
//			System.out.println(commentsNum);
//			
//			List<Object[]> commRows = act_CommentDAO.findCommRows(1,3,2);
//			for (Object[] objects : commRows) {
//				System.out.println(objects[0]+"-"+objects[1]);
//			}

			ACCommentBean insertBean= new ACCommentBean();
			insertBean.setActSNum(2);
			insertBean.setMemberID(5);
			insertBean.setCommentContent("這個也很不錯");
			insertBean.setReplyTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			insertBean.setCommentVisibility(1);
			ACCommentBean insertResult = act_CommentDAO.insertCommRow(insertBean);
			System.out.println("insertResult="+insertResult);
			
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
	public Integer findCommentsNum(Integer actSNum) {  
		return this.getSession()
				.createQuery("select count(*) from ACCommentBean "+
											"where actSNum=:var1 AND commentVisibility='1'",Long.class)
				.setParameter("var1", actSNum)
				.uniqueResult()
				.intValue();  //預設回傳是Long,Long無法轉Integer但可以轉int;
	}

	@Override  //H.C.Chen
	public List<Object[]> findCommRows(Integer actSNum,int first, int num) {
		return this.getSession()
				.createQuery("select ac,m from ACCommentBean as ac  "+
							 "join MemberBean as m on ac.memberID=m.memberID "+ 
							 "AND ac.actSNum=:var1 AND ac.commentVisibility='1' "+
							 "order by replyTime desc",Object[].class)
				.setParameter("var1", actSNum)
				.setFirstResult(first)
				.setMaxResults(num)
				.list();
	}

	@Override  //H.C.Chen
	public ACCommentBean insertCommRow(ACCommentBean bean) {
		if(bean!=null) {
			bean.setReplyTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			bean.setCommentVisibility(1);
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

}
