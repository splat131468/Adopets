package web.member.service.impl;

import web.member.dao.LoginDao;
import web.member.dao.impl.LoginDaoimpl;
import web.member.entity.MemberVO;

public class LonginService {
	private LoginDao dao;
	public LonginService() {
		dao = new LoginDaoimpl();
	}
	
	public MemberVO login(String account,String password) {
		return dao.login(account, password);
	}
}
