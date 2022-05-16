package web.member.entity;
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.Arrays;

public class MemberVO  implements java.io.Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private Integer memID;
	private String account;
	private String password;
	private String name;
	private String age;
	private String phone;
	private String address;
	private byte[] personImg;
	private LocalDateTime createDate;
	private Timestamp changeDate;
	private LocalDateTime lastOLTime;
	public MemberVO() {
		super();
	}
	@Override
	public String toString() {
		return "MemberVO [memID=" + memID + ", account=" + account + ", password=" + password + ", name=" + name
				+ ", age=" + age + ", phone=" + phone + ", address=" + address + ", personImg="
				+ Arrays.toString(personImg) + ", createDate=" + createDate + ", changeDate=" + changeDate
				+ ", lastOLTime=" + lastOLTime + "]";
	}
	public Integer getMemID() {
		return memID;
	}
	public void setMemID(Integer memID) {
		this.memID = memID;
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
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public byte[] getPersonImg() {
		return personImg;
	}
	public void setPersonImg(byte[] personImg) {
		this.personImg = personImg;
	}
	public LocalDateTime getCreateDate() {
		return createDate;
	}
	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}
	public Timestamp getChangeDate() {
		return changeDate;
	}
	public void setChangeDate(Timestamp changeDate) {
		this.changeDate = changeDate;
	}
	public LocalDateTime getLastOLTime() {
		return lastOLTime;
	}
	public void setLastOLTime(LocalDateTime lastOLTime) {
		this.lastOLTime = lastOLTime;
	}
	
	
}
