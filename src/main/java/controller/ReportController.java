package controller;

import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;

import model.ACCommentBean;
import model.ACCommentService;
import model.ActBean;
import model.BGCommentBean;
import model.BGCommentService;
import model.BlogBean;
import model.BlogService;
import model.MemberBean;
import model.ReportBean;
import model.ReportService;
import model.dao.ActDAOHibernate;
import model.dao.MemberDAOHibernate;

@Controller
public class ReportController {
	
	@Autowired
	ReportService reportService;
	@Autowired
	ACCommentService aCCommentService;
	@Autowired
	BGCommentService bGCommentService;
	@Autowired  // need change
	MemberDAOHibernate memberDAO;
	@Autowired
	BlogService blogService;
	@Autowired
	ActDAOHibernate actDAO;
	
//	ReportService reportService;
	@ResponseBody
	@RequestMapping(
			path= {"/report.Controller"},
			produces = {"application/json;charset=UTF-8"})
	public String selectReport(@RequestParam String type, @RequestParam String process) {
		
		System.out.println("type: " + type + " progress: " + process);
				
		if("".equals(type) && "".equals(process)){  // no setting condition, select all
			System.out.println("select all");
			List<ReportBean> results = reportService.selectAll();
//			System.out.println("console controller result: " + results.size());
			Gson beanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			String json = beanToJson.toJson(results);
			return json;
		}
		else {  //select by condition
			System.out.println("select by condition");
			
			ReportBean bean = new ReportBean();
			bean.setReferID(type);
			bean.setProcess(process);
			
			List<ReportBean> results = reportService.selectByCondition(bean);
			Gson beanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			String json = beanToJson.toJson(results);
			return json;
			
		}

	}
	@RequestMapping(path= {"/report.ShowDetail"},
			produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String showReportDetail(@RequestParam String referID) {
//		System.out.println(referID);
		if(referID.contains("ACC")) {
			System.out.println("Acc");
			ACCommentBean temp = new ACCommentBean();
			temp.setACCommentID(referID);
			ACCommentBean acCommentresult = aCCommentService.selectByCommentID(temp);
			MemberBean memberResult = memberDAO.findByPK(acCommentresult.getMemberID());
//			temp.setActSNum(2);
//			aCCommentService.selectByActID(temp);
//			Timestamp insertBean = new Timestamp(System.currentTimeMillis());
			
			//test insert
//			temp.setCommentContent("Dandy comment on AC00005");
//			temp.setActSNum(5);
//			temp.setReplyTime(insertBean);
//			temp.setCommentVisibility(1);
//			System.out.println("insert temp: " + temp.toString());
//			aCCommentService.insert(temp);
			
			//test update
//			temp.setACCommentID("ACC00009");
//			temp.setCommentContent("Dandy comment AC00005 with update");
//			temp.setCommentVisibility(1);
//			temp.setReplyTime(insertBean);
//			temp.setActSNum(5);
//			temp.setMemberID(4);
//			aCCommentService.update(temp);
			
			Gson beanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			JsonElement jsonTree = beanToJson.toJsonTree(acCommentresult);
			jsonTree.getAsJsonObject().addProperty("memberName", memberResult.getMemberName());
			String json = beanToJson.toJson(jsonTree);
			System.out.println("json: " + json);
			return json;
			
		}
		else if(referID.contains("BGC")) {		
			System.out.println("BGC");

			//Select by CommentID
			BGCommentBean temp = new BGCommentBean();			
			temp.setBGCommentID(referID);
			BGCommentBean bgCommentResult = bGCommentService.selectByCommentID(temp);
			MemberBean memberResult = memberDAO.findByPK(bgCommentResult.getMemberID());
			System.out.println("show detail BGC: " + bgCommentResult.toString());
			//test select by blogSNum
//			temp.setBGCommentID(null);
//			temp.setBlogSNum(1);
//			List<BGCommentBean> results = bGCommentService.selectByBlogSNum(temp);		
			
			//test insert&update
//			Timestamp current = new Timestamp(System.currentTimeMillis());
//			temp.setCommentContent("Cathy comment on BG00004 (BLOCK) - update");
//			temp.setBGCommentID("BGC00011");
//			temp.setMemberID(3);
//			temp.setBlogSNum(4);
//			temp.setReplyTime(current);
//			temp.setCommentVisibility(0);
//			System.out.println("update temp: " + temp.toString());
//			BGCommentBean result = bGCommentService.update(temp);
			
			//test update
			
			Gson beanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			JsonElement jsonTree = beanToJson.toJsonTree(bgCommentResult);
			jsonTree.getAsJsonObject().addProperty("memberName", memberResult.getMemberName());
			String json = beanToJson.toJson(jsonTree);
			System.out.println("bgComment json: " + json);
			return json;
		}
		else if(referID.contains("BG")) {
			BlogBean blog = new BlogBean();
			blog.setBlogID(referID);
			BlogBean blogResult = blogService.selectByBlogID(blog);
			System.out.println(blogResult.toString());
			MemberBean memberResult = memberDAO.findByPK(blogResult.getMemberID());
			Gson beanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			JsonElement jsonTree = beanToJson.toJsonTree(blogResult);
			jsonTree.getAsJsonObject().addProperty("memberName", memberResult.getMemberName());
			jsonTree.getAsJsonObject().addProperty("blogCoverToBase64",blogResult.getBlogCoverToBase64());
			String json = beanToJson.toJson(jsonTree);
//			System.out.println("bgComment json: " + json);
			return json;		
		}
		else if(referID.contains("AC")) {
			ActBean actBean = new ActBean();
			actBean.setActID(referID);
			ActBean actResult = actDAO.selectByActID(actBean);
			System.out.println("Act detail: " + actResult.toString());
			MemberBean memberResult = memberDAO.findByPK(actResult.getMemberID());
			
			Gson beanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd HH:mm:ss").create();
			JsonElement jsonTree = beanToJson.toJsonTree(actResult);
			jsonTree.getAsJsonObject().addProperty("memberName", memberResult.getMemberName());
			jsonTree.getAsJsonObject().addProperty("getActPhotoToBase64",actResult.getActPhotoToBase64());
			String json = beanToJson.toJson(jsonTree);
			return json;
			
		}	
		return "controller access";
	}
	
	@RequestMapping(path= {"/report.Process"},
			produces = {"text/html;charset=UTF-8"})
	@ResponseBody
	public String reportProcess(String referID, String type, String caseID, String process) {
		
		System.out.println("referID: " + referID +", type: " + type + ", caseID: " + caseID);
		if(process.equals("accept")) {
		if("comment".equals(type)) {
			ReportBean reportBean = new ReportBean();
			reportBean.setCaseID(caseID);
			
			reportService.caseAccept(reportBean, referID);

		}
		else if("act".equals(type)) {
			ReportBean reportBean = new ReportBean();
			reportBean.setCaseID(caseID);
			
			reportService.caseAccept(reportBean, referID);
			
		}
		else if("blog".equals(type)) {
			ReportBean reportBean = new ReportBean();
			reportBean.setCaseID(caseID);
			
			reportService.caseAccept(reportBean, referID);
		}
			return "case accept success";
		}
		else if(process.equals("deny")) {
			ReportBean reportBean = new ReportBean();
			reportBean.setCaseID(caseID);
			reportService.caseDeny(reportBean, referID);
		}
		
		System.out.println("case deny");
		return "process deny success";
	}
	
	@RequestMapping(path= {"/report.Send"},
			produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String sendReport(String reportMember, String referID, String reportReason) {
		System.out.println(reportMember + " - " + referID + " - " + reportReason);
		
		ReportBean reportBean = new ReportBean();
		reportBean.setMemberID(Integer.parseInt(reportMember));
		reportBean.setReferID(referID);
		reportBean.setReason(reportReason);
		Timestamp insertTime = new Timestamp(System.currentTimeMillis());
		reportBean.setReportedTime(insertTime);
		reportBean.setProcess("處理中");
		reportService.createReport(reportBean);
		
		return "report success";
	}
}
