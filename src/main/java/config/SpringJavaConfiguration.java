package config;

import java.util.Properties;

import javax.naming.NamingException;
import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.context.MessageSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.support.ResourceBundleMessageSource;
import org.springframework.jndi.JndiObjectFactoryBean;
import org.springframework.orm.hibernate5.LocalSessionFactoryBuilder;

import model.ActBean;
<<<<<<< HEAD
import model.BGCommentBean;
import model.BlogBean;
import model.CityBean;
import model.MemberBean;
import model.MemberBlogBean;
import model.MembershipBean;
import model.NoticeBean;
<<<<<<< HEAD
import model.ReportBean;
=======
import model.MemberActBean;
import model.MemberBean;
import model.MembershipBean;
import model.NoticeBean;
<<<<<<< HEAD
import model.TripBean;
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
import model.ViewPointBean;
=======
import model.SubMemberBean;
>>>>>>> 5e9c1901954e65d5053af8c3ed94f3bd2d2b9ef9


@Configuration
@ComponentScan(basePackages={"model"})
public class SpringJavaConfiguration {
	@Bean
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
	public MessageSource messageSource() {
		ResourceBundleMessageSource bundle = new ResourceBundleMessageSource();
		bundle.setBasename("controller.Errors");
		return bundle;
<<<<<<< HEAD
=======
=======

>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder = new LocalSessionFactoryBuilder(dataSource());

		builder.addAnnotatedClasses(ActBean.class);
		builder.addAnnotatedClasses(ACCommentBean.class);
		builder.addAnnotatedClasses(BlogBean.class);
		builder.addAnnotatedClasses(BGCommentBean.class);
		builder.addAnnotatedClasses(CityBean.class);
		builder.addAnnotatedClasses(MemberBean.class);
		builder.addAnnotatedClasses(SubMemberBean.class);
		
		builder.addAnnotatedClasses(MemberActBean.class);
		builder.addAnnotatedClasses(MemberBlogBean.class);
		
		builder.addAnnotatedClasses(MembershipBean.class);
		builder.addAnnotatedClasses(MemberHistBean.class);
		builder.addAnnotatedClasses(NoticeBean.class);
		
		
		Properties properties = new Properties();

		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServer2005Dialect");
		properties.put("hibernate.show_sql", "true");
		properties.put("hibernate.current_session_context_class", "thread");
		
		builder.addProperties(properties);
		
		return builder.buildSessionFactory();
<<<<<<< HEAD
>>>>>>> 5e9c1901954e65d5053af8c3ed94f3bd2d2b9ef9
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
	@Bean
	public SessionFactory sessionFactory() {
		LocalSessionFactoryBuilder builder =
				new LocalSessionFactoryBuilder(dataSource());
		builder.addAnnotatedClass(ViewPointBean.class);
		builder.addAnnotatedClass(ReportBean.class);
		builder.addAnnotatedClass(ACCommentBean.class);
		builder.addAnnotatedClass(BGCommentBean.class);
		builder.addAnnotatedClass(MemberBean.class);
		builder.addAnnotatedClass(BlogBean.class);
		builder.addAnnotatedClass(CityBean.class);
		builder.addAnnotatedClass(ActBean.class);
		builder.addAnnotatedClass(MembershipBean.class);
		builder.addAnnotatedClass(NoticeBean.class);
		builder.addAnnotatedClass(MemberBlogBean.class);
				
				
		Properties properties = new Properties();
		properties.put("hibernate.dialect", "org.hibernate.dialect.SQLServer2005Dialect");
		properties.put("hibernate.current_session_context_class", "thread");
		properties.put("hibernate.show_sql", "true");
		builder.addProperties(properties);
=======
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c

		return builder.buildSessionFactory();
	}
}
