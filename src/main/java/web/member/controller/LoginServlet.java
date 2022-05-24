package web.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
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
		
		Map<String, String> errors = new HashMap<String, String>();
		req.setAttribute("errors", errors);
		
		//如果點登出進來這  前端畫面尚未完成!
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
				errors.put("account", "帳號或密碼錯誤");
			}
			/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
			// 【帳號 , 密碼有效時, 才做以下工作】
			req.getSession().setAttribute("memberVO", memberVO);
			
			// 新建Cookie
			Cookie uaccountCookie = new Cookie("useraccount", account);
			Cookie pwdCookie = new Cookie("password", password);
			//設置Cookie有效期限
//			if(remember!=null) {					//前端畫面有做記住帳號才需要判斷
//				uaccountCookie.setMaxAge(60*60*24);
//				pwdCookie.setMaxAge(60*60*24);
//			} else {
//				uaccountCookie.setMaxAge(0);
//				pwdCookie.setMaxAge(0);
//			}
			// Cookie輸出到客戶端
			res.addCookie(uaccountCookie);
	        res.addCookie(pwdCookie);
	        if (preURL != null) {
	            session.removeAttribute("preURL");   //*工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
	            res.sendRedirect(preURL);            
	            return;
	        }else {
	            session.removeAttribute("preURL");   
	            res.sendRedirect("/Adopets/views/catInfo/My_home.jsp");      //想導入位置尚未確定，需驗證      
	            return;
	        }
			/*************************** 其他可能的錯誤處理 **********************************/
		} catch (Exception e) {
			RequestDispatcher failureView = req.getRequestDispatcher("/views/signIn/signIn");
			failureView.forward(req, res);
		}

	}

}
