package web.product.dao.impl;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.product.entity.ValueVO;
import web.product.util.HibernateUtil;






public class ValueDAOImp {
		

	public List<ValueVO> getAll() {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		List<ValueVO> list = new ArrayList<ValueVO>();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		
		CriteriaQuery<ValueVO> query = builder.createQuery(ValueVO.class);
		
		Root<ValueVO> root = query.from(ValueVO.class);
		
		TypedQuery<ValueVO> typed = session.createQuery(query);
		 list = typed.getResultList();
		
		
		
		transaction.commit();
		session.close();
		factory.close();
		return list;
	}

	public int insertValue(ValueVO valueVO) {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();

		if (valueVO.getAttrID() != null && valueVO.getValue() != null) {
			session.save(valueVO);
		}
		transaction.commit();
		session.close();
		factory.close();
		return valueVO.getAttrID();
	}

	public int delValue(int valID) {
		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		int index = -1;
		if (valID >= 0) {
			ValueVO valueVO = session.get(ValueVO.class, valID);
			session.delete(valueVO);
			index = 1;
		}
		transaction.commit();
		session.close();
		factory.close();
		return index;
	}

	public int updateVal(ValueVO valueVO) {

		SessionFactory factory = HibernateUtil.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction transaction = session.beginTransaction();
		int index = -1;
		if (valueVO.getValueID() != null) {

			ValueVO temp = session.get(ValueVO.class, valueVO.getValueID());
			// 確認有這個fk
			if (session.get(ValueVO.class, valueVO.getAttrID()) != null) {
				temp.setAttrID(valueVO.getAttrID());
			}

			temp.setValue(valueVO.getValue());
			index = 1;
		}
		transaction.commit();
		session.close();
		factory.close();
		return index;
	}

}
