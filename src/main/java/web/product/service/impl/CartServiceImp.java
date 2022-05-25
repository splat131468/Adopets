package web.product.service.impl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.apache.ibatis.javassist.expr.NewArray;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;
import web.product.entity.CartItem;
import web.product.entity.SkuVO;
import web.product.service.CartService;

public class CartServiceImp implements CartService {

	public static AllInOne allInOne;

	@Override
	public String addItem(Integer memID, CartItem cartItem) {

		return cartDao.addItem(memID, cartItem);
	}

	@Override
	public String updateItem(Integer memID, CartItem cartItem) {

		return cartDao.updateItem(memID, cartItem);
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

	@Override
	public SkuVO updateCartItem(Integer memID, CartItem cartItem) {

		String res = cartService.updateItem(memID, cartItem);
		int skuID = Integer.parseInt(res);
		// 用skuID去找 規格
		SkuVO skuVO = spuService.getSkuVO(skuID);

		return skuVO;
	}

	public List<OrderDetailVO> cartCheckOut(List<Integer> skuIDArr) {

		// List 來接skuID
		List<SkuVO> skuVO = new ArrayList<SkuVO>();

		// List 來接checkout cart
		List<CartItem> cart = new ArrayList<CartItem>();

		// 查真實價格 mysql
		skuIDArr.forEach(e -> {
			// 循環加入
			skuVO.add(spuService.getSkuVO(e));
		});
		// 到redis 查購買數量
		// 模擬memID = 1
		List<CartItem> allCart = cartService.getCart(new Integer(1));
		// 只取要結帳商品的數量
		for (int j = 0; j < skuVO.size(); j++) {
			for (int i = 0; i < allCart.size(); i++) {
				CartItem cartItem = allCart.get(i);
				SkuVO skuVOItem = skuVO.get(j);
				// 從noSQL找購物車有的skuID
				if (cartItem.getSkuID() == skuVOItem.getSkuID()) {
					cart.add(cartItem);
				}
			}
		}
		// 生成訂單明細(尚未結帳)
		// cart 與 skuvo 排序與數量一致 但這種寫法相依性太高 不容易維護
		List<OrderDetailVO> detail = new ArrayList<OrderDetailVO>();
		for (int i = 0; i < skuVO.size(); i++) {
			SkuVO skuItem = skuVO.get(i);
			OrderDetailVO orderDetailVO = new OrderDetailVO(null, null, skuItem.getSkuID(),
					skuItem.getSpuVO().getSpuName(), cart.get(i).getNum(), skuItem.getSkuPrice());
			detail.add(orderDetailVO);
		}

		return detail;
	}

	public String takeOrder(List<Integer> skuIDArr, OrdersVO ordersVO, Integer memID) {

		// List 來接checkout cart
		List<CartItem> cart = new ArrayList<CartItem>();
		// 到redis取出所有購物車商品
		List<CartItem> allCart = cartService.getCart(memID);
		// 只取要結帳商品的數量
		for (int j = 0; j < skuIDArr.size(); j++) {
			for (int i = 0; i < allCart.size(); i++) {
				CartItem cartItem = allCart.get(i);

				Integer skuVOItem = skuIDArr.get(j);
				// 從noSQL找購物車有的skuID
				if (cartItem.getSkuID() == skuVOItem) {
					cart.add(cartItem);
				}
			}
		}

		// 取出待結帳商品 準備做訂單 結帳

		// 先取出mysql 對應的skuVO 準備做數量修改
		// 建立List 來接
		List<SkuVO> readyCheck = new ArrayList<SkuVO>();
		// skuID list取出對應的商品
		skuIDArr.forEach(e -> {
			// 循環加入 取出所有商品
			readyCheck.add(spuService.getSkuVO(e));
		});

		// 該list只裝修改的商品
		List<SkuVO> sellList = new ArrayList<SkuVO>();
		// 數量修改 實際數量 - 購物車商品數
		for (int j = 0; j < cart.size(); j++) {
			for (int i = 0; i < readyCheck.size(); i++) {

				CartItem cartItem = cart.get(j);
				SkuVO skuVO = readyCheck.get(i);

				// 從redis找購物車有的skuID
				if (cartItem.getSkuID() == skuVO.getSkuID()) {
					Integer curstock = skuVO.getStock();
					// 數量相減
					Integer cartNum = cartItem.getNum();
					curstock = curstock - cartNum;
					skuVO.setStock(curstock);
					sellList.add(skuVO);
				}
			}
		}
		// 裝所有商品名稱
		List<String> prodName = new ArrayList<String>();
		// 取得所有商品名抽
		for (int i = 0; i < sellList.size(); i++) {

			SkuVO skuVO = sellList.get(i);
			prodName.add(skuVO.getSpuVO().getSpuName());

		}

		// 為了配合綠界
		Optional<String> reduce = prodName.stream().reduce((String acc, String curr) -> {
			return acc + "#" + curr;
		});

		String itemName = reduce.get();

		// 會員
		ordersVO.setMemID(memID);

		// 新增訂單
		int gk = orderService.insertOrderGk(ordersVO);
		//
		Integer orderPrice = ordersVO.getOrderPrice();

		// 建立明細
		orderDetailService.addDetails(sellList, memID, gk, cart);

		// 綠界
		// 時間
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		String orderDate = sdf.format(new Date());

		allInOne = new AllInOne("");

		System.out.println();

		AioCheckOutALL aCheckOut = new AioCheckOutALL();
		aCheckOut.setMerchantTradeNo(gk + "tga101");
		aCheckOut.setMerchantTradeDate(orderDate);
		aCheckOut.setTotalAmount(orderPrice + "");
		aCheckOut.setTradeDesc("test");
		aCheckOut.setItemName(itemName);
		aCheckOut.setClientBackURL("http://localhost:8081/Adopets/comAction?action=ecoMainP");

		aCheckOut.setReturnURL("http://localhost:8081/Adopets//epayCheckOrder");

//		aCheckOut.setReturnURL("http://211.23.128.214:5000/");
		aCheckOut.setNeedExtraPaidInfo("N");
//		System.out.println(allInOne.aioCheckOut(aCheckOut, null));


		// 這個部分要等有domain才能夠做下去
		// 移除庫存
		skuService.takeOrder(sellList);

		// 移除購物車
		cartService.delMulItem(memID, cart);
		
		return allInOne.aioCheckOut(aCheckOut, null);

	}

}
