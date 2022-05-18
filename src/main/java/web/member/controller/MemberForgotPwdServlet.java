package web.member.controller;

import java.io.IOException;
import java.lang.reflect.Member;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.admin.entity.AdminVO;
import web.admin.service.AdminService;
import web.member.entity.MemberVO;
import web.member.service.impl.MemberService;
import web.tools.AuthCode;
import web.tools.MailService;

/**
 * Servlet implementation class ForgotPwdServlet
 */
@WebServlet("/MemberForgotPwdServlet")
public class MemberForgotPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doPost(req,res);
    }



	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		MemberService memberService  = new MemberService();

		Map<String, String> errors = new HashMap<String, String>();
		req.setAttribute("errors", errors);
		
		String member = req.getParameter("email");
		
		MemberVO account = memberService.selectAccount(member);
		System.out.println(account);
			
		if(account!=null) {
			AuthCode authcode = new AuthCode();
			authcode.setTargetStringLength(10);
			
			String temporarypwd = authcode.givenUsingJava8_whenGeneratingRandomAlphanumericString_thenCorrect();
			
			MemberVO tempwdmember = memberService.findPassword(account.getAccount(),temporarypwd);
			
			
			System.out.println("tempwdmember:"+tempwdmember);

			MailService sendMail = new MailService();
			sendMail.sendMail(member, "Adopets新密碼來了~","<table>\r\n"
					+ "        <tr>\r\n"
					+ "            <td>\r\n"
					+ "                親愛的 <span style=\"color: blueviolet;\">"+ tempwdmember.getAccount() +"</span> 您好，<span style=\"color: crimson;font-weight: bold; \">" + temporarypwd + "</span>是透過系統發送的新密碼，請使用新密碼重新登入，感謝您的支持，希望喜歡我們的網站，如有任何問題，歡迎您與<a href=\"#\" style=\"color:blueviolet; text-decoration: none;\">ADOPETS</a> 聯絡。\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "        <tr>\r\n"
					+ "            <td height=\"10\"></td>\r\n"
					+ "        </tr>\r\n"
					+ "        <tr>\r\n"
					+ "            <td>\r\n"
					+ "                祝您有個愉快的一天 - ADOPETS團隊\r\n"
					+ "            </td>\r\n"
					+ "        </tr>\r\n"
					+ "    </table>"
					);

			res.sendRedirect(req.getContextPath() + "/views/signIN/signIn.jsp"); 
			

		} else {
			errors.put("nonexistent", "請您重新確認email");
			RequestDispatcher failureView = req.getRequestDispatcher("/views/signIn/forgotPwd.jsp");
			failureView.forward(req, res);
		}

	}

}
