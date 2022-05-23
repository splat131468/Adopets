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
    <title>忘記密碼</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/register.css">
</head>
<body>
    <div class="mask"></div>
    <div class="register">
        <!-- 背景CSS須等結合大家的版面後才能調整完成 -->
            <div class="container">
                <div class="row mb-3 justify-content-center mt-5">
                    <div class="col-4 themed-grid-col">
                        <form class="row g-3" METHOD="post" action="<%=request.getContextPath()%>/MemberForgotPwdServlet">
                            <div class="col-12">
                              <label for="inputEmail" class="form-label">註冊帳號</label>
                              <label style="color: red">${errors.nonexistent}</label>
                              <input type="email" class="form-control" id="inputEmail" name="email" placeholder="Email">
                            </div>
                            <div class="col-12 position">
                              <div class="btn btn-primary btnPurple">送出</div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
    </div>
    <div class="forgotPwd">
        <p>新密碼已寄至您的信箱,請重新登入</p>
        <a href="" class="btn btn-primary btnPurple">OK</a>
        <!-- a標籤連結到首頁 -->
    </div>
<script src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
<script src="https://kit.fontawesome.com/0b51b0b08f.js" crossorigin="anonymous"></script>
<script src="<%=request.getContextPath()%>/views/member/js/forgotPwd.js"></script>
</body>
</html>