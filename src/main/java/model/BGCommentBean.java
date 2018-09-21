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
/*
 memberID int references member(memberID) NOT NULL,
 blogSNum int references blog(blogSNum) NOT NULL,
 commentSNum int primary key IDENTITY NOT NULL,
 BGCommentID AS 'BGC'+RIGHT('00000'+convert(varchar,commentSNum),5) PERSISTED NOT NULL,
 commentContent nvarchar(500),
 replyTime datetime,
 commentVisibility int 
 */
	
	private Integer memberID;
	private Integer blogSNum;
	@Column(insertable=false,updatable=false)
	private Integer commentSNum;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private String BGCommentID;
	private String commentContent;
	private java.sql.Timestamp replyTime;
	private Integer commentVisibility;
	
	
	@Override
	public String toString() {
		return "Blog_CommentBean [memberID=" + memberID + ", blogSNum=" + blogSNum + ", commentSNum=" + commentSNum
				+ ", BGCommentID=" + BGCommentID + ", commentContent=" + commentContent + ", replyTime=" + replyTime
				+ ", commentVisibility=" + commentVisibility + "]";
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
	public Integer getCommentVisibility() {
		return commentVisibility;
	}
	public void setCommentVisibility(Integer commentVisibility) {
		this.commentVisibility = commentVisibility;
	}
	
}
