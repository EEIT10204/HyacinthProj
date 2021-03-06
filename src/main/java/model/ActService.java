package model;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import config.SpringJavaConfiguration;
import model.dao.ACCommentDAOHibernate;

@Service
public class ActService {
	@Autowired
	private ActDAO actDAO;
	
	private ACCommentDAOHibernate aCCommentDAO;

	public List<ActBean> selectAll() {
		List<ActBean> result = null;
		result = actDAO.selectAll();
		return result;
		
	}

	public ActBean update() {
		
		return null;
	}

	public boolean delete(Integer memberID) {
		
		return false;
	}

	public List<ActBean> selectTopSix() {
		List<ActBean> result = null;
		result = actDAO.selectTopSix();
		return result;
	}
	
	public List<ActBean> Newset(){
		List<ActBean> result = null;
		result = actDAO.Newset();
		return result;
	}
	
	public Object[] fetchByMultiConditions(String keyword, String status, String sorting,int p,int num) {
		Object[] result = actDAO.findByMultiConditions(keyword, status, sorting, p, num);
		if((int)result[0]!=0) {
			return result;
		}
		return null;
	}
}
