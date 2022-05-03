package web.product.service;

import java.util.List;

import web.product.dao.ValueDAO;
import web.product.dao.impl.ValueDAOJDBC;
import web.product.entity.ValueVO;



public interface ValueService {
	ValueDAO valueDAO=new ValueDAOJDBC();
	
	List<ValueVO> getAllValue(Integer attrID);
	
}
