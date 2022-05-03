package web.product.entity;



import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;


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
	
	// 多對一關係
//	@Transient
//	private List<SkuVO> skuVO;
	
//	// 一對多關係
//	@Transient
//	private PImgVO pImgVO;
	
	

}
