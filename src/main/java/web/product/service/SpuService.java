package web.product.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import web.product.dao.SpuDAO;
import web.product.dao.impl.SpuDAOJDBC;
import web.product.entity.SkuVO;


public interface SpuService {

	// 轉mybatis
	SpuDAO spuDao=new SpuDAOJDBC();

	int insertSPU(int ctgID, String spuName, String descript);

	// mybatis 查詢spu sku 資料 ， 多對一關係！
		List<SkuVO> getAllProd(); 
		
		List<SkuVO> queryByName(String prodName); 
	
	// 一對多關係
		
		List<SkuVO> getMainPage();
		
	// 分頁處理  getMainPage的升級版
		
		PageInfo<SkuVO> getMainPageHelper(int curPage,Integer pageSize);
	
}
