package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Blog_Comment")
public class BGCommentBean {
	@Column(insertable=false, updatable=false)
	private Integer commentSNum;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable=false, updatable=false)
	private String BGCommentID;
	private String commentContent;
	private java.sql.Timestamp replyTime;
	private Integer memberID;
	private Integer blogSNum;
	private Integer commentVisibility;
	
	@Override
	public String toString() {
		return "BGCommentBean [commentSNum=" + commentSNum + ", BGCommentID=" + BGCommentID + ", commentContent="
				+ commentContent + ", replyTime=" + replyTime + ", memberID=" + memberID + ", blogSNum=" + blogSNum
				+ ", commentVisibility=" + commentVisibility + "]";
	}
	public Integer getCommentSNum() {
		return commentSNum;
	}
	public void setCommentSNum(Integer commentSNum) {
		this.commentSNum = commentSNum;
	}
	public String getBGCommentID() {
		return BGCommentID;
	}
	public void setBGCommentID(String bGCommentID) {
		BGCommentID = bGCommentID;
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
	public Integer getBlogSNum() {
		return blogSNum;
	}
	public void setBlogSNum(Integer blogSNum) {
		this.blogSNum = blogSNum;
	}
	public Integer getCommentVisibility() {
		return commentVisibility;
	}
	public void setCommentVisibility(Integer commentVisibility) {
		this.commentVisibility = commentVisibility;
	}
}


