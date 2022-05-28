<%@ page contentType="text/html;charset=UTF-8" language="java" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

    <!DOCTYPE html>
    <!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
    <html lang="en">

    <head>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1">
      <title>管理員後台</title>





     
      <!-- Google Font: Source Sans Pro -->
      <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,400i,700&display=fallback">
      <!-- Font Awesome -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/fontawesome-free/css/all.min.css">
      <!-- Ionicons -->
      <link rel="stylesheet" href="https://code.ionicframework.com/ionicons/2.0.1/css/ionicons.min.css">
      <!-- Tempusdominus Bootstrap 4 -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/tempusdominus-bootstrap-4/css/tempusdominus-bootstrap-4.min.css">
      <!-- iCheck -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/icheck-bootstrap/icheck-bootstrap.min.css">
      <!-- JQVMap -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/jqvmap/jqvmap.min.css">
      <!-- Theme style -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/dist/css/adminlte.min.css">
      <!-- overlayScrollbars -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/overlayScrollbars/css/OverlayScrollbars.min.css">
      <!-- Daterange picker -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/daterangepicker/daterangepicker.css">
      <!-- summernote -->
      <link rel="stylesheet" href="${pageContext.request.contextPath}/views/ecommerce/plugins/summernote/summernote-bs4.min.css">

      <script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>

      <link rel="stylesheet" href="dist/css/btn.css">

      <!-- sweetalert2 -->
      <script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>

      <script src="${pageContext.request.contextPath}/views/ecommerce/plugins/jquery/jquery.min.js"></script>


      <!-- Bootstrap 4 -->
      <script src="${pageContext.request.contextPath}/views/ecommerce/plugins/bootstrap/js/bootstrap.bundle.min.js"></script>
      <!-- AdminLTE App -->
      <script src="${pageContext.request.contextPath}/views/ecommerce/dist/js/adminlte.min.js"></script>

      <script src="${pageContext.request.contextPath}/views/ecommerce//goodEdit/jQuery.js"></script>
      <!-- good的js檔案 -->
      <script src="${pageContext.request.contextPath}/views/ecommerce/goodEdit/goodPage.js"></script>
<!-- 
      <script src="<%=request.getContextPath()%>/resources/background/js/btn.js"></script>

      <script src="<%=request.getContextPath()%>/resources/background/js/system.js"></script> -->
      
      <script src="https://kit.fontawesome.com/f944d9625b.js" crossorigin="anonymous"></script>
<!-- kurt -->




<!-- kurt -->
      <script>
      
$(function(){
// 資料回填編輯表
$(document).on("click", "#rs", function () {
    console.log("點擊")

  })
})





  

          

     


      </script>
      <style>
        div.overlay {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100vh;
          background-color: hsla(0, 0%, 0%, .5);
          z-index: 3;
          display: none;
        }

        /* 元素 article 置中及基本樣式 */
        div.overlay>article {
          background-color: white;
          width: 80%;
          max-width: 400px;
          border-radius: 10px;
          box-shadow: 0 0 10px #ddd;
          padding: 20px;
          position: absolute;
          top: 50%;
          left: 60%;
          height: 450px;
          transform: translate(-50%, -50%);
        }
      </style>


    </head>

    <body class="hold-transition sidebar-mini">
      <div class="wrapper">

        <%@ include file="/views/ecommerce/pages/background.file" %>



        <!-- Content Wrapper. Contains page content -->
        <div class="content-wrapper" >
          <div id="insert">
            <!-- Content Header (Page header) -->
            <section class="content-header">
              <div class="container-fluid">
                <div class="row mb-2">
                  <div class="col-sm-6">
                    <h1>商品管理</h1>
                  </div>
                  <div class="col-sm-6">
                    <ol class="breadcrumb float-sm-right">
                      <li class="breadcrumb-item"><a href="starter.html">Home</a></li>
                      <li class="breadcrumb-item active">商品管理</li>
                    </ol>
                  </div>
                </div>
              </div><!-- /.container-fluid -->
            </section>


            <!-- 商品修改 -->
            <div class="overlay" style="border: 1px solid black;">
              <article>
                <h3>名稱:<span id="itemName"> </span></h3>
                <br>
                <span style="margin: 10px 3px;font-size: 18px;">
                  商品規格: <span id="itemAttr"></span>
                </span><br>
                價格：<input id="itemPrice" style="margin: 20px auto;" type="number" min="0" value=""><br>
                庫存：<input id="itemStock" style="margin: 20px auto;" type="number" min="0" value=""><br>
                <input id="itemID" type="hidden" value="">
                <span style="margin: 0px 3px; color: crimson;">狀態 :</span>
                <span>上架
                  <input type="radio" name="status" value="1"></span>
                <span>下架
                  <input type="radio" name="status" value="0"></span>
                <br>

                <button id="updateProd" type="button" style="margin-left:50%; margin-top:20%;"
                  class=" btn-success">更改</button>
                <button type="button" style="margin-left:5px" class="btn_modal_close btn-danger">取消</button>
              </article>
            </div>
            <!--  -->

            <div class="row">
              <div class="col-12">
                <div class="card">
                  <div class="card-header">
                    <h3 class="card-title"></h3>
                    <button id="additem" style=" margin-right: 10px; margin-top: 30px;" class="btn btn-primary">
                      新增產品</button>

                    <div class="card-tools">
                      <div class="input-group input-group-sm" style="width: 150px;">
                        <input id="srh" type="text" name="table_search" class="form-control float-right" placeholder="商品名稱">

                        <div class="input-group-append">
                          <button id="searchByName" type="submit" class="btn btn-default">
                            <i class="fas fa-search"></i>
                          </button>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- /.card-header -->
                  <div class="card-body table-responsive p-0">
                    <table id="tb" class="table table-hover text-nowrap">
                      <thead>
                        <tr>
                          <th>商品名稱</th>
                          <th>商品類型</th>
                          <th>商品價格</th>
                          <th>商品庫存</th>
                          <th>商品狀態</th>
                          <th>規格</th>
                          <th>上架時間</th>
                          <th>操作</th>
                        </tr>
                      </thead>
                      <tbody>
                        <c:forEach items="${allProds}" var="allProds" varStatus="loop">
                          <tr>
                            <td class="name">${allProds.spuVO.spuName}</td>

                            <c:forEach items="${categoryList}" var="category">
                              <c:if test="${allProds.spuVO.ctgID == category.ctgID}">
                                <td> ${category.ctgName}</td>
                              </c:if>

                            </c:forEach>
                            <td class="price">${allProds.skuPrice}</td>
                            <td class="stock">${allProds.stock}</td>
                            <td><span class="tag tag-success">${allProds.status==1?"上架":"<span style='color: red;'>下架</span>"}</span></td>
                            <!-- 用hidden傳該skuID -->
                            <input class="status" type="hidden" value=${allProds.status}>
                            <input id="${allProds.skuID}" class="skuID" type="hidden" value=${allProds.skuID}>
                            <td class="attr">${allProds.specAttr}</td>
                            <td>${allProds.addedTime}</td>
                            <td>
                              <button id="rs" type="button" class="btn_modal btn btn-danger" ;>
                                編輯
                              </button>
                            </td>
                          </tr>
                        </c:forEach>

                        
                      </tbody>

  
                    </table>
                    <div style="height: 350px;width: 10px; ">

                    </div>
                  
                    
                  </div>
                  <!-- /.card-body -->
                </div>
                <!-- /.card -->
                <!-- <nav aria-label="Page navigation example">
                  <ul class="pagination">
                    <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">Next</a></li>
                  </ul>
                </nav> -->
              </div>
            </div>
            
            <!-- /.content -->
          </div>
        </div>
        <!-- /.content-wrapper -->
      </div>

    </body>

    </html>