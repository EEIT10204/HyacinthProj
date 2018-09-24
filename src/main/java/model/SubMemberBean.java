package model;

import java.util.Arrays;
import java.util.Base64;

import javax.persistence.Entity;
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
@Table(name="SubMember")
@DynamicUpdate(true)
@SelectBeforeUpdate(true)
public class SubMemberBean {
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			Session session = sessionFactory.getCurrentSession();
			//select
			SubMemberBean select = session.get(SubMemberBean.class,1013);
			System.out.println("select="+select);
			//insert
//			SubMemberBean bean =  new SubMemberBean();
//			bean.setMemberID(1013);
//			bean.setMemberJob("test");
//			bean.setMemberFB("test");
//			session.save(bean);
			//update
//			SubMemberBean update = session.get(SubMemberBean.class,1013);
//			update.setMemberIG("IG");

			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}
		
	}
	
/*
 create table SubMember(
	memberID int primary key references Member(memberID) ON DELETE CASCADE,
	memberCover varbinary(max),
	memberJob nvarchar(50),
	memberLocation nvarchar(100),
	memberFB nvarchar(300),
	memberIG nvarchar(300),
	memberTwitter nvarchar(300),
	memberGooglePlus nvarchar(300),
	memberYT nvarchar(300)
)
 */
	
	@Id
	private Integer memberID;
	private byte[] memberCover;
	private String memberJob;
	private String memberLocation;
	private String memberFB;
	private String memberIG;
	private String memberTwitter;
	private String memberGooglePlus;
	private String memberYT;
	
	
	
	
	@Override
	public String toString() {
		return "SubMemberBean [memberID=" + memberID + ",  memberJob="
				+ memberJob + ", memberLocation=" + memberLocation + ", memberFB=" + memberFB + ", memberIG=" + memberIG
				+ ", memberTwitter=" + memberTwitter + ", memberGooglePlus=" + memberGooglePlus + ", memberYT="
				+ memberYT + "]";
	}
	
	
	public String getMemberCoverToBase64() {
		if(memberCover!=null) {
			return Base64.getEncoder().encodeToString(memberCover);
		}
		return null;
	}
//------------------------------------	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public byte[] getMemberCover() {
		return memberCover;
	}
	public void setMemberCover(byte[] memberCover) {
		this.memberCover = memberCover;
	}
	public String getMemberJob() {
		return memberJob;
	}
	public void setMemberJob(String memberJob) {
		this.memberJob = memberJob;
	}
	public String getMemberLocation() {
		return memberLocation;
	}
	public void setMemberLocation(String memberLocation) {
		this.memberLocation = memberLocation;
	}
	public String getMemberFB() {
		return memberFB;
	}
	public void setMemberFB(String memberFB) {
		this.memberFB = memberFB;
	}
	public String getMemberIG() {
		return memberIG;
	}
	public void setMemberIG(String memberIG) {
		this.memberIG = memberIG;
	}
	public String getMemberTwitter() {
		return memberTwitter;
	}
	public void setMemberTwitter(String memberTwitter) {
		this.memberTwitter = memberTwitter;
	}
	public String getMemberGooglePlus() {
		return memberGooglePlus;
	}
	public void setMemberGooglePlus(String memberGooglePlus) {
		this.memberGooglePlus = memberGooglePlus;
	}
	public String getMemberYT() {
		return memberYT;
	}
	public void setMemberYT(String memberYT) {
		this.memberYT = memberYT;
	}
	
	
}
