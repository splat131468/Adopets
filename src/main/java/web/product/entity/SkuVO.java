package web.product.entity;

import java.sql.Timestamp;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name="SKU")
public class SkuVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="skuID")
	private Integer skuID;
	
	@Column(name="spuID")
	private Integer spuID; // 商品編號
	
	@Column(name="skuPrice")
	private Integer skuPrice;
	
	@Column(name="stock")
	private Integer stock;
	
	@Column(name="specAttr")
	private String specAttr; // json
	
	@Column(name="status")
	private Integer status;
	
	@Column(name="addedTime")
	private Timestamp addedTime;
	
	
	


	// 說明
	// 1. 不能讓hibernate讀到
	// 2. 用mybatis 做多對一查詢
	@Transient
	private SpuVO spuVO;
	
//	// 一對多關係
//	@Transient
//	private PImgVO pImgVO;
//	public PImgVO getpImgVO() {
//		return pImgVO;
//	}





//	public void setpImgVO(PImgVO pImgVO) {
//		this.pImgVO = pImgVO;
//	}


		
	
	public SkuVO(Integer skuID, Integer spuID, Integer skuPrice, Integer stock, String specAttr, Integer status,
			Timestamp addedTime) {
		super();
		this.skuID = skuID;
		this.spuID = spuID;
		this.skuPrice = skuPrice;
		this.stock = stock;
		this.specAttr = specAttr;
		this.status = status;
		this.addedTime = addedTime;
	}





	










	


}
