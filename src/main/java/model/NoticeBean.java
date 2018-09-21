package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Notice")
public class NoticeBean {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer noticeID;
	private Integer memberID_Receiver;
	private Integer memberID_Sender;
	private String messegeContent;
	private Integer actSNum;
	private Integer caseID;
	private java.util.Date noticeTime;	
	private Boolean isRead;
	@Override
	public String toString() {
		return "[noticeID=" + noticeID + ", memberID_Receiver=" + memberID_Receiver + ", memberID_Sender="
				+ memberID_Sender + ", messegeContent=" + messegeContent + ", actSNum=" + actSNum + ", caseID=" + caseID
				+ ", noticeTime=" + noticeTime + ", isRead=" + isRead + "]";
	}
	public int getNoticeID() {
		return noticeID;
	}
	public void setNoticeID(int noticeID) {
		this.noticeID = noticeID;
	}
	public int getMemberID_Receiver() {
		return memberID_Receiver;
	}
	public void setMemberID_Receiver(int memberID_Receiver) {
		this.memberID_Receiver = memberID_Receiver;
	}
	public int getMemberID_Sender() {
		return memberID_Sender;
	}
	public void setMemberID_Sender(int memberID_Sender) {
		this.memberID_Sender = memberID_Sender;
	}
	public String getMessegeContent() {
		return messegeContent;
	}
	public void setMessegeContent(String messegeContent) {
		this.messegeContent = messegeContent;
	}
	public int getActSNum() {
		if( actSNum ==null) {
			actSNum = 0;
			return actSNum;
		}
		return actSNum;
	}
	public void setActSNum(int actSNum) {
		this.actSNum = actSNum;
	}
	public int getCaseID() {
		if( caseID ==null) {
			caseID = 0;
			return caseID;
		}
		return caseID;
	}
	public void setCaseID(int caseID) {
		this.caseID = caseID;
	}
	public java.util.Date getNoticeTime() {
		return noticeTime;
	}
	public void setNoticeTime(java.util.Date noticeTime) {
		this.noticeTime = noticeTime;
	}
	public Boolean getIsRead() {
		return isRead;
	}
	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}
	
}
