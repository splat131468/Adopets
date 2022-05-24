<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="UTF-8">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Adopet Home</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/homepage.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/css_L5nWqD5SQK8ZrCIRrm01g1QcB7QmIYINuJjhTPq7WFs.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/css_48il_hUScvaXu5Lky-fqRm9LjbUTybcek-Dq368IMAI.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/flickity.min.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/my_home_6_1.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css" integrity="sha512-KfkfwYDsLkIlwQp6LFnl8zNdLGxu9YAA1QvwINks4PhcElQSvqcyVLLD9aMhXd13uQjoXtEKNosOWaZqXgel0g==" crossorigin="anonymous" referrerpolicy="no-referrer" />
  <style>
  /*Necessary CSS*/

		.search-form {
		  transition: all 0.4s ease;
		  background-color: #fff;
		  display: inline-block;
		  border-radius: 10px;
		}
		
		#location {
		  transition: all 0.4s ease;
		  width: 0px;
		  padding: 0px;
		  border: none;
		}
		
		#query {
		  width: 300px;
		  height: 40px;
		}
		
		.search-form input, .search-form button {
		  height: 40px;
		  padding-left: 1.5rem;
		  border-radius: 10px;
		}
		
		.search-form input {
		  border: none;
		  outline-style:none;
		  box-shadow:none;
		}
		
		.search-form button {
		  background: #fff;
		  border: none;
		}
		
		.search-form button:hover {
		  color: #63ADF2;
		}
		
		/*Generic CSS*/
		
		body {
		  background-color: #000!important;
		}
		
		.container {
		  margin-top: 20px;
		}
		
		h1 {
		  /* padding-bottom: 1px; */
		  color: #fff!important;
		}
  </style>
  
</head>

<body>
 


  <div class="dialog-off-canvas-main-canvas" data-off-canvas-main-canvas="">
    <div id="site" class="layout-container">
  <!--這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題這是標題-->
      <header role="banner" class="header-inner">
        <div class="region region-navigation">
          <div class="region--inner">
            <div class="main-navigation">
              <!--這裡是logo-->
              <div iclass="logo">
                <a href="#" rel="home" class="site-logo">
                  <img src="./img/Adopets.svg" alt="Home">
                </a>
              </div>
              <nav role="navigation" aria-labelledby="block-consumer-react-main-menu-menu"
                id="block-consumer-react-main-menu" class="block block-menu navigation menu--main">
                <h2 class="visually-hidden" id="block-consumer-react-main-menu-menu">Main navigation</h2>
                <ul class="menu menu-level-0">
                  <li class="menu-item menu-item--expanded">
                  </li>
                  <li class="menu-item menu-item--expanded">
                    <button class="active" aria-expanded="true" type="button"></button>
                    <div class="menu-inner menu-level-1">
                      <ul class="menu">
                        <!--關於我們-->
                        <li class="menu-item menu-item--expanded">
                          <a href="#">關於我們</a>

                          <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                            aria-haspopup="true" aria-expanded="false" aria-label="About Pet Adoption">Open
                            Submenu</button>
                          <ul class="menu menu-level-2">

                            <li class="menu-item">
                              <a href="#">網站願景</a>
                            </li>
                          </ul>
                        </li>
                        <!--貓咪照顧-->
                        <li class="menu-item menu-item--expanded">
                          <a href="#">貓咪照顧</a>
                          <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                            aria-haspopup="true" aria-expanded="false" aria-label="Dog Care">Open Submenu</button>
                          <ul class="menu menu-level-2">
                            <li class="menu-item">
                              <a href="#">如何照顧貓咪</a>
                            </li>
                          </ul>
                        </li>
                        <!--收容中心-->
                        <li class="menu-item menu-item--expanded">
                          <a href="#" data-eventtype="EVENT TYPE" data-category="global-nav"
                            data-action="cat-care">收容中心</a>
                          <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                            aria-haspopup="true" aria-expanded="false" aria-label="Cat Care">Open Submenu</button>
                          <ul class="menu menu-level-2">

                            <li class="menu-item">
                              <a href="">收容所資訊</a>
                            </li>
                          </ul>



                        </li>
                        <!--捐款-->
                        <li class="menu-item menu-item--expanded">
                          <a href="#">捐款</a>
                        </li>
                        <!--購物/二手商城-->
                        <li class="menu-item menu-item--expanded">
                          <a href="#">購物商城</a>

                          <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                            aria-haspopup="true" aria-expanded="false" aria-label="Shelters &amp; Rescues">Open
                            Submenu</button>


                          <ul class="menu menu-level-2">
                            <li class="menu-item">
                              <a href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物/二手商城</a>
                            </li>
                          </ul>



                        </li>
                        <!--會員資料-->
                        <li class="menu-item menu-item--expanded">
                          <a href="#">會員資料</a>

                          <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                            aria-haspopup="true" aria-expanded="false" aria-label="Helping Pets">Open Submenu</button>


                          <ul class="menu menu-level-2">

                            <li class="menu-item">
                              <a href="${pageContext.request.contextPath}/views/member/member.jsp">會員中心</a>

                            </li>

                          </ul>



                        </li>
                        <!--開發團隊-->
                        <li class="menu-item">
                          <a href="#">開發團隊</a>

                        </li>

                      </ul>
                    </div>



                  </li>

                </ul>




              </nav>
              <nav role="navigation" aria-labelledby="block-mobilemainmenu-menu" id="block-mobilemainmenu"
                class="block block-menu navigation menu--mobile-main-menu">

                <h2 class="visually-hidden" id="block-mobilemainmenu-menu">Mobile Main Menu</h2>





                <div class="menu-wrap menu-level-0">
                  <div class="mobile-menu-header">
                    <button type="button" class="mobile-menu-header-btn close-resources"
                      aria-label="Close Resources Navigation Menu" disabled="">
                      <svg role="img">
                        <use xlink:href="#icon-close"></use>
                      </svg>
                      <span class="visually-hidden">Close Resources Navigation Menu</span>
                    </button>
                  </div>


                  <div id="react_mobile-menu-profile" class="mobileMenu-footer">
                    <ul class="mobileMenu-footer-nav">
                      <li class="mobileMenu-footer-nav-item"><a
                          href="/user/register/?next=http%3A%2F%2F127.0.0.1%3A5501%2FADOPETS_Home%2Fpetfinder_like%2Fadopet_home.html"
                          class="mobileMenu-item-txt">Sign Up</a></li>
                      <li class="mobileMenu-footer-nav-item"><a href="https://www.petfinder.com/user/login/"
                          class="mobileMenu-item-txt">Log In</a></li>
                    </ul>
                  </div>

                </div>
              </nav>

            </div>
            <!--我的最愛+購物車+登入+登出-->
            <div class="profile-navigation">
              <!--我的最愛-->
              <a href="" class="nav-favorites-btn">
                <svg role="img" focusable="false">
                  <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-favorite"></use>
                </svg>
                <span class="visually-hidden">Favorites</span>
              </a>
              <!--購物車-->
              <a href="${pageContext.request.contextPath}/shCartAction?action=getCart" class="nav-favorites-btn nav-cart-btn">
                <svg role="img" focusable="false">
                  <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-cart"></use>
                </svg>
                <span class="visually-hidden">Favorites</span>
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
                  		<li><a href="${pageContext.request.contextPath}/views/signIn/register.jsp" class="header-inner-profile-btn">註冊</a></li>
                  		<li><a href="${pageContext.request.contextPath}/views/signIn/signIn.jsp" class="header-inner-profile-btn ">登入</a></li>
                 	</c:if>
                  	<c:if test="${not empty memberVO.memID}">
                  		<li><a href="${pageContext.request.contextPath}/views/member/member.jsp" class="header-inner-profile-btn ">Hi ~ ${memberVO.name}</a></li>
                  	</c:if>
                </ul>
              </div>
            </div>
          </div>
        </div>

        <div class="region region-header">
          <div id="block-herobanner"
            class="block block-block-content block-block-content1a178173-d457-4197-a82e-3b0098a0d9ad">



            <div
              class="field field--name-field-content field--type-entity-reference-revisions field--label-hidden field__item">
              <div class="paragraph paragraph--type--hero-banner paragraph--view-mode--default">

                <div
                  class="field field--name-field-images field--type-entity-reference-revisions field--label-hidden field__item">
                  <div class="paragraph paragraph--type--hero-banner-images paragraph--view-mode--default">
                    <!--首頁圖片-->
                    <picture>
                      <source srcset="./img/page.png" media="(min-width: 1438px)">
                      <source srcset="./img/page.png" media="(min-width: 1140px)">
                      <source srcset="./img/page.png" media="(min-width: 925px)">
                      <source srcset="./img/page.png" media="(min-width: 728px)">
                      <source srcset="./img/page.png" media="(min-width: 667px)">
                      <source srcset="./img/page.png" media="(max-width: 499px)">
                      <img src="./img/page.png" aria-hidden="true" class="hero-img" alt="Dog and cat picture">
                    </picture>
                  </div>
                </div>

                <div class="hero-inner">
                  <div class="hero-body">

                    <h1 class="field field--name-field-title field--type-string field--label-hidden field__item">
                      找到你的新朋友！
                    </h1>

                    <br>
                    <div class="field field--name-field-sub-title field--type-string field--label-hidden field__item">
                      透過貓咪特徵來搜尋附近收容所的貓咪們
                      <br>
                      可以小額捐款,網站消費來幫助貓咪渡過難關
                    </div>
                    <br>
                    <br>
                    <div
                      class="field field--name-field-sub-title field--type-string field--label-hidden field__item animated-number">
                      認養媒合次數 : <span class="value" akhi="6666">0</span> &nbsp;&nbsp;&nbsp;&nbsp;
                      捐款金額 : <span class="value" akhi="888888">0</span> &nbsp;&nbsp;&nbsp;&nbsp;
                      瀏覽人數 : <span class="value" akhi="9999">0</span>
                    </div>

                  </div>
                </div>
              </div>
            </div>

          </div>
          <div id="block-petsearchbar" class="block block-consumer-blocks block-pet-search-bar">
		<!-- search bar -->
		<div class="petSearchBar-container container text-center">
			<form class="search-form">
			  <input name="search[query]" id="query" placeholder="搜尋貓咪" type="text" value="">
			  
			  <input name="search[location]" id="location" placeholder="位置" type="text" value="">
			 <i class="fa-solid fa-location-arrow"></i>
			  
			  <button name="commit" type="submit" class="button primary">
			     <i class="fa fa-search" aria-hidden="true"></i>
			  </button>
			</form>
		</div>
		<!-- search bar -->
	
		<!-- search bar -->
     <!--         <section id="pet-search-bar">
              <div class="petSearchBar-container">123
                <div class="petSearchBar search-form">
					<div class="container text-center">
						<form class="search-form">
						  <input name="search[query]" id="query" placeholder="Search jobs by keyword"           type="text" value="">
						  <input name="search[location]" id="location" placeholder="Type a Location" type="text"    value="">
						  <button name="commit" type="submit" class="button primary">
						     <i class="fa fa-search" aria-hidden="true"></i>
						  </button>
						</form>
					</div>
                  
                  <div class="iconSearch-container">
                  	<button class="iconSearch"><span class="u-isVisuallyHidden">Begin
                        search</span><svg width="40" height="40" fill="none" xmlns="http://www.w3.org/2000/svg">
                        <title>begin search</title>
                        <path d="M0 5a5 5 0 015-5h30a5 5 0 015 5v30a5 5 0 01-5 5H5a5 5 0 01-5-5V5z" fill="#6504B5">
                        </path>
                        <path fill-rule="evenodd" clip-rule="evenodd"
                          d="M17.61 10.335a7.376 7.376 0 013.614.879 7.443 7.443 0 012.88 2.837 7.475 7.475 0 01-.237 7.79 7.44 7.44 0 01-3.046 2.656 7.374 7.374 0 01-7.176-.555 7.412 7.412 0 01-2.484-2.775 7.442 7.442 0 01.22-7.218 7.408 7.408 0 012.647-2.619 7.377 7.377 0 013.582-.995zm-2.396 11.203a4.53 4.53 0 002.516.782 4.556 4.556 0 003.223-1.331 4.588 4.588 0 001.347-3.226c0-.9-.266-1.78-.764-2.529a4.544 4.544 0 00-2.033-1.678 4.527 4.527 0 00-4.946.975 4.562 4.562 0 00-1.002 4.956c.339.833.916 1.547 1.66 2.051z"
                          fill="#fff"></path>
                        <path
                          d="M25.253 23.256l2.987 2.962a1.422 1.422 0 01.006 2.027 1.436 1.436 0 01-2.032 0l-2.97-2.945a9.516 9.516 0 002.009-2.044z"
                          fill="#fff"></path>
                      </svg>
                    </button>
                  </div>
                </div>
            </section> -->
          </div>
        </div>
      </header>
  <!--這是main body這是main body這是main body這是main body這是main body這是main body這是main body這是main body這是main body-->
      <main role="main">
        <a id="main-content" tabindex="-1"></a>
        <div class="layout-content">
          <div class="region region-content">
            <div data-drupal-messages-fallback="" class="hidden"></div>
            
            <div id="block-consumer-react-content" class="block block-system block-system-main-block">



              <article data-history-node-id="13" role="article" about="/home" typeof="schema:WebPage"
                class="node node--type-page node--view-mode-full">


                <span property="schema:name" content="Home Page" class="rdf-meta hidden"></span>



                <div class="node__content">


                  <div
                    class="field field--name-field-content field--type-entity-reference-revisions field--label-hidden field__items">
                    <!--自動配對貓咪-->
                    <div class="field__item">
                      <div class="paragraph paragraph--type--block-embed paragraph--view-mode--default">
                        <div class="layout--wrapper">

                          <div
                            class="field field--name-field-block-embed field--type-block-field field--label-hidden field__item">
                            <div id="block-recommendedpetsshelf"
                              class="block block-consumer-blocks block-recommended-pets">



                              <section id="recommended-pets">
                                <div class="recommendations m-recommendations_singleRow u-isHidden@maxMd">
                                  <div class="recommendations-header u-vr5x">
                                    <div class="tier">
                                    	<a
                                        	href="${pageContext.request.contextPath}/CatInfoServlet?action=listEmps_ByCompositeQuery"
                                        	class="u-displayBlock txt">
                                        	<h2 class="txt txt_h1 m-txt_tight m-txt_colorPrimary m-txt_alignCenter">貓咪配對結果</h2>
                                      </a>
                                   </div>
                                  </div>
                                  <div class="recommendations-body">
                                    <div class="recommendations-body-inner">
                                      <div class="grid grid_gutterLg m-grid_stretch m-grid_centerJustify">
                                        <div
                                          class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/tiger-54099962/nj/toms-river/calling-all-cats-rescues-nj709/"
                                              class="petCard-link"
                                              aria-label="Tiger, adoptable Cat, Baby Male Domestic Short Hair, Toms River, NJ , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54099962/1/?bust=1641318055&amp;width=316"
                                                  alt="Tiger, adoptable Cat, Baby Male Domestic Short Hair, Toms River, NJ , Good Match."
                                                  class="petCard-media-img lazyloaded"
                                                  src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54099962/1/?bust=1641318055&amp;width=316">
                                              </div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Tiger</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div
                                          class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/tootsie-54890323/nj/lambertville/tnr-hunterdon-county-nj-nj944/"
                                              class="petCard-link"
                                              aria-label="TOOTSIE, adoptable Cat, Baby Female Torbie and Domestic Medium Hair Mix, Lambertville, NJ , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54890323/1/?bust=1646670281&amp;width=316"
                                                  alt="TOOTSIE, adoptable Cat, Baby Female Torbie and Domestic Medium Hair Mix, Lambertville, NJ , Good Match."
                                                  class="petCard-media-img lazyloaded"
                                                  src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54890323/1/?bust=1646670281&amp;width=316">
                                              </div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Tootsie</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div
                                          class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/larry-55062517/ny/woodhaven/crazy-cat-fam-ny1540/"
                                              class="petCard-link"
                                              aria-label="Larry, adoptable Cat, Baby Male Domestic Short Hair, Woodhaven, NY , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55062517/1/?bust=1647915890&amp;width=316"
                                                  alt="Larry, adoptable Cat, Baby Male Domestic Short Hair, Woodhaven, NY , Good Match."
                                                  class="petCard-media-img lazyloaded"
                                                  src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55062517/1/?bust=1647915890&amp;width=316">
                                              </div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Larry</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div
                                          class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/elvis-54491540/ny/howard-beach/meowsquad-ny1486/"
                                              class="petCard-link"
                                              aria-label="Elvis, adoptable Cat, Baby Male Domestic Short Hair, Howard beach, NY , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54491540/1/?bust=1649215537&amp;width=316"
                                                  alt="Elvis, adoptable Cat, Baby Male Domestic Short Hair, Howard beach, NY , Good Match."
                                                  class="petCard-media-img lazyloaded"
                                                  src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54491540/1/?bust=1649215537&amp;width=316">
                                              </div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Elvis</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div
                                          class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/henry-48162507/ct/torrington/feline-friends-ct383/"
                                              class="petCard-link"
                                              aria-label="Henry, adoptable Cat, Baby Male Domestic Short Hair, Torrington, CT , Good Match.">
                                              <div class="petCard-media">
                                                <div class="petCard-iconPlaceholder petCard-media-img "><svg
                                                    xmlns="http://www.w3.org/2000/svg" viewBox="0 0 292.08 292.08">
                                                    <title>Henry, adoptable Cat, Baby Male Domestic Short Hair,
                                                      Torrington, CT , Good Match.</title>
                                                    <path
                                                      d="M146 292.08c-80.53 0-146-65.51-146-146S65.51 0 146 0s146 65.51 146 146-65.44 146.08-146 146.08zM146 26a120 120 0 10120 120A120.17 120.17 0 00146 26z"
                                                      fill="#fff"></path>
                                                    <circle cx="186.83" cy="87.76" r="17.86" fill="#fff"></circle>
                                                    <path
                                                      d="M105.4 192.47c19.53 0 27.81-11.67 27.81-30.35 0-8.25-6.57-15.19-6.57-24.13a20 20 0 0120.45-20.36c12.44 0 20.18 10.51 20.18 20.33 0 9.4-6.59 15.58-6.59 24.29 0 18.69 7.6 30.21 27.73 30.21 16.25 0 24.16-8.8 31.33-19.88 2.37-3.67 6.34-6.61 10.64-6.61 6.49 0 10.1 4.65 10.1 9.78 0 12.22-21 40.38-52.57 40.38-10.88 0-29.57-2.26-40.95-19.93-10.44 16-26.3 19.92-40.74 19.92-33.07 0-52.88-29.25-52.88-40.39a9.71 9.71 0 019.93-9.73 13.55 13.55 0 0110.9 6.61c7.11 11.39 15.75 19.86 31.23 19.86z"
                                                      fill="#fff"></path>
                                                  </svg></div>
                                              </div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Henry</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div
                                          class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl ">
                                          <div class="actionCard m-actionCard_overflowVisible">
                                            <div><a class="actionCard-overlay"
                                                href="${pageContext.request.contextPath}/views/catInfo/My_search.jsp"
                                                aria-label="8600 more pets available on Petfinder: Meet them"></a></div>
                                            <div class="actionCard-body actionCard-body_split">
                                              <div class="actionCard-body-icon"><span
                                                  class="m-icon_colorWhite meetThemCard-icon"><svg viewBox="0 0 70 68"
                                      	              xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M17.26 29.338c0-5.76-3.876-10.439-8.63-10.439C3.876 18.9 0 23.578 0 29.34c0 5.76 3.876 10.422 8.63 10.422 4.754 0 8.63-4.678 8.63-10.423zM8.63 36.84c-3.147 0-5.698-3.365-5.698-7.518 0-4.152 2.55-7.517 5.698-7.517 3.147 0 5.665 3.38 5.665 7.534 0 4.152-2.518 7.5-5.665 7.5zM70 29.322c0-5.745-3.876-10.422-8.63-10.422-4.754 0-8.63 4.677-8.63 10.439a1.448 1.448 0 00.37 1.13 1.474 1.474 0 001.096.485 1.486 1.486 0 001.096-.484 1.457 1.457 0 00.37-1.131c0-4.137 2.55-7.518 5.698-7.518 3.147 0 5.698 3.365 5.698 7.517 0 4.137-2.55 7.502-5.698 7.502a1.48 1.48 0 00-1.042.427 1.454 1.454 0 000 2.066 1.48 1.48 0 001.042.428c4.754 0 8.63-4.678 8.63-10.439zm-24.233-7.944c4.754 0 8.63-4.678 8.63-10.439S50.504.5 45.767.5c-4.738 0-8.63 4.678-8.63 10.439s3.843 10.439 8.63 10.439zm0-17.956c3.147 0 5.698 3.364 5.698 7.517 0 4.153-2.584 7.517-5.698 7.517-3.114 0-5.698-3.364-5.698-7.517 0-4.153 2.534-7.517 5.698-7.517zM24.233 21.378c4.754 0 8.63-4.678 8.63-10.439S29.02.5 24.233.5c-4.787 0-8.63 4.678-8.63 10.439s3.893 10.439 8.63 10.439zm0-17.956c3.148 0 5.698 3.364 5.698 7.517 0 4.153-2.534 7.517-5.698 7.517-3.163 0-5.698-3.364-5.698-7.517 0-4.153 2.584-7.517 5.698-7.517zm31.472 44.103l-9.11-15.806c-3.015-5.204-7.14-8.076-11.595-8.076-4.456 0-8.58 2.872-11.595 8.075l-9.11 15.79a18.17 18.17 0 00-1.49 3.283 12.275 12.275 0 00-.83 4.547 12.252 12.252 0 003.453 8.386 12.473 12.473 0 008.308 3.776h.497a12.27 12.27 0 004.82-.969c1.094-.426 2.916-1.247 4.804-2.133l.68.279a31.023 31.023 0 0011.71 2.806 12.49 12.49 0 008.335-3.746 12.27 12.27 0 003.492-8.383 14.65 14.65 0 00-.812-4.465 18.27 18.27 0 00-1.557-3.364zm-9.474 17.053a25.207 25.207 0 01-8.746-1.87l.563-.28 1.656-.755c.11-.063.21-.14.298-.23l1.657-.837 1.557-.788c.345-.176.606-.48.726-.846.12-.367.09-.765-.085-1.109a1.47 1.47 0 00-.847-.728 1.486 1.486 0 00-1.12.074l-1.656.787c-2.567 1.297-6.857 3.48-8.663 4.219l-.165.115c-1.375.64-2.65 1.198-3.446 1.51a8.681 8.681 0 01-3.975.738h-.15a9.513 9.513 0 01-6.323-2.858 9.345 9.345 0 01-2.654-6.366.566.566 0 000-.115 9.476 9.476 0 01.663-3.43c.329-.97.756-1.905 1.275-2.79l9.094-15.84c2.468-4.267 5.681-6.565 9.06-6.565 3.38 0 6.626 2.347 9.06 6.565l9.16 15.806c.518.887.945 1.821 1.276 2.79.417 1.15.652 2.358.696 3.579a9.328 9.328 0 01-2.625 6.349 9.496 9.496 0 01-6.287 2.875z">
                                                    </path>
                                                  </svg></span></div>
                                              <p class="txt m-txt_colorWhite u-widthFull" aria-hidden="true">還有200隻符合條件的貓咪等你來認養</p>
                                            </div>
                                            <div class="actionCard-footer">
                                              <div class="actionCard-footer-cta"><span aria-hidden="true">認識牠們</span></div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                                <div class="recommendations m-recommendations_twoRow u-isHidden@minMd">
                                  <div class="recommendations-header u-vr5x">
                                    <div class="tier"><a
                                        href="${pageContext.request.contextPath}/views/catInfo/My_home.jsp"
                                        class="u-displayBlock txt">
                                        <h2 class="txt txt_h1 m-txt_tight m-txt_colorPrimary m-txt_alignCenter">Your
                                          Best Matches</h2>
                                      </a></div>
                                  </div>
                                  <div class="recommendations-body">
                                    <div class="recommendations-body-inner">
                                      <div class="grid grid_gutterLg m-grid_stretch m-grid_centerJustify">
                                        <div class="grid-col grid-col_1/2">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/tiger-54099962/nj/toms-river/calling-all-cats-rescues-nj709/"
                                              class="petCard-link"
                                              aria-label="Tiger, adoptable Cat, Baby Male Domestic Short Hair, Toms River, NJ , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54099962/1/?bust=1641318055&amp;width=316"
                                                  alt="Tiger, adoptable Cat, Baby Male Domestic Short Hair, Toms River, NJ , Good Match."
                                                  class="petCard-media-img lazyload"></div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Tiger</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div class="grid-col grid-col_1/2">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/tootsie-54890323/nj/lambertville/tnr-hunterdon-county-nj-nj944/"
                                              class="petCard-link"
                                              aria-label="TOOTSIE, adoptable Cat, Baby Female Torbie and Domestic Medium Hair Mix, Lambertville, NJ , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54890323/1/?bust=1646670281&amp;width=316"
                                                  alt="TOOTSIE, adoptable Cat, Baby Female Torbie and Domestic Medium Hair Mix, Lambertville, NJ , Good Match."
                                                  class="petCard-media-img lazyload"></div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Tootsie</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                      </div>
                                    </div>
                                    <div class="recommendations-body-inner">
                                      <div class="grid grid_gutterLg m-grid_stretch m-grid_centerJustify">
                                        <div class="grid-col grid-col_1/2">
                                          <div class="petCard"><a
                                              href="https://www.petfinder.com/cat/larry-55062517/ny/woodhaven/crazy-cat-fam-ny1540/"
                                              class="petCard-link"
                                              aria-label="Larry, adoptable Cat, Baby Male Domestic Short Hair, Woodhaven, NY , Good Match.">
                                              <div class="petCard-media"><img
                                                  data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55062517/1/?bust=1647915890&amp;width=316"
                                                  alt="Larry, adoptable Cat, Baby Male Domestic Short Hair, Woodhaven, NY , Good Match."
                                                  class="petCard-media-img lazyload"></div>
                                              <div class="petCard-body">
                                                <div class="petCard-body-details">
                                                  <div class="petCard-body-details-hdg"><span
                                                      aria-hidden="true">Larry</span></div>
                                                </div>
                                              </div>
                                              <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                    </path>
                                                  </svg></div>
                                                <div class="profileMatchFlag-matchType">符合條件</div>
                                              </div>
                                            </a></div>
                                        </div>
                                        <div class="grid-col grid-col_1/2">
                                          <div class="actionCard m-actionCard_overflowVisible">
                                            <div><a class="actionCard-overlay"
                                                href="${pageContext.request.contextPath}/views/catInfo/My_search.jsp"
                                                aria-label="8600 more pets available on Petfinder: Meet them"></a></div>
                                            <div class="actionCard-body actionCard-body_split">
                                              <div class="actionCard-body-icon"><span
                                                  class="m-icon_colorWhite meetThemCard-icon"><svg viewBox="0 0 70 68"
                                                    xmlns="http://www.w3.org/2000/svg">
                                                    <path
                                                      d="M17.26 29.338c0-5.76-3.876-10.439-8.63-10.439C3.876 18.9 0 23.578 0 29.34c0 5.76 3.876 10.422 8.63 10.422 4.754 0 8.63-4.678 8.63-10.423zM8.63 36.84c-3.147 0-5.698-3.365-5.698-7.518 0-4.152 2.55-7.517 5.698-7.517 3.147 0 5.665 3.38 5.665 7.534 0 4.152-2.518 7.5-5.665 7.5zM70 29.322c0-5.745-3.876-10.422-8.63-10.422-4.754 0-8.63 4.677-8.63 10.439a1.448 1.448 0 00.37 1.13 1.474 1.474 0 001.096.485 1.486 1.486 0 001.096-.484 1.457 1.457 0 00.37-1.131c0-4.137 2.55-7.518 5.698-7.518 3.147 0 5.698 3.365 5.698 7.517 0 4.137-2.55 7.502-5.698 7.502a1.48 1.48 0 00-1.042.427 1.454 1.454 0 000 2.066 1.48 1.48 0 001.042.428c4.754 0 8.63-4.678 8.63-10.439zm-24.233-7.944c4.754 0 8.63-4.678 8.63-10.439S50.504.5 45.767.5c-4.738 0-8.63 4.678-8.63 10.439s3.843 10.439 8.63 10.439zm0-17.956c3.147 0 5.698 3.364 5.698 7.517 0 4.153-2.584 7.517-5.698 7.517-3.114 0-5.698-3.364-5.698-7.517 0-4.153 2.534-7.517 5.698-7.517zM24.233 21.378c4.754 0 8.63-4.678 8.63-10.439S29.02.5 24.233.5c-4.787 0-8.63 4.678-8.63 10.439s3.893 10.439 8.63 10.439zm0-17.956c3.148 0 5.698 3.364 5.698 7.517 0 4.153-2.534 7.517-5.698 7.517-3.163 0-5.698-3.364-5.698-7.517 0-4.153 2.584-7.517 5.698-7.517zm31.472 44.103l-9.11-15.806c-3.015-5.204-7.14-8.076-11.595-8.076-4.456 0-8.58 2.872-11.595 8.075l-9.11 15.79a18.17 18.17 0 00-1.49 3.283 12.275 12.275 0 00-.83 4.547 12.252 12.252 0 003.453 8.386 12.473 12.473 0 008.308 3.776h.497a12.27 12.27 0 004.82-.969c1.094-.426 2.916-1.247 4.804-2.133l.68.279a31.023 31.023 0 0011.71 2.806 12.49 12.49 0 008.335-3.746 12.27 12.27 0 003.492-8.383 14.65 14.65 0 00-.812-4.465 18.27 18.27 0 00-1.557-3.364zm-9.474 17.053a25.207 25.207 0 01-8.746-1.87l.563-.28 1.656-.755c.11-.063.21-.14.298-.23l1.657-.837 1.557-.788c.345-.176.606-.48.726-.846.12-.367.09-.765-.085-1.109a1.47 1.47 0 00-.847-.728 1.486 1.486 0 00-1.12.074l-1.656.787c-2.567 1.297-6.857 3.48-8.663 4.219l-.165.115c-1.375.64-2.65 1.198-3.446 1.51a8.681 8.681 0 01-3.975.738h-.15a9.513 9.513 0 01-6.323-2.858 9.345 9.345 0 01-2.654-6.366.566.566 0 000-.115 9.476 9.476 0 01.663-3.43c.329-.97.756-1.905 1.275-2.79l9.094-15.84c2.468-4.267 5.681-6.565 9.06-6.565 3.38 0 6.626 2.347 9.06 6.565l9.16 15.806c.518.887.945 1.821 1.276 2.79.417 1.15.652 2.358.696 3.579a9.328 9.328 0 01-2.625 6.349 9.496 9.496 0 01-6.287 2.875z">
                                                    </path>
                                                  </svg></span></div>
                                              <p class="txt m-txt_colorWhite u-widthFull" aria-hidden="true">8600 more
                                                pets available on Petfinder</p>
                                            </div>
                                            <div class="actionCard-footer">
                                              <div class="actionCard-footer-cta"><span aria-hidden="true">Meet
                                                  them</span></div>
                                            </div>
                                          </div>
                                        </div>
                                      </div>
                                    </div>
                                  </div>
                                </div>
                              </section>

                            </div>
                          </div>

                        </div>
                      </div>
                    </div>
                    <!--已儲存的搜尋條件-->
                    <div class="field__item">
                      <div class="paragraph paragraph--type--block-embed paragraph--view-mode--default">
                        <div class="layout--wrapper">

                          <div
                            class="field field--name-field-block-embed field--type-block-field field--label-hidden field__item">
                            <div id="block-savedsearchshelf"
                              class="block block-consumer-blocks block-saved-search-shelf">



                              <section id="saved-search-shelf">
                                <h1 class="savedSearch-hd txt txt_h1 m-txt_tight m-txt_colorPrimary m-txt_alignCenter">
                                  已儲存的搜尋條件</h1>
                                <div class="savedSearch-bd">
                                  <!--第一個搜尋條件-->
                                  <a class="savedSearchOne txt" href="/search/?saved_search=5ed47179-4e1b-46ba-80e3-3a1884162a45">
                                    <div class="savedSearchOne-icon"><svg viewBox="0 0 104 104"
                                      xmlns="http://www.w3.org/2000/svg">
                                      <path
                                      d="M81.831 66.95c.399-.805 1.395-1.006 2.193-.503C88.409 69.362 91 74.188 91 79.517 91 88.063 84.123 95 75.652 95H18.545a1.581 1.581 0 01-1.594-1.609V89.17c0-2.514 1.993-4.525 4.485-4.525h.697c.598 0 .897 0 .897-1.307v-29.76c-3.986-1.206-8.471-3.92-10.564-9.65-.1-.202-.997-2.514 0-4.626.399-.905 1.096-1.608 1.894-2.111.199-2.514.996-9.15 5.88-13.673.398-.402 2.59-2.614 6.777-4.324L25.62 12.86c-.1-.502 0-1.005.3-1.407.298-.402.797-.603 1.295-.603.2 0 3.488.1 6.777 2.01l.598-2.614c.2-.804 1.096-1.407 1.894-1.206.01.004.03.01.059.017.747.21 7.395 2.07 12.1 14.662 3.687 3.82 5.68 8.747 5.68 14.075a20.242 20.242 0 01-5.481 13.875c.299 2.815 2.69 5.027 5.58 5.027h.599c9.667 0 17.54 7.942 17.54 17.694v9.451c0 .905-.697 1.609-1.594 1.609a1.581 1.581 0 01-1.595-1.609v-9.45c0-7.943-6.378-14.378-14.252-14.378h-.598c-4.883 0-8.87-4.021-8.87-8.948 0-.502.2-1.005.599-1.307v-.1a17.067 17.067 0 004.783-11.864c0-4.524-1.794-8.847-4.983-12.064-.1 0-.1-.101-.1-.101l-.1-.1c-.099-.101-.198-.302-.198-.302v-.1c-2.89-7.943-6.479-11.06-8.372-12.267l-.698 3.017c-.299.905-1.096 1.407-1.993 1.206-.2 0-.399-.1-.498-.603-.043 0-.067 0-.089-.008-.029-.01-.053-.035-.11-.093-1.595-1.206-3.29-1.91-4.585-2.212l1.196 5.43v.904c-.057.058-.082.083-.092.112-.008.022-.008.047-.008.09-.1 0-.1.1-.1.1l-.398.402s0 .1-.1.1c0 .101-.1.101-.1.101-.1.1-.199.1-.199.1h-.1c-4.584 1.509-6.876 4.022-6.876 4.022l-.1.1c-4.83 4.575-4.785 12.1-4.784 12.361v.006c0 .603-.498 1.307-1.096 1.508-.797.302-.996.604-1.096.905-.399.805-.1 1.91 0 2.212 3.02 8.354 11.946 8.253 12.717 8.245h.04c.897 0 1.694.703 1.694 1.608.1.905-.598 1.71-1.495 1.71h-.498c-.499 0-.997 0-1.595-.102v29.157c0 1.307-.399 4.424-3.986 4.524h-.897c-.698 0-1.296.603-1.296 1.307v2.614h55.612c6.677 0 12.159-5.53 12.159-12.266 0-4.122-2.093-7.942-5.582-10.255-.797-.402-.996-1.407-.498-2.211z"
                                      fill="currentColor"></path>
                                      <path
                                      d="M26.02 33.872a2.202 2.202 0 01-2.192 2.212 2.202 2.202 0 01-2.193-2.212c0-1.221.981-2.212 2.192-2.212 1.211 0 2.193.99 2.193 2.212zM29.708 38.195c.199.805.797 1.307 1.594 1.307h.3l10.862-2.111c.897-.201 1.495-1.005 1.296-1.91-.2-.905-.997-1.508-1.894-1.307l-10.863 2.111c-.897.201-1.495 1.006-1.295 1.91zM41.866 47.143h.3c.797 0 1.395-.502 1.594-1.407.1-.905-.399-1.71-1.296-1.91l-10.863-2.112c-.897-.1-1.694.402-1.893 1.307-.1.905.398 1.71 1.295 1.91l10.863 2.212z"
                                      fill="currentColor"></path>
                                    </svg></div>
                                    <div class="savedSearchOne-content">
                                      <div class="savedSearchOne-hd m-txt_colorPrimary m-txt_bold">在台北市中山區附近 <svg viewBox="0 0 9 15" xmlns="http://www.w3.org/2000/svg">
                                        <path
                                        d="M8.45 8.882a2.009 2.009 0 000-2.764L3.423 1.1C2.634.31 1.39.31.657 1.043L.6 1.099c-.79.79-.79 2.03-.056 2.764l3.67 3.665L.6 11.081c-.79.79-.79 2.03-.056 2.763l.056.057c.79.79 2.033.79 2.767.056L8.45 8.882z"
                                        fill="currentColor"></path>
                                      </svg></div>
                                      <div class="savedSearchOne-bd m-txt_lg"> 三花貓</div>
                                    </div>
                                  </a>
                                  <!--第2個搜尋條件-->
                                  <a class="savedSearchOne txt" href="/search/?saved_search=0f5f3e82-39e7-45a9-8d70-9a194e29cdc8">
                                    <div class="savedSearchOne-icon"><svg viewBox="0 0 104 104"
                                        xmlns="http://www.w3.org/2000/svg">
                                        <path
                                          d="M81.831 66.95c.399-.805 1.395-1.006 2.193-.503C88.409 69.362 91 74.188 91 79.517 91 88.063 84.123 95 75.652 95H18.545a1.581 1.581 0 01-1.594-1.609V89.17c0-2.514 1.993-4.525 4.485-4.525h.697c.598 0 .897 0 .897-1.307v-29.76c-3.986-1.206-8.471-3.92-10.564-9.65-.1-.202-.997-2.514 0-4.626.399-.905 1.096-1.608 1.894-2.111.199-2.514.996-9.15 5.88-13.673.398-.402 2.59-2.614 6.777-4.324L25.62 12.86c-.1-.502 0-1.005.3-1.407.298-.402.797-.603 1.295-.603.2 0 3.488.1 6.777 2.01l.598-2.614c.2-.804 1.096-1.407 1.894-1.206.01.004.03.01.059.017.747.21 7.395 2.07 12.1 14.662 3.687 3.82 5.68 8.747 5.68 14.075a20.242 20.242 0 01-5.481 13.875c.299 2.815 2.69 5.027 5.58 5.027h.599c9.667 0 17.54 7.942 17.54 17.694v9.451c0 .905-.697 1.609-1.594 1.609a1.581 1.581 0 01-1.595-1.609v-9.45c0-7.943-6.378-14.378-14.252-14.378h-.598c-4.883 0-8.87-4.021-8.87-8.948 0-.502.2-1.005.599-1.307v-.1a17.067 17.067 0 004.783-11.864c0-4.524-1.794-8.847-4.983-12.064-.1 0-.1-.101-.1-.101l-.1-.1c-.099-.101-.198-.302-.198-.302v-.1c-2.89-7.943-6.479-11.06-8.372-12.267l-.698 3.017c-.299.905-1.096 1.407-1.993 1.206-.2 0-.399-.1-.498-.603-.043 0-.067 0-.089-.008-.029-.01-.053-.035-.11-.093-1.595-1.206-3.29-1.91-4.585-2.212l1.196 5.43v.904c-.057.058-.082.083-.092.112-.008.022-.008.047-.008.09-.1 0-.1.1-.1.1l-.398.402s0 .1-.1.1c0 .101-.1.101-.1.101-.1.1-.199.1-.199.1h-.1c-4.584 1.509-6.876 4.022-6.876 4.022l-.1.1c-4.83 4.575-4.785 12.1-4.784 12.361v.006c0 .603-.498 1.307-1.096 1.508-.797.302-.996.604-1.096.905-.399.805-.1 1.91 0 2.212 3.02 8.354 11.946 8.253 12.717 8.245h.04c.897 0 1.694.703 1.694 1.608.1.905-.598 1.71-1.495 1.71h-.498c-.499 0-.997 0-1.595-.102v29.157c0 1.307-.399 4.424-3.986 4.524h-.897c-.698 0-1.296.603-1.296 1.307v2.614h55.612c6.677 0 12.159-5.53 12.159-12.266 0-4.122-2.093-7.942-5.582-10.255-.797-.402-.996-1.407-.498-2.211z"
                                          fill="currentColor"></path>
                                        <path
                                          d="M26.02 33.872a2.202 2.202 0 01-2.192 2.212 2.202 2.202 0 01-2.193-2.212c0-1.221.981-2.212 2.192-2.212 1.211 0 2.193.99 2.193 2.212zM29.708 38.195c.199.805.797 1.307 1.594 1.307h.3l10.862-2.111c.897-.201 1.495-1.005 1.296-1.91-.2-.905-.997-1.508-1.894-1.307l-10.863 2.111c-.897.201-1.495 1.006-1.295 1.91zM41.866 47.143h.3c.797 0 1.395-.502 1.594-1.407.1-.905-.399-1.71-1.296-1.91l-10.863-2.112c-.897-.1-1.694.402-1.893 1.307-.1.905.398 1.71 1.295 1.91l10.863 2.212z"
                                          fill="currentColor"></path>
                                      </svg></div>
                                    <div class="savedSearchOne-content">
                                      <div class="savedSearchOne-hd m-txt_colorPrimary m-txt_bold">在台北市中正區附近 <svg viewBox="0 0 9 15" xmlns="http://www.w3.org/2000/svg">
                                          <path
                                            d="M8.45 8.882a2.009 2.009 0 000-2.764L3.423 1.1C2.634.31 1.39.31.657 1.043L.6 1.099c-.79.79-.79 2.03-.056 2.764l3.67 3.665L.6 11.081c-.79.79-.79 2.03-.056 2.763l.056.057c.79.79 2.033.79 2.767.056L8.45 8.882z"
                                            fill="currentColor"></path>
                                        </svg></div>
                                      <div class="savedSearchOne-bd m-txt_lg"> 虎斑貓</div>
                                    </div>
                                  </a>
                                </div>
                                <!--查看所用儲存條件-->
                                <div class="savedSearch-ft"><a class="btn btn_clearBorderPrimary m-btn_full@maxMd"
                                    href="/user/search-alerts/">查看所用儲存條件</a></div>
                              </section>

                            </div>
                          </div>

                        </div>
                      </div>
                    </div>
                    <!--先留著-->
                    <div class="field__item">
                    </div>
                    <!--過去看過的貓咪-->
                    <div class="field__item">
                      <div class="paragraph paragraph--type--section paragraph--view-mode--default">
                        <div class="layout--wrapper">
                          <div class="layout layout--twocol">
                            <div class="layout__region layout__region--top">
                              <div class="paragraph paragraph--type--block-embed paragraph--view-mode--default">
                                <div class="layout--wrapper">

                                  <div
                                    class="field field--name-field-block-embed field--type-block-field field--label-hidden field__item">
                                    <div id="block-recentpetsshelf"
                                      class="block block-consumer-blocks block-recent-pets">



                                      <section id="recent-pets">
                                        <div class="recommendations m-recommendations_singleRow u-isHidden@maxMd">
                                          <div class="recommendations-header u-vr5x">
                                            <div class="tier"><a
                                                href="https://www.petfinder.com/search/pets-for-adoption/us/new-jersey/?pet_id=54792668,55215282,55244733,55209397,55153801"
                                                class="u-displayBlock txt">
                                                <h2 class="txt txt_h1 m-txt_tight m-txt_colorPrimary m-txt_alignCenter">
                                                  過去看過的貓咪</h2>
                                              </a></div>
                                          </div>
                                          <div class="recommendations-body">
                                            <div class="recommendations-body-inner">
                                              <div class="grid grid_gutterLg m-grid_stretch m-grid_centerJustify">
                                                <div
                                                  class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/morgan-le-frey-54792668/pa/philadelphia/kitten-snatchers-pa1153/"
                                                      class="petCard-link"
                                                      aria-label="Morgan Le Frey, adoptable Cat, Baby Female Domestic Medium Hair, Philadelphia, PA , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54792668/3/?bust=1648069024&amp;width=316"
                                                          alt="Morgan Le Frey, adoptable Cat, Baby Female Domestic Medium Hair, Philadelphia, PA , Good Match."
                                                          class="petCard-media-img ls-is-cached lazyloaded"
                                                          src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54792668/3/?bust=1648069024&amp;width=316">
                                                      </div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Morgan Le Frey</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div
                                                  class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/elliot-55215282/pa/chalfont/a-better-life-pa1144/"
                                                      class="petCard-link"
                                                      aria-label="Elliot, adoptable Cat, Baby Male Domestic Short Hair, Chalfont, PA , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55215282/1/?bust=1649179581&amp;width=316"
                                                          alt="Elliot, adoptable Cat, Baby Male Domestic Short Hair, Chalfont, PA , Good Match."
                                                          class="petCard-media-img ls-is-cached lazyloaded"
                                                          src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55215282/1/?bust=1649179581&amp;width=316">
                                                      </div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Elliot</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div
                                                  class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/echo-55244733/gu/mangilao/guam-animals-in-need-gu01/"
                                                      class="petCard-link"
                                                      aria-label="Echo, adoptable Cat, Baby Male Domestic Short Hair, Mangilao, GU , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55244733/1/?bust=1649412742&amp;width=316"
                                                          alt="Echo, adoptable Cat, Baby Male Domestic Short Hair, Mangilao, GU , Good Match."
                                                          class="petCard-media-img ls-is-cached lazyloaded"
                                                          src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55244733/1/?bust=1649412742&amp;width=316">
                                                      </div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Echo</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div
                                                  class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/connor-55209397/ct/new-haven/the-greater-new-haven-cat-project-inc-ct167/"
                                                      class="petCard-link"
                                                      aria-label="Connor, adoptable Cat, Baby Male Domestic Short Hair, New Haven, CT , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55209397/1/?bust=1649127052&amp;width=316"
                                                          alt="Connor, adoptable Cat, Baby Male Domestic Short Hair, New Haven, CT , Good Match."
                                                          class="petCard-media-img ls-is-cached lazyloaded"
                                                          src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55209397/1/?bust=1649127052&amp;width=316">
                                                      </div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Connor</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div
                                                  class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/captain-bee-55153801/ny/new-york/bideawee-ny479/"
                                                      class="petCard-link"
                                                      aria-label="Captain Bee, adoptable Cat, Adult Male Domestic Short Hair, New York, NY , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55153801/1/?bust=1649195124&amp;width=316"
                                                          alt="Captain Bee, adoptable Cat, Adult Male Domestic Short Hair, New York, NY , Good Match."
                                                          class="petCard-media-img lazyload"></div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Captain Bee</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div
                                                  class="grid-col grid-col_1/4 grid-col_1/3@minMd grid-col_1/4@minLg grid-col_1/5@minXl ">
                                                  <div class="actionCard m-actionCard_overflowVisible">
                                                    <div><a class="actionCard-overlay"
                                                        href="https://www.petfinder.com/search/pets-for-adoption/us/new-jersey/?pet_id=54792668,55215282,55244733,55209397,55153801"
                                                        aria-label="5 more pets available on Petfinder: View them"></a>
                                                    </div>
                                                    <div class="actionCard-body actionCard-body_split">
                                                      <div class="actionCard-body-icon"><span
                                                          class="m-icon_colorWhite meetThemCard-icon"><svg
                                                            viewBox="0 0 70 68" xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M17.26 29.338c0-5.76-3.876-10.439-8.63-10.439C3.876 18.9 0 23.578 0 29.34c0 5.76 3.876 10.422 8.63 10.422 4.754 0 8.63-4.678 8.63-10.423zM8.63 36.84c-3.147 0-5.698-3.365-5.698-7.518 0-4.152 2.55-7.517 5.698-7.517 3.147 0 5.665 3.38 5.665 7.534 0 4.152-2.518 7.5-5.665 7.5zM70 29.322c0-5.745-3.876-10.422-8.63-10.422-4.754 0-8.63 4.677-8.63 10.439a1.448 1.448 0 00.37 1.13 1.474 1.474 0 001.096.485 1.486 1.486 0 001.096-.484 1.457 1.457 0 00.37-1.131c0-4.137 2.55-7.518 5.698-7.518 3.147 0 5.698 3.365 5.698 7.517 0 4.137-2.55 7.502-5.698 7.502a1.48 1.48 0 00-1.042.427 1.454 1.454 0 000 2.066 1.48 1.48 0 001.042.428c4.754 0 8.63-4.678 8.63-10.439zm-24.233-7.944c4.754 0 8.63-4.678 8.63-10.439S50.504.5 45.767.5c-4.738 0-8.63 4.678-8.63 10.439s3.843 10.439 8.63 10.439zm0-17.956c3.147 0 5.698 3.364 5.698 7.517 0 4.153-2.584 7.517-5.698 7.517-3.114 0-5.698-3.364-5.698-7.517 0-4.153 2.534-7.517 5.698-7.517zM24.233 21.378c4.754 0 8.63-4.678 8.63-10.439S29.02.5 24.233.5c-4.787 0-8.63 4.678-8.63 10.439s3.893 10.439 8.63 10.439zm0-17.956c3.148 0 5.698 3.364 5.698 7.517 0 4.153-2.534 7.517-5.698 7.517-3.163 0-5.698-3.364-5.698-7.517 0-4.153 2.584-7.517 5.698-7.517zm31.472 44.103l-9.11-15.806c-3.015-5.204-7.14-8.076-11.595-8.076-4.456 0-8.58 2.872-11.595 8.075l-9.11 15.79a18.17 18.17 0 00-1.49 3.283 12.275 12.275 0 00-.83 4.547 12.252 12.252 0 003.453 8.386 12.473 12.473 0 008.308 3.776h.497a12.27 12.27 0 004.82-.969c1.094-.426 2.916-1.247 4.804-2.133l.68.279a31.023 31.023 0 0011.71 2.806 12.49 12.49 0 008.335-3.746 12.27 12.27 0 003.492-8.383 14.65 14.65 0 00-.812-4.465 18.27 18.27 0 00-1.557-3.364zm-9.474 17.053a25.207 25.207 0 01-8.746-1.87l.563-.28 1.656-.755c.11-.063.21-.14.298-.23l1.657-.837 1.557-.788c.345-.176.606-.48.726-.846.12-.367.09-.765-.085-1.109a1.47 1.47 0 00-.847-.728 1.486 1.486 0 00-1.12.074l-1.656.787c-2.567 1.297-6.857 3.48-8.663 4.219l-.165.115c-1.375.64-2.65 1.198-3.446 1.51a8.681 8.681 0 01-3.975.738h-.15a9.513 9.513 0 01-6.323-2.858 9.345 9.345 0 01-2.654-6.366.566.566 0 000-.115 9.476 9.476 0 01.663-3.43c.329-.97.756-1.905 1.275-2.79l9.094-15.84c2.468-4.267 5.681-6.565 9.06-6.565 3.38 0 6.626 2.347 9.06 6.565l9.16 15.806c.518.887.945 1.821 1.276 2.79.417 1.15.652 2.358.696 3.579a9.328 9.328 0 01-2.625 6.349 9.496 9.496 0 01-6.287 2.875z">
                                                            </path>
                                                          </svg></span></div>
                                                      <p class="txt m-txt_colorWhite u-widthFull" aria-hidden="true">還有5隻還沒有被認養</p>
                                                    </div>
                                                    <div class="actionCard-footer">
                                                      <div class="actionCard-footer-cta"><span aria-hidden="true">看看牠們</span></div>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                        <div class="recommendations m-recommendations_twoRow u-isHidden@minMd">
                                          <div class="recommendations-header u-vr5x">
                                            <div class="tier"><a
                                                href="https://www.petfinder.com/search/pets-for-adoption/us/new-jersey/?pet_id=54792668,55215282,55244733,55209397,55153801"
                                                class="u-displayBlock txt">
                                                <h2 class="txt txt_h1 m-txt_tight m-txt_colorPrimary m-txt_alignCenter">
                                                  Recently Viewed Pets</h2>
                                              </a></div>
                                          </div>
                                          <div class="recommendations-body">
                                            <div class="recommendations-body-inner">
                                              <div class="grid grid_gutterLg m-grid_stretch m-grid_centerJustify">
                                                <div class="grid-col grid-col_1/2">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/morgan-le-frey-54792668/pa/philadelphia/kitten-snatchers-pa1153/"
                                                      class="petCard-link"
                                                      aria-label="Morgan Le Frey, adoptable Cat, Baby Female Domestic Medium Hair, Philadelphia, PA , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/54792668/3/?bust=1648069024&amp;width=316"
                                                          alt="Morgan Le Frey, adoptable Cat, Baby Female Domestic Medium Hair, Philadelphia, PA , Good Match."
                                                          class="petCard-media-img lazyload"></div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Morgan Le Frey</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div class="grid-col grid-col_1/2">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/elliot-55215282/pa/chalfont/a-better-life-pa1144/"
                                                      class="petCard-link"
                                                      aria-label="Elliot, adoptable Cat, Baby Male Domestic Short Hair, Chalfont, PA , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55215282/1/?bust=1649179581&amp;width=316"
                                                          alt="Elliot, adoptable Cat, Baby Male Domestic Short Hair, Chalfont, PA , Good Match."
                                                          class="petCard-media-img lazyload"></div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Elliot</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                              </div>
                                            </div>
                                            <div class="recommendations-body-inner">
                                              <div class="grid grid_gutterLg m-grid_stretch m-grid_centerJustify">
                                                <div class="grid-col grid-col_1/2">
                                                  <div class="petCard"><a
                                                      href="https://www.petfinder.com/cat/echo-55244733/gu/mangilao/guam-animals-in-need-gu01/"
                                                      class="petCard-link"
                                                      aria-label="Echo, adoptable Cat, Baby Male Domestic Short Hair, Mangilao, GU , Good Match.">
                                                      <div class="petCard-media"><img
                                                          data-src="https://dl5zpyw5k3jeb.cloudfront.net/photos/pets/55244733/1/?bust=1649412742&amp;width=316"
                                                          alt="Echo, adoptable Cat, Baby Male Domestic Short Hair, Mangilao, GU , Good Match."
                                                          class="petCard-media-img lazyload"></div>
                                                      <div class="petCard-body">
                                                        <div class="petCard-body-details">
                                                          <div class="petCard-body-details-hdg"><span
                                                              aria-hidden="true">Echo</span></div>
                                                        </div>
                                                      </div>
                                                      <div class="profileMatchFlag profileMatchFlag_goodMatch ">
                                                        <div class="profileMatchFlag-icon"><svg viewBox="0 0 15 10"
                                                            xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M14.422 2.2L7.458 9.333c-.876.89-2.294.89-3.17 0L.954 5.976a.924.924 0 010-1.29l.633-.644a.888.888 0 011.268 0l2.674 2.72a.448.448 0 00.634 0L12.529.266a.888.888 0 011.268 0l.633.645c.35.356.35.932 0 1.289h-.008z">
                                                            </path>
                                                          </svg></div>
                                                        <div class="profileMatchFlag-matchType">符合條件</div>
                                                      </div>
                                                    </a></div>
                                                </div>
                                                <div class="grid-col grid-col_1/2">
                                                  <div class="actionCard m-actionCard_overflowVisible">
                                                    <div><a class="actionCard-overlay"
                                                        href="https://www.petfinder.com/search/pets-for-adoption/us/new-jersey/?pet_id=54792668,55215282,55244733,55209397,55153801"
                                                        aria-label="5 more pets available on Petfinder: View them"></a>
                                                    </div>
                                                    <div class="actionCard-body actionCard-body_split">
                                                      <div class="actionCard-body-icon"><span
                                                          class="m-icon_colorWhite meetThemCard-icon"><svg
                                                            viewBox="0 0 70 68" xmlns="http://www.w3.org/2000/svg">
                                                            <path
                                                              d="M17.26 29.338c0-5.76-3.876-10.439-8.63-10.439C3.876 18.9 0 23.578 0 29.34c0 5.76 3.876 10.422 8.63 10.422 4.754 0 8.63-4.678 8.63-10.423zM8.63 36.84c-3.147 0-5.698-3.365-5.698-7.518 0-4.152 2.55-7.517 5.698-7.517 3.147 0 5.665 3.38 5.665 7.534 0 4.152-2.518 7.5-5.665 7.5zM70 29.322c0-5.745-3.876-10.422-8.63-10.422-4.754 0-8.63 4.677-8.63 10.439a1.448 1.448 0 00.37 1.13 1.474 1.474 0 001.096.485 1.486 1.486 0 001.096-.484 1.457 1.457 0 00.37-1.131c0-4.137 2.55-7.518 5.698-7.518 3.147 0 5.698 3.365 5.698 7.517 0 4.137-2.55 7.502-5.698 7.502a1.48 1.48 0 00-1.042.427 1.454 1.454 0 000 2.066 1.48 1.48 0 001.042.428c4.754 0 8.63-4.678 8.63-10.439zm-24.233-7.944c4.754 0 8.63-4.678 8.63-10.439S50.504.5 45.767.5c-4.738 0-8.63 4.678-8.63 10.439s3.843 10.439 8.63 10.439zm0-17.956c3.147 0 5.698 3.364 5.698 7.517 0 4.153-2.584 7.517-5.698 7.517-3.114 0-5.698-3.364-5.698-7.517 0-4.153 2.534-7.517 5.698-7.517zM24.233 21.378c4.754 0 8.63-4.678 8.63-10.439S29.02.5 24.233.5c-4.787 0-8.63 4.678-8.63 10.439s3.893 10.439 8.63 10.439zm0-17.956c3.148 0 5.698 3.364 5.698 7.517 0 4.153-2.534 7.517-5.698 7.517-3.163 0-5.698-3.364-5.698-7.517 0-4.153 2.584-7.517 5.698-7.517zm31.472 44.103l-9.11-15.806c-3.015-5.204-7.14-8.076-11.595-8.076-4.456 0-8.58 2.872-11.595 8.075l-9.11 15.79a18.17 18.17 0 00-1.49 3.283 12.275 12.275 0 00-.83 4.547 12.252 12.252 0 003.453 8.386 12.473 12.473 0 008.308 3.776h.497a12.27 12.27 0 004.82-.969c1.094-.426 2.916-1.247 4.804-2.133l.68.279a31.023 31.023 0 0011.71 2.806 12.49 12.49 0 008.335-3.746 12.27 12.27 0 003.492-8.383 14.65 14.65 0 00-.812-4.465 18.27 18.27 0 00-1.557-3.364zm-9.474 17.053a25.207 25.207 0 01-8.746-1.87l.563-.28 1.656-.755c.11-.063.21-.14.298-.23l1.657-.837 1.557-.788c.345-.176.606-.48.726-.846.12-.367.09-.765-.085-1.109a1.47 1.47 0 00-.847-.728 1.486 1.486 0 00-1.12.074l-1.656.787c-2.567 1.297-6.857 3.48-8.663 4.219l-.165.115c-1.375.64-2.65 1.198-3.446 1.51a8.681 8.681 0 01-3.975.738h-.15a9.513 9.513 0 01-6.323-2.858 9.345 9.345 0 01-2.654-6.366.566.566 0 000-.115 9.476 9.476 0 01.663-3.43c.329-.97.756-1.905 1.275-2.79l9.094-15.84c2.468-4.267 5.681-6.565 9.06-6.565 3.38 0 6.626 2.347 9.06 6.565l9.16 15.806c.518.887.945 1.821 1.276 2.79.417 1.15.652 2.358.696 3.579a9.328 9.328 0 01-2.625 6.349 9.496 9.496 0 01-6.287 2.875z">
                                                            </path>
                                                          </svg></span></div>
                                                      <p class="txt m-txt_colorWhite u-widthFull" aria-hidden="true">還有5隻還沒有被認養</p>
                                                    </div>
                                                    <div class="actionCard-footer">
                                                      <div class="actionCard-footer-cta"><span aria-hidden="true">看看牠們</span></div>
                                                    </div>
                                                  </div>
                                                </div>
                                              </div>
                                            </div>
                                          </div>
                                        </div>
                                      </section>

                                    </div>
                                  </div>

                                </div>
                              </div>

                            </div>



                          </div>

                        </div>
                      </div>
                    </div>
                  </div>



                </div>

              </article>

            </div>

          </div>

        </div>
      </main>


  <!--這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer-->
    <footer role="contentinfo">
      <div class="footer-inner">
        <!--這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容這是內容-->
        <div class="footer-content">

          <!--左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊左邊資訊-->
          <div class="region region-footer-left">
            <nav role="navigation" aria-labelledby="block-footermenu-menu" id="block-footermenu" class="block block-menu navigation menu--footer">
              
              <svg id="logo-consumer" width="132" height="48" viewBox="0 0 132 48" fill="white" xmlns="http://www.w3.org/2000/svg">
                <path d="M11.0489 17.376L8.71288 26.56C8.69154 26.624 8.70221 26.688 8.74487 26.752C8.80888 26.7947 8.87288 26.816 8.93688 26.816H13.2249C13.2889 26.816 13.3422 26.7947 13.3849 26.752C13.4489 26.688 13.4702 26.624 13.4489 26.56L11.1129 17.376C11.1129 17.3547 11.1022 17.344 11.0809 17.344C11.0595 17.344 11.0489 17.3547 11.0489 17.376ZM2.50488 36C2.05688 36 1.69421 35.8187 1.41688 35.456C1.16088 35.0933 1.10754 34.6987 1.25688 34.272L7.72088 14.368C7.89154 13.856 8.19021 13.44 8.61688 13.12C9.06488 12.8 9.55554 12.64 10.0889 12.64H12.2009C12.7555 12.64 13.2569 12.8 13.7049 13.12C14.1529 13.44 14.4515 13.856 14.6009 14.368L21.0329 34.272C21.1822 34.6987 21.1182 35.0933 20.8409 35.456C20.5849 35.8187 20.2329 36 19.7849 36H17.6409C17.1075 36 16.6275 35.84 16.2009 35.52C15.7742 35.1787 15.4969 34.752 15.3689 34.24L14.6009 31.2C14.5795 31.0293 14.4729 30.944 14.2809 30.944H7.88088C7.71021 30.944 7.60354 31.0293 7.56088 31.2L6.79288 34.24C6.66488 34.752 6.38754 35.1787 5.96088 35.52C5.53421 35.84 5.05421 36 4.52087 36H2.50488ZM30.6424 22.88C28.509 22.88 27.4424 24.48 27.4424 27.68C27.4424 29.3013 27.7304 30.5067 28.3064 31.296C28.8824 32.0853 29.661 32.48 30.6424 32.48C31.4957 32.48 32.2424 32.192 32.8824 31.616C33.5224 31.04 33.8424 30.3893 33.8424 29.664V25.696C33.8424 24.9707 33.5224 24.32 32.8824 23.744C32.2424 23.168 31.4957 22.88 30.6424 22.88ZM28.8824 36.32C26.9837 36.32 25.4264 35.5627 24.2104 34.048C22.9944 32.512 22.3864 30.3893 22.3864 27.68C22.3864 24.9067 22.973 22.7733 24.1464 21.28C25.3197 19.7867 26.8984 19.04 28.8824 19.04C30.6317 19.04 32.221 19.6907 33.6504 20.992C33.6717 21.0133 33.693 21.024 33.7144 21.024C33.7357 21.024 33.7464 21.0133 33.7464 20.992V13.824C33.7464 13.3333 33.917 12.9067 34.2584 12.544C34.621 12.1813 35.0477 12 35.5384 12H37.1064C37.597 12 38.013 12.1813 38.3544 12.544C38.717 12.9067 38.8984 13.3333 38.8984 13.824V34.176C38.8984 34.6667 38.717 35.0933 38.3544 35.456C38.013 35.8187 37.597 36 37.1064 36H35.8904C35.3784 36 34.941 35.8293 34.5784 35.488C34.237 35.1253 34.0557 34.688 34.0344 34.176V33.92C34.0344 33.8987 34.0237 33.888 34.0024 33.888L33.9384 33.952C32.5944 35.5307 30.909 36.32 28.8824 36.32ZM52.9159 23.84C52.4039 23.0507 51.6145 22.656 50.5479 22.656C49.4812 22.656 48.6812 23.0507 48.1479 23.84C47.6359 24.6293 47.3799 25.9093 47.3799 27.68C47.3799 29.4507 47.6359 30.7307 48.1479 31.52C48.6812 32.3093 49.4812 32.704 50.5479 32.704C51.6145 32.704 52.4039 32.3093 52.9159 31.52C53.4492 30.7307 53.7159 29.4507 53.7159 27.68C53.7159 25.9093 53.4492 24.6293 52.9159 23.84ZM56.7239 34.048C55.2519 35.5627 53.1932 36.32 50.5479 36.32C47.9025 36.32 45.8439 35.5627 44.3719 34.048C42.8999 32.5333 42.1639 30.4107 42.1639 27.68C42.1639 24.9493 42.8999 22.8267 44.3719 21.312C45.8439 19.7973 47.9025 19.04 50.5479 19.04C53.1932 19.04 55.2519 19.7973 56.7239 21.312C58.1959 22.8267 58.9319 24.9493 58.9319 27.68C58.9319 30.4107 58.1959 32.5333 56.7239 34.048ZM67.0899 25.696V29.664C67.0899 30.368 67.4099 31.0187 68.0499 31.616C68.7112 32.192 69.4579 32.48 70.2899 32.48C71.2712 32.48 72.0499 32.0853 72.6259 31.296C73.2019 30.4853 73.4899 29.28 73.4899 27.68C73.4899 24.48 72.4232 22.88 70.2899 22.88C69.4579 22.88 68.7112 23.1787 68.0499 23.776C67.4099 24.352 67.0899 24.992 67.0899 25.696ZM63.8579 43.04C63.3672 43.04 62.9405 42.8587 62.5779 42.496C62.2152 42.1333 62.0339 41.7067 62.0339 41.216V21.184C62.0339 20.6933 62.2152 20.2667 62.5779 19.904C62.9405 19.5413 63.3672 19.36 63.8579 19.36H65.1379C65.6499 19.36 66.0872 19.5413 66.4499 19.904C66.8125 20.2453 67.0045 20.672 67.0259 21.184V21.44C67.0259 21.4613 67.0365 21.472 67.0579 21.472L67.1219 21.408C68.4872 19.8293 70.1299 19.04 72.0499 19.04C74.0339 19.04 75.6125 19.7867 76.7859 21.28C77.9805 22.7733 78.5779 24.9067 78.5779 27.68C78.5779 30.368 77.9592 32.48 76.7219 34.016C75.5059 35.552 73.9485 36.32 72.0499 36.32C70.2792 36.32 68.7005 35.6693 67.3139 34.368C67.2925 34.3467 67.2712 34.336 67.2499 34.336C67.2285 34.336 67.2179 34.3467 67.2179 34.368V41.216C67.2179 41.7067 67.0365 42.1333 66.6739 42.496C66.3112 42.8587 65.8845 43.04 65.3939 43.04H63.8579ZM89.2949 22.528C88.3349 22.528 87.6095 22.784 87.1189 23.296C86.6282 23.7867 86.3189 24.64 86.1909 25.856C86.1909 26.0267 86.2655 26.112 86.4149 26.112H91.8229C92.0149 26.112 92.1109 26.016 92.1109 25.824C92.0255 23.6267 91.0869 22.528 89.2949 22.528ZM90.0949 36.32C87.1935 36.32 84.9535 35.584 83.3749 34.112C81.8175 32.64 81.0389 30.496 81.0389 27.68C81.0389 24.8853 81.7322 22.752 83.1189 21.28C84.5269 19.7867 86.5535 19.04 89.1989 19.04C94.2762 19.04 96.8575 21.8133 96.9429 27.36C96.9429 27.872 96.7402 28.3093 96.3349 28.672C95.9509 29.0133 95.5029 29.184 94.9909 29.184H86.4469C86.2335 29.184 86.1482 29.28 86.1909 29.472C86.3615 30.6453 86.8095 31.488 87.5349 32C88.2815 32.4907 89.3909 32.736 90.8629 32.736C91.8229 32.736 92.8575 32.5973 93.9669 32.32C94.4149 32.2133 94.8095 32.2987 95.1509 32.576C95.5135 32.8533 95.6949 33.216 95.6949 33.664V33.728C95.6949 34.2613 95.5242 34.752 95.1829 35.2C94.8629 35.6267 94.4469 35.8827 93.9349 35.968C92.6975 36.2027 91.4175 36.32 90.0949 36.32ZM100.933 23.616C100.442 23.616 100.016 23.4453 99.6529 23.104C99.2902 22.7413 99.1089 22.3147 99.1089 21.824C99.1089 21.3333 99.2902 20.9067 99.6529 20.544C100.016 20.1813 100.442 20 100.933 20H102.213C102.384 20 102.469 19.904 102.469 19.712V15.744C102.469 15.2533 102.65 14.8267 103.013 14.464C103.376 14.1013 103.802 13.92 104.293 13.92H105.829C106.32 13.92 106.746 14.1013 107.109 14.464C107.472 14.8267 107.653 15.2533 107.653 15.744V19.712C107.653 19.904 107.749 20 107.941 20H111.077C111.568 20 111.984 20.1813 112.325 20.544C112.688 20.9067 112.869 21.3333 112.869 21.824C112.869 22.3147 112.688 22.7413 112.325 23.104C111.984 23.4453 111.568 23.616 111.077 23.616H107.941C107.749 23.616 107.653 23.712 107.653 23.904V29.376C107.653 30.72 107.77 31.5733 108.005 31.936C108.261 32.2987 108.816 32.48 109.669 32.48C110.117 32.48 110.469 32.4587 110.725 32.416C111.194 32.352 111.61 32.4587 111.973 32.736C112.336 33.0133 112.517 33.376 112.517 33.824V34.08C112.517 34.6133 112.346 35.0827 112.005 35.488C111.664 35.8933 111.226 36.128 110.693 36.192C110.032 36.2773 109.264 36.32 108.389 36.32C106.213 36.32 104.677 35.8613 103.781 34.944C102.906 34.0053 102.469 32.3307 102.469 29.92V23.904C102.469 23.712 102.384 23.616 102.213 23.616H100.933ZM122.736 29.6C120.432 29.1733 118.779 28.512 117.776 27.616C116.795 26.72 116.304 25.536 116.304 24.064C116.304 22.4853 116.891 21.2587 118.064 20.384C119.259 19.488 121.051 19.04 123.44 19.04C124.848 19.04 126.288 19.1573 127.76 19.392C128.272 19.4773 128.688 19.7227 129.008 20.128C129.349 20.5333 129.52 21.0027 129.52 21.536V21.696C129.52 22.144 129.339 22.5067 128.976 22.784C128.635 23.0613 128.24 23.1573 127.792 23.072C126.405 22.7947 125.125 22.656 123.952 22.656C123.077 22.656 122.459 22.7627 122.096 22.976C121.755 23.1893 121.584 23.5093 121.584 23.936C121.584 24.7467 122.224 25.28 123.504 25.536C125.936 25.9413 127.632 26.5813 128.592 27.456C129.573 28.3307 130.064 29.6 130.064 31.264C130.064 32.864 129.467 34.112 128.272 35.008C127.077 35.8827 125.339 36.32 123.056 36.32C121.392 36.32 119.813 36.16 118.32 35.84C117.808 35.7333 117.381 35.4667 117.04 35.04C116.72 34.592 116.56 34.0907 116.56 33.536V33.28C116.56 32.832 116.741 32.4907 117.104 32.256C117.467 32 117.872 31.9253 118.32 32.032C119.707 32.3947 121.072 32.576 122.416 32.576C123.995 32.576 124.784 32.1173 124.784 31.2C124.784 30.7733 124.635 30.4427 124.336 30.208C124.059 29.9733 123.525 29.7707 122.736 29.6Z" />
              </svg>
              <ul class="menu">
                <li class="menu-item menu-item--expanded">
                  <button role="heading" type="button">關於我們</button>
                  <ul class="menu">
                    <li class="menu-item">
                      <a href="#">網站願景</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">招募會員</a>
                    </li>
                    <li class="menu-item">
                      <a href="${pageContext.request.contextPath}/views/member/member.jsp">會員中心</a>
                    </li>
                  </ul>

                </li>
                <li class="menu-item menu-item--expanded">
                  <button role="heading" type="button">寵物認養</button>
                  <ul class="menu">
                    <li class="menu-item">
                      <a href="#">貓咪搜尋</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">貓咪認養</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">貓咪捐贈</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">收容所捐贈</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">聊天室</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">地圖找貓</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">收容所資訊</a>
                    </li>
                    <li class="menu-item">
                      <a href="#">小遊戲</a>
                    </li>
                  </ul>

                </li>
                <li class="menu-item menu-item--expanded">
                  <button role="heading" type="button">寵物商品/二手商城</button>
                  <ul class="menu">
                    <li class="menu-item">
                      <a href="">購物中心</a>
                    </li>
                    <li class="menu-item">
                      <a href="">購物活動</a>
                    </li>
                    <li class="menu-item">
                      <a href="">購物車</a>
                    </li>
                    <li class="menu-item">
                      <a href="">出貨訂單</a>
                    </li>
                  </ul>
                </li>

              </ul>
            </nav>
          </div>
          <!--個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄-->
          <!-- <div class="region region-footer-right" >
            <div class="block block-block-content  block-signup">
              <div class=" field--name-body ">
                <p>開發者 : AAA</p>
                <p>開發項目 : 寵物配對, 地圖找貓, 寵物推播</p>
                <p>Contact : </p>
              </div>
              <div class="field--name-field-link"><a href="" >簡介</a></div>
              
            </div>
            <div class="block block-block-content  block-signup">
              <div class=" field--name-body ">
                <p>開發者 : AAA</p>
                <p>開發項目 : 寵物配對</p>
                <p>Contact : </p>
              </div>
              <div class="field--name-field-link"><a href="" >簡介</a></div>
              
            </div>
            <div class="block block-block-content  block-signup" >
              <div class=" field--name-body ">
                <p>開發者 : AAA</p>
                <p>開發項目 : 寵物配對</p>
                <p>Contact : </p>
              </div>
              <div class="field--name-field-link"><a href="" >簡介</a></div>
              
            </div>

            
            
          </div>
           -->
          <!--個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄個人專欄-->
          <div class="region region-footer-right" >
            <div class="block block-block-content  block-signup" >
              <div class=" field--name-body ">
                <p>開發者 : AAA</p>
                <p>開發項目 : 寵物配對</p>
                <p>Contact : </p>
              </div>
              <div class="field--name-field-link"><a href="" >簡介</a></div>
              
            </div>
            <div class="block block-block-content  block-signup" >
              <div class=" field--name-body ">
                <p>開發者 : AAA</p>
                <p>開發項目 : 寵物配對</p>
                <p>Contact : </p>
              </div>
              <div class="field--name-field-link"><a href="" >簡介</a></div>
              
            </div>
       

            
            
          </div>

        </div>
      </div>

      
    </footer>

      <!--svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們svg 標籤們-->
      <div id="Svg_Defs" class="u-isHidden hidden">
        <svg>
          <symbol id="icon-paw" viewBox="0 0 68 67">
            <title>icon-paw</title>
            <path fill-rule="evenodd" clip-rule="evenodd"
              d="M16.8204 28.4595C16.8204 22.7895 13.0764 18.1856 8.48444 18.1856C3.89244 18.1856 0.148438 22.7895 0.148438 28.4595C0.148438 34.1295 3.89244 38.7171 8.48444 38.7171C13.0764 38.7171 16.8204 34.1133 16.8204 28.4595ZM8.48444 35.8418C5.44444 35.8418 2.98044 32.5302 2.98044 28.4433C2.98044 24.3564 5.44444 21.0448 8.48444 21.0448C11.5244 21.0448 13.9564 24.3725 13.9564 28.4595C13.9564 32.5464 11.5244 35.8418 8.48444 35.8418ZM67.7644 28.4433C67.7644 22.7895 64.0204 18.1856 59.4284 18.1856C54.8364 18.1856 51.0924 22.7895 51.0924 28.4595C51.0348 29.0065 51.2913 29.5388 51.7533 29.8305C52.2153 30.1223 52.8016 30.1223 53.2636 29.8305C53.7255 29.5388 53.9821 29.0065 53.9244 28.4595C53.9244 24.3887 56.3884 21.061 59.4284 21.061C62.4684 21.061 64.9324 24.3725 64.9324 28.4595C64.9324 32.5302 62.4684 35.8418 59.4284 35.8418C58.642 35.8418 58.0044 36.4854 58.0044 37.2795C58.0044 38.0735 58.642 38.7171 59.4284 38.7171C64.0204 38.7171 67.7644 34.1133 67.7644 28.4433ZM44.3564 20.6248C48.9484 20.6248 52.6924 16.021 52.6924 10.351C52.6924 4.68099 48.9324 0.0771484 44.3564 0.0771484C39.7804 0.0771484 36.0204 4.68099 36.0204 10.351C36.0204 16.021 39.7324 20.6248 44.3564 20.6248ZM44.3564 2.95253C47.3964 2.95253 49.8604 6.26407 49.8604 10.351C49.8604 14.4379 47.3644 17.7495 44.3564 17.7495C41.3484 17.7495 38.8524 14.4379 38.8524 10.351C38.8524 6.26407 41.3004 2.95253 44.3564 2.95253ZM23.5564 20.6248C28.1484 20.6248 31.8924 16.021 31.8924 10.351C31.8924 4.68099 28.1804 0.0771484 23.5564 0.0771484C18.9324 0.0771484 15.2204 4.68099 15.2204 10.351C15.2204 16.021 18.9804 20.6248 23.5564 20.6248ZM23.5564 2.95253C26.5964 2.95253 29.0604 6.26407 29.0604 10.351C29.0604 14.4379 26.6124 17.7495 23.5564 17.7495C20.5004 17.7495 18.0524 14.4379 18.0524 10.351C18.0524 6.26407 20.5484 2.95253 23.5564 2.95253ZM53.9564 46.3579L45.1564 30.8018C42.2444 25.681 38.2604 22.8541 33.9564 22.8541C29.6524 22.8541 25.6684 25.681 22.7564 30.8018L13.9564 46.3418C13.3722 47.3682 12.8898 48.4503 12.5164 49.5725C11.9895 50.9596 11.7184 52.4323 11.7164 53.9179C11.7136 53.961 11.7136 54.0041 11.7164 54.0472C11.7834 60.4376 16.7554 65.6767 23.0764 66.0172H23.5564C25.1565 66.0226 26.7408 65.6982 28.2124 65.0641C29.2684 64.6441 31.0284 63.8364 32.8524 62.9641L33.5084 63.2387C37.0622 64.9025 40.9064 65.8413 44.8204 66.001C51.1509 65.6864 56.1508 60.4617 56.2444 54.0633C56.2087 52.5667 55.9443 51.0846 55.4604 49.6695C55.0709 48.5173 54.567 47.4078 53.9564 46.3579ZM44.8044 63.1418C41.9017 63.0456 39.0399 62.4217 36.3564 61.3002L36.9004 61.0256L38.5004 60.2825C38.606 60.2204 38.7028 60.1443 38.7884 60.0564L41.8924 58.4572C42.5867 58.0959 42.8632 57.2374 42.5121 56.533C42.1611 55.8286 41.3135 55.5411 40.6124 55.8887L39.0124 56.6641C36.5324 57.9402 32.3884 60.0887 30.6444 60.8156L30.4844 60.9287C29.1564 61.5587 27.9244 62.1079 27.1564 62.4148C25.9517 62.9614 24.6354 63.2106 23.3164 63.1418H23.1724C18.3675 62.8876 14.578 58.9205 14.5004 54.0633C14.5042 54.0257 14.5042 53.9878 14.5004 53.9502C14.5065 52.7947 14.7234 51.6502 15.1404 50.5741C15.4586 49.6192 15.8713 48.6991 16.3724 47.8279L25.1564 32.2395C27.5404 28.0395 30.6444 25.7779 33.9084 25.7779C37.1724 25.7779 40.3084 28.0879 42.6604 32.2395L51.5084 47.7956C52.0077 48.6678 52.4203 49.5877 52.7404 50.5418C53.1432 51.6735 53.3699 52.8615 53.4124 54.0633C53.3449 58.9002 49.5877 62.8627 44.8044 63.1418Z"
              fill="#6504B5"></path>
          </symbol>
          <symbol id="icon-shelters" viewBox="0 0 81 78">
            <title>icon-shelters</title>
            <path
              d="M79.5034 19.3418L40.8582 0.27325C40.4791 0.0886042 40.0373 0.0886042 39.6582 0.27325L0.996625 19.3418C0.679393 19.4922 0.43584 19.7657 0.321305 20.1001C0.20677 20.4345 0.230978 20.8015 0.388428 21.1176C0.731525 21.7782 1.53305 22.043 2.19658 21.715L40.25 2.94518L78.3034 21.715C78.4935 21.8054 78.7015 21.8509 78.9116 21.8478C79.4153 21.8499 79.8782 21.5682 80.1116 21.1176C80.269 20.8015 80.2932 20.4345 80.1787 20.1001C80.0642 19.7657 79.8206 19.4922 79.5034 19.3418Z"
              fill="#6504B5"></path>
            <path
              d="M67.2572 60.7318C66.2218 60.2581 65.0468 60.1987 63.9697 60.5659L49.7346 63.885C49.8574 62.6645 49.5296 61.4412 48.8141 60.4497C48.0234 59.3688 46.8418 58.6471 45.5265 58.4416L32.9845 55.7033H32.8201C29.9835 54.9154 26.9477 55.4121 24.5026 57.0641C22.4808 58.4416 12.5359 64.9472 12.4209 65.0135C12.1246 65.2037 11.9173 65.5068 11.846 65.8539C11.7748 66.2009 11.8458 66.5623 12.0428 66.8557C12.294 67.2299 12.7128 67.4538 13.1606 67.4531C13.4225 67.4544 13.6793 67.3795 13.9003 67.2374C14.3112 66.9718 23.9931 60.599 26.0149 59.2548C27.9021 57.9795 30.2627 57.6434 32.4256 58.342H32.5407L45.0005 61.0637C45.6557 61.1445 46.2496 61.4922 46.6443 62.0263C47.0219 62.5404 47.1762 63.1874 47.0717 63.8186C46.8452 65.1274 45.6289 66.0171 44.3266 65.8267L36.1077 64.1671C35.7565 64.0774 35.3844 64.1342 35.0751 64.3247C34.7659 64.5151 34.5456 64.8232 34.4639 65.1795C34.3914 65.5275 34.4601 65.8903 34.6548 66.1867C34.8495 66.483 35.1538 66.6881 35.4995 66.7561L43.7184 68.4157C43.9919 68.438 44.2667 68.438 44.5403 68.4157C45.9111 68.4092 47.2234 67.8541 48.1894 66.8723L64.6272 63.022H64.7751C65.2025 62.8494 65.6793 62.8494 66.1066 63.022C66.5308 63.2058 66.8588 63.5611 67.0107 64.0012C67.2185 64.4376 67.2272 64.9439 67.0345 65.3873C66.8417 65.8307 66.4668 66.167 66.008 66.308L48.3703 72.6476C47.5024 73.0121 46.5333 73.0474 45.6416 72.7472L30.8476 69.6272C30.5348 69.5612 30.2091 69.6082 29.9271 69.7599L19.7192 75.1536C19.4091 75.3158 19.1768 75.5973 19.0747 75.9346C18.9726 76.2718 19.0094 76.6364 19.1768 76.9459C19.5376 77.5974 20.3467 77.8403 21.0014 77.4936L30.864 72.3157L45.1649 75.3361C46.5744 75.7499 48.0813 75.668 49.4387 75.1038L66.9614 68.7974C68.6311 68.2109 69.7736 66.6504 69.839 64.8667C69.9045 63.083 68.8795 61.4414 67.2572 60.7318Z"
              fill="#6504B5"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
              d="M23.2698 31.6725C23.0716 34.4065 25.0996 36.7878 27.8066 36.9998C30.4873 36.7536 32.4772 34.3827 32.2777 31.6725C32.4759 28.9386 30.4479 26.5573 27.7409 26.3453C25.0602 26.5915 23.0703 28.9624 23.2698 31.6725ZM30.0586 31.6725C30.222 33.1375 29.2408 34.4825 27.8066 34.7594C26.3459 34.513 25.3293 33.159 25.4889 31.6725C25.3265 30.2023 26.3165 28.8551 27.7573 28.5857C29.1915 28.8626 30.1727 30.2076 30.0093 31.6725H30.0586Z"
              fill="#6504B5"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
              d="M57.2795 31.6725C57.4777 34.4065 55.4497 36.7878 52.7427 36.9998C50.0423 36.7792 48.0238 34.4005 48.2223 31.6725C48.0238 28.9446 50.0423 26.5659 52.7427 26.3453C55.4497 26.5573 57.4777 28.9386 57.2795 31.6725ZM55.0111 31.6725C55.1828 30.1963 54.1905 28.8388 52.7427 28.5691C51.3015 28.8464 50.3181 30.2016 50.4907 31.6725C50.3283 33.1428 51.3183 34.49 52.7591 34.7594C54.1933 34.4825 55.1745 33.1375 55.0111 31.6725Z"
              fill="#6504B5"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
              d="M45.3457 17.6989C42.6387 17.9108 40.6107 20.2922 40.8089 23.0261C40.6107 25.76 42.6387 28.1414 45.3457 28.3534C48.0527 28.1414 50.0807 25.76 49.8825 23.0261C50.0807 20.2922 48.0527 17.9108 45.3457 17.6989ZM45.3457 26.1295C43.9115 25.8526 42.9303 24.5076 43.0937 23.0427C42.9303 21.5778 43.9115 20.2328 45.3457 19.9559C46.7799 20.2328 47.7611 21.5778 47.5977 23.0427C47.7611 24.5076 46.7799 25.8526 45.3457 26.1295Z"
              fill="#6504B5"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
              d="M30.6175 23.0261C30.4193 20.2922 32.4473 17.9108 35.1543 17.6989C37.8679 17.9022 39.9055 20.2862 39.7076 23.0261C39.9055 25.766 37.8679 28.15 35.1543 28.3534C32.4473 28.1414 30.4193 25.76 30.6175 23.0261ZM32.9023 23.0427C32.7389 24.5076 33.7201 25.8526 35.1543 26.1295C36.5885 25.8526 37.5697 24.5076 37.4063 23.0427C37.5697 21.5778 36.5885 20.2328 35.1543 19.9559C33.7201 20.2328 32.7389 21.5778 32.9023 23.0427Z"
              fill="#6504B5"></path>
            <path fill-rule="evenodd" clip-rule="evenodd"
              d="M34.3653 32.5687L30.0257 39.9704C29.7212 40.4954 29.4733 41.0518 29.286 41.63C28.9972 42.3638 28.852 43.1472 28.8586 43.9368C28.9347 47.2638 31.5644 49.9553 34.8584 50.0773H35.1707C35.9984 50.0822 36.8191 49.9243 37.5871 49.6126L38.3103 49.3803C38.9307 49.1378 39.5856 48.9977 40.25 48.9654C40.9145 48.9971 41.5695 49.1372 42.1897 49.3803L42.9951 49.5794C43.8234 49.8319 44.6789 49.9824 45.543 50.0275H45.6251C48.928 49.8965 51.5579 47.1903 51.6249 43.8539C51.604 43.0954 51.4653 42.345 51.214 41.63C51.0168 41.053 50.7636 40.4971 50.4579 39.9704L46.1183 32.5521C45.0192 30.2385 42.7697 28.7032 40.2336 28.5359C37.6999 28.7123 35.457 30.2536 34.3653 32.5687ZM44.2279 33.6972L48.5675 41.1156C48.7977 41.5054 48.9904 41.9167 49.1428 42.3436C49.3111 42.8299 49.4053 43.3391 49.4223 43.8539C49.3737 45.961 47.7262 47.6749 45.6416 47.7871C44.9783 47.7487 44.3218 47.6317 43.6855 47.4386L42.9787 47.2228C42.1105 46.8623 41.1876 46.6546 40.25 46.6088C39.3449 46.6374 38.4507 46.8168 37.6035 47.1398L36.8967 47.3556H36.7652C36.2449 47.5748 35.6851 47.6822 35.1214 47.6709H34.9735C32.8693 47.593 31.1863 45.8793 31.127 43.7543C31.1603 43.2656 31.2829 42.7873 31.4887 42.3436C31.6383 41.9155 31.8311 41.504 32.064 41.1156L36.4036 33.6972C37.1169 32.1095 38.6009 31.0142 40.3158 30.8096C42.0026 31.0326 43.4564 32.1178 44.1622 33.6806L44.2279 33.6972Z"
              fill="#6504B5"></path>
          </symbol>
          <symbol id="icon-strokedPaw" viewBox="0 0 42.26 40.83">
            <title>icon-paw</title>
            <path
              d="M10.42 17.57c0-3.51-2.34-6.36-5.21-6.36S0 14.06 0 17.57s2.34 6.35 5.21 6.35 5.21-2.85 5.21-6.35zm-5.21 4.57c-1.9 0-3.44-2.05-3.44-4.58s1.54-4.58 3.44-4.58 3.42 2.06 3.42 4.59-1.52 4.57-3.42 4.57zM42.26 17.56c0-3.5-2.34-6.35-5.21-6.35s-5.21 2.85-5.21 6.36a.89.89 0 1 0 1.77 0c0-2.52 1.54-4.58 3.44-4.58s3.44 2.05 3.44 4.58c0 2.52-1.54 4.57-3.44 4.57a.89.89 0 0 0 0 1.78c2.87 0 5.21-2.85 5.21-6.36zM27.63 12.72c2.87 0 5.21-2.85 5.21-6.36S30.49 0 27.63 0s-5.21 2.85-5.21 6.36 2.32 6.36 5.21 6.36zm0-10.94c1.9 0 3.44 2.05 3.44 4.58s-1.56 4.58-3.44 4.58-3.44-2.05-3.44-4.58 1.53-4.58 3.44-4.58zM14.63 12.72c2.87 0 5.21-2.85 5.21-6.36S17.52 0 14.63 0 9.42 2.85 9.42 6.36s2.35 6.36 5.21 6.36zm0-10.94c1.9 0 3.44 2.05 3.44 4.58s-1.53 4.58-3.44 4.58-3.44-2.05-3.44-4.58 1.56-4.58 3.44-4.58zM33.63 28.65l-5.5-9.63c-1.82-3.17-4.31-4.92-7-4.92s-5.18 1.75-7 4.92l-5.5 9.62a11.12 11.12 0 0 0-.9 2 7.54 7.54 0 0 0-.5 2.69.61.61 0 0 0 0 .08 7.5 7.5 0 0 0 7.1 7.41h.3a7.35 7.35 0 0 0 2.91-.59c.66-.26 1.76-.76 2.9-1.3l.41.17a18.59 18.59 0 0 0 7.07 1.71 7.51 7.51 0 0 0 7.14-7.39 9 9 0 0 0-.49-2.72 11.18 11.18 0 0 0-.94-2.05zm-5.72 10.39a15.1 15.1 0 0 1-5.28-1.14l.34-.17 1-.46a.86.86 0 0 0 .18-.14l1-.51.94-.48a.89.89 0 0 0-.8-1.59l-1 .48c-1.55.79-4.14 2.12-5.23 2.57l-.1.07c-.83.39-1.6.73-2.08.92a5.2 5.2 0 0 1-2.4.45h-.09a5.72 5.72 0 0 1-5.42-5.62.35.35 0 0 0 0-.07 5.82 5.82 0 0 1 .4-2.09 9.27 9.27 0 0 1 .77-1.7l5.49-9.65c1.49-2.6 3.43-4 5.47-4s4 1.43 5.47 4l5.53 9.63a9.47 9.47 0 0 1 .77 1.7 7.21 7.21 0 0 1 .42 2.18 5.71 5.71 0 0 1-5.38 5.62z">
            </path>
          </symbol>
          <symbol id="icon-chevronLeft" viewBox="0 0 15.8 24.7">
            <title>icon-chevronLeft</title>
            <path
              d="M1,14.7L1,14.7L1,14.7l8.8,8.9c1.4,1.4,3.6,1.4,4.9,0s1.4-3.6,0-4.9l-6.3-6.5l6.5-6.4c1.2-1.3,1.2-3.4,0-4.7c-1.3-1.4-3.5-1.6-4.9-0.3L1,9.8C-0.3,11.1-0.3,13.3,1,14.7L1,14.7z">
            </path>
          </symbol>
          <symbol id="icon-close" viewBox="0 0 24.67 24.67">
            <title>icon-close</title>
            <path
              d="M17.27,12.34l6.4-6.4A3.49,3.49,0,0,0,18.74,1l-6.4,6.4L5.93,1A3.49,3.49,0,0,0,1,5.93l6.4,6.4L1,18.74a3.49,3.49,0,0,0,4.94,4.94l6.4-6.4,6.4,6.4a3.49,3.49,0,0,0,4.94-4.94Z">
            </path>
          </symbol>
          <symbol id="icon-cat" viewBox="0 0 101.8 87.7">
            <path
              d="M34.1 31.4c-.8 0-1.4-.5-1.6-1.3-.2-.9.4-1.7 1.3-1.9l10.9-2.1c.9-.2 1.7.4 1.9 1.3s-.4 1.7-1.3 1.9l-10.9 2.1h-.3zM45 39h-.3l-10.9-2.2c-.9-.2-1.4-1-1.3-1.9.2-.9 1-1.4 1.9-1.3l10.9 2.1c.9.2 1.4 1 1.3 1.9-.2.9-.8 1.4-1.6 1.4z">
            </path>
            <circle cx="26.6" cy="25.8" r="2.2"></circle>
            <path
              d="M87 58.2c-.8-.5-1.8-.3-2.2.5-.5.8-.3 1.8.5 2.2 3.5 2.3 5.6 6.1 5.6 10.2 0 6.7-5.5 12.2-12.2 12.2H22.9v-2.6c0-.7.6-1.3 1.3-1.3h.9c3.6-.1 4-3.2 4-4.5v-29c.6.1 1.1.1 1.6.1h.5c.9 0 1.6-.8 1.5-1.7 0-.9-.8-1.6-1.7-1.6-.4 0-9.7.3-12.8-8.2-.1-.3-.4-1.4 0-2.2.1-.3.3-.6 1.1-.9.6-.2 1.1-.9 1.1-1.5 0-.1-.1-7.7 4.8-12.3l.1-.1s2.3-2.5 6.9-4h.1s.1 0 .2-.1c0 0 .1 0 .1-.1.1 0 .1-.1.1-.1l.1-.1.1-.1.1-.1.1-.1s0-.1.1-.1c0-.1 0-.1.1-.2V11.6l-1.2-5.4c1.3.3 3 1 4.6 2.2.1.1.1.1.2.1.1.5.3.6.5.6.9.2 1.7-.3 2-1.2l.7-3c1.9 1.2 5.5 4.3 8.4 12.2v.1s.1.2.2.3l.1.1s0 .1.1.1c3.2 3.2 5 7.5 5 12 0 4.4-1.7 8.6-4.8 11.8v.1c-.4.3-.6.8-.6 1.3 0 4.9 4 8.9 8.9 8.9h.6c7.9 0 14.3 6.4 14.3 14.3v9.4c0 .9.7 1.6 1.6 1.6.9 0 1.6-.7 1.6-1.6v-9.4c0-9.7-7.9-17.6-17.6-17.6h-.6c-2.9 0-5.3-2.2-5.6-5 3.5-3.7 5.5-8.6 5.5-13.8 0-5.3-2-10.2-5.7-14-4.9-13-11.9-14.5-12.2-14.6-.8-.2-1.7.4-1.9 1.2l-.6 2.6c-3.3-1.9-6.6-2-6.8-2-.5 0-1 .2-1.3.6-.3.4-.4.9-.3 1.4l1.4 6.3c-4.2 1.7-6.4 3.9-6.8 4.3-4.9 4.5-5.7 11.1-5.9 13.6-.8.5-1.5 1.2-1.9 2.1-1 2.1-.1 4.4 0 4.6 2.1 5.7 6.6 8.4 10.6 9.6V75c0 1.3-.3 1.3-.9 1.3h-.7c-2.5 0-4.5 2-4.5 4.5V85c0 .9.7 1.6 1.6 1.6h57.3c8.5 0 15.4-6.9 15.4-15.4 0-5.3-2.6-10.1-7-13z">
            </path>
          </symbol>
          <symbol id="icon-dog" viewBox="0 0 101.8 87.7">
            <circle cx="21.8" cy="16.3" r="2.7"></circle>
            <path
              d="M100.1 27.8C81 27.8 81 44.5 81 50v26.8c0 2.9-2.3 5.2-5.2 5.2h-.6c-2.9 0-5.2-2.3-5.2-5.2v-8.5c0-2.6-1.2-5.2-3.1-6.8-1.6-1.4-3.6-2-5.7-1.7l-18.1 2.7c-5.1.9-8.2 4.1-8.2 8.5v5.9c0 2.9-2.3 5.2-5.2 5.2h-.6c-2.9 0-5.2-2.3-5.2-5.2V35.7H25c.9 0 1.7-.7 1.7-1.7 0-.9-.7-1.7-1.7-1.7H14.1c-6.6 0-9.2-6.4-9.4-6.7-1.7-4.1-1.5-5.7-1.4-6.1.4-.3 2-1.2 7.1-2.2 1.7-.4 3-1.3 4-2.9 1.2-1.7 2.5-3.6 2.8-3.9C19.1 8.3 21 7.4 24.9 7c0 0 3.9-.3 7.6 0h.5l7.1-1.4c1.5-.3 1.7-.1 2.5.9l.1.2c2 2.5 5.7 8.1 6.9 13.3-.4.5-2.4 1.4-4.9 1-2.1-.3-5.8-1.6-7.1-7.1-.2-.9-1.1-1.4-2-1.2s-1.4 1.1-1.2 2c1.4 5.8 5.1 8.7 9 9.5v3.4c0 5.6 3.2 8.9 8.9 8.9h9.2c.9 0 1.7-.7 1.7-1.7 0-.9-.7-1.7-1.7-1.7h-9.2c-3.8 0-5.5-1.7-5.5-5.5v-3.1c.6 0 1.2-.1 1.7-.2 3.2-.7 5-2.6 4.5-4.7-1.3-5.4-5-11.4-7.7-14.8l-.1-.1C44 3.2 42.8 2 39.5 2.6L32.7 4c-4-.4-7.8 0-8 0-4.8.5-7.5 1.8-9.9 4.6-.4.5-2.4 3.3-3 4.1-.6.9-1.2 1.3-2 1.5-4.9 1-7.9 2.2-8.9 3.3-.9.9-1.7 3.2.8 9.5.1.4 3.6 8.7 12.4 8.7h6.4v41.1c0 4.7 3.8 8.5 8.5 8.5h.6c4.7 0 8.5-3.8 8.5-8.5v-5.9c0-3.7 3.4-4.9 5.4-5.2l18-2.6c1.3-.2 2.4.4 3 .9 1.2 1 1.9 2.7 1.9 4.3v8.5c0 4.7 3.8 8.5 8.5 8.5h.6c4.7 0 8.5-3.8 8.5-8.5V50c0-8.8 1.8-18.9 15.8-18.9.9 0 1.7-.7 1.7-1.7s-.4-1.6-1.4-1.6z">
            </path>
          </symbol>
          <symbol id="icon-chevronRight" viewBox="0 0 15.86 24.62">
            <title>icon-chevronRight</title>
            <path
              d="M14.87 14.69a3.48 3.48 0 0 0 0-4.86L5.95.91a3.49 3.49 0 0 0-4.93 4.93l6.4 6.42-6.4 6.4a3.493 3.493 0 1 0 4.94 4.94l8.87-8.86z">
            </path>
          </symbol>
          <symbol id="icon-search" viewBox="0 0 31.92 31.72">
            <title>icon-search</title>
            <path
              d="M19,1.51a12.85,12.85,0,1,0-.7,23,12.91,12.91,0,0,0,.7-23ZM12.93,20.74a7.89,7.89,0,1,1,7.94-7.89A7.93,7.93,0,0,1,12.93,20.74Z">
            </path>
            <path
              d="M31.19,27.49,26,22.36a16.51,16.51,0,0,1-3.49,3.54L27.67,31a2.5,2.5,0,0,0,3.53,0A2.46,2.46,0,0,0,31.19,27.49Z">
            </path>
          </symbol>



          <symbol id="icon-favorite" viewBox="0 0 31.98 26.87">
            <title>icon-favorite</title>
            <path
              d="M29.49,2.59a8.31,8.31,0,0,0-12.06,0,8.78,8.78,0,0,0-1.43,2,8.83,8.83,0,0,0-1.43-2,8.31,8.31,0,0,0-12.06,0,9.09,9.09,0,0,0,0,12.52l9.81,10.18a5.09,5.09,0,0,0,7.36,0l9.81-10.18A9.09,9.09,0,0,0,29.49,2.59Z">
            </path>
          </symbol>


          <symbol id="icon-favorite_outline" viewBox="0 0 35.07 29.87">
            <title>icon-favorite_outline</title>
            <path
              d="M31,4.09a8.31,8.31,0,0,0-11.75-.31l-.31.31a8.8,8.8,0,0,0-1.43,2,8.8,8.8,0,0,0-1.43-2A8.31,8.31,0,0,0,4.31,3.78L4,4.09A9.09,9.09,0,0,0,4,16.61l9.81,10.18A5.1,5.1,0,0,0,21,27l.16-.17L31,16.61A8.87,8.87,0,0,0,31,4.09Z"
              stroke-miterlimit="10" stroke-width="3"></path>
          </symbol>
          <symbol id="icon-menu" viewBox="0 0 31.98 31.1">
            <title>menu</title>
            <path d="M3.54,7.11h24.9a3.55,3.55,0,0,0,0-7.11H3.54A3.55,3.55,0,0,0,3.54,7.11Z"></path>
            <path d="M28.44,12H3.54a3.55,3.55,0,0,0,0,7.11h24.9A3.55,3.55,0,0,0,28.44,12Z"></path>
            <path d="M28.44,24H3.54a3.55,3.55,0,0,0,0,7.11h24.9A3.55,3.55,0,0,0,28.44,24Z"></path>
          </symbol>
          <symbol id="icon-chevronDown" viewBox="0 0 24.8 15.92">
            <title>icon-chevronDown</title>
            <path
              d="M9.95,14.95a3.57,3.57,0,0,0,4.9,0l8.9-8.9a3.5,3.5,0,0,0,0-5,3.5,3.5,0,0,0-5,0h0l-6.4,6.4-6.3-6.4a3.5,3.5,0,0,0-5,0,3.5,3.5,0,0,0,0,5l8.9,8.9Z">
            </path>
          </symbol>
          <symbol id="icon-chevronUp" viewBox="0 0 24.8 15.9">
            <title>icon-chevronUp</title>
            <path
              d="M14.9 1C13.5-.3 11.4-.3 10 1L1.1 9.9c-1.4 1.4-1.4 3.6-.1 4.9l.1.1c1.4 1.4 3.6 1.4 4.9.1l.1-.1 6.4-6.4 6.3 6.4c1.4 1.4 3.6 1.4 4.9.1l.1-.1c1.4-1.4 1.4-3.6.1-4.9l-.1-.1L14.9 1z">
            </path>
          </symbol>
          <symbol id="icon-twitter" viewBox="0 0 29.94 24.33">
            <title>icon-twitter</title>
            <path
              d="M26.88 6.06v.79c0 8.12-6.18 17.48-17.48 17.48A17.38 17.38 0 0 1 0 21.57a13 13 0 0 0 1.47.08A12.31 12.31 0 0 0 9.09 19a6.15 6.15 0 0 1-5.74-4.27 6.31 6.31 0 0 0 1.15.11 6.19 6.19 0 0 0 1.62-.22 6.15 6.15 0 0 1-4.93-6v-.06A6.13 6.13 0 0 0 4 9.32a6.15 6.15 0 0 1-1.9-8.2 17.43 17.43 0 0 0 12.65 6.42 6.15 6.15 0 0 1 10.47-5.6A12.26 12.26 0 0 0 29.11.45a6.16 6.16 0 0 1-2.7 3.4 12.26 12.26 0 0 0 3.53-1 12.46 12.46 0 0 1-3.06 3.21z">
            </path>
          </symbol>
          <symbol id="icon-youtube" viewBox="0 0 38.86 29.48">
            <title>icon-youtube</title>
            <path
              d="M38.46 6.37s-.4-2.88-1.54-4.15A5.14 5.14 0 0 0 33 .47C27.61.07 19.43 0 19.43 0s-8.17.07-13.6.47a5.41 5.41 0 0 0-3.89 1.74C.74 3.48.4 6.37.4 6.37A67 67 0 0 0 0 13.2v3.15a64.89 64.89 0 0 0 .4 6.77S.8 26 1.94 27.27c1.47 1.68 3.42 1.61 4.29 1.81 3.08.34 13.2.4 13.2.4s8.17 0 13.6-.47a5.41 5.41 0 0 0 3.89-1.74c1.14-1.27 1.54-4.15 1.54-4.15a66.61 66.61 0 0 0 .4-6.77V13.2a67 67 0 0 0-.4-6.83zM14.74 22.51V8l12.73 7.44z">
            </path>
          </symbol>
          <symbol id="icon-pinterest" viewBox="0 0 23.18 29.94">
            <title>icon-pinterest</title>
            <path
              d="M13.9 21.64a4.93 4.93 0 0 1-4.2-2.14s-1 4-1.21 4.73a18.35 18.35 0 0 1-3.1 5.63.23.23 0 0 1-.41-.1A19.26 19.26 0 0 1 5 23.22l2.21-9.37a6.59 6.59 0 0 1-.55-2.72c0-2.55 1.48-4.45 3.32-4.45a2.3 2.3 0 0 1 2.32 2.58c0 1.57-1 3.93-1.52 6.1a2.66 2.66 0 0 0 2.71 3.31c3.26 0 5.45-4.18 5.45-9.14 0-3.77-2.54-6.59-7.16-6.59a8.15 8.15 0 0 0-8.47 8.24 5 5 0 0 0 1.13 3.37.84.84 0 0 1 .25 1c-.08.31-.27 1.08-.35 1.38a.59.59 0 0 1-.86.43C1.12 16.33 0 13.7 0 10.74 0 5.86 4.12 0 12.29 0c6.57 0 10.89 4.75 10.89 9.85 0 6.75-3.75 11.79-9.28 11.79z">
            </path>
          </symbol>
          <symbol id="icon-instagram" viewBox="0 0 29.62 29.62">
            <title>icon-instagram</title>
            <path
              d="M21.07 0H8.55A8.55 8.55 0 0 0 0 8.55v12.52a8.55 8.55 0 0 0 8.55 8.55h12.52a8.55 8.55 0 0 0 8.55-8.55V8.55A8.55 8.55 0 0 0 21.07 0zm5.82 21.29A5.68 5.68 0 0 1 21.22 27H8.4a5.68 5.68 0 0 1-5.68-5.68V8.48A5.67 5.67 0 0 1 8.4 2.8h12.82a5.67 5.67 0 0 1 5.68 5.68z">
            </path>
            <path
              d="M14.81 7.2a7.69 7.69 0 1 0 7.69 7.69 7.69 7.69 0 0 0-7.69-7.69zm0 12.67a5 5 0 1 1 5-5 5 5 0 0 1-5 5z">
            </path>
            <circle cx="22.75" cy="6.91" r="1.79"></circle>
          </symbol>
          <symbol id="icon-facebook" viewBox="0 0 13.91 29.94">
            <title>icon-facebook</title>
            <path
              d="M13.37 15h-4.2v15H3V15H0V9.7h3V6.28C3 3.83 4.12 0 9.23 0h4.61v5.15h-3.35a1.27 1.27 0 0 0-1.32 1.44V9.7h4.74z">
            </path>
          </symbol>
          <symbol id="logo-powered-by-purina" viewBox="0 0 127.75 10">
            <path fill="none" d="M0 0h127.22v10H0z"></path>
            <path
              d="M2.34 2.62H0v5.51h.91V6.47h1.43a1.84 1.84 0 002-1.94 1.83 1.83 0 00-2-1.91zm-.06 3H.91V3.46h1.37a1 1 0 011.11 1.1 1 1 0 01-1.11 1.06zM8.58 2.51A2.72 2.72 0 005.7 5.39a2.7 2.7 0 002.82 2.86 2.72 2.72 0 002.86-2.89 2.69 2.69 0 00-2.8-2.85zm0 4.9a1.87 1.87 0 01-1.89-2 1.9 1.9 0 113.8 0 1.88 1.88 0 01-1.95 2zM12.52 2.62h1l.88 2.75c.16.53.38 1.28.45 1.56.1-.36.25-.88.47-1.54l.9-2.77H17l.9 2.76c.17.53.4 1.3.48 1.55.16-.58.29-1 .46-1.56l.86-2.75h1l-1.81 5.51H18l-.75-2.34c-.2-.64-.43-1.37-.57-1.8-.16.44-.39 1.14-.6 1.81l-.74 2.33h-.9zM26.21 7.29v.84h-3.86V2.62h3.82v.83h-2.91v1.48H26v.82h-2.74v1.54zM31 6.2a1.74 1.74 0 001.42-1.78 1.77 1.77 0 00-1.94-1.8h-2.29v5.51h.93V6.25h.76l1.6 1.88h1.16zm-1.84-.78v-2h1.27a.94.94 0 011.06 1 .93.93 0 01-1.05 1zM38.25 7.29v.84H34.4V2.62h3.8v.83h-2.89v1.48h2.76v.82h-2.76v1.54zM42.35 2.62h-2.11v5.51h2.09a2.62 2.62 0 002.77-2.77 2.6 2.6 0 00-2.75-2.74zm0 4.67h-1.2V3.48h1.18a1.77 1.77 0 011.84 1.91 1.76 1.76 0 01-1.82 1.9zM53.14 5.27a1.27 1.27 0 00.73-1.15c0-.92-.66-1.48-1.73-1.48h-2.49v5.49h2.49c1.23 0 1.91-.54 1.91-1.55a1.39 1.39 0 00-.91-1.31zm-2.57-1.84h1.6a.71.71 0 01.8.74c0 .47-.3.75-.83.75h-1.57zm1.66 3.88h-1.67V5.68h1.65c.59 0 .91.31.91.81a.78.78 0 01-.89.82zM58 5.85v2.28h-.91V5.87L55 2.62h1.09l1.11 1.84c.15.24.27.46.36.63.09-.17.21-.39.37-.64l1.17-1.84h1.1z">
            </path>
            <path fill="none" d="M64.75 0h63v10h-63z"></path>
            <path d="M124.58.12H64.75V10h59.83z" fill="#fff"></path>
            <path d="M124.21.45H75.49v9.22h48.72z"></path>
            <path
              d="M82.28 2.73a2 2 0 00-.89-.58A4.47 4.47 0 0080 2h-2.51v.3h.34a.62.62 0 01.48.17s.11.18.11.65V7a1.32 1.32 0 01-.08.61.61.61 0 01-.51.21h-.34v.34h3v-.33h-.34a.63.63 0 01-.47-.16s-.11-.19-.11-.65V5.37l.48.08h.52A2.3 2.3 0 0082.1 5a1.57 1.57 0 00.55-1.26 1.49 1.49 0 00-.37-1.01zM81 4.69a1.06 1.06 0 01-.78.32h-.32a2.76 2.76 0 01-.37 0V2.57a2.34 2.34 0 01.53-.07 1.41 1.41 0 01.67.15 1 1 0 01.45.47 1.59 1.59 0 01.16.69 1.22 1.22 0 01-.34.88zM88.72 1.94v.33h.34a.6.6 0 01.48.17s.11.18.11.65v2.43a3.44 3.44 0 01-.18 1.32 1.27 1.27 0 01-.65.62 2.37 2.37 0 01-1.12.25 1.73 1.73 0 01-.8-.16 1.3 1.3 0 01-.49-.39 1.49 1.49 0 01-.25-.66 4.72 4.72 0 01-.06-.8V3.09a1.13 1.13 0 01.1-.62.55.55 0 01.5-.2h.3v-.33h-3v.33h.34a.61.61 0 01.46.15 1 1 0 01.14.67v2.35A4.25 4.25 0 0085.16 7a1.92 1.92 0 00.82 1 3.33 3.33 0 001.68.36 3.13 3.13 0 001.62-.37 1.84 1.84 0 00.8-.9 3.89 3.89 0 00.21-1.43V3.13a1.39 1.39 0 01.08-.6.59.59 0 01.52-.26h.34v-.33zM99.46 7.83a1.89 1.89 0 01-.82-.23 3.3 3.3 0 01-.77-.78s-1-1.24-1.28-1.62a2.27 2.27 0 001.13-.57 1.43 1.43 0 00.42-1 1.36 1.36 0 00-.37-1 1.92 1.92 0 00-.88-.54A6.15 6.15 0 0095.32 2h-2.48v.3h.34a.68.68 0 01.49.17s.1.18.1.65V7a1.39 1.39 0 01-.08.6.58.58 0 01-.51.21h-.34v.34h3v-.32h-.34a.63.63 0 01-.5-.16s-.1-.19-.1-.65V5.35h.53l2.22 2.82h1.9v-.33zm-4.39-2.94h-.17V2.56a3.89 3.89 0 01.65-.08 1.27 1.27 0 01.94.33 1.09 1.09 0 01.35.85 1.07 1.07 0 01-.43.88 2.19 2.19 0 01-1.34.35zM101.25 2v.34h.32a.78.78 0 01.39.1.3.3 0 01.16.15 1.45 1.45 0 01.06.57V7c0 .44-.06.59-.1.63a.63.63 0 01-.51.18h-.32v.34h3v-.31h-.33a.78.78 0 01-.39-.1.21.21 0 01-.15-.14 1.49 1.49 0 01-.08-.6V3.13a1.37 1.37 0 01.09-.63.63.63 0 01.51-.19h.33V2zM113.81 2h-2.47v.33h.32a.65.65 0 01.5.16s.11.18.11.64v3.2L108.36 2h-1.92v.3h.1a1.36 1.36 0 01.4 0 1.15 1.15 0 01.4.18 2.61 2.61 0 01.4.36V7a1.28 1.28 0 01-.09.61.63.63 0 01-.52.19h-.32v.34h2.47v-.31H109a.67.67 0 01-.49-.15s-.11-.19-.11-.64V3.56l4.23 4.71h.31V3.11a1.21 1.21 0 01.06-.61.59.59 0 01.51-.2h.33V2zM122.11 7.83a1.07 1.07 0 01-.57-.18 2.24 2.24 0 01-.48-.76l-2.25-5.06h-.32l-2.38 5a2.55 2.55 0 01-.52.85 1.21 1.21 0 01-.48.15H115v.32h2.25v-.31h-.09a1.48 1.48 0 01-.56-.11.24.24 0 01-.11-.18 1.35 1.35 0 01.16-.49s.33-.7.41-.89h2.42c.09.18.37.81.37.81a1.55 1.55 0 01.19.58.21.21 0 01-.1.18 1.06 1.06 0 01-.48.09h-.08v.33h2.79v-.32zm-4.77-2.18l1-2.13 1 2.13z"
              fill="#fff"></path>
            <path d="M75.16.45h-10v9.22h10z" fill="#eb2027"></path>
            <path d="M74.8.77h-9.33v8.57h9.33z" fill="#fff"></path>
            <path
              d="M68.69 6.38h-2.87V9h2.87zM74.43 6.38h-2.86V9h2.86zM71.56 3.74h-2.87v2.63h2.87zM68.69 1.1h-2.87v2.64h2.87zM74.43 1.1h-2.86v2.64h2.86z"
              fill="#eb2027"></path>
            <path
              d="M127 .22a.9.9 0 00-.59-.22.86.86 0 00-.59.22.71.71 0 00-.25.54.69.69 0 00.25.54.86.86 0 00.59.22.9.9 0 00.59-.22.75.75 0 00.24-.54.71.71 0 00-.24-.54zm-.11 1a.65.65 0 01-.48.19.66.66 0 01-.49-.18.67.67 0 01-.2-.47.66.66 0 01.19-.46.65.65 0 01.49-.18.66.66 0 01.49.18.6.6 0 01.19.46.62.62 0 01-.23.45z">
            </path>
            <path
              d="M126.5.8c.18 0 .25-.1.25-.24s-.11-.25-.33-.25H126v.88h.15V.81h.16l.26.38h.16zm-.3-.09V.43h.21c.13 0 .2 0 .2.13s-.06.15-.24.15z">
            </path>
          </symbol>
          <symbol id="logo-purina-your-pet-our-passion" viewBox="0 0 243.18 19.34">
            <path
              d="M243.19 6.59a1.19 1.19 0 11-1.17-1.18 1.17 1.17 0 011.17 1.18zm-2.09 0a.89.89 0 101.78 0 .89.89 0 10-1.78 0zm.72.6h-.27V6h.44c.21 0 .31 0 .39.1a.27.27 0 01.12.24.31.31 0 01-.24.29c.11 0 .16.13.19.29a1.67 1.67 0 00.09.29h-.28c-.05 0-.06-.15-.1-.29s-.09-.17-.24-.17h-.13v.44zm0-.66h.13c.14 0 .26-.06.26-.17s-.07-.19-.25-.19a.26.26 0 00-.14 0zM127.46 13.34v-2.1l-1.85-3.76c-.39-.82-.69-1-1.17-1.05V6h3v.44c-.48 0-.67.13-.67.39a1.49 1.49 0 00.17.59l1.36 2.95h.06l1.34-3a1.57 1.57 0 00.15-.55c0-.28-.27-.37-.73-.4V6h2.48v.44c-.49.06-.75.25-1.21 1.18l-1.71 3.56v2.17c0 .72.18.93 1.06 1v.45h-3.31v-.5c.85-.03 1.03-.24 1.03-.96zM134.21 14.91c-1.66 0-2.86-1.23-2.86-3.3s1.2-3.29 2.85-3.29c1.85 0 2.89 1.44 2.89 3.35s-1.21 3.24-2.88 3.24zm0-6c-1.25 0-1.63 1-1.63 2.54 0 1.92.46 2.79 1.67 2.79s1.62-.92 1.62-2.56c-.01-1.91-.59-2.74-1.67-2.74zM143.54 13c0 .94.17 1 .91 1.08v.38l-1.51.46h-.19a3.73 3.73 0 01-.27-1.14 2.72 2.72 0 01-2.08 1.12 1.56 1.56 0 01-1.73-1.7v-2.9c0-.94-.18-1-.87-1.08v-.4l1.73-.5h.27V13c0 .8.34 1 .93 1a2.18 2.18 0 001.67-.82v-2.91c0-.93-.18-1-.87-1.08v-.38l1.73-.51h.27V13zM148.8 8.3a1.12 1.12 0 01.36.06l-.27 1.27a.73.73 0 00-.38-.06c-1 0-1.35.4-1.35 1.64v2.23c0 .72.12.85 1.06.89v.43h-3.08v-.43c.7-.06.87-.17.87-.89v-3.12c0-.92-.17-1.05-.91-1.08v-.39l1.59-.5h.19a4.49 4.49 0 01.21 1.45c.49-.89 1.03-1.5 1.71-1.5zM156.62 14.3v.45h-3.29v-.45c.83 0 1-.24 1-1V7.4c0-.72-.17-.94-1-1V6h3.13c2.45 0 3.22 1.1 3.22 2.51 0 1.64-1 2.59-2.9 2.59h-1.28v2.2c.02.7.21.97 1.12 1zm-.16-7.7h-1v3.89h1.21c1.24 0 1.71-.53 1.71-1.84.08-1.5-.34-2.05-1.92-2.05zM165.2 13.6l.26.4a3.58 3.58 0 01-2.22.86c-1.79 0-2.86-1.22-2.86-3.31s1.14-3.28 2.68-3.28 2.5 1.11 2.5 3v.34h-4c0 1.85.65 2.45 2 2.45a3.29 3.29 0 001.64-.46zm-3.6-2.54h2.78c0-1.55-.39-2.14-1.34-2.14s-1.35.52-1.44 2.14zM169.76 9.21h-1.3v3.84c0 1 .17 1.22.81 1.22a2.09 2.09 0 00.7-.13l.1.46a2.54 2.54 0 01-1.23.34c-.93 0-1.51-.45-1.51-1.72v-4h-.74v-.4l.83-.29a5.7 5.7 0 01.58-1.76l.59-.16a17.34 17.34 0 00-.13 1.91h1.48zM171.46 16.58l-.25-.39c.72-.29 1.1-.69 1.1-1.05s-.17-.31-.45-.42a.77.77 0 01-.53-.73.9.9 0 01.91-.9c.59 0 1 .54 1 1.28a2.41 2.41 0 01-1.78 2.21zM180.73 14.89c-2.46 0-3.7-1.91-3.7-4.54 0-2.9 1.44-4.51 3.63-4.51 2.64 0 3.68 2.15 3.68 4.59 0 2.68-1.34 4.46-3.61 4.46zm-.07-8.46c-1.65 0-2.36 1.28-2.36 3.77s.61 4.12 2.42 4.12c1.45 0 2.31-1.1 2.31-3.77s-.57-4.12-2.37-4.12zM190.89 13c0 .94.17 1 .91 1.08v.38l-1.51.46h-.18a3.23 3.23 0 01-.27-1.14 2.76 2.76 0 01-2.09 1.12 1.56 1.56 0 01-1.72-1.7v-2.9c0-.94-.19-1-.88-1.08v-.4l1.74-.5h.26V13c0 .8.34 1 .94 1a2.18 2.18 0 001.66-.82v-2.91c0-.93-.18-1-.87-1.08v-.38l1.73-.51h.28zM196.15 8.3a1.38 1.38 0 01.38.06l-.27 1.27a.77.77 0 00-.38-.06c-1 0-1.36.4-1.36 1.64v2.23c0 .72.13.85 1.06.89v.43h-3.12v-.43c.71-.06.88-.17.88-.89v-3.12c0-.92-.17-1.05-.92-1.08v-.39l1.6-.5h.18a4.21 4.21 0 01.26 1.45c.47-.89 1-1.5 1.69-1.5zM203.22 14.3v.45h-3.27v-.45c.83 0 1-.24 1-1V7.4c0-.72-.17-.94-1-1V6h3.14c2.46 0 3.22 1.1 3.22 2.51 0 1.64-1 2.59-2.89 2.59h-1.29v2.2c-.01.7.19.97 1.09 1zm-.11-7.7h-1v3.89h1.21c1.23 0 1.71-.53 1.71-1.84.01-1.5-.37-2.05-1.92-2.05zM212.83 14.27v.42a2.7 2.7 0 01-.86.14c-.89 0-1.07-.37-1.14-.9a2 2 0 01-1.71 1 1.77 1.77 0 01-2-1.81c0-1.53 1.31-2.05 3.27-2.05a3.24 3.24 0 01.44 0v-.56c0-1.1-.25-1.59-1.13-1.59a1.27 1.27 0 00-1.44 1.16h-.8V9a5.34 5.34 0 012.33-.65 1.89 1.89 0 012.17 2.13v2.63c-.04.89.07 1.09.87 1.16zm-2.47-2.6c-1.42 0-2 .39-2 1.37s.35 1.18 1.07 1.18a1.63 1.63 0 001.36-.92v-1.6a3.25 3.25 0 00-.43-.03zM213.53 14.37v-1.23h.83c.08.86.47 1.18 1.34 1.18.71 0 1.28-.29 1.28-1.11s-.36-.94-1.07-1.11l-.73-.17a1.76 1.76 0 01-1.58-1.77c0-1.2 1-1.83 2.18-1.83a3.84 3.84 0 011.88.45v1.15h-.8a1.06 1.06 0 00-1.17-1c-.74 0-1.15.38-1.15 1s.24.82 1 1l.73.17c1.17.27 1.71.82 1.71 1.73a2.11 2.11 0 01-2.39 2.1 3.55 3.55 0 01-2.06-.56zM218.65 14.37v-1.23h.81c.09.86.47 1.18 1.35 1.18.7 0 1.28-.29 1.28-1.11s-.37-.94-1.07-1.11l-.74-.17a1.76 1.76 0 01-1.58-1.77c0-1.2 1-1.83 2.19-1.83a3.87 3.87 0 011.88.45v1.15h-.81a1.06 1.06 0 00-1.17-1c-.73 0-1.14.38-1.14 1s.24.82 1 1l.73.17c1.18.27 1.71.82 1.71 1.73a2.11 2.11 0 01-2.38 2.1 3.65 3.65 0 01-2.06-.56zM226.81 14.32v.43h-2.88v-.43c.71-.06.88-.18.88-.9V10.3c0-.92-.17-1.05-.92-1.08v-.39l1.86-.5h.19v5.08c0 .75.08.86.87.91zm-1.52-6.95a.81.81 0 11.77-.81.79.79 0 01-.77.81zM230.2 14.91c-1.67 0-2.87-1.23-2.87-3.3s1.2-3.29 2.86-3.29c1.84 0 2.89 1.44 2.89 3.35s-1.22 3.24-2.88 3.24zm0-6c-1.25 0-1.63 1-1.63 2.54 0 1.92.45 2.79 1.68 2.79 1.07 0 1.62-.92 1.62-2.56-.02-1.91-.61-2.74-1.68-2.74zM240.22 14.32v.43h-2.82v-.43c.79-.05.88-.18.88-.81v-3.22c0-.75-.32-1-.91-1a2.21 2.21 0 00-1.72.81v3.47c0 .61.08.76.87.8v.43h-2.88v-.43c.71-.06.88-.17.88-.89v-3.16c0-.92-.17-1.05-.92-1.08v-.39l1.6-.5h.18a3.33 3.33 0 01.21 1.1 2.85 2.85 0 012.13-1.09 1.55 1.55 0 011.68 1.7v3.36c.06.74.16.85.82.9zM242.24 14.92a.92.92 0 11.89-.92.89.89 0 01-.89.92z"
              fill="#fff"></path>
            <path d="M115.98.89H20.37v18.45h95.61z"></path>
            <path
              d="M33.71 5.46a3.83 3.83 0 00-1.75-1.16 9.05 9.05 0 00-2.78-.3H24.3v.66h.67a1.25 1.25 0 01.95.33c.07.07.21.36.21 1.29V14a2.61 2.61 0 01-.16 1.22 1.15 1.15 0 01-1 .42h-.67v.68h5.85v-.7h-.69a1.18 1.18 0 01-.93-.33c-.1-.09-.21-.36-.21-1.29v-3.25l.93.15a9.55 9.55 0 001 .06 4.44 4.44 0 003-1 3.21 3.21 0 001.21-2.51 3 3 0 00-.75-1.99zm-2.46 3.91a2 2 0 01-1.53.66h-.63l-.72-.1v-4.8a4.44 4.44 0 011-.13 2.64 2.64 0 011.31.3 2.14 2.14 0 01.88.93 3.13 3.13 0 01.32 1.4 2.44 2.44 0 01-.63 1.74zM46.34 3.87v.68H47a1.22 1.22 0 011 .33c.08.08.21.37.21 1.3V11a7.27 7.27 0 01-.34 2.65 2.78 2.78 0 01-1.29 1.24 4.68 4.68 0 01-2.19.48 3.49 3.49 0 01-1.57-.31 2.63 2.63 0 01-1-.77 3.27 3.27 0 01-.5-1.29 10.49 10.49 0 01-.13-1.59V6.18a2.19 2.19 0 01.21-1.24 1.07 1.07 0 011-.39h.66v-.68h-5.88v.68h.67a1.17 1.17 0 01.89.29c.13.14.28.48.28 1.34v4.7a8.86 8.86 0 00.33 3 4 4 0 001.61 1.92 6.44 6.44 0 003.31.71 6 6 0 003.19-.71 3.84 3.84 0 001.56-1.8 8.35 8.35 0 00.4-2.87V6.25a2.48 2.48 0 01.17-1.2 1.14 1.14 0 011-.52h.67v-.66zM67.46 15.66a3.7 3.7 0 01-1.61-.46 6.34 6.34 0 01-1.52-1.55s-1.94-2.5-2.51-3.25a4.41 4.41 0 002.23-1.15 2.85 2.85 0 00.81-2 2.75 2.75 0 00-.72-1.9 3.67 3.67 0 00-1.73-1.08 12.18 12.18 0 00-3.08-.29h-4.87v.68h.67a1.28 1.28 0 011 .33c.07.07.2.36.2 1.29V14a2.34 2.34 0 01-.17 1.2 1.07 1.07 0 01-1 .42h-.7v.68h5.85v-.68h-.68a1.14 1.14 0 01-.93-.33c-.11-.03-.24-.29-.24-1.29v-3.29h1.04l4.37 5.63h3.73v-.64zM58.8 9.78h-.34V5.11A7.38 7.38 0 0159.75 5a2.54 2.54 0 011.84.65 2.2 2.2 0 01.69 1.71 2.17 2.17 0 01-.82 1.72 4.16 4.16 0 01-2.66.7zM70.92 4v.68h.63a1.69 1.69 0 01.78.19.6.6 0 01.3.29 3.15 3.15 0 01.11 1.14v7.81c0 .89-.11 1.18-.19 1.25a1.16 1.16 0 01-1 .37h-.63v.68h5.85v-.68h-.64a1.56 1.56 0 01-.76-.19.52.52 0 01-.31-.29 3.15 3.15 0 01-.11-1.14V6.25c0-.89.13-1.18.19-1.25a1.18 1.18 0 011-.37h.64V4zM95.58 4h-4.85v.68h.63a1.22 1.22 0 011 .31c.09.09.23.36.23 1.27v6.45l-7.71-8.78h-3.76v.68h.19a2.53 2.53 0 01.78.08 2.42 2.42 0 01.8.34 5.75 5.75 0 01.78.74v8.29a2.77 2.77 0 01-.21 1.22 1.23 1.23 0 01-1 .38h-.63v.68h4.85v-.68h-.65a1.25 1.25 0 01-1-.31c-.07-.07-.21-.36-.21-1.27v-7l8.31 9.41h.6V6.21A2.58 2.58 0 0193.94 5a1.19 1.19 0 011-.39h.65V4zM111.86 15.66a2 2 0 01-1.12-.36 4.39 4.39 0 01-.93-1.52l-4.43-10.12h-.63l-4.65 10a5.15 5.15 0 01-1 1.68 2.09 2.09 0 01-1 .31h-.15v.64h4.41v-.62h-.17a2.4 2.4 0 01-1.1-.23c-.14-.12-.21-.21-.21-.35a2.81 2.81 0 01.3-1s.65-1.39.82-1.78h4.75c.17.37.72 1.63.72 1.63a3.2 3.2 0 01.36 1.16.42.42 0 01-.19.35 1.66 1.66 0 01-.93.19h-.17v.66h5.49v-.62zm-7.4-8.61l1.86 4.26h-3.86z"
              fill="#fff"></path>
            <path d="M19.72.89H0v18.45h19.72z" fill="#eb2027"></path>
            <path d="M19.02 1.55H.71v17.13h18.31z" fill="#fff"></path>
            <path
              d="M7.03 12.76H1.46V18h5.57zM18.3 12.76h-5.62V18h5.62zM12.66 7.47H7.03v5.27h5.63zM7.03 2.21H1.46v5.26h5.57zM18.3 2.21h-5.62v5.26h5.62z"
              fill="#eb2027"></path>
            <path
              d="M121.38.45a1.66 1.66 0 00-1.16-.45 1.62 1.62 0 00-1.16.45 1.39 1.39 0 00-.48 1.06 1.4 1.4 0 00.48 1.08 1.67 1.67 0 001.16.45 1.7 1.7 0 001.16-.45 1.46 1.46 0 00.47-1.08 1.38 1.38 0 00-.47-1.06zm-.21 2a1.34 1.34 0 01-2.3-.93 1.25 1.25 0 01.38-.91 1.29 1.29 0 01.95-.37 1.37 1.37 0 011 .37 1.26 1.26 0 01.38.91 1.31 1.31 0 01-.41.9z">
            </path>
            <path
              d="M120.46 1.61c.34 0 .5-.22.5-.49s-.23-.5-.65-.5h-.76v1.76h.3v-.75h.31l.51.75h.32zm-.59-.2V.85h.4c.27 0 .4.08.4.27s-.11.29-.47.29z">
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

    </div>
  </div>

  <!--JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們JS們-->
  <script src="${pageContext.request.contextPath}/views/catInfo/files/my_home_1.js"></script>

  <script src="${pageContext.request.contextPath}/views/catInfo/files/my_home_4.js"></script>
  <script src="${pageContext.request.contextPath}/views/catInfo/files/my_search.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
  <script>
	$('#query,#location').focusin(  
	  function(){  
	    $("#location").css({"width": "320px","padding": "1.5rem"});
	  }).focusout(  
	  function(){  
	    $("#location").css({"width": "0px","padding": "0px", "margin": "0px"});
	  });

  </script>
  
  <script>
  

  
  	$(".fa-location-arrow").on("click", function(){
  		navigator.geolocation.getCurrentPosition(function(position){
  		  // 取得 position 位置資訊，可於 console 中印出來看看
  		 alert(position);
  		});

  	});
  
  </script>
  <!-- <script src="files/flickity.pkgd.min.js"></script> -->
<!--   <script src="files/js_pOzsLAyMBlX-_8a0VTDlP6z8nBu3ETSxU_4x1HKfbE8.js"></script> -->
<!--   <script src="files/script.js"></script> -->

</body>

</html>