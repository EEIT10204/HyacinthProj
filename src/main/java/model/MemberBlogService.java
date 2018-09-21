package model;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class MemberBlogService {
	@Autowired
	private MemberBlogDAO memberBlogDAO;
	@Autowired
	private SessionFactory sessionFactory;
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	public Boolean selectLike(Integer memberID,Integer blogSNum) {
		if(memberID!=null&&blogSNum!=null) {
			  Boolean bean = memberBlogDAO.selectLike(memberID,blogSNum);
			return bean;
		}
		return null;
	}
	
	
	public MemberBlogBean updateLike(Integer memberID,Integer blogSNum,int like) {
		if(memberID!=null&&blogSNum!=null) {
			MemberBlogBean bean = memberBlogDAO.updateLike(memberID, blogSNum, like);
			return bean;
		}
		return null;
	}
	
	public MemberBlogBean updateupdateScoreike(Integer memberID,Integer blogSNum,Double score) {
		if(memberID!=null&&blogSNum!=null&&score!=null) {
			MemberBlogBean bean = memberBlogDAO.updateScore(memberID, blogSNum, score);
			return bean;
		}
		return null;
	}
	
	public Double selectScore(Integer memberID,Integer blogSNum) {
		if(memberID!=null&&blogSNum!=null) {
			Double bean = memberBlogDAO.selectScore(memberID, blogSNum);
			return bean;
		}
		return null;
	}
	
	public Object[] findSavesAVGScores(Integer blogSNum) {
		if(blogSNum!=null) {
			Object[] bean = memberBlogDAO.findSavesAVGScores(blogSNum);
			if(bean[0]==null) {
				bean[0]=0;
			}
			
			System.out.println("bean = "+bean);
			return bean;
		}
		return null;
		
	}
}
