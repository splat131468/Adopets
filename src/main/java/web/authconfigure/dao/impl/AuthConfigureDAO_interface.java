package web.authconfigure.dao.impl;

import java.util.List;

import web.authconfigure.entity.AdminAllVO;
import web.authconfigure.entity.AuthConfigureVO;



public interface AuthConfigureDAO_interface {
	  public void insert(AuthConfigureVO authConfigureVO);
      public void update(AuthConfigureVO authConfigureVO);
      public void delete(Integer adminID);
      public List<Integer> findByAdminID(Integer adminID);
      public List<AuthConfigureVO> getAll();
      
      public List<AdminAllVO> findAllManager();
      
      public List<AdminAllVO> findByManager(Integer adminID);
      //萬用複合查詢(傳入參數型態Map)(回傳 List)
//    public List<AuthConfigureVO> getAll(Map<String, String[]> map); 
}
