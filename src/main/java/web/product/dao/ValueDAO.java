package  web.product.dao;

import java.util.List;

import web.product.entity.ValueVO;



public interface ValueDAO {

	
	
	List<ValueVO> getAllValue(Integer attrID);
}
