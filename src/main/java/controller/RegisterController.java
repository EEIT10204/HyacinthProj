package controller;


import java.text.SimpleDateFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.MemberBean;
import model.MemberService;

@Controller
@SessionAttributes(names = { "user" })
public class RegisterController {

	@Autowired
	private MemberService memberService;
	
	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	
		webDataBinder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
		 
	}
	
	@RequestMapping(path = { "RegistController" })
	public String register( Model model,MemberBean memberBean,BindingResult bindingResult) {
		
		MemberBean bean = memberService.register(memberBean);
		System.out.println("Controller"+bean);
			model.addAttribute("user", bean);
			return "redirectIndex";

	}
	

}
