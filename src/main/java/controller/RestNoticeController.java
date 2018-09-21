package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.NoticeBean;
import model.NoticeService;

@Controller
public class RestNoticeController {
	@Autowired
	NoticeService noticeService;

	@RequestMapping(path = { "/getNotice" })
	@ResponseBody
	public Map<String, String> getFirstNotice(String memberID,
			 HttpSession session, Model model) {
		System.out.println("In seesion count: " + session.getAttribute("noticeCountFirst"));
//		List<NoticeBean> noticeListFirst = (List<NoticeBean>) session.getAttribute("noticeListFirst");
		Map<String, String> status = new HashMap<>();
		
			int intmemberID = Integer.parseInt(memberID);
			List<NoticeBean> noticeList1 = noticeService.selectMyNotice(intmemberID);
			if (noticeList1.size() != 0) {
				int noticeCount1 = noticeList1.size();
				System.out.println("DB notice count: " + noticeCount1);
//				System.out.println("noticeCountFirst(有SESSION)=" + noticeCount1);
//				System.out.println("noticeListFirst(有SESSION)=" + noticeList1);
				session.setAttribute("noticeListFirst", noticeList1);
				System.out.println("After session count: "+ session.getAttribute("noticeCountFirst"));
				status.put("count", String.valueOf(noticeCount1));
				status.put("status", "findNoticeList");
				return status;
			}else {
				session.setAttribute("noticeListFirst", noticeList1);
				status.put("status", "NoNewNoticeList");
				status.put("count", String.valueOf(0));
				return status;
			}
		
		}


	@RequestMapping(path = { "/updateNotice" })
	@ResponseBody
	public Map<String, String> updateNotice(@RequestParam String noticeID, Model model) {
		System.out.println("run updatNoticeRestController");
		int intNoticeID = Integer.parseInt(noticeID);
		Boolean result = noticeService.updateNotice(intNoticeID);
		Map<String, String> status = new HashMap<>();
		if (result) {
			status.put("status", "已讀");
			return status;
		} else {
			status.put("status", "失敗");
			return status;
		}

	}

}
