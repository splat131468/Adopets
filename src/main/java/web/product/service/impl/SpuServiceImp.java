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
import web.product.entity.ProdSelection;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;
import web.product.service.SpuService;

public class SpuServiceImp implements SpuService {

	public static void main(String[] args) {
		PageInfo<SkuVO> mainPage = new SpuServiceImp().getMainPage(1, 3);
		long total = mainPage.getTotal();
		System.out.println(total);
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

			allProd = jsonPaser(allProd);

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
			allProd = jsonPaser(allProd);
			session.commit();
		} catch (Exception e) {

		}

		return allProd;
	}

	// 首頁 分頁處理
	@Override
	public PageInfo<SkuVO> getMainPage(int curPage, Integer pageSize) {

		List<SkuVO> mainPage = new ArrayList<>();
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();

			SpuDAO spuDAO = session.getMapper(SpuDAO.class);

			PageHelper.startPage(curPage, pageSize);
			mainPage = spuDAO.getMainPage();
			mainPage = jsonPaser(mainPage);
			PageInfo<SkuVO> spuPageInfo = new PageInfo<>(mainPage);

			session.commit();
			return spuPageInfo;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public PageInfo<SkuVO> selectedPage(ProdSelection prodSelection,Integer curPage, Integer pageSize) {

		List<SkuVO> selectedPage = new ArrayList<>();
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();

			SpuDAO spuDAO = session.getMapper(SpuDAO.class);
			
			// 每次查詢 若沒有指定頁碼就預設為1
			if(curPage!=null) {
				PageHelper.startPage(curPage, pageSize);
			}else {
				PageHelper.startPage(1, pageSize);
			}	
			selectedPage = spuDAO.selectedPage(prodSelection);
			selectedPage = jsonPaser(selectedPage);
			PageInfo<SkuVO> spuPageInfo = new PageInfo<>(selectedPage);

			session.commit();
			return spuPageInfo;
		} catch (Exception e) {
			e.printStackTrace();
		}

		return null;
	}

	// 4/29 初版

	// json 轉換！！
	public final static String regEx = "[\n`~!@#$%^&*()+=|{}':;',\\[\\].<>/?~！@#￥%……&*（）——+|{}【】‘；：”“’。， 、？]";

	// 只要給一個集合 就做轉換
	private static List<SkuVO> jsonPaser(List<SkuVO> allProd) {

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
