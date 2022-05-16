package web.order.service;

import java.util.ArrayList;
import java.util.List;

import web.order.dao.OrderDetailDAO_interface;
import web.order.dao.impl.OrderDetailDAO;
import web.order.dao.impl.OrderDetailJDBCDAO;
import web.order.entity.OrderDetailVO;
import web.product.entity.CartItem;
import web.product.entity.SkuVO;

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
	
	public int addDetails(List<SkuVO> skuVOs,Integer memID,Integer orderID,List<CartItem> cart) {
		
//		OrderDetailVO orderDetailVO = new OrderDetailVO();
		
		List<OrderDetailVO> orderDetailVOs = new ArrayList<OrderDetailVO>();
	
		for (int j = 0; j < cart.size(); j++) {
			for (int i = 0; i < skuVOs.size(); i++) {
				// 從redis找購物車有的skuID 將數量給訂單
				if (cart.get(j).getSkuID() == skuVOs.get(i).getSkuID()) {
					SkuVO e = skuVOs.get(i);
					orderDetailVOs.add(new OrderDetailVO(null, orderID, e.getSkuID(), e.getSpuVO().getSpuName(), cart.get(j).getNum(), e.getSkuPrice()));
					
				}
			}
		}
			
		return dao.addDetails(orderDetailVOs);
	}
}
