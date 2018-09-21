package config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

import model.ACCommentBean;
import model.ActBean;
import model.BlogBean;
import model.BGCommentBean;
import model.CityBean;
import model.MemberActBean;
import model.MemberBean;
import model.MemberBlogBean;
import model.MemberHistBean;
import model.MembershipBean;
import model.NoticeBean;

@Configuration
@ComponentScan(basePackages= {"model"})
public class SpringJavaConfiguration {
	
	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());

		builder.addAnnotatedClasses(ActBean.class);
		builder.addAnnotatedClasses(ACCommentBean.class);
		builder.addAnnotatedClasses(BlogBean.class);
		builder.addAnnotatedClasses(BGCommentBean.class);
		builder.addAnnotatedClasses(CityBean.class);
		builder.addAnnotatedClasses(MemberBean.class);
		
		builder.addAnnotatedClasses(MemberActBean.class);
		builder.addAnnotatedClasses(MemberBlogBean.class);
		
		builder.addAnnotatedClasses(MembershipBean.class);
		builder.addAnnotatedClasses(MemberHistBean.class);
		builder.addAnnotatedClasses(NoticeBean.class);
		
		
		Properties properties = new Properties();
//		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServerDialect");
		//Hibernate 分頁需更換SQLServer版本
		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServer2005Dialect");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.current_session_context_class", "thread");
		
		builder.addProperties(properties);
		
		return builder.buildSessionFactory();
	}
	
	@Bean
	public DataSource dataSource() {
		
		try {
			JndiObjectFactoryBean bean = new JndiObjectFactoryBean();
			bean.setJndiName("java:comp/env/jdbc/xxx");
			bean.setProxyInterface(DataSource.class);
			bean.afterPropertiesSet();
			return (DataSource) bean.getObject();
		} catch (IllegalArgumentException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return null;
	}
	
//	@Bean
//	public DataSource dataSource() {
//		
//		DriverManagerDataSource dmds = new DriverManagerDataSource();
//		dmds.setDriverClassName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//		dmds.setUrl("jdbc:sqlserver://localhost:1433;database=Hyacinth");
//		dmds.setUsername("sa");
//		dmds.setPassword("passw0rd");
//		
//		return dmds;
//	}

}
