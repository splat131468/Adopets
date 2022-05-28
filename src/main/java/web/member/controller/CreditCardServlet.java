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
import web.member.service.impl.MemberService;

/**
 * Servlet implementation class CreditCardServlet
 */
@WebServlet("/CreditCardServlet")
public class CreditCardServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CreditCardServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("insertCardNumber".equals(action)) { // 來自register.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
			HttpSession session = request.getSession();
			MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String inputNumber = request.getParameter("inputNumber");
//System.out.println(inputNumber);
				MemberVO updateVO = new MemberVO();
				updateVO.setAccount(memberVO.getAccount());
				updateVO.setCreditCard(inputNumber);
//System.out.println(updateVO);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memberVO", updateVO); // 含有輸入格式錯誤的VO物件,也存入request
					RequestDispatcher failureView = request.getRequestDispatcher("/views/member/creditCard.jsp");
					failureView.forward(request, response);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				MemberService memberService = new MemberService();
				memberService.updateCreditcard(inputNumber,memberVO.getAccount());
				session.setAttribute("memberVO", updateVO);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/views/member/member.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 新增成功後轉交jsp
				successView.forward(request, response);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/views/member/creditCard.jsp");
				failureView.forward(request, response);
			}
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
