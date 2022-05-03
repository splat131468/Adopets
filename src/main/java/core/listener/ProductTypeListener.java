package core.listener;

import java.util.List;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import web.product.entity.CategoryVO;
import web.product.service.impl.CategoryServiceImp;


@WebListener
public class ProductTypeListener implements ServletContextListener {

	
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		
		
	
		CategoryServiceImp categoryServiceImp = new CategoryServiceImp();
		List<CategoryVO> categoryList = categoryServiceImp.getAllCategory();

		sce.getServletContext().setAttribute("categoryList",categoryList);
	}
	
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
	
		 

	}


	
	
	
	
	

}
