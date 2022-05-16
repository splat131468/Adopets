package web.authconfigure.service;

import java.util.List;

import web.authconfigure.dao.AuthConfigureDAO;
import web.authconfigure.dao.impl.AuthConfigureDAO_interface;
import web.authconfigure.entity.AdminAllVO;
import web.authconfigure.entity.AuthConfigureVO;

public class AuthConfigureService {
	
private AuthConfigureDAO_interface dao;
	
	public AuthConfigureService() {
		dao= new AuthConfigureDAO();
	}
	
	
	public AuthConfigureVO addAuthConfigure(Integer adminID,Integer authID) {

		AuthConfigureVO authConfigureVO = new AuthConfigureVO();
	
		authConfigureVO.setAdminID(adminID);
		authConfigureVO.setAuthID(authID);
		dao.insert(authConfigureVO);

		return authConfigureVO;
	}

	public AuthConfigureVO updateAuthConfigure(Integer adminID,Integer authID) {

		AuthConfigureVO authConfigureVO = new AuthConfigureVO();
		
		authConfigureVO.setAdminID(adminID);
		authConfigureVO.setAuthID(authID);
		dao.update(authConfigureVO);

		return authConfigureVO;
	}
	
		
	public void deleteAuthConfigure(Integer adminID) {
		dao.delete(adminID);
	}

	public List<Integer> getOneAuthConfigure(Integer adminID) {
		return dao.findByAdminID(adminID);
	}

	public List<AuthConfigureVO> getAll() {
		return dao.getAll();
	}
	
	public List<AdminAllVO> getFindByManager(Integer adminID) {
		return dao.findByManager(adminID);
	}
	
	public List<AdminAllVO> getFindAllManager() {
		return dao.findAllManager();
	}
}
