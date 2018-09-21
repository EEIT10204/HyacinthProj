package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


@Entity
@Table(name="MemberHist")
public class MemberHistBean {
/*
 histID int primary key identity NOT NULL,
 histTime dateTime default getdate(),
 memberID int references member(memberID) NOT NULL,
 histAction varchar(30) NOT NULL,  --created,posted,updated,attended,liked,scored,leave a comment for
 actSNum int references Act(actSNum) NULL,
 blogSNum int references Blog(blogSNum) NULL,
 */
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer histID;
	@Column(insertable=false,updatable=false)
	private java.util.Date histTime;
	private Integer memberID;
	private String histAction;
	private Integer actSNum;
	private Integer blogSNum;
	private Integer reserved;
	
	
	@Override
	public String toString() {
		return "MemberHistBean [histID=" + histID + ", histTime=" + histTime + ", memberID=" + memberID
				+ ", histAction=" + histAction + ", actSNum=" + actSNum + ", blogSNum=" + blogSNum + "]";
	}
	public Integer getHistID() {
		return histID;
	}
	public void setHistID(Integer histID) {
		this.histID = histID;
	}
	public java.util.Date getHistTime() {
		return histTime;
	}
	public void setHistTime(java.util.Date histTime) {
		this.histTime = histTime;
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public String getHistAction() {
		return histAction;
	}
	public void setHistAction(String histAction) {
		this.histAction = histAction;
	}
	public Integer getActSNum() {
		return actSNum;
	}
	public void setActSNum(Integer actSNum) {
		this.actSNum = actSNum;
	}
	public Integer getBlogSNum() {
		return blogSNum;
	}
	public void setBlogSNum(Integer blogSNum) {
		this.blogSNum = blogSNum;
	}
	public Integer getReserved() {
		return reserved;
	}
	public void setReserved(Integer reserved) {
		this.reserved = reserved;
	}
 
 
	
}
