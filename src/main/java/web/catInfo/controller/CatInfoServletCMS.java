package web.catInfo.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.cj.Session;

import web.catInfo.entity.CatAndShelVO;
import web.catInfo.entity.CatInfoVO;
import web.catInfo.service.CatInfoService;




@WebServlet("/CatInfoServletCMS")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class CatInfoServletCMS extends HttpServlet {


	protected void doGet(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		doPost(req, res);	
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) 
			throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		PrintWriter out = res.getWriter();
//		String pa = req.getParameter("member:1:favorite");
//		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);
//		Gson gson=new Gson();
//		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);
//		  JsonObject fromJson = gson.fromJson(data, JsonObject.class);
//		BufferedReader br = 
//				new BufferedReader(new InputStreamReader(req.getInputStream()));
//		JSONObject jsonObj = new JSONObject(req.getInputStream());
//		try {
//			String favorite = fromJson.get("member:1:favorite").getAsString();
//			System.out.println(favorite);
//			System.out.println(jsonObj.getString("member:1:favorite"));
// 		}catch (Exception e) {
//			System.out.println("error");
//		}
		
//		out.print(123);
		String action = req.getParameter("action");
//		System.out.println("Servlet get action = " + action);
//		System.out.println("Servlet get value = ");
		CatInfoService catInfoService = new CatInfoService();
		
		//???FoviriteServlet?????????,??????????????????cat
		if("getRedisListFav".equals(action)) {
			try {
				List<String> catList = (ArrayList) req.getAttribute("catList");
				List<CatInfoVO> lists = catInfoService.getFavList(catList);
				req.getSession().setAttribute("lists", lists);
				
			}catch (Exception e) {
			}
//			catList = req.getAttribute("catList");
//			System.out.println("catList in servlet = " + catList);
//			System.out.println(catInfoService.getFavList(catList));
			req.getRequestDispatcher("/views/catInfo/My_favorite.jsp").forward(req, res);
//			req.getSession().setAttribute("catInfoVO", catInfoVO);
		}
		
		//???????????????(???????????????+???????????????)
		if("listEmps_ByCompositeQuery".equals(action)) {
//			System.out.println(action);
			Map<String, String[]> mapa = req.getParameterMap();
			Set<String> keys = mapa.keySet();
//			System.out.println(keys);
			CatInfoVO catInfoVO = new CatInfoVO();	//?????????????????????catInfoVO		
			for(String key : keys) {
				String value = mapa.get(key)[0];
				if(value != null && value.trim().length() != 0 && !"action".equals(key)) {
//					System.out.println("??????servlet, key: " + key + ", value: " + value);
					if("breed".equals(key)) {
						catInfoVO.setBreed(value);
						}
					if("age".equals(key)) {
						switch (value) {
							case "??????":
								catInfoVO.setAge(0);
								break;
							case "??????":
								catInfoVO.setAge(1);
								break;
							case "??????":
								catInfoVO.setAge(2);
								break;
							case "??????":
								catInfoVO.setAge(3);
								break;
						}
					}
					if("size".equals(key)) {
						catInfoVO.setSize(value);
					}
					if("Gender".equals(key)) {
						catInfoVO.setSex(value);
					}
					if("Color".equals(key)) {
						catInfoVO.setCoatColor(value);
					}
					if("Color".equals(key)) {
						catInfoVO.setCoatColor(value);
					}
					if("shelter_day".equals(key)) {
//						System.out.println("in age" + value);
						java.sql.Date now = null;
						long oneday = 86400000;
						switch (value) {
						case "1":
							now = new java.sql.Date(System.currentTimeMillis() - oneday*1);
//							System.out.println("???1 ?????? " + now);
							catInfoVO.setCreateDate(now);
							break;
						case "7":
							now = new java.sql.Date(System.currentTimeMillis() - oneday*7);
							catInfoVO.setCreateDate(now);
							break;
						case "14":
							now = new java.sql.Date(System.currentTimeMillis() - oneday*14);
							catInfoVO.setCreateDate(now);
							break;
						case "30":
							now = new java.sql.Date(System.currentTimeMillis() - oneday*30);
//							System.out.println(now);
							catInfoVO.setCreateDate(now);
							break;
					}
					}
					
				}
			}
//			System.out.println(new java.sql.Date(System.currentTimeMillis()));
//			System.out.println("??????servlet, breed: " + catInfoVO.getBreed()+ ", age: " + catInfoVO.getAge()+ ", size: " + catInfoVO.getSize()+ ", Gender: " + catInfoVO.getSex()+ ", coat color: " + catInfoVO.getCoatColor()+ ", date: " + catInfoVO.getCreateDate());
//			out.println("??????servlet, key: " + key + ", value: " + value + ", breed: " + catInfoVO.getBreed()+ ", age: " + catInfoVO.getAge());
			
//			catInfoVO.setBreed(value);
			List<CatInfoVO> lists = catInfoService.getMulti(catInfoVO);
			
//			System.out.println(lists.size());
//			req.setAttribute("lists", lists);
			req.getSession().setAttribute("lists", lists);
			req.getSession().setAttribute("catInfoVO", catInfoVO); //??????????????????????????????????????????
//			req.setAttribute("size", lists.size());
//			req.getSession().getAttribute("lists");
//			int n = (int) req.getSession().getAttribute("size");

//			System.out.println("test : " + n);
//			req.setAttribute("listsa", lists);
//			req.setAttribute("xxx", "xxxx");
//			System.out.println("?????? " + lists);
//			res.getWriter().append(lists.get(0).getBreed());

	
			req.getRequestDispatcher("/views/catInfo/My_search.jsp").forward(req, res);
//			req.getRequestDispatcher("/views/catInfo/TestNewFile.jsp").forward(req, res);

			
		
			
//			System.out.println(" CatInfoServlet ok2");
		}

//????????????????????????????????????????????????
	    if ("insert".equals(action)) { 
				List<String> errorMsgs = new LinkedList<String>();
				req.setAttribute("errorMsgs", errorMsgs);
				try {
					/***********************1.?????????????????? - ???????????????????????????*************************/
					String shelterName = req.getParameter("shelterName");
					if (("").equals(shelterName)) {
						errorMsgs.add("???????????????????????????");
					}		           
					
					String catName = req.getParameter("catName");
					if (("").equals(catName) || catName.trim().length() == 0) {
						errorMsgs.add("????????????????????????");
					}
//					System.out.println("??????????????????");
					Integer age = Integer.valueOf(req.getParameter("age"));
					String breed = req.getParameter("breed");
					String size = req.getParameter("size");
					String sex = req.getParameter("sex");
					String coatColor = req.getParameter("coatColor");
					String eyeColor = req.getParameter("eyeColor");
					
					String health = req.getParameter("health");
					if (("").equals(health)) {
						errorMsgs.add("????????????????????????");
					}
					String adoptCost_str = req.getParameter("adoptCost");
//					System.out.println(adoptCost_str);
//					if (("").equals(adoptCost_str)) {
//						errorMsgs.add("????????????????????????");
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
						createDate = new java.sql.Date(System.currentTimeMillis()); //????????????????????????
						errorMsgs.add("???????????????!");
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
						RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/addCatCMS.jsp");
						failureView.forward(req, res);
						return;
					}
					
					/***************************2.??????????????????***************************************/
					catInfoVO = catInfoService.addCat(shelterName, catName, age, breed, size, sex, coatColor, eyeColor, health, adoptCost,createDate, haveVaccine, adopt);
					/***************************3.???????????????include ??????**************************************/
					Integer catID = catInfoService.getNewCatID();
					req.setAttribute("catID", catID);
					RequestDispatcher updatePhoto = req.getRequestDispatcher("/CatPhotoGalleryServlet"); // ?????????????????????listAllEmp.jsp
					updatePhoto.include(req, res);
					/***************************4.?????????????????????,????????????(Send the Success view)***********/
					String url = "/views/catInfo/CatCMS.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ?????????????????????listAllEmp.jsp
					successView.forward(req, res);				
					
					/***************************???????????????????????????**********************************/
				} catch (Exception e) {
					errorMsgs.add("???????????????????????????:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/addCatCMS.jsp");
					failureView.forward(req, res);
				}
			}
		
		
		//????????????????????????????????????????????????????????????	
		if ("getOne_For_Update".equals(action)) { // ??????listAllCat.jsp?????????
//			System.out.println("getOne_For_Update");
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				Integer catID = Integer.valueOf(req.getParameter("catID"));
				CatInfoVO catInfoVO = catInfoService.getOne(catID);
				req.setAttribute("catInfoVO", catInfoVO);
				String url = "/views/catInfo/update_cat_inputCMS.jsp"; //??????????????????FW??????????????????????????????
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
				
			} catch (Exception e) {
				errorMsgs.add("??????????????????????????????:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/CatCMS.jsp");
				failureView.forward(req, res);
			}
		}
		
		//update_cat_input.jsp ????????????
		if ("update".equals(action)) { 
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				//??????????????????????????????null???null???SQL
				Integer memID = null;
				String str = req.getParameter("memID");
				if (("").equals(req.getParameter("memID"))) {
					memID = 0;
				}else {					
					memID = Integer.valueOf(req.getParameter("memID").trim());	//			
				}
//				System.out.println(memID);
				String shelterName = req.getParameter("shelterName");
				String catName = req.getParameter("catName");
				Boolean haveVaccine = Boolean.valueOf(req.getParameter("haveCaccine"));
				String health = req.getParameter("health");
				Integer adoptCost = Integer.valueOf(req.getParameter("adoptCost"));
				Boolean adopt = Boolean.valueOf(req.getParameter("adopt"));
				Integer catID = Integer.valueOf(req.getParameter("catID"));
				CatInfoVO catInfoVO = catInfoService.getOne(catID);;
				
				catInfoVO.setCatID(catID);
				catInfoVO.setMemID(memID);
				catInfoVO.setShelterName(shelterName);
				catInfoVO.setCatName(catName);
				catInfoVO.setHaveVaccine(haveVaccine);
				catInfoVO.setHealth(health);
				catInfoVO.setAdoptCost(adoptCost);
				catInfoVO.setAdopt(adopt);

				/*************2.???service update??????****************/
				try {
					catInfoService.updateCat(memID, shelterName, catName, haveVaccine, health, adoptCost, adopt, catID);
					/***************************3.???????????????include ??????**************************************/
					req.setAttribute("catID", catID);
					RequestDispatcher updatePhoto = req.getRequestDispatcher("/CatPhotoGalleryServlet"); // ?????????????????????listAllEmp.jsp
					updatePhoto.include(req, res);
					/*************3.??????include????????????,???????????????????????????????????????(Send the Success view)**********/
					catInfoVO = catInfoService.getOne(catID);
					req.setAttribute("catInfoVO", catInfoVO);
					String url = "/views/catInfo/CatCMS.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????????,??????listOneCat.jsp???????????????
					successView.forward(req, res);
				} catch (Exception e) {
					errorMsgs.add("???????????? : " + e.getMessage());
					req.setAttribute("catInfoVO", catInfoVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/update_cat_inputCMS.jsp");
					failureView.forward(req, res);	
					return;
				}
				
				/*?????????????????????f/w???listAllCat.jsp*/
			} catch (Exception e) {
				errorMsgs.add("???????????? : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/update_cat_inputCMS.jsp");
				failureView.forward(req, res);
			}

		}
		
		//????????????????????????????????????????????????????????????????????????????????????
		if ("delete".equals(action)) {	
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMegs", errorMsgs);
			String url = "/views/home/listAllCat.jsp";
			
			try {
				Integer catID = Integer.valueOf(req.getParameter("catID"));
//				System.out.println("catID : " + catID);
				catInfoService.deleteCat(catID);
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);
			}catch (Exception e) {
				errorMsgs.add("Cat delete fail : " + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher(url);
				failureView.forward(req, res);
			}
		}

		//????????????????????????????????????????????????????????????????????????????????????????????????????????????
//		if ("getAll".equals(action)) {
//			List<CatInfoVO> getAllList = catInfoService.getAll();
//			req.setAttribute("getAllList", getAllList);
//		}
//		
//		for (CatInfoVO list : lists) {
//			PrintWriter out = res.getWriter();
//			out.println(list);
//			out.println("<p>");
//		}
		
		//????????????????????????????????????????????????????????????????????????????????????????????????????????????v
		if ("getOne_For_Display".equals(action)) {
			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			Integer catID = null;
			try {
				String str = req.getParameter("catID");
				if (str == "" || str == "0") {
					errorMsgs.add("?????????????????????");
				}else {
					catID = Integer.valueOf(req.getParameter("catID"));
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/CatCMS.jsp"); 
					failureView.forward(req, res);
					return;
				}
				/***************************2.??????????????????*****************************************/
				CatInfoVO catInfoVO = catInfoService.getOne(catID);
				if (catInfoVO == null) {
					errorMsgs.add("??????????????????");
				}
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/catInfo/select_page.jsp"); 
					failureView.forward(req, res);
					return;
				}
				/***************************3.????????????,????????????(Send the Success view)*************/
				req.setAttribute("catInfoVO", catInfoVO); // ??????????????????empVO??????,??????req
				String url = "/views/catInfo/CatCMS.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????? listOneEmp.jsp
				successView.forward(req, res);
				
				
			} catch (Exception e) {
				errorMsgs.add("this catID is not avaliable");
			}
		}
		
		//?????????CatPage
		if ("getCatPage".equals(action)) {
			
			Integer catID = null;
			String str = req.getParameter("catID");
			catID = Integer.valueOf(req.getParameter("catID"));
			System.out.println("catID:" + catID);
			CatAndShelVO catAndShelVO = catInfoService.getOneAndShel(catID);
			req.setAttribute("catAndShelVO", catAndShelVO); // ??????????????????empVO??????,??????req
			String url = "/views/catInfo/CatPage.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????? listOneEmp.jsp
			successView.forward(req, res);
		}
		if ("getCatback".equals(action)) {
			
			Integer catID = null;
			String str = req.getParameter("catID");
			catID = Integer.valueOf(req.getParameter("catID"));
			System.out.println("catID:" + catID);
			CatAndShelVO catAndShelVO = catInfoService.getOneAndShel(catID);
			req.setAttribute("catAndShelVO", catAndShelVO); // ??????????????????empVO??????,??????req
			String url = "/views/chatroom/backgroundchatroom2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); // ???????????? listOneEmp.jsp
			successView.forward(req, res);
		}
		
	}

}
