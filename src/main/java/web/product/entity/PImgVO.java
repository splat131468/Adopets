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
@Table(name="PIMG")
public class PImgVO {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="imgID")
	private Integer imgID;
	
	@Column(name="spuID")
	private Integer spuID;
	
	@Column(name="spuImg")
	private byte[] spuImg;
	
	@Column(name="mainImg")
	private Integer mainImg; // 0 false 1 true
	
	// 作為byte轉換
//	@Transient
//	private String byteToStr=null;
//	
}
