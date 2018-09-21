package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Act_Comment")
public class ACCommentBean {
	@Column(insertable=false, updatable=false)
	private Integer commentSNum;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable=false, updatable=false)
	private String ACCommentID;
	private String commentContent;
	private java.sql.Timestamp replyTime;
	private Integer memberID;
	private Integer actSNum;
	private Integer commentVisibility;
	
	@Override
	public String toString() {
		return "ACCommentBean [commentSNum=" + commentSNum + ", ACCommentID=" + ACCommentID + ", commentContent="
				+ commentContent + ", replyTime=" + replyTime + ", memberID=" + memberID + ", actSNum=" + actSNum
				+ ", commentVisibility=" + commentVisibility + "]";
	}
	public Integer getCommentSNum() {
		return commentSNum;
	}
	public void setCommentSNum(Integer commentSNum) {
		this.commentSNum = commentSNum;
	}
	public String getACCommentID() {
		return ACCommentID;
	}
	public void setACCommentID(String aCCommentID) {
		ACCommentID = aCCommentID;
	}
	public String getCommentContent() {
		return commentContent;
	}
	public void setCommentContent(String commentContent) {
		this.commentContent = commentContent;
	}
	public java.sql.Timestamp getReplyTime() {
		return replyTime;
	}
	public void setReplyTime(java.sql.Timestamp replyTime) {
		this.replyTime = replyTime;
	}
	public Integer getMemberID() {
		return memberID;
	}
	public void setMemberID(Integer memberID) {
		this.memberID = memberID;
	}
	public Integer getActSNum() {
		return actSNum;
	}
	public void setActSNum(Integer actSNum) {
		this.actSNum = actSNum;
	}
	public Integer getCommentVisibility() {
		return commentVisibility;
	}
	public void setCommentVisibility(Integer commentVisibility) {
		this.commentVisibility = commentVisibility;
	}

}

