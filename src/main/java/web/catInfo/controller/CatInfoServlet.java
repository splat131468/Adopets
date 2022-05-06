package web.catInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;

import web.catInfo.entity.CatInfoVO;
import web.catInfo.service.CatInfoService;




@WebServlet("/CatInfoServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CatInfoServlet extends HttpServlet {


	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		String str = req.getParameter("id");
		System.out.println("hello:" + str);
		doPost(req, res);	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		String action = req.getParameter("action");
		PrintWriter out = res.getWriter();
		
		
		
		
//		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);
//		System.out.println(data);
		CatInfoService catInfoService = new CatInfoService();

		//新增新增新增新增新增新增新增新增
	    if ("insert".equals(action)) { 
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					/***********************1.接收請求參數 - 輸入格式的錯誤處理*************************/
					String shelterName = req.getParameter("shelterName");
					if (("").equals(shelterName)) {
						errorMsgs.add("收容所名稱請勿空白");
					}		           
					
					String catName = req.getParameter("catName");
					if (("").equals(catName) || catName.trim().length() == 0) {
						errorMsgs.add("貓咪名字請勿空白");
					}
//					System.out.println("我在這裡～～");
					Integer age = Integer.valueOf(req.getParameter("age"));
					String breed = req.getParameter("breed");
					String size = req.getParameter("size");
					String sex = req.getParameter("sex");
					String coatColor = req.getParameter("coatColor");
					String eyeColor = req.getParameter("eyeColor");
					
					String health = req.getParameter("health");
					if (("").equals(health)) {
						errorMsgs.add("健康資訊請勿空白");
					}
					String adoptCost_str = req.getParameter("adoptCost");
					System.out.println(adoptCost_str);
//					if (("").equals(adoptCost_str)) {
//						errorMsgs.add("認養金額請勿空白");
//					}else {
//						Integer adoptCost = Integer.valueOf(req.getParameter("adoptCost"));
//					}
					Integer adoptCost = Integer.valueOf(req.getParameter("adoptCost"));
					
					Boolean haveVaccine = Boolean.valueOf(req.getParameter("haveVaccine"));
					Boolean adopt = Boolean.valueOf(req.getParameter("adopt"));
					java.sql.Date createDate = null;
					try {
						createDate = java.sql.Date.valueOf(req.getParameter("createDate").trim());
					} catch (IllegalArgumentException e) {
						createDate = new java.sql.Date(System.currentTimeMillis()); //沒有給可以幫他填
						errorMsgs.add("請輸入日期!");
					}
					

					CatInfoVO catInfoVO = new CatInfoVO();
					catInfoVO.setShelterName(shelterName);
					catInfoVO.setCatName(catName);
					catInfoVO.setCreateDate(createDate);
					catInfoVO.setAge(age);
					catInfoVO.setBreed(breed);
					catInfoVO.setSize(size);
					catInfoVO.setSex(sex);
					catInfoVO.setCoatColor(coatColor);
					catInfoVO.setEyeColor(eyeColor);
					catInfoVO.setHealth(health);
					catInfoVO.setAdoptCost(adoptCost);
					catInfoVO.setHaveVaccine(haveVaccine);
					catInfoVO.setAdopt(adopt);
					
					
					
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("catInfoVO", catInfoVO); 
						RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/addCat.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.開始新增資料***************************************/
					catInfoVO = catInfoService.addCat(shelterName, catName, age, breed, size, sex, coatColor, eyeColor, health, adoptCost,createDate, haveVaccine, adopt);
					/***************************3.新增成功才include 照片**************************************/
					Integer catID = catInfoService.getNewCatID();
					req.setAttribute("catID", catID);
					RequestDispatcher updatePhoto = req.getRequestDispatcher("/CatPhotoGalleryServlet"); // 新增成功後轉交listAllEmp.jsp
					updatePhoto.include(req, res);
					/***************************4.照片新增完成後,準備轉交(Send the Success view)***********/
					String url = "/views/catInfo/listAllCat.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************其他可能的錯誤處理**********************************/
				} catch (Exception e) {
					errorMsgs.add("直接跳到最後面的錯:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/addCat.jsp");
					failureView.forward(req, res);
				}
			}
		
		
		//修改修改修改修改修改修改修改修改修改修改	
		if ("getOne_For_Update".equals(action)) { // 來自listAllCat.jsp的請求
//			System.out.println("AAAAAAAA");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer catID = Integer.valueOf(req.getParameter("catID"));
				CatInfoVO catInfoVO = catInfoService.getOne(catID);
				req.setAttribute("catInfoVO", catInfoVO);
				String url = "/views/catInfo/update_cat_input.jsp"; //有拿到資料就FW到新增貓咪資料頁面～
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/listAllCat.jsp");
				failureView.forward(req, res);
			}
		}
		
		//update_cat_input.jsp 傳回來的
		if ("update".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				//判斷是否為無認養人讓null轉null到SQL
				Integer memID = null;
				String str = req.getParameter("memID");
				if (("").equals(req.getParameter("memID"))) {
					memID = 0;
				}else {					
					memID = Integer.valueOf(req.getParameter("memID").trim());	//			
//					memID = new Integer(req.getParameter("memID"));	//			
//					memID = 1;	//			
				}
				System.out.println(memID);
				String shelterName = req.getParameter("shelterName");
				String catName = req.getParameter("catName");
				Boolean haveVaccine = Boolean.valueOf(req.getParameter("haveCaccine"));
				String health = req.getParameter("health");
				Integer adoptCost = Integer.valueOf(req.getParameter("adoptCost"));
				Boolean adopt = Boolean.valueOf(req.getParameter("adopt"));
				Integer catID = Integer.valueOf(req.getParameter("catID"));
				CatInfoVO catInfoVO = new CatInfoVO();
				catInfoVO.setCatID(catID);
				catInfoVO.setMemID(memID);
				catInfoVO.setShelterName(shelterName);
				catInfoVO.setCatName(catName);
				catInfoVO.setHaveVaccine(haveVaccine);
				catInfoVO.setHealth(health);
				catInfoVO.setAdoptCost(adoptCost);
				catInfoVO.setAdopt(adopt);

				/*************2.給service update資料****************/
				try {					
					catInfoService.updateCat(memID, shelterName, catName, haveVaccine, health, adoptCost, adopt, catID);
					/***************************3.修改成功才include 照片**************************************/
					req.setAttribute("catID", catID);
					RequestDispatcher updatePhoto = req.getRequestDispatcher("/CatPhotoGalleryServlet"); // 新增成功後轉交listAllEmp.jsp
					updatePhoto.include(req, res);
					/*************3.如果include照片完成,抓出完整貓咪資料，準備轉交(Send the Success view)**********/
					catInfoVO = catInfoService.getOne(catID);
					req.setAttribute("catInfoVO", catInfoVO);
					String url = "/views/catInfo/listOneCat.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneCat.jsp印出一筆貓
					successView.forward(req, res);
				} catch (Exception e) {
					errorMsgs.add("修改失敗 : " + e.getMessage());
					req.setAttribute("catInfoVO", catInfoVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/views/home/update_cat_input.jsp");
					failureView.forward(req, res);	
				}
				
				/*捕捉其他例外，f/w到listAllCat.jsp*/
			} catch (Exception e) {
				errorMsgs.add("修改失敗 : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/listAllCat.jsp");
				failureView.forward(req, res);
			}

		}
		

		
		
		//刪除刪除刪除刪除刪除刪除刪除刪除刪除刪除刪除刪除刪除刪除
		if ("delete".equals(action)) {	
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMegs", errorMsgs);
			String url = "/views/home/listAllCat.jsp";
			
			try {
				Integer catID = Integer.valueOf(req.getParameter("catID"));
				System.out.println("catID : " + catID);
				catInfoService.deleteCat(catID);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch (Exception e) {
				errorMsgs.add("Cat delete fail : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
		}

		//顯示全部顯示全部顯示全部顯示全部顯示全部顯示全部顯示全部顯示全部顯示全部
//		List<CatInfoVO> lists = catInfoService.getAll();
//		
//		for (CatInfoVO list : lists) {
//			PrintWriter out = res.getWriter();
//			out.println(list);
//			out.println("<p>");
//		}
		
		//顯示單筆顯示單筆顯示單筆顯示單筆顯示單筆顯示單筆顯示單筆顯示單筆顯示單筆v
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Integer catID = null;
			try {
				String str = req.getParameter("catID");
				if (str == "" || str == "0") {
					errorMsgs.add("請輸入貓咪編號");
				}else {
					catID = Integer.valueOf(req.getParameter("catID"));
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/select_page.jsp"); 
					failureView.forward(req, res);
					return;
				}
				/***************************2.開始查詢資料*****************************************/
				CatInfoVO catInfoVO = catInfoService.getOne(catID);
				if (catInfoVO == null) {
					errorMsgs.add("沒有這隻貓咪");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/select_page.jsp"); 
					failureView.forward(req, res);
					return;
				}
				/***************************3.查詢完成,準備轉交(Send the Success view)*************/
				req.setAttribute("catInfoVO", catInfoVO); // 資料庫取出的empVO物件,存入req
				String url = "/views/catInfo/listOneCat.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);
				
				
			} catch (Exception e) {
				errorMsgs.add("this catID is not avaliable");
			}
		}
		
	}

}
