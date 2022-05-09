package web.auth.service;

import java.util.List;

import web.auth.dao.AuthDAO_interface;
import web.auth.dao.impl.AuthDAO;
import web.auth.entity.AuthVO;

public class AuthService {
	
	private AuthDAO_interface dao;
	
	public AuthService() {
		dao= new AuthDAO();
	}
	
	
	public AuthVO addAuth(String authName) {

		AuthVO authVO = new AuthVO();
	
		authVO.setAuthName(authName);
		dao.insert(authVO);

		return authVO;
	}

	public AuthVO updateAuth(Integer authID,String authName) {

		AuthVO authVO = new AuthVO();
		
		authVO.setAuthID(authID);
		authVO.setAuthName(authName);
		dao.update(authVO);

		return authVO;
	}
	
		
	public void deleteAuth(Integer authID) {
		dao.delete(authID);
	}

	public AuthVO getOneAuth(Integer authID) {
		return dao.findByPrimaryKey(authID);
	}

	public List<AuthVO> getAll() {
		return dao.getAll();
	}
}
