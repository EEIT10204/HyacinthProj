package controller;


import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.context.ApplicationContext;
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

@Controller
@SessionAttributes(names = { "user" })
public class RegisterController {
	
	@Autowired
	private ApplicationContext context;
	
	@Autowired
	private MemberService memberService;
	
	@InitBinder
	public void registerPropertyEditor(WebDataBinder webDataBinder) {
		webDataBinder.registerCustomEditor(java.util.Date.class,
				new CustomDateEditor(new SimpleDateFormat("yyyy-MM-dd"), true));
	
		webDataBinder.registerCustomEditor(byte[].class,new ByteArrayMultipartFileEditor());
		 
	}
	
	@RequestMapping(path = { "RegistController" })
	public String register( HttpServletRequest request ,Model model,MemberBean memberBean,BindingResult bindingResult) throws Exception{
		if(memberBean.getMemberPic().length==0) {
			String contexPath= request.getSession().getServletContext().getRealPath("/");
			System.out.println(contexPath);
			File img = new File(contexPath+"/Images/Member/avatar_2x.png");
			byte[] byteToDB = fileToByte(img);
			System.out.println("photoByte[] : "+byteToDB);
			memberBean.setMemberPic(byteToDB);
		}
		MemberBean bean = memberService.register(memberBean);
		System.out.println("Controller"+bean);
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
