package web.product.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import web.product.dao.SpuDAO;
import web.product.entity.CartItem;
import web.product.entity.ProdSelection;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;
import web.product.service.impl.CartServiceImp;

public class Test {

	public static void main(String[] args) throws IOException {
//		testmapper3();
		
		
		CartServiceImp cartService = new CartServiceImp();
		List<CartItem> cart = cartService.getCart(1);
		System.out.println(cart);
	}
	
	public static void testMapper() throws IOException {
		
		
		InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
		SqlSession session = factory.openSession();
		
		SpuDAO spuDAO = session.getMapper(SpuDAO.class);
		
		ArrayList<String> arrayList = new ArrayList<String>();
		arrayList.add("5kg");
		arrayList.add("鮭魚");
		SkuVO priceAndStock = spuDAO.getPriceAndStock(arrayList,4);
		System.out.println(priceAndStock);
		
		
		
		session.commit();
		
	}
	
	public static void testmapper2() throws IOException {
		
		
		InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
		SqlSession session = factory.openSession();
		
		SpuDAO spuDAO = session.getMapper(SpuDAO.class);
			
		SpuVO spuVO = new SpuVO();
		spuVO.setSpuID(1);
		
//		List<SpuVO> detail = spuDAO.getDetail(spuVO);
//		
//		detail.forEach(e->
//		{
//			System.out.println(e);
//		});
		
		
		
		session.commit();
		
		
	}
public static void testmapper3() throws IOException {
		
		
		InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
		SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
		SqlSession session = factory.openSession();
		
		SpuDAO spuDAO = session.getMapper(SpuDAO.class);
			
		SpuVO spuVO = new SpuVO();
		spuVO.setSpuID(1);
		
		SkuVO skuVO = spuDAO.getSkuVO(2);
		
		System.out.println(skuVO);
		
		session.commit();
		
		
	}
	
	
	
	
}
