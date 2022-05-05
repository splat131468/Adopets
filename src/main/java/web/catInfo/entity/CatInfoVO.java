package web.catInfo.entity;

import java.sql.Date;

public class CatInfoVO {
	
	private Integer catID;
	private Integer memID;
	private String shelterName;
	private String catName;
	private Integer age;
	private String breed;
	private String size;
	private String sex;
	private String coatColor;
	private String eyeColor;
	private String health;
	private Integer adoptCost;
	private Date createDate;
	private Boolean haveVaccine;
	private Boolean adopt;
	
	
	
	
	@Override
	public String toString() {
		return "CatInfoVO [catID=" + catID + ", memID=" + memID + ", shelterName=" + shelterName + ", catName="
				+ catName + ", breed=" + breed + ", age=" + age + ", size=" + size + ", sex=" + sex + ", coatColor="
				+ coatColor + ", eyeColor=" + eyeColor + ", haveVaccine=" + haveVaccine + ", health=" + health
				+ ", adoptCost=" + adoptCost + ", adopt=" + adopt + ", createDate=" + createDate + "]";
	}

	public CatInfoVO() {
	}

	public CatInfoVO(Integer catID, Integer memID, String shelterName, String catName, Integer age, String breed,
			String size, String sex, String coatColor, String eyeColor, String health, Integer adoptCost,
			Date createDate, Boolean haveVaccine, Boolean adopt) {
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
	public String getBreed() {
		return breed;
	}
	public void setBreed(String breed) {
		this.breed = breed;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
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
	public Boolean getHaveVaccine() {
		return haveVaccine;
	}
	public void setHaveVaccine(Boolean haveVaccine) {
		this.haveVaccine = haveVaccine;
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
	public Boolean getAdopt() {
		return adopt;
	}
	public void setAdopt(Boolean adopt) {
		this.adopt = adopt;
	}
	public Date getCreateDate() {
		return createDate;
	}
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	
	
	
	

}
