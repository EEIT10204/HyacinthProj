package controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import model.MemberBean;
import model.MemberDAO;
import model.MembershipDAO;
import model.NoticeBean;
import model.NoticeService;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MembershipDAO membershipDAO;
	@Autowired
	private NoticeService noticeService;
	
	
	@RequestMapping(path = { "/ProfilePageGet"})
	public String profileMemberGet( @RequestParam("memberID")Integer memberID, 
									@RequestParam(value="lmi" , required=false)Integer lmi,
									@RequestParam(value="page" , required=false)String page,
									Model model) {
		//lmi = login memberID
		System.out.println("run MemberGetcontroller");
		System.out.println("memberID:"+memberID);
		System.out.println("lmi:"+lmi);
		
		if(!memberID.equals(lmi)) {
		MemberBean bean = memberDAO.findByPK(memberID);
		model.addAttribute("userInfo",bean);
		List<MemberBean> friendList = membershipDAO.selectWhoIsMyFriend(memberID);
		model.addAttribute("friendList",friendList);
		System.out.println("會員 "+ bean.getMemberName()+" 的好友列表: "+friendList);
		System.out.println("GO MEMBER_PAGE");
		return "forwardProfileMember";
		}else {
			if("".equals(page)!=true&&page.length()!=0) {
				if("main".equals(page)) {
					System.out.println(page);
					model.addAttribute("page","main");
				}else if("notice".equals(page)) {
					System.out.println(page);
					model.addAttribute("page","notice");
				}
			}
			MemberBean bean = memberDAO.findByPK(lmi);
			model.addAttribute("userInfo",bean);
			List<MemberBean> friendList = membershipDAO.selectWhoIsMyFriend(lmi);
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
			System.out.println("會員 "+ bean.getMemberName()+" 的好友列表: "+friendList);
			System.out.println("GO SELF_PAGE");
			return "forwardProfileSelf";
			
		}
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


