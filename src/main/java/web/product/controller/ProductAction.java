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
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import web.product.entity.AttrWithValue;
import web.product.entity.CategoryVO;
import web.product.entity.ImgTFVO;
import web.product.service.AttributesService;
import web.product.service.CategoryService;
import web.product.service.PImgService;
import web.product.service.SkuService;
import web.product.service.SpuService;
import web.product.service.ValueService;
import web.product.service.impl.AttributesServiceImp;
import web.product.service.impl.CategoryServiceImp;
import web.product.service.impl.PImgServiceImp;
import web.product.service.impl.SkuServiceImp;
import web.product.service.impl.SpuServiceImp;
import web.product.service.impl.ValueServiceImp;


@WebServlet("/ProductAction")
public class ProductAction extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static CategoryService productService;
	private static Gson gson = null;

	CategoryService categoryService = new CategoryServiceImp();
	SpuService spuService = new SpuServiceImp();
	SkuService skuService = new SkuServiceImp();
	PImgService pImgService = new PImgServiceImp();
	AttributesService attributesService=new AttributesServiceImp();
	ValueService valueService=new ValueServiceImp();

	public ProductAction() throws ServletException {

		productService = new CategoryServiceImp();
		gson = new Gson();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 產品新增 之後補controller
		request.setCharacterEncoding("UTF-8");

//		String parameter = request.getParameter("action");
//		System.out.println(parameter);
		
		
		String data = IOUtils.toString(request.getInputStream(), StandardCharsets.UTF_8);
		
		JsonObject fromJson = gson.fromJson(data, JsonObject.class);
		
		

		
		String action = fromJson.get("action").getAsString();
		
		
		
	
		
		// 上架商品 controller
		if("launchProd".equals(action)) {
		// 類型名稱
		String ctgName = fromJson.get("ctgName").getAsString();
		// 商品名稱
		String spuName = fromJson.get("spuName").getAsString();
		// 商品描述
		String descript = fromJson.get("descript").getAsString();
		// 商品圖片
		JsonObject jObjectImg = fromJson.get("spuImgs").getAsJsonObject();
		ImgTFVO imgs = gson.fromJson(jObjectImg, ImgTFVO.class);
		// 規格
		// List接
		List<JsonElement> attrList = new ArrayList<>();
		JsonArray attrArr = fromJson.get("specAttrs").getAsJsonArray();
		attrArr.forEach(item -> {
			attrList.add(item);
		});
		// 庫存
		JsonArray jstocks = fromJson.get("stocks").getAsJsonArray();
		List<Integer> stocks = new ArrayList<>();
		for (JsonElement element : jstocks) {
			stocks.add(gson.fromJson(element, Integer.class));
		}
		// 價格
		JsonArray skuPrices = fromJson.get("skuPrices").getAsJsonArray();
		List<Integer> prices = new ArrayList<>();
		for (JsonElement element : skuPrices) {
			prices.add(gson.fromJson(element, Integer.class));
		}
		
		int ctgID = categoryService.queryCtgID(ctgName);
		
		int spuID = spuService.insertSPU(ctgID, spuName, descript);

		skuService.insertSKU(spuID, prices, stocks, attrList);
		// 照片上傳
		pImgService.addPics(spuID, imgs);
		// 上架商品 取得類型名稱
		}else if("getCatgName".equals(action)){
			List<CategoryVO> allCategory = categoryService.getAllCategory();
			response.getWriter().append(gson.toJson(allCategory));
		// 取得類型規格模板
		}else if("getAttrList".equals(action)) {
			String ctgName = fromJson.get("ctgName").getAsString();
			// 查詢該類型的id
			int ctgID = categoryService.queryCtgID(ctgName);
			// 取得對應的Attr模板
			 List<AttrWithValue> attrWithValue = attributesService.getAll(ctgID);
		
			response.getWriter().append(gson.toJson(attrWithValue));
		}

	}

}
