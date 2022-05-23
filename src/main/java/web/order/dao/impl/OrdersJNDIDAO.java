package web.order.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.order.dao.OrdersDAO_interface;
import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;

public class OrdersJNDIDAO implements OrdersDAO_interface {

	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ADOPETS");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}

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
			+ "prodNum, prodPrice from ORDERDETAIL where orderID =? order by orderDetailID ";
	private static final String FINDMEMBER_ORDERS = "select orderID,memID,createTime,orderPrice,"
			+ "orderStatus,paymentType,address from ORDERS where memID=?";

	@Override
	public void insert(OrdersVO ordersVO) {
		Connection con = null;
		PreparedStatement ppst = null;

		try {
			con = ds.getConnection();
			ppst = con.prepareStatement(INSERT_ORDERS);

			ppst.setInt(1, ordersVO.getMemID());
			ppst.setInt(2, ordersVO.getOrderPrice());
			ppst.setInt(3, ordersVO.getOrderStatus());
			ppst.setInt(4, ordersVO.getPaymentType());
			ppst.setString(5, ordersVO.getAddress());

			ppst.executeUpdate();

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
			con = ds.getConnection();
			ppst = con.prepareStatement(UPDATE_ORDERS);

			ppst.setInt(1, ordersVO.getMemID());
			ppst.setInt(2, ordersVO.getOrderPrice());
			ppst.setInt(3, ordersVO.getOrderStatus());
			ppst.setInt(4, ordersVO.getPaymentType());
			ppst.setString(5, ordersVO.getAddress());
			ppst.setInt(6, ordersVO.getOrderID());

			ppst.executeUpdate();

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
			
			con = ds.getConnection();
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
			con = ds.getConnection();
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
	public OrdersVO findMemberOrder(Integer memID) {
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			ppst = con.prepareStatement(FINDMEMBER_ORDERS);

			ppst.setInt(1, memID);

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
	public List<OrdersVO> getAll() {
		List<OrdersVO> list = new ArrayList<OrdersVO>();
		OrdersVO ordersVO = null;
		Connection con = null;
		PreparedStatement ppst = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
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
	
			con = ds.getConnection();
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

	@Override
	public int makeOrder(OrdersVO ordersVO) {
		// TODO Auto-generated method stub
		return 0;
	}


}
