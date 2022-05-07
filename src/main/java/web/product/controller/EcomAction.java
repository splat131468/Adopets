package web.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.logging.log4j.core.appender.rolling.action.IfAccumulatedFileCount;
import org.hibernate.internal.build.AllowSysOut;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import web.product.entity.PImgVO;
import web.product.entity.ProdSelection;
import web.product.entity.SkuVO;
import web.product.service.PImgService;
import web.product.service.SpuService;
import web.product.service.impl.PImgServiceImp;
import web.product.service.impl.SpuServiceImp;

@WebServlet("/comAction")
public class EcomAction extends HttpServlet {

	// 每頁想要呈現的比數
	public static final int PAGE_SIZE = 12;

	SpuService spuService = new SpuServiceImp();
	PImgService pImgService = new PImgServiceImp();
	PageInfo<SkuVO> skuPage;

	Gson gson = new Gson();

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		String action = req.getParameter("action");

		// 進入商城頁面 分頁處理
		if ("ecoMainP".equals(action)) {

			// 取得目前頁數

			skuPage = spuService.getMainPage(1, PAGE_SIZE);

			req.getSession().setAttribute("skuPage", skuPage);

			// 路徑
			req.getRequestDispatcher("/views/ecommerce/Pet_Supplement.jsp").forward(req, resp);
			return;
		}

		// 請求照片
		if ("getPic".equals(action)) {
			String spuID = req.getParameter("skuID");
			PImgVO pic = pImgService.getPic(Integer.parseInt(spuID));
			byte[] spuImg = pic.getSpuImg();

			resp.setCharacterEncoding("UTF-8");
			OutputStream outputSream = resp.getOutputStream();
			InputStream in = new ByteArrayInputStream(spuImg);
			int len = 0;
			byte[] buf = new byte[1024];
			while ((len = in.read(buf, 0, 1024)) != -1) {
				outputSream.write(buf, 0, len);
			}
			outputSream.close();
			return;
			// 分頁處理
		}

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=UTF-8");

		
		// 處理json
		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);

		JsonObject fromJson = gson.fromJson(data, JsonObject.class);
		String action = fromJson.get("action").getAsString();

		// 進入商城頁面 分頁處理
		if ("ecoMainP".equals(action)) {

			// 取得目前頁數
			Integer curPage = fromJson.get("curPage").getAsInt();

			// 不為null 則選擇指定
			if (curPage != null) {
				// 判斷是否有page已存在session
			Object attribute = req.getSession().getAttribute("skuPage");
				if(attribute!=null) {
					// 繼續查詢
				}
				
				skuPage = spuService.getMainPage(curPage, PAGE_SIZE);
				// 點選指定頁碼
			} else {
				skuPage = spuService.getMainPage(1, PAGE_SIZE);
			}
			req.getSession().setAttribute("skuPage", skuPage);
			// 路徑
			req.getRequestDispatcher("/views/ecommerce/Pet_Supplement.jsp").forward(req, resp);
			return;
			// 動態查詢
		} else if ("requirement".equals(action)) {
			ProdSelection prodSelection ;

			Integer lowC = null;
			Integer highC = null;
			Integer ctgID = null;
			String prodName = null;
			Integer curPage = null;
			// 不能為null 數字需要做判斷
			// 先轉字串 測試不為null 再轉數字

			String jsonLowC = fromJson.get("lowC").getAsString();

			if (jsonLowC != null && !"".equals(jsonLowC)) {
				lowC = Integer.parseInt(jsonLowC);
			}
			
			String jsonHighC  = fromJson.get("highC").getAsString();
			if (jsonHighC != null&&!"".equals(jsonHighC)) {
				highC= Integer.parseInt(jsonHighC);
			}
			
			String jsonCtgID = fromJson.get("ctgID").getAsString();
			if (jsonCtgID != null) {
				ctgID= Integer.parseInt(jsonCtgID);
				// 前端預設值ctgID = -1;
				if(ctgID==-1) {
					ctgID=null;
				}	
			}
			
			String jsonCurPage = fromJson.get("curPage").getAsString();
			if (jsonCurPage != null&&!"".equals(jsonCurPage)) {
				curPage= Integer.parseInt(jsonCurPage);
				
			}
			
		
			 String jsonprodName = fromJson.get("prodName").getAsString();
			 if (jsonprodName != null&&!"".equals(jsonprodName)) {
				 prodName = jsonprodName;		
				}else {
					prodName=null;
				}
			 
			
			 prodSelection = new ProdSelection(lowC, highC, ctgID, prodName);
			 System.out.println("============================");
			 System.out.print(prodSelection);
			 System.out.print(prodName);
			 System.out.println("============================");
			// 查詢處理 放入session
			skuPage = spuService.selectedPage(prodSelection,curPage, PAGE_SIZE);
			req.getSession().setAttribute("skuPage", skuPage);
			req.getRequestDispatcher("/views/ecommerce/Pet_Supplement.jsp").forward(req, resp);
			return;

			
		}

		return;

	}

}
