package web.product.controller;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.StandardCharsets;
import java.util.ArrayList;
import java.util.Base64;
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

import web.product.entity.PImgVO;
import web.product.entity.SpuVO;
import web.product.service.PImgService;
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

			String spuIDString = request.getParameter("spuID");
			if (!"".equals(spuIDString) && spuIDString != null) {
			
				Integer spuID = Integer.parseInt(spuIDString);
				SpuVO spuVO = new SpuVO();

				spuVO.setSpuID(spuID);
				

			
				// 商品資訊 這地方寫錯 不是List 之後改
				List<SpuVO> detail = spuService.getDetail(spuVO);
				// 傳屬性
				List<String> attrList = new ArrayList<String>();

				request.setAttribute("prodName", detail.get(0).getSpuName());
				request.setAttribute("descript", detail.get(0).getDescript());
				request.setAttribute("spuID", detail.get(0).getSpuID());
			
		
				detail.get(0).getSkuVO().forEach(e->{
					attrList.add(e.getSpecAttr());
				});
				request.setAttribute("skuVO",attrList);
				
				request.getRequestDispatcher("/views/ecommerce/shop-details.jsp").forward(request, response);

			}

			return;
			// 照片取得
		} else if ("getSpuPic".equals(action)) {
				SpuVO spuVO = new SpuVO();
				String spuID = request.getParameter("spuID");
			
				String pnum = request.getParameter("pnum");
				
				if(spuID!=null&&!"".equals(spuID)&&pnum!=null&&!"".equals(pnum)) {
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
//		String action = fromJson.get("action").getAsString();

	}

}
