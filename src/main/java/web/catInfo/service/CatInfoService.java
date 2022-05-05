package web.catInfo.service;

import java.sql.Date;
import java.util.List;

import web.catInfo.dao.CatInfoDAO;
import web.catInfo.dao.impl.CatInfoDAOimpl;
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
		try {
			dao.update(catInfoVO);
			return catInfoVO;
		}catch (Exception e) {
			throw new RuntimeException("資料庫發生錯誤 : 沒有這個會員");
//			System.out.println("service 抓到dao 的sql error");
		}finally {			
//			return catInfoVO;
		}
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

}
