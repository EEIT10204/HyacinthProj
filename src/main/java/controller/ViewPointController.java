package controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;

import model.ViewPointBean;
import model.ViewPointService;

@Controller
public class ViewPointController {
	
	@Autowired
	ViewPointService viewPointService;
	@RequestMapping(
			path= {"/viewPoint.Controller"})
	public String method(ViewPointBean bean, BindingResult binfingResult,Model model, String action) {
		
		Map<String,String> errors = new HashMap<String,String>();
		
		if("Select".equals(action)) {
			System.out.println("Form bean: " + bean.toString());
			System.out.println("pointname: " + bean.getViewPointName().equals(""));
//|| !bean.getViewPointCity().equals(null) || !bean.getViewPointType().equals(null)
				if((bean.getViewPointName()!= null && !"".equals(bean.getViewPointName())) || bean.getViewPointCity() != null || bean.getViewPointType() != null) {				
					List<ViewPointBean> results = viewPointService.selectByCondition(bean);	
					model.addAttribute("selectResult",results);
					return "viewPoint.select";
				}
				else{  //selectAll					
					List<ViewPointBean> results = viewPointService.select(bean);	
					System.out.println("select All: " + results.get(0).getViewPointAddress());
					model.addAttribute("selectResult",results);
					return "viewPoint.select";
				}				
		}
		else if ("Insert".equals(action)) {
			System.out.println("Insert controller bean: " + bean.toString());

				if( bean.getViewPointName().length() == 0 || "".equals(bean.getViewPointName())) {					
					errors.put("name", "請輸入名稱");			
				}
				if (bean.getViewPointAddress().length() == 0 || "".equals(bean.getViewPointAddress())){
					errors.put("address", "請輸入地址");
				}
				if (bean.getViewPointCity() == null) {
					errors.put("city", "請選擇城市");
				}
				if(bean.getViewPointInfo() == null || bean.getViewPointInfo().length() == 0) {
					errors.put("info", "請輸入介紹");
				}
				if(bean.getViewPointType() == null) {
					errors.put("type", "請選擇類型");
				}
				
				if(!errors.isEmpty()) {  //輸入資料有誤，回傳錯誤訊息
					model.addAttribute("errors",errors);
					System.out.println("hass errors: " + errors.size());
					return "viewPoint.insert";	
				}
				else {  //輸入資料完整
					ViewPointBean result = viewPointService.insert(bean);  //試著insert資料
					
					if(result.equals(null)) {  //沒回傳值，已有重複資料，回傳錯誤訊息
						errors.put("name", "已有此筆資料");
						model.addAttribute("errors",errors);
						return "viewPoint.insert";				
					}
					else { //有回傳值，insert 成功
						errors.put("name", "資料新增成功");
						model.addAttribute("errors",errors);
						return "viewPoint.insert";						
					}
				}
		}  //Insert
		
		else if ("Update".equals(action)){
		
			if( bean.getViewPointName().length() == 0 || "".equals(bean.getViewPointName())) {					
				errors.put("name", "請輸入名稱");			
			}
			if (bean.getViewPointAddress().length() == 0 || "".equals(bean.getViewPointAddress())){
				errors.put("address", "請輸入地址");
			}
			if (bean.getViewPointCity() == null) {
				errors.put("city", "請選擇城市");
			}
			if(bean.getViewPointInfo() == null || bean.getViewPointInfo().length() == 0) {
				errors.put("info", "請輸入介紹");
			}
			if(bean.getViewPointType() == null) {
				errors.put("type", "請選擇類型");
			}
			
			if(!errors.isEmpty()) {  //輸入資料有誤，回傳錯誤訊息
				model.addAttribute("errors",errors);
				System.out.println("hass errors: " + errors.size());
				return "viewPoint.insert";	
			}
			else {  //輸入資料完整
				ViewPointBean result = viewPointService.update(bean);  //試著insert資料
				
				if(!result.equals(null)) {  //有回傳值，有找到該筆資料，嘗試update					
					errors.put("name", "資料更新成功");
					model.addAttribute("errors",errors);
					return "viewPoint.insert";							
				}
				else { //沒找到該筆資料，update失敗
					errors.put("name", "未找到此筆資料");
					model.addAttribute("errors",errors);
					return "viewPoint.insert";							
				}	
		}
	}
	return null;
	}
}
