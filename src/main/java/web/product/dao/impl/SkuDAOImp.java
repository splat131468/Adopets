package web.product.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.product.dao.SkuDAO;
import web.product.entity.SkuVO;
import web.product.util.HibernateUtil;



public class SkuDAOImp implements SkuDAO {

	@Override
	public int insertSKU(List<SkuVO> skus) {

		
		//Hibernate
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		int index = -1;
		skus.forEach(item -> {
			session.save(item);

		});
		index = 1;

		transaction.commit();
		session.close();
		factory.close();

		return index;
	}

	@Override
	public int updateProd(SkuVO skuVO) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int updateProds(List<SkuVO> skus) {
		// TODO Auto-generated method stub
		return 0;
	}

	

}
