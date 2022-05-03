package web.catInfo.service;

import java.sql.Timestamp;
import java.util.List;

import web.catInfo.dao.CatPhotoGalleryDAO;
import web.catInfo.dao.impl.CatPhotoGalleryDAOImp;
import web.catInfo.entity.CatPhotoGalleryVO;


public class CatPhotoGalleryService {
	
	private CatPhotoGalleryDAO dao;
	
	public CatPhotoGalleryService() {
		dao = new CatPhotoGalleryDAOImp();
	}
	
	
	public CatPhotoGalleryVO addPhoto (Integer catID, byte[] catImg, Timestamp phtotDate) {
		CatPhotoGalleryVO catPhotoGalleryVO = new CatPhotoGalleryVO();
		catPhotoGalleryVO.setCatID(catID);
		catPhotoGalleryVO.setCatImg(catImg);
		catPhotoGalleryVO.setPhotoDate(phtotDate);
		dao.insert(catPhotoGalleryVO);
		return catPhotoGalleryVO;
	}
	
	public void deletePhoto(Integer imgID) {
		dao.delete(imgID);
	}
	
	public List<CatPhotoGalleryVO> getOneCat(Integer catID) {
		return dao.getOneCat(catID);
	}

}
