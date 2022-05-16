package web.product.controller;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.util.LinkedList;
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

		String action = req.getParameter("action");

		// 取得所有商品資料
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

		// 取得要更新的商品資料 
		// 備註: 當初寫這個方法時 對json使用還不是很清楚 其實是可以封裝到物件的
		if ("updateProd".equals(action)) {

			// 錯誤驗證
			LinkedList<String> errorMsgs = new LinkedList<String>();
			try {
				SkuVO skuVO = new SkuVO();
				JsonElement chkPoint ;
				chkPoint = fromJson.get("skuPrice");
				Integer price = null;
				if (chkPoint != null) {
					price = chkPoint.getAsInt();
					chkPoint = null;
				}else {
					errorMsgs.add("價格有誤");
				}

				chkPoint = fromJson.get("status");

				Integer status = null;
				if (chkPoint != null) {
					status = chkPoint.getAsInt();
					chkPoint = null;
				}else {
					errorMsgs.add("狀態有誤");
				}
				chkPoint = fromJson.get("skuID");
				Integer skuID = null;
				if (chkPoint != null) {
					skuID = chkPoint.getAsInt();
					chkPoint = null;
				}else {
					errorMsgs.add("skuID有誤");
				}
				chkPoint = fromJson.get("stock");
				Integer stock = null;
				if (chkPoint != null) {
					stock = chkPoint.getAsInt();
					chkPoint = null;
				}else {
					errorMsgs.add("庫存有誤");
				}

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
			} catch (Exception e) {
				errorMsgs.add("商品更改有誤" + e.getMessage());
				System.out.println(errorMsgs);
			}

		} else if ("searchByName".equals(action)) {

			// 錯誤驗證
			LinkedList<String> errorMsgs = new LinkedList<String>();
			try {
				
			String prodName = fromJson.get("spuName").getAsString();
			if(!"".equals(prodName)&&!(prodName.trim().length()==0)) {				
			List<SkuVO> allProds = spuSerive.queryByName(prodName);
			req.getSession().setAttribute("allProds", allProds);
			}
			return;
			} catch (Exception e) {
				errorMsgs.add("查詢商品名稱有誤" + e.getMessage());
				System.out.println(errorMsgs);
			}

		}

	}

}
