package web.order.controller;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.google.gson.Gson;

import web.order.entity.OrderDetailVO;
import web.order.entity.OrdersVO;
import web.order.service.OrdersService;



@WebServlet("/OrdersServlet")
public class OrdersServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");

		if ("getOne_For_Display".equals(action)) { // 來自Orders.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("orderID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/Orders.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer orderID = null;
				try {
					orderID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/Orders.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				OrdersService odrSvc = new OrdersService();
				OrdersVO ordersVO = odrSvc.findPrimaryKeyOrder(orderID);

				if (ordersVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/Orders.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("ordersVO", ordersVO); // 資料庫取出的OrdersVO物件,存入req
				String url = "/views/order/listOneOrders.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrders.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/Orders.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllOrders.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer orderID = new Integer(req.getParameter("orderID"));

				/*************************** 2.開始查詢資料 ****************************************/
				OrdersService odrSvc = new OrdersService();

				OrdersVO ordersVO = odrSvc.findPrimaryKeyOrder(orderID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("ordersVO", ordersVO); // 資料庫取出的OrdersVO物件,存入req
				String url = "/views/order/update_orders_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_orders_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/listAllOrders.jsp");
				failureView.forward(req, res);
			}
		}

		if ("update".equals(action)) { // 來自update_orders_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer orderID = new Integer(req.getParameter("orderID").trim());

				Integer memID = new Integer(req.getParameter("memID").trim());

				Timestamp createTime = new Timestamp(System.currentTimeMillis());

				Integer orderPrice = new Integer(req.getParameter("orderPrice").trim());

				Integer orderStatus = new Integer(req.getParameter("orderStatus").trim());

				Integer paymentType = new Integer(req.getParameter("paymentType").trim());

				String address = req.getParameter("address");
				if (address == null || address.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}

				OrdersVO ordersVO = new OrdersVO();
				ordersVO.setOrderID(orderID);
				ordersVO.setMemID(memID);
				ordersVO.setCreateTime(createTime);
				ordersVO.setOrderPrice(orderPrice);
				ordersVO.setOrderStatus(orderStatus);
				ordersVO.setPaymentType(paymentType);
				ordersVO.setAddress(address);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("OrdersVO", ordersVO); // 含有輸入格式錯誤的OrdersVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/update_orders_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				OrdersService odrSvc = new OrdersService();
				ordersVO = odrSvc.updateOrder(orderID, memID, createTime, orderPrice, orderStatus, paymentType,
						address);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("ordersVO", ordersVO); // 資料庫update成功後,正確的的OrdersVO物件,存入req
				String url = "/views/order/listOneOrders.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneOrders.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/update_orders_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addOrders.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer memID = new Integer(req.getParameter("memID").trim());

				Integer orderPrice = new Integer(req.getParameter("orderPrice").trim());

				Integer orderStatus = new Integer(req.getParameter("orderStatus").trim());

				Integer paymentType = new Integer(req.getParameter("paymentType").trim());

				String address = req.getParameter("address");
				if (address == null || address.trim().length() == 0) {
					errorMsgs.add("地址請勿空白");
				}

				OrdersVO ordersVO = new OrdersVO();
				ordersVO.setMemID(memID);
				ordersVO.setOrderPrice(orderPrice);
				ordersVO.setOrderStatus(orderStatus);
				ordersVO.setPaymentType(paymentType);
				ordersVO.setAddress(address);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("ordersVO", ordersVO); // 含有輸入格式錯誤的OedersVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/addOrders.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				OrdersService odrSvc = new OrdersService();
				ordersVO = odrSvc.addOrder(memID, orderPrice, orderStatus, paymentType, address);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/views/order/listAllOrders.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllEmp.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/addOrders.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllOrders.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ***************************************/
				Integer orderID = new Integer(req.getParameter("orderID"));

				/*************************** 2.開始刪除資料 ***************************************/
				OrdersService odrSvc = new OrdersService();
				odrSvc.deleteOrder(orderID);

				/*************************** 3.刪除完成,準備轉交(Send the Success view) ***********/
				String url = "/views/order/listAllOrders.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/listAllOrders.jsp");
				failureView.forward(req, res);
			}
		}

//-------------------------------detail--------------------------------------------//

		if ("getDetail_By_Order".equals(action)) {

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer orderID = new Integer(req.getParameter("orderID"));

				/*************************** 2.開始查詢資料 ****************************************/
				OrdersService odrSvc = new OrdersService();

				Set<OrderDetailVO> orderDetailVO = odrSvc.getDetailByOrder(orderID);

				String jsonStr = new JSONArray(orderDetailVO).toString();
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("jsonStr", jsonStr); 

//				String url = "/views/order/listAllOrders.jsp";
//				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 listAllOrders.jsp
//				successView.forward(req, res);
				Gson gson = new Gson();

				res.setContentType("text/html; charset=UTF-8");

				res.getWriter().append(gson.toJson(jsonStr));

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/listAllOrders.jsp");
				failureView.forward(req, res);
			}
		}

	}

}
