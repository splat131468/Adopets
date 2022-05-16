package web.product.entity;

import java.util.Objects;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CartItem {

	private Integer skuID;
	private String descript;
	private Integer skuPrice;
	private Integer num;
	private Integer spuID; // 照片
	private String allAttr; // 所有屬性 json

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CartItem other = (CartItem) obj;
		return Objects.equals(descript, other.descript) && Objects.equals(skuID, other.skuID)
				&& Objects.equals(skuPrice, other.skuPrice) && Objects.equals(spuID, other.spuID);
	}
	

}
