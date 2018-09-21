package model;

import java.util.Arrays;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="Blog")
public class BlogBean {
	private Integer memberID;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer blogSNum;
	@Column(insertable = false,updatable = false)
	private String blogID;
	private java.util.Date blogReleaseTime;
	private String blogTitle;
//	@Column(updatable=false)
	private String blogCity;
	private String blogContext;
	private byte[] blogCover;
	private Integer blogView;
	private java.util.Date updateTime;
	private Integer blogVisibility;
	

	@Override
	public String toString() {
		return "BlogBean [memberID=" + memberID + ", blogSNum=" + blogSNum + ", blogID=" + blogID + ", blogReleaseTime="
				+ blogReleaseTime + ", blogTitle=" + blogTitle + ", blogCity=" + blogCity + ", blogContext="
				+ !blogContext.isEmpty() + ", blogCover=" + !Arrays.toString(blogCover).isEmpty() + ", blogView=" + blogView + ", updateTime="
				+ updateTime + ", blogVisibility=" + blogVisibility + "]";
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public Integer getBlogSNum() {
		return blogSNum;
	}
	public void setBlogSNum(Integer blogSNum) {
		this.blogSNum = blogSNum;
	}
	public String getBlogID() {
		return blogID;
	}
	public void setBlogID(String blogID) {
		this.blogID = blogID;
	}
	public java.util.Date getBlogReleaseTime() {
		return blogReleaseTime;
	}
	public void setBlogReleaseTime(java.util.Date blogReleaseTime) {
		this.blogReleaseTime = blogReleaseTime;
	}
	public String getBlogTitle() {
		return blogTitle;
	}
	public void setBlogTitle(String blogTitle) {
		this.blogTitle = blogTitle;
	}
	public String getBlogCity() {
		return blogCity;
	}
	public void setBlogCity(String blogCity) {
		this.blogCity = blogCity;
	}
	public String getBlogContext() {
		return blogContext;
	}
	public void setBlogContext(String blogContext) {
		this.blogContext = blogContext;
	}
	public byte[] getBlogCover() {
		return blogCover;
	}
	public void setBlogCover(byte[] blogCover) {
		this.blogCover = blogCover;
	}
	public Integer getBlogView() {
		return blogView;
	}
	public void setBlogView(Integer blogView) {
		this.blogView = blogView;
	}
	public java.util.Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(java.util.Date updateTime) {
		this.updateTime = updateTime;
	}
	public Integer getBlogVisibility() {
		return blogVisibility;
	}
	public void setBlogVisibility(Integer blogVisibility) {
		this.blogVisibility = blogVisibility;
	}
	
	public String getBlogCoverToBase64() {
		  if(blogCover!=null) {
		   return Base64.getEncoder().encodeToString(blogCover);
		  }
		  return null;
		 }


}
