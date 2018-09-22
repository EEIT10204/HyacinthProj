package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BGCommentBean;
import model.BGCommentDAO;
import model.MemberBean;

@Repository
public class BGCommentDAOHibernate implements BGCommentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public BGCommentBean selectByACComentID(BGCommentBean bean) {
//		System.out.println(((BGCommentBean)this.getSession().createQuery("from BGCommentBean WHERE ACCommentID LIKE '" + bean.getACCommentID() + "'").getSingleResult()).toString());
		return (BGCommentBean)this.getSession().createQuery("from BGCommentBean WHERE BGCommentID LIKE '" + bean.getBGCommentID() + "'").getSingleResult();	
	}

	@Override
	public List<BGCommentBean> selectByBlogSNum(BGCommentBean bean) {
		List<BGCommentBean> results = (List<BGCommentBean>)this.getSession().createQuery("from BGCommentBean WHERE blogSNum LIKE '" + bean.getBlogSNum() + "'").getResultList();
//		System.out.println("DAO selectbyActSNum: " + results.toString());
		return results;
	}

	@Override
	public BGCommentBean insert(BGCommentBean bean) {
		java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
		bean.setReplyTime(sqlTimestamp);
		bean.setCommentVisibility(1);
		this.getSession().save(bean);
		return bean;
	}

	@Override
	public BGCommentBean update(BGCommentBean bean) {
		java.sql.Timestamp sqlTimestamp = new java.sql.Timestamp(System.currentTimeMillis());
		BGCommentBean temp = this.getSession().get(BGCommentBean.class, bean.getBGCommentID());
		if(temp!=null) {
			temp.setCommentContent(bean.getCommentContent());
			temp.setReplyTime(sqlTimestamp);
			return temp;
		}
		return null;
	}

	@Override
	public BGCommentBean delete(BGCommentBean bean) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Object[]> selectBlogCommMemberJoin(Integer blogSNum) {
		System.out.println("DAO BGC before query");
		String sql = " select * from Blog_Comment as blogs left join Member as m on blogs.memberID = m.memberID where blogs.blogSNum = '"+blogSNum+ "' and commentVisibility = '1' order by blogs.replyTime Desc";
		Session session = getSession();
		Query<Object[]> query = session.createNativeQuery(sql)
				.addEntity("blogs", BGCommentBean.class)
				.addEntity("m", MemberBean.class);
		List<Object[]> results = query.list();
//		System.out.println("DAO BGC: " + results.size());
		return results;
	}
	
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
