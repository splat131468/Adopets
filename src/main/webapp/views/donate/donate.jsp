<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.donate.entity.*"%>
<%@ page import="web.donate.service.*"%>
<%
DonateVO donVO = (DonateVO) request.getAttribute("donVO");
%>




<!DOCTYPE html>

<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Adopets</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">

<script src="https://kit.fontawesome.com/f944d9625b.js"
	crossorigin="anonymous"></script>

<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- jQuery -->
<script
	src="<%=request.getContextPath()%>/resources/background/plugins/jquery/jquery.min.js"></script>
<!-- js要在jQuery之後才能引進 -->
<script
	src="<%=request.getContextPath()%>/resources/background/js/donate.js"></script>

<!-- 地址CDN -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/2.0.0/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/jquery-twzipcode@1.7.14/jquery.twzipcode.min.js"></script>

<!-- 信用卡 -->
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/background/js/donate_creditcard.js"></script> --%>
<!-- 信用卡 JS-->
<!-- <script -->
<!-- 	src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-1b93190375e9ccc259df3a57c1abc0e64599724ae30d7ea4c6877eb615f89387.js"></script> -->
<!-- <script -->
<!-- 	src="https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js"></script> -->


<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/donate.css">

<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<link rel="stylesheet"
	href="https://unpkg.com/purecss@2.0.6/build/pure-min.css">
	
<!-- <script -->
<%-- 	src="<%=request.getContextPath()%>/resources/background/js/random_verification.js"></script> --%>

<!--標頭的css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/homepage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/homepage2.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/background/css/homepage3.css">



</head>
<body>
	<div class="overlay">
		<!--這是標頭這是標頭這是標頭這是標頭這是標頭這是標頭這是標頭這是標頭-->
		 <!--  header開始 -->
   <!-- 阿德header -->




   <div class="region region-navigation">
   <div class="region--inner">
     <div class="main-navigation">
    <!--這裡是logo-->
    <div iclass="logo">
      <a href="${pageContext.request.contextPath}/views/catInfo/My_home.jsp" rel="home" class="site-logo">
     <img src="${pageContext.request.contextPath}/views/catInfo/img/Adopets.svg" alt="Home">
      </a>
    </div>
    <nav role="navigation" aria-labelledby="block-consumer-react-main-menu-menu"
      id="block-consumer-react-main-menu" class="block block-menu navigation menu--main">
      <h2 class="visually-hidden" id="block-consumer-react-main-menu-menu">Main navigation</h2>
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

       <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
         aria-haspopup="true" aria-expanded="false" aria-label="About Pet Adoption">Open
         Submenu</button>
       <ul class="menu menu-level-2">

         <li class="menu-item"><a href="#">網站願景</a></li>
       </ul>
        </li>
        <!--貓咪照顧-->
        <li class="menu-item menu-item--expanded"><a href="#">貓咪照顧</a>
       <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
         aria-haspopup="true" aria-expanded="false" aria-label="Dog Care">Open Submenu</button>
       <ul class="menu menu-level-2">
         <li class="menu-item"><a href="#">如何照顧貓咪</a></li>
       </ul>
        </li>
        <!--收容中心-->
        <li class="menu-item menu-item--expanded"><a href="#" data-eventtype="EVENT TYPE"
         data-category="global-nav" data-action="cat-care">收容中心</a>
       <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
         aria-haspopup="true" aria-expanded="false" aria-label="Cat Care">Open Submenu</button>
       <ul class="menu menu-level-2">

         <li class="menu-item"><a href="">收容所資訊</a></li>


       </ul>
        </li>
        <!--幫助貓咪-->
        <li class="menu-item menu-item--expanded"><a href="#">捐款</a>

       <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
         aria-haspopup="true" aria-expanded="false" aria-label="All Pet Care">Open
         Submenu</button>


       <ul class="menu menu-level-2">

         <li class="menu-item"><a href="#">捐款</a></li>


       </ul>
        </li>
        <!--購物/二手商城-->
        <li class="menu-item menu-item--expanded"><a
         href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物商城</a>

       <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
         aria-haspopup="true" aria-expanded="false" aria-label="Shelters &amp; Rescues">Open
         Submenu</button>


       <ul class="menu menu-level-2">

         <li class="menu-item"><a
          href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物商城</a></li>


       </ul>
        </li>
        <!--會員資料-->
        <li class="menu-item menu-item--expanded"><a
         href="${pageContext.request.contextPath}/views/member/member.jsp">會員資料</a>
       <ul class="menu menu-level-2">
         <li class="menu-item"><a
          href="${pageContext.request.contextPath}/views/member/member.jsp">會員中心</a></li>
       </ul>
        </li>
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
    <a href="${pageContext.request.contextPath}/Favorite?action=getRedisListFav"
      class="nav-favorites-btn"> <svg role="img" focusable="false">
     <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-favorite"></use>
      </svg> <span class="visually-hidden">Favorites</span>
    </a>
    <!--購物車-->
    <a href="${pageContext.request.contextPath}/shCartAction?action=getCart"
      class="nav-favorites-btn nav-cart-btn"> <svg role="img" focusable="false">
     <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-cart"></use>
      </svg> <span class="visually-hidden">Favorites</span>
    </a>
    <button type="button" id="resources-btn" class="nav-resources-btn">
      <svg role="img" focusable="false">
     <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-menu"></use>
      </svg>
      <span class="visually-hidden">Resources</span>
    </button>


    <div class="header-inner-profile__container">
      <ul class="header-inner-profile">
     <c:if test="${empty memberVO.memID}">
       <li><a href="${pageContext.request.contextPath}/views/signIn/register.jsp"
        class="header-inner-profile-btn">註冊</a></li>
       <li><a href="${pageContext.request.contextPath}/views/signIn/signIn.jsp"
        class="header-inner-profile-btn ">登入</a></li>
     </c:if>
     <c:if test="${not empty memberVO.memID}">
       <li><a href="${pageContext.request.contextPath}/views/member/member.jsp"
        class="header-inner-profile-btn ">Hi ~ ${memberVO.name}</a></li>
     </c:if>
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
  <!--  header結束 -->


		<div class="banner">
			
			<div class="container">
				<div class="row">
					<div class="col-md-6">
						<h1 class="page-title">單次捐款</h1>
						<p>
							<span style="color: #f39c12;"> <b> 捐款改變生命DONATE to
									CHANGE LIVES </b>
							</span>
						</p>
						<p>
							<span style="color: white;"> <b>
									Adopets每月開銷至少一百八十萬，一年須籌措至少近一千兩百萬，租借上千坪營運空間守護兩百五十個生命。
									我們有專業的醫療人員、狗狗評估與訓練專員，還有獨創的「教學」系統，為進入家庭前的狗狗們做好準備，
									減少退養的發生；同時也為每一個送養把關，確保領養者能夠和Adopets的浪犬們廝守終身。 </b>
							</span>
						</p>
						<p>
							<b style="color: white;"> 謝謝您願意守護Adopets的浪犬們 </b>
						</p>
						<br>
						<p>
							<b style="color: white;"> 一起讓浪浪們知道 </b>
						</p>
						<br>
						<p>
							<b style="color: white;"> 沒關係，有我在。 </b>
						</p>
						<br>
						<div class="team_name">
							<p>Adopets團隊敬上</p>
						</div>
					</div>

					<div class="col-sm-6 col-md-5 offset-md-2 col-lg-6 offset-lg-0">
					
						<div class="title_a">
							<span id="title_1">填寫捐款金額</span> <span id="title_12"><i
								class="fa-solid fa-caret-right"></i></span> <span id="title_1">填寫捐款人資料及收據</span>
							<span id="title_12"><i class="fa-solid fa-caret-right"></i></span>
							<span id="title_1">確認填寫資訊</span> <span id="title_12"><i
								class="fa-solid fa-caret-right"></i></span> <span id="title_1">捐款資料</span>
						</div>
						<div id="content-main" class="content-main">
							
							<div class="price_set">
								<label id="title_set">點選金額或自訂金額</label>
								<div class="price_set_btn">
									<div class="amount1" onclick="test(this)">
										<span class="amount">500</span> <span class="amount_text">食糧補給
											吃飽久久</span>

									</div>
									<div class="amount1" onclick="test(this)">
										<span class="amount">999</span> <span class="amount_text">跳蚤壁蝨
											一錠藥除</span>

									</div>
									<div class="amount1" onclick="test(this)">
										<span class="amount">1500</span> <span class="amount_text">正向訓練
											送養優化</span>

									</div>
									<div class="amount1" onclick="test(this)">
										<span class="amount">3000</span> <span class="amount_text">傷病醫療
											即刻救助</span>

									</div>
								</div>
							</div>

							<div class="custom_amount" style="margin-bottom: 5%;">
								<label for="custom-other-amount"
									style="margin-top: 20px; margin-right: 15px; float: left;">自訂金額</label>
								<input placeholder="請輸入" type="number" id="custom-other-amount"
									class="custom-other-amount"
									onblur="selectValue(),value=value.replace(/[^\d]/g, '').replace(/^0{1,}/g,'')"
									style="ime-mode: disabled">
							</div>



							<!--------------------------- 查詢貓咪-------------------------------->
							<div class="find_cat"
								style="margin-bottom: 20px; margin-right: 15px;">
								<div style="width: 24%;">
									<label for="cat_option">援助指定貓咪</label>
								</div>
								<div>
									<p>${param.catname}</p>
								</div>
								<div>
									<label for="cat_option" style="margin-top: 2%; width: 16%;">指定單位</label>
								</div>
								<div>
									<p>${param.sheltername}</p>
								</div>

							</div>
							<!----------------------------------------------------------->



							<div class="custom_option">
								<label for="custom_option" style="margin-bottom: 3px;">選擇付款方式</label>
							</div>

							<div class="form-check">
								<input class="form-check-input" type="radio"
									name="exampleRadios" id="exampleRadios1" value="option1"
									checked> <label class="form-check-label"
									for="exampleRadios1"> 信用卡 </label>
							</div>

							<div class="custom_next">
								<label for="pwd" generated="true" class="errorM" id="errorM"
									style="color: red;"></label>
								<button class="btn" type="button">下一步>></button>
							</div>
						</div>


						<div id="content-main1">
							<div class="btn_content">
								<span> <a class="btn" type="button">上一步</a>
								</span>

								<div class="price-selected-info">
									<div class="info-is-recur">單筆捐款</div>
									<div class="info-price">
										<span>NT</span> <span class="price"></span> <input id="moneyD"
											type="hidden" name="donateAmo" value="">
									</div>
								</div>

								<div class="crm-group">
								  <form id="Ecpay">
									<fieldset id="profile-group-10">
										<legend>捐款基本資料 Basic Donor information</legend>

										<div class="crm-1">
											<div class="label">
												<label for="email-5">電子郵件地址</label>
											</div>
										</div>

										<div class="content">
											<input size="30" maxlength="60" type="text"
												name="donateEmail" id="email-5"
												class="form-text big required" value="${donVO.donateEmail}"
												onblur="validate_account(this.value)"> <label
												for="mail" generated="true" class="errorP" id="errorE"
												style="color: red;"></label>
										</div>

										<div class="name-1">
											<div class="label">
												<label for="last_name">姓氏 Last Name</label>
											</div>

											<div class="content">
												<input size="30" maxlength="64" type="text" name="last_name"
													id="last_name-5" class="form-text_name" required="required">
											</div>

										</div>

										<div class="name-2">
											<div class="label">
												<label for="first_name">名字 First Name</label>
											</div>

											<div class="content2">
												<input size="30" maxlength="64" type="text"
													name="first_name" id="first_name-5" class="form-text_name" required="required">
											</div>
										</div>


										<div class="phone-1">
											<div class="phone_text">
												<label>聯絡電話 Phone no.</label>
											</div>

											<div class="content3">
												<input size="20" maxlength="32" type="number" name="phone"
													value="${donVO.phone}" class="phone_name"
													onblur="validate_phone(this.value)"> <label
													for="pwd" generated="true" class="errorP" id="errorP"
													style="color: red;"></label>
											</div>
										</div>

										<div class="city_text">
											<div class="city_name">
												<label>縣市 City</label>
											</div>
										</div>

										<!--城市 地區-->
										<div class="content4">
											<div id="twzipcode_ADV"></div>
										</div>

										<!--地址-->
										<div class="address_text">
											<div class="address_name">
												<label>街道地址 Address</label>
											</div>
										</div>

										<div class="content5">
											<input type="text" name="street_address"
												class="street_address" maxlength="96" size="45">
										</div>



										<div class="donate_messages">
											<label>捐款留言 Donate message</label>
										</div>
										<div>
											<textarea name="donateMes" id="donate_message" cols="25"
												rows="4" value="${donVO.donateMes}" placeholder="請輸入..."></textarea>
										</div>


										<div class="content6">
											<span> <a class="btn" type="button">上一步</a>
											</span>
											<div class="content6_next">
												<button class="btn_next" type="submit">下一步>></button>
											</div>
										</div>
										<label for="pwd" generated="true" class="errorN" id="errorN"
											style="color: red;"></label>



									</fieldset>
<<<<<<< HEAD
										<input type="hidden" id="memID" name="memID" value="1" /> 
										<input type="hidden" id="catID" name="catID" value="1" /> 
										<input type="hidden" id="shelterName" name="shelterName" value="桃園市收容所" /> 
=======
										<input type="hidden" id="memID" name="memID" value="${param.memid}" /> 
										<input type="hidden" id="catID" name="catID" value="${param.catid}" /> 
										<input type="hidden" id="shelterName" name="shelterName" value="${param.sheltername}" /> 
>>>>>>> 5c5265b4d77682e1532926db7fee9a9b3960ce0f
										<input type="hidden" id="donateStatus" name="donateStatus" value="0" />
									</form>	
								</div>

							</div>

						</div>


<!----------------------------------------------- 改用綠界金流 -------------------------------------------------------->
<!--  
						<div id="content-main2">

							<div class="container preload">
								<div class="creditcard">
									<div class="front">
										<div id="ccsingle"></div>
										<svg version="1.1" id="cardfront"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
											viewBox="0 0 750 471"
											style="enable-background: new 0 0 750 471;"
											xml:space="preserve">
                                                <g id="Front">
                                                    <g
												id="CardBackground">
                                                        <g
												id="Page-1_1_">
                                                            <g
												id="amex_1_">
                                                                <path
												id="Rectangle-1_1_" class="lightcolor grey"
												d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                                                    C0,17.9,17.9,0,40,0z" />
                                                            </g>
                                                        </g>
                                                        <path
												class="darkcolor greydark"
												d="M750,431V193.2c-217.6-57.5-556.4-13.5-750,24.9V431c0,22.1,17.9,40,40,40h670C732.1,471,750,453.1,750,431z" />
                                                    </g>
                                                    <text
												transform="matrix(1 0 0 1 60.106 295.0121)" id="svgnumber"
												class="st2 st3 st4">0123 4567 8910 1112</text>
                                                    <text
												transform="matrix(1 0 0 1 54.1064 428.1723)" id="svgname"
												class="st2 st5 st6">JOHN DOE</text>
                                                    <text
												transform="matrix(1 0 0 1 54.1074 389.8793)"
												class="st7 st5 st8">cardholder name</text>
                                                    <text
												transform="matrix(1 0 0 1 479.7754 388.8793)"
												class="st7 st5 st8">expiration</text>
                                                    <text
												transform="matrix(1 0 0 1 65.1054 241.5)"
												class="st7 st5 st8">card
                                                        number</text>
                                                    <g>
                                                        <text
												transform="matrix(1 0 0 1 574.4219 433.8095)" id="svgexpire"
												class="st2 st5 st9">01/23</text>
                                                        <text
												transform="matrix(1 0 0 1 479.3848 417.0097)"
												class="st2 st10 st11">VALID</text>
                                                        <text
												transform="matrix(1 0 0 1 479.3848 435.6762)"
												class="st2 st10 st11">THRU</text>
                                                        <polygon
												class="st2" points="554.5,421 540.4,414.2 540.4,427.9 		" />
                                                    </g>
                                                    <g id="cchip">
                                                        <g>
                                                            <path
												class="st2"
												d="M168.1,143.6H82.9c-10.2,0-18.5-8.3-18.5-18.5V74.9c0-10.2,8.3-18.5,18.5-18.5h85.3
                                                c10.2,0,18.5,8.3,18.5,18.5v50.2C186.6,135.3,178.3,143.6,168.1,143.6z" />
                                                        </g>
                                                        <g>
                                                            <g>
                                                                <rect
												x="82" y="70" class="st12" width="1.5" height="60" />
                                                            </g>
                                                            <g>
                                                                <rect
												x="167.4" y="70" class="st12" width="1.5" height="60" />
                                                            </g>
                                                            <g>
                                                                <path
												class="st12"
												d="M125.5,130.8c-10.2,0-18.5-8.3-18.5-18.5c0-4.6,1.7-8.9,4.7-12.3c-3-3.4-4.7-7.7-4.7-12.3
                                                    c0-10.2,8.3-18.5,18.5-18.5s18.5,8.3,18.5,18.5c0,4.6-1.7,8.9-4.7,12.3c3,3.4,4.7,7.7,4.7,12.3
                                                    C143.9,122.5,135.7,130.8,125.5,130.8z M125.5,70.8c-9.3,0-16.9,7.6-16.9,16.9c0,4.4,1.7,8.6,4.8,11.8l0.5,0.5l-0.5,0.5
                                                    c-3.1,3.2-4.8,7.4-4.8,11.8c0,9.3,7.6,16.9,16.9,16.9s16.9-7.6,16.9-16.9c0-4.4-1.7-8.6-4.8-11.8l-0.5-0.5l0.5-0.5
                                                    c3.1-3.2,4.8-7.4,4.8-11.8C142.4,78.4,134.8,70.8,125.5,70.8z" />
                                                            </g>
                                                            <g>
                                                                <rect
												x="82.8" y="82.1" class="st12" width="25.8" height="1.5" />
                                                            </g>
                                                            <g>
                                                                <rect
												x="82.8" y="117.9" class="st12" width="26.1" height="1.5" />
                                                            </g>
                                                            <g>
                                                                <rect
												x="142.4" y="82.1" class="st12" width="25.8" height="1.5" />
                                                            </g>
                                                            <g>
                                                                <rect
												x="142" y="117.9" class="st12" width="26.2" height="1.5" />
                                                            </g>
                                                        </g>
                                                    </g>
                                                </g>
                                                <g id="Back">
                                                </g>
                                            </svg>
									</div>
									<div class="back">
										<svg version="1.1" id="cardback"
											xmlns="http://www.w3.org/2000/svg"
											xmlns:xlink="http://www.w3.org/1999/xlink" x="0px" y="0px"
											viewBox="0 0 750 471"
											style="enable-background: new 0 0 750 471;"
											xml:space="preserve">
                                                <g id="Front">
                                                    <line class="st0"
												x1="35.3" y1="10.4" x2="36.7" y2="11" />
                                                </g>
                                                <g id="Back">
                                                    <g id="Page-1_2_">
                                                        <g id="amex_2_">
                                                            <path
												id="Rectangle-1_2_" class="darkcolor greydark"
												d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                                                C0,17.9,17.9,0,40,0z" />
                                                        </g>
                                                    </g>
                                                    <rect y="61.6"
												class="st2" width="750" height="78" />
                                                    <g>
                                                        <path
												class="st3"
												d="M701.1,249.1H48.9c-3.3,0-6-2.7-6-6v-52.5c0-3.3,2.7-6,6-6h652.1c3.3,0,6,2.7,6,6v52.5
                                            C707.1,246.4,704.4,249.1,701.1,249.1z" />
                                                        <rect x="42.9"
												y="198.6" class="st4" width="664.1" height="10.5" />
                                                        <rect x="42.9"
												y="224.5" class="st4" width="664.1" height="10.5" />
                                                        <path
												class="st5"
												d="M701.1,184.6H618h-8h-10v64.5h10h8h83.1c3.3,0,6-2.7,6-6v-52.5C707.1,187.3,704.4,184.6,701.1,184.6z" />
                                                    </g>
                                                    <text
												transform="matrix(1 0 0 1 621.999 227.2734)"
												id="svgsecurity" class="st6 st7">985</text>
                                                    <g class="st8">
                                                        <text
												transform="matrix(1 0 0 1 518.083 280.0879)"
												class="st9 st6 st10">security code</text>
                                                    </g>
                                                    <rect x="58.1"
												y="378.6" class="st11" width="375.5" height="13.5" />
                                                    <rect x="58.1"
												y="405.6" class="st11" width="421.7" height="13.5" />
                                                    <text
												transform="matrix(1 0 0 1 59.5073 228.6099)"
												id="svgnameback" class="st12 st13">John Doe</text>
                                                </g>
                                            </svg>
									</div>
								</div>
							</div>
							<div class="form-container">
								<div class="field-container">
									<label for="name">持卡人姓名</label> <input id="name"
										name="donateName" maxlength="20" type="text"
										required="required" class="donateName"
										value="${donVO.donateName}">
								</div>
								<div class="field-container">
									<div>
										<label for="cardnumber" style="float: left;">信用卡號</label><span
											id="generatecard">generate random</span> <input
											id="cardnumber" type="text" inputmode="numeric"
											required="required">

									</div>
									<svg id="ccicon" class="ccicon" width="750" height="471"
										viewBox="0 0 750 471" version="1.1"
										xmlns="http://www.w3.org/2000/svg"
										xmlns:xlink="http://www.w3.org/1999/xlink">

                                        </svg>
								</div>
								<div class="field-container">
									<label for="expirationdate">有效月年 (mm/yy)</label> <input
										id="expirationdate" type="text" inputmode="numeric"
										required="required">
								</div>
								<div class="field-container">
									<label for="securitycode">安全碼</label> <input id="securitycode"
										type="text" inputmode="numeric" required="required">
								</div>


								<fieldset>
									<div id="myform" class="pure-form pure-form-stacked">
										<div class="pure-control-group">
											<canvas id="mycanvas" width='150' height='40'></canvas>
										</div>
										<div class="pure-control-group">
											<input id="myvad" type="text" name="vad" placeholder="請輸入驗證碼">
										</div>

										<div class="pure-control-group-checked" style="width: 200%;">
											<span> <a class="btn_pure" type="button">上一步</a>
											</span>
											<div class="pure-controls">
												<button type="button" id="donatebtn"
													class="pure-button pure-button-primary">確認送出</button>
											</div>
										</div>
									</div>
								</fieldset>
							</div>

						</div>
-->				
					
				

					</div>

				
				</div>


			</div>


		</div>


	</div>
	<section id="xxx"></section>

	<br>
	<footer>
		<div class="foot">© Copyright 2022, Adopets Sanctuary Taiwan.
			All rights reserved.</div>
	</footer>

	<!--標頭會用到的svg-->
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
	
	<script>
	    $("#twzipcode_ADV").twzipcode({
	        zipcodeIntoDistrict: true, // 郵遞區號自動顯示在地區
	        css: ["city form-control", "town form-control"], // 自訂 "城市"、"地區" class 名稱 
	        countyName: "city", // 自訂城市 select 標籤的 name 值
	        districtName: "town" // 自訂地區 select 標籤的 name 值
	    });

    </script>

	<script
		src="<%=request.getContextPath()%>/resources/background/js/homepage.js"></script>
	<script>
	$("form").bind("submit",function(){
		 console.log("AAAA");	
         
         let memID = $("#memID").val();
         let catID = $("#catID").val();
         let shelterName = $("#shelterName").val();

         let last_name = $("#last_name-5").val(); 
         let first_name = $("#first_name-5").val();
         
         let donateEmail = $("#email-5").val();
         let phone = $(".phone_name").val();
         let city = $( ".city option:selected" ).val();
         let town = $( ".town option:selected" ).val();
         let street_address = $(".street_address").val();
         let donateAmo = $("#moneyD").val();  
         let donateStatus = $("#donateStatus").val();
         let donateMes = $("#donate_message").val();
         
         console.log(donateAmo);	
         console.log(city);	
         console.log(town);	
         $.ajax({
             url: "<%=request.getContextPath()%>/NewDonate",
             data:{
         	     "action":"New_Donate",
               "memID": memID,
               "catID": catID,
               "shelterName": shelterName,
               "last_name": last_name,
               "first_name": first_name,
               "donateEmail": donateEmail,
               "phone": phone,
               "city": city,
               "town": town,
               "street_address": street_address,
               "donateAmo": donateAmo,
               "donateStatus": donateStatus,
               "donateMes": donateMes
             },
             type: "POST",
             dataType:"text",
             success: function (data) {
                 $("#xxx").html(data);
             }

           });
		return false;
	 });
	
//        function onEditButtonClick() {

// 		    console.log("AAAA");	
           
//            let memID = $("#memID").val();
//            let catID = $("#catID").val();
//            let shelterName = $("#shelterName").val();
//            let donateName = $(".donateName").val(); 
//            let donateEmail = $("#email-5").val();
//            let phone = $(".phone_name").val();
//            let city = $( ".city option:selected" ).val();
//            let town = $( ".town option:selected" ).val();
//            let street_address = $(".street_address").val();
//            let donateAmo = $("#moneyD").val();  
//            let donateStatus = $("#donateStatus").val();
//            let donateMes = $("#donate_message").val();
           
//            console.log(donateAmo);	
//            console.log(city);	
//            console.log(town);	
//            $.ajax({
<%--                url: "<%=request.getContextPath()%>/NewDonate", --%>
//                data:{
//            	     "action":"New_Donate",
//                  "memID": memID,
//                  "catID": catID,
//                  "shelterName": shelterName,
//                  "donateName": donateName,
//                  "donateEmail": donateEmail,
//                  "phone": phone,
//                  "city": city,
//                  "town": town,
//                  "street_address": street_address,
//                  "donateAmo": donateAmo,
//                  "donateStatus": donateStatus,
//                  "donateMes": donateMes
//                },
//                type: "POST",
//                success: function () {
//             	   Swal.fire(
//             	            '感謝您的捐款!',
//             	            'Wish you a nice day!',
//             	            'success'
//                ).then(function() {
            		    
//             	   setTimeout(function(){window.location.reload();});
//             	   });
            	   
//                }

//              })
//           }
  
       </script>

</body>

</html>