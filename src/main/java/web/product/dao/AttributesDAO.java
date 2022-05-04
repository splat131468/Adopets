package web.product.dao;

import java.util.List;
import java.util.Map;

import web.product.entity.AttrWithValue;



public interface AttributesDAO {
	
	
	List<AttrWithValue> getAll (Integer ctgID);
	

}
