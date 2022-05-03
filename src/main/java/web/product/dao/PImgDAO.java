package  web.product.dao;

import java.util.List;

import web.product.entity.PImgVO;



public interface PImgDAO  {

	
	
	public int uploadPics(List<PImgVO> imgList) ;
	
	
	PImgVO getPicByID(Integer skuID);
	
}
