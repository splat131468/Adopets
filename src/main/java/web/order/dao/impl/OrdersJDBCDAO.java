package web.order.dao.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import web.order.dao.OrdersDAO_interface;
import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;


public class OrdersJDBCDAO implements OrdersDAO_interface {

	String driver = "com.mysql.cj.jdbc.Driver";
	String url = "jdbc:mysql://localhost:3306/ADOPETS?serverTimezone=Asia/Taipei";
	String userid = "root";
	String password = "password";

	private static final String INSERT_ORDERS = "insert into ORDERS (memID,orderPrice,"
			+ "orderStatus,paymentType,address) values (?,?,?,?,?)";
	private static final String UPDATE_ORDERS = "update ORDERS set memID=?, orderPrice=?,"
			+ "orderStatus=?, paymentType=?, address=? where orderID=? ";
	private static final String DELETE_ORDERS = "delete from ORDERS where orderID=?";
	private static final String DELETE_ORDERDETAIL = "delete from ORDERDETAIL where orderID=?";
	private static final String FINDPARMARYKEY_ORDERS = "select orderID,memID,createTime,orderPrice,"
			+ "orderStatus,paymentType,address from ORDERS where orderID=?";
	private static final String GETALL_ORDERS = "select orderID, memID, createTime,orderPrice,"
			+ "orderStatus,paymentType,address from ORDERS order by orderID";
	private static final String GET_DETAIL_BYORDER ="select orderDetailID, orderID, skuID, prodName,"
			+ "prodNum, prodPrice from ORDERDETAIL where orderID =? order by orderDetailID";

	@Override
	public void insert(OrdersVO ordersVO) {
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(INSERT_ORDERS);

			ppst.setInt(1, ordersVO.getMemID());
			ppst.setInt(2, ordersVO.getOrderPrice());
			ppst.setInt(3, ordersVO.getOrderStatus());
			ppst.setInt(4, ordersVO.getPaymentType());
			ppst.setString(5, ordersVO.getAddress());

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
	public void update(OrdersVO ordersVO) {
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(UPDATE_ORDERS);

			ppst.setInt(1, ordersVO.getMemID());
			ppst.setInt(2, ordersVO.getOrderPrice());
			ppst.setInt(3, ordersVO.getOrderStatus());
			ppst.setInt(4, ordersVO.getPaymentType());
			ppst.setString(5, ordersVO.getAddress());
			ppst.setInt(6, ordersVO.getOrderID());

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
	public void delete(Integer orderID) {
		int updateCount_Detail = 0;
		
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			// 1●設定於 pstm.executeUpdate()之前
			con.setAutoCommit(false);
			// 先刪除明細
			ppst = con.prepareStatement(DELETE_ORDERDETAIL);
			ppst.setInt(1, orderID);
			updateCount_Detail = ppst.executeUpdate();
			// 再刪除訂單
			ppst = con.prepareStatement(DELETE_ORDERS);
			ppst.setInt(1, orderID);
			ppst.executeUpdate();
			
			// 2●設定於 pstm.executeUpdate()之後
			con.commit();
			con.setAutoCommit(true);

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
	public OrdersVO findParmaryKey(Integer orderID) {

		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(FINDPARMARYKEY_ORDERS);

			ppst.setInt(1, orderID);

			rs = ppst.executeQuery();

			while (rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrderID(rs.getInt("orderID"));
				ordersVO.setMemID(rs.getInt("memID"));
				ordersVO.setCreateTime(rs.getTimestamp("createTime"));
				ordersVO.setOrderPrice(rs.getInt("orderPrice"));
				ordersVO.setOrderStatus(rs.getInt("orderStatus"));
				ordersVO.setPaymentType(rs.getInt("paymentType"));
				ordersVO.setAddress(rs.getString("address"));

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

		return ordersVO;
	}

	@Override
	public List<OrdersVO> getAll() {
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(GETALL_ORDERS);

			rs = ppst.executeQuery();

			while (rs.next()) {
				ordersVO = new OrdersVO();
				ordersVO.setOrderID(rs.getInt("orderID"));
				ordersVO.setMemID(rs.getInt("memID"));
				ordersVO.setCreateTime(rs.getTimestamp("createTime"));
				ordersVO.setOrderPrice(rs.getInt("orderPrice"));
				ordersVO.setOrderStatus(rs.getInt("orderStatus"));
				ordersVO.setPaymentType(rs.getInt("paymentType"));
				ordersVO.setAddress(rs.getString("address"));
				list.add(ordersVO);
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
	
	@Override
	public Set<OrderDetailVO> getDetailByOrder(Integer orderID) {
		Set<OrderDetailVO> set = new LinkedHashSet<OrderDetailVO>();
		OrderDetailVO orderDetailVO = null;
	
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try {
	
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			pstmt = con.prepareStatement(GET_DETAIL_BYORDER);
			pstmt.setInt(1, orderID);
			
			rs = pstmt.executeQuery();
	
			while (rs.next()) {
				orderDetailVO = new OrderDetailVO();
				orderDetailVO.setOrderDetailID(rs.getInt("orderDetailID"));
				orderDetailVO.setOrderID(rs.getInt("orderID"));
				orderDetailVO.setSkuID(rs.getInt("skuID"));
				orderDetailVO.setProdName(rs.getString("prodName"));
				orderDetailVO.setProdNum(rs.getInt("prodNum"));
				orderDetailVO.setProdPrice(rs.getInt("prodPrice"));
				set.add(orderDetailVO); // Store the row in the vector
			}
	
			// Handle any driver errors
		} catch (ClassNotFoundException e) {
			throw new RuntimeException("Couldn't load database driver. "
					+ e.getMessage());
			// Handle any SQL errors
		} catch (SQLException se) {
			throw new RuntimeException("A database error occured. "
					+ se.getMessage());
		} finally {
			if (rs != null) {
				try {
					rs.close();
				} catch (SQLException se) {
					se.printStackTrace(System.err);
				}
			}
			if (pstmt != null) {
				try {
					pstmt.close();
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
		return set;
	}

	public static void main(String[] args) {

		OrdersJDBCDAO dao = new OrdersJDBCDAO();

		// 新增
//		OrdersVO ordersVO1 = new OrdersVO();
//		ordersVO1.setMemID(2);
//		ordersVO1.setOrderPrice(300);
//		ordersVO1.setOrderStatus(1);
//		ordersVO1.setPaymentType(1);
//		ordersVO1.setAddress("台北市大安區羅斯福路一段77號");
//		dao.insert(ordersVO1);
//
//		// 修改
//		OrdersVO ordersVO2 = new OrdersVO();
//		
//		ordersVO2.setMemID(1);
//		ordersVO2.setOrderPrice(500);
//		ordersVO2.setOrderStatus(1);
//		ordersVO2.setPaymentType(1);
//		ordersVO2.setAddress("台北市大安區羅斯福路一段77號");
//		ordersVO2.setOrderID(2);
//		dao.update(ordersVO2);
//
//		// 刪除
//		dao.delete(67);
//
		// 查詢
//		OrdersVO ordersVO3 = dao.findParmaryKey(5);
//		System.out.print(ordersVO3);
//		System.out.print(ordersVO3.getOrderID() + ",");
//		System.out.print(ordersVO3.getMemID() + ",");
//		System.out.print(ordersVO3.getCreateTime() + ",");
//		System.out.print(ordersVO3.getOrderPrice() + ",");
//		System.out.print(ordersVO3.getOrderStatus() + ",");
//		System.out.print(ordersVO3.getPaymentType() + ",");
//		System.out.print(ordersVO3.getAddress() + ",");
//		System.out.println("---------------------");

		// 查詢
//		List<OrdersVO> list = dao.getAll();
//		System.out.println("---------------------");
//		for (OrdersVO Orders : list) {
//			System.out.print(Orders.getOrderID() + ",");
//			System.out.print(Orders.getMemID() + ",");
//			System.out.print(Orders.getCreateTime() + ",");
//			System.out.print(Orders.getOrderPrice() + ",");
//			System.out.print(Orders.getOrderStatus() + ",");
//			System.out.print(Orders.getPaymentType() + ",");
//			System.out.print(Orders.getAddress() + ",");
//			System.out.println();
//	}
	Set<OrderDetailVO> set = dao.getDetailByOrder(5);
	for (OrderDetailVO detail : set) {
		System.out.print(detail.getOrderDetailID() + ",");
		System.out.print(detail.getOrderID() + ",");
		System.out.print(detail.getSkuID() + ",");
		System.out.print(detail.getProdName() + ",");
		System.out.print(detail.getProdNum() + ",");
		System.out.print(detail.getProdPrice() + ",");
		System.out.println();
	}
	}

	// gk 
	
	private static final String INSERT_GK = "insert into ORDERS (memID,orderPrice,"
			+ "orderStatus,paymentType,address) values (?,?,?,?,?)";
	@Override
	public int makeOrder(OrdersVO ordersVO) {
		
		String columns[] = { "orderID" };
		
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			Class.forName(driver);
			con = DriverManager.getConnection(url, userid, password);
			ppst = con.prepareStatement(INSERT_ORDERS,columns);

			ppst.setInt(1, ordersVO.getMemID());
			ppst.setInt(2, ordersVO.getOrderPrice());
			ppst.setInt(3, ordersVO.getOrderStatus());
			ppst.setInt(4, ordersVO.getPaymentType());
			ppst.setString(5, ordersVO.getAddress());

			ppst.executeUpdate();
			
			ResultSet rs = ppst.getGeneratedKeys();
            if (rs.next()) {
                int id = rs.getInt(1);
               return id;
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
		return -1;
	}
}
