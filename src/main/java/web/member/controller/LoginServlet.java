package web.member.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.member.entity.MemberVO;
import web.member.service.impl.LonginService;


@WebServlet(
		urlPatterns={"/views/signIn/signIn"}		
)
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		HttpSession session = req.getSession();
		String preURL =(String)session.getAttribute("preURL");

		List<String> errorMsgs = new LinkedList<String>();
		req.setAttribute("errorMsgs", errorMsgs);
		
		//如果點登出進來這
		if("signOut".equals(action)) {
			req.getSession().invalidate();
			String url = "/signIn.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url);
			successView.forward(req, res);
			return;
		}

		try {
			/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
			// 【取得使用者 帳號(account) 密碼(password)】
			String account = req.getParameter("account");
			String password = req.getParameter("password");
			/*************************** 2.開始新增資料 ***************************************/
			LonginService longinService = new LonginService();
			MemberVO memberVO = longinService.login(account, password);//去資料庫確認帳號密碼，並把找到的使用者資料存VO
			if (memberVO==null) {
//				errorMsgs.add(""); 尚未完成
			}
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			req.getSession().setAttribute("MemberVO", memberVO);
	        if (preURL != null) {
	            session.removeAttribute("preURL");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
	            res.sendRedirect(preURL);            
	            return;
	        }else {
	            session.removeAttribute("preURL");   
	            123123res.sendRedirect("/Adopets/index.jsp");      //想導入位置尚未確定，需驗證      
	            return;
	        }
			/*************************** 其他可能的錯誤處理 **********************************/
		} catch (Exception e) {
			errorMsgs.add(e.getMessage());
			RequestDispatcher failureView = req.getRequestDispatcher("登入失敗");
			failureView.forward(req, res);
		}

	}

}
