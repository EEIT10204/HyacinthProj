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
import model.MemberActBean;
import model.MemberBean;
import model.MembershipBean;
import model.NoticeBean;
<<<<<<< HEAD
import model.TripBean;
import model.ViewPointBean;
=======
import model.SubMemberBean;


@Configuration
@ComponentScan(basePackages={"model"})
public class SpringJavaConfiguration {
	@Bean

	public MessageSource messageSource() {
		ResourceBundleMessageSource bundle = new ResourceBundleMessageSource();
		bundle.setBasename("controller.Errors");
		return bundle;

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

}
