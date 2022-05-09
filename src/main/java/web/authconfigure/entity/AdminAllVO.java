package web.authconfigure.entity;

import java.util.Arrays;

public class AdminAllVO {
	private Integer adminID;
	private String account;
	private String password;
	private String name;
	private byte[] personImg;
	private boolean accStatus;
	private Integer authID;
	private String authName;
	
	public AdminAllVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public AdminAllVO(Integer adminID, String account, String password, String name, byte[] personImg,
			boolean accStatus, Integer authID, String authName) {
		super();
		this.adminID = adminID;
		this.account = account;
		this.password = password;
		this.name = name;
		this.personImg = personImg;
		this.accStatus = accStatus;
		this.authID = authID;
		this.authName = authName;
	}
	public Integer getAdminID() {
		return adminID;
	}
	public void setAdminID(Integer adminID) {
		this.adminID = adminID;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public byte[] getPersonImg() {
		return personImg;
	}
	public void setPersonImg(byte[] personImg) {
		this.personImg = personImg;
	}
	public boolean isAccStatus() {
		return accStatus;
	}
	public void setAccStatus(boolean accStatus) {
		this.accStatus = accStatus;
	}
	public Integer getAuthID() {
		return authID;
	}
	public void setAuthID(Integer authID) {
		this.authID = authID;
	}
	public String getAuthName() {
		return authName;
	}
	public void setAuthName(String authName) {
		this.authName = authName;
	}

	@Override
	public String toString() {
		return "AdminAllVO [adminID=" + adminID + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", personImg=" + Arrays.toString(personImg) + ", accStatus=" + accStatus + ", authID=" + authID
				+ ", authName=" + authName + "]";
	}
	
	
	
}
