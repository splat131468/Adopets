package web.product.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.List;

import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;

import javax.persistence.criteria.Root;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import web.product.dao.CategoryDAO;
import web.product.entity.CategoryVO;
import web.product.util.HibernateUtil;



public class CategoryDAOImp implements CategoryDAO {
	
	
	
	
	

//	public Integer queryCtgId(String ctgName) {
//
//		SessionFactory factory = HibernateUtil.getSessionFactory();
//		Session session = factory.getCurrentSession();
//		Transaction transaction = session.beginTransaction();
//
//		// 1. 取得builder
//		CriteriaBuilder builder = session.getCriteriaBuilder();
//
//		// 2. builder 取得createQuery 物件
//		CriteriaQuery<CategoryVO> query = builder.createQuery(CategoryVO.class);
//		Root<CategoryVO> root = query.from(CategoryVO.class);
//		Predicate p1 = builder.like(root.get("ctgName"), ctgName);
//		query = query.where(p1);
//		query.select(root);
//		// 第三部
//		TypedQuery<CategoryVO> typed = session.createQuery(query);
//		List<CategoryVO> list = typed.getResultList();
//
//
//		
//		
//		transaction.commit();
//		session.close();
//		HibernateUtil.closeSessionFactory();
//
//		return list.get(0).getCtgID();
//	}

	@Override
	public List<CategoryVO> getAllCategory() {
		
		 Session session = HibernateUtil.getSessionFactory().getCurrentSession();
		
		 session.beginTransaction();
		
		CriteriaBuilder builder = session.getCriteriaBuilder();
		
		
		CriteriaQuery<CategoryVO> query = builder.createQuery(CategoryVO.class);
		Root<CategoryVO> root = query.from(CategoryVO.class);
	
		query.select(root);
		// 第三部
		TypedQuery<CategoryVO> typed = session.createQuery(query);
		List<CategoryVO> list = typed.getResultList();
		session.getTransaction().commit();
		
		
		
		
//		HibernateUtil.closeSessionFactory();
		
		return list ;
	}
	
	
	public static void main(String[] args) {
		CategoryDAOImp daoImp = new CategoryDAOImp();
		Integer queryCtgId = daoImp.queryCtgId("貓罐頭");
		System.out.println(queryCtgId);
	}
	
	String url = "jdbc:mysql://localhost:3306/ADOPETS?useUnicode=yes&characterEncoding=utf8&useSSL=false&serverTimezone=Asia/Taipei";
	String user = "root";
	String password = "password";
	Connection con;
	String ctgSQl = "select ctgID from CATEGORY\n" + "where ctgName like ? ;";
	public Integer queryCtgId(String ctgName) {
		// 放id
		Integer ctgId = null;
		try (Connection connection = DriverManager.getConnection(url, user, password);
				PreparedStatement ps = connection.prepareStatement(ctgSQl);) {
			ps.setString(1, ctgName);

			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				ctgId = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return ctgId;
	}
	
	

}
