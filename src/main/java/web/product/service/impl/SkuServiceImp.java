package web.product.service.impl;

import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonElement;

import web.product.entity.SkuVO;
import web.product.service.SkuService;
;

public class SkuServiceImp implements SkuService {
	
	


	@Override
	public int insertSKU(int spuID, List<Integer> prices, List<Integer> stocks, List<JsonElement> attrList) {

		// List 統一處理
		List<SkuVO> skus = new ArrayList<SkuVO>();

		// 確保資料長度一致
		if (prices.size() == stocks.size() || prices.size() == attrList.size()) {

			for (int i = 0; i < prices.size(); i++) {
				skus.add(new SkuVO(null, spuID, prices.get(i), stocks.get(i), attrList.get(i) + "", 1,
						new Timestamp(System.currentTimeMillis())));
			}

		}

		return skuDAO.insertSKU(skus);
	}

	@Override
	public int updateProd(SkuVO skuVO) {
		
		return skuDAO.updateProd(skuVO);
	}

	@Override
	public int takeOrder(List<SkuVO> checkOut) {
			
		return skuDAO.updateProds(checkOut);
	}

	

}
