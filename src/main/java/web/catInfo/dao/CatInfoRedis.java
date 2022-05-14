package web.catInfo.dao;

public interface CatInfoRedis {
	
	public void jedisAdd(Integer memID, Integer catID);
	public void jedisDelete(Integer memID, Integer catID);

}
