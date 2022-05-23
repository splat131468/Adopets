package web.member.dao;

import web.member.entity.MemberVO;

public interface LoginDao {
	public MemberVO login(String account, String password);
}

