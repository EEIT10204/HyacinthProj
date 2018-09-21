package controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import model.MemberBean;
import model.MemberDAO;
import model.MembershipBean;
import model.MembershipDAO;
import model.MembershipService;
import model.NoticeBean;
import model.NoticeDAO;

@Controller
public class FriendController {
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private MembershipService membershipService;
	@Autowired
	private MembershipDAO membershipDAO;
	@Autowired
	private NoticeDAO noticeDAO;
	@Autowired
	private MemberDAO memberDAO;
	
	@RequestMapping(path = { "/checkFriendShipController" }) //OK
	@ResponseBody
	public Map<String,String> checkFriendShip(String memberID,String lmi){
		MembershipBean membershipBean = new MembershipBean();
		System.out.println("checkFriend");
		Map<String, String> status = new HashMap<>();
		int intmemberID = Integer.parseInt(memberID);
		System.out.println(intmemberID);
		membershipBean.setMemberID_B(intmemberID);
		if(lmi.length()==0||""==lmi) {
			return null;
		}else {
			int intlmi = Integer.parseInt(lmi);
			membershipBean.setMemberID_A(intlmi);
			MembershipBean reverseBean = new MembershipBean();
			reverseBean.setMemberID_A(intmemberID);
			reverseBean.setMemberID_B(intlmi);
			if(membershipDAO.checkSame(membershipBean)) {
				if(membershipDAO.checkSame(reverseBean)) {
					status.put("status", "好友");
				}else {
					status.put("status", "已傳送邀請");
				}
			}else {
				if(membershipDAO.checkSame(reverseBean)) {
					status.put("status", "是否接受好友邀請");
				}else {
					status.put("status", "非好友");
				}
			}
		}
		return status;		
	}
	
	@RequestMapping(path = { "/deleteFriendController" })//OK
	@ResponseBody
	public Map<String,String> deleteFriend(@RequestParam String memberID, @RequestParam String lmi) {
		System.out.println("run deleteFriendController");
		Map<String, String> status = new HashMap<>();
		MembershipBean membershipBean = new MembershipBean();
		int intmemberID = Integer.parseInt(memberID);
		membershipBean.setMemberID_B(intmemberID);
		if(lmi.length()==0||""==lmi) {
			return null;
		}else {
			int intlmi = Integer.parseInt(lmi);
			membershipBean.setMemberID_A(intlmi);
			membershipService.deleteFriend(membershipBean);
			status.put("status", "刪除成功");
		}
		return status;
	}
	
	@RequestMapping(path = { "/sendFriendReqController" })  //OK
	@ResponseBody
	public Map<String, String> sendFriendReq(@RequestParam String memberID, @RequestParam String lmi) {
		System.out.println("run sendFriendReqController");
		Map<String, String> status = new HashMap<>();
		MembershipBean membershipBean = new MembershipBean();
		int intmemberID = Integer.parseInt(memberID);
		membershipBean.setMemberID_B(intmemberID);
		
		if(lmi.length()==0||""==lmi) {
			return null;
		}else {
			int intlmi = Integer.parseInt(lmi);
			membershipBean.setMemberID_A(intlmi);
			Boolean result = membershipDAO.checkSame(membershipBean);
			System.out.println("result="+result);
			if(!result) {
				membershipService.sendFriendRequest(membershipBean);
				status.put("status", "寄送邀請成功");
				//新增通知
				NoticeBean notice = new NoticeBean();
				MemberBean member = new MemberBean();
				member = memberDAO.findByPK(intlmi);
				notice.setMemberID_Sender(intlmi);
				notice.setMemberID_Receiver(intmemberID);
				notice.setMessegeContent(member.getMemberName() +"寄送了一則交友邀請給您");
				notice.setIsRead(false);
				notice.setNoticeTime(new Date());
				noticeDAO.insertNotice(notice);
				
				return status;
			}else {
				status.put("status", "寄送邀請失敗 有重複資料");
				return status;
			}
		}
	}
	@RequestMapping(path = { "/answerFriendReqController" })
	@ResponseBody
	public Map<String, String> answerFriendRequest(@RequestParam String memberID, @RequestParam String lmi) {
		Map<String, String> status = new HashMap<>();
		int intmemberID = Integer.parseInt(memberID);
		int intlmi = Integer.parseInt(lmi);
		MembershipBean bean = new MembershipBean();
		bean.setMemberID_A(intmemberID);
		bean.setMemberID_B(intlmi);
		Boolean result = membershipDAO.checkSame(bean);
		if(result) {
			bean.setMemberID_A(intlmi);
			bean.setMemberID_B(intmemberID);
			membershipService.sendFriendRequest(bean);
			status.put("status", "回覆交友邀請成功");
			return status;
		}else {
			status.put("status", "無此交友邀請");
			return status;
		}
	}
	
	@RequestMapping(path = { "/showFriendList.controller" })
	public String showFriendList(MembershipBean bean,BindingResult bindingResult,Model model) {
		List<MemberBean> friendList = membershipService.friendList(bean.getMemberID_A());
		int friendCount = friendList.size();
		model.addAttribute("friendCount",friendCount);
		model.addAttribute("friendList",friendList);
		System.out.println("好友列表:"+friendList);
		return "forwardTEST";
	}
	
	@RequestMapping(path = { "/rejectFriendReqController" })
	@ResponseBody
	public Map<String, String> rejectFriendRequest(@RequestParam String memberID, @RequestParam String lmi) {
		Map<String, String> status = new HashMap<>();
		MembershipBean membershipBean = new MembershipBean();
		int intmemberID = Integer.parseInt(memberID);
		membershipBean.setMemberID_B(intmemberID);
		
		if(lmi.length()==0||""==lmi) {
			return null;
		}else {
			int intlmi = Integer.parseInt(lmi);
			membershipBean.setMemberID_A(intlmi);
			membershipService.deleteFriend(membershipBean);
			status.put("status", "刪除邀請成功");
		}
		return status;
	}
	
	
	
	
	
}
