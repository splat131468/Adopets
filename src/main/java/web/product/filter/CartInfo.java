package web.product.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import web.member.entity.MemberVO;

@WebFilter(
		urlPatterns={"/shCartAction"}		
)
public class CartInfo implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
	
		
		
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		HttpSession session = req.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
		if(memberVO!=null) {		//阻擋尚未登入 判斷是否有登入 無:跳轉至登入畫面
			chain.doFilter(request, response);
		}else {
			 
		    session.setAttribute("preURL","/Adopets/shCartAction?action=getCart");
			RequestDispatcher successView = req.getRequestDispatcher("/views/signIn/signIn.jsp");
			successView.forward(request, response);
		}
		
		
		
		
		
	}

	
	
	
}
