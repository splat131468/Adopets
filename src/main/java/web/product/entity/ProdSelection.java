package web.product.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ProdSelection {
	
	// 最低價
	private Integer lowC;
	// 最高價
	private Integer highC;
	// 商品類型
	private Integer ctgID;
	// 商品名稱
	private String prodName; 
	

}
