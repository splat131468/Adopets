package web.catInfo.entity;

import java.sql.Date;

public class CatAndShelVO {
	
	
	
	private Integer catID; //
	private Integer memID; 
	private String shelterName; // 
	private String catName; //
	private Integer age; //
	private String breed; //
	private String size;
	private String sex;
	private String coatColor;
	private String eyeColor;
	private String health;
	private Integer adoptCost;
	private Date createDate;
	private Boolean haveVaccine;
	private Boolean adopt;
	private String shelterAddr;
	private String shelterCity;
	private String longitude;
	private String latitude;
	private Integer dis;
	
	
	
	
	
	
	
	public CatAndShelVO() {
		super();
		// TODO Auto-generated constructor stub
	}


	

	public CatAndShelVO(Integer catID, Integer memID, String shelterName, String catName, Integer age, String breed,
			String size, String sex, String coatColor, String eyeColor, String health, Integer adoptCost,
			Date createDate, Boolean haveVaccine, Boolean adopt, String shelterAddr, String shelterCity,
			String longitude, String latitude, Integer dis) {
		super();
		this.catID = catID;
		this.memID = memID;
		this.shelterName = shelterName;
		this.catName = catName;
		this.age = age;
		this.breed = breed;
		this.size = size;
		this.sex = sex;
		this.coatColor = coatColor;
		this.eyeColor = eyeColor;
		this.health = health;
		this.adoptCost = adoptCost;
		this.createDate = createDate;
		this.haveVaccine = haveVaccine;
		this.adopt = adopt;
		this.shelterAddr = shelterAddr;
		this.shelterCity = shelterCity;
		this.longitude = longitude;
		this.latitude = latitude;
		this.dis = dis;
	}




	@Override
	public String toString() {
		return "CatAndShelVO [catID=" + catID + ", memID=" + memID + ", shelterName=" + shelterName + ", catName="
				+ catName + ", age=" + age + ", breed=" + breed + ", size=" + size + ", sex=" + sex + ", coatColor="
				+ coatColor + ", eyeColor=" + eyeColor + ", health=" + health + ", adoptCost=" + adoptCost
				+ ", createDate=" + createDate + ", haveVaccine=" + haveVaccine + ", adopt=" + adopt + ", shelterAddr="
				+ shelterAddr + ", shelterCity=" + shelterCity + ", longitude=" + longitude + ", latitude=" + latitude
				+ ", dis=" + dis + "]";
	}




	public Integer getCatID() {
		return catID;
	}


	public void setCatID(Integer catID) {
		this.catID = catID;
	}


	public Integer getMemID() {
		return memID;
	}


	public void setMemID(Integer memID) {
		this.memID = memID;
	}


	public String getShelterName() {
		return shelterName;
	}


	public void setShelterName(String shelterName) {
		this.shelterName = shelterName;
	}


	public String getCatName() {
		return catName;
	}


	public void setCatName(String catName) {
		this.catName = catName;
	}


	public Integer getAge() {
		return age;
	}


	public void setAge(Integer age) {
		this.age = age;
	}


	public String getBreed() {
		return breed;
	}


	public void setBreed(String breed) {
		this.breed = breed;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}


	public String getSex() {
		return sex;
	}


	public void setSex(String sex) {
		this.sex = sex;
	}


	public String getCoatColor() {
		return coatColor;
	}


	public void setCoatColor(String coatColor) {
		this.coatColor = coatColor;
	}


	public String getEyeColor() {
		return eyeColor;
	}


	public void setEyeColor(String eyeColor) {
		this.eyeColor = eyeColor;
	}


	public String getHealth() {
		return health;
	}


	public void setHealth(String health) {
		this.health = health;
	}


	public Integer getAdoptCost() {
		return adoptCost;
	}


	public void setAdoptCost(Integer adoptCost) {
		this.adoptCost = adoptCost;
	}


	public Date getCreateDate() {
		return createDate;
	}


	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}


	public Boolean getHaveVaccine() {
		return haveVaccine;
	}


	public void setHaveVaccine(Boolean haveVaccine) {
		this.haveVaccine = haveVaccine;
	}


	public Boolean getAdopt() {
		return adopt;
	}


	public void setAdopt(Boolean adopt) {
		this.adopt = adopt;
	}


	public String getShelterAddr() {
		return shelterAddr;
	}


	public void setShelterAddr(String shelterAddr) {
		this.shelterAddr = shelterAddr;
	}


	public String getShelterCity() {
		return shelterCity;
	}


	public void setShelterCity(String shelterCity) {
		this.shelterCity = shelterCity;
	}


	public String getLongitude() {
		return longitude;
	}


	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}


	public String getLatitude() {
		return latitude;
	}


	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}


	public Integer getDis() {
		return dis;
	}


	public void setDis(Integer dis) {
		this.dis = dis;
	}
	
	
	

		

}