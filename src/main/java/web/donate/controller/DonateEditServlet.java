package web.donate.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.donate.entity.DonateVO;
import web.donate.service.DonateService;

/**
 * Servlet implementation class DonateEdit
 */
@WebServlet("/DonateEditServlet")
public class DonateEditServlet extends HttpServlet {
       
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		String action = req.getParameter("action");
		System.out.println("Action = " + action);
	 
		
		
		if ("getOne_For_Donate".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);
			
			try {
				
				Integer donateID = Integer.valueOf(req.getParameter("donateID").trim());
				
				System.out.println(donateID);

				DonateService donSvc = new DonateService();
				DonateVO donVO = donSvc.getOneDonate(donateID);
								
			
				req.setAttribute("donVO", donVO);       
				String url = "/views/donate/donateEdit.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);


			} catch (Exception e) {
				System.out.println("AA");
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/views/donate/donateBackground.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		// ---------------------------------------update_Donate---------------------------------------
				if ("update_Donate".equals(action)) { // 來自update_emp_input.jsp的請求

					List<String> errorMsgs = new LinkedList<String>();
					req.setAttribute("errorMsgs", errorMsgs);
					
					String str1 = req.getParameter("donateID");
					System.out.println(str1);
					
					try {
						/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
						Integer donateID = Integer.valueOf(req.getParameter("donateID").trim());
						String Status = req.getParameter("donateStatus");
						Integer donateStatus = Integer.parseInt(Status);
						
						System.out.println(donateID);
						System.out.println(donateStatus);
						
						DonateVO donVO = new DonateVO();
						donVO.setDonateID(donateID);
						donVO.setDonateStatus(donateStatus);
												
						if (!errorMsgs.isEmpty()) {
							req.setAttribute("donVO", donVO); // 含有輸入格式錯誤的empVO物件,也存入req
							RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donateEdit.jsp");
							failureView.forward(req, res);
							System.out.println("AAAAAA");
							return; // 程式中斷
						}

						/*************************** 2.開始修改資料 *****************************************/
						DonateService donSvc = new DonateService();
						donVO = donSvc.updateDonate(donateID, donateStatus);

						/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
						req.setAttribute("donVO", donVO); // 資料庫update成功後,正確的的empVO物件,存入req
						String url = "/views/donate/donateBackground.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneEmp.jsp
						successView.forward(req, res);

						/*************************** 其他可能的錯誤處理 *************************************/
					} catch (Exception e) {
						System.out.println("ABC");
						errorMsgs.add("修改資料失敗:" + e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donateEdit.jsp");
						failureView.forward(req, res);
					}
				}
				
				
				
				
				// ---------------------------------------查詢單一ID搜尋框---------------------------------------
				if ("getOne_Donate".equals(action)) { // 來自select_page.jsp的請求
					List<String> errorMsgs = new LinkedList<String>();
					String str1 = req.getParameter("donateID");
					System.out.println(str1);
					req.setAttribute("errorMsgs", errorMsgs);

					try {
						/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
						String str = req.getParameter("donateID");
						if (str == null || (str.trim()).length() == 0) {
							errorMsgs.add("請輸入捐款ID");
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							System.out.println("AAA");
							RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donateBackground.jsp");
							failureView.forward(req, res);
							return;// 程式中斷
						}

						Integer donateID = null;
						try {
							donateID = new Integer(str);
						} catch (Exception e) {
							errorMsgs.add("捐款ID格式不正確");
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donateBackground.jsp");
							failureView.forward(req, res);
							return;// 程式中斷
						}

						/*************************** 2.開始查詢資料 *****************************************/
						DonateService donSvc = new DonateService();
						DonateVO donVO = donSvc.getOneDonate(donateID);
						System.out.println(donVO);
						if (donVO == null) {
							errorMsgs.add("查無資料");
						}
						// Send the use back to the form, if there were errors
						if (!errorMsgs.isEmpty()) {
							RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donateBackground.jsp");
							failureView.forward(req, res);
							return;// 程式中斷
						}


						/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
//						req.setAttribute("list", Arrays.asList(admVO));
						req.setAttribute("donVO", donVO);
						System.out.println("AAAA");
						String url = "/views/donate/donateListOne.jsp";
						RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneEmp.jsp
						successView.forward(req, res);

						/*************************** 其他可能的錯誤處理 *************************************/
					} catch (Exception e) {
						errorMsgs.add("無法取得資料:" + e.getMessage());
						RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donateBackground.jsp");
						failureView.forward(req, res);
					}
				}
		
	}

}
