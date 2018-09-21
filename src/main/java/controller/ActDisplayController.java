package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.ActBean;
import model.MemberActBean;
import model.MemberBean;
import model.TripBean;
import model.ViewPointBean;
import model.dao.ActDAOHibernate;
import model.dao.MemberActDAOHibernate;
import model.dao.MemberDAOHibernate;
import model.dao.TripDAOHibernate;
import model.dao.ViewPointDAOHibernate;

@Controller
public class ActDisplayController {

	@Autowired
	private ActDAOHibernate actDAOHibernate;
	@Autowired
	private TripDAOHibernate tripDAOHibernate;
	
	@Autowired
	private ViewPointDAOHibernate vPointDAOHibernate;
	@Autowired
	private MemberActDAOHibernate memberActDAOHibernate;	
	@Autowired
	private MemberDAOHibernate memberDAOHibernate;
	
	@RequestMapping(
			path={"/actdisplay.controller"}
			)
	public String method( Model model, @RequestParam Integer actSNum , @SessionAttribute(name="user" ,required=false) MemberBean memberBean) throws JsonParseException, JsonMappingException, IOException {
			int id = memberBean.getMemberID();
		
	   MemberActBean temp1 = new MemberActBean();
	    temp1.setMemberID(id); 
		temp1.setActSNum(actSNum);
		temp1.setIsLike(null);
		temp1.setIsAttend(null);
		
		MemberActBean NowYourAct = memberActDAOHibernate.select(temp1);
		model.addAttribute("memberAct" , NowYourAct);
//		if(NowYourAct.getIsLike()==null&&NowYourAct.getIsAttend()==null) {
//			model.addAttribute("likeStatus","like");
//			
//		}\
//		if(NowYourAct.getIsLike()) {
//			model.addAttribute("likeStatus","like");
//		}else {
//			model.addAttribute("likeStatus","dislike");
//		}
//		
//		if(NowYourAct.getIsAttend()) {
//			model.addAttribute("attendStatus","attend");
//		}else {
//			model.addAttribute("attendStatus","disattend");
//		}
//		
        ActBean abean = actDAOHibernate.selectByPK(actSNum);
	    List<TripBean> trip = tripDAOHibernate.select(abean.getActSNum());		
         
     
         ViewPointBean vbean;
         ArrayList<ViewPointBean> beanbean = new ArrayList<ViewPointBean>();
         
         for( TripBean index : trip ) {
     		
         	Integer viewpointid = index.getViewPointID();
 			
         	vbean = vPointDAOHibernate.select(viewpointid);
         	
                   	
         	beanbean.add(vbean);
         	model.addAttribute("beanbean", beanbean);
// 
         }
         

			model.addAttribute("event", abean );
			model.addAttribute("trip", trip );
			
			abean.getMemberID();
		
			 MemberBean mbean = memberDAOHibernate.findByPK(abean.getMemberID());
		
			 model.addAttribute("member",mbean);
			 
			 return "act.display"; 
}
	
}
