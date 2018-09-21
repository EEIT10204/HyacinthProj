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
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import model.ViewPointBean;
import model.ViewPointService;

@Controller
public class ViewPointController {

	@Autowired
	ViewPointService viewPointService;

	@RequestMapping(path = { "/viewPoint.Controller" })
	@ResponseBody
	public List<ViewPointBean> method(@RequestBody String jsonsearch,  ViewPointBean bean, BindingResult binfingResult, Model model,
			String action) throws JsonParseException, JsonMappingException, IOException {

		Gson BeanToJson = new Gson(); 
		Gson JsonToBean = new GsonBuilder().create();
		ViewPointBean result1 = JsonToBean.fromJson(jsonsearch, ViewPointBean.class);
		jsonsearch = BeanToJson.toJson(result1); 

		ObjectMapper mapper = new ObjectMapper(); 
		ViewPointBean vbean = mapper.readValue(jsonsearch, ViewPointBean.class);
		System.out.println(vbean);
		
		if((vbean.getViewPointName()!= null && !"".equals(vbean.getViewPointName())) ||
				 vbean.getViewPointCity() != null || vbean.getViewPointType() != null) {
			List<ViewPointBean> results = viewPointService.selectByCondition(vbean);
			
			 return results; 
			
		}
		return null;
		


	}
}
