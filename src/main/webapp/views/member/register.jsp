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
<title>註冊會員</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/views/member/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/register.css">
</head>

<body>

	
	<div class="register">
		<!-- 背景CSS須等結合大家的版面後才能調整完成 -->
		<div class="container">
			<div class="row mb-3 justify-content-center mt-5">
				<div class="col-4 themed-grid-col">
				<%-- 錯誤表列 --%>
					<c:if test="${not empty errorMsgs}">
						<ul>
							<c:forEach var="message" items="${errorMsgs}">
								<li style="color:red">${message}</li>
							</c:forEach>
						</ul>
					</c:if>
					<form class="row g-3" METHOD="post" ACTION="<%=request.getContextPath()%>/member/member">
						<div class="col-12">
							<label for="inputEmail" class="form-label">帳號</label> 
							<input	type="email" class="form-control" id="inputEmail" name="inputEmail" placeholder="Email">
						</div>
						<div class="col-12">
							<label for="inputPassword" class="form-label">密碼</label> <input
								type="password" class="form-control" id="inputPassword" name="inputPassword"
								placeholder="Password">
						</div>
						<div class="col-12">
							<label for="" class="form-label">確認密碼</label> <input
								type="password" class="form-control" id="confirmPassword" name="confirmPassword"
								placeholder="請再輸入一次密碼">
						</div>
						<div class="col-12">
							<label for="" class="form-label">姓名</label> <input type="text"
								class="form-control" id="inputName" name="inputName" placeholder="請輸入姓名">
						</div>
						<div class="col-12 position">
							<button type="submit" class="btn btn-primary btnPurple"
								name="action" value="insertMember">完成註冊</button>
						</div>
					</form>

				</div>
			</div>
		</div>
	</div>
</body>

</html>