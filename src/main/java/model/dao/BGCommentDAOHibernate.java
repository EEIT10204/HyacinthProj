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
import model.BGCommentBean;
import model.BGCommentDAO;

@Repository
public class BGCommentDAOHibernate implements BGCommentDAO {
	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			BGCommentDAO blog_CommentDAO = (BGCommentDAO) context.getBean("BGCommentDAOHibernate");
			
//			Integer commentsNum = blog_CommentDAO.findCommentsNum(1);
//			System.out.println(commentsNum);
//			
//			List<Object[]> commRows = blog_CommentDAO.findCommRows(1,2,3);
//			System.out.println(commRows);
//			for (Object[] objects : commRows) {
//				System.out.println(objects[0]+"-"+objects[1]);
//			}
			
			BGCommentBean insertBean= new BGCommentBean();
			insertBean.setBlogSNum(3);
			insertBean.setMemberID(5);
			insertBean.setCommentContent("雅虎巨蛋放氣球");
			insertBean.setReplyTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			insertBean.setCommentVisibility(1);
			BGCommentBean insertResult = blog_CommentDAO.insertCommRow(insertBean);
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
	public Integer findCommentsNum(Integer blogSNum) {
		
		return this.getSession()
				.createQuery("select count(*) from BGCommentBean "+
											"where blogSNum=:var1 AND commentVisibility='1'",Long.class)
				.setParameter("var1", blogSNum)
				.uniqueResult()
				.intValue();  //預設回傳是Long,Long無法轉Integer但可以轉int;
	}

	@Override  //H.C.Chen
	public List<Object[]> findCommRows(Integer blogSNum,int first, int num) {
		return this.getSession()
				.createQuery("select bg,m from BGCommentBean as bg "+
							 "join MemberBean as m on bg.memberID=m.memberID "+ 
							 "AND bg.blogSNum=:var1 AND bg.commentVisibility='1' "+
							 "order by replyTime desc",Object[].class)
				.setParameter("var1", blogSNum)
				.setFirstResult(first)
				.setMaxResults(num)
				.list();
	}

	@Override  //H.C.Chen
	public BGCommentBean insertCommRow(BGCommentBean bean) {
		if(bean!=null) {
			bean.setReplyTime(new java.sql.Timestamp(new java.util.Date().getTime()));
			bean.setCommentVisibility(1);
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

}
