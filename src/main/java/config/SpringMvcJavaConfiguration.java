package config;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.context.support.ServletContextResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;
import org.springframework.web.servlet.config.annotation.ViewResolverRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
import org.springframework.web.servlet.view.XmlViewResolver;

@Configuration
@ComponentScan(basePackages={"controller"})
@EnableWebMvc
public class SpringMvcJavaConfiguration implements WebMvcConfigurer {

	@Autowired
	private ServletContext application;

	@Override
	public void configureViewResolvers(ViewResolverRegistry registry) {
		XmlViewResolver xmlViewResolver = new XmlViewResolver();
		xmlViewResolver.setLocation(
				new ServletContextResource(application, "/WEB-INF/spring-views.xml"));
		registry.viewResolver(xmlViewResolver);
	}
	
	//-------檔案上傳Resolver-----
	@Bean
	public CommonsMultipartResolver multipartResolver() {
	    CommonsMultipartResolver resolver=new CommonsMultipartResolver();
	    resolver.setDefaultEncoding("utf-8");
	    return resolver;
	}
}
