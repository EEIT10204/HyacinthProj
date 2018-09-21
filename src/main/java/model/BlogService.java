package model;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import config.SpringJavaConfiguration;

@Service
public class BlogService {
	@Autowired
	private BlogDAO blogDAO;
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	public BlogBean saveUpdate(BlogBean bean) {
//		BlogBean temp = blogDAO.select();
			if(bean.getBlogSNum()!=null) {
				return blogDAO.update(bean);
			}else {
				return blogDAO.insert(bean);
			}
			
		}
	
	
	
	public BlogBean insert(BlogBean bean) {
		
		BlogBean result=null;
		if(bean!=null) {
			blogDAO.insert(bean);
			return bean;
		}
		return result;
	}
	
	public BlogBean update(BlogBean bean) {
		BlogBean result=null;
		if(bean!=null) {
			blogDAO.update(bean);
			return bean;
		}
		return result;
		
	}
	
	
	public BlogBean updateDelete(Integer blogSNum) {
		BlogBean result=null;
		if(blogSNum!=null) {
			return blogDAO.updateDelete(blogSNum);
		}
		return result;
		
	}
	
	public boolean delete(Integer blogSNum) {
		boolean result = false;
		if(blogSNum!=null) {
			blogDAO.delete(blogSNum);
			return true;
		}
		return result;
	}
	
	public List<Object[]> selectByInput(String search, String page,int num, String newhot) {
	
			List<Object[]> bean1 = blogDAO.selectByInput(search,page,num,newhot);
			return bean1;
		
	}
	public List<Object[]> selectByBlogNewPage(Integer blogSNum) {
		if(blogSNum!=null) {
			List<Object[]> bean1 = blogDAO.selectByBlogNewPage(blogSNum);
			return bean1;
		}
		return null;
	}
	
	
	public List<BlogBean> selectByCityNav() {
			List<BlogBean> bean1 = blogDAO.selectByCityNav();
			return bean1;
	}
	
	
	public List<Object[]> selectByNationDate(String search,int page) {
		if(search!=null) {
			List<Object[]> bean1 = blogDAO.selectByNationDate(search,page);
			return bean1;
		}
		return null;
	}
	
	
	public List<Object[]> selectByNation(String search,int page) {
		if(search!=null) {
			List<Object[]> bean1 = blogDAO.selectByNation(search,page);
			return bean1;
		}
		return null;
	}
	
	
	public List<BlogBean> selectByDate(BlogBean bean) {
		if(bean!=null&&bean.getBlogCity()!=null) {
			List<BlogBean> bean1 = blogDAO.selectByDate(bean);
			return bean1;
		}
		return null;
	}
	
	public List<BlogBean> selectByCity(BlogBean bean,int page) {
		if(bean!=null&&bean.getBlogCity()!=null) {
			List<BlogBean> bean1 = blogDAO.selectByCity(bean,page);
			return bean1;
		}
		return null;
	}
	
	public BlogBean selectByPk(Integer blogSNum) {
		
			return blogDAO.select(blogSNum);
	
	}
	
	public BlogBean select(BlogBean bean) {
		if(bean!=null&&bean.getBlogSNum()!=0) {
			BlogBean bean1 = blogDAO.select(bean.getBlogSNum());
			return bean1;
		}
		return null;
	}
	
	public List<BlogBean> selectAll() {
			List<BlogBean> select = blogDAO.select();
			return select;
	}
	
	
	public BlogBean updateView(Integer blogSNum) {
		if(blogSNum!=null) {
			BlogBean bean1 = blogDAO.updateView(blogSNum);
			return bean1;
		}
		return null;
	}
	
	public BlogBean selectByBlogID(BlogBean bean) {
		
		BlogBean result = blogDAO.selectByBlogID(bean);
		return result;
	}
	
	public List<BlogBean> selectTopSix() {
		List<BlogBean> result = blogDAO.selectTopSix();
		return result;
	}
}
 













