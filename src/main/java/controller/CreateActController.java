package controller;

import java.io.IOException;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.ActBean;
import model.MemberBean;
import model.TripBean;
import model.ViewPointBean;
import model.dao.ActDAOHibernate;
import model.dao.TripDAOHibernate;
import model.dao.ViewPointDAOHibernate;
@Controller
public class CreateActController {
	
	@Autowired
	private ActDAOHibernate actDAOHibernate;
	@Autowired
	private TripDAOHibernate tripDAOHibernate;
	@Autowired
	private ViewPointDAOHibernate  vPointDAOHibernate;
	
	@RequestMapping(path = { "/before.act.controller" })
	public String method(String actCreate, Model model, @SessionAttribute(name="user", required=false)MemberBean memberBean)
			throws ParseException, IOException {
	
		
		SimpleDateFormat nowdate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        nowdate.setTimeZone(TimeZone.getTimeZone("GMT+8"));
        actCreate = nowdate.format(new java.util.Date()); 
	
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Timestamp Date1 = new java.sql.Timestamp(sdf1.parse(actCreate).getTime());
		
//		 System.out.println("memberID=" + memberID);
			
//			if(memberBean.getMemberID()!= null) {
//				abean.setMemberID(memberBean.getMemberID());
//				
//			}
		 ActBean abean = new ActBean();
		 abean.setMemberID(memberBean.getMemberID());
		 abean.setActCreateDate(Date1);
//		 System.out.println("abean= " + abean);
//		 
		
		 actDAOHibernate.insert(abean);
		 
//		 ActBean result = actDAOHibernate.selectBymemberIDandcreateDate(abean);
//		
//		System.out.println("abean="+abean.toString());
		
		model.addAttribute("newEvent", abean);
		
		return "act.create";
	}
	 

	@RequestMapping(
			path={"/create.act.controller"}
			)	
	public String method( String actSTime, String EndTime, String DeadLine, Model model, ActBean abean, 
			TripBean tbean, BindingResult bindingResult, @SessionAttribute(name="user") MemberBean memberBean) throws ParseException, IOException {
		
		
		model.addAttribute("member",memberBean);
 
	
		ActBean actbean = actDAOHibernate.selectBymemberIDandcreateDate(abean);
	
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		Timestamp Date1 = new java.sql.Timestamp(sdf.parse(actSTime).getTime());
		Timestamp Date2 = new java.sql.Timestamp(sdf.parse(EndTime).getTime());
		Timestamp Date3 = new java.sql.Timestamp(sdf.parse(DeadLine).getTime());

	
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
		java.util.Date start = df.parse(actSTime);
		java.util.Date finish = df.parse(EndTime);
		
		int dur = (int)((finish.getTime()-start.getTime()) / (1000*3600*24));
		
		Calendar date = Calendar.getInstance();
        date.setTimeInMillis(System.currentTimeMillis());
        Calendar begin = Calendar.getInstance();
        Calendar end = Calendar.getInstance();
        
        begin.setTime(Date1);
        end.setTime(Date2);
        
//
        if (date.after(begin) && date.before(end)) {
        	actbean.setActStatus("inProgress");
        } else if(date.after(end)){
        	actbean.setActStatus("finished");
        }else if(date.before(begin)){
        	actbean.setActStatus("prepared");
        }
//		
        
        
        actbean.setActCity(abean.getActCity());
        actbean.setActIntro(abean.getActIntro());
        actbean.setActPhoto(abean.getActPhoto());
        actbean.setActTitle(abean.getActTitle());
        actbean.setActView(abean.getActView());
        actbean.setActVisibility(abean.getActVisibility());
        actbean.setPayment(abean.getPayment());
        actbean.setParticipantsNow(abean.getParticipantsNow());
        actbean.setMaxParticipants(abean.getMaxParticipants());
        actbean.setMinParticipants(abean.getMinParticipants());
        actbean.setBudget(abean.getBudget());
        actbean.setActStartTime(Date1);
        actbean.setActEndTime(Date2);
        actbean.setActJoinDeadLine(Date3);
        actbean.setActDuration(dur);
	     
	    actDAOHibernate.insert(actbean);
	    
	    ActBean result = actDAOHibernate.selectByActID(actbean);
			System.out.println("result="+result);
			//TripBean tbean

//			
            List<TripBean> trip = tripDAOHibernate.select(actbean.getActSNum());		
            
            System.out.println("trip=" +trip);
  	
   	
            ViewPointBean vbean;
            ArrayList<ViewPointBean> beanbean = new ArrayList<ViewPointBean>();
            for( TripBean index : trip ) {
        		
            	Integer viewpointid = index.getViewPointID();
    			
            	vbean = vPointDAOHibernate.select(viewpointid);
            	
                      	
            	beanbean.add(vbean);

//            	System.out.println("beanbean=" + beanbean.toString());
            	model.addAttribute("beanbean", beanbean);
//
            }
            

			model.addAttribute("event", result );
			model.addAttribute("trip", trip );
			
					
			return "act.display";
			

	}
	
}
