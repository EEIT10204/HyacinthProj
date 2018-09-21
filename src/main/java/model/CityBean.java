package model;

import java.util.Arrays;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
@Entity
@Table(name="City")
public class CityBean {
	@Id
	private String cityName;
	private String nation;
	private String cityIntro;
	private byte[] cityPic;
	
	
	
	@Override
	public String toString() {
		return "CityBean [cityName=" + cityName + ", nation=" + nation + ", cityIntro=" + cityIntro + "]";
	}
	public String getCityName() {
		return cityName;
	}
	public void setCityName(String cityName) {
		this.cityName = cityName;
	}
	public String getNation() {
		return nation;
	}
	public void setNation(String nation) {
		this.nation = nation;
	}
	public String getCityIntro() {
		return cityIntro;
	}
	public void setCityIntro(String cityIntro) {
		this.cityIntro = cityIntro;
	}
	public byte[] getCityPic() {
		return cityPic;
	}
	public void setCityPic(byte[] cityPic) {
		this.cityPic = cityPic;
	}
	
	
}
