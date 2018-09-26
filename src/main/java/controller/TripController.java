package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
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
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.ActBean;
import model.TripBean;
import model.TripService;
import model.ViewPointBean;
import model.dao.ActDAOHibernate;
import model.dao.TripDAOHibernate;


@Controller
public class TripController {

	@Autowired
	TripService tripService;
	@Autowired
	TripDAOHibernate tripDAOHibernate;
	@Autowired
	ActDAOHibernate actDAOHibernate;

	@RequestMapping(path = { "/trip.Controller" })
	@ResponseBody
	public TripBean[] method(@RequestBody String jsonsave,  TripBean bean, ActBean abean, BindingResult binfingResult, Model model,
			String action) throws JsonParseException, JsonMappingException, IOException {
		Gson BeanToJson = new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm").create();
		Gson JsonToBean=  new GsonBuilder().setDateFormat("yyyy-MM-dd'T'HH:mm").create();
//		System.out.println("jsonsave= " + jsonsave);
		TripBean[] result = JsonToBean.fromJson(jsonsave, TripBean[].class);
		
		ObjectMapper mapper = new ObjectMapper(); 
		TripBean[] tbean = mapper.readValue(jsonsave, TripBean[].class);
		for( TripBean index : tbean ) {
		
//			System.out.println(index); 
			 tripDAOHibernate.insert(index);
		}
		
		return  tbean;
		}
	
	

}



