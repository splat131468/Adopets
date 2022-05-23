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
    <title>我的最愛</title>
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
                  <a href="<%=request.getContextPath()%>/views/member/myFavorite.jsp" class="active">我的最愛</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp" class="">認養紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/donateLog.jsp" class="">捐款紀錄</a>
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
    <div class="theFind">
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox" data-="a">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/no25.jpg" alt="">
                        </div>
                        <p class="text-center mb-0">貓A</p>
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/小貓怪.png" alt="">
                        </div>
                        <p class="text-center mb-0">貓B</p>
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/大吳帥照.jpg" alt="">
                        </div>
                        <p class="text-center mb-0">貓C</p>
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/王彩樺.png" alt="">
                        </div>
                        <p class="text-center mb-0">貓D</p>
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>           
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/no25.jpg" alt="">
                        </div>
                        <p class="text-center mb-0">貓E</p>
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/大吳.jpg" alt="">
                        </div>
                        <p class="text-center mb-0">貓F</p>
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/小貓怪.png" alt="">
                        </div>
                        <p class="text-center mb-0">貓G</p>
                    </a>    
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
                <div class="col-sm-6 col-md-3 favoriteImg mt-4 cancelBox">
                    <a href="#">
                        <div class="favoriteImgDiv">
                            <img src="<%=request.getContextPath()%>/views/member/image/小貓怪.png" alt="">
                        </div>
                        <p class="text-center mb-0">貓H</p> 
                    </a>
                    <div class="d-flex justify-content-center mt-2">
                        <button class="btn btn-primary btn-sm btnPurple cancelBtn">
                            <i class="fa-solid fa-trash-can"></i>
                            取消追蹤
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="mask"></div>
    <div class="confirmBox pb-5">
        <p class="text-center mb-3 mt-5">確認要把我移除最愛嗎QQ</p>
        <div class="d-flex justify-content-center">
            <button class="btn btn-primary btnPurple cancelYes">確認</button>
            <button class="btn btn-primary-outline btnPurple-outline cancelNo">取消</button>
        </div>
    </div>
    <script src="<%=request.getContextPath()%>/views/member/js/address.js"></script>
  <script src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/views/member/js/memberTabBar.js"></script>
  <script src="<%=request.getContextPath()%>/views/member/js/myFavorite.js"></script>
  <script src="https://kit.fontawesome.com/0b51b0b08f.js" crossorigin="anonymous"></script>
  <script src="<%=request.getContextPath()%>/views/member/js/member.js"></script>
</body>
</html>