package web.catInfo.dao;

import java.util.List;

import web.catInfo.entity.CatAndShelVO;
import web.catInfo.entity.CatInfoVO;

public interface CatAndShelDAO {
	
	public boolean insert(CatAndShelVO catAndShelVO);
	public boolean update(CatAndShelVO catAndShelVO);
	public boolean delete(Integer catID);
	public CatAndShelVO getOne(Integer catID);
	public List<CatAndShelVO> getAll();
	public Integer getLastCatID();
	public List<CatAndShelVO> getMulti(CatAndShelVO catAndShelVO);
	public List<CatAndShelVO> getFavList(List<String> catList);
	public CatAndShelVO getOneAndShel(Integer catID);

	
	
}
