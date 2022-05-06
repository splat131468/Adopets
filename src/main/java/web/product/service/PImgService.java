package web.product.service;

import java.util.List;

import web.product.dao.PImgDAO;
import web.product.dao.impl.PImgJDBC;
import web.product.entity.ImgTFVO;
import web.product.entity.PImgVO;
import web.product.entity.SpuVO;

public interface PImgService {

	 PImgDAO pImgDAO=new PImgJDBC();
	
	public int addPics(int spuID,ImgTFVO imgs);
	
	PImgVO getPic(Integer spuID);
	
	List<PImgVO> getSpuPics(SpuVO spuVO);
	
}
