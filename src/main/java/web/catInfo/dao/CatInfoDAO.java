package web.catInfo.dao;

import java.util.List;

import web.catInfo.entity.CatInfoVO;

public interface CatInfoDAO {
	
	public boolean insert(CatInfoVO catInfoVO);
	public boolean update(CatInfoVO catInfoVO);
	public boolean delete(Integer catID);
	public CatInfoVO getOne(Integer catID);
	public List<CatInfoVO> getAll();
	public Integer getLastCatID();
	public List<CatInfoVO> getMulti(CatInfoVO catInfoVO);

	

	
	
}
