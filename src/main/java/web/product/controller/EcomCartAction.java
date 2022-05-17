package web.product.controller;

import java.io.ByteArrayInputStream;
import java.io.DataOutput;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import web.product.entity.PImgVO;
import web.product.entity.SkuVO;
import web.product.entity.SpuVO;
import web.product.service.PImgService;
import web.product.service.SkuService;
import web.product.service.SpuService;
import web.product.service.impl.PImgServiceImp;
import web.product.service.impl.SpuServiceImp;

@WebServlet("/cartAction")
public class EcomCartAction extends HttpServlet {
	private static final long serialVersionUID = 1L;
	SpuService spuService = new SpuServiceImp();
	PImgService pImgService = new PImgServiceImp();
	Gson gson = new Gson();

	public EcomCartAction() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		String action = request.getParameter("action");

		// 商品詳情資訊
		if ("getDetail".equals(action)) {
			// 錯誤驗證
			LinkedList<String> errorMsgs = new LinkedList<String>();

			try {
				String spuIDString = request.getParameter("spuID");
				if (!"".equals(spuIDString) && spuIDString != null) {

					Integer spuID = Integer.parseInt(spuIDString);
					SpuVO spuVO = new SpuVO();

					spuVO.setSpuID(spuID);

					// 商品資訊
					SpuVO detail = spuService.getDetail(spuVO);
					// 傳屬性
					List<String> attrList = new ArrayList<String>();

					request.setAttribute("prodName", detail.getSpuName());
					request.setAttribute("descript", detail.getDescript());
					request.setAttribute("spuID", detail.getSpuID());

					detail.getSkuVO().forEach(e -> {
						attrList.add(e.getSpecAttr());
					});
					request.setAttribute("skuVO", attrList);

					request.getRequestDispatcher("/views/ecommerce/shop-details.jsp").forward(request, response);

				}
			} catch (Exception e) {
				errorMsgs.add("進入商品詳情有錯誤" + e.getMessage());
				System.out.println(errorMsgs);
				return;
			}

			return;
			// 照片取得 商品多個照片
		} else if ("getSpuPic".equals(action)) {

			// 錯誤驗證
			LinkedList<String> errorMsgs = new LinkedList<String>();

			try {

				SpuVO spuVO = new SpuVO();
				String spuID = request.getParameter("spuID");

				String pnum = request.getParameter("pnum");

				if (spuID != null && !"".equals(spuID) && pnum != null && !"".equals(pnum)) {
					Integer parseInt = Integer.parseInt(spuID);
					Integer pnumInt = Integer.parseInt(pnum);
					spuVO.setSpuID(parseInt);
					// 商品照片

					List<PImgVO> spuPics = pImgService.getSpuPics(spuVO);
					byte[] spuImg = spuPics.get(pnumInt).getSpuImg();

					response.setCharacterEncoding("UTF-8");
					OutputStream outputSream = response.getOutputStream();
					InputStream in = new ByteArrayInputStream(spuImg);
					int len = 0;
					byte[] buf = new byte[1024];
					while ((len = in.read(buf, 0, 1024)) != -1) {
						outputSream.write(buf, 0, len);
					}
					outputSream.close();

					return;

				}
			} catch (Exception e) {
				errorMsgs.add("照片取得錯誤" + e.getMessage());
				System.out.println(errorMsgs);
				return;
			}

		}

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		// 處理json
		String data = IOUtils.toString(request.getInputStream(), StandardCharsets.UTF_8);

		JsonObject fromJson = gson.fromJson(data, JsonObject.class);

		JsonElement jsonElement = fromJson.get("action");

		String action = null;

		// 錯誤驗證
		LinkedList<String> errorMsgs = new LinkedList<String>();

		try {

			if (jsonElement != null) {
				action = jsonElement.getAsString();
			}
			// 取得商品指定規格的價格和數量
			if ("getPrcSk".equals(action)) {
				System.out.println(action);
				
				// 所有勾選規格
				JsonArray asJsonArray = fromJson.get("arr").getAsJsonArray();
				// 迴圈處理
				List<String> arr = new ArrayList<String>();

				asJsonArray.forEach(e -> {
					arr.add(e.getAsString().trim());
				});
				// 對應的spuID 去資料庫找對應的規格價格和數量
				jsonElement = fromJson.get("spuID");
				Integer spuID = null;
				if (jsonElement != null) {
					spuID = jsonElement.getAsInt();
				}

				SkuVO stockAndPrice = spuService.getStockAndPrice(arr, spuID);

				response.getWriter().append(gson.toJson(stockAndPrice));

			}
		} catch (Exception e) {
			errorMsgs.add("商品詳情屬性規格取得錯誤" + e.getMessage());
			System.out.println(errorMsgs);
			return;
		}

	}

}
