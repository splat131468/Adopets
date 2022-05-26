<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Document</title>
  <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/signIn.css" type="text/css"> 
</head>
<body>
  <div class="mask">  </div>
  <div class="login-box">
    <div class="close">
      <i class="fa fa-times" aria-hidden="true"></i>
    </div>
    <div class="lb-header">
      <p class="active" id="login-box-link">Adopet會員登入</p>
    </div>
    <form class="email-login" METHOD="post" action="<%=request.getContextPath()%>/views/signIn/signIn" >
      <div class="u-form-group">
        <input type="email" name="account" value="" placeholder="Email"/>
      </div>
      <div>
<!--         <p class="error" id="error_email">*輸入錯誤 請重新檢查</p> -->

        <!--  尚未完成帳號密碼檢查 -->
      
      </div>
      <div class="u-form-group">
        <input type="password" name="password" value="" placeholder="Password"/>
      </div>
      <div>
        <p class="error" id="error_password">*密碼不正確 你還記得密碼嗎?</p>
      </div>
      <div class="u-form-group">
        <button type="submit" value="Login">登入</button>
      </div>
      <div class="u-form-group">
        <a href="<%=request.getContextPath()%>/views/signIn/forgotPwd.jsp" class="forgot-password">忘記密碼?</a>
      </div>
    </form>
    <p class="text_align_center active">或使用以下登入</p>
    <div class="social-login">
      <a href="#">
        <i class="fa-brands fa-facebook-square"></i>
        Facebook登入
      </a>
      <a href="#">
        <i class="fa-brands fa-google"></i>
        Google登入
      </a>
    </div>
    <div>
      <p class="text_align_center active">還不是會員嗎?</p>
      <a href="<%=request.getContextPath()%>/views/signIn/register.jsp" class="merber_click">成為會員</a>
    </div>
  </div>
<!--   <button class="homepage">登入</button> -->
  <script href="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
  <script src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
  <script src="<%=request.getContextPath()%>/views/member/js/signIn.js">  </script>
  <script src="https://kit.fontawesome.com/0b51b0b08f.js" crossorigin="anonymous"></script>
</body>
</html>