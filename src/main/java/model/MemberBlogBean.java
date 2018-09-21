package model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.context.ApplicationContext;
import org.springframework.context.ConfigurableApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

import config.SpringJavaConfiguration;

@Entity
@Table(name="MemberBlog")
public class MemberBlogBean implements Serializable{
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
/*
 memberID int references member(memberID),
 blogSNum int references Blog(blogSNum),
 isLike bit,
 score decimal(5,2)
 */
	
	@Id
	private Integer memberID;
	@Id
	private Integer blogSNum;
	
	private Boolean isLike;
	private Double score;
	
	
	@Override
	public String toString() {
		return "MemberBlogBean [memberID=" + memberID + ", blogSNum=" + blogSNum + ", isLike=" + isLike + ", score="
				+ score + "]";
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
	
	public Boolean getIsLike() {
		return isLike;
	}
	public void setIsLike(Boolean isLike) {
		this.isLike = isLike;
	}
	public Double getScore() {
		return score;
	}
	public void setScore(Double score) {
		this.score = score;
	}

	
//----------------------------------------------------
	
	public MemberBlogBean() {
	}
	
	@Override
	public boolean equals(Object o) {
		if ( this == o ) {
			return true;
		}
		if ( o == null || getClass() != o.getClass() ) {
			return false;
		}
		MemberBlogBean pk = (MemberBlogBean) o;
		return Objects.equals( memberID, pk.memberID ) &&
				Objects.equals( blogSNum, pk.blogSNum );
	}

	@Override
	public int hashCode() {
		return Objects.hash( memberID, blogSNum );
	}
	
}
