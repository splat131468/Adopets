package web.product.service.impl;

import java.util.List;

import web.product.entity.CartItem;
import web.product.service.CartService;

public class CartServiceImp implements CartService {

	@Override
	public String addItem(Integer memID, CartItem cartItem) {
		
		return cartDao.addItem( memID, cartItem);
	}

	@Override
	public String updateItem(Integer memID, CartItem cartItem) {
		
		return cartDao.updateItem( memID,  cartItem);
	}

	@Override
	public String delSingleItem(Integer memID, CartItem cartItem) {
		
		return cartDao.delSingleItem(memID, cartItem);
	}

	@Override
	public String delMulItem(Integer memID, List<CartItem> cartItems) {
	
		return cartDao.delMulItem(memID, cartItems);
	}

	@Override
	public List<CartItem> getCart(Integer memID) {
	
		return cartDao.getCart(memID);
	}

	@Override
	public Integer updateNum(Integer memID, CartItem cartItem) {
		
		return cartDao.updateNum(memID, cartItem);
	}

	

}
