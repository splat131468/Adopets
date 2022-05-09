package web.order.service;

import java.util.List;

import web.order.dao.OrderDetailDAO_interface;
import web.order.dao.impl.OrderDetailDAO;
import web.order.dao.impl.OrderDetailJDBCDAO;
import web.order.entity.OrderDetailVO;

public class OrderDetailService {

	private OrderDetailDAO_interface dao;

	public OrderDetailService() {
		dao = new OrderDetailJDBCDAO();
//		dao = new OrderDetailDAO();
	}

	public OrderDetailVO addOrderDetail(Integer orderID, Integer skuID, String prodName, Integer prodNum,
			Integer prodPrice) {

		OrderDetailVO orderDetailVO = new OrderDetailVO();

		orderDetailVO.setOrderID(orderID);
		orderDetailVO.setSkuID(skuID);
		orderDetailVO.setProdName(prodName);
		orderDetailVO.setProdNum(prodNum);
		orderDetailVO.setProdPrice(prodPrice);
		dao.insert(orderDetailVO);

		return orderDetailVO;
	}

	// 預留給 Struts 2 用的
	public void addOrderDetail(OrderDetailVO orderDetailVO) {
		dao.insert(orderDetailVO);
	}

	public OrderDetailVO insertOrderDetail(Integer orderID, Integer skuID, String prodName, Integer prodNum,
			Integer prodPrice) {

		OrderDetailVO orderDetailVO = new OrderDetailVO();

		orderDetailVO.setOrderID(orderID);
		orderDetailVO.setSkuID(skuID);
		orderDetailVO.setProdName(prodName);
		orderDetailVO.setProdNum(prodNum);
		orderDetailVO.setProdPrice(prodPrice);
		dao.insert(orderDetailVO);

		return orderDetailVO;
	}

	public OrderDetailVO updateOrderDetail(Integer orderDetailID, Integer orderID, Integer skuID, String prodName,
			Integer prodNum, Integer prodPrice) {

		OrderDetailVO orderDetailVO = new OrderDetailVO();

		orderDetailVO.setOrderDetailID(orderDetailID);
		orderDetailVO.setOrderID(orderID);
		orderDetailVO.setSkuID(skuID);
		orderDetailVO.setProdName(prodName);
		orderDetailVO.setProdNum(prodNum);
		orderDetailVO.setProdPrice(prodPrice);
		dao.update(orderDetailVO);

		return orderDetailVO;
	}

	public void deleteOrderDetail(Integer orderDetailID) {
		dao.delete(orderDetailID);
	}

	public OrderDetailVO findPrimaryKeyOrderDetail(Integer orderDetailID) {
		return dao.findParmaryKey(orderDetailID);
	}

	public List<OrderDetailVO> getAll() {
		return dao.getAll();
	}
}
