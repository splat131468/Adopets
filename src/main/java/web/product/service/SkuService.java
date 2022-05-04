package web.product.service;

import java.util.List;

import com.google.gson.JsonElement;

import web.product.dao.SkuDAO;
import web.product.dao.impl.SkuDAOJDBC;
import web.product.entity.SkuVO;


public interface SkuService {

	SkuDAO skuDAO = new SkuDAOJDBC();

	int insertSKU(int spuID, List<Integer> prices, List<Integer> stocks, List<JsonElement> attrList);

	int updateProd(SkuVO skuVO);
	
	
}
