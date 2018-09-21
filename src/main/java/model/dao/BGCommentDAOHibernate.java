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
		this.getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public BGCommentBean delete(BGCommentBean bean) {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public List<Object[]> selectBlogCommMemberJoin(Integer blogSNum) {
		System.out.println("DAO BGC before query");
		String sql = " select * from Blog_Comment as blogs left join Member as m on blogs.memberID = m.memberID where blogs.blogSNum = '"+blogSNum+ "'order by blogs.replyTime Desc";
		Session session = getSession();
		Query<Object[]> query = session.createNativeQuery(sql)
				.addEntity("blogs", BGCommentBean.class)
				.addEntity("m", MemberBean.class);
		List<Object[]> results = query.list();
//		System.out.println("DAO BGC: " + results.size());
		return results;
	}

}
