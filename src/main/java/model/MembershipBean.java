package model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Membership")
public class MembershipBean implements Serializable{
	private static final long serialVersionUID = -8422590361544577979L;
	@Id
	private Integer memberID_A;
	@Id
	private Integer memberID_B;
	
	public MembershipBean() {
	}
	
	
	
	@Override
	public String toString() {
		return "MembershipBean [memberID_A=" + memberID_A + ", memberID_B=" + memberID_B + "]";
	}



	public Integer getMemberID_A()  {
		return memberID_A;
	}
	public void setMemberID_A(Integer memberID_A) {
		this.memberID_A = memberID_A;
	}
	public Integer getMemberID_B() {
		return memberID_B;
	}
	public void setMemberID_B(Integer memberID_B) {
		this.memberID_B = memberID_B;
	}
	
	@Override
	public boolean equals(Object obj)
	{
		if (this == obj)
		{
			return true;
		}
		if (obj != null && obj.getClass() == MembershipBean.class)
		{
			MembershipBean target = (MembershipBean)obj;
			return target.getMemberID_A().equals(getMemberID_A())
				&& target.getMemberID_B().equals(getMemberID_B());
		}
		return false;
	}
 
	@Override// 重写hashCode()方法，根据first、last计算hashCode值
	public int hashCode()
	{
		return getMemberID_A().hashCode() * 31
			+ getMemberID_B().hashCode();
	}
	


}
