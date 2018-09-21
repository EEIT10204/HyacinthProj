package model.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.MemberBean;
import model.MemberDAO;
import model.SubMemberBean;
import model.SubMemberDAO;

@Repository
public class SubMemberDAOHibernate implements SubMemberDAO{
	
	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			SubMemberDAO subMemberDAO = (SubMemberDAO) context.getBean("subMemberDAOHibernate");
			
			List<SubMemberBean> selectAll = subMemberDAO.selectAll();
			System.out.println("select="+selectAll);
//			
//			SubMemberBean select2 = subMemberDAO.findByPK(1011);
//			System.out.println("select="+select2);		
			
//			SubMemberBean insert = new SubMemberBean();
//			insert.setMemberID(1007);
//			insert.setMemberJob("Pilot");
//			SubMemberBean insertResult = subMemberDAO.insert(insert);
//			System.out.println("insertResult="+insertResult);
//			
			
//			SubMemberBean updateBean = subMemberDAO.findByPK(1007);
//			updateBean.setMemberLocation("Tokyo");
//			SubMemberBean updateResult = subMemberDAO.update(updateBean);
//			System.out.println("updateResult="+updateResult);
//			
//			boolean deleteResult = subMemberDAO.delete(1007);
//			System.out.println("deleteResult="+deleteResult);
			
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}	
	}
	
	
//Framework Object--------------------------	
	@Autowired
	private SessionFactory sessionFactory;
	
	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	

//CRUD--------------------------	
	@Override
	public List<SubMemberBean> selectAll() {
		return this.getSession().createQuery("from SubMemberBean", SubMemberBean.class).list();
	}

	@Override
	public SubMemberBean findByPK(Integer memberID) {
		return this.getSession().get(SubMemberBean.class, memberID);
	}

	@Override
	public SubMemberBean insert(SubMemberBean bean) {
		if(bean!=null) {
			SubMemberBean temp = this.findByPK(bean.getMemberID());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public SubMemberBean update(SubMemberBean bean) {
		if(bean!=null) {
			SubMemberBean temp =this.getSession().get(SubMemberBean.class,bean.getMemberID());
			if(temp!=null) {
			   		return (SubMemberBean) this.getSession().merge(bean);
			}
		}
		return null;
	}

	@Override
	public boolean delete(Integer memberID) {
		SubMemberBean temp = this.getSession().get(SubMemberBean.class, memberID);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

}
