package  web.product.dao;

import java.util.List;

import web.product.entity.PImgVO;
import web.product.entity.SpuVO;



public interface PImgDAO  {

	
	
	public int uploadPics(List<PImgVO> imgList) ;
	
	
	PImgVO getPicByID(Integer skuID);
	
	List<PImgVO> getSpuPics(SpuVO spuVO);
	
}
