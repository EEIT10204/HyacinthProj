package controller;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.MemberBean;
import model.MemberService;
import model.SubMemberBean;
import model.SubMemberService;

@Controller
@SessionAttributes(names={"user","subInfo"})
public class MemberUpdateController {
	
	@Autowired
	private MemberService memberService;
	
	@Autowired
	private SubMemberService subMemberService;
	
	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
//		webDataBinder.registerCustomEditor(Byte[].class,new ByteArrayMultipartFileEditor());
		webDataBinder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
	}
	
	@RequestMapping(path={"/updateMember.controller"},method= {RequestMethod.POST})
//	@PostMapping(path={"/updateMember.controller"})
	public String updateMember(Model model,
//			@ModelAttribute(name="user") MemberBean user,BindingResult bindingResult2  //用ModelAttribute不知為何抓不到圖
 			@SessionAttribute(name="user") MemberBean user
 			,@ModelAttribute(name="form") MemberBean memberBean,BindingResult bindingResult
// 			,@RequestParam("memberName") String memberName
// 			,@RequestParam("memberMail") String memberMail
 			,@RequestParam("memberPic") MultipartFile memberPic
			) {
		System.out.println("updateMember.controller is called~");
//		System.out.println("user="+user);
//		System.out.println("memberBean="+memberBean);
//		System.out.println("bindingResult="+bindingResult);
//		System.out.println("memberName="+memberName);
//		System.out.println("memberMail="+memberMail);
//		System.out.println("input-memberPic="+memberPic.getSize());
//		System.out.println("memberBean-memberPic="+memberBean.getMemberPic().length);
//		System.out.println("user-memberPic="+user.getMemberPic().length);
		memberBean.setMemberID(user.getMemberID());
		memberBean.setMemberAccount(user.getMemberAccount());
		memberBean.setMemberPwd(user.getMemberPwd());
		if(memberBean.getMemberPic().length==0) {memberBean.setMemberPic(user.getMemberPic());}
//		System.out.println("memberBean="+memberBean);
		MemberBean result = memberService.updateProfile(memberBean);
//		System.out.println("result="+result);
		model.addAttribute("user",result);
		return "profile.page";	
	}	
	
	@RequestMapping(path={"/updateMemberBasic.controller"},method= {RequestMethod.POST})
	public String updateMemberBasic(Model model,
 			@SessionAttribute(name="user") MemberBean user
 			,@ModelAttribute(name="registrationForm") MemberBean memberBean,BindingResult bindingResult
 			,@RequestParam("memberPic") MultipartFile memberPic
			) {
		System.out.println("updateMemberBasic.controller is called~");
		memberBean.setMemberID(user.getMemberID());
//		memberBean.setMemberAccount(user.getMemberAccount());
//		memberBean.setMemberPwd(user.getMemberPwd());
//		System.out.println("input-memberPic="+memberPic.getSize());
//		System.out.println("memberBean-memberPic="+memberBean.getMemberPic().length);
		if(memberBean.getMemberPic().length==0) {memberBean.setMemberPic(user.getMemberPic());}
		MemberBean result = memberService.updateProfileBasic(memberBean);
		model.addAttribute("user",result);
		return "profileSelf.page";	
	}
	
	@RequestMapping(path={"/updateMemberPrivacy.controller"},method= {RequestMethod.POST})
	public String updateMemberPrivacy(Model model,
 			@SessionAttribute(name="user") MemberBean user
 			,@ModelAttribute(name="privacyForm") MemberBean memberBean,BindingResult bindingResult
			) {
		System.out.println("updateMemberPrivacy.controller is called~");
		memberBean.setMemberID(user.getMemberID());
		if(memberBean.getMemberPwd()==null || memberBean.getMemberPwd().length()==0) {memberBean.setMemberPwd(user.getMemberPwd());}
		MemberBean result = memberService.updateProfilePrivacy(memberBean.getMemberID(),memberBean.getMemberPwd(),memberBean.getMemberMail());
		model.addAttribute("user",result);
		return "profileSelf.page";	
	}
	
	@RequestMapping(path={"/sendMail.do"},method= {RequestMethod.GET})
	@ResponseBody
	public Map<String, String> sendMail(@SessionAttribute(name="user") MemberBean user) {
		System.out.println("sendMail called.");
		Map<String, String> test = new HashMap<>();

		MemberBean bean = memberService.sendVerificationMail(user);
		if(bean!=null) {
			test.put("result", "寄送驗證信成功");
		}else {
			test.put("result", "寄送驗證信失敗");
		}
		System.out.println("test="+test+",time="+new java.util.Date());
		return test;
	}
	
	@RequestMapping(path={"/verifyMail.do"},method= {RequestMethod.GET})
	public String verifyMail(String account,String code,Model model) {

		boolean result = memberService.verifyMail(account, code);
		System.out.println("account="+account+",code="+code+",result="+result+",time="+new java.util.Date());
		model.addAttribute("msg","信箱驗證");
		if(result) {
			return "verifySuccess.page";
		}
		return "verifyError.page";
	}
	
	
	@RequestMapping(path={"/updateSubMember.controller"},method= {RequestMethod.POST})
	public String updateSubMember(Model model
 			,@ModelAttribute(name="advancedForm") SubMemberBean subMemberBean,BindingResult bindingResult
 			,@RequestParam("memberCover") MultipartFile memberCover
			) {
		System.out.println("updateSubMember.controller is called~");
//		System.out.println("subMemberBean="+subMemberBean);
//		System.out.println("memberCover="+memberCover);
		if(subMemberBean.getMemberCover().length==0) {
			SubMemberBean oriBean = subMemberService.readSubMemberInfo(subMemberBean.getMemberID());
			if(oriBean!=null) {
				subMemberBean.setMemberCover(oriBean.getMemberCover());
			}
		}
		SubMemberBean result = subMemberService.updateSubMemberInfo(subMemberBean);
		model.addAttribute("subInfo",result);
		return "profileSelf.page";	
	}	
	
	
	
	

	
}
