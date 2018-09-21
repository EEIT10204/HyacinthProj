package model;

import java.util.Arrays;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.SpringJavaConfiguration;

@Entity
@Table(name="Blog")
public class BlogBean {
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			Session session = sessionFactory.getCurrentSession();
			
			BlogBean select = session.get(BlogBean.class,1);
			System.out.println("select="+select);
			
			BlogBean bean =  new BlogBean();
//			bean.setMemberID(3);
//			bean.setBlogTitle("三星");
//			bean.setBlogCity("大邱");	
			bean.setMemberID(4);
			bean.setBlogTitle("夕陽與海");
			bean.setBlogCity("千葉");	
			session.save(bean);
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}
		
	}
/*
 memberID int references member(memberID),
 blogSNum int primary key IDENTITY NOT NULL,
 blogID AS 'BG'+RIGHT('0000'+convert(varchar,blogSNum),5) PERSISTED NOT NULL,
 blogReleaseTime datetime,
 blogTitle nvarchar(50),
 blogCity nvarchar(50),
 blogContext nvarchar(max),
 blogCover varbinary(max),
 blogView int,
 updatetime datetime,
 blogVisibility int
 */
	
	private Integer memberID;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer blogSNum;

//	@Generated(value = GenerationTime.ALWAYS)
//	@Column(columnDefinition ="AS'BG'+RIGHT('0000'+convert(varchar,serialNum),5)")
	@Column(insertable=false,updatable=false)
	private String blogID;
	private java.util.Date blogReleaseTime;
	private java.util.Date updatetime;
	private String blogTitle;
	private String blogCity;
	private String blogContext;
	private byte[] blogCover;
	private Integer blogView;
	private Integer blogVisibility;
	
	
	@Override
	public String toString() {
		
		String picLen = "Pic_len=null,";
		if(blogCover!=null) {picLen="Pic_len="+blogCover.length+",";}
		
		return "BlogBean [memberID=" + memberID + ", blogSNum=" + blogSNum + ", blogID=" + blogID + ", blogReleaseTime="
				+ blogReleaseTime + ", updatetime=" + updatetime + ", blogTitle=" + blogTitle + ", blogCity=" + blogCity
				+ ", blogContext=" + blogContext + ", blogCover=" + Arrays.toString(blogCover) + ", blogView="
				+ blogView + ", blogVisibility=" + blogVisibility + "]";
	}
	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public Integer getBlogSNum() {
		return blogSNum;
	}
	public void setBlogSNum(Integer blogSNum) {
		this.blogSNum = blogSNum;
	}
	public String getBlogID() {
		return blogID;
	}
	public void setBlogID(String blogID) {
		this.blogID = blogID;
	}
	public java.util.Date getBlogReleaseTime() {
		return blogReleaseTime;
	}
	public void setBlogReleaseTime(java.util.Date blogReleaseTime) {
		this.blogReleaseTime = blogReleaseTime;
	}
	public java.util.Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(java.util.Date updatetime) {
		this.updatetime = updatetime;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getBlogCity() {
		return blogCity;
	}
	public void setBlogCity(String blogCity) {
		this.blogCity = blogCity;
	}
	public String getBlogContext() {
		return blogContext;
	}
	public void setBlogContext(String blogContext) {
		this.blogContext = blogContext;
	}
	public byte[] getBlogCover() {
		return blogCover;
	}
	public void setBlogCover(byte[] blogCover) {
		this.blogCover = blogCover;
	}
	public Integer getBlogView() {
		return blogView;
	}
	public void setBlogView(Integer blogView) {
		this.blogView = blogView;
	}
	public Integer getBlogVisibility() {
		return blogVisibility;
	}
	public void setBlogVisibility(Integer blogVisibility) {
		this.blogVisibility = blogVisibility;
	}
	
	
	
	
}
