package controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.MemberActBean;
import model.MemberBean;
import model.MembershipBean;
import model.ViewPointBean;
import model.ViewPointService;
import model.dao.MemberActDAOHibernate;
import model.dao.MemberDAOHibernate;
import model.dao.MembershipDAOHibernate;

@Controller
public class InviteYourFriendsController {

	@Autowired
	MemberDAOHibernate memberDAOHibernate;
	@Autowired
	MembershipDAOHibernate membershipDAOHibernate;
	

 
	@RequestMapping(path = { "/invitefriends.controller" })
	@ResponseBody
	public  List<MemberBean> method(@RequestBody String json, Model model,  BindingResult bindingResult) {
		Gson BeanToJson = new Gson();
		Gson JsonToBean = new GsonBuilder().create(); 
		
		MemberBean result = JsonToBean.fromJson(json, MemberBean.class);
//		System.out.println("result= " + result);
//		System.out.println("json= " + json);
		
		
		List<MemberBean> result1 = membershipDAOHibernate.selectWhoIsMyFriend(result.getMemberID());
		
		
		model.addAttribute("friends",result1);
		return result1;
		
		
}
	

}