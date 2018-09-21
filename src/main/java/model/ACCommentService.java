package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.ACCommentDAOHibernate;
import model.dao.ViewPointDAOHibernate;

@Service
public class ACCommentService {
	
	@Autowired
	private ACCommentDAOHibernate aCCommentDAO;
	
	public ACCommentBean selectByCommentID(ACCommentBean bean) {
		ACCommentBean result = aCCommentDAO.selectByACComentID(bean);
		System.out.println("ACC service join member: " + result.toString());
		 
		return result;
	}
	
	public List<ACCommentBean> selectByActID(ACCommentBean bean){
		List<ACCommentBean> results = aCCommentDAO.selectByActSNum(bean);
		return results;
	}
	
	public ACCommentBean insert(ACCommentBean bean) {
		aCCommentDAO.insert(bean);
		return bean;
	}
	
	public ACCommentBean update(ACCommentBean bean) {
		aCCommentDAO.update(bean);
		return bean;
	}
}
