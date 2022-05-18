package web.member.controller;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import web.member.entity.MemberVO;
import web.member.service.impl.MemberService;

@MultipartConfig
@WebServlet("/member/member")
public class MemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public MemberServlet() {

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doPost(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		if ("insertMember".equals(action)) { // 來自register.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/
				String inputEmail = request.getParameter("inputEmail");
				String inputEmailReg = "^([A-Za-z0-9_\\-\\.])+\\@([A-Za-z0-9_\\-\\.])+\\.([A-Za-z]{2,4})$";
				if (inputEmail == null || inputEmail.trim().length() == 0) {
					errorMsgs.add("不要亂寫，竟然放空白");
				} else if (!inputEmail.trim().matches(inputEmailReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("不符合email規則，你在測試嗎?");
				}
	
				String inputPassword = request.getParameter("inputPassword");
				String inputPasswordReg = "^([0-9A-Za-z\\\\S]){8,16}$";
				if (inputPassword == null || inputPassword.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				} else if (!inputPassword.trim().matches(inputPasswordReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("密碼長度在 8-16 字元內，可放入數字或英文字，且不可含有空白");
				}
				
				String confirmPassword = request.getParameter("confirmPassword");
				if (confirmPassword == null || confirmPassword.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				} 

				String inputName = request.getParameter("inputName").trim();
				String inputnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (inputName == null || inputName.trim().length() == 0) {
					errorMsgs.add("姓名請勿空白");
				} else if (!inputName.trim().matches(inputnameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				MemberVO memberVO = new MemberVO();
				memberVO.setAccount(inputEmail);
				memberVO.setPassword(inputPassword);
				memberVO.setName(inputName);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的memberVO物件,也存入request
					RequestDispatcher failureView = request.getRequestDispatcher("/views/member/register.jsp");
					failureView.forward(request, response);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.addMember(inputEmail, inputPassword, inputName);
//				request.setAttribute("memberVO", memberVO);
				HttpSession session = request.getSession();
				session.setAttribute("memberVO", memberVO);
				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/views/member/member.jsp";
				RequestDispatcher failureView = request.getRequestDispatcher(url);
				failureView.forward(request, response);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/views/member/register.jsp");
				failureView.forward(request, response);
			}
		}

		if ("updateMember".equals(action)) { // 來自member.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
		
				
//				String inputEmail=  request.getParameter("inputEmail");
				HttpSession session = request.getSession();
				String inputEmail = ((MemberVO)session.getAttribute("MemberVO")).getAccount();
				
				System.out.println(inputEmail);
				
				String inputPassword = request.getParameter("inputPassword");
				String inputPasswordReg = "^([0-9A-Za-z\\\\S]){8,16}$";
				if (inputPassword == null || inputPassword.trim().length() == 0) {
					errorMsgs.add("密碼請勿空白");
				} else if (!inputPassword.trim().matches(inputPasswordReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("密碼長度在 8-16 字元內，可放入數字或英文字，且不可含有空白");
				}

				String inputName = request.getParameter("inputName").trim();
				String inputnameReg = "^[(\u4e00-\u9fa5)(a-zA-Z0-9_)]{2,10}$";
				if (inputName == null || inputName.trim().length() == 0) {
					errorMsgs.add("姓名請勿空白");
				} else if (!inputName.trim().matches(inputnameReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("只能是中、英文字母、數字和_ , 且長度必需在2到10之間");
				}

				String inputPhone = request.getParameter("inputPhone");
				String inputPhoneReg = "^09[0-9]{8}$";
				if (inputPhone == null || inputPhone.trim().length() == 0) {
					errorMsgs.add("手機請勿空白");
				} else if (!inputPhone.trim().matches(inputPhoneReg)) { // 以下練習正則(規)表示式(regular-expression)
					errorMsgs.add("不符合手機號碼規則，你在測試嗎?");
				}

				String inputAge = request.getParameter("inputAge");
				String inputAddress = request.getParameter("inputAddress");
				

				Part filePart = request.getPart("p_file"); // <input type="file" name="p_file">
				InputStream inputPersonImg = filePart.getInputStream();
				byte[] buffer = new byte[inputPersonImg.available()];
				inputPersonImg.read(buffer);// 把圖傳進buffer陣列

				MemberVO memberVO = new MemberVO();
				
				// 模擬
				memberVO.setMemID(20);
				//
				memberVO.setAccount(inputEmail);
				memberVO.setPassword(inputPassword);
				memberVO.setName(inputName);
				memberVO.setAge(inputAge);
				memberVO.setPhone(inputPhone);
				memberVO.setAddress(inputAddress);
				memberVO.setPersonImg(buffer);
//				memberVO.setChangeDate(new Timestamp(new java.util.Date().getTime()));
				System.out.println(memberVO);
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					request.setAttribute("memberVO", memberVO); // 含有輸入格式錯誤的VO物件,也存入request
					RequestDispatcher failureView = request.getRequestDispatcher("/views/member/register.jsp");
					failureView.forward(request, response);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				MemberService memberSvc = new MemberService();
				memberVO = memberSvc.updateMember(inputEmail,inputPassword, inputName, inputAge, inputPhone,
						inputAddress, buffer);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				request.setAttribute("memberVO", memberVO); // 資料庫update成功後,正確的的VO物件,存入request
				String url = "/views/member/member.jsp";
				RequestDispatcher successView = request.getRequestDispatcher(url); // 修改成功後,轉交jsp
				successView.forward(request, response);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				e.printStackTrace();
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = request.getRequestDispatcher("/views/member/register.jsp");
				failureView.forward(request, response);
			}
		}
		
		if ("delete".equals(action)) { // 來自

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			request.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/

				@SuppressWarnings("deprecation")
				Integer memID = new Integer(request.getParameter("memID"));
				
				/***************************2.開始刪除資料***************************************/
				MemberService memberSvc = new MemberService();
				memberSvc.deleteMember(memID);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "未決定";
				RequestDispatcher successView = request.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(request, response);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = request
						.getRequestDispatcher("未決定");
				failureView.forward(request, response);
			}
		}	
	}
}
