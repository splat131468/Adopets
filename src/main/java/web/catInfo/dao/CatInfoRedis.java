package web.catInfo.dao;

import web.catInfo.entity.CatInfoVO;

public interface CatInfoRedis {
	
	public void jedisAdd(Integer memID, Integer catID);
	public void jedisAddCatVO(Integer memID, Integer catID);
	public void jedisDelete(Integer memID, Integer catID);

}
