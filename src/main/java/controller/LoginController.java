package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.util.HashMap;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;

import model.MemberBean;
import model.MemberDAO;
import model.MemberService;
import model.NoticeService;
import model.SubMemberBean;
import model.SubMemberDAO;

@RestController
@SessionAttributes(names = { "user","subInfo"})
public class LoginController {
	@Autowired
	private MemberService memberService;
	@Autowired
	NoticeService noticeService;
	@Autowired
	SubMemberDAO subMemberDAO;
	@Autowired
	MemberDAO membeDAO;
	
	@RequestMapping(path = { "LoginController" })
	public String login(Model model, String memberAccount, String memberPwd) {
		
		HashMap<String, String> errors = new HashMap<>();
		model.addAttribute("errorMsgs", errors);
		
		MemberBean result = memberService.login(memberAccount,memberPwd);
		if(result==null) {
			errors.put("action", "login fail");		
		} else {
			Integer memberId = result.getMemberID();
			SubMemberBean subInfo = subMemberDAO.findByPK(memberId);
			model.addAttribute("user",result);
			model.addAttribute("subInfo",subInfo);
//			List<NoticeBean> noticeList = noticeService.selectMyNotice(result.getMemberID());
//				if(noticeList!=null) {
//					int noticeCount = noticeList.size();
//					System.out.println("noticeCountFirst="+noticeCount);
//					System.out.println("noticeListFirst="+noticeList);
//					errors.put("status", "findNoticeList");
//					model.addAttribute("noticeListFirst",noticeList);
//					model.addAttribute("noticeCountFirst",noticeCount);
//				}
			return "success";
		}
		return "error";
	}
	
	
	@RequestMapping(path = { "/fbController" })
	public String FBlogin( HttpServletRequest request , @RequestParam String fbToken , @RequestParam String memberMail , @RequestParam String memberName ,Model model) throws Exception {
		System.out.println("run FBLoginController");
		if(membeDAO.findByfbToken(fbToken)==null) {
			MemberBean mem = new MemberBean();
			mem.setFbToken(fbToken);
			mem.setMemberMail(memberMail);
			mem.setMemberName(memberName);
			mem.setMemberHierachy("Uncertified");
			mem.setMemberAccount("FB");
			mem.setMemberPwd("qwe123");
			mem.setMemberPic(null);
			MemberBean bean = memberService.register(mem);
			if (bean.getMemberPic() ==null) {
				String contexPath = request.getSession().getServletContext().getRealPath("/");
//				System.out.println(contexPath);
				File img = new File(contexPath + "/Images/Member/memberPic_default.png");
				byte[] byteToDB = fileToByte(img);
//				System.out.println("photoByte[] : " + byteToDB);
				bean.setMemberPic(byteToDB);
			}
			//新增預設MemberCover 
			SubMemberBean sub = new SubMemberBean();
			sub.setMemberID(bean.getMemberID());
			String contexPath = request.getSession().getServletContext().getRealPath("/");
			File img = new File(contexPath+"/Images/Member/memberCover_default.jpg");
			byte[] CoverToDB = fileToByte(img);
			sub.setMemberCover(CoverToDB);
			subMemberDAO.insert(sub);
			model.addAttribute("user",bean);
			return "success";
		}else {
			model.addAttribute("user",membeDAO.findByfbToken(fbToken));
			return "success";
		}
		
		
		
		
	}
	
	static byte[] bytes;
	public static byte[] fileToByte(File img) throws Exception {
		ByteArrayOutputStream baos = new ByteArrayOutputStream();
		try {
			BufferedImage bi;
			bi = ImageIO.read(img);
			ImageIO.write(bi, "jpg", baos);
			bytes = baos.toByteArray();
			System.err.println(bytes.length);
			return bytes;
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			baos.close();
		}
		return bytes;
	}
	
}
//@Controller
//public class LogoutController{
//	@RequestMapping(path = { "LogoutController"})
//	public String logout(SessionStatus sessionStatus) {
//		sessionStatus.setComplete();
//		System.out.println("Logout");
//		return "success";
//	}
//}
