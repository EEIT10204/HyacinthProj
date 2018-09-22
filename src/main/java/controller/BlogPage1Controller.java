package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.BGCommentBean;
import model.BGCommentService;
import model.BlogBean;
import model.BlogService;
import model.CityBean;
import model.MemberBean;
import model.MemberBlogBean;
import model.MemberBlogService;

@Controller
public class BlogPage1Controller {
	@Autowired
	private BlogService blogService;
	@Autowired
	private MemberBlogService memberBlogService;
	@Autowired
	private BGCommentService bGCommentService;
	
	@InitBinder
	 public void registerPropertyEditor(WebDataBinder webDataBinder) {
	//  webDataBinder.registerCustomEditor(Byte[].class,new ByteArrayMultipartFileEditor());
	  webDataBinder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
	 }
	
	//MemberBlogselectScoreONload用-----------------------------------------------------------
		@RequestMapping(path= {"/Blog/MemberBlogselectScoreONload.controller"})
		@ResponseBody
		public Double MemberBlogselectScoreONload(
				 @RequestParam("memberID")Integer memberID
				,@RequestParam("blogSNum")Integer blogSNum) {
			System.out.println("run controller  MemberBlogselectScoreONload");
			Double selectScore = memberBlogService.selectScore(memberID, blogSNum);
			System.out.println("selectScore = "+selectScore);
			return selectScore;
			
		}
	
	//MemberBlogUpdatelike用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/MemberBlogScoreUpdate.controller"})
	@ResponseBody
	public MemberBlogBean MemberBlogScoreUpdate(
			@RequestParam("memberID")Integer memberID,
			@RequestParam("blogSNum")Integer blogSNum,
			String score
			) {
		//Console沒印---------------------------------------
		System.out.println("檢查是否有MEMBERID = "+memberID);
		System.out.println("檢查是否有blogSNum = "+blogSNum);
		System.out.println("檢查是否有score = "+score);
		System.out.println("run controller  MemberBlogScore!!!!Update");
		
		 MemberBlogBean tempScore = memberBlogService.updateupdateScoreike(memberID, blogSNum, Double.valueOf(score));
		System.out.println("檢查評分是否成功回傳 = "+tempScore);
		return tempScore;
		
	}
	
	
	//MemberBlogUpdatelike用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/MemberBloglikeUpdate.controller"})
	@ResponseBody
	public MemberBlogBean MemberBloglikeUpdate(
			@RequestParam("memberID")Integer memberID,
			@RequestParam("blogSNum")Integer blogSNum,
			String like
			) {
		System.out.println("run controller  MemberBloglikeUpdate");
		
		MemberBlogBean temp = memberBlogService.updateLike(memberID, blogSNum, Integer.valueOf(like));
		System.out.println("MemberBloglikeUpdate = "+temp);
		return temp;
		
	}
	
	//MemberBloglikeONload用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/MemberBloglikeONload.controller"})
	@ResponseBody
	public Boolean MemberBloglikeONload(
			 @RequestParam("memberID")Integer memberID
			,@RequestParam("blogSNum")Integer blogSNum) {
		System.out.println("run controller  MemberBloglikeONload");
		Boolean temp = memberBlogService.selectLike(memberID, blogSNum);
		System.out.println("MemberBloglikeONload = "+temp);
		return temp;
		
	}
	
	//MemberBloglike用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/MemberBloglike.controller"})
	@ResponseBody
	public Object[] MemberBloglike(@RequestParam("blogSNum")Integer blogSNum) {
		System.out.println("run controller  MemberBloglike");
		 Object[] temp = memberBlogService.findSavesAVGScores(blogSNum);
		 System.out.println("MemberBloglike = "+ temp[0]);
		return temp;
		
	}
	//BlogDelete用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogDelete.controller"})
	@ResponseBody
	public Map<String, String> BlogDelete(
			@RequestParam("blogSNum")Integer blogSNum,
			Model model
			) {
		System.out.println("run controller BlogDelete");
		System.out.println("blogSNum = "+blogSNum);
		Map<String, String> map = new HashMap<>();
		BlogBean beanDelete = blogService.updateDelete(blogSNum);
		System.out.println("beanDelete = "+beanDelete);
//		model.addAttribute("beanDelete", beanDelete);
		if(beanDelete!=null) {
			map.put("result", "網誌刪除成功");
		}
		else{map.put("result", "網誌刪除失敗");}
		
		return map;
		
	}
	
	//BlogUpdate用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogUpdate.controller"})
	public String BlogUpdate(
			@RequestParam("blogSNum")Integer blogSNum,
			Model model
			) {
		System.out.println("run controller  BlogUpdate");
		
		List<Object[]> BeanSNum = blogService.selectByBlogNewPage(blogSNum);
		model.addAttribute("BeanSNum", BeanSNum);
		
		
		return "BlogUpdate";
		
	}
	
	
	
	//BlogEditor用----首頁至個人網誌用-------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogMember.controller"})
	public String BlogEditor(
			@RequestParam("blogSNum")Integer blogSNum,
			Model model,BGCommentBean bean,BindingResult bindingResult
			) {
		System.out.println("run controller  Editor");
		
		List<Object[]> BeanSNum = blogService.selectByBlogNewPage(blogSNum);
		
		
		for(Object[] BeanSNum1:BeanSNum) {
			System.out.println(((CityBean)BeanSNum1[1]).getNation());
		}
		List<Object[]> catchAllComment = bGCommentService.selectBlogCommMemberJoin(blogSNum);
		model.addAttribute("BGComment",catchAllComment);
		model.addAttribute("BeanSNum", BeanSNum);
		return "BlogMember";
		
	}
		
		//Blog留言新增功能
		@RequestMapping(path= {"/Blog/BlogMember.comment"})
		public String BlogCommentInsert(
				@RequestParam("blogSNum")Integer blogSNum,
				Model model,BGCommentBean bean,BindingResult bindingResult
				) {
			System.out.println("run commet: " + bean.toString());
			BGCommentBean result = bGCommentService.insert(bean);
			List<Object[]> InsertComment = bGCommentService.selectBlogCommMemberJoin(blogSNum);
			System.out.println("comment catch reply: " + InsertComment.size());
			List<Object[]> BeanSNum = blogService.selectByBlogNewPage(blogSNum);

			
			model.addAttribute("BGComment",InsertComment);
			model.addAttribute("BeanSNum", BeanSNum);
			return "BlogMember";
			
		}
		
		//Blog留言修改功能
		@RequestMapping(path = {"/BGCommentUpdate.Controller"})
		public String method2(Integer blogSNum,Integer memberID,Model model,
				BGCommentBean bean,BindingResult bindingResult) {
			BGCommentBean result = bGCommentService.update(bean);
			System.out.println("beanid="+bean.getBGCommentID());
//			System.out.println("bean="+bean);
			System.out.println("blogSNum="+blogSNum);
			System.out.println("memberID="+memberID);
			System.out.println("result="+result);
//			model.addAttribute("update",result);
			
			List<Object[]> beans = bGCommentService.selectBlogCommMemberJoin(blogSNum);
			System.out.println("beans="+beans);
			
			List<Object[]> BeanSNum = blogService.selectByBlogNewPage(blogSNum);
			model.addAttribute("BeanSNum", BeanSNum);
			model.addAttribute("BGComment",beans);
			return "BlogMember";	
		}
		
	//BlogIndex用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogIndex.controller"})
	public String forSubmit(//String傳入使用
//			BlogBean bean,BindingResult bindingResult,
			String search,
			String page,
			String newhot,
			Model model) {
		System.out.println("run controller1111");
		System.out.println("page = " + page);
		System.out.println("search = " + search);
		System.out.println("newhot = " + newhot);
		
		List<Object[]> beanMain = blogService.selectByInput(search, page,6,newhot);
		List<Object[]> beanAsideHot = blogService.selectByInput(null,"1",4,"hot");
		List<Object[]> beanAsideNew = blogService.selectByInput(null,"1",4,"new");
//		for(Object[] beanAsideHot1:beanAsideHot) {
//			System.out.println((BlogBean)beanAsideHot1[0]);
//		}
		for(Object[] beanAsideHot1:beanAsideHot) {
		System.out.println(((BlogBean)beanAsideHot1[0]).getBlogView());
	}
		for(Object[] beanAsideNew1:beanAsideNew) {
			System.out.println(((BlogBean)beanAsideNew1[0]).getBlogReleaseTime());
		}
//		System.out.println("beanAsideHot = " + beanAsideHot);
//		System.out.println("beanAsideNew = " + beanAsideNew);
		
		model.addAttribute("result", beanMain);
		model.addAttribute("result2", beanAsideHot);
		model.addAttribute("result3", beanAsideNew);
		model.addAttribute("search", search);
		model.addAttribute("newhot", newhot);
		if(beanMain==null) {
			System.out.println("!!!!");
			return "errorPage1";
		}
		return "okPage1";
	}
	
	
	//BlogIndex用
	@RequestMapping(path= {"/Blog/BlogIndexNav.controller"})
	@ResponseBody
	public List<BlogBean> forNavLoad() {//預先載入Date使用

			System.out.println("run controller NAV");

			 List<BlogBean> select1 = blogService.selectByCityNav();


		return select1;	
	}
	//BlogIndex用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogIndexFirstOnload2.controller"})
	@ResponseBody
	public List<Object[]> forFirstLoad2() {//預先載入使用
		System.out.println("run controller WWWWWWWW");
		List<Object[]> main = blogService.selectByInput("台灣", "1",6,"hot");
		List<Object[]> mainAsideNew = blogService.selectByInput(null,"1",4,"new");
		List<Object[]> mainAsideHot = blogService.selectByInput(null,"1",4,"hot");
		
		main.addAll(mainAsideNew);
		main.addAll(mainAsideHot);
//		System.out.println("main = "+main);
		return main;	
	}
	
	//BlogNew用-----------------------------------------------------------
		@RequestMapping(path= {"/Blog/BlogNew.controller"},method={RequestMethod.POST})
		public String forNewBlog(
				Model model,
				@ModelAttribute(name="form")BlogBean blogBean,BindingResult bindingResult
//				@SessionAttribute(name="memberID")BlogBean memberID,
//				@RequestParam(value="memberID",required = false)Integer memberID,
//				@RequestParam("memberID")String memberID,
//				@RequestParam("blogCover") MultipartFile blogCover,
//				@RequestParam("summernote") String summernote,
//				@RequestParam("blogSNum")Integer blogSNum
				) {
//				Integer mID = Integer.valueOf(memberID);
				System.out.println("run controller NEW~~");
//				System.out.println("memberID = "+memberID);
				System.out.println("blogBean now = "+blogBean);
//				System.out.println("summernote = "+summernote);
				
//				try {
//					System.out.println("blogCover = "+blogCover.getBytes());
//				} catch (IOException e) {
//					// TODO Auto-generated catch block
//					e.printStackTrace();
//				}
				
				if(blogBean.getBlogSNum()!=null && !"".equals(blogBean.getBlogSNum())) {
					blogBean.setBlogSNum(blogBean.getBlogSNum());
				}
				
				if(blogBean.getBlogReleaseTime()==null||"".equals(blogBean.getBlogReleaseTime())) {
					blogBean.setBlogReleaseTime(new java.util.Date());
				}
				
				blogBean.setUpdateTime(new java.util.Date());
				blogBean.setBlogVisibility(1);
//				blogBean.setBlogCity(blogBean.getBlogCity());
				blogBean.setBlogContext(blogBean.getBlogContext());
				System.out.println("Cover = "+blogBean.getBlogCover());
//				System.out.println("Cover = "+blogBean.getBlogCover().length);
				if(blogBean.getBlogCover().length==0) {
					BlogBean pic = blogService.selectByPk(blogBean.getBlogSNum());
					blogBean.setBlogCover(pic.getBlogCover());
					blogBean.setBlogCover(blogBean.getBlogCover());			
				}
				
//				blogBean.setBlogTitle(blogBean.getBlogTitle());
				System.out.println("BlogTitle = "+blogBean.getBlogTitle());
				blogBean.setBlogView(0);
				blogBean.setMemberID(blogBean.getMemberID());
				model.addAttribute("summernote", blogBean.getBlogContext());
//				blogService.insert(blogBean);
				blogService.saveUpdate(blogBean);
//				System.out.println("AAA = "+AAA);
			return "newPage1";	
		}
		
		
	
	//未使用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogIndexFirstOnload.controller"})
	@ResponseBody
	public List<Object[]> forFirstLoad() {//預先載入使用
		System.out.println("run controller 2222");
//		if(page==null) {
//			BlogBean bb=new BlogBean();
//			bb.setBlogCity("台中");		
//			System.out.println("beanCITY="+bean.getBlogCity());
//			List<BlogBean> bean1 = blogService.selectByCity(bb,1);
			List<Object[]> select = blogService.selectByNation("台灣",1);			
//			for( Object[] select1:select) {
//				System.out.println("select1 = "+(CityBean)select1[1]);
//			}
//		}
		return select;	
	}
	
	//未使用-----------------------------------------------------------
	@RequestMapping(path= {"/Blog/BlogIndexDate2222.controller"})
	@ResponseBody
	public List<Object[]> forFirstLoadDate() {//預先載入Date使用
		
//		if(page==null) {
//			BlogBean bb=new BlogBean();
//			bb.setBlogCity("台中");
			System.out.println("run controller 33333");
//			System.out.println("beanCITY="+bean.getBlogCity());
			 List<Object[]> select1 = blogService.selectByNationDate("台灣",1);
//			 for( Object[] select11:select1) {
//					System.out.println("select1 = "+(BlogBean)select11[0]);
//				}
//			System.out.println("bean1="+bean1);
//		}

		return select1;	
	}
	//未使用-----------------------------------------------------------
		@RequestMapping(path= {"/Blog/BlogIndexNONE.controller"})
		public String forSubmitNONE(//String傳入使用
//				BlogBean bean,BindingResult bindingResult,
				String search,
				String page,
				String newhot,
				Model model) {
			System.out.println("run controller1111");
			System.out.println("page = " + page);
			System.out.println("search = " + search);
			System.out.println("newhot = " + newhot);
			
			List<Object[]> beanMain = blogService.selectByInput(search, page,6,newhot);
			List<Object[]> beanAsideHot = blogService.selectByInput(null,"1",4,"hot");
			List<Object[]> beanAsideNew = blogService.selectByInput(null,"1",4,"new");
//			for(Object[] beanAsideHot1:beanAsideHot) {
//				System.out.println((BlogBean)beanAsideHot1[0]);
//			}
			for(Object[] beanAsideHot1:beanAsideHot) {
			System.out.println(((BlogBean)beanAsideHot1[0]).getBlogView());
		}
			for(Object[] beanAsideNew1:beanAsideNew) {
				System.out.println(((BlogBean)beanAsideNew1[0]).getBlogReleaseTime());
			}
//			System.out.println("beanAsideHot = " + beanAsideHot);
//			System.out.println("beanAsideNew = " + beanAsideNew);
			
			model.addAttribute("result", beanMain);
			model.addAttribute("result2", beanAsideHot);
			model.addAttribute("result3", beanAsideNew);
			model.addAttribute("search", search);
			model.addAttribute("newhot", newhot);
			if(beanMain==null) {
				System.out.println("!!!!");
				return "errorPage1";
			}

//			if(!"".equals(search)&&page==null) {
//				List<Object[]> bean1 = blogService.selectByNation(search,1);	
//				model.addAttribute("result", bean1);
//				model.addAttribute("search", search);
//				List<Object[]> bean3 = blogService.selectByNation("台灣",1);	
//				model.addAttribute("result3", bean3);
//				List<Object[]> bean2 = blogService.selectByNationDate("台灣",1);
//				model.addAttribute("result2", bean2);
//				if(bean1==null) {
//					System.out.println("!!!!");
//					return "errorPage1";
//				}
//				System.out.println("?????");
//			}
//			else if("".equals(search)&&page!=null) {
//				BlogBean bb=new BlogBean();
//				List<Object[]> bean1 = blogService.selectByNation("台灣",Integer.valueOf(page));	
//				model.addAttribute("result", bean1);
//				List<Object[]> bean2 = blogService.selectByNationDate("台灣",Integer.valueOf(page));
//				model.addAttribute("result2", bean2);
//				List<Object[]> bean3 = blogService.selectByNation("台灣",Integer.valueOf(page));	
//				model.addAttribute("result3", bean3);
//			}
//			else if(!"".equals(search)&&page!=null) {
	//
//				List<Object[]> bean1 = blogService.selectByNation(search,Integer.valueOf(page));
//				model.addAttribute("result", bean1);
//				model.addAttribute("search", search);
//				List<Object[]> bean3 = blogService.selectByNation("台灣",Integer.valueOf(page));	
//				model.addAttribute("result3", bean3);
//				List<Object[]> bean2 = blogService.selectByNationDate("台灣",Integer.valueOf(page));
//				model.addAttribute("result2", bean2);
//				
//			}
//			if("new".equals(newhot)) {
//				List<Object[]> newbean = blogService.selectByNation("台灣",1);	
//				model.addAttribute("newPage", newbean);
//				model.addAttribute("newhot", newhot);
//				System.out.println("newhotEEEEEEEE = " + newhot);
//			}
			return "okPage1";
		}
}
