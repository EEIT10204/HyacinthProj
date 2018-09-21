package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.ActBean;
import model.BlogBean;
import model.MembersActBlogService;

@Controller
public class MembersActBlogController {
	
	@Autowired
	private MembersActBlogService membersActBlogService; 
	
	@RequestMapping(path={"/showHosts.do"},method= {RequestMethod.GET})
	@ResponseBody
	public List<ActBean> showHostedActs(String memberID,String page){

		int m = 0;
		int p = 1;
		try {
			m = Integer.valueOf(memberID);
			p = Integer.valueOf(page);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return membersActBlogService.fetchHostedActs(m,"actCreateDate",p,9);
	}
	
	@RequestMapping(path={"/showJoins.do"},method= {RequestMethod.GET})
	@ResponseBody
	public List<Object[]> showJoinedActs(String memberID,String page){
		int m = 0;
		int p = 1;
		try {
			m = Integer.valueOf(memberID);
			p = Integer.valueOf(page);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return membersActBlogService.fetchJoinedActs(m,"actCreateDate",p,9);
	}
	
	@RequestMapping(path={"/showFollows.do"},method= {RequestMethod.GET})
	@ResponseBody
	public List<Object[]> showFollowedActs(String memberID,String page){
		int m = 0;
		int p = 1;
		try {
			m = Integer.valueOf(memberID);
			p = Integer.valueOf(page);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return membersActBlogService.fetchFollwedActs(m,"actCreateDate",p,9);
	}

	
	@RequestMapping(path={"/showPosts.do"},method= {RequestMethod.GET})
	@ResponseBody
	public List<BlogBean> showPostedBlogs(String memberID,String page){

		int m = 0;
		int p = 1;
		try {
			m = Integer.valueOf(memberID);
			p = Integer.valueOf(page);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return membersActBlogService.fetchPostedBlogs(m,"blogReleaseTime",p,9);
	}
	
	@RequestMapping(path={"/showSaves.do"},method= {RequestMethod.GET})
	@ResponseBody
	public List<Object[]> showSavedBlogs(String memberID,String page){
		int m = 0;
		int p = 1;
		try {
			m = Integer.valueOf(memberID);
			p = Integer.valueOf(page);
		} catch (NumberFormatException e) {
			e.printStackTrace();
		}
		return membersActBlogService.fetchSavedBlogs(m,"blogReleaseTime",p,9);
	}
	
}
