package web.admin.dao;

import java.util.List;

import web.admin.entity.AdminVO;

public interface AdminDAO_interface {
	 public Integer insert(AdminVO adminVO);
	 public void update_MAM(AdminVO adminVO);
	 public void update_EMP(AdminVO adminVO);
    public void delete(Integer adminID);
    public AdminVO findByPrimaryKey(Integer adminID);
    public List<AdminVO> getAll();
    public AdminVO checkLogin(String account,String password);
    
    public void findPassword(AdminVO adminVO);
    public AdminVO selectAccount(String account);
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
//  public List<AdminVO> getAll(Map<String, String[]> map); 
}
