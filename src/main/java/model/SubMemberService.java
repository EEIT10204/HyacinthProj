package model;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import config.SpringJavaConfiguration;

@Service
public class SubMemberService {
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			
			SubMemberService subMemberService = (SubMemberService) context.getBean("subMemberService");
			
//			SubMemberBean testBean = new SubMemberBean();
//			testBean.setMemberID(1012);
//			testBean.setMemberLocation("Taipei,Taiwan");
//			testBean.setMemberJob("Actress");
//			SubMemberBean result = subMemberService.updateSubMemberInfo(testBean);
//			System.out.println("result="+result);
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}	
	}
	
	@Autowired
	private SubMemberDAO subMemberDAO;
	
	
	public SubMemberBean readSubMemberInfo(Integer memberID) {		
		if(memberID!=null) {
			return subMemberDAO.findByPK(memberID);
		}
		return null;
	}
	
	public SubMemberBean updateSubMemberInfo(SubMemberBean bean) {
		if(bean!=null) {
			SubMemberBean temp = subMemberDAO.findByPK(bean.getMemberID());
			if(temp==null) {
				return subMemberDAO.insert(bean);
			}else {
				return subMemberDAO.update(bean);
			}
		}
		return null;
	}
}
