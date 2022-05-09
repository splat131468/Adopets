package web.authconfigure.controller; 

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.admin.entity.AdminVO;
import web.admin.service.AdminService;
import web.authconfigure.entity.AuthConfigureVO;
import web.authconfigure.service.AuthConfigureService;


/**
 * Servlet implementation class AuthConfigureServlet
 */
@WebServlet("/AuthConfigureServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024, maxFileSize = 5 * 1024 * 1024, maxRequestSize = 5 * 5 * 1024 * 1024)
public class AuthConfigureServlet extends HttpServlet {
	
	 protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
			doPost(req, res);
		}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	 protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		 
		    req.setCharacterEncoding("UTF-8");
			res.setContentType("text/plain; charset=UTF-8");
			String action = req.getParameter("action");
			System.out.println("Action = " + action);
		 
			
			
			if ("getOne_For_Manager".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				
				try {
					
					Integer adminID = new Integer(req.getParameter("adminID"));
					

					AdminService admSvc = new AdminService();
					AdminVO admVO = admSvc.getOneAdmin(adminID);
									
				
					req.setAttribute("admVO", admVO);       
					String url = "/views/admin/editEmp.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url);
					successView.forward(req, res);


				} catch (Exception e) {
					errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
					RequestDispatcher failureView = req
							.getRequestDispatcher("/views/admin/systemAuth.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			
			
				
			
			// ---------------------------------------Manager_Edit_Emp---------------------------------------
			if ("Manager_Edit_Emp".equals(action)) { 

				List<String> errorMsgs = new LinkedList<String>();
				// Store this set in the request scope, in case we need to
				// send the ErrorPage view.
				req.setAttribute("errorMsgs", errorMsgs);
				String str1 = req.getParameter("adminID");
				System.out.println(str1);
				try {
					
					Integer adminID = new Integer(req.getParameter("adminID"));
					String account = req.getParameter("account").trim();
					
					System.out.println(adminID);
					System.out.println(account);
					
					
					
					String password = req.getParameter("password");
					String passwordReg = "^[0-9A-Za-z]{8,20}$";
					if (password == null || password.trim().length() == 0) {
						System.out.println("密碼: 請勿空白");
						errorMsgs.add("密碼: 請勿空白");
					} else if (!password.trim().matches(passwordReg)) { // 以下練習正則(規)表示式(regular-expression)
						System.out.println("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
						errorMsgs.add("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
					}
					
					System.out.println(password);
					

					String name = req.getParameter("name");
					String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
					if (name == null || name.trim().length() == 0) {
						System.out.println("員工姓名: 請勿空白");
						errorMsgs.add("員工姓名: 請勿空白");
					} else if (!name.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
						System.out.println("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
						errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
					}
						
					System.out.println(name);
					
					
					byte[] personImg = ((req.getPart("personImg")).getInputStream()).readAllBytes();
					//如果未上傳檔案則上傳原有的，不會被覆蓋掉。
					if (personImg.length == 0) {
						AdminService admSvc  = new AdminService();
					    byte[] oldPersonImg = admSvc.getOneAdmin(adminID).getPersonImg();
					    System.out.println("oldPersonImg=" + oldPersonImg);
					    personImg = oldPersonImg;
					   }
					
					System.out.println(personImg);
					

					String status=req.getParameter("accStatus");
					boolean accStatus=Boolean.valueOf(status).booleanValue();
					System.out.println(accStatus);
					

					AuthConfigureVO authConfigureVO = new AuthConfigureVO();
					AuthConfigureService AuthConfigureSvc = new AuthConfigureService();
					String[] auth = req.getParameterValues("choice");
					
					if(auth==null) {
						AuthConfigureSvc.deleteAuthConfigure(adminID);
						req.setAttribute("authConfigureVO", authConfigureVO); 
					}else {
					
					AuthConfigureSvc.deleteAuthConfigure(adminID);  //因為修改權限，必須先把該使用者的權限刪除再重新新增上去
				
					for(int i = 0;i < auth.length;i++)
					{
					   authConfigureVO = AuthConfigureSvc.addAuthConfigure(adminID, Integer.parseInt(auth[i]));
					};
					req.setAttribute("authConfigureVO", authConfigureVO); 
					}
				
					

					
					AdminVO admVO = new AdminVO();
					admVO.setAdminID(adminID);
					admVO.setAccount(account);
					admVO.setPassword(password);
					admVO.setName(name);
					admVO.setPersonImg(personImg);
					admVO.setAccStatus(accStatus);

					// Send the use back to the form, if there were errors
					if (!errorMsgs.isEmpty()) {
						req.setAttribute("AdminVO", admVO); 
						RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/editEmp.jsp");
						failureView.forward(req, res);
						System.out.println("AAAAAA");
						return; 
					}
					
					
					
					AdminService admSvc  = new AdminService();
					admVO = admSvc.updateManager(adminID, account, password, name, personImg,accStatus);

					
					req.setAttribute("admVO", admVO); 
					System.out.println("CCCC");
					String url = "/views/admin/systemAuth.jsp";
					RequestDispatcher successView = req.getRequestDispatcher(url); 
					successView.forward(req, res);

					
				} catch (Exception e) {
					System.out.println("BBBB");
					errorMsgs.add("修改資料失敗:" + e.getMessage());
					RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/editEmp.jsp");
					failureView.forward(req, res);
				}
			}
			
			
			
			
			
			
			
			//---------------------------------------Manager_New_Emp---------------------------------------
						if ("Manager_New_Emp".equals(action)) { 

							List<String> errorMsgs = new LinkedList<String>();
							// Store this set in the request scope, in case we need to
							// send the ErrorPage view.
							req.setAttribute("errorMsgs", errorMsgs);

							try {
								String account = req.getParameter("account").trim();
								
								
								System.out.println(account);
													
								String password = req.getParameter("password");
								String passwordReg = "^[0-9A-Za-z]{8,20}$";
								if (password == null || password.trim().length() == 0) {
									System.out.println("密碼: 請勿空白");
									errorMsgs.add("密碼: 請勿空白");
								} else if (!password.trim().matches(passwordReg)) { // 以下練習正則(規)表示式(regular-expression)
									System.out.println("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
									errorMsgs.add("密碼: 長度為8到20位，必須包含字母和數字，字母區分大小寫");
								}
								
								System.out.println(password);
								

								String name = req.getParameter("name");
								String nameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
								if (name == null || name.trim().length() == 0) {
									System.out.println("員工姓名: 請勿空白");
									errorMsgs.add("員工姓名: 請勿空白");
								} else if (!name.trim().matches(nameReg)) { // 以下練習正則(規)表示式(regular-expression)
									System.out.println("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
									errorMsgs.add("員工姓名: 只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
								}
									
								System.out.println(name);
								
								
								byte[] personImg = ((req.getPart("personImg")).getInputStream()).readAllBytes();
								
								
								System.out.println(personImg);
								

								String status=req.getParameter("accStatus");
								boolean accStatus=Boolean.valueOf(status).booleanValue();
								System.out.println(accStatus);
								
				
								AdminVO admVO = new AdminVO();								
								admVO.setAccount(account);
								admVO.setPassword(password);
								admVO.setName(name);
								admVO.setPersonImg(personImg);
								admVO.setAccStatus(accStatus);
							

								// Send the use back to the form, if there were errors
								if (!errorMsgs.isEmpty()) {
									req.setAttribute("AdminVO", admVO); 
									RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/newEmp.jsp");
									failureView.forward(req, res);
									System.out.println("AAAAAA");
									return; 
								}
								
								
								
								AdminService admSvc  = new AdminService();
								admVO = admSvc.addAdmin(account, password, name, personImg,accStatus);
								
								AuthConfigureVO authConfigureVO = new AuthConfigureVO();
								AuthConfigureService AuthConfigureSvc = new AuthConfigureService(); //因為新增，不用先刪除
								String[] auth = req.getParameterValues("choice");
								
								if(auth!=null) {
								for(int i = 0;i < auth.length;i++)								
								   authConfigureVO = AuthConfigureSvc.addAuthConfigure(admVO.getAdminID(), Integer.parseInt(auth[i])); //可以得到自增主鍵								
								}
								req.setAttribute("authConfigureVO", authConfigureVO); 
								
								req.setAttribute("admVO", admVO); 
								System.out.println("CCCC");
								String url = "/views/admin/systemAuth.jsp";
								RequestDispatcher successView = req.getRequestDispatcher(url); 
								successView.forward(req, res);

								
							} catch (Exception e) {
								System.out.println("BBBB");
								errorMsgs.add("修改資料失敗:" + e.getMessage());
								RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/newEmp.jsp");
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
									RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/systemAuth.jsp");
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
									RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/systemAuth.jsp");
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
									RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/systemAuth.jsp");
									failureView.forward(req, res);
									return;// 程式中斷
								}


								/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//								req.setAttribute("list", Arrays.asList(admVO));
								req.setAttribute("admVO", admVO);
								System.out.println("AAAA");
								String url = "/views/admin/listOneMan.jsp";
								RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
								successView.forward(req, res);

								/*************************** 其他可能的錯誤處理 *************************************/
							} catch (Exception e) {
								errorMsgs.add("無法取得資料:" + e.getMessage());
								RequestDispatcher failureView = req.getRequestDispatcher("/views/admin/systemAuth.jsp");
								failureView.forward(req, res);
							}
						}
	
	 }
}
