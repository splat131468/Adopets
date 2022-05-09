package web.admin.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.LinkedList;
import java.util.List;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.gson.Gson;

import web.admin.entity.AdminVO;
import web.admin.service.AdminService;




/**
 * Servlet implementation class adminServlet
 */
@WebServlet("/AdminServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class AdminServlet extends HttpServlet {
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		String action = req.getParameter("action");
		System.out.println("Action = " + action);


		// ---------------------------------------getOne_For_Display---------------------------------------
		if ("getOne_For_Display".equals(action)) { // 來自select_page.jsp的請求
			List<String> errorMsgs = new LinkedList<String>();
			String str1 = req.getParameter("adminID");
			System.out.println(str1);
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("adminID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入管理員ID");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					System.out.println("AAA");
					RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer adminID = null;
				try {
					adminID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("管理員ID格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				AdminService admSvc = new AdminService();
				AdminVO admVO = admSvc.getOneAdmin(adminID);
				System.out.println(admVO);
				if (admVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}
				Gson gson = new Gson();
				String outStr = gson.toJson(admVO);
				PrintWriter out = res.getWriter();
				out.println(outStr);
				System.out.println(outStr);
				out.close();

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("admVO", admVO); // 資料庫取出的empVO物件,存入req
				String url = "/views/admin/system.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
				failureView.forward(req, res);
			}
		}

		// ---------------------------------------getOne_For_Update---------------------------------------
		if ("getOne_For_Update".equals(action)) { // 來自listAllEmp.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer adminID = new Integer(req.getParameter("adminID"));

				/*************************** 2.開始查詢資料 ****************************************/
				AdminService admSvc = new AdminService();
				AdminVO admVO = admSvc.getOneAdmin(adminID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("admVO", admVO); // 資料庫取出的empVO物件,存入req
				String url = "/views/admin/system.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_emp_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
				failureView.forward(req, res);
			}
		}

		
		
		
		
		
		
		
		
		// ---------------------------------------update_EMP---------------------------------------
		if ("update_EMP".equals(action)) { // 來自update_emp_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer adminID = Integer.valueOf(req.getParameter("adminID").trim());
				String account = req.getParameter("account").trim();
				
				
				String password = req.getParameter("password");
				String passwordReg = "^[0-9A-Za-z]{8,20}$";
				if (password == null || password.trim().length() == 0) {
					System.out.println("密碼: 請勿空白");
					errorMsgs.add("密碼: 請勿空白");
				} else if (!password.trim().matches(passwordReg)) { // 以下練習正則(規)表示式(regular-expression)
					System.out.println("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
					errorMsgs.add("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
				}

				String name = req.getParameter("name");
				String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (name == null || name.trim().length() == 0) {
					System.out.println("員工姓名: 請勿空白");
					errorMsgs.add("員工姓名: 請勿空白");
				} else if (!name.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
					System.out.println("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
					errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}
					
				
				
				
				
//				Part part = req.getPart("personImg");
//				InputStream in = part.getInputStream();
//				byte[] personImg = new byte[in.available()];
//				in.read(personImg);
//				in.close();
				
				byte[] personImg = ((req.getPart("personImg")).getInputStream()).readAllBytes();
				//如果未上傳檔案則上傳原有的，不會被覆蓋掉。
				if (personImg.length == 0) {
					AdminService admSvc  = new AdminService();
				    byte[] oldPersonImg = admSvc.getOneAdmin(adminID).getPersonImg();
				    System.out.println("oldPersonImg=" + oldPersonImg);
				    personImg = oldPersonImg;
				   }
				

				
				
				
				
				   
				   
				   
				   
				   
				AdminVO admVO = new AdminVO();
				admVO.setAccount(account);
				admVO.setPassword(password);
				admVO.setName(name);
				admVO.setPersonImg(personImg);
				
				
				
				
				
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("AdminVO", admVO); // 含有輸入格式錯誤的empVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
					failureView.forward(req, res);
					System.out.println("AAAAAA");
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				AdminService admSvc  = new AdminService();
				admVO = admSvc.updateEmployee(adminID,account, password, name, personImg);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("admVO", admVO); // 資料庫update成功後,正確的的empVO物件,存入req
				String url = "/views/admin/system.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		// ---------------------------------------查詢單一ID搜尋框---------------------------------------
				if ("getOne_Admin".equals(action)) { // 來自select_page.jsp的請求
					List<String> errorMsgs = new LinkedList<String>();
					String str1 = req.getParameter("adminID");
					System.out.println(str1);
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
						String str = req.getParameter("adminID");
						if (str == null || (str.trim()).length() == 0) {
							errorMsgs.add("請輸入管理員ID");
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							System.out.println("AAA");
							RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
							failureView.forward(req, res);
							return;// 程式中斷
						}

						Integer adminID = null;
						try {
							adminID = new Integer(str);
						} catch (Exception e) {
							errorMsgs.add("管理員ID格式不正確");
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
							failureView.forward(req, res);
							return;// 程式中斷
						}

						/*************************** 2.開始查詢資料 *****************************************/
						AdminService admSvc = new AdminService();
						AdminVO admVO = admSvc.getOneAdmin(adminID);
						System.out.println(admVO);
						if (admVO == null) {
							errorMsgs.add("查無資料");
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
							failureView.forward(req, res);
							return;// 程式中斷
						}


						/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//						req.setAttribute("list", Arrays.asList(admVO));
						req.setAttribute("admVO", admVO);
						System.out.println("AAAA");
						String url = "/views/admin/listOneAdm.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
						successView.forward(req, res);

						/*************************** 其他可能的錯誤處理 *************************************/
					} catch (Exception e) {
						errorMsgs.add("無法取得資料:" + e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/system.jsp");
						failureView.forward(req, res);
					}
				}
				
				
				
				
				// ---------------------------------------update_MAM---------------------------------------
				if ("update_MAM".equals(action)) { // 來自update_emp_input.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					String str1 = req.getParameter("adminID");
					System.out.println(str1);
					try {
						/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
						Integer adminID = Integer.valueOf(req.getParameter("adminID").trim());
						String account = req.getParameter("account").trim();
						
						
						String password = req.getParameter("password");
						String passwordReg = "^[0-9A-Za-z]{8,20}$";
						if (password == null || password.trim().length() == 0) {
							System.out.println("BB");
							System.out.println("密碼: 請勿空白");
							errorMsgs.add("密碼: 請勿空白");
						} else if (!password.trim().matches(passwordReg)) { // 以下練習正則(規)表示式(regular-expression)
							System.out.println("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
							errorMsgs.add("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
						}

						String name = req.getParameter("name");
						String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
						if (name == null || name.trim().length() == 0) {
							System.out.println("員工姓名: 請勿空白");
							errorMsgs.add("員工姓名: 請勿空白");
						} else if (!name.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
							System.out.println("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
							errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
						}
							
								
						Part part = req.getPart("personImg");
						InputStream in = part.getInputStream();
						byte[] personImg = new byte[in.available()];
						in.read(personImg);
						in.close();

						boolean accStatus = (Integer.parseInt(req.getParameter("accStatus"))==1);
						
						

						AdminVO admVO = new AdminVO();
						admVO.setAccount(account);
						admVO.setPassword(password);
						admVO.setName(name);
						admVO.setPersonImg(personImg);
						admVO.setAccStatus(accStatus);

						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("AdminVO", admVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/editEmp.jsp");
							failureView.forward(req, res);
							System.out.println("AAAAAA");
							return; // 程式中斷
						}

						/*************************** 2.開始修改資料 *****************************************/
						AdminService admSvc  = new AdminService();
						admVO = admSvc.updateManager(adminID,account, password, name, personImg,accStatus);

						/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
						req.setAttribute("admVO", admVO); // 資料庫update成功後,正確的的empVO物件,存入req
						String url = "/views/admin/editEmp.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
						successView.forward(req, res);

						/*************************** 其他可能的錯誤處理 *************************************/
					} catch (Exception e) {
						System.out.println("CCC");
						errorMsgs.add("修改資料失敗:" + e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/editEmp.jsp");
						failureView.forward(req, res);
					}
				}
				
				
				
				
				
				
			
				
				

		
	}

}
