package web.product.entity;



import java.util.List;

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
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Table(name="SPU")
public class SpuVO {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="spuID")
	private Integer spuID;
	
	@Column(name="ctgID")
	private Integer ctgID;
	
	@Column(name="spuName")
	private  String spuName;
	
	@Column(name="descript")
	private String descript;
	
	// 一對多關係
	@Transient
	private List<SkuVO> skuVO;
	
//	// 一對多關係
//	@Transient
//	private List<PImgVO> pImgVO;
	
	

}
