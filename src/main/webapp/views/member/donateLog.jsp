<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>捐款紀錄</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/member.css">
</head>
<body>
    <div class="container">
        <div class="row mb-3 justify-content-center mt-5">
            <div class="col-8 themed-grid-col">
              <div class="row memberTabBar">
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/member.jsp" class="">會員資料</a>
                </div>
                <div class="col-2">
                  <a href="./myFavorite.jsp" class="">我的最愛</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp" class="">認養紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/donateLog.jsp" class="active">捐款紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/OrdersServlet?action=get_Member_Order" class="">訂單紀錄</a>
                </div>
                <div class="col-2">
                  <a href="#" class="">我想登出</a>
                </div>
              </div>
            </div>
        </div>
    </div>
    <div class="wrap mt-5">
        <table class="table align-middle">
            <thead>
              <tr>
                <th scope="col">No.</th>
                <th scope="col">捐款對象</th>
                <th scope="col">捐款方式</th>
                <th scope="col">金額</th>
                <th scope="col">捐款時間</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <th scope="row">1</th>
                <td>小貓怪</td>
                <td>信用卡</td>
                <td>100,000</td>
                <td>2022/03/08</td>
              </tr>
              <tr>
                <th scope="row">2</th>
                <td>David</td>
                <td>轉帳</td>
                <td>200,000</td>
                <td>2021/03/08</td>
              </tr>              
              <tr>
                <th scope="row">3</th>
                <td>Peter</td>
                <td>現金</td>
                <td>300,000</td>
                <td>2020/03/08</td>
              </tr>
              <tr>
                <th scope="row">4</th>
                <td>Nick</td>
                <td>信用卡</td>
                <td>400,000</td>
                <td>2023/03/08</td>
              </tr>
            </tbody>
          </table>
          <p class="text-end">共<span class="donateCount"></span>筆資料</p>
          <!-- 這裡還要寫SPAN標籤內的數字 -->
    </div>
    <script src="<%=request.getContextPath()%>/views/member/js/address.js"></script>
    <script src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/member/js/memberTabBar.js"></script>
    <script src="<%=request.getContextPath()%>/views/member/js/member.js"></script>
</body>
</html>