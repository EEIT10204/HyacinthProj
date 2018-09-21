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
/*
 memberID int references member(memberID) NOT NULL,
 ActSNum int references Act(ActSNum) NOT NULL,
 commentSNum int primary key IDENTITY NOT NULL,
 ACCommentID AS 'ACC'+RIGHT('00000'+convert(varchar,commentSNum),5) PERSISTED NOT NULL,
 commentContent nvarchar(500),
 replyTime datetime,
 commentVisibility int
*/	
	
	private Integer memberID;
	private Integer actSNum;
	@Column(insertable=false,updatable=false)
	private Integer commentSNum;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String ACCommentID;
	private String commentContent;
	private java.sql.Timestamp replyTime;
	private Integer commentVisibility;
	
	@Override
	public String toString() {
		return "Act_CommentBean [memberID=" + memberID + ", actSNum=" + actSNum + ", commentSNum=" + commentSNum
				+ ", ACCommentID=" + ACCommentID + ", commentContent=" + commentContent + ", replyTime=" + replyTime
				+ ", commentVisibility=" + commentVisibility + "]";
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
	public Integer getCommentVisibility() {
		return commentVisibility;
	}
	public void setCommentVisibility(Integer commentVisibility) {
		this.commentVisibility = commentVisibility;
	}
	
}
