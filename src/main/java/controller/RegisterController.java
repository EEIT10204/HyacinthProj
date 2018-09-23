package controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.support.ByteArrayMultipartFileEditor;

import model.MemberBean;
import model.MemberService;
import model.SubMemberBean;
import model.SubMemberDAO;

@Controller
@SessionAttributes(names = { "user" })
public class RegisterController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private SubMemberDAO subMemberDAO;

	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));

		webDataBinder.registerCustomEditor(byte[].class, new ByteArrayMultipartFileEditor());

	}

	@RequestMapping(path = { "RegistController" })
	public String register(HttpServletRequest request, Model model, MemberBean memberBean, BindingResult bindingResult)
			throws Exception {
		
		//若無上傳個人照片  則 新增預設個人照
		if (memberBean.getMemberPic().length == 0) {
			String contexPath = request.getSession().getServletContext().getRealPath("/");
			System.out.println(contexPath);
			File img = new File(contexPath + "/Images/Member/memberPic_default.png");
			byte[] byteToDB = fileToByte(img);
			System.out.println("photoByte[] : " + byteToDB);
			memberBean.setMemberPic(byteToDB);
		}
		

		MemberBean bean = memberService.register(memberBean); //成功註冊
		
		//新增預設MemberCover 
			SubMemberBean sub = new SubMemberBean();
			sub.setMemberID(bean.getMemberID());
			String contexPath = request.getSession().getServletContext().getRealPath("/");
			File img = new File(contexPath+"/Images/Member/memberCover_default.jpg");
			byte[] CoverToDB = fileToByte(img);
			sub.setMemberCover(CoverToDB);
			subMemberDAO.insert(sub);
		
		
		System.out.println("Controller" + bean);
		model.addAttribute("user", bean);
		
		return "redirectIndex";
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
