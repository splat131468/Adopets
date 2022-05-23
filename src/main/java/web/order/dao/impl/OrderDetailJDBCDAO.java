package web.order.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import web.order.dao.OrderDetailDAO_interface;
import web.order.entity.OrderDetailVO;
import web.product.entity.PImgVO;



public class OrderDetailJDBCDAO implements OrderDetailDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ADOPETS?serverTimezone=Asia/Taipei";
	String userid = "root";
	String password = "password";

	private static final String INSERT_ORDERDETAIL = "insert into ORDERDETAIL (orderID,skuID,prodName,"
			+ "prodNum,prodPrice) values (?,?,?,?,?)";
	private static final String UPDATE_ORDERDETAIL = "update ORDERDETAIL set orderID=?, skuID=?, prodName=?,"
			+ "prodNum=?, prodPrice=? where orderDetailID=? ";
	private static final String DELETE_ORDERDETAIL = "delete from ORDERDETAIL where orderDetailID=?";
	private static final String FINDPARMARYKEY_ORDERDETAIL = "select orderDetailID, orderID,skuID,prodName,"
			+ "prodNum,prodPrice from ORDERDETAIL where orderDetailID=?";
	private static final String GETALL_ORDERDETAIL = "select orderDetailID,orderID,skuID,prodName,"
			+ "prodNum,prodPrice from ORDERDETAIL order by orderDetailID";


	@Override
	public void insert(OrderDetailVO orderDetailVO) {
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(INSERT_ORDERDETAIL);

			ppst.setInt(1, orderDetailVO.getOrderID());
			ppst.setInt(2, orderDetailVO.getSkuID());
			ppst.setString(3, orderDetailVO.getProdName());
			ppst.setInt(4, orderDetailVO.getProdNum());
			ppst.setInt(5, orderDetailVO.getProdPrice());

			ppst.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (ppst != null) {
				try {
					ppst.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void update(OrderDetailVO orderDetailVO) {
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(UPDATE_ORDERDETAIL);

			ppst.setInt(1, orderDetailVO.getOrderID());
			ppst.setInt(2, orderDetailVO.getSkuID());
			ppst.setString(3, orderDetailVO.getProdName());
			ppst.setInt(4, orderDetailVO.getProdNum());
			ppst.setInt(5, orderDetailVO.getProdPrice());
			ppst.setInt(6, orderDetailVO.getOrderDetailID());

			ppst.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (ppst != null) {
				try {
					ppst.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public void delete(Integer orderDetailID) {
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(DELETE_ORDERDETAIL);

			ppst.setInt(1, orderDetailID);

			ppst.executeUpdate();

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (ppst != null) {
				try {
					ppst.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

	}

	@Override
	public OrderDetailVO findParmaryKey(Integer orderDetailId) {
		OrderDetailVO orderDetailVO = null;
		Connection con = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(FINDPARMARYKEY_ORDERDETAIL);

			ppst.setInt(1, orderDetailId);

			rs = ppst.executeQuery();

			while (rs.next()) {
				orderDetailVO = new OrderDetailVO();
				orderDetailVO.setOrderDetailID(rs.getInt("orderDetailID"));
				orderDetailVO.setOrderID(rs.getInt("orderID"));
				orderDetailVO.setSkuID(rs.getInt("skuId"));
				orderDetailVO.setProdName(rs.getString("prodName"));
				orderDetailVO.setProdNum(rs.getInt("prodNum"));
				orderDetailVO.setProdPrice(rs.getInt("prodPrice"));

			}

		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (ppst != null) {
				try {
					ppst.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}

		return orderDetailVO;
	}

	@Override
	public List<OrderDetailVO> getAll() {
		List<OrderDetailVO> list = new ArrayList<OrderDetailVO>();
		OrderDetailVO orderDetailVO = null;
		Connection con = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(GETALL_ORDERDETAIL);
			
			rs = ppst.executeQuery();
			
			while (rs.next()) {
				orderDetailVO = new OrderDetailVO();
				orderDetailVO.setOrderDetailID(rs.getInt("orderDetailID"));
				orderDetailVO.setOrderID(rs.getInt("orderID"));
				orderDetailVO.setSkuID(rs.getInt("skuId"));
				orderDetailVO.setProdName(rs.getString("prodName"));
				orderDetailVO.setProdNum(rs.getInt("prodNum"));
				orderDetailVO.setProdPrice(rs.getInt("prodPrice"));
				list.add(orderDetailVO); // Store the row in the list

			}
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. " + e.getMessage());
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. " + se.getMessage());
		} finally {
			if (ppst != null) {
				try {
					ppst.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (con != null) {
				try {
					con.close();
				} catch (Exception e) {
					e.printStackTrace(System.err);
				}
			}
		}
		return list;
	}

	public static void main(String[] args) {

		OrderDetailJDBCDAO dao = new OrderDetailJDBCDAO();

		// 新增
		OrderDetailVO orderDetailVO1 = new OrderDetailVO();
		orderDetailVO1.setOrderID(5);
		orderDetailVO1.setSkuID(2);
		orderDetailVO1.setProdName("貓罐頭");
		orderDetailVO1.setProdNum(1);
		orderDetailVO1.setProdPrice(300);
		dao.insert(orderDetailVO1);

		// 修改
//		OrderDetailVO orderDetailVO2 = new OrderDetailVO();
//		orderDetailVO2.setOrderDetailID(4);
//		orderDetailVO2.setOrderID(5);
//		orderDetailVO2.setSkuID(2);
//		orderDetailVO2.setProdName("高級貓屋");
//		orderDetailVO2.setProdNum(1);
//		orderDetailVO2.setProdPrice(6000);
//		dao.update(orderDetailVO2);

		// 刪除
//		dao.delete(2);

		// 查詢
//		OrderDetailVO orderDetailVO3 = dao.findParmaryKey(2);
//		System.out.print(orderDetailVO3.getOrderDetailID() + ",");
//		System.out.print(orderDetailVO3.getOrderID() + ",");
//		System.out.print(orderDetailVO3.getSkuID() + ",");
//		System.out.print(orderDetailVO3.getProdName() + ",");
//		System.out.print(orderDetailVO3.getProdNum() + ",");
//		System.out.print(orderDetailVO3.getProdPrice() + ",");
//		System.out.println("---------------------");

		// 查詢
//		List<OrderDetailVO> list = dao.getAll();
//		for (OrderDetailVO OrderDetail : list) {
//			System.out.print(OrderDetail.getOrderDetailID() + ",");
//			System.out.print(OrderDetail.getOrderID() + ",");
//			System.out.print(OrderDetail.getSkuID() + ",");
//			System.out.print(OrderDetail.getProdName() + ",");
//			System.out.print(OrderDetail.getProdNum() + ",");
//			System.out.print(OrderDetail.getProdPrice() + ",");
//			System.out.println();
//		}
	}

	private static final String INSERT_ORDERDETAILS = "insert into ORDERDETAIL (orderID,skuID,prodName,"
			+ "prodNum,prodPrice) values (?,?,?,?,?)";	
	
	@Override
	public int addDetails(List<OrderDetailVO> orderDetailVO) {
		int res = -1;
		try (Connection connection = DriverManager.getConnection(url, userid, password);
				PreparedStatement ps = connection.prepareStatement(INSERT_ORDERDETAILS);) {
			for (OrderDetailVO vo : orderDetailVO) {
			
			ps.setInt(1, vo.getOrderID());
			ps.setInt(2, vo.getSkuID());
			ps.setString(3, vo.getProdName());
			ps.setInt(4, vo.getProdNum());
			ps.setInt(5, vo.getProdPrice());		

				ps.addBatch();
			}
			ps.executeBatch();
			res=1;

		} catch (Exception e) {
			e.printStackTrace();
		}

		return res;
	
		
		
		
	}

}
