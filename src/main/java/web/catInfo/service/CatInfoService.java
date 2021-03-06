package web.catInfo.service;

import java.io.InputStream;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import web.catInfo.dao.CatAndShelDAO;
import web.catInfo.dao.CatInfoDAO;
import web.catInfo.dao.impl.CatInfoDAOimpl;
import web.catInfo.entity.CatAndShelVO;
import web.catInfo.entity.CatInfoVO;

public class CatInfoService {
	
	private CatInfoDAO dao;
	
	public CatInfoService() {
		dao = new CatInfoDAOimpl();
	}
	
	public CatInfoVO addCat(String shelterName, String catName, Integer age, String breed, String size, String sex, String coatColor, 
			String eyeColor, String health, Integer adoptCost, Date createDate, Boolean haveVaccine, Boolean adopt) {
		
		CatInfoVO catInfoVO = new CatInfoVO();
		catInfoVO.setShelterName(shelterName);
		catInfoVO.setCatName(catName);
		catInfoVO.setAge(age);
		catInfoVO.setBreed(breed);
		catInfoVO.setSize(size);
		catInfoVO.setSex(sex);
		catInfoVO.setCoatColor(coatColor);
		catInfoVO.setEyeColor(eyeColor);
		catInfoVO.setHealth(health);
		catInfoVO.setAdoptCost(adoptCost);
		catInfoVO.setCreateDate(createDate);
		catInfoVO.setHaveVaccine(haveVaccine);
		catInfoVO.setAdopt(adopt);
		dao.insert(catInfoVO);
		return catInfoVO;
		
	}
	

	public CatInfoVO updateCat(Integer memID, String shelterName, String catName, 
			Boolean haveVaccine, String health, Integer adoptCost, Boolean adopt, Integer catID) {
		
		CatInfoVO catInfoVO = new CatInfoVO();
		catInfoVO.setMemID(memID);
		catInfoVO.setShelterName(shelterName);
		catInfoVO.setCatName(catName);
		catInfoVO.setHaveVaccine(haveVaccine);
		catInfoVO.setHealth(health);
		catInfoVO.setAdoptCost(adoptCost);
		catInfoVO.setAdopt(adopt);
		catInfoVO.setCatID(catID);
//		try {
			dao.update(catInfoVO);
//		}catch (Exception e) {
//			throw new RuntimeException("資料庫發生錯誤 : 沒有這個會員");
//			e.printStackTrace();
//			System.out.println("service 抓到dao 的sql error");
//		}finally {			
			return catInfoVO;
//		}
//		return catInfoVO;
	}
	
	
	public List<CatInfoVO> getAll() {
		return dao.getAll();
	}
	
	public CatInfoVO getOne(Integer catID) {
		return dao.getOne(catID);
	}
	
	public void deleteCat(Integer catID) {
		dao.delete(catID);
	}
	
	public Integer getNewCatID() {
		Integer catID = null;
		catID = dao.getLastCatID();
		return catID;
	}
	
	public List<CatInfoVO> getMulti(CatInfoVO catInfoVO) {
		List<CatInfoVO> getMulti = new ArrayList<>();
//		System.out.println("service get : " + catInfoVO.getCreateDate());
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();
			CatInfoDAO catInfoDAO = session.getMapper(CatInfoDAO.class);
			getMulti = catInfoDAO.getMulti(catInfoVO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return getMulti;
	}
	public List<CatAndShelVO> getMulti(CatAndShelVO catAndShelVO) {
		List<CatAndShelVO> getMulti = new ArrayList<>();
//		System.out.println("service get : " + catInfoVO.getCreateDate());
		try {
			InputStream inputStream = Resources.getResourceAsStream("mybatis-config.xml");
			SqlSessionFactoryBuilder sqlSessionFactoryBuilder = new SqlSessionFactoryBuilder();
			SqlSessionFactory factory = sqlSessionFactoryBuilder.build(inputStream);
			SqlSession session = factory.openSession();
			CatAndShelDAO catAndShelDAO = session.getMapper(CatAndShelDAO.class);
			getMulti = catAndShelDAO.getMulti(catAndShelVO);
			session.commit();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return getMulti;
	}
	
	public List<CatInfoVO> getFavList(List<String> catList) {
		return dao.getFavList(catList);
	}
	
	public CatAndShelVO getOneAndShel(Integer catID) {
		return dao.getOneAndShel(catID);
	}
	
	

}
