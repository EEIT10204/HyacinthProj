package model;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name="Reported_Case")
public class ReportBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable=false,updatable=false)
	private int caseSNum;
	@Column(insertable=false,updatable=false)
	private String caseID;
	private int memberID;
	private String referID;
	private String reason;
	private java.sql.Timestamp reportedTime;
	private String process;
	@Transient
	private String memberName;
	
	public String getMemberName() {
		return memberName;
	}

	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}


	@Override
	public String toString() {
		return "ReportBean [caseSNum=" + caseSNum + ", caseID=" + caseID + ", memberID=" + memberID + ", referID="
				+ referID + ", reason=" + reason + ", reportedTime=" + reportedTime + ", process=" + process
				+ ", memberName=" + memberName + "]";
	}

	public int getCaseSNum() {
		return caseSNum;
	}
	public String getCaseID() {
		return caseID;
	}
	public int getMemberID() {
		return memberID;
	}
	public void setMemberID(int memberID) {
		this.memberID = memberID;
	}

	public String getReferID() {
		return referID;
	}
	public void setReferID(String referID) {
		this.referID = referID;
	}
	public void setCaseSNum(int caseSNum) {
		this.caseSNum = caseSNum;
	}
	public void setCaseID(String caseID) {
		this.caseID = caseID;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public Timestamp getReportedTime() {
		return reportedTime;
	}
	public void setReportedTime(Timestamp reportedTime) {
		this.reportedTime = reportedTime;
	}
	public String getProcess() {
		return process;
	}
	public void setProcess(String process) {
		this.process = process;
	}
}
