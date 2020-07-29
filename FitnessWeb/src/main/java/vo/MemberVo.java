package vo;

import java.awt.List;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Map;

public class MemberVo {
	private int no;
	

	private String id;
	private String passwd;
	private String name;
	private int auth;
	private String period;
	private String phone;
	private String gender;
	private String address;
	private LocalDateTime regDate;
	private String[] gxType;
	
	public String[] getGxType() {
		return gxType;
	}
	public void setGxType(String[] gxType) {
		this.gxType = gxType;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAuth() {
		return auth;
	}
	public void setAuth(int auth) {
		this.auth = auth;
	}
	public String getPeriod() {
		return period;
	}
	public void setPeriod(String period) {
		this.period = period;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public LocalDateTime getRegDate() {
		return regDate;
	}
	public void setRegDate(LocalDateTime regDate) {
		this.regDate = regDate;
	}
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}

	@Override
	public String toString() {
		return "memberVo [memberId=" + ", id=" + id + ", passwd=" + passwd + ", name=" + name + ", auth="
				+ auth + ", period=" + period + ", phone=" + phone + ", gender=" + gender + ", address=" + address
				+ ", regDate=" + regDate + ", gxType=" + gxType + "]";
	}
}
