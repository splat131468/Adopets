package web.product.util;

import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;
import web.order.service.OrderDetailService;
import web.order.service.OrdersService;

public class TestOrder {

	public static void main(String[] args) {

		testOrderDetail();
	}

	public void testOrder() {

		OrdersService ordersService = new OrdersService();

		OrdersVO ordersVO = new OrdersVO();

//		ordersVO.setMemID(memID);
//		ordersVO.setOrderPrice(orderPrice); // 總價格
//		ordersVO.setOrderStatus(orderStatus);
//		ordersVO.setPaymentType(paymentType);
//		ordersVO.setAddress(address);

		OrdersVO addOrder = ordersService.addOrder(1, 1000, 0, 1, "台北市");

		System.out.println(addOrder);
	}
	
	public static void testOrderDetail() {
		
		OrderDetailService orderDetailService =
				new OrderDetailService();
		OrderDetailVO addOrderDetail = orderDetailService
		.addOrderDetail(new Integer(1),new Integer(1),"forTest",new Integer(10),new Integer(1000));
		System.out.println(addOrderDetail);

		
	}
	

}
