package web.donate.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import ecpay.payment.integration.AllInOne;
import ecpay.payment.integration.domain.AioCheckOutALL;
import web.donate.entity.DonateVO;
import web.donate.service.DonateService;
import web.tools.AuthCode;

/**
 * Servlet implementation class NewDonate
 */
@WebServlet("/NewDonate")
public class NewDonate extends HttpServlet {
	
	public static AllInOne allInOne;
	
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/plain; charset=UTF-8");
		String action = req.getParameter("action");
		System.out.println("Action = " + action);

		// ---------------------------------------Manager_New_Emp---------------------------------------
		if ("New_Donate".equals(action)) {
			System.out.println("AAAA");
			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

//			try {
				System.out.println(req.getParameter("memID"));
				Integer memID = new Integer(req.getParameter("memID"));
				

				Integer catID = new Integer(req.getParameter("catID"));
				
				System.out.println(catID);

				String shelterName = req.getParameter("shelterName").trim();
				
				System.out.println(shelterName);

				String last_name = req.getParameter("last_name").trim();
				String first_name = req.getParameter("first_name").trim();
				String donateName = last_name + first_name;
				System.out.println(donateName);

				String donateEmail = req.getParameter("donateEmail").trim();
				
				System.out.println(donateEmail);

				String phone = req.getParameter("phone").trim();
				
				System.out.println(phone);

				String city = req.getParameter("city").trim();
				String town = req.getParameter("town").trim();
				String street_address = req.getParameter("street_address").trim();
				String donateAddr = city + town + street_address;
				
				System.out.println(donateAddr);

				Integer donateAmo = new Integer(req.getParameter("donateAmo"));
				
				System.out.println(donateAmo);

				Integer donateStatus = new Integer(req.getParameter("donateStatus"));
				
				System.out.println(donateStatus);

				String donateMes = req.getParameter("donateMes").trim();
				
				System.out.println(donateMes);

	
				String donateEmailReg = "^\\w+((-\\w+)|(\\.\\w+))*\\@[A-Za-z0-9]+((\\.|-)[A-Za-z0-9]+)*\\.[A-Za-z]+$";
				if (donateEmail == null || donateEmail.trim().length() == 0) {
					System.out.println("Email: ????????????");
					errorMsgs.add("Email: ????????????");
				} else if (!donateEmail.trim().matches(donateEmailReg)) { // ??????????????????(???)?????????(regular-expression)
					System.out.println("email: ???????????????????????????");
					errorMsgs.add("email: ???????????????????????????");
				}

				

			
				String phoneReg = "^[0-9]{10}$";
				if (phone == null || phone.trim().length() == 0) {
					System.out.println("??????: ????????????");
					errorMsgs.add("??????: ????????????");
				} else if (!phone.trim().matches(phoneReg)) { // ??????????????????(???)?????????(regular-expression)
					System.out.println("??????????????????????????????09-12123123???");
					errorMsgs.add("??????????????????????????????09-12123123???");
				}

		
							

				DonateVO donVO = new DonateVO();
				donVO.setMemID(memID);
				donVO.setCatID(catID);
				donVO.setShelterName(shelterName);
				donVO.setDonateName(donateName);
				donVO.setDonateEmail(donateEmail);
				donVO.setPhone(phone);
				donVO.setDonateAddr(donateAddr);
				donVO.setDonateAmo(donateAmo);
				donVO.setDonateStatus(donateStatus);
				donVO.setDonateMes(donateMes);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("DonateVO", donVO);
					RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donate.jsp");
					failureView.forward(req, res);
					System.out.println("AAAAAA");
					return;
				}

				DonateService donSvc = new DonateService();
				donVO = donSvc.addDonate(memID, catID, shelterName, donateName, donateEmail,phone,donateAddr,donateAmo,donateStatus,donateMes);
				req.setAttribute("donVO", donVO);
				System.out.println("CCCC");
//				String url = "/views/donate/donate.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);
//				successView.forward(req, res);
				
				
				
//===========================================????????????=================================================
				AuthCode authcode = new AuthCode();
				authcode.setTargetStringLength(10);
				String ListID = authcode.givenUsingJava8_whenGeneratingRandomAlphanumericString_thenCorrect();
				
				SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				String Donatedate = sdf.format(new Date());
				String itemName ="Adopets??????-????????????????????????";
				allInOne = new AllInOne("");

				AioCheckOutALL aCheckOut = new AioCheckOutALL();
				aCheckOut.setMerchantTradeNo(donVO.getDonateID() + ListID);
				aCheckOut.setMerchantTradeDate(Donatedate);
				aCheckOut.setTotalAmount(donateAmo + "");
				aCheckOut.setTradeDesc("test");
				aCheckOut.setItemName(itemName);
				aCheckOut.setClientBackURL("http://localhost:8081/Adopets/views/catInfo/My_home.jsp");
				aCheckOut.setReturnURL("http://localhost:8081/Adopets//epayCheckOrder");

//				aCheckOut.setReturnURL("http://211.23.128.214:5000/");
				aCheckOut.setNeedExtraPaidInfo("N");
				String outStr= allInOne.aioCheckOut(aCheckOut, null);
				PrintWriter out = res.getWriter();
				out.println(outStr);
				System.out.println(outStr);
				out.close();
				
//			} catch (Exception e) {
//				System.out.println("BBBB");
//				errorMsgs.add("??????????????????:" + e.getMessage());
//				RequestDispatcher failureView = req.getRequestDispatcher("/views/donate/donate.jsp");
//				failureView.forward(req, res);
//			}
		}

	}

}
