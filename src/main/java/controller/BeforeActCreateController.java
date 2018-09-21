package controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.TimeZone;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import model.ActBean;
import model.MemberBean;
import model.dao.ActDAOHibernate;

@Controller
public class BeforeActCreateController {
	@Autowired
	ActDAOHibernate actDAOHibernate;

	@RequestMapping(path = { "/before.act.controller" })
	public String method(String actCreate, Model model, ActBean abean,@SessionAttribute(name="user") MemberBean memberBean, BindingResult bindingResult)
			throws ParseException, IOException {
				
		
		SimpleDateFormat nowdate = new java.text.SimpleDateFormat("yyyy-MM-dd HH:mm:ss"); 
        nowdate.setTimeZone(TimeZone.getTimeZone("GMT+8"));
        actCreate = nowdate.format(new java.util.Date()); 
	
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Timestamp Date1 = new java.sql.Timestamp(sdf1.parse(actCreate).getTime());
		
		 abean.setActCreateDate(Date1);
		
		ActBean result = actDAOHibernate.insert(abean);
		
		System.out.println("result="+result);
		
		model.addAttribute("newEvent", result);
		
		return "act.create";
	}
}
