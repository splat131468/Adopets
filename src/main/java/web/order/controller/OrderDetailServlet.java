package web.order.controller;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import web.order.entity.OrderDetailVO;
import web.order.service.OrderDetailService;



@WebServlet("/OrderDetailServlet")
public class OrderDetailServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
	
		if ("getOne_For_Display".equals(action)) { // 來自OrderDetail.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				String str = req.getParameter("orderDetailID");
				if (str == null || (str.trim()).length() == 0) {
					errorMsgs.add("請輸入訂單明細編號");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/OrderDetail.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				Integer orderDetailID = null;
				try {
					orderDetailID = new Integer(str);
				} catch (Exception e) {
					errorMsgs.add("訂單明細編號格式不正確");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/OrderDetail.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 2.開始查詢資料 *****************************************/
				OrderDetailService odrdtlSvc = new OrderDetailService();
				OrderDetailVO orderDetailVO = odrdtlSvc.findPrimaryKeyOrderDetail(orderDetailID);
			
				if (orderDetailVO == null) {
					errorMsgs.add("查無資料");
				}
				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/OrderDetail.jsp");
					failureView.forward(req, res);
					return;// 程式中斷
				}

				/*************************** 3.查詢完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orderDetailVO", orderDetailVO); // 資料庫取出的OrderDetailVO物件,存入req
				String url = "/views/order/listOneOrderDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 成功轉交 listOneOrderDetail.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/OrderDetail.jsp");
				failureView.forward(req, res);
			}
		}

		if ("getOne_For_Update".equals(action)) { // 來自listAllOrderDetail.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer orderDetailID = new Integer(req.getParameter("orderDetailID"));
				
				

				/*************************** 2.開始查詢資料 ****************************************/
				OrderDetailService odrdtlSvc = new OrderDetailService();
				OrderDetailVO orderDetailVO = odrdtlSvc.findPrimaryKeyOrderDetail(orderDetailID);
				
				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("orderDetailVO", orderDetailVO); // 資料庫取出的OrderDetailVO物件,存入req
				String url = "/views/order/update_orderDetail_input.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 成功轉交 update_orderDetail_input.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/listAllOrderDetail.jsp");
				failureView.forward(req, res);
			}
		}
		
		if ("update".equals(action)) { // 來自update_orderDetail_input.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 - 輸入格式的錯誤處理 **********************/
				Integer orderDetailID = new Integer(req.getParameter("orderDetailID").trim());
			
				Integer orderID = new Integer(req.getParameter("orderID").trim());
			
				Integer skuID = new Integer(req.getParameter("skuID").trim());
				
				String prodName = new String(req.getParameter("prodName").trim());
				if (prodName == null || prodName.trim().length() == 0) {
					errorMsgs.add("產品名稱請勿空白");
				}
				Integer prodNum = new Integer(req.getParameter("prodNum").trim());
			
				Integer prodPrice = new Integer(req.getParameter("prodPrice").trim());

				OrderDetailVO orderDetailVO = new OrderDetailVO();
				orderDetailVO.setOrderDetailID(orderDetailID);
				orderDetailVO.setOrderID(orderID);
				orderDetailVO.setSkuID(skuID);
				orderDetailVO.setProdName(prodName);
				orderDetailVO.setProdNum(prodNum);
				orderDetailVO.setProdPrice(prodPrice);
				

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orderDetailVO", orderDetailVO); // 含有輸入格式錯誤的OrderDetailVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/update_orderDetail_input.jsp");
					failureView.forward(req, res);
					return; // 程式中斷
				}

				/*************************** 2.開始修改資料 *****************************************/
				OrderDetailService odrdtlSvc = new OrderDetailService();
				orderDetailVO = odrdtlSvc.updateOrderDetail(orderDetailID, orderID, skuID, prodName, prodNum, prodPrice);

				/*************************** 3.修改完成,準備轉交(Send the Success view) *************/
				req.setAttribute("orderDetailVO", orderDetailVO); // 資料庫update成功後,正確的的orderDetailVO物件,存入req
				String url = "/views/order/listOneOrderDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 修改成功後,轉交listOneOrderDetail.jsp
				successView.forward(req, res);
			
				/*************************** 其他可能的錯誤處理 *************************************/
			} catch (Exception e) {
				errorMsgs.add("修改資料失敗:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/update_orderDetail_input.jsp");
				failureView.forward(req, res);
			}
		}

		if ("insert".equals(action)) { // 來自addOrderDetail.jsp的請求

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*********************** 1.接收請求參數 - 輸入格式的錯誤處理 *************************/

				Integer orderID = new Integer(req.getParameter("orderID").trim());
				
				Integer skuID = new Integer(req.getParameter("skuID").trim());
				
				String prodName = new String(req.getParameter("prodName").trim());
				if (prodName == null || prodName.trim().length() == 0) {
					errorMsgs.add("產品名稱請勿空白");
				}
				Integer prodNum = new Integer(req.getParameter("prodNum").trim());
			
				Integer prodPrice = new Integer(req.getParameter("prodPrice").trim());

				OrderDetailVO orderDetailVO = new OrderDetailVO();
				orderDetailVO.setOrderID(orderID);
				orderDetailVO.setSkuID(skuID);
				orderDetailVO.setProdName(prodName);
				orderDetailVO.setProdNum(prodNum);
				orderDetailVO.setProdPrice(prodPrice);

				// Send the use back to the form, if there were errors
				if (!errorMsgs.isEmpty()) {
					req.setAttribute("orderDetailVO", orderDetailVO); // 含有輸入格式錯誤的orderDetailVO物件,也存入req
					RequestDispatcher failureView = req.getRequestDispatcher("/views/order/addOrderDetail.jsp");
					failureView.forward(req, res);
					return;
				}

				/*************************** 2.開始新增資料 ***************************************/
				OrderDetailService odrdtlSvc = new OrderDetailService();
				orderDetailVO = odrdtlSvc.addOrderDetail(orderID, skuID, prodName, prodNum, prodPrice);

				/*************************** 3.新增完成,準備轉交(Send the Success view) ***********/
				String url = "/views/order/listAllOrderDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url); // 新增成功後轉交listAllDetail.jsp
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add(e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/order/addOrderDetail.jsp");
				failureView.forward(req, res);
			}
		}

		if ("delete".equals(action)) { // 來自listAllOrderDetail.jsp

			List<String> errorMsgs = new LinkedList<String>();
			// Store this set in the request scope, in case we need to
			// send the ErrorPage view.
			req.setAttribute("errorMsgs", errorMsgs);
	
			try {
				/***************************1.接收請求參數***************************************/
				Integer orderDetailID = new Integer(req.getParameter("orderDetailID"));
				
				/***************************2.開始刪除資料***************************************/
				OrderDetailService odrdtlSvc = new OrderDetailService();
				odrdtlSvc.deleteOrderDetail(orderDetailID);
				
				/***************************3.刪除完成,準備轉交(Send the Success view)***********/								
				String url = "/views/order/listAllOrderDetail.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);// 刪除成功後,轉交回送出刪除的來源網頁
				successView.forward(req, res);
				
				/***************************其他可能的錯誤處理**********************************/
			} catch (Exception e) {
				errorMsgs.add("刪除資料失敗:"+e.getMessage());
				RequestDispatcher failureView = req
						.getRequestDispatcher("/views/order/listAllOrderDetail.jsp");
				failureView.forward(req, res);
			}
		}
	}

}
