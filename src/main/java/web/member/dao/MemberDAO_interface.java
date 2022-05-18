package web.member.dao;

import java.util.List;
import java.util.Map;

import web.admin.entity.AdminVO;
import web.member.entity.MemberVO;

public interface MemberDAO_interface {
    public void insert(MemberVO memberVO);
    public void update(MemberVO memberVO);
    public void delete(Integer memID);
    public MemberVO findByPrimaryKey(Integer memID);
    public List<MemberVO> getAll();
    //萬用複合查詢(傳入參數型態Map)(回傳 List)
    public List<MemberVO> getAll(Map<String, String[]> map);
	public MemberVO checkAccount(String account); 
	public void findPassword(MemberVO memberVO);
	public MemberVO selectAccount(String account);
	void updateCreditCard(MemberVO memberVO);
}
