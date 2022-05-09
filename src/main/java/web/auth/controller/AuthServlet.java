package web.auth.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.admin.service.AdminService;
import web.authconfigure.service.AuthConfigureService;


@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
	
    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		String action = req.getParameter("action");
		System.out.println("Action = " + action);
		
		
		if ("delete".equals(action)) { // 來自listAllEmp.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer adminID = new Integer(req.getParameter("adminID"));
				
				/***************************2.開始刪除資料***************************************/
				

				AuthConfigureService AuthConfigureSvc = new AuthConfigureService();
				AuthConfigureSvc.deleteAuthConfigure(adminID);
				
				
				AdminService admSvc = new AdminService();
				admSvc.deleteAdmin(adminID);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/views/admin/systemAuth.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				System.out.println("AAAA");
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/views/admin/systemAuth.jsp");
				failureView.forward(req, res);
			}
		}
		
		
		
		
	}

}
