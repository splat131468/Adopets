package web.donate.service;

import java.sql.Timestamp;
import java.util.List;

import web.donate.dao.DonateDAO;
import web.donate.dao.impl.DonateDAO_interface;
import web.donate.entity.DonateVO;



public class DonateService {
	
	private DonateDAO_interface dao;
	
	public DonateService() {
		dao =new DonateDAO();
	}
	
	public DonateVO addDonate(Integer memID,Integer catID,String shelterName, 
			String donateName,String donateEmail,String phone,String donateAddr,Integer donateAmo,
			Integer donateStatus,String donateMes) {

		DonateVO donateVO = new DonateVO();
	
		donateVO.setMemID(memID);
		donateVO.setCatID(catID);
		donateVO.setShelterName(shelterName);
		donateVO.setDonateName(donateName);
		donateVO.setDonateEmail(donateEmail);
		donateVO.setPhone(phone);
		donateVO.setDonateAddr(donateAddr);
		donateVO.setDonateAmo(donateAmo);
		donateVO.setDonateStatus(donateStatus);
		donateVO.setDonateMes(donateMes);
		Integer DonateID = dao.insert(donateVO);
		donateVO.setDonateID(DonateID);
		return donateVO;
	}

	public DonateVO updateDonate(Integer donateID, Integer donateStatus) {

		DonateVO donateVO = new DonateVO();

		donateVO.setDonateID(donateID);
		donateVO.setDonateStatus(donateStatus);
		dao.update(donateVO);

		return donateVO;
	}

	public void deleteDonate(Integer donateID) {
		dao.delete(donateID);
	}

	public DonateVO getOneDonate(Integer donateID) {
		return dao.findByPrimaryKey(donateID);
	}

	public List<DonateVO> getAll() {
		return dao.getAll();
	}
	
	public List<DonateVO> getDonateMember(Integer memID) {
		return dao.findByMember(memID);
	}
}