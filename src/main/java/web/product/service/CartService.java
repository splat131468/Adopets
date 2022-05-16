package web.product.service;

import java.util.List;

import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;
import web.order.service.OrderDetailService;
import web.order.service.OrdersService;
import web.product.dao.CartDAO;
import web.product.dao.impl.CartDAOImp;
import web.product.entity.CartItem;
import web.product.entity.SkuVO;
import web.product.service.impl.CartServiceImp;
import web.product.service.impl.SkuServiceImp;
import web.product.service.impl.SpuServiceImp;

public interface CartService {

	CartDAO cartDao=new CartDAOImp();
	
	CartService cartService = new CartServiceImp();
	SpuService spuService = new SpuServiceImp();
	OrdersService orderService = new OrdersService();
	OrderDetailService orderDetailService = new OrderDetailService();
	SkuService skuService=new SkuServiceImp();
	
	
	String addItem(Integer memID,CartItem cartItem);
	
	String updateItem(Integer memID, CartItem cartItem);
	
	String delSingleItem(Integer memID, CartItem cartItem);
	
	String delMulItem(Integer memID, List<CartItem> cartItems);
	
	
	List<CartItem> getCart(Integer memID);
	
	
	Integer updateNum(Integer memID,CartItem cartItem);
	
	SkuVO updateCartItem(Integer memID, CartItem cartItem);
	
	List<OrderDetailVO>  cartCheckOut(List<Integer> skuIDArr);
	
	void takeOrder(List<Integer> skuIDArr, OrdersVO ordersVO, Integer memID); 
	
}
