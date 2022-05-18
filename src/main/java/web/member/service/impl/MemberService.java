package web.member.service.impl;

import java.util.List;

import web.admin.entity.AdminVO;
import web.member.dao.MemberDAO_interface;
import web.member.dao.impl.MemberDAO;
import web.member.entity.MemberVO;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
//		dao = new MemberJDBCDAO();
		dao = new MemberDAO();
	}

	public MemberVO addMember(String account, String password, String name) {
		MemberVO memberVO = new MemberVO();

		memberVO.setAccount(account);
		memberVO.setPassword(password);
		memberVO.setName(name);
		dao.insert(memberVO);

		return memberVO;
	}

	public MemberVO updateMember(String account,String password, String name,
			String age,String phone, String address,byte[] personImg) {

		MemberVO memberVO = new MemberVO();
		
		memberVO.setAccount(account);
		memberVO.setPassword(password);
		memberVO.setName(name);
		memberVO.setAge(age);
		memberVO.setPhone(phone);
		memberVO.setAddress(address);
		memberVO.setPersonImg(personImg);
		dao.update(memberVO);

		return memberVO;
	}
	
	public MemberVO updateCreditcard(String creditCard) {
		
		MemberVO memberVO = new MemberVO();
		memberVO.setCreditCard(creditCard);
		return memberVO;
	}

	public void deleteMember(Integer memID) {
		dao.delete(memID);
	}

	public MemberVO getOneMember(Integer memID) {
		return dao.findByPrimaryKey(memID);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}
	
	public MemberVO selectAccount(String account) {
		return dao.selectAccount(account);
	}
	public MemberVO findPassword(String account,String password) {

		MemberVO memberVO = new MemberVO();
		memberVO.setAccount(account);
		memberVO.setPassword(password);
		dao.findPassword(memberVO);
		
		return memberVO;
	}
	
}
