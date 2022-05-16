package web.donate.dao.impl;

import java.util.List;

import web.donate.entity.DonateVO;

public interface DonateDAO_interface {
	  public void insert(DonateVO donateVO);
	  public void update(DonateVO donateVO);
      public void delete(Integer donateID);
      public DonateVO findByPrimaryKey(Integer donateID);
      public List<DonateVO> getAll();
      //萬用複合查詢(傳入參數型態Map)(回傳 List)
//    public List<DonateVO> getAll(Map<String, String[]> map); 
}
