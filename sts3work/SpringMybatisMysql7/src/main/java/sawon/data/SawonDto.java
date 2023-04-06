package sawon.data;

import java.sql.Timestamp;

public class SawonDto {

	private String num;
	private String name;
	private String driver;
	private String buseo;
	private String image;
	private Timestamp ipsaday;
	
	
	public String getNum() {
		return num;
	}
	public void setNum(String num) {
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDriver() {
		return driver;
	}
	public void setDriver(String driver) {
		this.driver = driver;
	}
	public String getBuseo() {
		return buseo;
	}
	public void setBuseo(String buseo) {
		this.buseo = buseo;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Timestamp getIpsaday() {
		return ipsaday;
	}
	public void setIpsaday(Timestamp ipsaday) {
		this.ipsaday = ipsaday;
	}
	
	
	
	
	
	
}
