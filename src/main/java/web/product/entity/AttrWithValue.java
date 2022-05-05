package web.product.entity;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Data
@NoArgsConstructor
public class AttrWithValue {
	
	private String attrName;
	
	private List<String> valueList;

}
