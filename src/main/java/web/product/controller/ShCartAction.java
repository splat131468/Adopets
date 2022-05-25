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

import web.member.entity.MemberVO;
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
	SkuService skuService = new SkuServiceImp();

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String action = req.getParameter("action");

		if ("getCart".equals(action)) {

			try {
				// 判斷登入
				// 假定memID = 1
				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");

				Integer memID = memberVO.getMemID();

				List<CartItem> cart = cartService.getCart(memID);

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
			} catch (Exception e) {
				System.out.println("取得購物車有誤");
			}
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
			try {
				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");

				Integer memID = memberVO.getMemID();

				JsonElement jsonElement = fromJson.get("cartItem");
				CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);
				String res = cartService.addItem(memID, cartItem);
				resp.getWriter().append(gson.toJson(res));
			} catch (Exception e) {
				System.out.println("商品新增有誤");
			}
			return;
			// 修改購物車
		} else if ("updateCart".equals(action)) {

			try {
				// 判斷登入
				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
				
				Integer memID = memberVO.getMemID();
				
				JsonElement jsonElement = fromJson.get("cartItem");

				CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);

				// 新增並取得新的skuVO
				SkuVO skuVO = cartService.updateCartItem(memID, cartItem);

				resp.getWriter().append(gson.toJson(skuVO));
			} catch (Exception e) {
				System.out.println("更改有誤");
			}

			return;

		} else if ("deleteCart".equals(action)) {

			try {
				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
				
				
				Integer memID = memberVO.getMemID();
				
				JsonElement jsonElement = fromJson.get("cartItem");

				CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);
				String res = cartService.delSingleItem(memID, cartItem);

				resp.getWriter().append(gson.toJson(res));
			} catch (Exception e) {
				System.out.println("刪除有誤");
			}

			return;
		} else if ("updateNum".equals(action)) {

			try {
				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
				
				
				Integer memID = memberVO.getMemID();
				
				JsonElement jsonElement = fromJson.get("cartItem");

				CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);

				Integer updateNum = cartService.updateNum(memID, cartItem);

				resp.getWriter().append(gson.toJson(updateNum));
			} catch (Exception e) {
				System.out.println("修正購物車商品數量有誤");
			}
			return;
			// 前往訂單頁面
		} else if ("cartCheckOut".equals(action)) {

			try {

				JsonElement jsonElement = fromJson.get("skuIDArr");
				// 轉成List 取得帶結帳的skuID
				List<Integer> skuIDArr = gson.fromJson(jsonElement, new TypeToken<List<Integer>>() {
				}.getType());

				// 提供商品規格list 取得訂單明細物件
				List<OrderDetailVO> detail = cartService.cartCheckOut(skuIDArr);

				HttpSession session = req.getSession();
				session.setAttribute("checkout", detail);

				req.getRequestDispatcher("/views/ecommerce/checkout.jsp").forward(req, resp);

			} catch (Exception e) {
				System.out.println("勾選的商品有錯誤");
			}
			return;

		} else if ("takeOrder".equals(action)) {

			try {

				JsonElement jsonElement = fromJson.get("skuIDArr");
				// 轉成List 取得帶結帳的skuID
				List<Integer> skuIDArr = gson.fromJson(jsonElement, new TypeToken<List<Integer>>() {
				}.getType());
				// 會員驗證
				MemberVO memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
				
				
				Integer memID = memberVO.getMemID();

				// 建立訂單
				jsonElement = fromJson.get("ordersVO");

				OrdersVO ordersVO = gson.fromJson(jsonElement, OrdersVO.class);

				String takeOrder = cartService.takeOrder(skuIDArr, ordersVO, memID);

				// 清除session
				req.getSession().removeAttribute("checkout");
				resp.getWriter().append(takeOrder);
			} catch (Exception e) {
				System.out.println("結帳有誤");
			}

		}

		return;
	}

}
