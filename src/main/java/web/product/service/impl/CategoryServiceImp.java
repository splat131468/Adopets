package web.product.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.google.gson.JsonElement;

import web.product.entity.CategoryVO;
import web.product.service.CategoryService;


public class CategoryServiceImp implements CategoryService {

	@Override
	public int queryCtgID(String ctgName) {
		return categoryDAO.queryCtgId(ctgName);
	}
	
	
	public List<CategoryVO> getAllCategory(){
		return categoryDAO.getAllCategory();
	}

}
