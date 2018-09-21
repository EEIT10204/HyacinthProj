package model;

import java.io.Serializable;
import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MemberAct")
public class MemberActBean implements Serializable{
	/*
	 memberID int references member(memberID),
	 actSNum int references Act(actSNum),
	 isLike bit,
	 isAttend bit
	 */
	@Id
	private Integer memberID;
	@Id
	private Integer actSNum;
	private Boolean isAttend;
	private Boolean isLike;
	
	public Integer getMemberID() {
		return memberID;
	}

	@Override
	public String toString() {
		return "MemberActBean [memberID=" + memberID + ", actSNum=" + actSNum + ", isAttend=" + isAttend + ", isLike="
				+ isLike + "]";
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

	public Boolean getIsAttend() {
		return isAttend;
	}

	public void setIsAttend(Boolean isAttend) {
		this.isAttend = isAttend;
	}

	public Boolean getIsLike() {
		return isLike;
	}

	public void setIsLike(Boolean isLike) {
		this.isLike = isLike;
	}


	

	

	//----------------------------------------------------
		public MemberActBean() {
		}
		
		@Override
		public boolean equals(Object o) {
			if ( this == o ) {
				return true;
			}
			if ( o == null || getClass() != o.getClass() ) {
				return false;
			}
			MemberActBean pk = (MemberActBean) o;
			return Objects.equals( memberID, pk.memberID ) &&
					Objects.equals( actSNum, pk.actSNum );
		}

		@Override
		public int hashCode() {
			return Objects.hash( memberID, actSNum );
		}
	}

