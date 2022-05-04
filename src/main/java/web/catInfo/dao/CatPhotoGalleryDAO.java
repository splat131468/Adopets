package web.catInfo.dao;

import java.util.List;

import web.catInfo.entity.CatPhotoGalleryVO;

public interface CatPhotoGalleryDAO {
	
	public boolean insert(CatPhotoGalleryVO catPhotoGallery);
	public boolean delete(Integer imgID);
	public List<CatPhotoGalleryVO> getOneCat(Integer catID);

}
 