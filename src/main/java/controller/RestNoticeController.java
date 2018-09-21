package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.NoticeBean;
import model.NoticeService;

@Controller
@SessionAttributes(names = { "noticeCountFirst","noticeListFirst" })
public class RestNoticeController {
	@Autowired
	NoticeService noticeService;
	
	
	@RequestMapping(path = { "/getNotice" })
	@ResponseBody
	public Map<String,String> getFirstNotice( String memberID,Model model) {
		System.out.println("run RestNoticeController");
		int intmemberID = Integer.parseInt(memberID);
		List<NoticeBean> noticeList = noticeService.selectMyNotice(intmemberID);
		
		Map<String, String> status = new HashMap<>();
		if(noticeList!=null) {
			int noticeCount = noticeList.size();
			System.out.println("noticeCountFirst="+noticeCount);
			System.out.println("noticeListFirst="+noticeList);
			status.put("status", "findNoticeList");
			model.addAttribute("noticeListFirst",noticeList);
			model.addAttribute("noticeCountFirst",noticeCount);
			return status;
		}else {
			status.put("status", "NoNewNoticeList");
			return status;
		}
	}
	@RequestMapping(path = { "/updateNotice" })
	@ResponseBody
	public Map<String,String> updateNotice(@RequestParam String noticeID,Model model) {
		System.out.println("run updatNoticeRestController");
		int intNoticeID = Integer.parseInt(noticeID);
		Boolean result = noticeService.updateNotice(intNoticeID);
		Map<String, String> status = new HashMap<>();
		if(result) {
			status.put("status", "已讀");
			return status;
		}else {
			status.put("status", "失敗");
			return status;
		}
		
	}
	
}
