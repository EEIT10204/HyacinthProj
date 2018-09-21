package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.BGCommentBean;
import model.BGCommentDAO;

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

}
