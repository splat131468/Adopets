package web.order.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import web.order.dao.OrderDetailDAO_interface;
import web.order.entity.OrderDetailVO;

public class OrderDetailDAO implements OrderDetailDAO_interface {
	private static DataSource ds = null;
	static {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/ADOPETS");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
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
			con = ds.getConnection();
			ppst = con.prepareStatement(INSERT_ORDERDETAIL);

			ppst.setInt(1, orderDetailVO.getOrderID());
			ppst.setInt(2, orderDetailVO.getSkuID());
			ppst.setString(3, orderDetailVO.getProdName());
			ppst.setInt(4, orderDetailVO.getProdNum());
			ppst.setInt(5, orderDetailVO.getProdPrice());

			ppst.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			con = ds.getConnection();
			ppst = con.prepareStatement(UPDATE_ORDERDETAIL);

			ppst.setInt(1, orderDetailVO.getOrderID());
			ppst.setInt(2, orderDetailVO.getSkuID());
			ppst.setString(3, orderDetailVO.getProdName());
			ppst.setInt(4, orderDetailVO.getProdNum());
			ppst.setInt(5, orderDetailVO.getProdPrice());
			ppst.setInt(6, orderDetailVO.getOrderDetailID());

			ppst.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			con = ds.getConnection();
			ppst = con.prepareStatement(DELETE_ORDERDETAIL);

			ppst.setInt(1, orderDetailID);

			ppst.executeUpdate();

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			con = ds.getConnection();
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

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
			con = ds.getConnection();
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

		} catch (SQLException e) {
			throw new RuntimeException("A database error occured. " + e.getMessage());
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
	public int addDetails(List<OrderDetailVO> orderDetailVO) {
		// TODO Auto-generated method stub
		return 0;
	}

}
