package web.order.service;

import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

import web.order.dao.OrdersDAO_interface;
import web.order.dao.impl.OrdersDAO;
import web.order.dao.impl.OrdersJDBCDAO;
import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;



public class OrdersService {

	private OrdersDAO_interface dao;

	public OrdersService() {
		dao = new OrdersJDBCDAO();
//		dao = new OrdersDAO();
	}

	public OrdersVO addOrder(Integer memID, Integer orderPrice, Integer orderStatus, Integer paymentType,
			String address) {

		OrdersVO ordersVO = new OrdersVO();

		ordersVO.setMemID(memID);
		ordersVO.setOrderPrice(orderPrice);
		ordersVO.setOrderStatus(orderStatus);
		ordersVO.setPaymentType(paymentType);
		ordersVO.setAddress(address);
		dao.insert(ordersVO);

		return ordersVO;
	}

	// 預留給 Struts 2 用的
	public void addOrder(OrdersVO ordersVO) {
		dao.insert(ordersVO);
	}

	public OrdersVO insertOrder(Integer memID, Timestamp createTime, Integer orderPrice, Integer orderStatus,
			Integer paymentType, String address) {

		OrdersVO ordersVO = new OrdersVO();

		ordersVO.setMemID(memID);
		ordersVO.setCreateTime(createTime);
		ordersVO.setOrderPrice(orderPrice);
		ordersVO.setOrderStatus(orderStatus);
		ordersVO.setPaymentType(paymentType);
		ordersVO.setAddress(address);
		dao.insert(ordersVO);

		return ordersVO;
	}

	public OrdersVO updateOrder(Integer orderID, Integer memID, Timestamp createTime, Integer orderPrice,
			Integer orderStatus, Integer paymentType, String address) {

		OrdersVO ordersVO = new OrdersVO();

		ordersVO.setOrderID(orderID);
		ordersVO.setMemID(memID);
		ordersVO.setCreateTime(createTime);
		ordersVO.setOrderPrice(orderPrice);
		ordersVO.setOrderStatus(orderStatus);
		ordersVO.setPaymentType(paymentType);
		ordersVO.setAddress(address);
		dao.update(ordersVO);

		return ordersVO;
	}

	public void deleteOrder(Integer orderID) {
		dao.delete(orderID);
	}

	public OrdersVO findPrimaryKeyOrder(Integer orderID) {
		return dao.findParmaryKey(orderID);
	}

	public List<OrdersVO> getAll() {
		return dao.getAll();
	}
	
	public Set<OrderDetailVO> getDetailByOrder(Integer orderID) {
		return dao.getDetailByOrder(orderID);
	}
}
