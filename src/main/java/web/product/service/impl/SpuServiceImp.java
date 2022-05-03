package web.product.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import web.product.dao.SpuDAO;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;
import web.product.service.SpuService;

public class SpuServiceImp implements SpuService {
	

	
	public static void main(String[] args) {
		
	List<SkuVO> mainPage = new SpuServiceImp().getMainPage();
		System.out.println(mainPage);
		
		
	}
	
	
	

	public int insertSPU(int ctgID, String spuName, String descript) {

		SpuVO spuVO = new SpuVO();
		if (spuName != null && descript != null) {

			spuVO.setCtgID(ctgID);
			spuVO.setSpuName(spuName);
			spuVO.setDescript(descript);

			return spuDao.inserSPU(spuVO).getSpuID();
		} else {
			return -1;
		}

	}

	@Override
	public List<SkuVO> getAllProd() {
		List<SkuVO> allProd = new ArrayList<>();
		Gson gson = new Gson();
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();

			SpuDAO spuDAO = session.getMapper(SpuDAO.class);
			allProd = spuDAO.getAllProd();
			// 考慮到前端畫面處理 轉為字串

			allProd =jsonPaser(allProd);

			session.commit();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return allProd;
	}
	
	// 之後需做修正
	@Override
	public List<SkuVO> queryByName(String prodName) {
		
		List<SkuVO> allProd = new ArrayList<>();
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();

			SpuDAO spuDAO = session.getMapper(SpuDAO.class);
			allProd = spuDAO.queryByName(prodName);
			
			allProd =jsonPaser(allProd);
			
			
			session.commit();
		} catch (Exception e) {
		
		}
		
		
		return allProd;
	}
	
	
	
	
	// 首頁
	@Override
	public List<SkuVO> getMainPage() {
		
		List<SkuVO> mainPage = new ArrayList<>();
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();

			SpuDAO spuDAO = session.getMapper(SpuDAO.class);
			 mainPage = spuDAO.getMainPage();
			
			mainPage = jsonPaser(mainPage);
			 
			session.commit();
			return mainPage;
		} catch (Exception e) {
		
		}
		
		
		return null;
	}
	
	
	// 分頁處理
	@Override
	public PageInfo< SkuVO> getMainPageHelper(int curPage, Integer pageSize) {
		
		// 用pageHelper
        PageHelper.startPage(curPage,pageSize);
     
        List<SkuVO> mainPage = getMainPage(); 

     
        // 2. 封裝 SkuVO 3. 並把list給pageInfo管理
        PageInfo< SkuVO> spuPageInfo = new PageInfo<>( mainPage);
        
        
        return  spuPageInfo;
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	//4/29 初版

	// json 轉換！！
	public final static String regEx = "[\n`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。， 、？]";
	
	// 只要給一個集合 就做轉換
	private static List<SkuVO> jsonPaser(List<SkuVO> allProd){
		
		Gson gson = new Gson();
		allProd.forEach(e -> {
			String fromJson = gson.fromJson(e.getSpecAttr(), String.class);
			// 型態為 k v k v 用內部類做轉換
			SpuAttrPasre data = gson.fromJson(fromJson, SpuAttrPasre.class);
			e.setSpecAttr(
					data.getAttrN1() + "\t" + data.getAttrV1() + "\t" + data.getAttrN2() + "\t" + data.getAttrV2());
		});
		return allProd;
	}
	
	
	

	
	
	
	
	// 內部類 僅用來做資料轉換
	@Data
	@AllArgsConstructor
	@NoArgsConstructor
	class SpuAttrPasre {
		private String attrN1;
		private String attrN2;
		private String attrV1;
		private String attrV2;
	}










	

}
