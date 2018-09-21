package config;

import org.springframework.web.context.AbstractContextLoaderInitializer;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.AnnotationConfigWebApplicationContext;

public class ContextLoaderListenerRegistry extends AbstractContextLoaderInitializer {

// <listener>
//    <listener-class>org.springframework.web.context.ContextLoaderListener</listener-class>
//  </listener>
	
	/*只須設定下面標籤*/
	
//	  <context-param>
//	    <param-name>contextConfigLocation</param-name>
//	    <param-value>config.SpringJavaConfiguration</param-value>
//	  </context-param>
//	  <context-param>
//	    <param-name>contextClass</param-name>
//	    <param-value>org.springframework.web.context.support.AnnotationConfigWebApplicationContext</param-value>
//	  </context-param>
	
	@Override
	protected WebApplicationContext createRootApplicationContext() {
		System.out.println("ContextLoaderListenerRegistry.createRootApplicationContext()");
		AnnotationConfigWebApplicationContext context = new AnnotationConfigWebApplicationContext();
		context.register(SpringJavaConfiguration.class);
		return context;
	}

}
