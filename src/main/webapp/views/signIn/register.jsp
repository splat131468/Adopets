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
<link rel="stylesheet" href="<%=request.getContextPath()%>views/member/css/bootstrap.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>views/member/css/register.css">
<!-- index -->
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/catInfo/files/homepage.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/catInfo/files/css_L5nWqD5SQK8ZrCIRrm01g1QcB7QmIYINuJjhTPq7WFs.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/views/catInfo/files/css_48il_hUScvaXu5Lky-fqRm9LjbUTybcek-Dq368IMAI.css">
    
</head>

<body>

	
	<div class="register">
		<!-- 背景CSS須等結合大家的版面後才能調整完成 -->
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