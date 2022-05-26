package web.admin.service;

import java.util.List;

import web.admin.dao.AdminDAO_interface;
import web.admin.dao.impl.AdminDAO;
import web.admin.entity.AdminVO;

public class AdminService {

	private AdminDAO_interface dao;

	public AdminService() {
		dao = new AdminDAO();
	}

	public AdminVO addAdmin(String account, String password, String name, byte[] personImg, boolean accStatus) {

		AdminVO adminVO = new AdminVO();

		adminVO.setAccount(account);
		adminVO.setPassword(password);
		adminVO.setName(name);
		adminVO.setPersonImg(personImg);
		adminVO.setAccStatus(accStatus);
		Integer adminID = dao.insert(adminVO); // 回傳自增主鍵
		adminVO.setAdminID(adminID);

		return adminVO;
	}

	public AdminVO updateManager(Integer adminID, String account, String password, String name, byte[] personImg,
			boolean accStatus) {

		AdminVO adminVO = new AdminVO();

		adminVO.setAdminID(adminID);
		adminVO.setAccount(account);
		adminVO.setPassword(password);
		adminVO.setName(name);
		adminVO.setPersonImg(personImg);
		adminVO.setAccStatus(accStatus);
		dao.update_MAM(adminVO);

		return adminVO;
	}

	public AdminVO updateEmployee(Integer adminID, String account, String password, String name, byte[] personImg) {

		AdminVO adminVO = new AdminVO();

		adminVO.setAdminID(adminID);
		adminVO.setAccount(account);
		adminVO.setPassword(password);
		adminVO.setName(name);
		adminVO.setPersonImg(personImg);
		dao.update_EMP(adminVO);

		return adminVO;
	}

	public void deleteAdmin(Integer adminID) {
		dao.delete(adminID);
	}

	public AdminVO getOneAdmin(Integer adminID) {
		return dao.findByPrimaryKey(adminID);
	}

	public List<AdminVO> getAll() {
		return dao.getAll();
	}

	public AdminVO checkLoginUser(String account, String password) {

		return dao.checkLogin(account, password);
	}

	public AdminVO findPassword(String account, String password) {

		AdminVO adminVO = new AdminVO();
		adminVO.setAccount(account);
		adminVO.setPassword(password);
		dao.findPassword(adminVO);

		return adminVO;
	}

	public AdminVO selectAccount(String account) {
		return dao.selectAccount(account);
	}

	public AdminVO selectName(Integer adminID) {
		return dao.selectName(adminID);
	}

}
