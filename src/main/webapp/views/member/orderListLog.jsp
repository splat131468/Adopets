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
    <title>認養紀錄</title>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/bootstrap.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/views/member/css/member.css">
</head>
<body>
    <div class="container">
        <div class="row mb-3 justify-content-center mt-5">
            <div class="col-8 themed-grid-col">
              <div class="row memberTabBar">
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/member.jsp" class="">會員資料</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/myFavorite.jsp" class="">我的最愛</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/adoptLog.jsp" class="">認養紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/donateLog.jsp" class="">捐款紀錄</a>
                </div>
                <div class="col-2">
                  <a href="<%=request.getContextPath()%>/views/member/orderListLog.jsp" class="active">訂單紀錄</a>
                </div>
                <div class="col-2">
                  <a href="#" class="">我想登出</a>
                </div>
              </div>
            </div>
        </div>
    </div>
    <div class="wrap mt-5">
        <table class="table align-middle">
            <thead>
              <tr>
                <th scope="col">訂單編號</th>
                <th scope="col">購買日期</th>
                <th scope="col">賣家名稱</th>
                <th scope="col">購買金額</th>
                <th scope="col">訂單狀態</th>
                <th scope="col">訂單明細</th>
              </tr>
            </thead>
            <tbody>
              <tr>
                <td>202204040444</td>
                <td>2022/04/04</td>
                <td>克偉</td>
                <td>12,345</td>
                <td>尚未付款</td>
                <td>
                    <button class="btn btn-primary btnPurple theCheck">查看</button>
                </td>
              </tr>
              <tr>
                <td class="displayNone" colspan="6">
                    <div class="orderListLog">
                        <table class="table mb-0 align-middle ">
                            <thead>
                                <tr class="">
                                    <th scope="col">產品圖片</th>
                                    <th scope="col">產品名稱</th>
                                    <th scope="col">商品數量</th>
                                    <th scope="col">購買單價</th>
                                    <th scope="col">小計</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="w-25">
                                        <img src="<%=request.getContextPath()%>/views/member/image/xmark-solid.svg" alt="" class="adoptLogImg">
                                    </td>
                                    <td>罐頭</td>
                                    <td>1</td>
                                    <td>10</td>
                                    <td>10</td>
                                </tr>
                                <tr>
                                    <td class="w-25">
                                    <img src="<%=request.getContextPath()%>/views/member/image/user.png" alt="" class="adoptLogImg">
                                    </td>
                                    <td>衣服</td>
                                    <td>2</td>
                                    <td>7</td>
                                    <td>14</td>
                                </tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td>總金額</td>
                                    <td>24元</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                  </td>
              </tr>
              <tr>
                <td>202204040555</td>
                <td>2022/04/04</td>
                <td>克偉</td>
                <td>23,456</td>
                <td>已付款</td>
                <td>
                    <button class="btn btn-primary btnPurple theCheck">查看</button>
                </td>
              </tr>
              <tr>
                <td class="displayNone" colspan="6">
                    <div class="orderListLog">
                        <table class="table mb-0 align-middle ">
                            <thead>
                                <tr class="">
                                    <th scope="col">產品圖片</th>
                                    <th scope="col">產品名稱</th>
                                    <th scope="col">商品數量</th>
                                    <th scope="col">購買單價</th>
                                    <th scope="col">小計</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="w-25">
                                        <img src="<%=request.getContextPath()%>/views/member/image/xmark-solid.svg" alt="" class="adoptLogImg">
                                    </td>
                                    <td>罐頭</td>
                                    <td>10</td>
                                    <td>10</td>
                                    <td>100</td>
                                </tr>
                                <tr>
                                    <td class="w-25">
                                    <img src="<%=request.getContextPath()%>/views/member/image/user.png" alt="" class="adoptLogImg">
                                    </td>
                                    <td>衣服</td>
                                    <td>2</td>
                                    <td>7</td>
                                    <td>14</td>
                                </tr>
                                <tr>
                                    <td colspan="3"></td>
                                    <td>總金額</td>
                                    <td>114元</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                  </td>
              </tr>
              <tr>
                <td>202204040666</td>
                <td>2022/04/04</td>
                <td>克偉</td>
                <td>34,567</td>
                <td>出貨中</td>
                <td>
                    <button class="btn btn-primary btnPurple">查看</button>
                </td>
              </tr>
              <tr>
                <td>202204040777</td>
                <td>2022/04/04</td>
                <td>克偉</td>
                <td>45,678</td>
                <td>已送達</td>
                <td>
                    <button class="btn btn-primary btnPurple">查看</button>
                </td>
              </tr>
            </tbody>
          </table>
          <p class="text-end">共<span class="orderListCount"></span>筆資料</p>
          <!-- 這裡還要寫SPAN標籤內的數字 -->
    </div>
    <script src="<%=request.getContextPath()%>/views/member/js/address.js"></script>
    <script src="<%=request.getContextPath()%>/views/member/js/jquery-3.6.0.min.js"></script>
    <script src="<%=request.getContextPath()%>/views/member/js/orderListLog.js"></script>
    <script src="<%=request.getContextPath()%>/views/member/js/memberTabBar.js"></script>
</body>
</html>