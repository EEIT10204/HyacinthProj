package model;

import java.util.UUID;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import org.springframework.stereotype.Service;

import config.SpringJavaConfiguration;

@Service
public class MemberService {
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			
			MemberService memberService = (MemberService) context.getBean("memberService");
			
			MemberBean login = memberService.login("Crystal", "CCC");
//			System.out.println("login=" + login);
			
//			MemberBean sign = new MemberBean();
//			sign.setMemberAccount("insertHib23333");
//			sign.setMemberPwd("insertHib");
//			sign.setMemberName("insertHib");
//			sign.setMemberTel("insertHib");
//			sign.setMemberMail("insertHib");
//			MemberBean signResult = memberService.register(sign);
//			System.out.println("signResult="+signResult);
			
//			MemberBean updateBean = memberService.login("insertHib23333", "insertHib");
//			updateBean.setMemberPwd("1234567");
//			MemberBean updateResult = memberService.updateProfile(updateBean);
//			System.out.println("updateResult="+updateResult);
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}	
	}
	
	@Autowired
	private MemberDAO memberDAO;
	
	public MemberBean login(String username,String password) {
		MemberBean bean = memberDAO.findByAccount(username);
		if(bean!=null && password.length()!=0) {
			if(bean.getMemberPwd().equals(password)) {
				return bean;
			}
		}
		return null;
	}
	
	public MemberBean register(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.insert(bean);
		}
		return result;
	}
	
	public MemberBean updateProfile(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.update(bean);
		}
		return result;
	}
	
	public MemberBean readProfile(String username) {
		return memberDAO.findByAccount(username);
	}
	
	//H.C.Chen
	public MemberBean updateProfileBasic(MemberBean bean) {
		MemberBean result = null;
		if(bean!=null) {
			result = memberDAO.updateBasic(bean.getMemberID(),bean.getMemberName(),bean.getMemberTel(),bean.getMemberPic(),
					bean.getMemberNickName(),bean.getMemberGender(),bean.getMemberBirthDay());
		}
		return result;
	}
	
	//H.C.Chen
	public MemberBean updateProfilePrivacy(Integer memberID,String newPassword,String memberMail) {
		MemberBean bean = memberDAO.findByPK(memberID);
		if(bean!=null) {
			if(newPassword!=null && newPassword.length()!=0) {
				if(!bean.getMemberMail().equals(memberMail)) {
//					System.out.println("change Mail");
					MemberBean result = memberDAO.updatePrivacy(memberID, newPassword, memberMail,"Uncertified",generateUUID());
					sendVerificationMail(result);
					return result;
				}else {
//					System.out.println("unchange Mail");
					return memberDAO.updatePrivacy(memberID, newPassword, memberMail,bean.getMemberHierachy(),bean.getMemberCertify());	
				}
			}
		}
		return null;
	}
	
	//H.C.Chen
	public MemberBean sendVerificationMail(MemberBean bean){
//		System.out.println("mailAddress="+bean.getMemberMail());
		
		try {
			Context initCtx = new InitialContext();
			Context envCtx = (Context) initCtx.lookup("java:comp/env");
			Session session = (Session) envCtx.lookup("mail/Session");


			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("HyacinthSystem@gmail.com"));
			
			InternetAddress to[] = new InternetAddress[1];
			to[0] = new InternetAddress(bean.getMemberMail());
			message.setRecipients(Message.RecipientType.TO, to);
			
			message.setSubject("[Hyacinth] Please verify your email address.");
			
			String line1="Hi,@"+bean.getMemberAccount()+"!<br/>";
			String line2="Help us secure your Hyacinth account by verifying your email address("
					    + bean.getMemberMail()+ "). This lets you access all of Hyacinth's features.<br/>";
			
//			String verifyAddress="http://localhost:8080/HyacinthProj/verifyMail.do?account="+bean.getMemberAccount()+"&code="+bean.getMemberCertify();
//			String verifyAddress="http://192.168.30.52:8080/HyacinthProj/verifyMail.do?account="+bean.getMemberAccount()+"&code="+bean.getMemberCertify();
			String verifyAddress="http://hyacinthtw.eeit.me:8080/HyacinthProj/verifyMail.do?account="+bean.getMemberAccount()+"&code="+bean.getMemberCertify();
			
			String line3="<a href='"+verifyAddress+"'>Verify email address</a><hr/>";
			
			String line4="Button not working? Paste the following link into your browser:<br/>";
			String line5="<a href='"+verifyAddress+"'>"+verifyAddress+"</a><br/>";
			String line6="You are receiving this email because you recently created a new Hyacinth account or added a new email address. If this wasn’t you, please ignore this email.<br/>";
					
			
			String text= line1+line2+line3+line4+line5+line6;
			
			message.setContent(text, "text/html");
			
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
			return null;	
		} catch (NamingException e) {
			e.printStackTrace();
			return null;	
		} catch (MessagingException e) {
			e.printStackTrace();
			return null;	
		}	
		return bean;		
	}
	
	//H.C.Chen
	public String generateUUID() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
	
	//H.C.Chen
	public boolean verifyMail(String account,String code) {
		MemberBean bean = memberDAO.findByAccount(account);
		if(bean!=null && code.equals(bean.getMemberCertify())) {
			memberDAO.updateHierachy(bean.getMemberID(),"regular");
			return true;
		}
		return false;
	}
}
