package web.catInfo.entity;

import java.sql.Timestamp;

public class CatPhotoGalleryVO {
	
	private Integer imgID;
	private Integer catID;
	private byte[] catImg;
	private Timestamp photoDate;
	
	
	public CatPhotoGalleryVO() {
	}
	
	public CatPhotoGalleryVO(Integer imgID, Integer catID, byte[] catImg, Timestamp photoDate) {
		this.imgID = imgID;
		this.catID = catID;
		this.catImg = catImg;
		this.photoDate = photoDate;
	}
	

	public Integer getImgID() {
		return imgID;
	}
	public void setImgID(Integer imgID) {
		this.imgID = imgID;
	}
	public Integer getCatID() {
		return catID;
	}
	public void setCatID(Integer catID) {
		this.catID = catID;
	}
	public byte[] getCatImg() {
		return catImg;
	}
	public void setCatImg(byte[] catImg) {
		this.catImg = catImg;
	}
	public Timestamp getPhotoDate() {
		return photoDate;
	}
	public void setPhotoDate(Timestamp photoDate) {
		this.photoDate = photoDate;
	}
	
	
	
}
