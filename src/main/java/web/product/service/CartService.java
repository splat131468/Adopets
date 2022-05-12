package web.product.service;

import java.util.List;

import web.product.dao.CartDAO;
import web.product.dao.impl.CartDAOImp;
import web.product.entity.CartItem;

public interface CartService {

	CartDAO cartDao=new CartDAOImp();
	
	
	String addItem(Integer memID,CartItem cartItem);
	
	String updateItem(Integer memID, CartItem cartItem);
	
	String delSingleItem(Integer memID, CartItem cartItem);
	
	String delMulItem(Integer memID, List<CartItem> cartItems);
	
	
	List<CartItem> getCart(Integer memID);
	
	
	Integer updateNum(Integer memID,CartItem cartItem);
	
}
