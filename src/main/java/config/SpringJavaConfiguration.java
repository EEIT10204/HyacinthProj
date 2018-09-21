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

import model.ACCommentBean;
import model.ActBean;
import model.BGCommentBean;
import model.BlogBean;
import model.CityBean;
import model.MemberBean;
import model.MemberBlogBean;
import model.MembershipBean;
import model.NoticeBean;
import model.ReportBean;
import model.ViewPointBean;

@Configuration
@ComponentScan(basePackages={"model"})
public class SpringJavaConfiguration {
	@Bean
	public MessageSource messageSource() {
		ResourceBundleMessageSource bundle = new ResourceBundleMessageSource();
		bundle.setBasename("controller.Errors");
		return bundle;
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

		return builder.buildSessionFactory();
	}
}
