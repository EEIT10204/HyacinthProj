package controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import model.MemberBean;
import model.MemberService;
import model.NoticeBean;
import model.NoticeService;

@RestController
@SessionAttributes(names = { "user"})
public class LoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	NoticeService noticeService;
	
	@RequestMapping(path = { "LoginController" })
	public String login(Model model, String memberAccount, String memberPwd) {
		
		HashMap<String, String> errors = new HashMap<>();
		model.addAttribute("errorMsgs", errors);
		
		MemberBean result = memberService.login(memberAccount,memberPwd);
		if(result==null) {
			errors.put("action", "login fail");		
		} else {
			model.addAttribute("user",result);
//			List<NoticeBean> noticeList = noticeService.selectMyNotice(result.getMemberID());
//				if(noticeList!=null) {
//					int noticeCount = noticeList.size();
//					System.out.println("noticeCountFirst="+noticeCount);
//					System.out.println("noticeListFirst="+noticeList);
//					errors.put("status", "findNoticeList");
//					model.addAttribute("noticeListFirst",noticeList);
//					model.addAttribute("noticeCountFirst",noticeCount);
//				}
			return "success";
		}
		return "error";
	}
	
	
	@RequestMapping(path = { "FBLoginController" })
	public String FBlogin(Model model, String userInfo) {
		System.out.println("run FBLoginController");
		System.out.println(userInfo);
		
		return userInfo;
		
	}
	
}
//@Controller
//public class LogoutController{
//	@RequestMapping(path = { "LogoutController"})
//	public String logout(SessionStatus sessionStatus) {
//		sessionStatus.setComplete();
//		System.out.println("Logout");
//		return "success";
//	}
//}
