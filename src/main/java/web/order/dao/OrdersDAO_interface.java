package web.order.dao;

import java.util.List;
import java.util.Set;

import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;




public interface OrdersDAO_interface {
	
	public void insert(OrdersVO ordersVO);
	public void update(OrdersVO ordersVO);
	public void delete(Integer orderID);
	public OrdersVO findParmaryKey(Integer orderID);
	public List<OrdersVO> getAll();
	public Set<OrderDetailVO> getDetailByOrder(Integer orderID);
	// 建立訂單
	public int makeOrder(OrdersVO ordersVO);
	  

}
