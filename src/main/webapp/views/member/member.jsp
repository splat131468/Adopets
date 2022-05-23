<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.entity.MemberVO"%>
<%
//   MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //Servlet.java (Concroller) 存入request的memberVO物件 (包括幫忙取出的VO, 也包括輸入資料錯誤時的VO物件)
//  HttpSession session = request.getSession();
 MemberVO memberVO = (MemberVO)session.getAttribute("memberVO");
 
%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>member_main</title>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/views/member/css/bootstrap.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/views/member/css/member.css">
</head>

<body>
	<div class="container">
		<!--我的會員欄位!-->
		<div class="row mb-3 justify-content-center mt-5">
			<div class="col-8 themed-grid-col">
				<div class="row memberTabBar">
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/member.jsp" class="active">會員資料</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/myFavorite.jsp" class="">我的最愛</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp" class="">認養紀錄</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/donateLog.jsp" class="">捐款紀錄</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/OrdersServlet?action=get_Member_Order" class="">訂單紀錄</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="#" class="">我想登出</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="wrap mt-5">
		<div class="container">
			<%-- 錯誤表列 --%>
			<c:if test="${not empty errorMsgs}">
				<ul>
					<c:forEach var="message" items="${errorMsgs}">
						<li style="color: red">${message}</li>
					</c:forEach>
				</ul>
			</c:if>
			<form action="<%=request.getContextPath()%>/member/member"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="action" value="updateMember">
				<div class="row">
					<div class="col-3">
						<div class="userImg mb-4" id="preview">
							<img
								src="<%=request.getContextPath()%>/views/member/image/user.png"
								alt="">
						</div>
						<label class="btn btnFile"> <span>修改圖片</span> <input
							class="form-control " type="file" id="p_file" name="p_file">
						</label>
					</div>
					<div class="col-9">
				
						<div class="mb-3 row">
							<label for="staticEmail" class="col-sm-2 col-form-label text-end">帳號</label>
							<div class="col-sm-10">
								<input type="text" disabled class="form-control-plaintext"
									id="inputEmail" name="inputEmail" value="<%=memberVO.getAccount()%>">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="inputPassword"
								class="col-sm-2 col-form-label text-end">密碼</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputPassword"
									name="inputPassword" value="<%=memberVO.getPassword()%>">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="" class="col-sm-2 col-form-label text-end">姓名</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputName"
									name="inputName" value="<%=memberVO.getName()%>">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="" class="col-sm-2 col-form-label text-end">手機</label>
							<div class="col-sm-10">
								<input type="number" class="form-control" id="inputPhone"
									name="inputPhone">
							</div>
						</div>
						<div class="mb-3 row">
							<label for="" class="col-sm-2 col-form-label text-end">年齡</label>
							<div class="col-sm-10">
								<select class="form-select" aria-label="Default select example"
									id="inputAge" name="inputAge">
									<option selected>請選擇</option>
									<option value="20歲以下">20歲以下</option>
									<option value="20歲~40歲">20歲~40歲</option>
									<option value="40歲~60歲">40歲~60歲</option>
									<option value="60歲以上">60歲以上</option>
								</select>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="" class="col-sm-2 col-form-label text-end">地址</label>
							<div class="col-sm-10">
								<div class="row">
									<div class="twzipcode"></div>
								</div>
								<div class="row mt-2">
									<div class="addressbox">
										<input class="form-control" type="text" id="inputAddress"
											name="inputAddress">
									</div>
								</div>
							</div>
						</div>
						<div class="mb-3 row">
							<label for="" class="col-sm-2 col-form-label text-end">信用卡</label>
							<div class="col-sm-10">
								<div class="creditCardList">
									<input type="text" disabled class="form-control-plaintext"
										id="" value="**** **** **** 1234">
										<span class="form-control-plaintext">${param.creditCard}</span>
<!-- 									<button -->
<!-- 										class="btn btn-outline-primary btn-sm btnPurple-outline">刪除信用卡</button> -->
									<!--to do list 範例修改  -->
								</div>
								<div class="">
									<a href="<%=request.getContextPath()%>/views/member/creditCard.jsp"
										class="btn btn-primary btn-sm btnPurple">新增信用卡</a>
								</div>
							</div>
						</div>
						<div class="mb-3 row">
							<div class="d-flex justify-content-end">
								<button type="submit" class="btn btn-primary btnPurple"
									name="action" value="updateMember">儲存</button>
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/views/member/js/address.js"></script>
	<script
		src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/member/js/member.js"></script>
	<script
		src="<%=request.getContextPath()%>/views/member/js/memberTabBar.js"></script>
</body>

</html>