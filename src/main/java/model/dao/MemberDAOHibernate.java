package model.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Repository;

import config.SpringJavaConfiguration;
import model.MemberBean;
import model.MemberDAO;

@Repository
public class MemberDAOHibernate implements MemberDAO{
	
	public static void main(String[] args) {
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();

			MemberDAO memberDAO = (MemberDAO) context.getBean("memberDAOHibernate");
			
//			List<MemberBean> selectAll = memberDAO.selectAll();
//			System.out.println("select="+selectAll);
			
//			MemberBean select = memberDAO.findByPK(3);
//			System.out.println("select="+select);

			MemberBean select2 = memberDAO.findByAccount("Eason");
			System.out.println("select="+select2);		
			
//			MemberBean insert = new MemberBean();
//			insert.setMemberAccount("insertHib23333");
//			insert.setMemberPwd("insertHib");
//			insert.setMemberName("insertHib");
//			insert.setMemberTel("insertHib");
//			insert.setMemberMail("insertHib");
//			MemberBean insertResult = memberDAO.insert(insert);
//			System.out.println("insertResult="+insertResult);
			
			
//			MemberBean updateBean = memberDAO.findByPK("insertHib23333");
//			updateBean.setMemberPwd("1234567");
//			MemberBean updateResult = memberDAO.update(updateBean);
//			System.out.println("updateResult="+updateResult);
			
//			boolean deleteResult = memberDAO.delete("insertHib23333");
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
	public List<MemberBean> selectAll() {
		return this.getSession().createQuery("from MemberBean", MemberBean.class).list();
	}

	@Override
	public MemberBean findByPK(Integer memberID) {
		return this.getSession().get(MemberBean.class, memberID);
	}
	
	@Override  //H.C.Chen
	public MemberBean findByAccount(String memberAccount) {
		Query<MemberBean> query = this.getSession().createQuery("from MemberBean where memberAccount=?0", MemberBean.class);
		query.setParameter(0, memberAccount);
		return query.uniqueResult();
	}

	@Override
	public MemberBean insert(MemberBean bean) {
		if(bean!=null) {
			MemberBean temp = this.findByAccount(bean.getMemberAccount());
			if(temp==null) {
				this.getSession().save(bean);
				return bean;
			}
		}
		return null;
	}

	@Override
	public MemberBean update(MemberBean bean) {
		if(bean!=null) {
		   MemberBean temp =this.getSession().get(MemberBean.class,bean.getMemberID());
		   	if(temp!=null) {
//		   		if(bean.getMemberPic().length==0) {bean.setMemberPic(temp.getMemberPic());}  //動手腳讓圖片為null時，保持原有圖片
		   		return (MemberBean) this.getSession().merge(bean);
		   	}
		}
		return null;
	}

	@Override
	public boolean delete(Integer memberID) {
		MemberBean temp = this.getSession().get(MemberBean.class, memberID);
		if(temp!=null) {
			this.getSession().delete(temp);
			return true;
		}
		return false;
	}

	@Override  //H.C.Chen
	public MemberBean updateBasic(Integer memberID, String memberName, String memberTel, byte[] memberPic,
			String memberNickName, String memberGender, Date memberBirthday) {
		
		MemberBean temp = this.getSession().get(MemberBean.class, memberID);
		if(temp!=null) {
			temp.setMemberName(memberName);
			temp.setMemberTel(memberTel);
			temp.setMemberPic(memberPic);
			temp.setMemberNickName(memberNickName);
			temp.setMemberGender(memberGender);
			temp.setMemberBirthDay(memberBirthday);
			return temp;
		}
		return null;
	}

	@Override  //H.C.Chen
	public MemberBean updatePrivacy(Integer memberID, String memberPwd, String memberMail, String memberHierachy,String activationCode) {
		
		MemberBean temp = this.getSession().get(MemberBean.class, memberID);
		if(temp!=null) {
			temp.setMemberPwd(memberPwd);
			temp.setMemberMail(memberMail);
			temp.setMemberHierachy(memberHierachy);
			temp.setMemberCertify(activationCode);
			return temp;
		}
		return null;
	}

	@Override  //H.C.Chen
	public MemberBean updateHierachy(Integer memberID, String memberHierachy) {
		MemberBean temp = this.getSession().get(MemberBean.class, memberID);
		if(temp!=null) {
			temp.setMemberHierachy(memberHierachy);
			return temp;
		}
		return null;
	}
	
	@Override
	 public MemberBean findByMail(String memberMail) {
	  return this.getSession()
	  .createQuery("from MemberBean where memberMail=:mail", MemberBean.class)
	  .setParameter("mail", memberMail)
	  .uniqueResult();
	  
	 }

}
