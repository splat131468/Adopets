package web.background.filters;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 * Servlet implementation class LoginFilter
 */
@WebFilter(urlPatterns = {"/views/background_login/background.jsp","/views/admin/editEmp.jsp","/views/admin/listOneAdm.jsp",
"/views/admin/listOneMan.jsp","/views/admin/newEmp.jsp","/views/admin/system.jsp","/views/admin/systemAuth.jsp",
"/views/donate/donateBackground.jsp","/views/donate/donateEdit.jsp","/views/donate/donateListOne.jsp"
})
public class BackgroundLoginFilter implements Filter {
	private FilterConfig config;

	public void init(FilterConfig config) {
		this.config = config;
	}

	public void destroy() {
		config = null;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws ServletException, IOException {

		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		// 【取得 session】
		HttpSession session = req.getSession();
		// 【從 session 判斷此user是否登入過】
		Object account = session.getAttribute("adminVO");
		if (account == null) {
			session.setAttribute("location", req.getRequestURI());
			res.sendRedirect(req.getContextPath() + "/views/background_login/backstage_login.jsp");
			return;
		} else {
			chain.doFilter(request, response);
		}
	}
	

}
