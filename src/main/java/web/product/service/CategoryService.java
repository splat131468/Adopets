package web.product.service;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonElement;

import web.product.dao.CategoryDAO;
import web.product.dao.impl.CategoryDAOImp;
import web.product.entity.CategoryVO;


public interface CategoryService {

	CategoryDAO categoryDAO = new CategoryDAOImp();

	int queryCtgID(String ctgName);
	
	
	List<CategoryVO> getAllCategory();

}
