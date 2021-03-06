package web.member.dao.impl;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.member.entity.MemberVO;

/**
 * Servlet Filter implementation class LoginFilter
 */
@WebFilter(
		urlPatterns={"/views/member/adoptLog.jsp","/views/member/creditCard.jsp"
				,"/views/member/donateLog.jsp","/views/member/member.jsp"
				,"/views/member/myFavorite.jsp","/views/member/orderListLog.jsp"}		
)
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO!=null) {		//阻擋尚未登入 判斷是否有登入 無:跳轉至登入畫面
			chain.doFilter(request, response);
		}else {
		    session.setAttribute("preURL", req.getRequestURI());
			RequestDispatcher successView = req.getRequestDispatcher("/views/signIn/signIn.jsp");
			successView.forward(request, response);
		}
		// pass the request along the filter chain
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
