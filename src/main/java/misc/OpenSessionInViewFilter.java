package misc;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.HibernateException;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.web.context.WebApplicationContext;

@WebFilter(urlPatterns= {"/*"})
public class OpenSessionInViewFilter implements Filter {

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		HttpServletResponse response = (HttpServletResponse) resp;
		
		try {
//			System.out.println("OpenSessionInViewFilter pre-processing");
			sessionFactory.getCurrentSession().beginTransaction();

			chain.doFilter(request, response);  //呼叫後續Web元件
			
//			System.out.println("OpenSessionInViewFilter post-processing");
			sessionFactory.getCurrentSession().getTransaction().commit();
		} catch (HibernateException e) {
			e.printStackTrace();
			sessionFactory.getCurrentSession().getTransaction().rollback();
			chain.doFilter(request, response); 
		}

	}

	private FilterConfig filterConfig;
	
	private SessionFactory sessionFactory;
	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
		this.filterConfig=filterConfig;  //利用外面傳進來的參數來初始化上面的private變數
		ServletContext application = filterConfig.getServletContext();
		ApplicationContext context = (ApplicationContext) application.getAttribute(WebApplicationContext.ROOT_WEB_APPLICATION_CONTEXT_ATTRIBUTE);
		this.sessionFactory = (SessionFactory) context.getBean("sessionFactory");
	}
	
	@Override
	public void destroy() {

	}


}
