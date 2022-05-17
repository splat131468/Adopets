package web.order.dao;

import java.util.List;

import web.order.entity.OrderDetailVO;



public interface OrderDetailDAO_interface {
	public void insert(OrderDetailVO orderDetailVO);
	public void update(OrderDetailVO orderDetailVO);
	public void delete(Integer orderDetailID);
	public OrderDetailVO findParmaryKey(Integer orderDetailID);
	public List<OrderDetailVO> getAll();
	public  int addDetails(List<OrderDetailVO> orderDetailVO);

}
