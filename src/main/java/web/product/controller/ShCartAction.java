package web.product.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;

import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;
import web.order.service.OrderDetailService;
import web.order.service.OrdersService;
import web.product.entity.CartItem;
import web.product.entity.SkuVO;
import web.product.service.CartService;
import web.product.service.SkuService;
import web.product.service.SpuService;
import web.product.service.impl.CartServiceImp;
import web.product.service.impl.SkuServiceImp;
import web.product.service.impl.SpuServiceImp;

@WebServlet("/shCartAction")
public class ShCartAction extends HttpServlet {
	Gson gson = new Gson();

	CartService cartService = new CartServiceImp();
	SpuService spuService = new SpuServiceImp();
	OrdersService orderService = new OrdersService();
	OrderDetailService orderDetailService = new OrderDetailService();
	SkuService skuService=new SkuServiceImp();

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String action = req.getParameter("action");

		if ("getCart".equals(action)) {

			// 判斷登入

			// 假定memID = 1

			List<CartItem> cart = cartService.getCart(1);

			// 建立一個List做畫面呈現
			List<SkuVO> skuVO = new ArrayList<SkuVO>();

			// 用cart裡的 spuID 去找產品

			cart.forEach(e -> {
				SkuVO skuID = new SkuVO();
				skuVO.add(spuService.getSkuVO(e.getSkuID()));
			});
			req.setAttribute("cart", cart);
			req.setAttribute("cartList", skuVO);
			req.getRequestDispatcher("/views/ecommerce/shoping-cart.jsp").forward(req, resp);
			return;
		}

		doPost(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);

		JsonObject fromJson = gson.fromJson(data, JsonObject.class);

		String action = fromJson.get("action").getAsString();

		// 商品新增
		if ("addItem".equals(action)) {

			// 判斷是否登入 取得用戶id
//			req.getSession().getAttribute("memID")
			// 先假設memID = 1
			Integer memID = new Integer(1);
			JsonElement jsonElement = fromJson.get("cartItem");
			CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);
			String res = cartService.addItem(memID, cartItem);
			resp.getWriter().append(gson.toJson(res));
			return;
		} else if ("updateCart".equals(action)) {

			// 判斷登入

			// 假定memID = 1
			Integer memID = new Integer(1);
			JsonElement jsonElement = fromJson.get("cartItem");

			CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);

			String res = cartService.updateItem(memID, cartItem);
			int skuID = Integer.parseInt(res);
			// 用skuID去找 規格
			SkuVO skuVO = spuService.getSkuVO(skuID);

			resp.getWriter().append(gson.toJson(skuVO));
			return;
		} else if ("deleteCart".equals(action)) {

			// 判斷登入

			// 假定memID = 1
			Integer memID = new Integer(1);
			JsonElement jsonElement = fromJson.get("cartItem");

			CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);
			String res = cartService.delSingleItem(memID, cartItem);

			resp.getWriter().append(gson.toJson(res));

			return;
		} else if ("updateNum".equals(action)) {

			// 判斷登入

			// 假定memID = 1
			Integer memID = new Integer(1);
			JsonElement jsonElement = fromJson.get("cartItem");

			CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);

			Integer updateNum = cartService.updateNum(memID, cartItem);

			resp.getWriter().append(gson.toJson(updateNum));
			return;
		} else if ("cartCheckOut".equals(action)) {

			JsonElement jsonElement = fromJson.get("skuIDArr");
			// 轉成List 取得帶結帳的skuID
			List<Integer> skuIDArr = gson.fromJson(jsonElement, new TypeToken<List<Integer>>() {
			}.getType());

			// 建立新的List 來接skuID
			List<SkuVO> skuVO = new ArrayList<SkuVO>();

			// 建立新的List 來接checkout cart
			List<CartItem> cart = new ArrayList<CartItem>();

			// mysql 查詢價格
			skuIDArr.forEach(e -> {
				// 循環加入
				skuVO.add(spuService.getSkuVO(e));
			});
			// 到redis 查購買數量
			// 模擬memID = 1
			List<CartItem> allCart = cartService.getCart(new Integer(1));
			// 過濾 只有checkOut的 Num
			for (int j = 0; j < skuVO.size(); j++) {
				for (int i = 0; i < allCart.size(); i++) {
					// 從redis找購物車有的skuID
					if (allCart.get(i).getSkuID() == skuVO.get(j).getSkuID()) {
						cart.add(allCart.get(i));
					}
				}
			}

			List<OrderDetailVO> detail = new ArrayList<OrderDetailVO>();
			for (int i = 0; i < skuVO.size(); i++) {
				detail.add(new OrderDetailVO(null, null, skuVO.get(i).getSkuID(), skuVO.get(i).getSpuVO().getSpuName(),
						cart.get(i).getNum(), skuVO.get(i).getSkuPrice()));
			}

			HttpSession session = req.getSession();
			session.setAttribute("checkout", detail);
//			session.setAttribute("itemNum", cart);

			req.getRequestDispatcher("/views/ecommerce/checkout.jsp").forward(req, resp);
			return;

		} else if ("takeOrder".equals(action)) {
			System.out.println("takeOrder");
			JsonElement jsonElement = fromJson.get("skuIDArr");
			// 轉成List 取得帶結帳的skuID
			List<Integer> skuIDArr = gson.fromJson(jsonElement, new TypeToken<List<Integer>>() {
			}.getType());
			// 會員驗證
			Integer memID = new Integer(1);
			// 到redis取出所有購物車商品
			List<CartItem> allCart = cartService.getCart(memID);
			// 要結帳的商品 到找購買數量

			// 建立新的List 來接被勾選 待結帳的商品(取得選購數量)
			List<CartItem> cart = new ArrayList<CartItem>();

			for (int j = 0; j < skuIDArr.size(); j++) {
				for (int i = 0; i < allCart.size(); i++) {
					// 從redis找購物車有的skuID
					if (allCart.get(i).getSkuID() == skuIDArr.get(j)) {
						cart.add(allCart.get(i));
					}
				}
			}
			// 取出代結帳商品 準備做訂單 結帳

			// 先取出mysql 對應的skuVO 準備做數量修改
			// 建立新的List 來接
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
					// 從redis找購物車有的skuID
					if (cart.get(j).getSkuID() == readyCheck.get(i).getSkuID()) {
						Integer curstock = readyCheck.get(i).getStock();
						// 數量相減
						Integer cartNum = cart.get(j).getNum();
						curstock = curstock - cartNum;
						readyCheck.get(i).setStock(curstock);
						sellList.add(readyCheck.get(i));
					}
				}
			}


			// 建立訂單
			jsonElement = fromJson.get("ordersVO");
			
			OrdersVO ordersVO = gson.fromJson(jsonElement, OrdersVO.class);
			// 會員id
			ordersVO.setMemID(memID);
	
			int gk = orderService.insertOrderGk(ordersVO);
		
			// 建立明細
			int addOrderDetails = orderDetailService.addDetails(sellList, memID, gk,cart);


			// 移除庫存
			// 要新增updateList method
			int takeOrder = skuService.takeOrder(sellList);


			// 移除購物車
			String delMulItem = cartService.delMulItem(memID, cart);

			// 清除session
			req.getSession().setAttribute("checkout", "");

		}

		return;
	}

}
