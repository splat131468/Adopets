package web.admin.entity;

import java.sql.Date;
import java.util.Arrays;

public class AdminVO {
	private Integer adminID;
	private String account;
	private String password;
	private String name;
	private byte[] personImg;
	private boolean accStatus;
	private Integer validateCode;
	private Date createDate;
	private Date expiredDate;
	
	public AdminVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminVO(Integer adminID, String account, String password, String name, byte[] personImg, boolean accStatus,
			Integer validateCode, Date createDate, Date expiredDate) {
		super();
		this.adminID = adminID;
		this.account = account;
		this.password = password;
		this.name = name;
		this.personImg = personImg;
		this.accStatus = accStatus;
		this.validateCode = validateCode;
		this.createDate = createDate;
		this.expiredDate = expiredDate;
	}
	@Override
	public String toString() {
		return "AdminVO [adminID=" + adminID + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", personImg=" + Arrays.toString(personImg) + ", accStatus=" + accStatus + ", validateCode="
				+ validateCode + ", createDate=" + createDate + ", expiredDate=" + expiredDate + "]";
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
	public Integer getValidateCode() {
		return validateCode;
	}
	public void setValidateCode(Integer validateCode) {
		this.validateCode = validateCode;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	public Date getExpiredDate() {
		return expiredDate;
	}
	public void setExpiredDate(Date expiredDate) {
		this.expiredDate = expiredDate;
	}
	
}
