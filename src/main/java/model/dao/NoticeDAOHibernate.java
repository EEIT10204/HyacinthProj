package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import model.NoticeBean;
import model.NoticeDAO;
@Repository
public class NoticeDAOHibernate implements NoticeDAO {
	
	//Framework Object--------------------------	
		@Autowired
		private SessionFactory sessionFactory;
		
		public Session getSession() {
			return sessionFactory.getCurrentSession();
		}
		
	//CRUD--------------------------

	@Override
	public List<NoticeBean> selectByMemberReceiver(Integer memberID) {
		Query<NoticeBean> query=this.getSession().createQuery("from NoticeBean where memberID_Receiver = :arg1 and isRead=0" ,NoticeBean.class);
		query.setParameter("arg1", memberID);
		return query.list();
	}
	

	@Override
	public Boolean updateReadStatus(Integer noticeID) {
		NoticeBean noticeBean = this.getSession().get(NoticeBean.class, noticeID);
		if(noticeBean!=null) {
		noticeBean.setIsRead(true);
		return true;
		}else {
		return false ;
		}
	}

	@Override
	public NoticeBean insertNotice(NoticeBean bean) {
		if(bean!=null) {
			this.getSession().save(bean);
			return bean;
		}
		return null;
	}

}
