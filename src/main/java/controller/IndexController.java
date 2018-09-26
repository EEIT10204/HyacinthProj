package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import model.ActBean;
import model.ActService;
import model.BlogBean;
import model.BlogService;

@Controller
public class IndexController {
	
	@Autowired	
	private ActService actService;
	@Autowired
	private BlogService blogService;
	
	@GetMapping("/intoAct")
	@ResponseBody
	public List<ActBean> onloadA(){
//		System.out.println("logining sucess!");
		List<ActBean> acts = actService.selectTopSix();
//		System.out.println("Index Controll acts: " + acts.toString());
		return acts;
	 }
	
	@GetMapping("/ActMain")
	@ResponseBody
	public List<ActBean> onloadMAct(){
//		System.out.println("mainAct login sucess!");
		List<ActBean> macts = actService.Newset();
		return macts;
	 }
	
	@GetMapping("/intodsd")
	@ResponseBody
	public List<BlogBean> onload(){
		List<BlogBean> blogs = blogService.selectTopSix();
//		for(BlogBean temp: blogs) {
//			System.out.println("Index Blog access" + temp.toString());
//		}
		
		return blogs;
	}


	@RequestMapping(path={"/showSelectResults.do"},method= {RequestMethod.GET})
	@ResponseBody
	public Object[] showSelectResults(String keyword,String status,String sorting,String page){
		
//		System.out.println("keyword="+keyword+",status="+status+",sorting="+sorting+",page"+page);
		int p =1;
		try {
			 p= Integer.valueOf(page);
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
		
		if(status==null || "".equals(status)) { status = "prepare"; }
		if(sorting==null || "".equals(sorting)) { sorting = "actStartTime"; }
		
		if(keyword !=null && !"".equals(keyword)) {
			return actService.fetchByMultiConditions(keyword, status, sorting, p, 6);
		}
		return null;
	}
}
