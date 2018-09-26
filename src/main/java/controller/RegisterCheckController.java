package controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.MemberBean;
import model.MemberDAO;
import model.MemberService;

@RestController
@SessionAttributes(names = { "user" })
public class RegisterCheckController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping(path = { "/register.controller" })
	public String register( Model model,MemberBean memberBean,BindingResult bindingResult) {
		MemberBean bean = memberService.register(memberBean);
//		System.out.println("Controller"+bean);
			model.addAttribute("memberID", bean.getMemberID());
			model.addAttribute("memberName", bean.getMemberName());
			return "redirectIndex";

	}
	
	@RequestMapping(path = {"memberAccountCheck"})
	public String checkAccount(String memberAccount,Model model)  {
//		System.out.println("controller_checkAccount:"+memberAccount);
		MemberBean temp = memberDao.findByAccount(memberAccount);
//		System.out.println("temp :"+temp);
		if(memberAccount.length()==0||temp!=null){
			return "error";
		}else {
			return "success";
		}
	}
	@RequestMapping(path = {"memberMailCheck"})
	public String checkMail(String memberMail) {
//		System.out.println("controller_checkEmail:"+memberMail);
		MemberBean temp1 = memberDao.findByMail(memberMail);
//		System.out.println("temp1 :"+temp1);
		if(memberMail.length()==0||temp1!=null) {
			return "error";
		}else {
			return "success";
		}
	}
}
