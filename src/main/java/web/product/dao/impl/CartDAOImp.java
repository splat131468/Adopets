package web.product.dao.impl;

import java.util.ArrayList;

import java.util.List;


import com.google.gson.Gson;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.product.dao.CartDAO;
import web.product.entity.CartItem;
import web.product.util.JedisUtil;

public class CartDAOImp implements CartDAO {

	private JedisPool jedisPool;
	Gson gson = new Gson();

	// 商品新增
	@Override
	public String addItem(Integer memID, CartItem cartItem) {

		jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();

		// 從頭到尾找一遍
		List<String> shoppingCart = jedis.lrange("member:" + memID + ":shoppingCart", 0, -1);

		// 第一種可能 購物車原本就空的 不存在 那就建立購物車
		if (shoppingCart.size() == 0) {
			// 將cartItem序列化
			String cartItemJS = gson.toJson(cartItem);
			// 放進去
			jedis.rpush("member:" + memID + ":shoppingCart", cartItemJS);
			jedis.close();
			return "create shoppingCart!!";
			// 第二種可能 購物車已經有相同商品了 判斷是否加入
		} else {
			// 循環已存在商品
			for (int i = 0; i < shoppingCart.size(); i++) {
				// 取得各個已存在的商品
				CartItem existItem = gson.fromJson(shoppingCart.get(i), CartItem.class);
				// 已經override equals 除了(商品數量)
				if (existItem.equals(cartItem)) {
					// 更改商品數量
					existItem.setNum(cartItem.getNum());
					// 轉json 存回去 並結束
					jedis.lset("member:" + memID + ":shoppingCart", i, gson.toJson(existItem));
					jedis.close();
					return " update!!";
				}
			}
			// 不存在該商品 但有購物車 那就新增
			jedis.lpush("member:" + memID + ":shoppingCart", gson.toJson(cartItem));
			jedis.close();
			return "insert into ur cart";

		}

	}
	
	
	
	

	// 商品修改
	// 更改規格skuID 數量num 價格skuPrice skuName
	// 不會變的spuID desctipt
	public String updateItem(Integer memID, CartItem cartItem) {

		jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();

		// 取出 會員對應的cart
		List<String> shoppingCart = jedis.lrange("member:" + memID + ":shoppingCart", 0, -1);

		if (memID != null && cartItem != null) {

			for (int i = 0; i < shoppingCart.size(); i++) {

				CartItem existItem = gson.fromJson(shoppingCart.get(i), CartItem.class);
				// 找到要修改的商品 該改規格 價格 數量
				if (existItem.getSpuID() == cartItem.getSpuID()) {
					// 更改規格
					existItem.setSkuID(cartItem.getSkuID());
					// 更改價格
					existItem.setSkuPrice(cartItem.getSkuPrice());
					// 更改數量
					existItem.setNum(cartItem.getNum());
				

					jedis.lset("member:" + memID + ":shoppingCart", i, gson.toJson(existItem));
					jedis.close();
					// 轉字串
					return cartItem.getSkuID()+"";
				}

			}
			jedis.close();
			return "error";
		}

		jedis.close();
		return "fail";
	}

	// 移除單一產品 根據SkuID
	public String delSingleItem(Integer memID, CartItem cartItem) {

		jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();

		// 取出 會員對應的cart
		List<String> shoppingCart = jedis.lrange("member:" + memID + ":shoppingCart", 0, -1);

		if (memID != null && cartItem != null) {

			for (int i = 0; i < shoppingCart.size(); i++) {

				CartItem existItem = gson.fromJson(shoppingCart.get(i), CartItem.class);

				// 找到要修改的商品規格ID 做刪除
				if (existItem.getSkuID() == cartItem.getSkuID()) {

					jedis.lrem("member:" + memID + ":shoppingCart", 0, gson.toJson(existItem));
					jedis.close();
					return "delete ！！";
				}
			}
		}
		return "fail";
	}

	// 移除多個產品
	public String delMulItem(Integer memID, List<CartItem> cartItems) {

		jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();
		String rs = "ok";

		// 取出 會員對應的cart
		List<String> shoppingCart = jedis.lrange("member:" + memID + ":shoppingCart", 0, -1);

		if (memID != null && cartItems.size() != 0) {

			for (int i = 0; i < shoppingCart.size(); i++) {

				CartItem existItem = gson.fromJson(shoppingCart.get(i), CartItem.class);
				// 每個item做比較
				cartItems.forEach(e -> {
					// 找到要修改的商品規格ID 做刪除
					if (existItem.getSkuID() == e.getSkuID()) {

						jedis.lrem("member:" + memID + ":shoppingCart", 0, gson.toJson(existItem));

					}
				});

			}
			jedis.close();
			return "ok";
		}
		jedis.close();
		return "fail";
	}

	// 取得根據用戶id取得購物車
	public List<CartItem> getCart(Integer memID) {

		jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();
		List<CartItem> cartItems = new ArrayList<CartItem>();

		if (memID != null) {
			List<String> shoppingCart = jedis.lrange("member:" + memID + ":shoppingCart", 0, -1);

			// 轉成物件
			shoppingCart.forEach(e -> {
				cartItems.add(gson.fromJson(e, CartItem.class));
			});
			jedis.close();
			return cartItems;
			
		}

		jedis.close();
		return null;
	}
	// 只修改數量
	public Integer updateNum(Integer memID,CartItem cartItem) {
		
		jedisPool = JedisUtil.getJedisPool();
		Jedis jedis = jedisPool.getResource();

		// 取出 會員對應的cart
		List<String> shoppingCart = jedis.lrange("member:" + memID + ":shoppingCart", 0, -1);

		if (memID != null && cartItem != null) {

			for (int i = 0; i < shoppingCart.size(); i++) {

				CartItem existItem = gson.fromJson(shoppingCart.get(i), CartItem.class);
				// 找到要修改的商品 該改規格 價格 數量
				if (existItem.getSkuID() == cartItem.getSkuID()) {
				
					// 更改數量
					existItem.setNum(cartItem.getNum());
				

					jedis.lset("member:" + memID + ":shoppingCart", i, gson.toJson(existItem));
					jedis.close();
					return cartItem.getNum();
				}

			}
			jedis.close();
			return null;
		}

		jedis.close();
		return null;
	}
	
	
	
	
	

	// 查詢購物車

	public static void main(String[] args) {
//
//		CartItem cartItem = new CartItem();
//		cartItem.setDescript("商品1");
//		cartItem.setNum(2);
//		cartItem.setSkuID(3);
//		cartItem.setSkuName("規格2");
//		cartItem.setSpuID(2);
//		cartItem.setSkuPrice(10);
//
//		CartItem cartItem1 = new CartItem();
//		cartItem1.setDescript("商品1");
//		cartItem1.setNum(2);
//		cartItem1.setSkuID(1);
//		cartItem1.setSkuName("規格2");
//		cartItem1.setSpuID(2);
//		cartItem1.setSkuPrice(10);

//		List<CartItem> list = new ArrayList<CartItem>();
//		list.add(cartItem);
//		list.add(cartItem1);

		CartDAOImp cartDAOImp = new CartDAOImp();
//		String delMulItem = cartDAOImp.delMulItem(1, list);
//		String delSingleItem = cartDAOImp.delSingleItem(1, cartItem);
//		String updateItem = cartDAOImp.updateItem(1, cartItem);
//		String addItem = cartDAOImp.addItem(1, cartItem1);
		
		
		List<CartItem> cart = cartDAOImp.getCart(1);

		System.out.println(cart);

	}

}
