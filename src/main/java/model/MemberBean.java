package model;

import java.util.Base64;
import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Member")
public class MemberBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer memberID;//
	private String memberAccount;//
	private String memberPwd;//
	private String memberName;//
	private String memberTel;//
	private String memberMail;//
<<<<<<< HEAD
	private byte[] memberPic;//
=======
	private byte[] memberPic;// 
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
	private String memberNickName;//
	private String memberGender;//
	private Date memberBirthDay;//
	private String googleToken;//
	private String memberHierachy;//
	private String memberCertify;
	
//-------------------------------------------
	@Override
<<<<<<< HEAD
	public String toString() {
=======
	public String toString() { 
>>>>>>> c89f0141882deea9b6670f84845d38c26d69ae3c
		return "[memberID=" + memberID + ", memberAccount=" + memberAccount + ", memberPwd=" + memberPwd
				+ ", memberName=" + memberName + ", memberTel=" + memberTel + ", memberMail=" + memberMail
				+ ", memberPic=" +memberPic + ", memberNickName=" + memberNickName + ", memberGender="
				+ memberGender + ", memberBirthday=" + memberBirthDay + ", googleToken=" + googleToken
				+ ", memberHierachy=" + memberHierachy + "]";
	}
//-------------------------------------------	
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public String getMemberAccount() {
		return memberAccount;
	}
	public void setMemberAccount(String memberAccount) {
		this.memberAccount = memberAccount;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberTel() {
		return memberTel;
	}
	public void setMemberTel(String memberTel) {
		this.memberTel = memberTel;
	}
	public String getMemberMail() {
		return memberMail;
	}
	public void setMemberMail(String memberMail) {
		this.memberMail = memberMail;
	}
	public byte[] getMemberPic() {
		return memberPic;
	}
	public void setMemberPic(byte[] memberPic) {
		this.memberPic = memberPic;
	}
	public String getMemberNickName() {
		return memberNickName;
	}
	public void setMemberNickName(String memberNickName) {
		this.memberNickName = memberNickName;
	}
	public String getMemberGender() {
		return memberGender;
	}
	public void setMemberGender(String memberGender) {
		this.memberGender = memberGender;
	}
	
	public String getGoogleToken() {
		return googleToken;
	}
	public void setGoogleToken(String googleToken) {
		this.googleToken = googleToken;
	}
	public String getMemberHierachy() {
		return memberHierachy;
	}
	public void setMemberHierachy(String memberHierachy) {
		this.memberHierachy = memberHierachy;
	}
	public String getRealPic() {
		return googleToken;
		
	}
	public Date getMemberBirthDay() {
		return memberBirthDay;
	}
	public void setMemberBirthDay(Date memberBirthDay) {
		this.memberBirthDay = memberBirthDay;
	}
	public String getMemberCertify() {
		return memberCertify;
	}
	public void setMemberCertify(String memberCertify) {
		this.memberCertify = memberCertify;
	}
	public String getMemberPicToBase64() {
		  if(memberPic!=null) {
		   return Base64.getEncoder().encodeToString(memberPic);
		  }
		  return null;
		 }
}
