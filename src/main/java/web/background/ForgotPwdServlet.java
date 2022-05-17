package web.background;

import java.io.IOException;
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
import web.tools.AuthCode;
import web.tools.MailService;

/**
 * Servlet implementation class ForgotPwdServlet
 */
@WebServlet("/ForgotPwdServlet")
public class ForgotPwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        this.doPost(req,res);
    }



	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		AdminService admSvc  = new AdminService();

		Map<String, String> errors = new HashMap<String, String>();
		req.setAttribute("errors", errors);
		
		String member = req.getParameter("email");
		
		AdminVO account = admSvc.selectAccount(member);
		System.out.println(account);
		
	
		
		if(account!=null) {
			AuthCode authcode = new AuthCode();
			authcode.setTargetStringLength(10);
			
			String temporarypwd = authcode.givenUsingJava8_whenGeneratingRandomAlphanumericString_thenCorrect();
			
			AdminVO tempwdmember = admSvc.findPassword(account.getAccount(),temporarypwd);
			
			
			System.out.println("tempwdmember:"+tempwdmember);

			MailService sendMail = new MailService();
			sendMail.sendMail(member, "[Adopets]管理員忘記密碼通知信",
					"親愛的管理員您好:<br><br>您的帳號:" + tempwdmember.getAccount() + " 申請忘記密碼通知，" + "系統發送新密碼為" + temporarypwd + "，"
							+ "請使用新密碼登入，並至Adopets後台重新修改密碼。<br> <br> <br>  Adopets後台管理系統 敬上"

					);

			res.sendRedirect(req.getContextPath() + "/views/background_login/backstage_login.jsp"); 
			

		} else {
			errors.put("nonexistent", "請您重新確認email");
			RequestDispatcher failureView = req.getRequestDispatcher("/views/background_login/forgot-pwd.jsp");
			failureView.forward(req, res);
		}

	}

}
