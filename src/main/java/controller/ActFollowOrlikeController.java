package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.ActBean;
import model.MemberActBean;
import model.MembershipBean;
import model.TripBean;
import model.dao.ActDAOHibernate;
import model.dao.MemberActDAOHibernate;
import model.dao.TripDAOHibernate;

@Controller
public class ActFollowOrlikeController {
	
	@Autowired
	private ActDAOHibernate actDAOHibernate;
	@Autowired
	private TripDAOHibernate tripDAOHibernate;
	@Autowired
	private MemberActDAOHibernate memberActDAOHibernate;
	
	@RequestMapping(
			path={"/memberact.Controller"}
			)
	@ResponseBody
	public  MemberActBean method(@RequestBody String json, Model model,   BindingResult bindingResult, String select) {
		Gson BeanToJson = new Gson();
		Gson JsonToBean = new GsonBuilder().create();
		System.out.println("json= " + json);
		
		MemberActBean result = JsonToBean.fromJson(json, MemberActBean.class);
		System.out.println("result= " + result.toString());
		

		 MemberActBean memberAct = memberActDAOHibernate.select(result);
		if(memberAct == null) {
			
		MemberActBean insert = memberActDAOHibernate.insert(result);
	

		System.out.println("insert= " + insert);
		}else {
			if(result.getIsAttend()== null) {
				memberAct.setIsLike(result.getIsLike());
				MemberActBean update1 = memberActDAOHibernate.update(memberAct);
				System.out.println("update1= " + update1);
			}if(result.getIsLike()== null) {
				memberAct.setIsAttend(result.getIsAttend());
				MemberActBean update2 = memberActDAOHibernate.update(memberAct);
				System.out.println("update2= " + update2);
			}
			 

		
		}
		return result;
}
	
	@RequestMapping(path={"/answerActReqController"})
	@ResponseBody
	public Map<String, String> answerActReq(@RequestParam String memberID, @RequestParam String lmi,@RequestParam String actSNum){
		Map<String, String> status = new HashMap<>();
		int intmemberID = Integer.parseInt(memberID);
		int intlmi = Integer.parseInt(lmi);
		int inactSNum = Integer.parseInt(actSNum);
		MemberActBean bean = new MemberActBean();
		bean.setActSNum(inactSNum);
		bean.setIsAttend(true);
		bean.setMemberID(intmemberID);
		bean.setIsLike(false);
		memberActDAOHibernate.insert(bean);
		status.put("status", "回覆活動邀請成功");
		return status;
		
	}
	
}
