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
		if (memberBean==null) {
			
			model.addAttribute("likebottuntype","none");	
			model.addAttribute("attendbottuntype","none");	
		}else {
	   MemberActBean temp1 = new MemberActBean();
	    temp1.setMemberID(memberBean.getMemberID()); 
		temp1.setActSNum(actSNum);
		temp1.setIsLike(null);
		temp1.setIsAttend(null);
		MemberActBean NowYourAct = memberActDAOHibernate.select(temp1);
//		model.addAttribute("NowYourAct", NowYourAct);
		if(NowYourAct==null) {
			model.addAttribute("likebottuntype","Like");
			model.addAttribute("attendbottuntype","Attend");
		}else {
			
		
		if(NowYourAct.getIsLike()==null){
			model.addAttribute("likebottuntype","Like");
		}
		else{
			if(NowYourAct.getIsLike() == true)
				model.addAttribute("likebottuntype","disLike");
			else
				model.addAttribute("likebottuntype","Like");
		}// Like End
		
		if(NowYourAct.getIsAttend()==null){
			model.addAttribute("attendbottuntype","Attend");
		}else{
		   if(NowYourAct.getIsAttend()==true){
		       model.addAttribute("attendbottuntype","Attend");}
		   else 
			   model.addAttribute("attendbottuntype","disAttend");
		   }
		}
		//////////////////////////////////////////////
		Integer id = memberBean.getMemberID();
		model.addAttribute("userid",id);
		model.addAttribute("useractSNum",actSNum);
		
		}
		
		   
//		
        ActBean abean = actDAOHibernate.selectByPK(actSNum);
        
//        Object[] who = memberActDAOHibernate.findFollowsAttenders(abean.getActSNum());
//        System.out.println("who=" + who.toString());
        
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
