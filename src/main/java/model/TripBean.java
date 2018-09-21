package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import javassist.bytecode.analysis.Util;

@Entity
@Table(name="Trip")
public class TripBean {
	 
	@Id
	private Integer markerID;
	private Integer viewPointID;
	private java.sql.Timestamp startTime;
	private java.sql.Timestamp endTime;
	private String latitue;
	private String longtitue;
	private Integer actSNum; 
	
	
	
	
	@Override
	public String toString() {
		return "TripBean [markerID=" + markerID + ", viewPointID=" + viewPointID + ", startTime=" + startTime
				+ ", endTime=" + endTime + ", latitue=" + latitue + ", longtitue=" + longtitue + ", actSNum=" + actSNum
				+ "]";
	}
	public Integer getActSNum() {
		return actSNum;
	}
	public void setActSNum(Integer actSNum) {
		this.actSNum = actSNum;
	}
	public Integer getMarkerID() {
		return markerID;
	}
	public void setMarkerID(Integer markerID) {
		this.markerID = markerID;
	}
	public Integer getViewPointID() {
		return viewPointID;
	}
	public void setViewPointID(Integer viewPointID) {
		this.viewPointID = viewPointID;
	}
	public java.sql.Timestamp getStartTime() {
		return startTime;
	}
	public void setStartTime(java.sql.Timestamp startTime) {
		this.startTime = startTime;
	}
	public java.sql.Timestamp getEndTime() {
		return endTime;
	}
	public void setEndTime(java.sql.Timestamp endTime) {
		this.endTime = endTime;
	}
	public String getLatitue() {
		return latitue;
	}
	public void setLatitue(String latitue) {
		this.latitue = latitue;
	}
	public String getLongtitue() {
		return longtitue;
	}
	public void setLongtitue(String longtitue) {
		this.longtitue = longtitue;
	}

	
	
	
	
	
	
}


