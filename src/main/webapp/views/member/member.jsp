<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="web.member.entity.MemberVO"%>
<%
//   MemberVO memberVO = (MemberVO) request.getAttribute("memberVO"); //Servlet.java (Concroller) 存入request的memberVO物件 (包括幫忙取出的VO, 也包括輸入資料錯誤時的VO物件)
//  HttpSession session = request.getSession();
MemberVO memberVO = (MemberVO) session.getAttribute("memberVO");
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
<!-- index -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/catInfo/files/homepage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/catInfo/files/css_L5nWqD5SQK8ZrCIRrm01g1QcB7QmIYINuJjhTPq7WFs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/catInfo/files/css_48il_hUScvaXu5Lky-fqRm9LjbUTybcek-Dq368IMAI.css">

</head>

<body>

	<div class="container">

		<!-- 	header開始 -->
		<!-- 阿德header -->
		<div class="region region-navigation">
			<div class="region--inner">
				<div class="main-navigation">
					<!--這裡是logo-->
					<div iclass="logo">
						<a href="#" rel="home" class="site-logo"> <img
							src="${pageContext.request.contextPath}/views/catInfo/img/Adopets.svg"
							alt="Home">
						</a>
					</div>
					<nav role="navigation"
						aria-labelledby="block-consumer-react-main-menu-menu"
						id="block-consumer-react-main-menu"
						class="block block-menu navigation menu--main">
						<h2 class="visually-hidden"
							id="block-consumer-react-main-menu-menu">Main navigation</h2>
						<ul class="menu menu-level-0">

							<li class="menu-item menu-item--expanded">
								<button aria-expanded="false" type="button"></button>
								<div class="menu-inner menu-level-1">
									<ul class="menu">
									</ul>
								</div>
							</li>
							<li class="menu-item menu-item--expanded">
								<button class="active" aria-expanded="true" type="button"></button>
								<div class="menu-inner menu-level-1">
									<ul class="menu">
										<!--關於我們-->
										<li class="menu-item menu-item--expanded"><a href="#">關於我們</a>

											<button
												class="visually-hidden-unless-focused hidden-btn open-sub-menu"
												role="button" aria-haspopup="true" aria-expanded="false"
												aria-label="About Pet Adoption">Open Submenu</button>
											<ul class="menu menu-level-2">

												<li class="menu-item"><a href="#">網站願景</a></li>
											</ul></li>
										<!--貓咪照顧-->
										<li class="menu-item menu-item--expanded"><a href="#">貓咪照顧</a>
											<button
												class="visually-hidden-unless-focused hidden-btn open-sub-menu"
												role="button" aria-haspopup="true" aria-expanded="false"
												aria-label="Dog Care">Open Submenu</button>
											<ul class="menu menu-level-2">
												<li class="menu-item"><a href="#">如何照顧貓咪</a></li>
											</ul></li>
										<!--收容中心-->
										<li class="menu-item menu-item--expanded"><a href="#"
											data-eventtype="EVENT TYPE" data-category="global-nav"
											data-action="cat-care">收容中心</a>
											<button
												class="visually-hidden-unless-focused hidden-btn open-sub-menu"
												role="button" aria-haspopup="true" aria-expanded="false"
												aria-label="Cat Care">Open Submenu</button>
											<ul class="menu menu-level-2">

												<li class="menu-item"><a href="">收容所資訊</a></li>


											</ul></li>
										<!--幫助貓咪-->
										<li class="menu-item menu-item--expanded"><a href="#">捐款</a>

											<button
												class="visually-hidden-unless-focused hidden-btn open-sub-menu"
												role="button" aria-haspopup="true" aria-expanded="false"
												aria-label="All Pet Care">Open Submenu</button>


											<ul class="menu menu-level-2">

												<li class="menu-item"><a href="#">捐款</a></li>


											</ul></li>
										<!--購物/二手商城-->
										<li class="menu-item menu-item--expanded"><a
											href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物商城</a>

											<button
												class="visually-hidden-unless-focused hidden-btn open-sub-menu"
												role="button" aria-haspopup="true" aria-expanded="false"
												aria-label="Shelters &amp; Rescues">Open Submenu</button>


											<ul class="menu menu-level-2">

												<li class="menu-item"><a
													href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物商城</a></li>


											</ul></li>
										<!--會員資料-->
										<li class="menu-item menu-item--expanded"><a
											href="${pageContext.request.contextPath}/views/member/member.jsp">會員資料</a>
											<ul class="menu menu-level-2">
												<li class="menu-item"><a
													href="${pageContext.request.contextPath}/views/member/member.jsp">會員中心</a></li>
											</ul></li>
										<!--開發團隊-->
										<li class="menu-item"><a href="#">開發團隊</a></li>
									</ul>
								</div>
							</li>
						</ul>
					</nav>


				</div>
				<!--我的最愛+購物車+登入+登出-->
				<div class="profile-navigation">
					<!--我的最愛-->
					<a href="#" class="nav-favorites-btn"> <svg role="img"
							focusable="false">
          <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-favorite"></use>
        </svg> <span class="visually-hidden">Favorites</span>
					</a>
					<!--購物車-->
					<a
						href="${pageContext.request.contextPath}/shCartAction?action=getCart"
						class="nav-favorites-btn nav-cart-btn"> <svg role="img"
							focusable="false">
          <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-cart"></use>
        </svg> <span class="visually-hidden">Favorites</span>
					</a>
					<button type="button" id="resources-btn" class="nav-resources-btn">
						<svg role="img" focusable="false">
          <use xmlns:xlink="http://www.w3.org/1999/xlink"
								xlink:href="#icon-menu"></use>
        </svg>
						<span class="visually-hidden">Resources</span>
					</button>


					<div class="header-inner-profile__container">
						<ul class="header-inner-profile">
							<li><a href="#" class="header-inner-profile-btn">註冊</a></li>
							<li><a href="#" class="header-inner-profile-btn">登入</a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>

		<div id="the_btn">btn buttom</div>


		<div id="Svg_Defs" class="u-isHidden hidden">
			<svg>
  <symbol id="icon-favorite" viewBox="0 0 31.98 26.87">
    <title>icon-favorite</title>
    <path
					d="M29.49,2.59a8.31,8.31,0,0,0-12.06,0,8.78,8.78,0,0,0-1.43,2,8.83,8.83,0,0,0-1.43-2,8.31,8.31,0,0,0-12.06,0,9.09,9.09,0,0,0,0,12.52l9.81,10.18a5.09,5.09,0,0,0,7.36,0l9.81-10.18A9.09,9.09,0,0,0,29.49,2.59Z">
    </path>
  </symbol>

  <symbol id="icon-cart" viewBox="0 0 50 50">
    <path
					d="M43.9167 14.5833C43.5567 13.9596 43.0412 13.4399 42.4205 13.0747C41.7998 12.7096 41.0951 12.5116 40.375 12.5H13.7084L12.5 7.79167C12.3779 7.33716 12.1056 6.93738 11.7273 6.65744C11.349 6.3775 10.887 6.23389 10.4167 6.25H6.25002C5.69749 6.25 5.16758 6.46949 4.77688 6.8602C4.38618 7.2509 4.16669 7.7808 4.16669 8.33333C4.16669 8.88587 4.38618 9.41577 4.77688 9.80647C5.16758 10.1972 5.69749 10.4167 6.25002 10.4167H8.83335L14.5834 31.7917C14.7054 32.2462 14.9778 32.6459 15.3561 32.9259C15.7344 33.2058 16.1963 33.3494 16.6667 33.3333H35.4167C35.8014 33.3322 36.1783 33.2245 36.5056 33.0222C36.8328 32.82 37.0977 32.5311 37.2709 32.1875L44.1042 18.5208C44.4004 17.9 44.5382 17.2156 44.5055 16.5285C44.4728 15.8415 44.2705 15.1732 43.9167 14.5833Z" />
    <path
					d="M15.625 43.75C17.3509 43.75 18.75 42.3509 18.75 40.625C18.75 38.8991 17.3509 37.5 15.625 37.5C13.8991 37.5 12.5 38.8991 12.5 40.625C12.5 42.3509 13.8991 43.75 15.625 43.75Z" />
    <path
					d="M36.4583 43.75C38.1842 43.75 39.5833 42.3509 39.5833 40.625C39.5833 38.8991 38.1842 37.5 36.4583 37.5C34.7324 37.5 33.3333 38.8991 33.3333 40.625C33.3333 42.3509 34.7324 43.75 36.4583 43.75Z" />

  </symbol>

</svg>
		</div>
		<!-- 	header結束 -->

		<!--我的會員欄位!-->
		<div class="row mb-3 justify-content-center mt-5">
			<div class="col-8 themed-grid-col">
				<div class="row memberTabBar">
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/member.jsp"
							class="active">會員資料</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a
							href="${pageContext.request.contextPath}/views/catInfo/My_favorite.jsp"
							class="">我的最愛</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp"
							class="">認養紀錄</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="<%=request.getContextPath()%>/views/member/donateLog.jsp"
							class="">捐款紀錄</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a
							href="<%=request.getContextPath()%>/OrdersServlet?action=get_Member_Order"
							class="">訂單紀錄</a>
					</div>
					<div class="col-md-2 col-sm-4">
						<a href="${pageContext.request.contextPath}/views/catInfo/My_home.jsp" class="">我想登出</a>
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
									id="inputEmail" name="inputEmail"
									value="<%=memberVO.getAccount()%>">
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
										id="" value="**** **** **** 1234"> <span
										class="form-control-plaintext">${param.creditCard}</span>
									<!-- 									<button -->
									<!-- 										class="btn btn-outline-primary btn-sm btnPurple-outline">刪除信用卡</button> -->
									<!--to do list 範例修改  -->
								</div>
								<div class="">
									<a
										href="<%=request.getContextPath()%>/views/member/creditCard.jsp"
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
	<!-- Footer Section Begin -->

	<div>
		<div id="Site" class="site js-LockPageScroll-site" aria-hidden="false">
			<!--這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer-->
			<footer class="site-footer" role="contentinfo">
				<div style="background-color: #410078;" class="footer">
					<div class="footer-inner">
						<a
							href="${pageContext.request.contextPath}/views/catInfo/My_home.jsp"
							class="footer-inner-logo"> <svg id="logo-consumer"
								width="132" height="48" viewBox="0 0 132 48" fill="white"
								xmlns="http://www.w3.org/2000/svg">
                                        <path
									d="M11.0489 17.376L8.71288 26.56C8.69154 26.624 8.70221 26.688 8.74487 26.752C8.80888 26.7947 8.87288 26.816 8.93688 26.816H13.2249C13.2889 26.816 13.3422 26.7947 13.3849 26.752C13.4489 26.688 13.4702 26.624 13.4489 26.56L11.1129 17.376C11.1129 17.3547 11.1022 17.344 11.0809 17.344C11.0595 17.344 11.0489 17.3547 11.0489 17.376ZM2.50488 36C2.05688 36 1.69421 35.8187 1.41688 35.456C1.16088 35.0933 1.10754 34.6987 1.25688 34.272L7.72088 14.368C7.89154 13.856 8.19021 13.44 8.61688 13.12C9.06488 12.8 9.55554 12.64 10.0889 12.64H12.2009C12.7555 12.64 13.2569 12.8 13.7049 13.12C14.1529 13.44 14.4515 13.856 14.6009 14.368L21.0329 34.272C21.1822 34.6987 21.1182 35.0933 20.8409 35.456C20.5849 35.8187 20.2329 36 19.7849 36H17.6409C17.1075 36 16.6275 35.84 16.2009 35.52C15.7742 35.1787 15.4969 34.752 15.3689 34.24L14.6009 31.2C14.5795 31.0293 14.4729 30.944 14.2809 30.944H7.88088C7.71021 30.944 7.60354 31.0293 7.56088 31.2L6.79288 34.24C6.66488 34.752 6.38754 35.1787 5.96088 35.52C5.53421 35.84 5.05421 36 4.52087 36H2.50488ZM30.6424 22.88C28.509 22.88 27.4424 24.48 27.4424 27.68C27.4424 29.3013 27.7304 30.5067 28.3064 31.296C28.8824 32.0853 29.661 32.48 30.6424 32.48C31.4957 32.48 32.2424 32.192 32.8824 31.616C33.5224 31.04 33.8424 30.3893 33.8424 29.664V25.696C33.8424 24.9707 33.5224 24.32 32.8824 23.744C32.2424 23.168 31.4957 22.88 30.6424 22.88ZM28.8824 36.32C26.9837 36.32 25.4264 35.5627 24.2104 34.048C22.9944 32.512 22.3864 30.3893 22.3864 27.68C22.3864 24.9067 22.973 22.7733 24.1464 21.28C25.3197 19.7867 26.8984 19.04 28.8824 19.04C30.6317 19.04 32.221 19.6907 33.6504 20.992C33.6717 21.0133 33.693 21.024 33.7144 21.024C33.7357 21.024 33.7464 21.0133 33.7464 20.992V13.824C33.7464 13.3333 33.917 12.9067 34.2584 12.544C34.621 12.1813 35.0477 12 35.5384 12H37.1064C37.597 12 38.013 12.1813 38.3544 12.544C38.717 12.9067 38.8984 13.3333 38.8984 13.824V34.176C38.8984 34.6667 38.717 35.0933 38.3544 35.456C38.013 35.8187 37.597 36 37.1064 36H35.8904C35.3784 36 34.941 35.8293 34.5784 35.488C34.237 35.1253 34.0557 34.688 34.0344 34.176V33.92C34.0344 33.8987 34.0237 33.888 34.0024 33.888L33.9384 33.952C32.5944 35.5307 30.909 36.32 28.8824 36.32ZM52.9159 23.84C52.4039 23.0507 51.6145 22.656 50.5479 22.656C49.4812 22.656 48.6812 23.0507 48.1479 23.84C47.6359 24.6293 47.3799 25.9093 47.3799 27.68C47.3799 29.4507 47.6359 30.7307 48.1479 31.52C48.6812 32.3093 49.4812 32.704 50.5479 32.704C51.6145 32.704 52.4039 32.3093 52.9159 31.52C53.4492 30.7307 53.7159 29.4507 53.7159 27.68C53.7159 25.9093 53.4492 24.6293 52.9159 23.84ZM56.7239 34.048C55.2519 35.5627 53.1932 36.32 50.5479 36.32C47.9025 36.32 45.8439 35.5627 44.3719 34.048C42.8999 32.5333 42.1639 30.4107 42.1639 27.68C42.1639 24.9493 42.8999 22.8267 44.3719 21.312C45.8439 19.7973 47.9025 19.04 50.5479 19.04C53.1932 19.04 55.2519 19.7973 56.7239 21.312C58.1959 22.8267 58.9319 24.9493 58.9319 27.68C58.9319 30.4107 58.1959 32.5333 56.7239 34.048ZM67.0899 25.696V29.664C67.0899 30.368 67.4099 31.0187 68.0499 31.616C68.7112 32.192 69.4579 32.48 70.2899 32.48C71.2712 32.48 72.0499 32.0853 72.6259 31.296C73.2019 30.4853 73.4899 29.28 73.4899 27.68C73.4899 24.48 72.4232 22.88 70.2899 22.88C69.4579 22.88 68.7112 23.1787 68.0499 23.776C67.4099 24.352 67.0899 24.992 67.0899 25.696ZM63.8579 43.04C63.3672 43.04 62.9405 42.8587 62.5779 42.496C62.2152 42.1333 62.0339 41.7067 62.0339 41.216V21.184C62.0339 20.6933 62.2152 20.2667 62.5779 19.904C62.9405 19.5413 63.3672 19.36 63.8579 19.36H65.1379C65.6499 19.36 66.0872 19.5413 66.4499 19.904C66.8125 20.2453 67.0045 20.672 67.0259 21.184V21.44C67.0259 21.4613 67.0365 21.472 67.0579 21.472L67.1219 21.408C68.4872 19.8293 70.1299 19.04 72.0499 19.04C74.0339 19.04 75.6125 19.7867 76.7859 21.28C77.9805 22.7733 78.5779 24.9067 78.5779 27.68C78.5779 30.368 77.9592 32.48 76.7219 34.016C75.5059 35.552 73.9485 36.32 72.0499 36.32C70.2792 36.32 68.7005 35.6693 67.3139 34.368C67.2925 34.3467 67.2712 34.336 67.2499 34.336C67.2285 34.336 67.2179 34.3467 67.2179 34.368V41.216C67.2179 41.7067 67.0365 42.1333 66.6739 42.496C66.3112 42.8587 65.8845 43.04 65.3939 43.04H63.8579ZM89.2949 22.528C88.3349 22.528 87.6095 22.784 87.1189 23.296C86.6282 23.7867 86.3189 24.64 86.1909 25.856C86.1909 26.0267 86.2655 26.112 86.4149 26.112H91.8229C92.0149 26.112 92.1109 26.016 92.1109 25.824C92.0255 23.6267 91.0869 22.528 89.2949 22.528ZM90.0949 36.32C87.1935 36.32 84.9535 35.584 83.3749 34.112C81.8175 32.64 81.0389 30.496 81.0389 27.68C81.0389 24.8853 81.7322 22.752 83.1189 21.28C84.5269 19.7867 86.5535 19.04 89.1989 19.04C94.2762 19.04 96.8575 21.8133 96.9429 27.36C96.9429 27.872 96.7402 28.3093 96.3349 28.672C95.9509 29.0133 95.5029 29.184 94.9909 29.184H86.4469C86.2335 29.184 86.1482 29.28 86.1909 29.472C86.3615 30.6453 86.8095 31.488 87.5349 32C88.2815 32.4907 89.3909 32.736 90.8629 32.736C91.8229 32.736 92.8575 32.5973 93.9669 32.32C94.4149 32.2133 94.8095 32.2987 95.1509 32.576C95.5135 32.8533 95.6949 33.216 95.6949 33.664V33.728C95.6949 34.2613 95.5242 34.752 95.1829 35.2C94.8629 35.6267 94.4469 35.8827 93.9349 35.968C92.6975 36.2027 91.4175 36.32 90.0949 36.32ZM100.933 23.616C100.442 23.616 100.016 23.4453 99.6529 23.104C99.2902 22.7413 99.1089 22.3147 99.1089 21.824C99.1089 21.3333 99.2902 20.9067 99.6529 20.544C100.016 20.1813 100.442 20 100.933 20H102.213C102.384 20 102.469 19.904 102.469 19.712V15.744C102.469 15.2533 102.65 14.8267 103.013 14.464C103.376 14.1013 103.802 13.92 104.293 13.92H105.829C106.32 13.92 106.746 14.1013 107.109 14.464C107.472 14.8267 107.653 15.2533 107.653 15.744V19.712C107.653 19.904 107.749 20 107.941 20H111.077C111.568 20 111.984 20.1813 112.325 20.544C112.688 20.9067 112.869 21.3333 112.869 21.824C112.869 22.3147 112.688 22.7413 112.325 23.104C111.984 23.4453 111.568 23.616 111.077 23.616H107.941C107.749 23.616 107.653 23.712 107.653 23.904V29.376C107.653 30.72 107.77 31.5733 108.005 31.936C108.261 32.2987 108.816 32.48 109.669 32.48C110.117 32.48 110.469 32.4587 110.725 32.416C111.194 32.352 111.61 32.4587 111.973 32.736C112.336 33.0133 112.517 33.376 112.517 33.824V34.08C112.517 34.6133 112.346 35.0827 112.005 35.488C111.664 35.8933 111.226 36.128 110.693 36.192C110.032 36.2773 109.264 36.32 108.389 36.32C106.213 36.32 104.677 35.8613 103.781 34.944C102.906 34.0053 102.469 32.3307 102.469 29.92V23.904C102.469 23.712 102.384 23.616 102.213 23.616H100.933ZM122.736 29.6C120.432 29.1733 118.779 28.512 117.776 27.616C116.795 26.72 116.304 25.536 116.304 24.064C116.304 22.4853 116.891 21.2587 118.064 20.384C119.259 19.488 121.051 19.04 123.44 19.04C124.848 19.04 126.288 19.1573 127.76 19.392C128.272 19.4773 128.688 19.7227 129.008 20.128C129.349 20.5333 129.52 21.0027 129.52 21.536V21.696C129.52 22.144 129.339 22.5067 128.976 22.784C128.635 23.0613 128.24 23.1573 127.792 23.072C126.405 22.7947 125.125 22.656 123.952 22.656C123.077 22.656 122.459 22.7627 122.096 22.976C121.755 23.1893 121.584 23.5093 121.584 23.936C121.584 24.7467 122.224 25.28 123.504 25.536C125.936 25.9413 127.632 26.5813 128.592 27.456C129.573 28.3307 130.064 29.6 130.064 31.264C130.064 32.864 129.467 34.112 128.272 35.008C127.077 35.8827 125.339 36.32 123.056 36.32C121.392 36.32 119.813 36.16 118.32 35.84C117.808 35.7333 117.381 35.4667 117.04 35.04C116.72 34.592 116.56 34.0907 116.56 33.536V33.28C116.56 32.832 116.741 32.4907 117.104 32.256C117.467 32 117.872 31.9253 118.32 32.032C119.707 32.3947 121.072 32.576 122.416 32.576C123.995 32.576 124.784 32.1173 124.784 31.2C124.784 30.7733 124.635 30.4427 124.336 30.208C124.059 29.9733 123.525 29.7707 122.736 29.6Z" />
                                      </svg>
						</a>
					</div>
				</div>
			</footer>
		</div>
	</div>

	<!-- Footer Section End -->


	<script src="<%=request.getContextPath()%>/views/member/js/address.js"></script>
	<script
		src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
	<script src="<%=request.getContextPath()%>/views/member/js/member.js"></script>
	<script
		src="<%=request.getContextPath()%>/views/member/js/memberTabBar.js"></script>

</body>

</html>