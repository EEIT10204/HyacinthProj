package model;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.dao.ACCommentDAOHibernate;
import model.dao.ActDAOHibernate;
import model.dao.BGCommentDAOHibernate;
import model.dao.BlogDAOHibernate;
import model.dao.ReportDAOHibernate;

@Service
public class ReportService {
	@Autowired
	private ReportDAOHibernate reportDAO;
	@Autowired 
	private ACCommentDAOHibernate acCommentDAO;
	@Autowired
	private BGCommentDAOHibernate bgCommentDAO;
	@Autowired
	private ActDAOHibernate actDAO;
	@Autowired
	private BlogDAOHibernate blogDAO;
	
	public List<ReportBean> selectAll(){
//		List<ReportBean> results = reportDAO.selectAll();
//		System.out.println("report service access: " + results.toString());
		List<ReportBean> results = reportDAO.selectAll();
		return results;
	}
	
	public List<ReportBean> selectByCondition(ReportBean bean){
		
		if("act".equals(bean.getReferID())) {  //choose ACT
			bean.setReferID("(referID Like 'AC%' AND referID NOT LIKE 'ACC%')");
//			List<ReportBean> results = reportDAO.selectByCondition(bean);
//			return results;
		}
		else if ("blog".equals(bean.getReferID())) {  //choose Blog
			bean.setReferID("referID Like 'BG%'");
		}
		else if ("comment".equals(bean.getReferID())) {  // choose comment
			bean.setReferID("(referID LIKE 'ACC%' OR referID LIKE 'BGC%')");		
		}
		
		if(!"".equals(bean.getReferID()) && !"".equals(bean.getProcess())) {
			bean.setReferID(bean.getReferID() + " AND ");
		}
		
		if("處理中".equals(bean.getProcess())) {
			bean.setProcess("process LIKE '處理中'");
		}
		else if ("已完成".equals(bean.getProcess())) {
			bean.setProcess("process LIKE '已完成'");
		}
		
		List<ReportBean> results = reportDAO.selectByCondition(bean);
		
		return results;
	}
	
	public ReportBean createReport(ReportBean bean) {
		reportDAO.insert(bean);
		return bean;
	}
	
	public ReportBean caseAccept(ReportBean bean, String referID) {
		
		// change comment visibility
		if(referID.contains("ACC")) {
			//select need ACC bean and set invisible (visibility = 0)
			ACCommentBean accBean = new ACCommentBean();
			accBean.setACCommentID(referID);
			accBean = acCommentDAO.selectByACComentID(accBean);
			accBean.setCommentVisibility(0);
			acCommentDAO.update(accBean);	
		}
		else if(referID.contains("BGC")) {
				//select need ACC bean and set invisible (visibility = 0)
			BGCommentBean bgcBean = new BGCommentBean();
			bgcBean.setBGCommentID(referID);
			bgcBean = bgCommentDAO.selectByACComentID(bgcBean);
			bgcBean.setCommentVisibility(0);
			bgCommentDAO.update(bgcBean);
		}
		else if(referID.contains("AC")) {
			ActBean actBean = new ActBean();
			actBean.setActID(referID);
			actBean = actDAO.selectByActID(actBean);
			actBean.setActVisibility(0);
			actDAO.update(actBean);
		}
		else if(referID.contains("BG")) {
			BlogBean blogBean = new BlogBean();
			blogBean.setBlogID(referID);
			blogBean = blogDAO.selectByBlogID(blogBean);
			blogBean.setBlogVisibility(0);
		}
		// change report case data status to "已完成"
		ReportBean reportBean = reportDAO.selectByCase(bean.getCaseID());
		reportBean.setProcess("已完成");
		
		return reportBean;
	}
	
	public ReportBean caseDeny(ReportBean bean, String referID) {
		
		if(referID.contains("ACC")) {
			//select need ACC bean and set invisible (visibility = 0)
			ACCommentBean accBean = new ACCommentBean();
			accBean.setACCommentID(referID);
			accBean = acCommentDAO.selectByACComentID(accBean);
			accBean.setCommentVisibility(1);
			acCommentDAO.update(accBean);	
		}
		else if(referID.contains("BGC")) {
				//select need ACC bean and set invisible (visibility = 0)
			BGCommentBean bgcBean = new BGCommentBean();
			bgcBean.setBGCommentID(referID);
			bgcBean = bgCommentDAO.selectByACComentID(bgcBean);
			bgcBean.setCommentVisibility(1);
			bgCommentDAO.update(bgcBean);
		}
		else if(referID.contains("AC")) {
			ActBean actBean = new ActBean();
			actBean.setActID(referID);
			actBean = actDAO.selectByActID(actBean);
			actBean.setActVisibility(1);
			actDAO.update(actBean);
		}
		else if(referID.contains("BG")) {
			BlogBean blogBean = new BlogBean();
			blogBean.setBlogID(referID);
			blogBean = blogDAO.selectByBlogID(blogBean);
			blogBean.setBlogVisibility(1);
		}
		
		ReportBean reportBean = reportDAO.selectByCase(bean.getCaseID());
		reportBean.setProcess("已完成");
		return reportBean;
	}
	
}
