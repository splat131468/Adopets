package web.product.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

//配合前端json格式，方便傳遞資料



@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImgTFVO {

	
	String mainImg="";
	
	String subImg[];
	
}
