<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <!DOCTYPE html>
    <html lang="zxx">

    <head>
      <meta charset="UTF-8">
      <meta name="description" content="Ogani Template">
      <meta name="keywords" content="Ogani, unica, creative, html">
      <meta name="viewport" content="width=device-width, initial-scale=1.0">
      <meta http-equiv="X-UA-Compatible" content="ie=edge">
      <title>購物商城</title>

      <!-- Google Font -->
      <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
        rel="stylesheet">

      <!-- Css Styles -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/bootstrap.min.css"
        type="text/css">
      <link rel="stylesheet"
        href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/font-awesome.min.css" type="text/css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/elegant-icons.css"
        type="text/css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/nice-select.css"
        type="text/css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/jquery-ui.min.css"
        type="text/css">
      <link rel="stylesheet"
        href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/owl.carousel.min.css" type="text/css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/slicknav.min.css"
        type="text/css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/style.css"
        type="text/css">
      <!-- index -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/index_vector/css/homepage.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/index_vector/css/homepage2.css">
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/index_vector/css/homepage3.css">
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.js"></script>
    </head>

    <body>


      <!-- 暫時寫在這 -->


      <script>
        $(function () {


          // 分頁選單
          // $(document).on("click", ".ppppg", function () {
          //   let curPage = $(this).attr("name");

          //   $.ajax({


          //     url: "${pageContext.request.contextPath}/comAction",
          //     data: JSON.stringify({
          //       "action": "ecoMainP",
          //       "curPage": curPage
          //     }),
          //     type: "POST",
          //     success: function () {
          //       // 表示重新載入url 在指定的定方load
          //       $("#prodList").load("http://localhost:8081/Adopets/views/ecommerce/Pet_Supplement.jsp #prodList")
          //     }
          //   })

          // });


          // 查詢選單
          $(document).on("click", ".pg", function () {

            let lowC = 0;
            let highC = 0;
            let prodName = 0;
            let ctgName = 0;
            let curPage = 0;
            lowC = $("#lowC").val();
            highC = $("#highC").val();
            prodName = $("#prodName").val();
            ctgName = $(".ctg").val();

            curPage = $(this).attr("name");
            // 預設值 ctgName = -1;
            if (typeof (curPage) == "undefined") {
              curPage = 0;
            }      
            $.ajax({
              url: "${pageContext.request.contextPath}/comAction",
              data: JSON.stringify({
                "lowC": lowC,
                "highC": highC,
                "prodName": prodName,
                "action": "requirement",
                "ctgID": ctgName,
                "curPage": curPage
              }),
              type: "POST",
              success: function () {
                $("#prodList").load("http://localhost:8081/Adopets/views/ecommerce/Pet_Supplement.jsp #prodList")
              }

            })




          })
          ///// 滑鼠移入 移出 顯示
          $(".mos").mouseenter( function() {
            $(this).css("border-bottom","5px solid purple");
          }).mouseleave(function () {
            $(this).css("border-bottom","none");
          });

        })
      </script>








      <!-- Page Preloder -->
      <div id="preloder">
        <div class="loader"></div>
      </div>



      <!-- Header Section Begin -->
      <header class="header">
        <div class="header__top">
          <div class="container">

            <!--  -->

            <!-- 阿德header -->




            <div class="region region-navigation">
              <div class="region--inner">
                <div class="main-navigation">
                  <!--這裡是logo-->
                  <div iclass="logo">
                    <a href="#" rel="home" class="site-logo">
                      <img src="${pageContext.request.contextPath}/views/ecommerce/index_vector/img/Adopets.svg" alt="Home">
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

                            <li class="menu-item">
                              <a href="" data-icon="icon-dog" tabindex="-1" aria-hidden="true">
                                <span class="link-icon">
                                  <svg role="img" focusable="false">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-dog"></use>
                                  </svg>
                                </span>
                                <span class="link-title">Dog Breeds</span>
                              </a>

                            </li>
                            <li class="menu-item">
                              <a href="#" data-icon="icon-cat" tabindex="-1" aria-hidden="true">
                                <span class="link-icon">
                                  <svg role="img" focusable="false">
                                    <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-cat"></use>
                                  </svg>
                                </span>
                                <span class="link-title">Cat Breeds</span>
                              </a>

                            </li>

                          </ul>
                        </div>
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
                            <!--幫助貓咪  -->
                            <li class="menu-item menu-item--expanded">
                              <a href="#">幫助貓咪</a>

                              <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                                aria-haspopup="true" aria-expanded="false" aria-label="All Pet Care">Open
                                Submenu</button>


                              <ul class="menu menu-level-2">

                                <li class="menu-item">
                                  <a href="#">如何領養貓咪</a>

                                </li>


                              </ul>



                            </li>


                            <!--購物/二手商城 路徑-->
                            <li class="menu-item menu-item--expanded">
                              <a href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物</a>

                              <button class="visually-hidden-unless-focused hidden-btn open-sub-menu" role="button"
                                aria-haspopup="true" aria-expanded="false" aria-label="Shelters &amp; Rescues">Open
                                Submenu</button>


                              <ul class="menu menu-level-2">

                                <li class="menu-item">
                                  <a href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物</a>
                                </li>


                              </ul>



                            </li>
                            <!--會員資料-->
                            <li class="menu-item menu-item--expanded">
                              <a href="#">會員資料</a>
                              <ul class="menu menu-level-2">
                                <li class="menu-item">
                                  <a href="#">會員中心</a>
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


                </div>
                <!--我的最愛+購物車+登入+登出-->
                <div class="profile-navigation">
                  <!--我的最愛-->
                  <a href="#" class="nav-favorites-btn">
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
                      <li><a href="#" class="header-inner-profile-btn">註冊</a></li>
                      <li><a href="#" class="header-inner-profile-btn">登入</a></li>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
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













            <!--  -->




            <!--  -->
            <!-- <div class="row">
                    <div class="col-lg-6 col-md-6">

                    </div>
                    <div class="col-lg-6 col-md-6">
                        <div class="header__top__right">
                            <div class="header__top__right__social">
                                <a href="#"><i class="fa fa-facebook"></i></a>
                                <a href="#"><i class="fa fa-twitter"></i></a>
                                <a href="#"><i class="fa fa-linkedin"></i></a>
                                <a href="#"><i class="fa fa-pinterest-p"></i></a>
                            </div>
                            <div class="header__top__right__language">
                                <img src="img_ecommerce/language.png" alt="">
                                <div>English</div>
                                <span class="arrow_carrot-down"></span>
                                <ul>
                                    <li><a href="#">中文</a></li>
                                    <li><a href="#">English</a></li>
                                </ul>
                            </div>
                            <div class="header__top__right__auth">
                                <a href="#"><i class="fa fa-user"></i> Login</a>
                            </div>
                        </div>
                    </div>
                </div> -->
          </div>
        </div>



        <!--  -->
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <div class="header__logo">
                <!-- <a href="./index.html"><img src="./img_ecommerce/Adopets.svg" alt=""></a> -->
              </div>
            </div>
            <div class="col-lg-6">
              <nav class="header__menu">
                <ul>
                  <!-- <li class="active"><a href="./index.html">Home</a></li> -->
                </ul>
              </nav>
            </div>
            <div class="col-lg-3">
              <div class="header__cart">
                <ul>

                  <!-- <li><a href="#"><i class="fa fa-shopping-bag"></i> <span>( 產品數量 )</span></a></li> -->
                </ul>
                <!-- <div class="header__cart__price">價格 : <span>這裡可以寫價格</span></div> -->
              </div>
            </div>
          </div>
          <div class="humberger__open">
            <i class="fa fa-bars"></i>
          </div>
        </div>
      </header>
      <!-- Header Section End -->

      <!-- Hero Section Begin -->
      <section class="hero">
        <div class="container">
          <div class="row">
            <div class="col-lg-3">
              <div class="hero__categories">
                <div class="hero__categories__all">
                  <i class="fa fa-bars"></i>
                  <span>近期活動</span>
                </div>
                <!-- <ul>
                            <li><a href="#">挑選禮物</a></li>
                        </ul>    -->
              </div>




            </div>
            <div class="col-lg-9">
              <!-- <div class="hero__search"> -->
              <div style="border: 1px; border-color: black; border-top-style: solid; border-bottom-style: solid; ">
                <form action="#">

                  <select class="ctg" name="ctgName">
                    <option value="-1">選擇類型</option>
                    <c:forEach items="${categoryList}" var="category">
                      <option value="${category.ctgID}">${category.ctgName}</option>
                    </c:forEach>
                  </select>





                  <input id="lowC" style="margin-left: 20px;" type="number" placeholder="最低價格">
                  <input id="highC" style="margin-left: 20px;" type="number" placeholder="最高價格">



                  <input id="prodName" style="margin-left: 20px;" type="text" placeholder="請輸入你需要什麼?">
                  <p class="site-btn pg" style="margin-left: 20px;">Search</p>






                </form>
              </div>
              <div class="hero__search__phone">


              </div>

            </div>
          </div>
        </div>
        </div>
        </div>
      </section>
      <!-- Hero Section End -->



      <!-- Product Section Begin -->
      <section class="product spad">
        <div id="prodList" class="container">
          <div class="row">
            <div class="col-lg-3 col-md-5">
              <div class="sidebar">


                <div class="sidebar__item">
                  <div class="latest-product__text">
                    <h4>Latest Products</h4>
                    <div class="latest-product__slider owl-carousel">
                      <div class="latest-prdouct__slider__item">
                        <a href="#" class="latest-product__item">
                          <div class="latest-product__item__pic">
                            <img src="img_ecommerce/latest-product/lp-1.jpg" alt="">
                          </div>
                          <div class="latest-product__item__text">
                            <h6>Crab Pool Security</h6>
                            <span>$30.00</span>
                          </div>
                        </a>
                        <a href="#" class="latest-product__item">
                          <div class="latest-product__item__pic">
                            <img src="img_ecommerce/latest-product/lp-2.jpg" alt="">
                          </div>
                          <div class="latest-product__item__text">
                            <h6>Crab Pool Security</h6>
                            <span>$30.00</span>
                          </div>
                        </a>
                        <a href="#" class="latest-product__item">
                          <div class="latest-product__item__pic">
                            <img src="img_ecommerce/latest-product/lp-3.jpg" alt="">
                          </div>
                          <div class="latest-product__item__text">
                            <h6>Crab Pool Security</h6>
                            <span>$30.00</span>
                          </div>
                        </a>
                      </div>
                      <div class="latest-prdouct__slider__item">
                        <a href="#" class="latest-product__item">
                          <div class="latest-product__item__pic">
                            <img src="img_ecommerce/latest-product/lp-1.jpg" alt="">
                          </div>
                          <div class="latest-product__item__text">
                            <h6>Crab Pool Security</h6>
                            <span>$30.00</span>
                          </div>
                        </a>
                        <a href="#" class="latest-product__item">
                          <div class="latest-product__item__pic">
                            <img src="img_ecommerce/latest-product/lp-2.jpg" alt="">
                          </div>
                          <div class="latest-product__item__text">
                            <h6>Crab Pool Security</h6>
                            <span>$30.00</span>
                          </div>
                        </a>
                        <a href="#" class="latest-product__item">
                          <div class="latest-product__item__pic">
                            <img src="img_ecommerce/latest-product/lp-3.jpg" alt="">
                          </div>
                          <div class="latest-product__item__text">
                            <h6>Crab Pool Security</h6>
                            <span>$30.00</span>
                          </div>
                        </a>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-9 col-md-7">

              <div class="filter__item">
                <div class="row">
                  <div class="col-lg-4 col-md-5">
                    <!-- <div class="filter__sort">
                      <span>價格排序</span>
                      <select >
                        <option value="0">低到高</option>
                        <option value="0">高到低</option>
                      </select>
                    </div> -->
                  </div>
                  <div class="col-lg-4 col-md-4">
                    <div class="filter__found">
                      <h6>共有<span>" ${skuPage.total} "</span>樣產品</h6>
                    </div>
                  </div>
                </div>
              </div>


              <!--                   這裡開始迴圈                 -->

              <div class="row">
                <%-- 應該是多對一--%>
                  <c:forEach items="${skuPage.list}" var="skuPage">
                    <div class="col-lg-3 col-md-4 col-sm-6">
                      <div id="mos" class="product__item mos">
                        <div class="product__item__pic ">
                          <!-- 路徑 -->
                          <img src="${pageContext.request.contextPath}/comAction?action=getPic&skuID=${skuPage.skuID}"
                            width="150px" height="150px" />
                          <ul class="product__item__pic__hover">

                            <li><a href="#"><i class="fa fa-shopping-cart"></i></a></li>
                          </ul>
                        </div>
                        <div class="product__item__text">

                          <h6><b><a href="${pageContext.request.contextPath}/cartAction?action=getDetail&spuID=${skuPage.spuVO.spuID}">${skuPage.spuVO.spuName}</a></b></h6>

                          <p style="margin-bottom:5px;">${skuPage.specAttr}</p>
                          <h5 style="color:purple">${skuPage.skuPrice}</h5>
                        </div>
                      </div>
                    </div>


                  </c:forEach>
























              </div>


              <div class="product__pagination">
                <a class="pg" name="${skuPage.prePage}"><i class="fa fa-long-arrow-left"></i></a>



                <c:forEach begin="1" end="${skuPage.pages}" var="i">
                  <c:if test="${skuPage.pageNum==i}">
                    <%-- 如果目前頁數等於現在頁數 就會顯示下面的a --%>


                      <a class="pg" name="${i}" style="background-color: grey">${i}</a>

                  </c:if>
                  <c:if test="${skuPage.pageNum!=i}">
                    <%-- 如果 目前頁數等於現在頁數 就會顯示下面的a--%>

                      <a class="pg" name="${i}">${i}</a>

                  </c:if>
                </c:forEach>

                <a class="pg" name="${skuPage.nextPage}"><i class="fa fa-long-arrow-right"></i></a>
              </div>
            </div>
          </div>
        </div>
      </section>
      <!-- Product Section End -->



      <!-- 送禮物 -->
      <!-- Featured Section Begin -->
      <!-- <section class="featured spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="section-title">
                    <h2>挑選禮物</h2>
                </div>




                <div class="featured__controls">
                    <ul>
                        <li class="active" data-filter="*">All</li>
                        <li data-filter=".oranges">類別1</li>
                        <li data-filter=".fresh-meat">類別2</li>
                        <li data-filter=".vegetables">類別3</li>
                        <li data-filter=".fastfood">類別4</li>
                    </ul>
                </div>
            </div>
        </div> -->


      <!-- 產品table -->



      </div>
      </section>
      <!-- Featured Section End -->







      <!-- Footer Section Begin -->
      <footer class="footer spad">
        <div class="container">
          <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
              <div class="footer__about">
                <div class="footer__about__logo">
                  <a href="./index.html"><img src="img_ecommerce/logo.png" alt=""></a>
                </div>
                <ul>
                  <li>Address: 60-49 Road 11378 New York</li>
                  <li>Phone: +65 11.188.888</li>
                  <li>Email: hello@colorlib.com</li>
                </ul>
              </div>
            </div>
            <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
              <div class="footer__widget">
                <h6>Useful Links</h6>
                <ul>
                  <li><a href="#">About Us</a></li>
                  <li><a href="#">About Our Shop</a></li>
                  <li><a href="#">Secure Shopping</a></li>
                  <li><a href="#">Delivery infomation</a></li>
                  <li><a href="#">Privacy Policy</a></li>
                  <li><a href="#">Our Sitemap</a></li>
                </ul>
                <ul>
                  <li><a href="#">Who We Are</a></li>
                  <li><a href="#">Our Services</a></li>
                  <li><a href="#">Projects</a></li>
                  <li><a href="#">Contact</a></li>
                  <li><a href="#">Innovation</a></li>
                  <li><a href="#">Testimonials</a></li>
                </ul>
              </div>
            </div>
            <div class="col-lg-4 col-md-12">
              <div class="footer__widget">
                <h6>Join Our Newsletter Now</h6>
                <p>Get E-mail updates about our latest shop and special offers.</p>
                <form action="#">
                  <input type="text" placeholder="Enter your mail">
                  <button type="submit" class="site-btn">Subscribe</button>
                </form>
                <div class="footer__widget__social">
                  <a href="#"><i class="fa fa-facebook"></i></a>
                  <a href="#"><i class="fa fa-instagram"></i></a>
                  <a href="#"><i class="fa fa-twitter"></i></a>
                  <a href="#"><i class="fa fa-pinterest"></i></a>
                </div>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-lg-12">
              <div class="footer__copyright">
                <div class="footer__copyright__text">
                  <p>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                    Copyright &copy;
                    <script>document.write(new Date().getFullYear());</script> All rights reserved | This
                    template is made with <i class="fa fa-heart" aria-hidden="true"></i> by <a
                      href="https://colorlib.com" target="_blank">Colorlib</a>
                    <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                  </p>
                </div>
                <div class="footer__copyright__payment"><img src="img_ecommerce/payment-item.png" alt=""></div>
              </div>
            </div>
          </div>
        </div>
      </footer>
      <!-- Footer Section End -->





      <!-- Js Plugins -->
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery-3.3.1.min.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/bootstrap.min.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery.nice-select.min.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery-ui.min.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery.slicknav.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/mixitup.min.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/owl.carousel.min.js"></script>
      <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/main.js"></script>

      <script src="${pageContext.request.contextPath}/views/ecommerce/index_vector/js/homepage.js"></script>


    </body>

    </html>