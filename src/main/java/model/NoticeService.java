package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class NoticeService {
	
	@Autowired
	private NoticeDAO noticeDAO;
	
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public NoticeBean insertNotice(NoticeBean bean) {
		return noticeDAO.insertNotice(bean);
	}
	public Boolean updateNotice(Integer noticeID) {
		Boolean result = noticeDAO.updateReadStatus(noticeID);
		if(result) {
			return true;
		}else {
		return false;
		}
	}
	public List<NoticeBean> selectMyNotice(Integer memberID){
		return noticeDAO.selectByMemberReceiver(memberID);	
	}

}
