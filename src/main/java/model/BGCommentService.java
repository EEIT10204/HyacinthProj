package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.BGCommentDAOHibernate;
import model.dao.ViewPointDAOHibernate;

@Service
public class BGCommentService {
	
	@Autowired
	private BGCommentDAOHibernate bGCommentDAO;
	
	public BGCommentBean selectByCommentID(BGCommentBean bean) {
		
		BGCommentBean result = bGCommentDAO.selectByACComentID(bean);
		return result;
	}
	
	public List<BGCommentBean> selectByBlogSNum(BGCommentBean bean){
		List<BGCommentBean> results = bGCommentDAO.selectByBlogSNum(bean);
		return results;
	}
	
	public BGCommentBean insert(BGCommentBean bean) {
		return bGCommentDAO.insert(bean);
	}
	
	public BGCommentBean update(BGCommentBean bean) {
		return bGCommentDAO.update(bean);
	}
	
	public List<Object[]> selectBlogCommMemberJoin(Integer blogSNum){
		List<Object[]> results = bGCommentDAO.selectBlogCommMemberJoin(blogSNum);		
		return results;
	}
}
