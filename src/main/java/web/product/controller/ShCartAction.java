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

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import web.product.entity.CartItem;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;
import web.product.service.CartService;
import web.product.service.SpuService;
import web.product.service.impl.CartServiceImp;
import web.product.service.impl.SpuServiceImp;

@WebServlet("/shCartAction")
public class ShCartAction extends HttpServlet {
	Gson gson = new Gson();

	CartService cartService = new CartServiceImp();
	SpuService spuService = new SpuServiceImp();

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
		}else if ("updateCart".equals(action)) {

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
		}else if ("deleteCart".equals(action)) {
			
			// 判斷登入
			
				// 假定memID = 1
				Integer memID = new Integer(1);
				JsonElement jsonElement = fromJson.get("cartItem");
		
				CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);
				String res = cartService.delSingleItem(memID, cartItem);
				
				resp.getWriter().append(gson.toJson(res));
				
			return;
		}else if("updateNum".equals(action)) {
			
			// 判斷登入
			
			// 假定memID = 1
			Integer memID = new Integer(1);
			JsonElement jsonElement = fromJson.get("cartItem");
	
			CartItem cartItem = gson.fromJson(jsonElement, CartItem.class);
			
			Integer updateNum = cartService.updateNum(memID, cartItem);
			
			
			resp.getWriter().append(gson.toJson(updateNum));
			
		}
		return;
	}

}
