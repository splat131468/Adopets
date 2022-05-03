package web.product.service.impl;

import java.util.List;

import web.product.dao.ValueDAO;
import web.product.dao.impl.ValueDAOJDBC;
import web.product.entity.ValueVO;
import web.product.service.ValueService;



public class ValueServiceImp implements ValueService {
		ValueDAO valueDAO=new ValueDAOJDBC();
	
	public List<ValueVO> getAllValue(Integer attrID){
		return valueDAO.getAllValue(attrID);
	}
	
}
