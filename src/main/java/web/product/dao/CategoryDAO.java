package  web.product.dao;

import java.util.List;

import web.product.entity.CategoryVO;



public interface CategoryDAO {
	
	
		// 取得類別id
	 Integer queryCtgId(String ctgName);
	
	List<CategoryVO> getAllCategory();

}
