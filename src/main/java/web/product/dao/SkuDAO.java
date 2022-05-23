package  web.product.dao;

import java.util.List;

import web.product.entity.SkuVO;



public interface SkuDAO {
	
	
	int insertSKU(List<SkuVO> skus);
	
	int updateProd(SkuVO skuVO);
	
	int updateProds(List<SkuVO> skus);
	

}
