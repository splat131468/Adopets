package web.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;

import web.product.entity.PImgVO;
import web.product.entity.SkuVO;
import web.product.service.PImgService;
import web.product.service.SpuService;
import web.product.service.impl.PImgServiceImp;
import web.product.service.impl.SpuServiceImp;


@WebServlet("/comAction")
public class EcomAction extends HttpServlet {

	// 每頁想要呈現的比數
	public static final int PAGE_SIZE = 8;

	SpuService spuService = new SpuServiceImp();
	PImgService pImgService = new PImgServiceImp();
	PageInfo<SkuVO> skuPage;

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
		  req.setCharacterEncoding("UTF-8");
		  resp.setContentType("text/html; charset=UTF-8");
		
		
		String action = req.getParameter("action");

		// 顯示首頁
		if ("ecoMainP".equals(action)) {
			List<SkuVO> mainPage = spuService.getMainPage();

			req.setAttribute("mainPage", mainPage);

			// 路徑
			req.getRequestDispatcher("/views/ecommerce/Pet_Supplement.jsp").forward(req, resp);
			// 請求照片
		} else if ("getPic".equals(action)) {
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
		} else if ("ecoMainPH".equals(action)) {

			Integer curPage = Integer.parseInt(req.getParameter("curPage"));
			// 判斷是否為首次拜訪網頁
			PageInfo<SkuVO> skuPage = (PageInfo<SkuVO>) req.getSession().getAttribute("skuPage");
			// 不為null 則選擇指定
			if (skuPage != null) {
				skuPage = spuService.getMainPageHelper(curPage, PAGE_SIZE);
				req.getSession().setAttribute("skuPage", skuPage);				
				return;
				// 點選指定頁碼
			} else {	
				
				skuPage = spuService.getMainPageHelper(1, PAGE_SIZE);
				req.getSession().setAttribute("skuPage", skuPage);
				return;
			}
		}

		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		return;

	}

}
