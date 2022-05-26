package web.catInfo.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.IOUtils;
import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonObject;

import redis.clients.jedis.Jedis;
import redis.clients.jedis.JedisPool;
import web.catInfo.dao.impl.CatInfoRedisimpl;
import web.catInfo.util.JedisUtil;
import web.member.entity.MemberVO;


@WebServlet("/Favorite")
public class Favorite extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doPost(req, res);
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		res.setContentType("text/html; charset=UTF-8");
		
		JedisPool jedisPool = JedisUtil.getJedisPool();
		Integer memID = null;
		MemberVO memberVO  = null;
		try {
			
			memberVO = (MemberVO) req.getSession().getAttribute("memberVO");
		}catch (Exception e) {

		}
		memID = memberVO.getMemID();
		PrintWriter out = res.getWriter();
		String action = req.getParameter("action");
//		System.out.println(action);
		//找到某個 memID 的 favorite cat list
		if("getRedis".equals(action)) {
//			System.out.println(action);
			Jedis jedis = jedisPool.getResource();
//			String memID = req.getParameter("key");
			System.out.println(memID);
			List<String> catList = jedis.lrange("member:" + memID + ":favorite", 0, -1);
			
//			System.out.println(catList);
			out.println(catList);
			jedis.close();
		}
		
		
		//新增/移除某個memID的cat list
		if("addRedis".equals(action)){
			Jedis jedis = jedisPool.getResource();
	
			String catID = req.getParameter("catID");
			if (jedis.lrem("member:" + memID + ":favorite",1,catID) == 0) {
				System.out.println("this is catID =" + catID);
				new CatInfoRedisimpl().jedisAdd(memID, Integer.parseInt(catID));				
			}
			
			List<String> catList1 = jedis.lrange("member:" + memID + ":favorite", 0, -1);
	 		String str = jedis.lindex("member:" + memID + ":favorite",0);
//			List<String> catList2 = jedis.lrange("member:2:favorite", 0, -1);
			out.println(catList1);
			
//			System.out.println(str);
//			String jArrayStr1 = new JSONArray(catList1).toString();
//			String jArrayStr2 = new JSONArray(catList2).toString();
//			System.out.println(jArrayStr1);
//			System.out.println(jArrayStr2);
			jedis.close();
		}
		//這是給列出我的最愛用的
		if("getRedisListFav".equals(action)) {
			Jedis jedis = jedisPool.getResource();
			
			try {
				List<String> catList = jedis.lrange("member:" + memID + ":favorite", 0, -1);
				System.out.println("cat List in favorite = " + catList.size());
				req.setAttribute("catList", catList);
				
			}
			catch (Exception e) {
			}
			
//			System.out.println(action);
//		
			//現在redis取得會員的favorite list
			//再F/w到catInfoServlet做查詢
//			System.out.println(catList);
			req.getRequestDispatcher("/CatInfoServlet").forward(req, res);
//			out.println(catList);
			jedis.close();
		}
//		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);
//		JedisUtil.shutdownJedisPool();
//		Gson gson=new Gson();
//		String data = IOUtils.toString(req.getInputStream(), StandardCharsets.UTF_8);
//		  JsonObject fromJson = gson.fromJson(data, JsonObject.class);
//		BufferedReader br = 
//				new BufferedReader(new InputStreamReader(req.getInputStream()));
//		JSONObject jsonObj = new JSONObject(req.getInputStream());
//		try {
//			String favorite = fromJson.get("member:1:favorite").getAsString();
//			System.out.println(favorite);
//			System.out.println(jsonObj.getString("member:1:favorite"));
// 		}catch (Exception e) {
//			System.out.println("error");
//		}
		
//		out.print(123);
	
	
	}

}
