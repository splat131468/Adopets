package web.product.dao;

import java.util.List;

import web.product.entity.CartItem;

public interface CartDAO {

	
	String addItem(Integer memID,CartItem cartItem);
	
	String updateItem(Integer memID, CartItem cartItem);
	
	String delSingleItem(Integer memID, CartItem cartItem);
	
	String delMulItem(Integer memID, List<CartItem> cartItems);
	
	
	List<CartItem> getCart(Integer memID);
	
	
	Integer updateNum(Integer memID,CartItem cartItem);
}
