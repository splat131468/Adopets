package web.chatroom.controller;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.mysql.cj.Session;

import web.catInfo.entity.CatAndShelVO;
import web.catInfo.entity.CatInfoVO;
import web.catInfo.service.CatInfoService;
import web.order.entity.OrdersVO;
import web.order.service.OrdersService;

@WebServlet("/ChatServlet")
public class ChatController extends HttpServlet{
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		req.setCharacterEncoding("UTF-8");
		String action = req.getParameter("action");
		CatInfoService catInfoService = new CatInfoService();
		
//--------------------------------後端聊天室-----------------------------------------------------------//
		if ("getCatback".equals(action)) {
			
			Integer catID = null;
			String str = req.getParameter("catID");
			catID = Integer.valueOf(req.getParameter("catID"));
			System.out.println("catID:" + catID);
			CatAndShelVO catAndShelVO = catInfoService.getOneAndShel(catID);
			req.setAttribute("catAndShelVO", catAndShelVO); 
			String url = "/views/chatroom/backgroudChatroom2.jsp";
			RequestDispatcher successView = req.getRequestDispatcher(url); 
			successView.forward(req, res);
		}
//--------------------------------後端聊天室-----------------------------------------------------------//
		if ("getAll".equals(action)) { 

			List<String> errorMsgs = new LinkedList<String>();
			req.setAttribute("errorMsgs", errorMsgs);

			try {
				/*************************** 1.接收請求參數 ****************************************/
				Integer catID = new Integer(req.getParameter("catID"));

				/*************************** 2.開始查詢資料 ****************************************/
				CatInfoService catSvc = new CatInfoService();

				CatInfoVO catInfoVO = catSvc.getOne(catID);

				/*************************** 3.查詢完成,準備轉交(Send the Success view) ************/
				req.setAttribute("catInfoVO", catInfoVO); 
				String url = "/views/chatroom/backgroudChatroom.jsp";
				RequestDispatcher successView = req.getRequestDispatcher(url);
				successView.forward(req, res);

				/*************************** 其他可能的錯誤處理 **********************************/
			} catch (Exception e) {
				errorMsgs.add("無法取得要修改的資料:" + e.getMessage());
				RequestDispatcher failureView = req.getRequestDispatcher("/views/chatroom/backgroudChatroom.jsp");
				failureView.forward(req, res);
			}
		}
	}
}
