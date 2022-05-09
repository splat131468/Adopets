package web.auth.dao;

import java.util.List;

import web.auth.entity.AuthVO;


public interface AuthDAO_interface {
	  public void insert(AuthVO authVO);
      public void update(AuthVO authVO);
      public void delete(Integer authID);
      public AuthVO findByPrimaryKey(Integer authID);
      public List<AuthVO> getAll();
      //萬用複合查詢(傳入參數型態Map)(回傳 List)
//    public List<AuthVO> getAll(Map<String, String[]> map); 
}
