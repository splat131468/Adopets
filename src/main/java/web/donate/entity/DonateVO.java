package web.donate.entity;

import java.sql.Date;
import java.sql.Timestamp;

public class DonateVO implements java.io.Serializable{
	private Integer donateID;
	private Integer memID;
	private Integer catID;
	private String shelterName;
	private String donateName;
	private String donateEmail;
	private String phone;
	private String donateAddr;
	private Integer donateAmo;
	private Integer donateStatus;
	private String donateMes;
	private Timestamp donateDate;
	
	public DonateVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public DonateVO(Integer donateID, Integer memID, Integer catID, String shelterName, String donateName,
			String donateEmail, String phone, String donateAddr, Integer donateAmo, Integer donateStatus,
			String donateMes, Timestamp donateDate) {
		super();
		this.donateID = donateID;
		this.memID = memID;
		this.catID = catID;
		this.shelterName = shelterName;
		this.donateName = donateName;
		this.donateEmail = donateEmail;
		this.phone = phone;
		this.donateAddr = donateAddr;
		this.donateAmo = donateAmo;
		this.donateStatus = donateStatus;
		this.donateMes = donateMes;
		this.donateDate = donateDate;
	}
	
	@Override
	public String toString() {
		return "DonateVO [donateID=" + donateID + ", memID=" + memID + ", catID=" + catID + ", shelterName="
				+ shelterName + ", donateName=" + donateName + ", donateEmail=" + donateEmail + ", phone=" + phone
				+ ", donateAddr=" + donateAddr + ", donateAmo=" + donateAmo + ", donateStatus=" + donateStatus
				+ ", donateMes=" + donateMes + ", donateDate=" + donateDate + "]";
	}
	
	public Integer getDonateID() {
		return donateID;
	}
	public void setDonateID(Integer donateID) {
		this.donateID = donateID;
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
	}
	public Integer getCatID() {
		return catID;
	}
	public void setCatID(Integer catID) {
		this.catID = catID;
	}
	public String getShelterName() {
		return shelterName;
	}
	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}
	public String getDonateName() {
		return donateName;
	}
	public void setDonateName(String donateName) {
		this.donateName = donateName;
	}
	public String getDonateEmail() {
		return donateEmail;
	}
	public void setDonateEmail(String donateEmail) {
		this.donateEmail = donateEmail;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getDonateAddr() {
		return donateAddr;
	}
	public void setDonateAddr(String donateAddr) {
		this.donateAddr = donateAddr;
	}
	public Integer getDonateAmo() {
		return donateAmo;
	}
	public void setDonateAmo(Integer donateAmo) {
		this.donateAmo = donateAmo;
	}
	public Integer getDonateStatus() {
		return donateStatus;
	}
	public void setDonateStatus(Integer donateStatus) {
		this.donateStatus = donateStatus;
	}
	public String getDonateMes() {
		return donateMes;
	}
	public void setDonateMes(String donateMes) {
		this.donateMes = donateMes;
	}
	public Timestamp getDonateDate() {
		return donateDate;
	}
	public void setDonateDate(Timestamp donateDate) {
		this.donateDate = donateDate;
	}
}
