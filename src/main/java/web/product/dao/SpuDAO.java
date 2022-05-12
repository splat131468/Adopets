package  web.product.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import web.product.entity.ProdSelection;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;



// mapper mybatis
public interface SpuDAO {
	
	
	SpuVO inserSPU(SpuVO spuVO);

	// 使用skuVO 是因為想利用mybatis 一對多關係
	List<SkuVO> getAllProd();
	
	// 模糊比對需要參數
	List<SkuVO> queryByName(@Param("prodName")String prodName);
	
	// 列出商城首頁
	List<SkuVO> getMainPage();
	
	// 條件查詢 動態查詢
	List<SkuVO> selectedPage(ProdSelection prodSelection);
	
	// 取得商品細節
	SpuVO getDetail(SpuVO spuVO);
	
	SkuVO getPriceAndStock( @Param("key") List<String> key,@Param("spuID")Integer spuID);
	
	
	// 指定skuID找 規格
	SkuVO getSkuVO(@Param("skuID") Integer skuID);
	
}
