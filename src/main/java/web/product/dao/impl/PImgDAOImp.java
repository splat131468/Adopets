package web.product.dao.impl;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.product.dao.PImgDAO;
import web.product.entity.PImgVO;
import web.product.util.HibernateUtil;



public class PImgDAOImp implements PImgDAO {

	public int uploadPics(List<PImgVO> imgList) {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		int index = -1;
		imgList.forEach(item -> {
			session.save(item);
		});

		index = 1;

		transaction.commit();
		session.close();
		factory.close();

		return index;
	}

	@Override
	public PImgVO getPicByID(Integer skuID) {
		// TODO Auto-generated method stub
		return null;
	}
}
