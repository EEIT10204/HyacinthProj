package model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ViewPoint")
public class ViewPointBean {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer viewPointID;
	private String viewPointName = null;
	private String viewPointAddress = null;
	private String viewPointCity;
	private String viewPointInfo;
	private String viewPointType;
	private String latitue;
	private String longtitue;
	
	@Override
	public String toString() {
		return "ViewPointBean [viewPointID=" + viewPointID + ", viewPointName=" + viewPointName + ", viewPointAddres="
				+ viewPointAddress + ", viewPointCity=" + viewPointCity + ", vewPointInfo=" + viewPointInfo
				+ ", viewPointType=" + viewPointType + ", latitue=" + latitue + ", longtitue=" + longtitue + "]";
	}
	public Integer getViewPointID() {
		return viewPointID;
	}
	public void setViewPointID(Integer viewPointID) {
		this.viewPointID = viewPointID;
	}
	public String getViewPointName() {
		return viewPointName;
	}
	public void setViewPointName(String viewPointName) {
		this.viewPointName = viewPointName;
	}
	public String getViewPointAddress() {
		return viewPointAddress;
	}
	public void setViewPointAddress(String viewPointAddres) {
		this.viewPointAddress = viewPointAddres;
	}
	public String getViewPointCity() {
		return viewPointCity;
	}
	public void setViewPointCity(String viewPointCity) {
		this.viewPointCity = viewPointCity;
	}
	public String getViewPointInfo() {
		return viewPointInfo;
	}
	public void setViewPointInfo(String viewPointInfo) {
		this.viewPointInfo = viewPointInfo;
	}
	public String getViewPointType() {
		return viewPointType;
	}
	public void setViewPointType(String viewPointType) {
		this.viewPointType = viewPointType;
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
