package model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.persistence.NoResultException;
import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.ViewPointBean;
import model.ViewPointDAO;

@Repository
public class ViewPointDAOHibernate implements ViewPointDAO {

	public static void main(String[] args) {
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
		sessionFactory.getCurrentSession().beginTransaction();
		
		ViewPointDAO vDAO = (ViewPointDAO)context.getBean("viewPointDAOHibernate");

		ViewPointBean vBean1 = new ViewPointBean();
		
//		vBean1 = vDAO.select(1);
//		List<ViewPointBean> vBean2 = vDAO.select();
		//----- Insert Test----
		ViewPointBean vBean3 = new ViewPointBean();
		
		vBean3.setViewPointName("test name");
		vBean3.setViewPointAddress("test address");
		vBean3.setViewPointType("food");
		vBean3.setViewPointInfo("test info");
		
		vDAO.insert(vBean3);
		
		System.out.println("single select: " + vBean1.toString());
//		System.out.println("select all: " + vBean2.size());
		
	}
	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	@Override
	public List<ViewPointBean> selectAll() {
		return this.getSession().createQuery("from ViewPointBean",ViewPointBean.class).list();		
	}

	@Override
	public List<ViewPointBean> selectByCondition(ViewPointBean bean) {
		
		ArrayList<String> mapKey = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String,Object>();

		String hql = "from ViewPointBean where 1=1";
		
		if (bean.getViewPointName() != null && !"".equals(bean.getViewPointName())) {
			hql=hql+" and viewPointName like :viewPointName";
			params.put("viewPointName", "%"+bean.getViewPointName()+"%");
			mapKey.add("viewPointName");
		}
		if (bean.getViewPointCity() != null && !"".equals(bean.getViewPointCity())) {
			hql=hql+" and viewPointCity like :viewPointCity";
			params.put("viewPointCity", bean.getViewPointCity());
			mapKey.add("viewPointCity");
		}
		if (bean.getViewPointType() != null && !"".equals(bean.getViewPointType())) {
			hql=hql+" and viewPointType like :viewPointType";
			System.out.println(":viewPointTyep: " + bean.getViewPointType());
			params.put("viewPointType", bean.getViewPointType());
			mapKey.add("viewPointType");
		}	
		System.out.println("hql: " + hql);
		Query hqy = this.getSession().createQuery(hql);
			
	    for (String str : mapKey)
        {
            hqy.setParameter( str, params.get(str));
//            System.out.println("array for: "+ str + "  map: " + params.get(str));
        }
		
	    List<ViewPointBean> result = hqy.getResultList();
		return result;
	}
	
	public ViewPointBean selectByName(ViewPointBean bean) {	
		System.out.println("DAO select by Name access");
		try {
			ViewPointBean temp = this.getSession().createQuery("from ViewPointBean WHERE viewPointName LIKE '" + bean.getViewPointName() + "'",ViewPointBean.class).getSingleResult();
			return temp;
		} catch (NoResultException e) {
			return null;
		}

	}
	
	@Override
	public ViewPointBean insert(ViewPointBean bean) {
		if(bean != null) {
			this.getSession().saveOrUpdate(bean);
			System.out.println("DAO insert access");
			return bean;
		}
		return null;
	}

	@Override
	public ViewPointBean update(ViewPointBean bean) {
		if(bean != null) {
			this.getSession().saveOrUpdate(bean);
			System.out.println(bean.toString());
			return bean;
		}
		return null;
	}

	@Override
	public ViewPointBean delete(int viewPointID) {
		// TODO Auto-generated method stub
		return null;
	}



}
