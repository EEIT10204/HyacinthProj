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
	
	@Override  //H.C.Chen
	public List<Object[]> findWhoSaved(Integer blogSNum) {
		return this.getSession().createQuery(
				"select m.memberID,m.memberName,m.memberPic,mb.blogSNum from MemberBlogBean as mb "
				+"join MemberBean as m on m.memberID=mb.memberID AND mb.blogSNum=:var1 AND mb.isLike=1" 
				, Object[].class)
				.setParameter("var1", blogSNum)
				.list();
	}
	
	//selectScore--------------------------
		@Override
		public Double selectScore(Integer memberID, Integer blogSNum) {
			return this.getSession()
					.createQuery("select score from MemberBlogBean " 
								+ "where ((memberID=:var1) AND (blogSNum=:var2))",Double.class)
					.setParameter("var1", memberID)
					.setParameter("var2", blogSNum)
					.uniqueResult();
		}
		
		//updatelikepoint--------------------------
				@Override
				public MemberBlogBean updateScore(Integer memberID,Integer blogSNum,Double score) {
					
					MemberBlogBean update = this.selectPK(memberID,blogSNum);
					if(update!=null) {
						update.setScore(score);
						return update;
					}
					if(update==null) {
						return insert(memberID,blogSNum,0,score);
						
					}
					
					return null;
				}
		
		
		
		//insert----------------------------------------------------------
		@Override
		public MemberBlogBean insert(Integer memberID, Integer blogSNum, int like,Double score) {
			MemberBlogBean memberBlogBean = new MemberBlogBean();
			boolean islike;
			if(like==0) {
				islike=true;
			}else {
				islike=false;
			}
//			memberBlogBean.setScore(4.0);//要刪掉
			memberBlogBean.setScore(score);
			memberBlogBean.setIsLike(islike);
			memberBlogBean.setMemberID(memberID);
			memberBlogBean.setBlogSNum(blogSNum);
			this.getSession().save(memberBlogBean);
			
			return memberBlogBean;
		}
		
		//updatelikepoint--------------------------
			@Override
			public MemberBlogBean updateLike(Integer memberID,Integer blogSNum,int like) {
				
				MemberBlogBean update = this.selectPK(memberID,blogSNum);
				if(update!=null&&like==1) {
					update.setIsLike(false);
//					return (MemberBlogBean) this.getSession().merge(update);
					return update;
				}
				if(update!=null&&like==0) {
					update.setIsLike(true);
//					return (MemberBlogBean) this.getSession().merge(update);
					return update;
				}
				if(update==null) {
					return insert(memberID,blogSNum,like,null);
				}
				
				return null;
			}
		
		//likepoint--------------------------
			@Override
			public Boolean selectLike(Integer memberID,Integer blogSNum) {
				return this.getSession()
						.createQuery("select isLike from MemberBlogBean " 
									+ "where ((memberID=:var1) AND (blogSNum=:var2))",Boolean.class)
						.setParameter("var1", memberID)
						.setParameter("var2", blogSNum)
						.uniqueResult();
			}
			
			//-------------------PK
			@Override
			public MemberBlogBean selectPK(Integer memberID, Integer blogSNum) {
				return this.getSession()
						.createQuery("from MemberBlogBean " 
									+ "where ((memberID=:var1) AND (blogSNum=:var2))",MemberBlogBean.class)
						.setParameter("var1", memberID)
						.setParameter("var2", blogSNum)
						.uniqueResult();
			}



}
