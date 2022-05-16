package web.member.service.impl;

import java.util.List;

import web.member.dao.MemberDAO_interface;
import web.member.dao.impl.MemberJDBCDAO;
import web.member.entity.MemberVO;

public class MemberService {

	private MemberDAO_interface dao;

	public MemberService() {
		dao = new MemberJDBCDAO();
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

	public void deleteMember(Integer memID) {
		dao.delete(memID);
	}

	public MemberVO getOneMember(Integer memID) {
		return dao.findByPrimaryKey(memID);
	}

	public List<MemberVO> getAll() {
		return dao.getAll();
	}
}
