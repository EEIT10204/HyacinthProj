package model;

import java.util.Arrays;
import java.util.Base64;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="Act")
public class ActBean{
//java.sql.Timestamp
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(insertable=false, updatable=false)
	private Integer actSNum;
	private Integer memberID;
	@Column(insertable=false, updatable=false)
	private String actID;
	private byte[] actPhoto;
	private String actTitle;
	private String actCity;
	private String actIntro;
	private java.sql.Timestamp actCreateDate;
	private java.sql.Timestamp actStartTime;
	private java.sql.Timestamp actEndTime;
	private java.sql.Timestamp actJoinDeadLine;
	private String  actStatus;
	private Integer minParticipants;
	private Integer maxParticipants;
	private Integer participantsNow;
	private Double  budget;
	private String  payment;
	private Integer actView;
	private Integer actDuration;
	private Integer actVisibility;
	
	@Override
	public String toString() {
		return "ActBean [memberID=" + memberID + ", actSNum=" + actSNum + ", actID=" + actID + ", actPhoto="
				+ actPhoto.length + ", actTitle=" + actTitle + ", actCity=" + actCity + ", actintro="
				+ actIntro + ", actCreateTimestamp=" + actCreateDate + ", actStartTime=" + actStartTime + ", actEndTime="
				+ actEndTime + ", actJoinDeadLine=" + actJoinDeadLine + ", actStatus=" + actStatus
				+ ", minParticipants=" + minParticipants + ", maxParticipants=" + maxParticipants + ", participantsNow="
				+ participantsNow + ", budget=" + budget + ", payment=" + payment + ", actView=" + actView
				+ ", actDuration=" + actDuration + ", actVisbility=" + actVisibility + "]";
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
	public String getActID() {
		return actID;
	}
	public void setActID(String actID) {
		this.actID = actID;
	}
	public byte[] getActPhoto() {
		return actPhoto;
	}
	public void setActPhoto(byte[] actPhoto) {
		this.actPhoto = actPhoto;
	}
	public String getActTitle() {
		return actTitle;
	}
	public void setActTitle(String actTitle) {
		this.actTitle = actTitle;
	}
	public String getActCity() {
		return actCity;
	}
	public void setActCity(String actCity) {
		this.actCity = actCity;
	}
	public String getActIntro() {
		return actIntro;
	}
	public void setActIntro(String actIntro) {
		this.actIntro = actIntro;
	}
	public java.sql.Timestamp getActCreateDate() {
		return actCreateDate;
	}
	public void setActCreateDate(java.sql.Timestamp actCreateDate) {
		this.actCreateDate = actCreateDate;
	}
	public java.sql.Timestamp getActStartTime() {
		return actStartTime;
	}
	public void setActStartTime(java.sql.Timestamp actStartTime) {
		this.actStartTime = actStartTime;
	}
	public java.sql.Timestamp getActEndTime() {
		return actEndTime;
	}
	public void setActEndTime(java.sql.Timestamp actEndTime) {
		this.actEndTime = actEndTime;
	}
	public java.sql.Timestamp getActJoinDeadLine() {
		return actJoinDeadLine;
	}
	public void setActJoinDeadLine(java.sql.Timestamp actJoinDeadLine) {
		this.actJoinDeadLine = actJoinDeadLine;
	}
	public String getActStatus() {
		return actStatus;
	}
	public void setActStatus(String actStatus) {
		this.actStatus = actStatus;
	}
	public Integer getMinParticipants() {
		return minParticipants;
	}
	public void setMinParticipants(Integer minParticipants) {
		this.minParticipants = minParticipants;
	}
	public Integer getMaxParticipants() {
		return maxParticipants;
	}
	public void setMaxParticipants(Integer maxParticipants) {
		this.maxParticipants = maxParticipants;
	}
	public Integer getParticipantsNow() {
		return participantsNow;
	}
	public void setParticipantsNow(Integer participantsNow) {
		this.participantsNow = participantsNow;
	}
	public Double getBudget() {
		return budget;
	}
	public void setBudget(Double budget) {
		this.budget = budget;
	}
	public String getPayment() {
		return payment;
	}
	public void setPayment(String payment) {
		this.payment = payment;
	}
	public Integer getActView() {
		return actView;
	}
	public void setActView(Integer actView) {
		this.actView = actView;
	}
	public Integer getActDuration() {
		return actDuration;
	}
	public void setActDuration(Integer actDuration) {
		this.actDuration = actDuration;
	}
	public Integer getActVisibility() {
		return actVisibility;
	}
	public void setActVisibility(Integer actVisibility) {
		this.actVisibility = actVisibility;
	}
	
	public String getActPhotoToBase64() {
	    if(actPhoto!=null) {
	     return Base64.getEncoder().encodeToString(actPhoto);
	    }
	    return null;
	   }
	

	
}
