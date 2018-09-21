package model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.SpringJavaConfiguration;

@Entity
@Table(name="City")
public class CityBean {
	
	public static void main(String[] args) {
		
		//ApplicationContext context = new ClassPathXmlApplicationContext("beans.config.xml");
		ApplicationContext context = new AnnotationConfigApplicationContext(SpringJavaConfiguration.class);
		try {
			SessionFactory sessionFactory = (SessionFactory) context.getBean("sessionFactory");
			sessionFactory.getCurrentSession().beginTransaction();
			Session session = sessionFactory.getCurrentSession();
			
			CityBean select = session.get(CityBean.class,"大阪");
			System.out.println("select="+select);
			
			CityBean bean =  new CityBean();
			bean.setCityName("首爾");
			bean.setNation("韓國");
			session.save(bean);
			
			sessionFactory.getCurrentSession().getTransaction().commit();
		} finally {
			((ConfigurableApplicationContext) context).close(); //close()方法即會引發destroy
		}
		
	}
/*
	cityName nvarchar(50) primary key NOT NULL,
	nation nvarchar(50) NULL,
	cityIntro nvarchar(500) NULL,
	cityPic varbinary(max) NULL,
*/
	@Id
	private String cityName;
	private String nation;
	private String cityIntro;
	private byte[] cityPic;
	
	@Override
	public String toString() {
		return "CityBean [cityName=" + cityName + ", nation=" + nation + ", cityIntro=" + cityIntro + ", cityPic="
				+ Arrays.toString(cityPic) + "]";
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getCityIntro() {
		return cityIntro;
	}
	public void setCityIntro(String cityIntro) {
		this.cityIntro = cityIntro;
	}
	public byte[] getCityPic() {
		return cityPic;
	}
	public void setCityPic(byte[] cityPic) {
		this.cityPic = cityPic;
	}
	
}
