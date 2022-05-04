package web.catInfo.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import web.catInfo.service.CatPhotoGalleryService;

@WebServlet("/CatPhotoGalleryServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CatPhotoGalleryServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
//		PrintWriter out = res.getWriter();
		CatPhotoGalleryService catPhotoGalleryService = new CatPhotoGalleryService();

		Integer catID = Integer.valueOf(req.getAttribute("catID").toString());

		Collection<Part> parts = req.getParts();

		for (Part part : parts) {
			String filename = getFileNameFromPart(part);
			if (filename!= null && part.getContentType()!=null) {
				InputStream in = part.getInputStream();
				byte[] buf = new byte[in.available()];
				in.read(buf);
				in.close();
				try {
				catPhotoGalleryService.addPhoto(catID, buf, new Timestamp( System.currentTimeMillis()));
				}catch(Exception e) {
					System.out.println("SQLQQQQQ");
					e.printStackTrace();
				}
				
			}
		}
	}
	
	public String getFileNameFromPart(Part part) {
		String header = part.getHeader("content-disposition");//p.112
//		System.out.println("header=" + header); // 測試用
//		String filename = header.substring(header.lastIndexOf("=") + 2, header.length() - 1); //這樣寫IE會把路徑全部顯示出來，要用file的getName才可以取出filename="tomcat.gif(如下方法)"
		String filename = new File(header.substring(header.lastIndexOf("=") + 2, header.length() - 1)).getName();// 取出filename="tomcat.gif"
//		System.out.println("filename=" + filename); // 測試用
		if (filename.length() == 0) {
			return null;
		}
		return filename;
	}

}
