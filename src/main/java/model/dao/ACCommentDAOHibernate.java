package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.ACCommentBean;
import model.ACCommentDAO;
import model.ViewPointBean;

@Repository
public class ACCommentDAOHibernate implements ACCommentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public ACCommentBean selectByACComentID(ACCommentBean bean) {
//		System.out.println(((ACCommentBean)this.getSession().createQuery("from ACCommentBean WHERE ACCommentID LIKE '" + bean.getACCommentID() + "'").getSingleResult()).toString());
		return (ACCommentBean)this.getSession().createQuery("from ACCommentBean WHERE ACCommentID LIKE '" + bean.getACCommentID() + "'").getSingleResult();	
	}

	@Override
	public List<ACCommentBean> selectByActSNum(ACCommentBean bean) {
		List<ACCommentBean> results = (List<ACCommentBean>)this.getSession().createQuery("from ACCommentBean WHERE actSNum LIKE '" + bean.getActSNum() + "'").getResultList();
// select * from Act_Comment as ACC left join Member as M on ACC.memberID = M.memberID where ACC.ACCommentID LIKE 'ACC00005'
		//		System.out.println("DAO selectbyActSNum: " + results.toString());
		return results;
	}

	@Override
	public ACCommentBean insert(ACCommentBean bean) {
		this.getSession().save(bean);
		return bean;
	}

	@Override
	public ACCommentBean update(ACCommentBean bean) {
		this.getSession().saveOrUpdate(bean);
		return bean;
	}

	@Override
	public ACCommentBean delete(ACCommentBean bean) {
		// TODO Auto-generated method stub
		return null;
	}

}
