package web.background.login;

import java.io.IOException;
import java.util.HashMap;
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

import web.admin.entity.AdminVO;
import web.admin.service.AdminService;
import web.authconfigure.service.AuthConfigureService;

/**
 * Servlet implementation class LoginHandler
 */
@WebServlet("/LoginHandler")
public class LoginHandler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	// 【檢查使用者輸入的帳號(account) 密碼(password)是否有效】
	// 【實際上應至資料庫搜尋比對】

	public void doPost(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
//	    PrintWriter out = res.getWriter();

		// 【取得使用者 帳號(account) 密碼(password)】
		String account = req.getParameter("account");
		String password = req.getParameter("password");

		Map<String, String> errors = new HashMap<String, String>();
		req.setAttribute("errors", errors);
		
		String remember = req.getParameter("remember");
		req.setAttribute("remember", remember);

		if (account == null || (account.trim()).length() == 0) {
			errors.put("account", "請輸入帳號");
		}

		if (password == null || password.length() == 0) {
			errors.put("password", "請輸入密碼");
		}

		if (errors != null && !errors.isEmpty()) {

			req.getRequestDispatcher("/views/background_login/backstage_login.jsp").forward(req, res);
			return;
		}

		AdminService admSvc = new AdminService();
		AdminVO adminVO = admSvc.checkLoginUser(account, password);
		System.out.println(adminVO);

		// 【檢查該帳號 , 密碼是否有效】
		if (adminVO == null) { // 【帳號 , 密碼無效時】
			errors.put("password", "登入失敗, 請再試一次");
			RequestDispatcher failureView = req.getRequestDispatcher("/views/background_login/backstage_login.jsp");
			failureView.forward(req, res);
			return;// 程式中斷
		} else if (adminVO.isAccStatus() == false) {
			errors.put("password", "登入失敗! 帳號已禁用 ");
			RequestDispatcher failureView = req.getRequestDispatcher("/views/background_login/backstage_login.jsp");
			failureView.forward(req, res);
			return;// 程式中斷
		}

		// 【帳號 , 密碼有效時, 才做以下工作】
		HttpSession session = req.getSession();
		session.setAttribute("adminVO", adminVO); // *工作1: 才在session內做已經登入過的標識

		// 獲取使用者權限集合
		Integer adminID = adminVO.getAdminID();
		System.out.println(adminID);
		AuthConfigureService authConfigureService = new AuthConfigureService();
		List<Integer> auth = authConfigureService.getOneAuthConfigure(adminID);

		System.out.println(auth);

		session.setAttribute("auth", auth);

		// 新建Cookie
		Cookie uaccountCookie = new Cookie("useraccount", account);
		Cookie pwdCookie = new Cookie("password", password);
		// 設置Cookie有效期限
		if (remember != null) {
			uaccountCookie.setMaxAge(60 * 60 * 24);
			pwdCookie.setMaxAge(60 * 60 * 24);
		} else {
			uaccountCookie.setMaxAge(0);
			pwdCookie.setMaxAge(0);
		}
		// Cookie輸出到客戶端
		res.addCookie(uaccountCookie);
		res.addCookie(pwdCookie);

		try {
			String location = (String) session.getAttribute("location");
			if (location != null) {
				session.removeAttribute("location"); // *工作2: 看看有無來源網頁 (-->如有來源網頁:則重導至來源網頁)
				res.sendRedirect(location);
				return;
			}
		} catch (Exception ignored) {
		}

		res.sendRedirect(req.getContextPath() + "/views/background_login/background.jsp"); // *工作3:
																							// (-->如無來源網頁:則重導至login_success.jsp)
	}
}
