package web.product.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import web.product.entity.SkuVO;
import web.product.service.SkuService;
import web.product.service.SpuService;
import web.product.service.impl.SkuServiceImp;
import web.product.service.impl.SpuServiceImp;


@WebServlet("/prodManage")
public class ProdManageAction extends HttpServlet {

	private static final long serialVersionUID = 1L;
	SpuService spuSerive = new SpuServiceImp();
	SkuService skuService = new SkuServiceImp();
	private static Gson gson = null;
	String action = null;

	public ProdManageAction() {
		gson = new Gson();
	}

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		  req.setCharacterEncoding("UTF-8");
		  resp.setContentType("text/html; charset=UTF-8");
		
		// 一般的 request
		String action = req.getParameter("action");

		if ("prodList".equals(action)) {

			List<SkuVO> allProds = spuSerive.getAllProd();

			req.getSession().setAttribute("allProds", allProds);

			return;

		}

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// 處理json
		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);

		JsonObject fromJson = gson.fromJson(data, JsonObject.class);
		action = fromJson.get("action").getAsString();

		// 取得所有商品資料
		if ("updateProd".equals(action)) {

			SkuVO skuVO = new SkuVO();
			Integer price = fromJson.get("skuPrice").getAsInt();
			Integer status = fromJson.get("status").getAsInt();
			Integer skuID = fromJson.get("skuID").getAsInt();
			Integer stock = fromJson.get("stock").getAsInt();
			if (!(price == null && stock == null && status == null && skuID == null)) {
				skuVO.setSkuPrice(price);
				skuVO.setStatus(status);
				skuVO.setSkuID(skuID);
				skuVO.setStock(stock);
				int update = skuService.updateProd(skuVO);
				// 檢查是否成功更新
				if (update != -1) {
					// 更新後 也要刷新產品req
					List<SkuVO> allProds = spuSerive.getAllProd();

					req.getSession().setAttribute("allProds", allProds);
					
					return;
				}
			}

		} else if ("searchByName".equals(action)) {

			String prodName = fromJson.get("spuName").getAsString();
			List<SkuVO> allProds = spuSerive.queryByName(prodName);
			req.getSession().setAttribute("allProds", allProds);

			return;

		}

	}

}
