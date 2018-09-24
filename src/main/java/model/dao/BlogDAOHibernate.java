package model.dao;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.BlogBean;
import model.BlogDAO;
@Repository
public class BlogDAOHibernate implements BlogDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	@Override
	public List<BlogBean> selectByCityNav() {
		 String nav[] = {"台北","台中","台南","高雄","東京","大阪","沖繩","北海道","首爾","釜山","大邱","濟州島","紐約","洛杉磯","舊金山","邁阿密","柏林","漢堡","慕尼黑","法蘭克福"}; 
		 ArrayList<BlogBean> list = new ArrayList<BlogBean>();
		 
		 for(int i=0;i<20;i++) {
			 String hql = "select * from blog where blogCity='"+nav[i]+"' AND blogVisibility = 1 order by blogView";
	         NativeQuery<BlogBean> query = this.getSession().createNativeQuery(hql, BlogBean.class);
	         query.setFirstResult(0);
			 query.setMaxResults(1);
			 list.addAll(query.getResultList());
		 }
		
		return list;
		 
	}
	
	
	@Override
	public List<Object[]> selectByInput(String search, String page,int num ,String newhot) {
		String hql = "Select b,c,m from BlogBean as b "+
			 	  "join CityBean as c on b.blogCity = c.cityName "+
			 	  "join MemberBean as m on b.memberID = m.memberID ";
		
		//判斷search
		if("".equals(search)) {
			search="台灣";
		}
		if(search!=null) {
			hql = hql+"where (nation = :var1 OR blogCity=:var1 OR memberName like :var2 OR blogTitle like :var2  OR blogCover like :var2 )and blogVisibility=1 ";
		}
		else if(search==null) {
			hql = hql+"where blogVisibility=1 ";
		}
		//判斷page   int i = (page-1)*6;
		int i;
		if("".equals(page)||page==null) {
			i = 0;
		}else {
			i = (Integer.parseInt(page)-1)*6;
		}	
		//判斷newhot
		if("".equals(newhot) || "hot".equals(newhot) ||  newhot==null) {
			hql = hql + "order by b.blogView Desc";
		}
		else {
			hql = hql + "order by b.updateTime Desc";
		}
		
		 Query<Object[]> query = this.getSession().createQuery(hql,Object[].class);
		 if(search!=null) {
			 query.setParameter("var1", search); 
			 query.setParameter("var2", "%"+search+"%"); 
		 }

		 query.setFirstResult(i);
		 query.setMaxResults(num);
		 
		 if(!query.list().isEmpty()) {
			 return query.list();
		 }
		
		return null;
	}
	
//	String hql = "Select b,c,m from BlogBean as b "+
//		 	  "join CityBean as c on b.blogCity = c.cityName "+
//		 	  "join MemberBean as m on b.memberID = m.memberID "+
//		 	  "where blogSNum=:var1 ";
	@Override
	public List<Object[]> selectByBlogNewPage(Integer blogSNum) {
		this.updateView(blogSNum);
		String hql = "Select b,c,m from BlogBean as b "+
			 	  "join CityBean as c on b.blogCity = c.cityName "+
			 	  "join MemberBean as m on b.memberID = m.memberID "+
			 	  "where blogVisibility=1 and blogSNum=:var1 ";
		 
		 Query<Object[]> query = this.getSession().createQuery(hql,Object[].class);
		 query.setParameter("var1", blogSNum); 

		 if(!query.list().isEmpty()) {
			 return query.list();
		 }
		 return null;
	}
	
	
	
	@Override
	public List<Object[]> selectByNation(String search,int page) {
		 String hql = "Select b,c,m from BlogBean as b "+
			 	  "join CityBean as c on b.blogCity = c.cityName "+
			 	  "join MemberBean as m on b.memberID = m.memberID "+
			 	  "where blogVisibility=1 and (nation = :var1 OR blogCity=:var1  OR blogTitle like :var2  OR blogCover like :var2 )"+
			 	  "order by b.blogView Desc";
		 
		 Query<Object[]> query = this.getSession().createQuery(hql,Object[].class);
		 query.setParameter("var1", search); 
		 query.setParameter("var2", "%"+search+"%"); 
		 
		 int i = (page-1)*6;
		 query.setFirstResult(i);
		 query.setMaxResults(6);
		 
		 if(!query.list().isEmpty()) {
			 return query.list();
		 }
		 return null;
	}
	
	@Override
	public List<Object[]> selectByNationDate(String search,int page) {
		String hql ="Select  b,c,m  from BlogBean as b join CityBean as c on b.blogCity = c.cityName join MemberBean as m on b.memberID = m.memberID where blogVisibility=1 and (nation = :var1 OR blogCity = :var1 OR blogTitle like :var1 OR blogCover like :var1 )order by b.blogReleaseTime Desc";
         Query<Object[]> query = this.getSession().createQuery(hql,Object[].class);
		 query.setParameter("var1", search);
		 
		 int i = (page-1)*6;
		 query.setFirstResult(i);
		 query.setMaxResults(4);
		 
		 if(!query.list().isEmpty()) {
			 return query.list();
		 }
		 return null;
	}
	
	@Override
	public List<BlogBean> selectByDate(BlogBean bean) {
		
         Query<BlogBean> query = this.getSession().createQuery("from BlogBean where blogVisibility=1 and BlogCity LIKE ?0 order by blogReleaseTime  DESC", BlogBean.class);
		 query.setParameter(0, bean.getBlogCity());
		 query.setFirstResult(0);
		 query.setMaxResults(4);	 
		 if(!query.list().isEmpty()) {
			 return query.list();
		 }
		 return null;
	}
	
	
	@Override
	public List<BlogBean> selectByCity(BlogBean bean,int page) {
		
         Query<BlogBean> query = this.getSession().createQuery("from BlogBean where blogVisibility=1 and BlogCity LIKE ?0 order by blogView  DESC", BlogBean.class);
		 query.setParameter(0, bean.getBlogCity());
		 
		 int i = (page-1)*6;
		 query.setFirstResult(i);
		 query.setMaxResults(6);
		 
		 if(!query.list().isEmpty()) {
			 return query.list();
		 }
		 return null;
	}

	@Override
	public BlogBean select(Integer blogSNum) {
		
		return this.getSession().get(BlogBean.class, blogSNum);
	}
	
	@Override
	public BlogBean updateView(Integer blogSNum) {
		BlogBean view = this.getSession().get(BlogBean.class, blogSNum);
		view.setBlogView(view.getBlogView()+1);
		this.getSession().save(view);
		return view;
	}
	
	@Override
	public BlogBean insert(BlogBean bean) {
		if(bean!=null) {
//			Integer id = bean.getBlogSNum();
//			BlogBean temp = this.getSession().get(BlogBean.class, id);
//			if(temp==null) {
				this.getSession().save(bean);
				return bean;
//			}
		}
		return null;
	}
	
	
	
	@Override
	public BlogBean updateDelete(Integer blogSNum) {
		BlogBean update = this.getSession().get(BlogBean.class,blogSNum);
		if(update!=null) {
			update.setBlogVisibility(0);
			return update;
		}
		return null;
	}
	

	@Override
	public BlogBean update(BlogBean bean) {
		BlogBean update = this.getSession().get(BlogBean.class, bean.getBlogSNum());
		if(update!=null) {
			update.setBlogCity(bean.getBlogCity());
			update.setBlogContext(bean.getBlogContext());
			update.setBlogCover(bean.getBlogCover());
			update.setUpdateTime(bean.getUpdateTime());
			update.setBlogTitle(bean.getBlogTitle());
			update.setBlogVisibility(1);
			return update;
		}
		return null;
	}

	@Override
	public boolean delete(Integer blogSNum) {
		BlogBean delete = this.getSession().get(BlogBean.class, blogSNum);
		if(delete!=null) {
			this.getSession().delete(delete);
			return true;
		}
		return false;
	}

	@Override
	public List<BlogBean> select() {
		
		return this.getSession().createQuery("from BlogBean", BlogBean.class).list();
	}
	
	@Override
	public BlogBean selectByBlogID(BlogBean bean) {
		Query qry = this.getSession().createQuery("from BlogBean WHERE blogID LIKE :blogID");
		qry.setParameter("blogID", bean.getBlogID());
		return (BlogBean)qry.getSingleResult();
	}
	
	@Override
	public List<BlogBean> selectTopSix() {
		String HQL = "from BlogBean as b WHERE blogVisibility = 1 order by b.blogView desc";
		Query query = this.getSession().createQuery(HQL);
		query.setMaxResults(6);
		return query.list();
		
	}
	@Override   //H.C.Chen
	public BlogBean findByPK(Integer blogSNum) {
		return this.getSession().get(BlogBean.class, blogSNum);
	}

	@Override  //H.C.Chen
	public List<BlogBean> findPostedByOne(Integer memberID,String sorting,int p,int num) {
		return this.getSession().createQuery("from BlogBean where memberID=:var1 AND blogVisibility=1 "
											+"order by "+sorting+" desc",BlogBean.class)
								.setParameter("var1", memberID)
//								.setParameter("var2", sorting)
//								.setFirstResult((p-1)*num)
//								.setMaxResults(num)
								.list();
	}
	

}
