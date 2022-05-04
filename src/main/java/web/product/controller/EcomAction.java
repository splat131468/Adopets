package web.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;

import com.github.pagehelper.PageInfo;
import com.google.gson.Gson;
import com.google.gson.JsonObject;

import web.product.entity.PImgVO;
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
				skuPage = spuService.getMainPage(curPage, PAGE_SIZE);
				// 點選指定頁碼
			} else {
				skuPage = spuService.getMainPage(1, PAGE_SIZE);
			}
			req.getSession().setAttribute("skuPage", skuPage);

			// 路徑
			req.getRequestDispatcher("/views/ecommerce/Pet_Supplement.jsp").forward(req, resp);
			return;
		}

		return;

	}

}
