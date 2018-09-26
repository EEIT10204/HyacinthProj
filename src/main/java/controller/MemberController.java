package controller;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonElement;

import model.ActBean;
import model.ActDAO;
import model.MemberBean;
import model.MemberDAO;
import model.MembershipBean;
import model.MembershipDAO;
import model.NoticeBean;
import model.NoticeDAO;
import model.NoticeService;
import model.SubMemberBean;
import model.SubMemberDAO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MembershipDAO membershipDAO;
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private SubMemberDAO subMemberDAO;
	@Autowired
	private ActDAO actDAO;
	@Autowired
	private MembershipDAO memberShipDAO;
	@Autowired
	private SessionFactory sessionFactory;
	@Autowired
	private NoticeDAO noticeDAO;

	public Session getSession() {
		return sessionFactory.getCurrentSession();
	}
	
	
	@RequestMapping(path = { "/ProfilePageGet"})
	public String profileMemberGet( @RequestParam("memberID")Integer memberID, 
									@RequestParam(value="lmi" , required=false)Integer lmi,
									@RequestParam(value="page" , required=false)String page,
									Model model) {
		//lmi = login memberID
//		System.out.println("run MemberGetcontroller");
//		System.out.println("memberID:"+memberID);
//		System.out.println("lmi:"+lmi);
		
		if(!memberID.equals(lmi)) {
		MemberBean bean = memberDAO.findByPK(memberID);
		SubMemberBean subBean = subMemberDAO.findByPK(memberID);
		model.addAttribute("subUserInfo",subBean);
		model.addAttribute("userInfo",bean);
		List<MemberBean> friendList = membershipDAO.selectWhoIsMyFriend(memberID);
		int friendCount = friendList.size();
		model.addAttribute("friendCount",friendCount);
		model.addAttribute("friendList",friendList);
//		System.out.println("會員 "+ bean.getMemberName()+" 的好友列表: "+friendList);
//		System.out.println("GO MEMBER_PAGE");
		return "forwardProfileMember";
		}else {
			if("".equals(page)!=true&&page.length()!=0) {
				if("main".equals(page)) {
//					System.out.println(page);
					model.addAttribute("page","main");
				}else if("notice".equals(page)) {
//					System.out.println(page);
					model.addAttribute("page","notice");
				}
			}
			MemberBean bean = memberDAO.findByPK(lmi);
			SubMemberBean bean2 = subMemberDAO.findByPK(lmi);
			model.addAttribute("userInfo",bean);
			model.addAttribute("subInfo",bean2);
			List<MemberBean> friendList = membershipDAO.selectWhoIsMyFriend(lmi);
			int friendCount = friendList.size();
			model.addAttribute("friendCount",friendCount);
			model.addAttribute("friendList",friendList);
//			if(notice!=null) {
//				List<NoticeBean> noticeList=noticeService.selectMyNotice(lmi);
//				int count = noticeList.size();
//				System.out.println("通知筆數"+count);
//				model.addAttribute("noticeList",noticeList);
//				model.addAttribute("noticeCount",count);
//				return "forwardProfileSelf";
//			}
//			model.addAttribute("noticeCount",0);
//			System.out.println("會員 "+ bean.getMemberName()+" 的好友列表: "+friendList);
//			System.out.println("GO SELF_PAGE");
			return "forwardProfileSelf";
			
		}
	}
	@RequestMapping(path= {"/actPrivew"},
			produces = {"application/json;charset=UTF-8"})
	@ResponseBody
	public String showActPreview(@RequestParam String actSNum) {
		int intactSNum = Integer.parseInt(actSNum);
		ActBean actResult = actDAO.selectByPK(intactSNum);
		Gson beanToJson = new GsonBuilder().create();
		JsonElement jsonTree = beanToJson.toJsonTree(actResult);
		jsonTree.getAsJsonObject().addProperty("actPhotoToBase64",actResult.getActPhotoToBase64());
		String json = beanToJson.toJson(jsonTree);
		return json;
	}
	
	@RequestMapping(path = { "/getFriendRequest" })
	@ResponseBody
	public String getFriendRequest(@RequestParam String memberID) {
		int intmemberID = Integer.parseInt(memberID);
		MembershipBean temp = new MembershipBean();
		for(int i = 11 ; i<16 ; i++) {
			if(i>11) {
				this.getSession().beginTransaction();
			}
			temp.setMemberID_B(intmemberID);
			temp.setMemberID_A(i);
			memberShipDAO.sendFriendRequest(temp);
			NoticeBean notice = new NoticeBean();
			MemberBean member = new MemberBean();
			member = memberDAO.findByPK(i);
			notice.setMemberID_Sender(i);
			notice.setMemberID_Receiver(intmemberID);
			notice.setMessegeContent(member.getMemberName() +"寄送了一則交友邀請給您");
			notice.setIsRead(false);
			notice.setNoticeTime(new Date());
			noticeDAO.insertNotice(notice);
			this.getSession().getTransaction().commit();
		}		
		return "success";
	}
	@RequestMapping(path = { "/getActRequest" })
	@ResponseBody
	public String getActRequest(@RequestParam String memberID) {
		for(int i = 9 ; i<11 ; i++) {
			if(i>9) {
				this.getSession().beginTransaction();
			}
		int intmemberID = Integer.parseInt(memberID);
		NoticeBean notice = new NoticeBean();
		MemberBean member = new MemberBean();
		member = memberDAO.findByPK(i+2);
		notice.setMemberID_Sender(i+2);
		notice.setMemberID_Receiver(intmemberID);
		notice.setMessegeContent(member.getMemberName() +"寄送了一則活動邀請給您");
		notice.setIsRead(false);
		notice.setNoticeTime(new Date());
		notice.setActSNum(i);
		noticeDAO.insertNotice(notice);
		this.getSession().getTransaction().commit();
		}
		return "success";
	}
//	@RequestMapping(path = { "/ProfileNoticeGet"})
//	public String profileNoticeGet( @RequestParam("memberID")Integer memberID, 
//									@RequestParam(value="lmi" , required=false)Integer lmi,
//									@RequestParam("notice")Integer notice,Model model) {
//		MemberBean bean = memberDAO.findByPK(lmi);
//		model.addAttribute("userInfo",bean);
//		List<MemberBean> friendList = membershipDAO.selectWhoIsMyFriend(lmi);
//		model.addAttribute("friendList",friendList);
//		System.out.println("friendList:"+friendList);
//		System.out.println("GO SELF_PAGE & change class");
//		model.addAttribute("notice",5);
//		
//		return "forwardProfileSelf";
//		
//	}
}
//	@RequestMapping(path = { "/Member/ProfileSelfGet" })
//	public String profileSelfGet(@RequestParam String memberID,Model model) {
//		System.out.println("memberID:"+memberID);
//		Integer intMemberID = Integer.parseInt(memberID);
//		MemberBean bean = memberDAO.findByPK(intMemberID);
//		model.addAttribute("userInfo",bean);
//		System.out.println("userInfo="+bean);
//		List<MemberBean> friendList = membershipDAO.selectWhoIsMyFriend(intMemberID);
//		model.addAttribute("friendList",friendList);
//		System.out.println("friendList:"+friendList);
//		return "forwardProfileSelf";
//	}


