<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html>

<head>
    <meta charset='utf-8'>
    <meta name='viewport' content='width=device-width, initial-scale=1'>
    <title>商品新增</title>
    <link href='${pageContext.request.contextPath}/views/ecommerce//goodEdit/bootstrap.css' rel='stylesheet'>
    <link href='${pageContext.request.contextPath}/views/ecommerce//goodEdit/fontAwesome.css' rel='stylesheet'>
    <link href="${pageContext.request.contextPath}/views/ecommerce//goodEdit/goodEdit.css" rel='stylesheet'>


    <script type='text/javascript' src="./goodEdit/jQuery.js"></script>
    <script type='text/javascript' src='./goodEdit/vector.js'></script>
    <script type='text/javascript' src='./goodEdit/bootstrap.js'></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round|Open+Sans">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <!-- <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
   
</head>

<body class='snippet-body'>
    <div class="container-fluid px-1 py-5 mx-auto">
        <div class="row d-flex justify-content-center">
            <div class="col-xl-5 col-lg-6 col-md-7">
                <div class="card b-0">
                    <h3 class="heading">新增商品</h3>
                    <p class="desc">完成四步驟 完成商品新增
                    <ul id="progressbar" class="text-center">
                        <li class="active step0" id="step1"></li>
                        <li class="step0" id="step2"></li>
                        <li class="step0" id="step3"></li>
                        <li class="step0" id="step4"></li>
                    </ul>



                    <fieldset class="show">
                        <div class="form-card">
                            <h5 class="sub-heading">選擇你要上架的產品類型</h5>
                            <div id="allcateOptions" class="row px-1 radio-group">

                            <!-- 產品類別 -->
                            <c:forEach items="${categoryList}" var="category">
                          		
                                <div class="card-block text-center radio ">

                                    <p class="sub-desc">${category.ctgName}</p>
                                </div>
                             </c:forEach>
                             

                            </div>
                            <button class="btn-block btn-primary mt-3 mb-1 cancel">取消</button>
                            <button id="next1" style="display:none;"
                                class="btn-block btn-primary mt-3 mb-1 next attrlist ">下一步<span
                                    class="fa fa-long-arrow-right"></span></button><br>
                        </div>
                        <div style="height: 50px; width: 30px;">

                        </div>

                    </fieldset>


                    <fieldset>
                        <div class="form-card">
                            <h5 class="sub-heading mb-4">商品詳情</h5> <label class="text-danger mb-3">*
                                必須填寫</label>
                            <div id="ist" class="form-group"> <label class="form-control-label">商品名稱 * :</label>
                                <input type="text" id="pname" name="pname" placeholder="" class="form-control f2"
                                    onblur="validate1(1)">
                            </div>



                            <div class="form-group"> <label class="form-control-label">商品描述 * :</label>
                                <textarea id="itemdesc" name="lname" placeholder="" class="form-control f2"
                                    onblur="validate1(2)" style="height: 250px;"></textarea>
                            </div>

                            <div class="form-group"> <label class="form-control-label">商品主要照片 * :</label>
                                <input accept="image/*" type="file" id="itemp1" name="itemp1" placeholder=""
                                    class="form-control f2 pic" onblur="validate1(3)"
                                    style="height:auto;padding:5px 5px;">
                                <div style="height: auto;">
                                    <img id="imgshow" style="height:300px; width:300px;margin:10px 30px">
                                </div>
                            </div>

                            <div class="form-group"> <label class="form-control-label">商品照片 * :</label> <input
                                    accept="image/*" type="file" multiple id="itempall" name="itempall" placeholder=""
                                    class="form-control f2 picsub" onblur="validate1(4)"
                                    style="height:auto;padding:5px 5px;"> </div>

                            <div style="height: auto;">
                                <img id="imgshowsub1" style="height:80px; width:80px;margin:10px 30px">
                                <img id="imgshowsub2" style="height:80px; width:80px;margin:10px 30px">
                                <img id="imgshowsub3" style="height:80px; width:80px;margin:10px 30px">
                            </div>
                            <button class="btn-block btn-primary mt-3 mb-1 cancel">取消</button>
                            <button id="next2" class="btn-block btn-primary mt-3 mb-1 next mt-4 "
                                onclick="validate1(0)">下一頁<span class="fa fa-long-arrow-right"></span></button> <button
                                class="btn-block btn-secondary mt-3 mb-1 prev p1"><span
                                    class="fa fa-long-arrow-left"></span>前一頁</button>

                        </div>
                    </fieldset>







                    <!--  -->


                    <fieldset>
                        <div class="form-card" style="position:relative; min-height: 800px;">
                            <h5 class="sub-heading mb-4" style="display: inline;">商品規格 :</h5>
                            <button id="addattr2" style="width: 60px; display: inline-block; margin-left: 10px;"
                                class="button-12" role="button">新增</button><br><br>
                                <!-- <h5 class="sub-heading mb-4" style="display: inline;">進行組合 ：</h5>
                            <button id="confirmAttr" style="width: 60px; display: inline-block; margin-left: 10px;"
                                class="button-12" role="button">go !</button> -->
                            <label class="text-danger mb-3"></label>


                            <div id="loc" class="form-group" style="position:relative; margin: 10px auto;">
                                <!-- js table -->
                                <!-- 編輯頁面 -->
                                <article class="-hide">
                                    <!-- 新增規格 -->

                                    <div id="newSpec" class="container-sm" style="margin-top: 20px; z-index: 4;">
                                        <h6 style="margin-top: 10px; color: #E34724;"> 定義規格</h6>
                                        <div class="table-responsive">
                                            <div class="table-wrapper">
                                                <div class="table-title">
                                                    <div class="row">
                                                        <div class="col-sm-4">
                                                            <a id="saveAttr" href="#"
                                                                style="margin-right: 10px; margin-bottom: 30px;">儲存</a>
                                                            <br>
                                                            <br>
                                                            <button type="button" class="btn btn-info add-new"><i
                                                                    class="fa fa-plus"></i> 新增
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                                <table class="table table-bordered">
                                                    <thead>
                                                        <tr>
                                                            <th>名稱</th>
                                                            <th>屬性1</th>
                                                            <th>屬性2</th>
                                                            <th>屬性3</th>
                                                            <th>操作</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <!-- 模板 -->
                                                        <tr style="display: none;">
                                                            <td><input>1</td>
                                                            <td><input>2</td>
                                                            <td><input>3</td>
                                                            <td><input>4</td>
                                                            <td>
                                                                <a class="add" title="Add" data-toggle="tooltip"><i
                                                                        class="material-icons">&#xE03B;</i></a>
                                                                <a class="edit" title="Edit" data-toggle="tooltip"><i
                                                                        class="material-icons">&#xE254;</i></a>
                                                                <a class="delete" title="Delete"
                                                                    data-toggle="tooltip"><i
                                                                        class="material-icons">&#xE872;</i></a>
                                                            </td>
                                                        </tr>
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- 到這裡 -->
                                </article>
                                <!-- 座標 -->
                                <div id="attrField" style=" padding: 5px 5px; ">





                                </div>
                                
                            </div>
                            <div  style="height: 200px;">



                            </div>
                            <button id="next3" class="btn-block btn-primary mt-3 mb-1 next mt-4 finalck finalSubmit"
                                onclick="validate2(0)">送出<span class="fa fa-long-arrow-right"></span></button> <button
                                class="btn-block btn-secondary mt-3 mb-1 prev"><span
                                    class="fa fa-long-arrow-left"></span>前一頁</button>
                        </div>
                    </fieldset>
                    <fieldset>
                        <div class="form-card">
                            <h5 class="sub-heading mb-4">Success!</h5>
                            <p class="message">商品已成功上架！！</p>
                            <div class="check">
                                 <img class="fit-image check-img" src="#">
                            </div>
                            <div style="height: 300px; width: auto;">

                            </div>
                        </div>
                    </fieldset>
                </div>
            </div>
        </div>
    </div>
    <!--  -->

    <script src="${pageContext.request.contextPath}/views/ecommerce//goodEdit/additemjq.js"></script>
   
</body>

</html>