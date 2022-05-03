package web.product.service.impl;

import java.util.List;

import web.product.dao.AttributesDAO;
import web.product.dao.impl.AttributesDAOImp;
import web.product.entity.AttrWithValue;
import web.product.service.AttributesService;





public class AttributesServiceImp implements AttributesService {

	
	AttributesDAO attrDAO=new AttributesDAOImp();
	
	public List<AttrWithValue> getAll(Integer ctgID){
		return attrDAO.getAll(ctgID);
	}
	
}
