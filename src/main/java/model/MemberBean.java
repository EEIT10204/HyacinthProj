package model;

import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Base64;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.SelectBeforeUpdate;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.SpringJavaConfiguration;

@Entity
@Table(name="Member")
@DynamicUpdate(true)
@SelectBeforeUpdate(true)
public class MemberBean {
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			Session session = sessionFactory.getCurrentSession();
			//select
			MemberBean select = session.get(MemberBean.class,1);
			System.out.println("select="+select);
			//insert
			MemberBean bean =  new MemberBean();
			bean.setMemberAccount("testID1");
			bean.setMemberPwd("test");
			bean.setMemberName("test");
			bean.setMemberTel("test");
			bean.setMemberMail("test");
			session.save(bean);
			//update
			MemberBean update = session.get(MemberBean.class,3);
			update.setMemberPwd("TESTUPDATE2222");
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}
		
	}
/*
create table member
(memberID int primary key IDENTITY,
 memberAccount varchar(30) Not Null,
 memberPwd varchar(30) Not Null,
 memberName nvarchar(30) Not Null,
 memberTel varchar(20) Not Null,
 memberMail varchar(30) Not Null,
 memberPic varbinary(max),
 memberNickName nvarchar(20),
 memberGender nvarchar(10),
 memberBirthDay nvarchar(15),
 googleToken nvarchar(50),
 memberHierachy nchar(5)
);
 */
//-----------------------------------------------	
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer memberID;
	private String memberAccount;
	private String memberPwd;
	private String memberName;
	private String memberTel;
	private String memberMail;
	private byte[] memberPic;
	private String memberNickName;
	private String memberGender;
	private java.util.Date memberBirthDay;
	private String googleToken;
	private String memberHierachy;
	private String memberCertify;
	
//-------------------------------------------
	@Override
	public String toString() {
		String picLen = "Pic_len=null,";
		if(memberPic!=null) {picLen="Pic_len="+memberPic.length+",";}
		return  picLen+"MemberBean [memberID=" + memberID + ", memberAccount=" + memberAccount + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberTel=" + memberTel + ", memberMail=" + memberMail
//				+ ", memberPic=" + Arrays.toString(memberPic) 
				+ ", memberNickName=" + memberNickName + ", memberGender="
				+ memberGender + ", memberBirthday=" + memberBirthDay + ", googleToken=" + googleToken
				+ ", memberHierachy=" + memberHierachy + "]";
	}
	
	public String getMemberBirthdayToString() {
		if(memberBirthDay!=null) {
			return new SimpleDateFormat("yyyy-MM-dd").format(memberBirthDay);
		}
		return null;
	}
	
	public String getMemberPicToBase64() {
		if(memberPic!=null) {
			return Base64.getEncoder().encodeToString(memberPic);
		}
		return null;
	}
	
//-------------------------------------------	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public byte[] getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(byte[] memberPic) {
		this.memberPic = memberPic;
	}

	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	public java.util.Date getMemberBirthDay() {
		return memberBirthDay;
	}

	public void setMemberBirthDay(java.util.Date memberBirthDay) {
		this.memberBirthDay = memberBirthDay;
	}
	public String getGoogleToken() {
		return googleToken;
	}
	public void setGoogleToken(String googleToken) {
		this.googleToken = googleToken;
	}
	public String getMemberHierachy() {
		return memberHierachy;
	}
	public void setMemberHierachy(String memberHierachy) {
		this.memberHierachy = memberHierachy;
	}
	public String getMemberCertify() {
		return memberCertify;
	}
	public void setMemberCertify(String memberCertify) {
		this.memberCertify = memberCertify;
	}

}
