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
            <title>商品詳情</title>

            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Cairo:wght@200;300;400;600;900&display=swap"
                rel="stylesheet">

            <!-- Css Styles -->
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/bootstrap.min.css"
                type="text/css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/font-awesome.min.css"
                type="text/css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/elegant-icons.css"
                type="text/css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/nice-select.css" type="text/css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/jquery-ui.min.css"
                type="text/css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/owl.carousel.min.css"
                type="text/css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/slicknav.min.css"
                type="text/css">
            <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/css_ecommerce/style.css"
                type="text/css">
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery-3.6.0.min.js"></script>

            <!-- 彈窗 -->
            <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

            <!-- 首頁 -->


            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/index_vector/css/homepage.css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/index_vector/css/homepage2.css">
            <link rel="stylesheet"
                href="${pageContext.request.contextPath}/views/ecommerce/index_vector/css/homepage3.css">



            <script>
                $(function () {

                    //彈窗
                    // document.getElementById("aCart").addEventListener("click", function () {
                    //     swal("成功加入", "已加入購物車!", "success", {
                    //         timer: 700
                    //     });
                    // });

                    // 將商品送進購物車
                    $(document).on("click", "#aCart", function () {

                        let limit = $("#limit").val();

                        let num = $("#pnum").text();
                        // 該產品所有屬性 json 打包
                        let allAttr =JSON.stringify({
                            attrN1:attrN1,
                            attrN2:attrN2,
                            attrV1:attrV1,
                            attrV2:attrV2
                        });
                       

                        // 
                        let skuPrice = $("#price").text();
                        let spuID = $("#spuID").val();
                        let descript = $("#ist").text();
                        let skuID = $("#skuID").val();

                        num = parseInt(num);
                        skuPrice = parseInt(skuPrice);

                        if (limit <= 0 || limit > num) {
                            swal("數量有誤", "無法執行!", "error", {
                                timer: 700
                            });
                            return;
                        }
                        console.log(limit)

                        let data = {
                            action: "addItem",
                            cartItem: {
                                num: limit,
                                skuPrice: skuPrice,
                                spuID: spuID,
                                descript: descript,
                                skuID, skuID,
                                allAttr:allAttr
                            },
                           
                        }

                        if (!isNaN(num) && !isNaN(skuPrice)) {
                            console.log("都是數字");

                            fetch("${pageContext.request.contextPath}/shCartAction", {
                                method: 'POST',
                                body: JSON.stringify(data)
                            }).then(function (response) {
                                return response.json();
                            }).then(function (res) {
                                swal("成功加入", res, "success", {
                                    timer: 1000
                                });

                            })

                            return;
                        }

                        console.log("不是數字");
                        return;
                    });



                    // 迴圈綁定事件 點選回顯
                    $("img .tag").on("click", function () {
                        console.log("hi");
                    });



                    // 規格排版
                    let attr = [];
                    <c:forEach items="${skuVO}" var="skuVO">
                        attr.push(JSON.parse(${skuVO}));
                    </c:forEach>
                    // 先列出屬性
                    let attrN1 = null;
                    let attrN2 = null;
                    let attrV1 = [];
                    let attrV2 = [];

                    for (let i = 0; i < attr.length; i++) {

                        let n1 = attr[i].attrN1.trim();
                        let n2 = attr[i].attrN2.trim();
                        if (n1.length != 0) {
                            attrN1 = n1;
                        }
                        if (n2.length != 0) {


                            attrN2 = n2;



                            console.log("84" + attrN1);
                        }
                        let v1 = attr[i].attrV1.trim();
                        let v2 = attr[i].attrV2.trim();
                        if (v1.length != 0) {
                            //若該陣列沒有重複元素 就加入
                            if (!attrV1.includes(v1)) {
                                attrV1.push(v1);
                            }
                        }

                        if (v2.length != 0) {
                            //若該陣列沒有重複元素 就加入
                            if (!attrV2.includes(v2)) {
                                attrV2.push(v2);
                            }
                        }
                    }
                    // 檢查specAttr


                    let row = '';
                    // 嵌入 ist
                    if (attrN1.length != null) {
                        // 先加入元素
                        row += attrN1 + " : ";
                        // v1元素
                        for (let i = 0; i < attrV1.length; i++) {
                            row += '<span style="margin:0px 3px">' + attrV1[i] + '</span>';
                            row += '<input id="ck" type="radio" name="spec1" value="' + attrV1[i] + '" >'
                        }
                        row += "<br><br>"
                        console.log(row);
                    }
                    $("#ist").after(row);
                    row = "";

                    if (attrN2 != null) {

                        // 先加入元素
                        row += attrN2 + " : ";
                        // v1元素
                        for (let i = 0; i < attrV2.length; i++) {
                            row += '<span style="margin:0px 3px">' + attrV2[i] + '</span>';
                            row += '<input id="ck" type="radio" name="spec2" value="' + attrV2[i] + '"  style="margin:0px 3px" >'
                        }
                        row += "<br><br>"
                    }

                    $("#ist").after(row);

                    console.log(attrN1)
                    console.log(attrN2)
                    console.log(attrV1)
                    console.log(attrV2)



                    // 選擇屬性後尋找對應的數量以及價格
                    $(document).on("change", "#ck", function () {



                        let spuID = $("#spuID").val();
                        let key1 = null;
                        key1 = $("input[name='spec1']:checked").val();



                        let key2 = null;
                        // 如果attrN2 == null 就不取
                        if (attrN2 != null) {
                            key2 = $("input[name='spec2']:checked").val();
                        }


                        // 若n2不為null 代表有兩個屬性，需點選兩個才傳請求
                        if (attrN2 != null && key1 != null && key2 != null) {
                            let arr = [key1, key2];
                            let data = { arr: arr, action: "getPrcSk", spuID, spuID };


                            fetch("${pageContext.request.contextPath}/cartAction", {
                                method: 'POST',
                                body: JSON.stringify(data)
                            }).then(function (response) {
                                return response.json();
                            }).then(function (res) {
                                $("#pnum").text(res.stock);
                                $("#price").text(res.skuPrice);
                                $("#skuID").val(res.skuID);
                                $("#restNum").text(res.stock)
                                // 數量規範 購物車增減
                                $("#limit").attr("max",res.stock);

                            })

                        } else if (attrN1 != null && key1 != null) {
                            let arr = [key1];
                            let data = { arr: arr, action: "getPrcSk", spuID, spuID };


                            fetch("${pageContext.request.contextPath}/cartAction", {
                                method: 'POST',
                                body: JSON.stringify(data)
                            }).then(function (response) {
                                return response.json();
                            }).then(function (res) {

                                $("#pnum").text(res.stock);
                                $("#price").text(res.skuPrice);
                                $("#skuID").val(res.skuID);
                                $("#restNum").text(res.stock);
                                $("#limit").attr("max",res.stock);

                            })



                        }

                    });








                });
            </script>
        </head>

        <body>
            <!-- Page Preloder -->
            <div id="preloder">
                <div class="loader"></div>
            </div>



            <!-- Header Section Begin -->
            <header class="header">
                <div class="header__top">
                    <div class="container">

                        <!-- 阿德 -->






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
                                        id="block-consumer-react-main-menu"
                                        class="block block-menu navigation menu--main">
                                        <h2 class="visually-hidden" id="block-consumer-react-main-menu-menu">Main
                                            navigation
                                        </h2>
                                        <ul class="menu menu-level-0">

                                            <li class="menu-item menu-item--expanded">
                                                <button aria-expanded="false" type="button"></button>
                                                <div class="menu-inner menu-level-1">
                                                    <ul class="menu">

                                                        <li class="menu-item">
                                                            <a href="" data-icon="icon-dog" tabindex="-1"
                                                                aria-hidden="true">
                                                                <span class="link-icon">
                                                                    <svg role="img" focusable="false">
                                                                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                            xlink:href="#icon-dog"></use>
                                                                    </svg>
                                                                </span>
                                                                <span class="link-title">Dog Breeds</span>
                                                            </a>

                                                        </li>
                                                        <li class="menu-item">
                                                            <a href="#" data-icon="icon-cat" tabindex="-1"
                                                                aria-hidden="true">
                                                                <span class="link-icon">
                                                                    <svg role="img" focusable="false">
                                                                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                            xlink:href="#icon-cat"></use>
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

                                                            <button
                                                                class="visually-hidden-unless-focused hidden-btn open-sub-menu"
                                                                role="button" aria-haspopup="true" aria-expanded="false"
                                                                aria-label="About Pet Adoption">Open
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
                                                            <button
                                                                class="visually-hidden-unless-focused hidden-btn open-sub-menu"
                                                                role="button" aria-haspopup="true" aria-expanded="false"
                                                                aria-label="Dog Care">Open Submenu</button>
                                                            <ul class="menu menu-level-2">
                                                                <li class="menu-item">
                                                                    <a href="#">如何照顧貓咪</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <!--收容中心-->
                                                        <li class="menu-item menu-item--expanded">
                                                            <a href="#" data-eventtype="EVENT TYPE"
                                                                data-category="global-nav"
                                                                data-action="cat-care">收容中心</a>
                                                            <button
                                                                class="visually-hidden-unless-focused hidden-btn open-sub-menu"
                                                                role="button" aria-haspopup="true" aria-expanded="false"
                                                                aria-label="Cat Care">Open Submenu</button>
                                                            <ul class="menu menu-level-2">

                                                                <li class="menu-item">
                                                                    <a href="">收容所資訊</a>

                                                                </li>


                                                            </ul>



                                                        </li>
                                                        <!--幫助貓咪  -->
                                                        <li class="menu-item menu-item--expanded">
                                                            <a href="#">幫助貓咪</a>

                                                            <button
                                                                class="visually-hidden-unless-focused hidden-btn open-sub-menu"
                                                                role="button" aria-haspopup="true" aria-expanded="false"
                                                                aria-label="All Pet Care">Open
                                                                Submenu</button>


                                                            <ul class="menu menu-level-2">

                                                                <li class="menu-item">
                                                                    <a href="#">如何領養貓咪</a>

                                                                </li>


                                                            </ul>



                                                        </li>


                                                        <!--購物/二手商城 路徑-->
                                                        <li class="menu-item menu-item--expanded">
                                                            <a
                                                                href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物</a>

                                                            <button
                                                                class="visually-hidden-unless-focused hidden-btn open-sub-menu"
                                                                role="button" aria-haspopup="true" aria-expanded="false"
                                                                aria-label="Shelters &amp; Rescues">Open
                                                                Submenu</button>


                                                            <ul class="menu menu-level-2">

                                                                <li class="menu-item">
                                                                    <a
                                                                        href="${pageContext.request.contextPath}/comAction?action=ecoMainP">購物</a>
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
                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-favorite">
                                            </use>
                                        </svg>
                                        <span class="visually-hidden">Favorites</span>
                                    </a>
                                    <!--購物車-->
                                    <a href="${pageContext.request.contextPath}/shCartAction?action=getCart" class="nav-favorites-btn nav-cart-btn">
                                        <svg role="img" focusable="false">
                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-cart">
                                            </use>
                                        </svg>
                                        <span class="visually-hidden">Favorites</span>
                                    </a>
                                    <button type="button" id="resources-btn" class="nav-resources-btn">
                                        <svg role="img" focusable="false">
                                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-menu">
                                            </use>
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

                        <!-- 阿德 -->
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



            <!-- Breadcrumb Section Begin -->
            <section class="breadcrumb-section set-bg"
                data-setbg="${pageContext.request.contextPath}/views/ecommerce/img_ecommerce/bgp3.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <div class="breadcrumb__text">
                                <h2>產品名稱</h2>
                                <div class="breadcrumb__option">
                                    <a href="/index.html">商城</a>
                                    <a href="./index.html">產品類別</a>
                                    <span>產品名稱</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- Breadcrumb Section End -->

            <!-- Product Details Section Begin -->
            <section class="product-details spad">
                <div class="container">
                    <div class="row">
                        <div class="col-lg-6 col-md-6">
                            <div class="product__details__pic">
                                <div id="showOff" class="product__details__pic__item">
                                    <img class="product__details__pic__item--large"
                                        src="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=0&spuID=${spuID}"
                                        alt="">
                                </div>

                                <style>






                                </style>

                                <div class="product__details__pic__slider owl-carousel">

                                    <img data-imgbigurl="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=0&spuID=${spuID}"
                                        src="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=0&spuID=${spuID}"
                                        alt="">
                                    <img data-imgbigurl="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=1&spuID=${spuID}"
                                        src="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=1&spuID=${spuID}"
                                        alt="">
                                    <img data-imgbigurl="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=2&spuID=${spuID}"
                                        src="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=2&spuID=${spuID}"
                                        alt="">
                                    <img data-imgbigurl="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=3&spuID=${spuID}"
                                        src="${pageContext.request.contextPath}/cartAction?action=getSpuPic&pnum=3&spuID=${spuID}"
                                        alt="">
                                </div>

                            </div>
                        </div>
                        <div class="col-lg-6 col-md-6">
                            <!-- 存spuID skuID -->
                            <input id="spuID" type="hidden" value="${spuID}">
                            <input id="skuID" type="hidden">
                            <div class="product__details__text">
                                <h3>${prodName}</h3><br><br><br>
                                <!-- <div class="product__details__price">$價格</div> -->
                                <h6><strong>商品詳情</strong></h6><br>
                                <p id="ist">${descript}</p>


                                <div class="product__details__quantity">
                                    <div class="quantity">
                                        <div class="pro-qty">
                                            <input id="limit" min="1" type="number" class="qt" value="1">
                                        </div>
                                    </div>
                                </div>
                                <a id="aCart" style="color: white;" class="primary-btn">加入購物車</a>
                     
                               


                                <ul>
                                    <li><b>剩餘數量</b> <span style="font-size: 25px; color:red" id="pnum"></span></li>
                                    <li><b>價格</b> <span style="font-size: 25px; color:red" id="price"></span></li>

                                </ul>

                            </div>
                        </div>

                    </div>
                </div>
            </section>
            <!-- Product Details Section End -->



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
                                    <li>gitHub: </li>
                                    <li>Phone: 09</li>
                                    <li>Email: zack871025@gmail.com</li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 col-sm-6 offset-lg-1">
                            <div class="footer__widget">
                                <h6>相關連結</h6>
                                <ul>
                                    <li><a href="#">動物中心</a></li>
                                    <li><a href="#">動物中心</a></li>
                                    <li><a href="#">動物中心</a></li>
                                    <li><a href="#">動物中心</a></li>
                                    <li><a href="#">動物中心</a></li>
                                    <li><a href="#">動物中心</a></li>
                                </ul>
                                <ul>
                                    <li><a href="#">關於我們</a></li>
                                    <li><a href="#">我們的服務</a></li>
                                    <li><a href="#">專案</a></li>
                                    <li><a href="#">Contact</a></li>
                                    <li><a href="#">ER mode;</a></li>
                                    <li><a href="#">聯絡方式</a></li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12">
                            <div class="footer__widget">

                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="footer__copyright">
                                <div class="footer__copyright__text">
                                    <p>

                                    </p>
                                </div>
                                <div class="footer__copyright__payment"><img src="img_ecommerce/payment-item.png"
                                        alt=""></div>
                            </div>
                        </div>
                    </div>
                </div>
            </footer>
            <!-- Footer Section End -->

            <!-- Js Plugins -->
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery-3.3.1.min.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/bootstrap.min.js"></script>
            <script
                src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery.nice-select.min.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery-ui.min.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/jquery.slicknav.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/mixitup.min.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/owl.carousel.min.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/js_ecommerce/main.js"></script>
            <script src="${pageContext.request.contextPath}/views/ecommerce/index_vector/js/homepage.js"></script>

        </body>

        </html>