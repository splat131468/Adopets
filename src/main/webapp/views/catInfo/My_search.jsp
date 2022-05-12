

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="web.catInfo.service.*"%>
<%@ page import="web.catInfo.entity.*"%>

<%
	CatInfoService catInfoService = new CatInfoService();
	/* CatInfoVO catInfoVO = new CatInfoVO(); */
	CatInfoVO catInfoVO = (CatInfoVO) request.getSession().getAttribute("catInfoVO");
	/* List<CatInfoVO> list = catInfoService.getMulti(catInfoVO); */
	
	/* int listn = (Integer) request.getSession().getAttribute("size"); */
	/* List<CatInfoVO> list = catInfoService.getAll(); */
 	List<CatInfoVO> lists = (ArrayList) request.getSession().getAttribute("lists");
 	/* pageContext.setAttribute("list",list); */
  	pageContext.setAttribute("lists",request.getSession().getAttribute("lists"));
 	/* pageContext.setAttribute("list",request.getSession().getAttribute("list")); */
 /* 	if (!request.getSession().isNew()) {
	 	Integer n = (Integer) request.getSession().getAttribute("size");
 		
 	} */
    
  
%>

<%-- --${catInfoVO.breed}--
--${catInfoVO.breed == null}-- --%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>貓咪搜尋頁面</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/my_search_1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/my_search_2_1.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/views/catInfo/files/my_search_3.css">
    
    <style>
        body {
            font-family: helvetica, arial, sans-serif;
        }
        
        .criticalFontsAreLoaded body {
            font-family: 'Nexa Regular', helvetica, arial, sans-serif;
        }
        </style>

</head>


<body class="js-globalEnsighten ">
			  
    <!--常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤常用標籤-->
    <div id="Svg_Defs_Critical" class="u-isHidden">
        <svg>
            <defs></defs>
            <symbol id="logo-consumer" viewBox="0 0 379 108.5">
                <title>logo-consumer</title>
                <circle cx="185.2" cy="24.5" r="6.7"></circle>
                <path
                    d="M370.2 30.4c-6.2 0-11 4.3-13.8 8.6.1-1.1.1-2 .1-2.8-.4-3.3-3.4-5.6-6.7-5.2-2.8.3-4.9 2.5-5.2 5.3 0 3.6.8 9.1.8 14.9 0 1 0 1.9-.1 2.8-5.5 5.6-12.3 10-21 10-6.6 0-9.6-2.5-10.9-6.1 15.3-.1 23.1-6.2 23.1-15.4 0-7.1-6.2-12.1-15-12.1-11.5 0-21 8.7-21 22.3-.1 2.8.4 5.6 1.4 8.3-1.3 1.8-3.3 2.8-5.5 2.7-4.3 0-5.9-3.4-5.9-21.8 0-8.9.8-18.6.8-27.1 0-3.3-2.6-6-5.9-6-3.3 0-6 2.6-6 5.9 0 4.8.4 10.1.6 18.2-2.1-1.3-5.2-2.4-10.1-2.4-15 0-23 11.7-23 21.9-.1 2.9.5 5.9 1.5 8.6-1.7 1.6-3.9 2.5-6.2 2.6-2.5 0-5.2-2.2-5.2-10.3 0-1.8.3-9 .3-11.7 0-7-5.1-11.2-12.6-11.2-7.1 0-11.9 4-14.8 8.6.1-1.1.1-2 .1-2.8-.4-3.3-3.4-5.6-6.7-5.2-2.8.3-4.9 2.5-5.2 5.3 0 3.6.8 9.1.8 14.9 0 1 0 1.9-.1 2.8-.5 4.5-7.2 9.5-13 9.5-7.5 0-10.4-4.3-10.4-11.3 0-3.2 2.5-5.5 2.5-9.1 0-4.2-3.3-7.6-7.5-7.7-4.2 0-7.6 3.3-7.7 7.5v.4c0 3.3 2.5 5.6 2.5 8.7 0 7-3.1 11.4-10.4 11.4-5.7 0-13.3-5.4-14-10.6v.2c8.1-7.7 22.3-22.9 22.3-36C163.1 7 157.7.1 148 .1c-12 0-18.2 8.8-18.2 17.9 0 3.8.5 15.9.5 32.8v2.5c-2.8 4.3-6.8 10.2-12.4 10.2-3 0-4.9-2.1-5.7-5.4-.9-3.6-.7-8.4-.7-13.5 0-1.8 0-3.7.1-5.5 3.8.1 7 .1 9.1.1 2.5.1 4.5-1.9 4.6-4.4 0-2.6-1.8-4.5-4.7-4.5-2.6 0-5.7.1-8.6.1.2-4.5.4-8.8.4-12.4.4-3.3-2-6.3-5.3-6.6-3.3-.4-6.3 2-6.6 5.3v1.4c0 1.1.3 6.6.5 12.2-1.2 0-2.3-.1-3.5-.1-2.4-.1-4.5 1.8-4.6 4.2v.3c.1 2.5 2.1 4.4 4.6 4.4 1 0 2.1-.1 3.8-.1v1c0 2-.3 6.7-.6 10.9-6.1 7-13.6 13.1-23.9 13.1-6.6 0-9.6-2.5-10.8-6.1 15.3-.1 23.1-6.2 23.1-15.4 0-7.1-6.2-12.1-15.1-12.1-11.5 0-21 8.7-21 22.3 0 2 .2 4 .7 6-4.2 2.4-8.8 4.2-13.6 5.2 2.9-3.8 4.5-8.5 4.5-13.2 0-14.3-9.9-20.2-20.1-20.2-4.6 0-9.1 1.4-12.7 4.2-.8-2.6-3.2-4.3-5.9-4.2C2.6 30.4 0 33 0 36.3c0 3.6.8 13.4.8 26.4S0 84.3 0 89.3c0 3.5 1.9 5.9 5.1 5.9 3 0 6.9-2.4 6.9-5.9 0-1.3-.5-9.4-.8-19.6 4.9 2.2 10.5 2.6 18 2.6 12.3 0 22.3-4.5 27.6-7.4 3.7 4.8 10.1 7.4 19 7.4 11.1 0 19.8-6.4 24.9-11.2 1.2 7.6 6.5 11.3 15.3 11.3 6.6 0 11.3-4.1 14.3-7.8-.2 11.8-.7 21.4-.7 26.6 0 14.1 7.9 17.2 13.7 17.2 11.7 0 17.9-9.1 17.9-19.4-.1-6.1-2.1-11.9-5.8-16.7 5.3-.1 10.7-1.3 14.9-7.4 4.2 6.6 11.2 7.4 15.3 7.4 5 0 9-2.1 12.4-5.4.5 3.3 3.5 5.6 6.8 5.1 2.8-.4 4.9-2.7 5.1-5.5 0-1.1-.4-5.9-.6-10.4 0-6.1 6.4-16.8 12.1-16.8 2.9 0 4.7 2.5 4.7 6 0 2.7-.3 8-.3 11.5 0 8.3 2.1 15.6 13.8 15.6 4.8-.1 9.4-1.9 13-5.2 4 3.5 9.1 5.3 14.4 5.2 5.9 0 11.6-2.4 15.7-6.8 1.4 3.4 4.6 6.7 11.6 6.7 4.6.1 8.9-1.8 11.9-5.3 3.8 3.4 9.6 5.3 17.1 5.3 8.9 0 16.2-4.1 21.4-8.2 0 .8-.1 1.6-.1 2.3.4 3.3 3.3 5.7 6.6 5.3 2.8-.3 5-2.5 5.3-5.2 0-1.1-.4-6-.6-10.5.1-7.2 7.4-15.9 11-15.9 2.4 0 1.9 3.3 6.3 3.3 3.2 0 5.7-2.6 5.7-5.8 0-2.7-2-7.2-8.7-7.2zm-228.6-12c0-5.1 3-8.9 6.2-8.9 3.6 0 5.1 3.6 5.1 7.4 0 9.4-6.8 18.3-11.8 24.1.1-8.6.5-20.8.5-22.6zM20.8 63.5c-3.6.1-7-1.3-9.6-3.8 0-2.6.1-5 .1-7.3v-.3c0-5.7 4.2-13.1 12-13.1 4.7 0 9.4 3.7 9.4 11.8 0 9-6.3 12.7-11.9 12.7zm53.1-25.6c2.8-.2 5.2 2 5.4 4.8v.3c0 4.7-3 7.7-14.2 7.8 0-10 5.5-12.9 8.8-12.9zm72.7 61.4c-3.2 0-4.9-3-4.9-7.8 0-.5-.2-11.6-.4-22.3 3.3 4.2 10.3 11.5 10.3 21.2-.1 6.5-2.7 8.9-5 8.9zm133.6-48.4c0 5.7-4.3 13.1-12 13.1-4.7 0-9.4-3.7-9.4-11.8 0-9.1 6.3-13.2 12-13.2 3.6-.1 7 1.4 9.4 4.1v7.8zm41.2-13c2.9-.1 5.3 2.1 5.4 5v.1c0 4.5-3 7.6-14.2 7.8-.1-10 5.4-12.9 8.8-12.9zm47.8 31c.1 1.9-1.4 3.6-3.3 3.7h-.3c-1.9.1-3.5-1.4-3.6-3.3v-.4c0-2 1.6-3.6 3.6-3.6s3.6 1.6 3.6 3.6zm-6.5 0c-.1 1.5 1 2.9 2.6 3h.3c1.5.1 2.8-1.1 2.9-2.6v-.4c.1-1.6-1.1-2.9-2.6-3h-.2c-1.5-.1-2.8 1.1-2.9 2.6-.1.2-.1.3-.1.4zm3.6.5c.6-.2 1-.8.9-1.5-.1-.6-.7-.9-1.2-.9h-1.7v3.8h.7v-1.4h.6l1.1 1.3h.8v-.1l-1.2-1.2zm-.4-1.7c.3 0 .6.2.7.5 0 .3-.2.6-.5.7h-1.2v-1.2h1z">
                </path>
            </symbol>
            <symbol id="icon-account" viewBox="0 0 29.78 31.06">
                <title>icon-accounts</title>
                <ellipse cx="14.89" cy="7.02" rx="7.07" ry="7.02"></ellipse>
                <path
                    d="M14.89,17.87C6.66,17.87,0,20.54,0,25.38V26c0,3.44,2.3,5.07,5.1,5.07H24.67c2.81,0,5.1-1.62,5.1-5.07v-.61C29.78,20.54,23.11,17.87,14.89,17.87Z">
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
            <symbol id="icon-dog" viewBox="0 0 101.8 87.7">
                <circle cx="21.8" cy="16.3" r="2.7"></circle>
                <path
                    d="M100.1 27.8C81 27.8 81 44.5 81 50v26.8c0 2.9-2.3 5.2-5.2 5.2h-.6c-2.9 0-5.2-2.3-5.2-5.2v-8.5c0-2.6-1.2-5.2-3.1-6.8-1.6-1.4-3.6-2-5.7-1.7l-18.1 2.7c-5.1.9-8.2 4.1-8.2 8.5v5.9c0 2.9-2.3 5.2-5.2 5.2h-.6c-2.9 0-5.2-2.3-5.2-5.2V35.7H25c.9 0 1.7-.7 1.7-1.7 0-.9-.7-1.7-1.7-1.7H14.1c-6.6 0-9.2-6.4-9.4-6.7-1.7-4.1-1.5-5.7-1.4-6.1.4-.3 2-1.2 7.1-2.2 1.7-.4 3-1.3 4-2.9 1.2-1.7 2.5-3.6 2.8-3.9C19.1 8.3 21 7.4 24.9 7c0 0 3.9-.3 7.6 0h.5l7.1-1.4c1.5-.3 1.7-.1 2.5.9l.1.2c2 2.5 5.7 8.1 6.9 13.3-.4.5-2.4 1.4-4.9 1-2.1-.3-5.8-1.6-7.1-7.1-.2-.9-1.1-1.4-2-1.2s-1.4 1.1-1.2 2c1.4 5.8 5.1 8.7 9 9.5v3.4c0 5.6 3.2 8.9 8.9 8.9h9.2c.9 0 1.7-.7 1.7-1.7 0-.9-.7-1.7-1.7-1.7h-9.2c-3.8 0-5.5-1.7-5.5-5.5v-3.1c.6 0 1.2-.1 1.7-.2 3.2-.7 5-2.6 4.5-4.7-1.3-5.4-5-11.4-7.7-14.8l-.1-.1C44 3.2 42.8 2 39.5 2.6L32.7 4c-4-.4-7.8 0-8 0-4.8.5-7.5 1.8-9.9 4.6-.4.5-2.4 3.3-3 4.1-.6.9-1.2 1.3-2 1.5-4.9 1-7.9 2.2-8.9 3.3-.9.9-1.7 3.2.8 9.5.1.4 3.6 8.7 12.4 8.7h6.4v41.1c0 4.7 3.8 8.5 8.5 8.5h.6c4.7 0 8.5-3.8 8.5-8.5v-5.9c0-3.7 3.4-4.9 5.4-5.2l18-2.6c1.3-.2 2.4.4 3 .9 1.2 1 1.9 2.7 1.9 4.3v8.5c0 4.7 3.8 8.5 8.5 8.5h.6c4.7 0 8.5-3.8 8.5-8.5V50c0-8.8 1.8-18.9 15.8-18.9.9 0 1.7-.7 1.7-1.7s-.4-1.6-1.4-1.6z">
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
            <symbol id="icon-strokedPaw" viewBox="0 0 42.26 40.83">
                <title>icon-paw</title>
                <path
                    d="M10.42 17.57c0-3.51-2.34-6.36-5.21-6.36S0 14.06 0 17.57s2.34 6.35 5.21 6.35 5.21-2.85 5.21-6.35zm-5.21 4.57c-1.9 0-3.44-2.05-3.44-4.58s1.54-4.58 3.44-4.58 3.42 2.06 3.42 4.59-1.52 4.57-3.42 4.57zM42.26 17.56c0-3.5-2.34-6.35-5.21-6.35s-5.21 2.85-5.21 6.36a.89.89 0 1 0 1.77 0c0-2.52 1.54-4.58 3.44-4.58s3.44 2.05 3.44 4.58c0 2.52-1.54 4.57-3.44 4.57a.89.89 0 0 0 0 1.78c2.87 0 5.21-2.85 5.21-6.36zM27.63 12.72c2.87 0 5.21-2.85 5.21-6.36S30.49 0 27.63 0s-5.21 2.85-5.21 6.36 2.32 6.36 5.21 6.36zm0-10.94c1.9 0 3.44 2.05 3.44 4.58s-1.56 4.58-3.44 4.58-3.44-2.05-3.44-4.58 1.53-4.58 3.44-4.58zM14.63 12.72c2.87 0 5.21-2.85 5.21-6.36S17.52 0 14.63 0 9.42 2.85 9.42 6.36s2.35 6.36 5.21 6.36zm0-10.94c1.9 0 3.44 2.05 3.44 4.58s-1.53 4.58-3.44 4.58-3.44-2.05-3.44-4.58 1.56-4.58 3.44-4.58zM33.63 28.65l-5.5-9.63c-1.82-3.17-4.31-4.92-7-4.92s-5.18 1.75-7 4.92l-5.5 9.62a11.12 11.12 0 0 0-.9 2 7.54 7.54 0 0 0-.5 2.69.61.61 0 0 0 0 .08 7.5 7.5 0 0 0 7.1 7.41h.3a7.35 7.35 0 0 0 2.91-.59c.66-.26 1.76-.76 2.9-1.3l.41.17a18.59 18.59 0 0 0 7.07 1.71 7.51 7.51 0 0 0 7.14-7.39 9 9 0 0 0-.49-2.72 11.18 11.18 0 0 0-.94-2.05zm-5.72 10.39a15.1 15.1 0 0 1-5.28-1.14l.34-.17 1-.46a.86.86 0 0 0 .18-.14l1-.51.94-.48a.89.89 0 0 0-.8-1.59l-1 .48c-1.55.79-4.14 2.12-5.23 2.57l-.1.07c-.83.39-1.6.73-2.08.92a5.2 5.2 0 0 1-2.4.45h-.09a5.72 5.72 0 0 1-5.42-5.62.35.35 0 0 0 0-.07 5.82 5.82 0 0 1 .4-2.09 9.27 9.27 0 0 1 .77-1.7l5.49-9.65c1.49-2.6 3.43-4 5.47-4s4 1.43 5.47 4l5.53 9.63a9.47 9.47 0 0 1 .77 1.7 7.21 7.21 0 0 1 .42 2.18 5.71 5.71 0 0 1-5.38 5.62z">
                </path>
            </symbol>
            <symbol id="icon-alertBell" viewBox="0 0 36.33 39.11">
                <title>icon-alertBell</title>
                <circle cx="18.01" cy="6.43" r="1.02"></circle>
                <path
                    d="M35.17,29.39c-2.49-1.36-3.39-5.49-3.39-7.94V17.3A11.55,11.55,0,0,0,24.4,6.51V6.36a6.35,6.35,0,0,0-6-6.36,6.23,6.23,0,0,0-6.46,6.23v.27A11.55,11.55,0,0,0,4.54,17.3v4.16c0,1.5-.24,6.52-3.33,7.91A2.08,2.08,0,0,0,0,31.26v1.86a1.79,1.79,0,0,0,1.79,1.79H12.12a6.45,6.45,0,0,0,12.1,0H34.54a1.83,1.83,0,0,0,1.79-2V31.26A2.15,2.15,0,0,0,35.17,29.39Zm-.45,3.54c0,.06,0,.38-.19.38H23.63a.8.8,0,0,0-.77.59,4.84,4.84,0,0,1-9,1h3.39a.8.8,0,1,0,0-1.6H1.79a.19.19,0,0,1-.19-.19V31.26a.48.48,0,0,1,.27-.44c3.86-1.74,4.28-7.13,4.28-9.37V17.3A10,10,0,0,1,13,7.83a.8.8,0,0,0,.55-.76V6.23A4.63,4.63,0,0,1,18.16,1.6h.17A4.74,4.74,0,0,1,22.8,6.36v.71a.8.8,0,0,0,.55.76,10,10,0,0,1,6.84,9.47v4.16c0,2.43.88,7.52,4.22,9.34a.55.55,0,0,1,.32.46Z">
                </path>
            </symbol>
            <symbol id="icon-share" viewBox="0 0 35.57 20.19">
                <title>icon-share</title>
                <path
                    d="M34.27,7.87L23.56,0.63C21.83-.54,20.41,0,20.4,1.76S20.4,5,20.4,5h-3C10.28,5,0,8.82,0,18.83a1.42,1.42,0,0,0,2.53.85c4.33-4.55,7.57-4.45,17.53-4.45h0.34s0,1.41,0,3.13,1.42,2.18,3.15,1l10.72-7.23A2.4,2.4,0,0,0,34.27,7.87Z">
                </path>
            </symbol>
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
    <pf-app pf-mix-id="pfApp">
        <div id="modal-container"></div>
        <pfdc-tooltip-controller></pfdc-tooltip-controller>

        <div id="js-lytics-modal"></div>

        <div id="Site" class="site js-LockPageScroll-site" aria-hidden="false">
            <div class="site-main">


                <pfdc-tracking-bridge pf-mix-id="trackingBridge"></pfdc-tracking-bridge>
                <pfdc-header class="header">
                    <header class="header-inner">

                        <!--我是logo我是logo我是logo我是logo我是logo我是logo我是logo我是logo我是logo我是logo我是logo我是logo-->

                        <div class="header-inner-main">
                            <a href="${pageContext.request.contextPath}/views/catInfo/My_home.jsp" rel="home" class="site-logo">
                                <img src="${pageContext.request.contextPath}/views/catInfo/img/Adopets.svg" alt="Home">
                            </a>

                        </div>
                        <!--我是我的最愛我是我的最愛我是我的最愛我是我的最愛我是我的最愛我是我的最愛我是我的最愛我是我的最愛我是我的最愛-->
                        <a href="#" title="Favorites"
                            class="header-inner-favoritesBtn"
                            pf-mix-click="trackingBridge.ensighten(&#39;analyticsFilterFavoritesGlobalNav&#39;);"
                            data-analytics-key="favorites">
                            <svg role="img" focusable="false">
                                <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-favorite"></use>
                            </svg>
                            <span class="u-isVisuallyHidden">Favorites</span>
                        </a>
                        <!--我是購物車我是購物車我是購物車我是購物車我是購物車我是購物車我是購物車我是購物車我是購物車我是購物車我是購物車-->
                        <a href="#" title="Favorites"
                        class="header-inner-favoritesBtn header-inner-cart"
                        pf-mix-click="trackingBridge.ensighten(&#39;analyticsFilterFavoritesGlobalNav&#39;);"
                        data-analytics-key="favorites">
                        <svg role="img" focusable="false">
                            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#icon-cart"></use>
                        </svg>
                        <span class="u-isVisuallyHidden">Favorites</span>
                    </a>
                        <pfdc-header-dropdown pfdc-header-profilemenu="" bind-active-class-to="[pfdc-header-profilebtn]"
                            pf-mix-id="profileMenu" class="header-inner-profile"
                            data-active-class="header_isOpenDropdown">
                            <button pfdc-header-profilebtn=""
                                pf-mix-click="pfApp.triggerEvent(&#39;ui.toggle-activation&#39;, &#39;[pfdc-header-profileMenu]&#39;, $element);"
                                type="button" class="header-inner-profile-accountBtn" pf-mix-id="headerBtn_profileMenu"
                                aria-expanded="false">
                                <svg role="img" focusable="false">
                                    <use xlink:href="#icon-account"></use>
                                </svg>
                                <span class="header-inner-profile-accountBtn-title">會員ID</span>
                            </button>
                            <div class="header-inner-profile-wrapper">
                                <ul pfdc-header-profiledropdown="" bind-active-class-to="[pfdc-header-profilemenu]"
                                    pf-mix-id="profileMenu" class="header-inner-profile-dropdown">
                                    <li class="header-inner-profile-dropdown-item">
                                        <pf-ensighten on-click="Consumer016">
                                            <a pfdc-header-profiledropdown-item=""
                                                href="https://www.petfinder.com/user/profile/">Account Info</a>
                                        </pf-ensighten>
                                    </li>
                                    <li class="header-inner-profile-dropdown-item">
                                        <pf-ensighten on-click="Consumer279">
                                            <a pfdc-header-profiledropdown-item=""
                                                href="https://www.petfinder.com/user/search-alerts/">
                                                My Saved Searches
                                            </a>
                                        </pf-ensighten>
                                    </li>
                                    <li class="header-inner-profile-dropdown-item">
                                        <pf-ensighten on-click="Consumer017">
                                            <a pfdc-header-profiledropdown-item=""
                                                href="https://www.petfinder.com/user/logout/">
                                                Sign Out
                                            </a>
                                        </pf-ensighten>
                                    </li>
                                    <li>
                                        <pf-ensighten on-click="Consumer015" class="u-inherit">
                                            <button pfdc-header-profiledropdown-item=""
                                                pf-mix-click="profileMenu.dispatchAction(&#39;ui.deactivate&#39;)"
                                                type="button"
                                                class="header-inner-profile-dropdown-itemHiddenBtn txt txt_linkWhite m-txt_block u-isVisuallyHiddenUnlessFocused">
                                                Close Navigation Menu
                                            </button>
                                        </pf-ensighten>
                                    </li>
                                </ul>
                            </div>

                        </pfdc-header-dropdown>
                    </header>
                </pfdc-header>


   
     


                <div role="main">
                    <a id="Site_Main" class="u-isVisuallyHiddenUnlessFocused" role="heading" aria-level="2"
                        tabindex="-1">Main Content</a> <!-- CONTENT -->

                    <div class="animalSearchHeader u-vr6x" pf-animal-search-header="">
                        <span pf-mix-id="pageChangeScrollTarget" class="u-isHidden@maxLg"></span>
                        <h2 class="u-isVisuallyHidden">Animal Search Header</h2>
                        <div class="loadableContent"
                            pf-mix-state-class="loadableContent_isLoading: ui.animalSearch.isPerformingFirstLoad">
                            <div class="loadableContent-displayWhileLoading">
                                <div class="animalSearchHeader"></div>
                            </div>
                            <div class="loadableContent-displayWhenLoaded">
                                <div class="animalSearchHeader-inner">
                                    <!-- Begin inner -->
                                    <div class="animalSearchHeader-inner-main">
                                        <!-- Alternate version of the animalSearchHeader-inner-wrap for small -->
                                        <pfdc-element
                                            render-on-state-change="animalSearch.filters.distance.value, animalSearch.results, currentBreakpoint"
                                            class="animalSearchHeader-inner-wrap m-txt_colorWhite">
                                            <div pf-mix-show="state.currentBreakpoint === &#39;sm&#39;"></div>
                                        </pfdc-element>

                                        <!-- Only need to show Animal Type select, Distance, and Location if mid or larger -->
                                        <div class="animalSearchHeader-inner-wrap u-isHidden@maxMd">
                                            <pfdc-animal-type-select id="animal-type-select"
                                                class="animalSearchHeader-inner-animalType animalSearchHeader-inner-fundamentalSelectIncomplete"
                                                observe-state="animalSearch.filters.animalType"
                                                pf-mix-change="animalSearchElement.onAnimalTypeChange($element.value)"
                                                menu-animation-time="200" input-aria-label="Select Animal Type">

                                                <div class="animalSearchHeader-inner-fundamentalSelectComplete-field">
                                                    <span
                                                        class="animalSearchHeader-inner-fundamentalSelectComplete-field-txt">
                                                        <pf-focus-manager focus-first-focusable="">
                                                            <button animal-type-select-open-btn=""
                                                                id="AnimalTypeSelectOpenBtn"
                                                                class="animalSearchHeader-inner-fundamentalSelectComplete-field-txt-petTypeBtn u-noWrap"
                                                                type="button" aria-label="Select Animal Type, Cats"
                                                                data-test="Search_Open_Pet_Type_Filter_Button"
                                                                aria-haspopup="true">
                                                                <svg role="img"
                                                                    class="animalSearchHeader-inner-fundamentalSelectComplete-field-icon">
                                                                    <use xlink:href="#icon-cat"></use>
                                                                </svg>
                                                                
                                                                <%@ include file="my_search_page1.file" %>
                                                                
                                                              <%--   <div> 
                                                                test 
                                                                test 
                                                                test 
                                                               	<%=request.getAttribute("size") %>
                                                               	<%=lists.size() %>
                                                                <%=pageContext.getAttribute("lists") %>
                                                                <%=request.getSession().getId() %>
                                                                <%=request.getSession().isNew() %>
                                                                </div> --%>
                                                                <span class="count">
                                                                    共有 ${lists.size()} 隻喵
                                                                </span>
                                                            </button>
                                                        </pf-focus-manager>

                                                    </span>
                                                </div>
                                            </pfdc-animal-type-select>
                                        </div>       
                                    </div>
                                    <div class="animalSearchHeader-inner-main">
                                        <div id="Saved_Search_Animal_Search" class="savedSearchAnimalSearch"
                                            aria-haspopup="true">
                                            <div>
                                                <div class="u-isHidden@maxLg">
                                                    <div class="hrArray m-hrArray_6x"><button
                                                            class="btn btn_loader btn_clear" type="button">儲存搜尋條件<svg class="btn_loader-icon" role="presentation"
                                                                focusable="false" viewBox="25 25 50 50">
                                                                <circle class="path" cx="50" cy="50" r="20" fill="none"
                                                                    stroke-width="5" stroke="#fff"
                                                                    stroke-dasharray="39.25, 117.75"></circle>
                                                            </svg></button>
                                                        <div><button class="savedSearchAnimalSearch-dropdownBtn "><span
                                                                    class="txt m-txt_colorWhite">已儲存的搜尋條件</span></button>
                                                            <div class="savedSearchAnimalSearch-wrap u-isHidden">
                                                                <ul class="savedSearchAnimalSearch-list"
                                                                    aria-expanded="false">
                                                                    <li><a class="u-displayBlock"
                                                                            href="#">
                                                                            <div
                                                                                class="txt m-txt_xl m-txt_ellipsisOverflow">
                                                                                Cats near New York City, NY | Calico
                                                                            </div>
                                                                            <div
                                                                                class="txt txt_md m-txt_ellipsisOverflow">
                                                                                Cats, New York City, NY, 100 miles,
                                                                                Calico</div>
                                                                        </a></li>
                                                                    <li><a class="u-displayBlock"
                                                                            href="#">
                                                                            <div
                                                                                class="txt m-txt_xl m-txt_ellipsisOverflow">
                                                                                Cats near New York City, NY | Tabby
                                                                                (Tiger Striped)</div>
                                                                            <div
                                                                                class="txt txt_md m-txt_ellipsisOverflow">
                                                                                Cats, New York City, NY, 100 miles,
                                                                                Tabby (Tiger Striped)</div>
                                                                        </a></li>
                                                                    <li><a class="u-displayBlock"
                                                                            href="#">
                                                                            <div
                                                                                class="txt m-txt_xl m-txt_ellipsisOverflow">
                                                                                Cats near New York City, NY | Black
                                                                            </div>
                                                                            <div
                                                                                class="txt txt_md m-txt_ellipsisOverflow">
                                                                                Cats, New York City, NY, 100 miles,
                                                                                Black</div>
                                                                        </a></li>
                                                                </ul><a
                                                                    href=""
                                                                    class="savedSearchAnimalSearch-editBtn">
                                                                    <div class="txt m-txt_lg">Edit saved searches</div>
                                                                    <span class="icon icon_sm"><svg focusable="false"
                                                                            role="presentation">
                                                                            <use xlink:href="#icon-chevronRight"></use>
                                                                        </svg></span>
                                                                </a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="u-isHidden@minLg"><button
                                                        class="savedSearchAnimalSearch-dropdownBtn"><span
                                                            class="txt m-txt_colorWhite">Saved Searches</span></button>
                                                    <div class="savedSearchAnimalSearch-wrap u-isHidden">
                                                        <ul class="savedSearchAnimalSearch-list" aria-expanded="false">
                                                            <li><a class="u-displayBlock"
                                                                    href="">
                                                                    <div class="txt m-txt_xl m-txt_ellipsisOverflow">
                                                                        Cats near New York City, NY | Calico</div>
                                                                    <div class="txt txt_md m-txt_ellipsisOverflow">Cats,
                                                                        New York City, NY, 100 miles, Calico</div>
                                                                </a></li>
                                                            <li><a class="u-displayBlock"
                                                                    href="">
                                                                    <div class="txt m-txt_xl m-txt_ellipsisOverflow">
                                                                        Cats near New York City, NY | Tabby (Tiger
                                                                        Striped)</div>
                                                                    <div class="txt txt_md m-txt_ellipsisOverflow">Cats,
                                                                        New York City, NY, 100 miles, Tabby (Tiger
                                                                        Striped)</div>
                                                                </a></li>
                                                            <li><a class="u-displayBlock"
                                                                    href="">
                                                                    <div class="txt m-txt_xl m-txt_ellipsisOverflow">
                                                                        Cats near New York City, NY | Black</div>
                                                                    <div class="txt txt_md m-txt_ellipsisOverflow">Cats,
                                                                        New York City, NY, 100 miles, Black</div>
                                                                </a></li>
                                                        </ul><a href=""
                                                            class="savedSearchAnimalSearch-editBtn">
                                                            <div class="txt m-txt_lg">Edit saved searches</div><span
                                                                class="icon icon_sm"><svg focusable="false"
                                                                    role="presentation">
                                                                    <use xlink:href="#icon-chevronRight"></use>
                                                                </svg></span>
                                                        </a>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- End inner -->
                                </div>
                            </div>
                        </div>
                    </div>

                    <div id="main1" class="tier tier_padCustom@maxMd u-vr6x" style="--tier-pad-size: 10px;">

                        <pfdc-element observe-state="animalSearch.savedSearch">
                            <p pf-mix-state-value="searchSetAlertText" class="u-isVisuallyHidden" aria-live="polite">
                            </p>
                        </pfdc-element>


                        <pfdc-modal id="Best_Matches_Modal" class="modal" role="dialog"
                            style="display: none; opacity: 1;">
                            <div pf-modal-content="" class="modal-content modal-content_w4x m-modal-content_padded"
                                style="opacity: 1; display: none;">
                                <h1 class="txt txt_h1 u-vr4x m-txt_alignCenter">Create a profile to
                                    <br>find your best match
                                </h1>
                                <p class="txt txt_h3 u-vr6x m-txt_alignCenter">It only takes 60 seconds!</p>
                                <a href=""
                                    class="btn m-btn_full">Continue</a>
                                <pf-element on-click="ui.deactivate" data-target="#Best_Matches_Modal">
                                    <button pf-modal-close-btn="" class="modal-closeBtn" id="Best_Matches_Close"
                                        type="button" aria-label="Close this dialog">
                                        Close this dialog</button>
                                </pf-element>
                            </div>
                        </pfdc-modal>

                        <pfdc-modal id="Best_Matches_Modal_Guest" class="modal" role="dialog"
                            style="display: none; opacity: 1;">
                            <div pf-modal-content="" class="modal-content modal-content_w4x m-modal-content_padded"
                                style="opacity: 1; display: none;">
                                <h1 class="txt txt_h1 u-vr4x m-txt_alignCenter">Create a profile to
                                    <br>sort by best match
                                </h1>
                                <p class="txt m-txt_lg u-vr4x m-txt_alignCenter">It only takes 60 seconds!</p>
                                <a href=""
                                    class="btn m-btn_full u-vr4x">Continue</a>
                                <div>
                                    <p class="txt m-txt_lg u-vr4x m-txt_alignCenter">
                                        Already have a profile?
                                        <a href=""
                                            class="txt txt_link m-txt_lg m-txt_underline ">
                                            Log in.
                                        </a>
                                    </p>
                                </div>
                                <pf-element on-click="ui.deactivate" data-target="#Best_Matches_Modal">
                                    <button pf-modal-close-btn="" class="modal-closeBtn" id="Best_Matches_Close"
                                        type="button" aria-label="Close this dialog">
                                        Close this dialog
                                    </button>
                                </pf-element>
                            </div>
                        </pfdc-modal>

                        <pfdc-animal-search class="u-vr6x" pf-mix-id="animalSearchElement">
                            <div class="x">
                                <div class="xx">
                                    

                                    <div class="searchContainer loadableContent-displayWhenLoaded">
                                        <!-- Animal Search: Loaded -->
                                        
                                        <form METHOD="post" ACTION="${pageContext.request.contextPath}/CatInfoServlet">
                                        <!--側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄側邊欄-->
	                                        <div class="searchContainer-filters">
	                                            <div class="u-fadeInChildren">
	                                                <ul class="vrArray m-vrArray_4x">
	                                                    <!--品種-->
	                                                    <li>
	                                                        <div class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">品種</div>
	                                                        <div class="container">
	                                                            <div class="dropdown breed">
	                                                              <div class="select">
	                                                                <span class="sp1">任意</span> 
	                                                                <i class="fa fa-chevron-left"></i>
	                                                              </div>
	                                                              <input type="hidden" name="breed">
	                                                              <ul class="dropdown-menu">
	                                                                <li value="美國短毛貓">美國短毛貓</li>
	                                                                <li value="米克斯">米克斯</li>
	                                                                <li value="布偶貓">布偶貓</li>
	                                                              </ul>
	                                                            </div>
	                                                        </div>
	                                                    </li>
	                                                    <!--年齡-->
	                                                    <li>
	                                                        <div class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">年齡</div>
	                                                        <div class="container">
	                                                            <div class="dropdown age">
	                                                              <div class="select">
	                                                                <span class="sp2">任意</span> 
	                                                                <i class="fa fa-chevron-left"></i>
	                                                              </div>
	                                                              <input type="hidden" name="age">
	                                                              <ul class="dropdown-menu">
	                                                                <li value="幼貓">幼貓</li>
	                                                                <li value="小貓">小貓</li>
	                                                                <li value="成貓">成貓</li>
	                                                                <li value="老貓">老貓</li>
	                                                              </ul>
	                                                            </div>
	                                                        </div>
	                                                    </li>
	                                                    
	                                                    
	                                                    <!--體型大小-->
	                                                    <li>
	                                                        <div class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">大小</div>
	                                                        <div class="container">
	                                                            <div class="dropdown size">
	                                                              <div class="select">
	                                                                <span>任意</span> 
	                                                                <i class="fa fa-chevron-left"></i>
	                                                              </div>
	                                                              <input type="hidden" name="size">
	                                                              <ul class="dropdown-menu">
	                                                                <li value="小型">小型</li>
	                                                                <li value="中型">中型</li>
	                                                                <li value="大型">大型</li>
	                                                              </ul>
	                                                            </div>
	                                                        </div>
	                                                    </li>
	                                                    <!--性別-->
	                                                    <li>
	                                                        <div
	                                                            class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">性別</div>
	                                                            <div class="container">
	                                                                <div class="dropdown sex">
	                                                                  <div class="select">
	                                                                    <span>任意</span> 
	                                                                    <i class="fa fa-chevron-left"></i>
	                                                                  </div>
	                                                                  <input id="gender" type="hidden" name="Gender">
	                                                                  <ul class="dropdown-menu">
	                                                                    <li value="公">公</li>
	                                                                    <li value="母">母</li>
	                                                                  </ul>
	                                                                </div>
	                                                            </div>
	                                                    </li>
	                                                    <!--適合對象-->
	                                                  <!--   <li>
	                                                        <div
	                                                            class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">
	                                                            適合對象</div>
	                                                            <div class="container">
	                                                                <div class="dropdown">
	                                                                  <div class="select">
	                                                                    <span>任意</span> 
	                                                                    <i class="fa fa-chevron-left"></i>
	                                                                  </div>
	                                                                  <input type="hidden" name="Good With">
	                                                                  <ul class="dropdown-menu">
	                                                                    <li id="">小孩</li>
	                                                                    <li id="">家裡有狗狗</li>
	                                                                    <li id="">家裏有其他貓貓</li>
	                                                                  </ul>
	                                                                </div>
	                                                            </div>                                                
	                                                    </li> -->
	                                                    <!--毛長-->
	                                              <!--       <li>
	                                                        <div
	                                                            class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">
	                                                            毛長</div>
	                                                            <div class="container">
	                                                                <div class="dropdown">
	                                                                  <div class="select">
	                                                                    <span>任意</span> 
	                                                                    <i class="fa fa-chevron-left"></i>
	                                                                  </div>
	                                                                  <input type="hidden" name="Coat Length">
	                                                                  <ul class="dropdown-menu">
	                                                                    <li id="">無毛</li>
	                                                                    <li id="">短毛</li>
	                                                                    <li id="">中等</li>
	                                                                    <li id="">長毛</li>
	                                                                  </ul>
	                                                                </div>
	                                                            </div>  
	                                                    </li> -->
	                                                    <!--毛色-->
	                                                    <li>
	                                                        <div
	                                                            class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">
	                                                            毛色</div>
	                                                            <div class="container">
	                                                                <div class="dropdown coatcolor">
	                                                                  <div class="select">
	                                                                    <span>任意</span> 
	                                                                    <i class="fa fa-chevron-left"></i>
	                                                                  </div>
	                                                                  <input type="hidden" name="Color">
	                                                                  <ul class="dropdown-menu">
	                                                                    <li value="黑色">黑色</li>
	                                                                    <li value="白色">白色</li>
	                                                                    <li value="虎斑">虎斑</li>
	                                                                    <li value="橘色">橘色</li>
	                                                                    <li value="三花">三花</li>
	                                                                    <li value="藍色">藍色</li>
	                                                                    <li value="玳瑁">玳瑁</li>
	                                                                    <li value="豹紋">豹紋</li>
	                                                                  </ul>
	                                                                </div>
	                                                            </div>
	                                                    </li>
	                                                    <!--是否需要特殊照顧-->
	                                                 <!--    <li>
	                                                        <div
	                                                            class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">是否需要特殊照顧</div>
	                                                            <div class="container">
	                                                                <div class="dropdown">
	                                                                  <div class="select">
	                                                                    <span>任意</span> 
	                                                                    <i class="fa fa-chevron-left"></i>
	                                                                  </div>
	                                                                  <input type="hidden" name="special_care">
	                                                                  <ul class="dropdown-menu">
	                                                                    <li id="">愛滋貓</li>
	                                                                    <li id="">傳染性腹膜炎</li>
	                                                                    <li id="">腎臟病</li>
	                                                                  </ul>
	                                                                </div>
	                                                            </div>
	
	                                                    </li> -->
	                                                    <!--在收容所天數-->
	                                                    <li>
	                                                        <div class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">
	                                                            在收容所天數</div>
	                                                            <div class="container">
	                                                                <div class="dropdown shelter">
	                                                                  <div class="select">
	                                                                    <span>任意</span> 
	                                                                    <i class="fa fa-chevron-left"></i>
	                                                                  </div>
	                                                                  <input type="hidden" name="shelter_day">
	                                                                  <ul class="dropdown-menu">
	                                                                    <li value="1">1</li>
	                                                                    <li value="7">7</li>
	                                                                    <li value="14">14</li>
	                                                                    <li value="30">30</li>
	                                                                  </ul>
	                                                                </div>
	                                                            </div>
	                                                    </li>
	                                                    <li>
	                                                    	<div
	                                                            class="txt txt_label m-txt_heavy m-txt_uppercase m-txt_alignCenter u-vr1x">
							                                        <button class="submit_btn" type="submit" >Submit</button>
                                                            </div>
	                                                    </li>
	                                                </ul>
	                                            </div>
	                                        </div>
<!-- 	                                       	<input type="submit" value="送出"> -->
        									<input type="hidden" name="action" value="listEmps_ByCompositeQuery">
	                                        
	                                        
                                        </form>
                                        <!-- cat body cat body cat body cat body cat body cat body cat body cat body cat body -->
                                        <div class="searchContainer-body">
                                        	 
                                        	<!-- add tag add tag add tag add tag add tag add tag -->
                                        	  <div class="split split_stack@maxMd m-split_alignTop">
                                                <div class="split-item">
                                                    <div id="Pet_Search_Applied_Filters" class="u-hr6x"></div>
                                                    
                                                   	add tag
                                                </div>
                                                <div class="split-item u-isHidden@maxLg">
                                                    <pfdc-generic-select id="sort-select"
                                                        pf-mix-change="$closest.onSortByChanged($element.value)"
                                                        observe-state="animalSearch.filters.sortBy"
                                                        input-aria-label="Select Sort By Field"
                                                        sort-by-select-label="Sort By">
                                                        <div
                                                            class="field field_select m-field_minWidthSm s-field_hasInput u-vr4x">
                                                            <div class="field-label">
                                                                <label class="field-label-text" for="sort">Sort
                                                                    By:</label>
                                                            </div>
                                                            <select id="sort-select_6_nativeSelect" class="field-input"
                                                                name="sort" aria-label="Select Sort By Field"
                                                                aria-invalid="false"
                                                                pf-mix-change="$closest.onNativeSelectChanged($event, $element)">

                                                                <option value="best_match" selected="">
                                                                    Best match
                                                                </option>

                                                                <option value="recently_added">
                                                                    Newest addition
                                                                </option>

                                                                <option value="available_longest">
                                                                    Oldest addition
                                                                </option>

                                                                <option value="nearest">
                                                                    Nearest
                                                                </option>

                                                                <option value="furthest">
                                                                    Furthest
                                                                </option>

                                                                <option value="random">
                                                                    Randomize
                                                                </option>

                                                            </select>
                                                        </div>
                                                    </pfdc-generic-select>
                                                    <pf-element id="Best_Matches_Modal_Trigger" class="u-isHidden"
                                                        on-click="ui.activate" data-target="#Best_Matches_Modal">
                                                    </pf-element>
                                                    <pf-element id="Best_Matches_Modal_Guest_Trigger" class="u-isHidden"
                                                        on-click="ui.activate" data-target="#Best_Matches_Modal_Guest">
                                                    </pf-element>
                                                </div>
                                            </div>
                                        	
                                        	
                                        	
                                        	 
                                           

                                            <h1 pf-mix-id="pageChangeFocusTarget" class="u-isVisuallyHidden"
                                                tabindex="-1">
                                                <pfdc-element render-on-state-change="animalSearch.results">
                                                    <span pf-mix-content="state.animalSearch.results.name">8594 Cats
                                                        near New York City, NY</span>
                                                    <span>page</span>
                                                    <span
                                                        pf-mix-content="state.animalSearch.pagination.currentPageDisplay">1</span>
                                                    <span>of</span>
                                                    <span
                                                        pf-mix-content="state.animalSearch.pagination.totalPages">215</span>
                                                </pfdc-element>
                                            </h1>

                                            <input data-csrf="ctk5ma4EeaHF-SZjezSnZFxOuKbOI_fE2_G5AF4A7dw" type="hidden"
                                                id="saved_search_csrf_token" name="token"
                                                value="ctk5ma4EeaHF-SZjezSnZFxOuKbOI_fE2_G5AF4A7dw">

                                            <div class="u-posRelative">
                                                <!-- Sneeze guard -->
                                                <pfdc-element observe-state="ui.resultsLoading"
                                                    template="loadingResultsIndicator" show-progress=""></pfdc-element>

                                                <div data-hypernova-key="InterceptorModal"
                                                    data-hypernova-id="da2fbfc3-6c23-4780-85a7-37e88c9e35d5"></div>
                                                <script type="application/json" data-hypernova-key="InterceptorModal"
                                                    data-hypernova-id="da2fbfc3-6c23-4780-85a7-37e88c9e35d5"><!--[]--></script>

                                                <pfdc-animal-search-results observe-state="animalSearch.results"
                                                    template="animalSearchResults" class="u-fadeInChildren">
                                                    <div class="animalSearchBody">
                                                        <div class="grid grid_gutter grid_gutterLg@minMd m-grid_stretch u-vr6x">
                                                         <%-- <%@ include file="my_search_page1.file" %>  --%>
                                                   
															<c:forEach var="catInfoVO" items="${lists}" begin="<%=pageIndex%>" end="<%=pageIndex+rowsPerPage-1%>">
                                                            <!--貓咪資訊貓咪資訊貓咪資訊貓咪資訊貓咪資訊貓咪資訊貓咪資訊貓咪資訊-->
                                                            <div class="grid-col grid-col_1/4@minXl">
                                                                <div class="petCard">
                                                                    <a class="petCard-link" href="${pageContext.request.contextPath}/CatInfoServlet?action=getOne_For_Update&catID=${catInfoVO.catID}">
                                                                  
                                                                        <!--貓照片-->
                                                                        <jsp:useBean id="catPhotoGalleryService" scope="page" class="web.catInfo.service.CatPhotoGalleryService" />
                                                                        <div alt="" class="petCard-media">
																			<%-- ${catInfoVO.catID}
																			${catPhotoGalleryService.getOneCat(catInfoVO.catID)[0].imgID}
																			${catPhotoGalleryVO.imgID} --%>
																			                                                                      
                                                                            <img class="petCard-media-img"
                                                                                <%-- src="${pageContext.request.contextPath}/DBGifReader?id=${catPhotoGalleryVO.imgID}" --%>
                                                                                src="${pageContext.request.contextPath}/DBGifReader?id=${catPhotoGalleryService.getOneCat(catInfoVO.catID)[0].imgID}"
                                                                                sizes="300px">
                                                                        </div>
                                                                        <div class="petCard-body">
                                                                            <div class="petCard-body-details">
                                                                                <!--名字-->
                                                                                <div class="petCard-body-details-hdg">
                                                                                    <span>${catInfoVO.catName}</span> 
                                                                                </div>
                                                                                <!--名字下方標籤下方-->
                                                                                <div class="">
                                                                                    <ul>
                                                                                        <li>
                                                                                            <ul class="hrArray hrArray_bulletDividedSingleLine m-hrArray_center">
                                                                                                    <span>${catInfoVO.sex}</span>
                                                                                                <c:choose>
																								   <c:when test="${catInfoVO.age == 0}">
																								   <li>幼貓</li> 
																								   </c:when>
																								   <c:when test="${catInfoVO.age == 1}">
																								   <li>小貓</li> 
																								   </c:when>
																								   <c:when test="${catInfoVO.age == 2}">
																								   <li>成貓</li> 
																								   </c:when>
																								   <c:when test="${catInfoVO.age == 3}">
																								   <li>老貓</li> 
																								   </c:when>
																								   <c:otherwise>
																								   </c:otherwise>
																								</c:choose>
                                                                                               <li>
                                                                                                    <span>${catInfoVO.breed}</span>
                                                                                                    
                                                                                                </li>
                                                                                            </ul>
                                                                                        </li>
                                                                                        <li>
                                                                                            距離?公里
                                                                                        </li>
                                                                                    </ul>
                                                                                </div>

                                                                            </div>
                                                                        </div>
                                                                        <!--完全符合-->
                                                                       <!--  <div class="petCard-status">
                                                                            <div
                                                                                class="petCard-status-flag petCard-status-flag_goodMatch">
                                                                                <span class="icon">
                                                                                    <svg>
                                                                                        <use xmlns:xlink="http://www.w3.org/1999/xlink"
                                                                                            xlink:href="#icon-goodMatch">
                                                                                        </use>
                                                                                    </svg>
                                                                                </span>完全符合
                                                                            </div>
                                                                        </div> -->

                                                                    </a>
                                                                    <!--愛心-->
                                                                    <div class="petCard-favoriteBtn">
                                                                        <button class="favoriteBtn favoriteBtn_searchResult">
                                                                            <svg role="img">
                                                                                <use
                                                                                    xlink:href="#icon-favorite_outline">
                                                                                </use>
                                                                            </svg>
                                                                        </button>
                                                                    </div>
                                                                </div>
                                                            </div>                      
																		
                                                                    
                                                            </c:forEach>
                                                         
                                                        </div>
                                                    </div>


 

                                                </pfdc-animal-search-results>

                                                <!-- Pagination -->
                                                <pfdc-element class="u-displayBlock u-vr6x"
                                                    render-on-state-change="animalSearch.results"
                                                    template="animalSearchFooter">
                                                    <div id="spage" class="animalSearchFooter u-isLoaded"
                                                        pf-mix-class="u-isLoaded: viewModel.hasSearched, u-noResults: !viewModel.hasResults">
                                                        <div class="grid grid_gutterLg">
                                                            <div
                                                                class="grid-col grid-col_1/4@minMd grid-col_2/5@minXl u-isHidden@maxMd">
                                                                <pfdc-social-slide>
                                                                </pfdc-social-slide>
                                                            </div>
                                                            <div class="grid-col grid-col_3/4@minMd grid-col_3/5@minXl">
                                                                <!-- 分頁控制分頁控制分頁控制分頁控制分頁控制分頁控制分頁控制 -->
                                                                <pfdc-page-controls>
                                                                    <div  class="grid grid_gutterLg">
                                                                        
		                                                                <%@ include file="my_search_page2.jsp" %>
                                                                        
                                                                        
                                                                        
                                                                    </div>
                                                                
                                                                	
                                                                </pfdc-page-controls>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </pfdc-element>

                                                <pfdc-element template="srpRecommendations"
                                                    render-on-state-change="animalSearch.results"></pfdc-element>
                                            </div>
                                        </div>
                                        <!-- END: Animal Search: Loaded -->
                                    </div>
                                </div>
                            </div>
                        </pfdc-animal-search>

                        <div id="Saved_Search_Confirmation_Modal"></div>
                    </div>

                    <div class="tier u-vr8x u-textCenter">
                        <pfdc-ad-container slot-id="SearchResults3" position-target-id="petsearch_bottom" lazy-load=""
                            style="max-height: 100px">
                            <pfdc-ad slot-id="SearchResults3" non-responsive="" lazy-load=""
                                override-ad-id="LEADERBOARD" position-target-id="petsearch_bottom">
                                <pf-ad id="SearchResults3"
                                    targeting="{&quot;userIsLoggedIn&quot;:true,&quot;savedSearches&quot;:true,&quot;usersCountryCode&quot;:&quot;US&quot;,&quot;usersStateCode&quot;:&quot;NY&quot;,&quot;usersLocationName&quot;:&quot;New York City&quot;}"
                                    lazy-load="" override-ad-id="LEADERBOARD" position-target-id="petsearch_bottom">
                                </pf-ad>
                            </pfdc-ad>
                        </pfdc-ad-container>
                    </div>

                    <!--Sticky footer (only visible on small and medium breakpoints)-->
                    <div class="u-isHidden@minLg">
                        <pfdc-sticky data-latch-bottom="" class="" style="min-height: 1px; height: auto;">
                            <div class="fixedBottom u-vr4x">
                                <div id="Mobile_Save_Search_Button">
                                    <div class="split split_gutter">
                                        <div class="split-item split-item_grow"><button class="btn m-btn_full">Save
                                                Search</button></div>
                                        <div class="split-item u-isHidden@minMd">
                                            <pf-element on-click="ui.activate" data-target="#Share_Pet_Modal"><button
                                                    class="btn btn_slide m-btn_circleLarge"><span
                                                        class="icon m-icon_colorDark"><svg role="img" focusable="false">
                                                            <use xlink:href="#icon-share_outline"></use>
                                                        </svg></span><span
                                                        class="u-isVisuallyHidden">Share</span></button></pf-element>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </pfdc-sticky>
                    </div>

                    <pf-element on-load="sticky.deactivate"></pf-element>
                </div>
            </div>

            <!--這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer這是footer-->
            <footer class="site-footer" role="contentinfo">
                <div class="footer">

                    <div class="footer-inner">
                        <a href="${pageContext.request.contextPath}/views/catInfo/My_home.jsp" class="footer-inner-logo">
                            <svg id="logo-consumer" width="132" height="48" viewBox="0 0 132 48" fill="white" xmlns="http://www.w3.org/2000/svg">
                                <path d="M11.0489 17.376L8.71288 26.56C8.69154 26.624 8.70221 26.688 8.74487 26.752C8.80888 26.7947 8.87288 26.816 8.93688 26.816H13.2249C13.2889 26.816 13.3422 26.7947 13.3849 26.752C13.4489 26.688 13.4702 26.624 13.4489 26.56L11.1129 17.376C11.1129 17.3547 11.1022 17.344 11.0809 17.344C11.0595 17.344 11.0489 17.3547 11.0489 17.376ZM2.50488 36C2.05688 36 1.69421 35.8187 1.41688 35.456C1.16088 35.0933 1.10754 34.6987 1.25688 34.272L7.72088 14.368C7.89154 13.856 8.19021 13.44 8.61688 13.12C9.06488 12.8 9.55554 12.64 10.0889 12.64H12.2009C12.7555 12.64 13.2569 12.8 13.7049 13.12C14.1529 13.44 14.4515 13.856 14.6009 14.368L21.0329 34.272C21.1822 34.6987 21.1182 35.0933 20.8409 35.456C20.5849 35.8187 20.2329 36 19.7849 36H17.6409C17.1075 36 16.6275 35.84 16.2009 35.52C15.7742 35.1787 15.4969 34.752 15.3689 34.24L14.6009 31.2C14.5795 31.0293 14.4729 30.944 14.2809 30.944H7.88088C7.71021 30.944 7.60354 31.0293 7.56088 31.2L6.79288 34.24C6.66488 34.752 6.38754 35.1787 5.96088 35.52C5.53421 35.84 5.05421 36 4.52087 36H2.50488ZM30.6424 22.88C28.509 22.88 27.4424 24.48 27.4424 27.68C27.4424 29.3013 27.7304 30.5067 28.3064 31.296C28.8824 32.0853 29.661 32.48 30.6424 32.48C31.4957 32.48 32.2424 32.192 32.8824 31.616C33.5224 31.04 33.8424 30.3893 33.8424 29.664V25.696C33.8424 24.9707 33.5224 24.32 32.8824 23.744C32.2424 23.168 31.4957 22.88 30.6424 22.88ZM28.8824 36.32C26.9837 36.32 25.4264 35.5627 24.2104 34.048C22.9944 32.512 22.3864 30.3893 22.3864 27.68C22.3864 24.9067 22.973 22.7733 24.1464 21.28C25.3197 19.7867 26.8984 19.04 28.8824 19.04C30.6317 19.04 32.221 19.6907 33.6504 20.992C33.6717 21.0133 33.693 21.024 33.7144 21.024C33.7357 21.024 33.7464 21.0133 33.7464 20.992V13.824C33.7464 13.3333 33.917 12.9067 34.2584 12.544C34.621 12.1813 35.0477 12 35.5384 12H37.1064C37.597 12 38.013 12.1813 38.3544 12.544C38.717 12.9067 38.8984 13.3333 38.8984 13.824V34.176C38.8984 34.6667 38.717 35.0933 38.3544 35.456C38.013 35.8187 37.597 36 37.1064 36H35.8904C35.3784 36 34.941 35.8293 34.5784 35.488C34.237 35.1253 34.0557 34.688 34.0344 34.176V33.92C34.0344 33.8987 34.0237 33.888 34.0024 33.888L33.9384 33.952C32.5944 35.5307 30.909 36.32 28.8824 36.32ZM52.9159 23.84C52.4039 23.0507 51.6145 22.656 50.5479 22.656C49.4812 22.656 48.6812 23.0507 48.1479 23.84C47.6359 24.6293 47.3799 25.9093 47.3799 27.68C47.3799 29.4507 47.6359 30.7307 48.1479 31.52C48.6812 32.3093 49.4812 32.704 50.5479 32.704C51.6145 32.704 52.4039 32.3093 52.9159 31.52C53.4492 30.7307 53.7159 29.4507 53.7159 27.68C53.7159 25.9093 53.4492 24.6293 52.9159 23.84ZM56.7239 34.048C55.2519 35.5627 53.1932 36.32 50.5479 36.32C47.9025 36.32 45.8439 35.5627 44.3719 34.048C42.8999 32.5333 42.1639 30.4107 42.1639 27.68C42.1639 24.9493 42.8999 22.8267 44.3719 21.312C45.8439 19.7973 47.9025 19.04 50.5479 19.04C53.1932 19.04 55.2519 19.7973 56.7239 21.312C58.1959 22.8267 58.9319 24.9493 58.9319 27.68C58.9319 30.4107 58.1959 32.5333 56.7239 34.048ZM67.0899 25.696V29.664C67.0899 30.368 67.4099 31.0187 68.0499 31.616C68.7112 32.192 69.4579 32.48 70.2899 32.48C71.2712 32.48 72.0499 32.0853 72.6259 31.296C73.2019 30.4853 73.4899 29.28 73.4899 27.68C73.4899 24.48 72.4232 22.88 70.2899 22.88C69.4579 22.88 68.7112 23.1787 68.0499 23.776C67.4099 24.352 67.0899 24.992 67.0899 25.696ZM63.8579 43.04C63.3672 43.04 62.9405 42.8587 62.5779 42.496C62.2152 42.1333 62.0339 41.7067 62.0339 41.216V21.184C62.0339 20.6933 62.2152 20.2667 62.5779 19.904C62.9405 19.5413 63.3672 19.36 63.8579 19.36H65.1379C65.6499 19.36 66.0872 19.5413 66.4499 19.904C66.8125 20.2453 67.0045 20.672 67.0259 21.184V21.44C67.0259 21.4613 67.0365 21.472 67.0579 21.472L67.1219 21.408C68.4872 19.8293 70.1299 19.04 72.0499 19.04C74.0339 19.04 75.6125 19.7867 76.7859 21.28C77.9805 22.7733 78.5779 24.9067 78.5779 27.68C78.5779 30.368 77.9592 32.48 76.7219 34.016C75.5059 35.552 73.9485 36.32 72.0499 36.32C70.2792 36.32 68.7005 35.6693 67.3139 34.368C67.2925 34.3467 67.2712 34.336 67.2499 34.336C67.2285 34.336 67.2179 34.3467 67.2179 34.368V41.216C67.2179 41.7067 67.0365 42.1333 66.6739 42.496C66.3112 42.8587 65.8845 43.04 65.3939 43.04H63.8579ZM89.2949 22.528C88.3349 22.528 87.6095 22.784 87.1189 23.296C86.6282 23.7867 86.3189 24.64 86.1909 25.856C86.1909 26.0267 86.2655 26.112 86.4149 26.112H91.8229C92.0149 26.112 92.1109 26.016 92.1109 25.824C92.0255 23.6267 91.0869 22.528 89.2949 22.528ZM90.0949 36.32C87.1935 36.32 84.9535 35.584 83.3749 34.112C81.8175 32.64 81.0389 30.496 81.0389 27.68C81.0389 24.8853 81.7322 22.752 83.1189 21.28C84.5269 19.7867 86.5535 19.04 89.1989 19.04C94.2762 19.04 96.8575 21.8133 96.9429 27.36C96.9429 27.872 96.7402 28.3093 96.3349 28.672C95.9509 29.0133 95.5029 29.184 94.9909 29.184H86.4469C86.2335 29.184 86.1482 29.28 86.1909 29.472C86.3615 30.6453 86.8095 31.488 87.5349 32C88.2815 32.4907 89.3909 32.736 90.8629 32.736C91.8229 32.736 92.8575 32.5973 93.9669 32.32C94.4149 32.2133 94.8095 32.2987 95.1509 32.576C95.5135 32.8533 95.6949 33.216 95.6949 33.664V33.728C95.6949 34.2613 95.5242 34.752 95.1829 35.2C94.8629 35.6267 94.4469 35.8827 93.9349 35.968C92.6975 36.2027 91.4175 36.32 90.0949 36.32ZM100.933 23.616C100.442 23.616 100.016 23.4453 99.6529 23.104C99.2902 22.7413 99.1089 22.3147 99.1089 21.824C99.1089 21.3333 99.2902 20.9067 99.6529 20.544C100.016 20.1813 100.442 20 100.933 20H102.213C102.384 20 102.469 19.904 102.469 19.712V15.744C102.469 15.2533 102.65 14.8267 103.013 14.464C103.376 14.1013 103.802 13.92 104.293 13.92H105.829C106.32 13.92 106.746 14.1013 107.109 14.464C107.472 14.8267 107.653 15.2533 107.653 15.744V19.712C107.653 19.904 107.749 20 107.941 20H111.077C111.568 20 111.984 20.1813 112.325 20.544C112.688 20.9067 112.869 21.3333 112.869 21.824C112.869 22.3147 112.688 22.7413 112.325 23.104C111.984 23.4453 111.568 23.616 111.077 23.616H107.941C107.749 23.616 107.653 23.712 107.653 23.904V29.376C107.653 30.72 107.77 31.5733 108.005 31.936C108.261 32.2987 108.816 32.48 109.669 32.48C110.117 32.48 110.469 32.4587 110.725 32.416C111.194 32.352 111.61 32.4587 111.973 32.736C112.336 33.0133 112.517 33.376 112.517 33.824V34.08C112.517 34.6133 112.346 35.0827 112.005 35.488C111.664 35.8933 111.226 36.128 110.693 36.192C110.032 36.2773 109.264 36.32 108.389 36.32C106.213 36.32 104.677 35.8613 103.781 34.944C102.906 34.0053 102.469 32.3307 102.469 29.92V23.904C102.469 23.712 102.384 23.616 102.213 23.616H100.933ZM122.736 29.6C120.432 29.1733 118.779 28.512 117.776 27.616C116.795 26.72 116.304 25.536 116.304 24.064C116.304 22.4853 116.891 21.2587 118.064 20.384C119.259 19.488 121.051 19.04 123.44 19.04C124.848 19.04 126.288 19.1573 127.76 19.392C128.272 19.4773 128.688 19.7227 129.008 20.128C129.349 20.5333 129.52 21.0027 129.52 21.536V21.696C129.52 22.144 129.339 22.5067 128.976 22.784C128.635 23.0613 128.24 23.1573 127.792 23.072C126.405 22.7947 125.125 22.656 123.952 22.656C123.077 22.656 122.459 22.7627 122.096 22.976C121.755 23.1893 121.584 23.5093 121.584 23.936C121.584 24.7467 122.224 25.28 123.504 25.536C125.936 25.9413 127.632 26.5813 128.592 27.456C129.573 28.3307 130.064 29.6 130.064 31.264C130.064 32.864 129.467 34.112 128.272 35.008C127.077 35.8827 125.339 36.32 123.056 36.32C121.392 36.32 119.813 36.16 118.32 35.84C117.808 35.7333 117.381 35.4667 117.04 35.04C116.72 34.592 116.56 34.0907 116.56 33.536V33.28C116.56 32.832 116.741 32.4907 117.104 32.256C117.467 32 117.872 31.9253 118.32 32.032C119.707 32.3947 121.072 32.576 122.416 32.576C123.995 32.576 124.784 32.1173 124.784 31.2C124.784 30.7733 124.635 30.4427 124.336 30.208C124.059 29.9733 123.525 29.7707 122.736 29.6Z" />
                              </svg>
                        </a>

                        <!--  
                                                    <div class="grid grid_gutterLg">
                            <div class="grid-col grid-col_2/3@minLg grid-col_7/10@minXl">
                                <div class="menu-footer-container">
                                    <ul id="menu-footer" class="footer-inner-nav">
                                        <li class="footer-inner-nav-item"><button pfdc-footer-btn=""
                                                class="footer-inner-nav-item-btn footer-inner-nav-item-btn_expandable"
                                                role="heading" aria-level="3">關於我們</button>
                                            <ul pfdc-footer-menu="" class="footer-inner-nav-item-expanded">
                                                <li><a href="">網站願景</a></li>
                                                <li><a
                                                        href="https://www.petfinder.com/pet-adoption/pet-adoption-information/pet-adoption-faqs/">招募會員</a>
                                                </li>
                                                <li><a href="#">會員中心</a>
                                                </li>
                                            </ul>
                                        </li>
                                        <li class="footer-inner-nav-item"><button pfdc-footer-btn=""
                                                class="footer-inner-nav-item-btn footer-inner-nav-item-btn_expandable"
                                                role="heading" aria-level="3">寵物認養</button>
                                            <ul pfdc-footer-menu="" class="footer-inner-nav-item-expanded">
                                                <li><a href="#">貓咪搜尋</a></li>
                                                <li><a href="#">貓咪認養</a></li>
                                                <li><a href="#">貓咪捐贈</a></li>
                                                <li><a href="#">收容所捐贈</a></li>
                                                <li><a href="#">聊天室</a></li>
                                                <li><a href="#">地圖找貓</a></li>
                                                <li><a href="#">收容所資訊</a></li>
                                                <li><a href="#">小遊戲</a></li>
                                            </ul>
                                        </li>
                                        <li class="footer-inner-nav-item"><button pfdc-footer-btn=""
                                                class="footer-inner-nav-item-btn footer-inner-nav-item-btn_expandable"
                                                role="heading" aria-level="3">寵物商品</button>
                                            <ul pfdc-footer-menu="" class="footer-inner-nav-item-expanded">
                                                <li><a href="#">購物中心</a></li>
                                                <li><a href="#">購物活動</a></li>
                                                <li><a href="#">購物車</a></li>
                                                <li><a href="#">出貨訂單</a></li>
                                                </li>
                                            </ul>
                                        </li>

                                    </ul>
                                </div>
                            </div>

                        </div>

                          -->

                    </div>
                </div>

            </footer>


            



        </div>



        <p pf-app-status-message="" class="u-isVisuallyHidden" role="alert" aria-live="assertive"></p>
    </pf-app>

    <div id="Svg_Defs" class="u-isHidden">
        <svg>
            <defs>
                <style>
                    .cls-1 {
                        fill: #fff
                    }

                    .cls-2 {
                        fill: #b57ee5
                    }

                    .cls-4 {
                        fill: #6dabf5
                    }

                    .cls-8 {
                        fill: #a2e05e
                    }
                </style>
            </defs>
            <symbol id="icon-404" viewBox="0 0 230 230">
                <title>icon-404</title>
                <path
                    d="M115 0C51.6 0 0 51.6 0 115s51.6 115 115 115 115-51.6 115-115S178.4 0 115 0zm0 209.5c-52.2 0-94.5-42.3-94.5-94.5S62.8 20.5 115 20.5c52.2.1 94.4 42.3 94.5 94.5 0 52.2-42.3 94.5-94.5 94.5z">
                </path>
                <circle cx="147.1" cy="69.1" r="14.1"></circle>
                <path
                    d="M83 151.6c15.4 0 21.9-9.2 21.9-23.9 0-6.5-5.2-12-5.2-19-.2-8.7 6.8-15.9 15.5-16h.6c9.8 0 15.9 8.3 15.9 16 0 7.4-5.2 12.3-5.2 19.1 0 14.7 6 23.8 21.8 23.8 12.8 0 19-6.9 24.7-15.7 1.9-2.9 5-5.2 8.4-5.2 5.1 0 8 3.7 8 7.7 0 9.6-16.5 31.8-41.4 31.8-8.6 0-23.3-1.8-32.2-15.7-8.2 12.6-20.7 15.7-32.1 15.7-26 0-41.6-23-41.6-31.8 0-4.2 3.4-7.7 7.6-7.7h.2c3.5.2 6.8 2.1 8.6 5.2 5.5 9 12.3 15.7 24.5 15.7z">
                </path>
            </symbol>
            <symbol id="icon-alertBell_checked" viewBox="0 0 36.33 39.11">
                <title>icon-alertBell_checked</title>
                <path
                    d="M35.18 29.39c-2.49-1.35-3.39-5.49-3.39-7.94V17.3A11.55 11.55 0 0 0 24.4 6.51v-.15a6.35 6.35 0 0 0-6-6.36 6.27 6.27 0 0 0-4.55 1.74 6.18 6.18 0 0 0-1.9 4.48v.29A11.55 11.55 0 0 0 4.54 17.3v4.16c0 1.5-.24 6.52-3.33 7.91A2.08 2.08 0 0 0 0 31.26v1.86a1.79 1.79 0 0 0 1.79 1.79h10.33a6.45 6.45 0 0 0 12.1 0h10.32a1.83 1.83 0 0 0 1.79-2v-1.65a2.15 2.15 0 0 0-1.15-1.87zM18.06 5.2a1.23 1.23 0 1 1-1.23 1.23 1.23 1.23 0 0 1 1.23-1.23zm7.49 12.36l-7.68 7.68a2.46 2.46 0 0 1-3.47 0l-3.62-3.62a1 1 0 0 1 0-1.39l.7-.7a1 1 0 0 1 1.39 0l2.93 2.93a.49.49 0 0 0 .69 0l7-7a1 1 0 0 1 1.39 0l.69.69a1 1 0 0 1-.02 1.41z">
                </path>
            </symbol>
            <symbol id="icon-articleAlt" viewBox="0 0 93 116">
                <path
                    d="M46.66 37.79A17 17 0 1 0 64 54.84a17.21 17.21 0 0 0-17.34-17.05zm0 29.73a12.69 12.69 0 1 1 13-12.68 12.84 12.84 0 0 1-13 12.68zM55.49 16.66A8.42 8.42 0 1 0 64 25.07a8.48 8.48 0 0 0-8.51-8.41zm0 12.47a4.06 4.06 0 1 1 4.17-4.05 4.11 4.11 0 0 1-4.17 4.05zM37.83 16.66a8.42 8.42 0 1 0 8.54 8.41 8.48 8.48 0 0 0-8.54-8.41zm0 12.47A4.06 4.06 0 1 1 42 25.07a4.11 4.11 0 0 1-4.17 4.06z">
                </path>
                <path
                    d="M67.85 30.75a8.42 8.42 0 1 0 8.54 8.41 8.48 8.48 0 0 0-8.54-8.41zm0 12.47A4.06 4.06 0 1 1 72 39.16a4.11 4.11 0 0 1-4.15 4.06zM23.71 30.75a8.42 8.42 0 1 0 8.54 8.41 8.48 8.48 0 0 0-8.54-8.41zm0 12.47a4.06 4.06 0 1 1 4.17-4.05 4.11 4.11 0 0 1-4.17 4.05zM17.19 82a2 2 0 1 1 0-4h58.62a2 2 0 1 1 0 4zM17.19 90.5a2 2 0 1 1 0-4h58.62a2 2 0 1 1 0 4zM17.17 99a2 2 0 1 1 0-4h42.66a2 2 0 1 1 0 4z">
                </path>
                <path
                    d="M88.61 111.61V18.36a2.19 2.19 0 1 1 4.37 0v94.72a2.92 2.92 0 0 1-2.91 2.92H2.91A2.92 2.92 0 0 1 0 113.08V2.92A2.92 2.92 0 0 1 2.91 0h87.9a2.195 2.195 0 0 1 0 4.39H4.37v107.22z">
                </path>
            </symbol>
            <symbol id="icon-binoculars" viewBox="0 0 43.22 29.36">
                <title>icon-binoculars</title>
                <path
                    d="M42.12,16.76v0L34.75,3.06A5.82,5.82,0,0,0,29.62,0a5.75,5.75,0,0,0-4.3,1.89,5.85,5.85,0,0,0-1.5,4.5l.28,1.73h-5l.29-1.79a5.83,5.83,0,0,0-1.51-4.44A5.75,5.75,0,0,0,13.59,0,5.82,5.82,0,0,0,8.47,3.06L1.11,16.72s0,0,0,.06a8.44,8.44,0,1,0,15.7,5.43l2,1.13a6.12,6.12,0,0,0,3,.79,5.12,5.12,0,0,0,2.36-.56.8.8,0,0,0-.73-1.42,4,4,0,0,1-3.81-.21l-2.74-1.52a8.42,8.42,0,0,0-12.12-7.1L9.88,3.82A4.22,4.22,0,0,1,13.59,1.6a4.23,4.23,0,0,1,4.22,4.53l-.43,2.66a.8.8,0,0,0,.79.93H25a.8.8,0,0,0,.79-.93l-.42-2.6A4.22,4.22,0,0,1,26.51,3,4.17,4.17,0,0,1,29.62,1.6a4.22,4.22,0,0,1,3.72,2.22l5.12,9.5a8.46,8.46,0,1,0,3.66,3.43ZM15.3,20.91a6.85,6.85,0,1,1-6.85-6.85A6.86,6.86,0,0,1,15.3,20.91Zm19.48,6.85a6.85,6.85,0,1,1,6.85-6.85A6.86,6.86,0,0,1,34.78,27.76Z">
                </path>
                <path d="M25.48,12.76H17.4a.8.8,0,0,0,0,1.6h8.07a.8.8,0,0,0,0-1.6Z"></path>
                <circle cx="21.61" cy="19.88" r="1.02"></circle>
                <path d="M34.81,26.1a.8.8,0,0,1,0-1.6,3.49,3.49,0,1,0,0-7,.8.8,0,0,1,0-1.6,5.09,5.09,0,1,1,0,10.18Z">
                </path>
            </symbol>
            <symbol id="icon-devices" viewBox="99.5 315.5 370 172.1">
                <title>devices</title>
                <path
                    d="M323.4 487.6c-1 0-2 0-3.1-.1H217c-2.4 0-4.4-1.9-4.5-4.4-.1-2.4 1.8-4.5 4.3-4.6 11.8-.6 20.5-3.9 25.6-9.9 5.9-6.8 5.2-15.1 5.2-15.2-.1-1.3.3-2.5 1.2-3.5.9-.9 2.1-1.5 3.3-1.5h36c1.9 0 3.6 1.2 4.2 3 7.6 21.6 21.1 26.2 28.6 27h5.2c2.4 0 4.3 1.8 4.5 4.2.2 2.3-1.5 4.4-3.8 4.8-.3.1-1.5.2-3.4.2zm-78.4-9.1h54.2c-5.3-4.5-10.4-11.2-14.3-21h-28.5c-.5 4.4-2 10.9-7.1 16.9-1.3 1.5-2.7 2.8-4.3 4.1z">
                </path>
                <circle cx="138" cy="467.3" r="3"></circle>
                <circle cx="414" cy="465.7" r="4"></circle>
                <path
                    d="M453 487.5h-79c-9.1 0-16.5-7.4-16.5-16.5v-13.5H177c-.8 0-1.7-.1-2.5-.2V471c0 9.1-7.4 16.5-16.5 16.5h-42c-9.1 0-16.5-7.4-16.5-16.5v-82c0-9.1 7.4-16.5 16.5-16.5h42c.8 0 1.7.1 2.5.2V332c0-9.1 7.4-16.5 16.5-16.5h190c9.1 0 16.5 7.4 16.5 16.5v15.5H453c9.1 0 16.5 7.4 16.5 16.5v107c0 9.1-7.4 16.5-16.5 16.5zm-79-131c-4.1 0-7.5 3.4-7.5 7.5v107c0 4.1 3.4 7.5 7.5 7.5h79c4.1 0 7.5-3.4 7.5-7.5V364c0-4.1-3.4-7.5-7.5-7.5h-79zm-258 25c-4.1 0-7.5 3.4-7.5 7.5v82c0 4.1 3.4 7.5 7.5 7.5h42c4.1 0 7.5-3.4 7.5-7.5v-18.2l-.2-.2.2-.2V389c0-2-.8-4-2.3-5.4-1.4-1.4-3.3-2.1-5.2-2.1h-42zm58.5 66.6c.8.3 1.6.4 2.5.4h180.5V364c0-9.1 7.4-16.5 16.5-16.5h.5V332c0-4.1-3.4-7.5-7.5-7.5H177c-4.1 0-7.5 3.4-7.5 7.5v45.2c3.2 3.1 5 7.3 5 11.8v59.1z">
                </path>
                <path
                    d="M268.1 394.3c2.4-3.1 3.7-6.9 3.7-10.8 0-11.7-8.1-16.5-16.4-16.5-3.8 0-7.4 1.1-10.4 3.4-.7-2.1-2.6-3.5-4.8-3.4-2.7-.1-4.8 2-4.8 4.7 0 2.9.7 11 .7 21.6s-.7 17.7-.7 21.7c0 2.9 1.6 4.8 4.2 4.8 2.5 0 5.6-2 5.6-4.8 0-1.1-.4-7.7-.7-16 4 1.8 8.6 2.1 14.7 2.1 2.6 0 5.1-.1 8.6-.6m-15.4-6.6c-2.9.1-5.7-1.1-7.8-3.1 0-2.1.1-4.1.1-6v-.2c0-4.7 3.4-10.7 9.8-10.7 3.8 0 7.7 3 7.7 9.6-.1 7.4-5.3 10.4-9.8 10.4zm62.6-9.8c-.3-2.6-2.7-3.5-4.8-3.5-2.1 0-3.6 2.1-3.6 3.4 0 5.7-2.5 9.3-8.5 9.3-4.7 0-10.9-4.4-11.4-8.7v.2c6.6-6.3 18.2-18.7 18.2-29.4 0-8.2-4.4-13.8-12.3-13.8-9.8 0-14.9 7.2-14.9 14.6 0 3.1.4 13 .4 26.8v2c-2.3 3.5-5.6 8.3-10.1 8.3l-1.6 7.3c5.4 0 9.2-3.4 11.7-6.4-.2 9.6-.6 17.5-.6 21.7 0 11.5 6.5 14.1 11.2 14.1 9.6 0 14.6-7.4 14.6-15.9-.1-5-1.7-9.7-4.7-13.6 4.3-.1 9.5-1.6 12.2-6 2.7-4.5 4.5-7.8 4.2-10.4zm-27.7-27.6c0-4.2 2.5-7.3 5.1-7.3 2.9 0 4.2 2.9 4.2 6 0 7.7-5.6 15-9.6 19.7 0-7 .3-17 .3-18.4zm4.1 66.1c-2.6 0-4-2.5-4-6.4 0-.4-.2-9.5-.3-18.2 2.7 3.4 8.4 9.4 8.4 17.3-.1 5.3-2.2 7.3-4.1 7.3zm-155.6 3.1c1-1.2 1.5-2.8 1.5-4.3 0-4.7-3.3-6.6-6.6-6.6-1.5 0-3 .5-4.2 1.4-.3-.9-1.1-1.4-1.9-1.4-1.1 0-1.9.8-1.9 1.9 0 1.2.3 4.4.3 8.7 0 4.3-.3 7.1-.3 8.7 0 1.1.6 1.9 1.7 1.9 1 0 2.3-.8 2.3-1.9 0-.4-.2-3.1-.3-6.4 1.6.7 3.4.9 5.9.9 1.1 0 2.1 0 3.4-.2m-6.2-2.9c-1.2 0-2.3-.4-3.2-1.2v-2.5c0-1.9 1.4-4.3 3.9-4.3 1.5 0 3.1 1.2 3.1 3.9.1 2.9-2 4.1-3.8 4.1zm25.2-3.9c-.1-1.1-1.1-1.4-1.9-1.4-.8 0-1.4.8-1.4 1.4 0 2.3-1 3.7-3.4 3.7-1.9 0-4.4-1.8-4.6-3.5v.1c2.7-2.5 7.3-7.5 7.3-11.8 0-3.3-1.8-5.6-5-5.6-3.9 0-6 2.9-6 5.9 0 1.2.2 5.2.2 10.8v.8c-.9 1.4-2.2 3.3-4.1 3.3l-.6 2.9c2.2 0 3.7-1.3 4.7-2.6-.1 3.9-.2 7-.2 8.7 0 4.6 2.6 5.6 4.5 5.6 3.8 0 5.9-3 5.9-6.4 0-2-.7-3.9-1.9-5.5 1.7 0 3.8-.7 4.9-2.4s1.7-3 1.6-4zm-11.1-11.1c0-1.7 1-2.9 2-2.9 1.2 0 1.7 1.2 1.7 2.4 0 3.1-2.2 6-3.9 7.9 0-2.8.2-6.8.2-7.4zm1.6 26.6c-1.1 0-1.6-1-1.6-2.6 0-.2-.1-3.8-.1-7.3 1.1 1.4 3.4 3.8 3.4 7-.1 2.1-.9 2.9-1.7 2.9zm265.3-20c1.7-2.2 2.6-4.8 2.6-7.5 0-8.1-5.6-11.5-11.4-11.5-2.6 0-5.2.8-7.2 2.4-.5-1.5-1.8-2.4-3.4-2.4-1.9-.1-3.4 1.4-3.4 3.3 0 2 .5 7.6.5 15s-.5 12.3-.5 15.1c0 2 1.1 3.4 2.9 3.4 1.7 0 3.9-1.4 3.9-3.4 0-.7-.3-5.4-.5-11.2 2.8 1.3 6 1.5 10.2 1.5 1.8 0 3.6 0 6-.4m-10.7-4.5c-2 .1-4-.7-5.5-2.2 0-1.5.1-2.8.1-4.2v-.2c0-3.2 2.4-7.5 6.8-7.5 2.7 0 5.4 2.1 5.4 6.7 0 5.3-3.6 7.4-6.8 7.4zm43.6-6.9c-.2-1.8-1.9-2.4-3.3-2.5-1.5 0-2.5 1.5-2.5 2.3 0 4-1.8 6.5-5.9 6.5-3.2 0-7.6-3.1-8-6v.1c4.6-4.4 12.7-13 12.7-20.5 0-5.7-3.1-9.6-8.6-9.6-6.8 0-10.4 5-10.4 10.2 0 2.2.3 9.1.3 18.7v1.4c-1.6 2.4-3.9 5.8-7.1 5.8l-1.1 5.1c3.8 0 6.4-2.3 8.1-4.4-.1 6.7-.4 12.2-.4 15.1 0 8 4.5 9.8 7.8 9.8 6.7 0 10.2-5.2 10.2-11-.1-3.5-1.2-6.8-3.3-9.5 3-.1 6.6-1.1 8.5-4.2 2-3.1 3.3-5.4 3-7.3zm-19.2-19.2c0-2.9 1.7-5.1 3.5-5.1 2 0 2.9 2 2.9 4.2 0 5.4-3.9 10.4-6.7 13.7.1-4.8.3-11.8.3-12.8zm2.8 46.1c-1.8 0-2.8-1.7-2.8-4.4 0-.3-.1-6.6-.2-12.7 1.9 2.4 5.9 6.5 5.9 12.1-.1 3.6-1.6 5-2.9 5z">
                </path>
            </symbol>
            <symbol id="icon-foundOnPetfinder" viewBox="0 0 612 103">
                <title>icon-foundOnPetfinder</title>
                <path
                    d="M444 32a5.38 5.38 0 10-5.37-5.37A5.36 5.36 0 00444 32zM6.64 63.48h5.32V45.84h22.95v-4.89H11.96V26.13H36v-4.89H6.64v42.24zM55.87 33a14.93 14.93 0 00-11 4.36 15.15 15.15 0 00-4.37 11.2 15.22 15.22 0 004.34 11.25 14.92 14.92 0 0011 4.35 15 15 0 0015.57-15.6 15.11 15.11 0 00-4.38-11.21A15.27 15.27 0 0055.87 33zm7.63 23.42a10.31 10.31 0 01-7.63 3 10.11 10.11 0 01-7.56-3.05 10.76 10.76 0 01-3-7.84 10.88 10.88 0 013-8 10.18 10.18 0 017.58-3.07 10.13 10.13 0 017.56 3.09 10.85 10.85 0 013 7.93 10.72 10.72 0 01-2.95 7.94zM100.24 49.67a10.58 10.58 0 01-2.45 7.09 8.1 8.1 0 01-6.46 2.87q-4.22 0-6.3-2.42t-2.09-6.87V33.66H78v16.65q0 6.52 3.28 10.19a11.49 11.49 0 009 3.66 11.87 11.87 0 0010.12-5.44l.23 4.71h4.53V33.66h-4.94zM129.82 33a11.67 11.67 0 00-10.08 5.27l-.23-4.56H115v29.72h4.82v-16a10.26 10.26 0 012.51-7 8.19 8.19 0 016.48-2.88q8.63 0 8.63 9.09v16.8h4.94V46.63q0-6.56-3.44-10.09a12.23 12.23 0 00-9.12-3.54zM175.4 21.24V39a10.31 10.31 0 00-4.63-4.43 14.25 14.25 0 00-6.46-1.57 16.62 16.62 0 00-5.94 1 13.76 13.76 0 00-4.77 3 13.4 13.4 0 00-3.19 4.89 17.73 17.73 0 00-1.16 6.61q0 7.39 4.22 11.53a14.86 14.86 0 0010.84 4.13 13.32 13.32 0 006.4-1.6 12.09 12.09 0 004.75-4.56l.23 5.48h4.71V21.19h-.06zm-3.25 35.1a10.06 10.06 0 01-7.55 3.11 10.44 10.44 0 01-7.54-2.86q-3-2.87-3-8.15a10.64 10.64 0 013-8 11 11 0 0115.06.13 10.56 10.56 0 013 7.8 11 11 0 01-2.97 7.97zM218.33 33a14.89 14.89 0 00-11 4.36 15.12 15.12 0 00-4.33 11.2 15.26 15.26 0 004.34 11.25 14.94 14.94 0 0011 4.35 15 15 0 0015.58-15.6 15.07 15.07 0 00-4.39-11.21 15.27 15.27 0 00-11.2-4.35zM226 56.42a10.29 10.29 0 01-7.63 3 10.14 10.14 0 01-7.56-3.05 10.75 10.75 0 01-3-7.84 10.87 10.87 0 013-8 10.85 10.85 0 0115.15 0 10.84 10.84 0 013 7.93 10.72 10.72 0 01-2.96 7.96zM256.4 33a11.67 11.67 0 00-10.08 5.27l-.24-4.56h-4.47v29.72h4.83v-16a10.25 10.25 0 012.5-7 8.2 8.2 0 016.49-2.88q8.63 0 8.63 9.09v16.8H269V46.63q0-6.56-3.44-10.09A12.23 12.23 0 00256.4 33z">
                </path>
                <path
                    d="M597.77 31.2c-5.16 0-9.14 3.57-11.47 7.15.08-.91.08-1.66.08-2.33a5 5 0 00-5.57-4.32 4.87 4.87 0 00-4.32 4.4c0 3 .66 7.57.66 12.39a21.91 21.91 0 01-.08 2.33c-4.57 4.65-10.22 8.31-17.45 8.31-5.49 0-8-2.08-9.06-5.07 12.71-.08 19.2-5.15 19.2-12.8 0-5.9-5.16-10.06-12.47-10.06-9.56 0-17.46 7.23-17.46 18.54a18.13 18.13 0 001.17 6.9 5.3 5.3 0 01-4.57 2.24c-3.58 0-4.91-2.83-4.91-18.12 0-7.4.67-15.46.67-22.53a4.95 4.95 0 00-9.89-.08c0 4 .33 8.4.49 15.13a15.43 15.43 0 00-8.39-2c-12.47 0-19.12 9.73-19.12 18.21a19.18 19.18 0 001.25 7.15 8 8 0 01-5.15 2.16c-2.08 0-4.33-1.83-4.33-8.56 0-1.5.25-7.49.25-9.73 0-5.82-4.24-9.31-10.47-9.31-5.9 0-9.89 3.33-12.3 7.15.08-.91.08-1.66.08-2.33A5 5 0 00459 31.7a4.87 4.87 0 00-4.32 4.4c0 3 .66 7.57.66 12.39a21.91 21.91 0 01-.08 2.33c-.41 3.74-6 7.89-10.8 7.89-6.24 0-8.65-3.57-8.65-9.39 0-2.66 2.08-4.57 2.08-7.56a6.32 6.32 0 00-12.63-.17v.33c0 2.75 2.07 4.66 2.07 7.24 0 5.81-2.57 9.47-8.64 9.47h-.66c-4.42-.36-9.87-4.26-10.86-8.19l-.09-.45c6.74-6.41 18.51-19 18.51-29.9 0-8.31-4.49-14-12.55-14C403.1 6 398 13.33 398 20.89c0 3.05.38 12.48.41 25.72v3.63c-2.32 3.57-5.65 8.47-10.3 8.47-2.5 0-4.08-1.74-4.74-4.48-.75-3-.58-7-.58-11.23 0-1.49 0-3.07.08-4.57 3.16.09 5.82.09 7.57.09a3.73 3.73 0 003.82-3.66 3.63 3.63 0 00-3.91-3.74c-2.16 0-4.74.08-7.15.08.17-3.74.34-7.31.34-10.31a5 5 0 00-9.9-1.08V21c0 .91.25 5.48.42 10.14-1 0-1.91-.09-2.91-.09a3.7 3.7 0 00-3.82 3.5v.24a3.77 3.77 0 003.82 3.66c.83 0 1.75-.08 3.16-.08v.83c0 1.66-.25 5.57-.5 9.06-5.07 5.82-11.3 10.89-19.86 10.89-5.49 0-8-2.08-9-5.07 12.72-.08 19.2-5.15 19.2-12.8 0-5.9-5.15-10.06-12.55-10.06-9.56 0-17.46 7.23-17.46 18.54a20.65 20.65 0 00.58 5 38.91 38.91 0 01-11.3 4.33 18.25 18.25 0 003.74-11c0-11.88-8.23-16.79-16.71-16.79a17.17 17.17 0 00-10.55 3.49 4.93 4.93 0 00-4.9-3.51 4.74 4.74 0 00-4.9 4.82c0 3 .66 11.14.66 21.95s-.66 18-.66 22.11c0 2.91 1.58 4.9 4.24 4.9 2.49 0 5.73-2 5.73-4.9 0-1.08-.41-7.82-.66-16.29 4.07 1.83 8.73 2.16 15 2.16a48.56 48.56 0 0022.94-6.15c3.08 4 8.4 6.15 15.79 6.15 9.23 0 16.46-5.32 20.7-9.31 1 6.32 5.4 9.39 12.72 9.39 5.48 0 9.39-3.41 11.88-6.48-.16 9.81-.58 17.78-.58 22.11 0 11.72 6.57 14.29 11.39 14.29 9.73 0 14.88-7.56 14.88-16.12a23.23 23.23 0 00-4.9-13.91c4.4-.09 8.89-1.08 12.38-6.15 3.49 5.48 9.31 6.15 12.72 6.15a14.42 14.42 0 0010.31-4.49 5 5 0 009.89-.33c0-.92-.33-4.91-.5-8.65 0-5.07 5.32-14 10.06-14 2.41 0 3.9 2.08 3.9 5 0 2.24-.25 6.65-.25 9.55 0 6.9 1.75 13 11.47 13A16.43 16.43 0 00500 61.79a17.56 17.56 0 0012 4.32 17.8 17.8 0 0013-5.65c1.16 2.83 3.82 5.57 9.64 5.57a12.56 12.56 0 009.89-4.41c3.16 2.83 8 4.41 14.22 4.41 7.39 0 13.46-3.41 17.78-6.82 0 .67-.08 1.33-.08 1.91a5 5 0 009.89.09c0-.92-.33-5-.5-8.73.09-6 6.15-13.22 9.15-13.22 2 0 1.57 2.75 5.23 2.75a4.76 4.76 0 004.78-4.82c0-2.25-1.66-5.99-7.23-5.99zm-190-10c0-4.24 2.49-7.4 5.15-7.4 3 0 4.24 3 4.24 6.15 0 7.81-5.65 15.21-9.81 20 .07-7.09.41-17.23.41-18.72zM307.35 58.71a11 11 0 01-8-3.15c0-2.17.08-4.16.08-6.07v-.25c0-4.74 3.49-10.89 10-10.89 3.9 0 7.81 3.07 7.81 9.81 0 7.48-5.24 10.55-9.89 10.55zm44.14-21.27a4.25 4.25 0 014.48 4v.25c0 3.91-2.49 6.4-11.8 6.49 0-8.34 4.57-10.74 7.32-10.74zm60.42 51c-2.66 0-4.07-2.49-4.07-6.48 0-.42-.17-9.65-.33-18.54 2.74 3.49 8.56 9.56 8.56 17.62-.07 5.44-2.25 7.43-4.16 7.43zM523 48.24c0 4.74-3.57 10.89-10 10.89-3.91 0-7.82-3.08-7.82-9.81 0-7.56 5.24-11 10-11a10 10 0 017.82 3.44zm34.25-10.8a4.28 4.28 0 014.48 4.15v.08c0 3.75-2.49 6.32-11.8 6.49-.12-8.32 4.45-10.72 7.28-10.72z">
                </path>
            </symbol>
            <symbol id="icon-resources" viewBox="0 0 39 50.19">
                <title>icon-resources</title>
                <path
                    d="M38.93,38.63a.8.8,0,0,0-1.06-.39L15.48,48.47,2.15,38.88a5.69,5.69,0,0,1-.34-3.77L14.91,44.6a.8.8,0,0,0,.8.08L38.53,34.4A.8.8,0,0,0,38.67,33L31,27.49V4.27a.8.8,0,0,0-1.13-.73l-17.65,8a3.3,3.3,0,0,1-3.5-2.17l17.43-7.8A.8.8,0,0,0,25.53.07L7.5,8.14l-.06,0-.07,0a.79.79,0,0,0-.15.14l0,.05a.79.79,0,0,0-.11.25s0,0,0,.07a.78.78,0,0,0,0,.14V30.53L1.17,33.17l0,0a.78.78,0,0,0-.23.19l-.05.06,0,0c-1.81,2.8-.1,6.17,0,6.32a.8.8,0,0,0,.24.28L14.93,50a.8.8,0,0,0,.8.08L38.53,39.69A.8.8,0,0,0,38.93,38.63ZM8.63,19.16a5.75,5.75,0,0,0,3,.76v4.82c-2.22,0-2.9-1.16-3-1.45Zm3-6.07v5.23c-2.34,0-2.93-1.18-3-1.44V12A5.24,5.24,0,0,0,11.66,13.09Zm-3,12.47a5.74,5.74,0,0,0,3.14.8l.59,0a.79.79,0,0,0,.48-.21.79.79,0,0,0,.43-.7V12.8L29.43,5.51V26.33L24.79,23a.8.8,0,0,0-.8-.08L8.63,29.81Zm15.6-1,12.38,9L15.47,43l-12.38-9Z">
                </path>
                <path
                    d="M17.36,30.81l7.39,5.34a.8.8,0,0,0,.8.08l5.6-2.6a.8.8,0,0,0,.14-1.37L24.08,27a.8.8,0,0,0-.8-.09L17.5,29.43a.8.8,0,0,0-.14,1.38Zm6.15-2.29,5.75,4.22-4,1.83-5.88-4.25Z">
                </path>
            </symbol>
            <symbol id="icon-ribbon" viewBox="0 0 164.79 144.23">
                <title>icon-ribbon</title>
                <path
                    d="M26.09 94.94l.01.01-.01-.01zM77.86 87.79zM108 96.76a39.85 39.85 0 01-57.86-53.91 2.35 2.35 0 00-3.8-2.77 44.56 44.56 0 0064.72 60.29 2.37 2.37 0 00.83-1.6 2.34 2.34 0 00-.55-1.72 2.37 2.37 0 00-3.34-.29zM82.4 21.7a44.58 44.58 0 00-28.77 10.53A2.35 2.35 0 0055 36.37a2.46 2.46 0 001.72-.55 39.85 39.85 0 0158.49 53.12 2.34 2.34 0 00-.38 1.76 2.28 2.28 0 001 1.51 2.4 2.4 0 003.28-.59A44.56 44.56 0 0082.4 21.7z">
                </path>
                <path
                    d="M137.27 95.24l.32-.88a61.06 61.06 0 006.78-28.11 62 62 0 00-123.94 0 61.18 61.18 0 006.77 28.11l.4.78-.64.59-21.37 21.34a2.35 2.35 0 001.45 4l15.35 1.37 1.37 15.35a2.35 2.35 0 004 1.45l21-21 .77.48a61.74 61.74 0 0065.78 0l.77-.48 21 21a2.36 2.36 0 004-1.45l1.36-15.35 15.36-1.37a2.35 2.35 0 001.45-4zM28 132.36l-1.09-12.3a2.36 2.36 0 00-2.14-2.13l-12.3-1.1L30 99.32l.77 1.16a62.4 62.4 0 0013.06 14.23l1 .79zm54.4-8.85a57.26 57.26 0 1157.26-57.26 57.32 57.32 0 01-57.26 57.26zm57.6-5.58a2.35 2.35 0 00-2.13 2.13l-1.09 12.3L120 115.5l1-.79a62.44 62.44 0 0013-14.23l.77-1.16 17.52 17.51z">
                </path>
                <path
                    d="M79.78 85.66l25.77-36.08a2.36 2.36 0 00-.55-3.29 2.38 2.38 0 00-1.75-.4 2.32 2.32 0 00-1.53 1L77.63 80.57 62.89 64.65a2.41 2.41 0 00-1.74-.75 2.32 2.32 0 00-1.59.63 2.35 2.35 0 00-.13 3.32l16.71 18a2.35 2.35 0 001.72.76v1.14l.14-1.11a2.37 2.37 0 001.78-.98z">
                </path>
            </symbol>
            <symbol id="icon-shelter" viewBox="0 0 48.66 46.7">
                <title>icon-shelter</title>
                <path
                    d="M48.21,11.57L24.7,0.08a0.84,0.84,0,0,0-.73,0L0.45,11.57a0.79,0.79,0,0,0-.37,1.07,0.83,0.83,0,0,0,1.1.36L24.33,1.69,47.48,13a0.84,0.84,0,0,0,.37.08,0.82,0.82,0,0,0,.73-0.44A0.79,0.79,0,0,0,48.21,11.57Z">
                </path>
                <path
                    d="M40.76,36.51a2.73,2.73,0,0,0-2-.1l-8.66,2a3,3,0,0,0-.56-2.07,3.07,3.07,0,0,0-2-1.21l-7.63-1.65h-0.1a6.16,6.16,0,0,0-5.06.82c-1.23.83-7.28,4.75-7.35,4.79a0.79,0.79,0,0,0-.23,1.11,0.82,0.82,0,0,0,.68.36,0.83,0.83,0,0,0,.45-0.13c0.25-.16,6.14-4,7.37-4.81a4.53,4.53,0,0,1,3.9-.55h0.07l7.58,1.64a1.47,1.47,0,0,1,1,.58,1.42,1.42,0,0,1,.26,1.08,1.48,1.48,0,0,1-1.67,1.21l-5-1a0.82,0.82,0,0,0-1,.61,0.8,0.8,0,0,0,.63.95l5,1a3.1,3.1,0,0,0,.5,0,3.15,3.15,0,0,0,2.22-.93l10-2.32,0.09,0a1.09,1.09,0,0,1,.81,0,1,1,0,0,1,.55.59A1,1,0,0,1,40,39.87L29.27,43.69a2.37,2.37,0,0,1-1.66.06l-9-1.88a0.83,0.83,0,0,0-.56.08L11.84,45.2a0.79,0.79,0,0,0-.33,1.08,0.83,0.83,0,0,0,1.11.33l6-3.12,8.7,1.82a3.94,3.94,0,0,0,2.6-.14l10.66-3.8A2.61,2.61,0,0,0,40.76,36.51Z">
                </path>
                <path
                    d="M14,19a3,3,0,0,0,2.76,3.21A3,3,0,0,0,19.48,19a3,3,0,0,0-2.76-3.21A3,3,0,0,0,14,19Zm4.13,0a1.7,1.7,0,0,1-1.37,1.86A1.7,1.7,0,0,1,15.35,19a1.7,1.7,0,0,1,1.38-1.86A1.7,1.7,0,0,1,18.1,19Z">
                </path>
                <path
                    d="M31.93,22.21A3,3,0,0,0,34.69,19a3,3,0,0,0-2.76-3.21A3,3,0,0,0,29.18,19,3,3,0,0,0,31.93,22.21Zm0-5.08A1.7,1.7,0,0,1,33.31,19a1.7,1.7,0,0,1-1.37,1.86A1.7,1.7,0,0,1,30.56,19,1.7,1.7,0,0,1,31.93,17.13Z">
                </path>
                <path
                    d="M27.43,10.58a3,3,0,0,0-2.76,3.21A3,3,0,0,0,27.43,17a3,3,0,0,0,2.76-3.21A3,3,0,0,0,27.43,10.58Zm0,5.08a1.7,1.7,0,0,1-1.37-1.86,1.7,1.7,0,0,1,1.37-1.86,1.7,1.7,0,0,1,1.37,1.86A1.7,1.7,0,0,1,27.43,15.66Z">
                </path>
                <path
                    d="M21.23,10.58a3,3,0,0,0-2.76,3.21A3,3,0,0,0,21.23,17,3,3,0,0,0,24,13.79,3,3,0,0,0,21.23,10.58Zm0,5.08a1.7,1.7,0,0,1-1.37-1.86,1.7,1.7,0,0,1,1.37-1.86,1.7,1.7,0,0,1,1.37,1.86A1.7,1.7,0,0,1,21.23,15.66Z">
                </path>
                <path
                    d="M20.75,19.54L18.11,24a5.14,5.14,0,0,0-.45,1,3.68,3.68,0,0,0-.26,1.39,3.79,3.79,0,0,0,3.65,3.7h0.19a3.88,3.88,0,0,0,1.47-.28l0.44-.14a3.77,3.77,0,0,1,1.18-.25,3.75,3.75,0,0,1,1.18.25L26,29.79a6.53,6.53,0,0,0,1.55.27H27.6a3.8,3.8,0,0,0,3.65-3.72A4.37,4.37,0,0,0,31,25h0a5.57,5.57,0,0,0-.46-1l-2.64-4.47a4.28,4.28,0,0,0-3.58-2.42A4.28,4.28,0,0,0,20.75,19.54Zm6,0.68,2.64,4.47a4.28,4.28,0,0,1,.35.74,3.07,3.07,0,0,1,.17.91,2.43,2.43,0,0,1-2.3,2.37,5.16,5.16,0,0,1-1.19-.21l-0.43-.13A5,5,0,0,0,24.33,28a5,5,0,0,0-1.61.32l-0.43.13-0.08,0a2.47,2.47,0,0,1-1,.19H21.12a2.43,2.43,0,0,1-2.34-2.36V26.28A2.39,2.39,0,0,1,19,25.43a4,4,0,0,1,.35-0.74l2.64-4.47a3,3,0,0,1,2.38-1.74A3,3,0,0,1,26.71,20.21Z">
                </path>
            </symbol>
            <symbol id="logo-developers" viewBox="0 0 140 40">
                <g fill="#FFF" fill-rule="evenodd">
                    <path
                        d="M65.625 38v-5.594h4.078v1.145h-2.832v1.328h2.656v1.113h-2.656V38h-1.246zm4.688-2.8c0-.902.277-1.616.832-2.143.554-.528 1.285-.791 2.19-.791.597 0 1.123.116 1.577.35.455.232.81.571 1.065 1.017.255.445.382.967.382 1.566 0 .6-.127 1.121-.38 1.567a2.535 2.535 0 0 1-1.065 1.02c-.456.234-.982.35-1.578.35-.596 0-1.122-.116-1.578-.35a2.535 2.535 0 0 1-1.065-1.02c-.254-.446-.38-.968-.38-1.567zm1.222 0c0 .525.168.958.504 1.298.336.34.768.51 1.297.51.539 0 .974-.17 1.305-.508.33-.339.496-.772.496-1.3 0-.522-.166-.955-.498-1.3-.332-.345-.767-.517-1.303-.517-.346 0-.658.08-.934.242-.276.161-.49.38-.64.656a1.88 1.88 0 0 0-.227.918zm5.75 2.8v-5.602h2.656c.329 0 .626.053.893.157.267.104.484.244.652.42a1.888 1.888 0 0 1 .526 1.314c0 .195-.019.372-.055.531-.036.16-.1.317-.193.473a1.425 1.425 0 0 1-.4.424c-.175.126-.391.236-.65.33l1.54 1.855V38h-1.387l-1.43-1.84h-.906V38h-1.246zm1.246-2.895h1.426c.266 0 .47-.08.611-.242a.802.802 0 0 0 .213-.543.886.886 0 0 0-.22-.586c-.148-.174-.354-.261-.62-.261h-1.41v1.632zM84.977 38v-5.602h2.296c.375 0 .718.05 1.028.147.31.098.572.231.787.4.215.17.396.371.543.606.147.234.254.486.322.756s.102.554.102.853c0 .302-.034.59-.1.861-.066.273-.172.53-.316.774a2.412 2.412 0 0 1-.537.63 2.394 2.394 0 0 1-.79.42 3.31 3.31 0 0 1-1.039.155h-2.296zm1.23-1.152h1.066c.235 0 .444-.034.627-.102.184-.068.332-.156.446-.264.113-.108.207-.238.281-.39a1.8 1.8 0 0 0 .154-.46c.029-.153.043-.316.043-.487 0-.167-.016-.326-.049-.477a1.66 1.66 0 0 0-.162-.438 1.317 1.317 0 0 0-.287-.365 1.28 1.28 0 0 0-.443-.246 1.884 1.884 0 0 0-.61-.092h-1.066v3.32zM91 38v-5.602h4.152v1.145h-2.93v1.082h2.762v1.094h-2.761v1.129h3.039V38H91zm4.598-5.602h1.398l1.578 4.137 1.574-4.137h1.403l-2.328 5.625h-1.29l-2.335-5.625zm6.55 5.602v-5.602h4.153v1.145h-2.93v1.082h2.762v1.094h-2.762v1.129h3.04V38h-4.263zm5.247 0v-5.602h1.246v4.457h2.8V38h-4.046zm4.476-2.8c0-.902.277-1.616.832-2.143.555-.528 1.285-.791 2.192-.791.596 0 1.121.116 1.576.35.454.232.809.571 1.064 1.017.255.445.383.967.383 1.566 0 .6-.127 1.121-.38 1.567a2.535 2.535 0 0 1-1.065 1.02c-.456.234-.982.35-1.578.35-.597 0-1.123-.116-1.579-.35a2.535 2.535 0 0 1-1.064-1.02c-.254-.446-.38-.968-.38-1.567zm1.223 0c0 .525.168.958.504 1.298.336.34.768.51 1.297.51.539 0 .973-.17 1.304-.508.331-.339.496-.772.496-1.3 0-.522-.166-.955-.498-1.3-.332-.345-.766-.517-1.302-.517-.347 0-.658.08-.934.242-.276.161-.49.38-.64.656a1.88 1.88 0 0 0-.227.918zm5.75 2.8v-5.602h2.64c.35 0 .662.054.94.16.277.107.502.253.674.438.172.185.302.397.392.637.09.24.135.497.135.773 0 .284-.046.546-.137.787-.09.241-.224.452-.398.631-.175.18-.399.322-.672.426a2.725 2.725 0 0 1-.934.164h-1.394V38h-1.246zm1.246-2.727h1.394c.287 0 .508-.08.662-.24a.828.828 0 0 0 .233-.6c0-.239-.078-.44-.233-.603-.154-.163-.375-.244-.662-.244h-1.394v1.687zM124.434 38v-5.602h4.152v1.145h-2.93v1.082h2.762v1.094h-2.762v1.129h3.04V38h-4.262zm5.246 0v-5.602h2.656c.328 0 .626.053.893.157.266.104.484.244.652.42a1.888 1.888 0 0 1 .525 1.314c0 .195-.018.372-.054.531-.037.16-.101.317-.194.473a1.425 1.425 0 0 1-.4.424c-.175.126-.39.236-.649.33l1.54 1.855V38h-1.387l-1.43-1.84h-.906V38h-1.246zm1.246-2.895h1.426c.265 0 .469-.08.61-.242a.802.802 0 0 0 .214-.543.886.886 0 0 0-.22-.586c-.148-.174-.354-.261-.62-.261h-1.41v1.632zm4.117 1.918l.746-.765c.193.252.45.446.772.58.321.134.632.201.931.201.339 0 .61-.06.813-.18.203-.117.306-.28.308-.488-.002-.23-.092-.4-.27-.512-.182-.114-.468-.187-.859-.218a4.918 4.918 0 0 1-1.1-.201 1.743 1.743 0 0 1-.462-.21 1.781 1.781 0 0 1-.352-.304 1.14 1.14 0 0 1-.234-.434 1.756 1.756 0 0 1-.07-.539v-.031a1.467 1.467 0 0 1 .68-1.26c.208-.134.443-.237.704-.308.262-.072.537-.108.827-.108.46 0 .855.061 1.183.184.328.122.63.342.903.66l-.782.68a1.626 1.626 0 0 0-.59-.344 2.158 2.158 0 0 0-.707-.121c-.276 0-.51.055-.703.166-.192.11-.289.257-.289.44a.535.535 0 0 0 .217.44.82.82 0 0 0 .26.118c.11.031.217.055.324.072.107.017.24.032.398.045.24.023.458.058.655.103.196.046.39.114.582.204.191.09.352.198.482.326.13.127.235.29.315.49.079.2.119.424.119.674 0 .3-.066.565-.198.797-.131.231-.309.416-.533.554a2.68 2.68 0 0 1-.75.313 3.55 3.55 0 0 1-.879.105h-.093a3.38 3.38 0 0 1-1.336-.277c-.453-.198-.79-.482-1.012-.852z">
                    </path>
                    <circle fill-rule="nonzero" cx="68.5" cy="9.5" r="2.5"></circle>
                    <path
                        d="M136.785 11.191c-2.29 0-4.064 1.588-5.099 3.176.037-.406.037-.738.037-1.034a2.21 2.21 0 0 0-2.475-1.92c-1.035.11-1.81.923-1.922 1.957 0 1.33.296 3.361.296 5.503 0 .37 0 .702-.037 1.035-2.032 2.068-4.545 3.693-7.76 3.693-2.438 0-3.546-.923-4.027-2.253 5.654-.037 8.536-2.29 8.536-5.688 0-2.622-2.291-4.469-5.543-4.469-4.249 0-7.76 3.213-7.76 8.237a7.993 7.993 0 0 0 .518 3.065 2.345 2.345 0 0 1-2.032.997c-1.589 0-2.18-1.255-2.18-8.051 0-3.288.296-6.87.296-10.01 0-1.218-.961-2.216-2.18-2.216-1.22 0-2.217.96-2.217 2.18 0 1.772.147 3.73.221 6.721-.776-.48-1.921-.886-3.731-.886-5.543 0-8.499 4.321-8.499 8.089-.037 1.07.185 2.179.554 3.176a3.559 3.559 0 0 1-2.29.96c-.924 0-1.922-.812-1.922-3.804 0-.665.111-3.324.111-4.321 0-2.586-1.884-4.137-4.655-4.137-2.624 0-4.397 1.478-5.469 3.176.037-.406.037-.738.037-1.034a2.21 2.21 0 0 0-2.476-1.92c-1.034.11-1.81.923-1.92 1.957 0 1.33.295 3.361.295 5.503 0 .37 0 .702-.037 1.035-.185 1.662-2.66 3.508-4.804 3.508-2.77 0-3.842-1.588-3.842-4.173 0-1.182.923-2.032.923-3.361a2.83 2.83 0 0 0-2.77-2.844 2.83 2.83 0 0 0-2.846 2.77v.148c0 1.219.924 2.068.924 3.213 0 2.585-1.146 4.21-3.843 4.21-2.106 0-4.914-1.994-5.173-3.915v.074c2.993-2.844 8.24-8.458 8.24-13.296 0-3.694-1.995-6.242-5.58-6.242-4.433 0-6.724 3.25-6.724 6.611 0 1.404.185 5.873.185 12.115v.923c-1.035 1.588-2.513 3.767-4.582 3.767-1.109 0-1.81-.775-2.106-1.994-.333-1.33-.259-3.103-.259-4.986 0-.665 0-1.367.037-2.032 1.404.037 2.587.037 3.363.037.923.037 1.662-.701 1.7-1.625 0-.96-.666-1.662-1.737-1.662-.961 0-2.107.037-3.178.037.074-1.662.148-3.25.148-4.58a2.182 2.182 0 0 0-1.959-2.437 2.182 2.182 0 0 0-2.438 1.957v.517c0 .406.11 2.438.185 4.506-.444 0-.85-.037-1.294-.037-.886-.037-1.662.665-1.7 1.552v.11a1.68 1.68 0 0 0 1.7 1.625c.37 0 .776-.037 1.404-.037v.37c0 .739-.11 2.474-.221 4.026-2.254 2.585-5.025 4.838-8.831 4.838-2.439 0-3.547-.923-3.99-2.253 5.653-.037 8.535-2.29 8.535-5.688 0-2.622-2.291-4.469-5.58-4.469-4.249 0-7.759 3.213-7.759 8.237 0 .738.074 1.477.259 2.216a17.265 17.265 0 0 1-5.025 1.92 8.097 8.097 0 0 0 1.662-4.875c0-5.282-3.658-7.46-7.426-7.46-1.7 0-3.363.516-4.693 1.55a2.185 2.185 0 0 0-2.18-1.55C.96 11.19 0 12.15 0 13.37c0 1.33.296 4.95.296 9.751 0 4.801-.296 7.978-.296 9.825 0 1.292.702 2.179 1.884 2.179 1.109 0 2.55-.887 2.55-2.18 0-.48-.185-3.471-.296-7.239 1.81.813 3.88.96 6.651.96 4.545 0 8.24-1.661 10.198-2.732 1.367 1.772 3.732 2.733 7.02 2.733 4.102 0 7.316-2.364 9.2-4.137.444 2.807 2.402 4.174 5.654 4.174 2.439 0 4.175-1.515 5.284-2.881-.074 4.358-.259 7.904-.259 9.824 0 5.208 2.919 6.353 5.062 6.353 4.323 0 6.614-3.361 6.614-7.165a10.316 10.316 0 0 0-2.143-6.168c1.958-.037 3.953-.48 5.505-2.733 1.552 2.437 4.139 2.733 5.653 2.733 1.848 0 3.326-.776 4.582-1.995.185 1.219 1.293 2.069 2.513 1.884a2.203 2.203 0 0 0 1.884-2.032c0-.406-.148-2.179-.222-3.84 0-2.254 2.365-6.206 4.471-6.206 1.072 0 1.737.924 1.737 2.216 0 .998-.111 2.955-.111 4.248 0 3.065.776 5.762 5.099 5.762a7.305 7.305 0 0 0 4.803-1.921c1.478 1.293 3.363 1.958 5.321 1.92 2.18 0 4.286-.886 5.801-2.51.517 1.255 1.7 2.474 4.286 2.474a5.58 5.58 0 0 0 4.397-1.958c1.404 1.256 3.547 1.958 6.318 1.958 3.289 0 5.986-1.515 7.907-3.029 0 .296-.037.591-.037.85.148 1.218 1.22 2.105 2.44 1.957 1.034-.11 1.847-.923 1.957-1.92 0-.407-.147-2.217-.221-3.879.037-2.659 2.734-5.872 4.064-5.872.887 0 .702 1.219 2.328 1.219 1.182 0 2.106-.96 2.106-2.143 0-.997-.739-2.659-3.215-2.659zM52.32 6.76c0-1.884 1.108-3.287 2.29-3.287 1.33 0 1.885 1.33 1.885 2.733 0 3.472-2.512 6.759-4.36 8.901.037-3.176.185-7.682.185-8.347zM7.685 23.416c-1.33.037-2.586-.48-3.547-1.403 0-.96.037-1.847.037-2.696v-.111c0-2.105 1.552-4.839 4.434-4.839 1.737 0 3.473 1.367 3.473 4.359 0 3.324-2.327 4.69-4.397 4.69zm19.62-9.455c1.035-.074 1.922.739 1.996 1.773v.11c0 1.737-1.109 2.845-5.247 2.882 0-3.694 2.032-4.765 3.251-4.765zM54.167 36.64c-1.182 0-1.81-1.108-1.81-2.88 0-.186-.074-4.285-.148-8.237 1.22 1.55 3.806 4.247 3.806 7.83-.037 2.4-.998 3.287-1.848 3.287zm49.364-17.876c0 2.105-1.589 4.838-4.434 4.838-1.736 0-3.473-1.366-3.473-4.358 0-3.361 2.328-4.876 4.434-4.876a4.464 4.464 0 0 1 3.473 1.515v2.88zm15.223-4.802a1.91 1.91 0 0 1 1.996 1.847v.037c0 1.662-1.109 2.807-5.247 2.88-.037-3.693 1.995-4.764 3.251-4.764zm17.662 11.45c.037.702-.517 1.33-1.22 1.366h-.11c-.702.037-1.293-.517-1.33-1.218v-.148c0-.739.59-1.33 1.33-1.33.739 0 1.33.591 1.33 1.33zm-2.402 0c-.037.554.37 1.071.96 1.108h.112c.554.037 1.034-.406 1.071-.96v-.148a1.037 1.037 0 0 0-.96-1.108h-.074c-.555-.037-1.035.406-1.072.96-.037.074-.037.111-.037.148zm1.33.185a.498.498 0 0 0 .333-.554c-.037-.222-.259-.333-.443-.333h-.629v1.404h.26v-.517h.22l.407.48h.296v-.037l-.444-.443zm-.147-.628c.11 0 .221.074.258.184 0 .111-.074.222-.184.259h-.444v-.443h.37z"
                        fill-rule="nonzero"></path>
                </g>
            </symbol>
            <symbol id="logo-face" viewBox="0 0 230 230">
                <title>icon-404</title>
                <path
                    d="M115 0C51.6 0 0 51.6 0 115s51.6 115 115 115 115-51.6 115-115S178.4 0 115 0zm0 209.5c-52.2 0-94.5-42.3-94.5-94.5S62.8 20.5 115 20.5c52.2.1 94.4 42.3 94.5 94.5 0 52.2-42.3 94.5-94.5 94.5z">
                </path>
                <circle cx="147.1" cy="69.1" r="14.1"></circle>
                <path
                    d="M83 151.6c15.4 0 21.9-9.2 21.9-23.9 0-6.5-5.2-12-5.2-19-.2-8.7 6.8-15.9 15.5-16h.6c9.8 0 15.9 8.3 15.9 16 0 7.4-5.2 12.3-5.2 19.1 0 14.7 6 23.8 21.8 23.8 12.8 0 19-6.9 24.7-15.7 1.9-2.9 5-5.2 8.4-5.2 5.1 0 8 3.7 8 7.7 0 9.6-16.5 31.8-41.4 31.8-8.6 0-23.3-1.8-32.2-15.7-8.2 12.6-20.7 15.7-32.1 15.7-26 0-41.6-23-41.6-31.8 0-4.2 3.4-7.7 7.6-7.7h.2c3.5.2 6.8 2.1 8.6 5.2 5.5 9 12.3 15.7 24.5 15.7z">
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
            <symbol id="logo-shelterAdmin" viewBox="0 0 1065.1 306.4">
                <circle cx="520.6" cy="68.9" r="18.8"></circle>
                <path
                    d="M1040.3 85.4c-17.4 0-31 12.2-38.7 24 .2-2.9.3-5.5.3-7.7 0-10.7-9-16.4-17.2-16.4-7 0-16.4 5.5-16.4 16.7 0 10 2.2 25.7 2.2 42 0 2.6 0 5.2-.2 7.7-15.6 15.8-34.5 28-59 28-18.6 0-27-7-30.6-17 43-.4 65-17.5 65-43.4 0-20-17.5-34-42.3-34-32.2 0-59 24.2-59 62.7-.2 8 1.2 15.9 4 23.4-3.4 4.4-8 7.5-15.4 7.5-12 0-16.4-9.7-16.4-61.4 0-25 2.2-52.3 2.2-76.2 0-8.3-6.2-17-16.8-17-8.3 0-16.6 7-16.6 16.6 0 13.5 1 28.3 1.6 51-6-3.5-14.6-6.5-28.4-6.5-42 0-64.7 33-64.7 61.6-.2 8.4 1.2 16.7 4.2 24.5-4.5 4-10.2 7.3-17.5 7.3-7 0-14.6-6-14.6-29 0-5 1-25.3 1-32.8 0-19.8-14.4-31.6-35.5-31.6-20 0-33.5 11.3-41.6 24.2 0-3 .3-5.7.3-8 0-10.6-9-16.3-17-16.3-7 0-16.5 5.5-16.5 16.7 0 10 2.2 25.7 2.2 42 0 2.7 0 5.3-.2 8-1.5 12.6-20.2 26.7-36.5 26.7-21 0-29-12-29-31.7 0-9 6.8-15.6 6.8-25.5 0-10.3-8-21.3-21-21.3-10 0-21.6 7.4-21.6 22.2 0 9.4 7 15.8 7 24.5 0 19.5-8.8 31.8-29.3 31.8-16 0-37.2-15.3-39.2-29.7v-.2c22.7-21.6 62.7-64.4 62.7-101.3 0-28-15.3-47.5-42.4-47.5-33.7 0-51 24.7-51 50.4 0 10.7 1.5 44.6 1.5 92.3v7c-8 12-19 28.7-35 28.7-8.2 0-13.6-5.8-16-15.3-2.6-10-2-23.5-2-37.7 0-5 0-10.3.2-15.5l25.5.4c4.5 0 13-3.2 13-12.4 0-7.3-5.2-12.5-13.3-12.5l-24.3.3c.6-12.6 1.2-24.6 1.2-35-.1-9.3-7.7-16.7-17-16.6s-16.7 7.7-16.6 17c0 3.2 1 18.6 1.5 34.4l-10-.2c-5.2 0-13 3.3-13 12.6 0 7.8 7 12.3 13 12.3 2.7 0 6 0 10.6-.2v2.4c0 5.7-1 18.8-1.6 30.7-17 19.7-38 36.6-67 36.6-18.6 0-27-7-30.6-17 43-.4 65-17.5 65-43.4 0-20-17.5-34-42.3-34-32 0-59 24.2-59 62.7 0 5.6.7 11.2 2 16.7-11.9 6.9-24.8 11.9-38.3 14.7 8.1-10.7 12.6-23.8 12.6-37.2 0-40-28-57-56.6-57-12.9-.1-25.5 4.1-35.8 12-2.2-8-9.7-12-16.6-12S0 91 0 102c0 10 2.2 37.6 2.2 74S0 237 0 251c0 10 5.2 17 14.3 17 8.3 0 19.3-6.7 19.3-16.5 0-3.6-1.5-26.4-2-55 13.8 6 29.5 7.3 50.4 7.3 34.5 0 62.8-12.7 77.6-20.7 10.4 13.4 28.4 20.6 53.5 20.6 31.3 0 55.7-18 70-31.6 3.4 21.3 18.2 32 43 32 18.6 0 31.7-11.7 40.2-22-.7 33-2 60.2-2 74.7 0 39.7 22.2 48.2 38.7 48.2 33 0 50.3-25.6 50.3-54.6 0-19-7.3-34.5-16.4-47 14.8-.3 30-3.5 42-20.7 11.8 18.6 31.5 21 43 21 14 0 25.3-6 35-15.2 1.2 9.2 9.7 15.6 18.9 14.4 7.9-1.1 13.9-7.5 14.5-15.4 0-3.2-1-16.8-1.8-29.4 0-17 18-47.2 34-47.2 8 0 13.3 7 13.3 16.8 0 7.6-1 22.5-1 32.3 0 23.2 6 43.7 38.8 43.7 15.7 0 28-7 36.5-14.5 10.7 10 25.4 14.6 40.4 14.6 21.7 0 35.6-10.4 44-19 4 9.7 13 18.8 32.6 18.8 14.6 0 25.7-6 33.4-14.8 10.8 9.7 27 14.8 48 14.8 25 0 45.5-11.5 60-23v6.5c.9 9.2 9.2 16 18.4 15 7.8-.8 14.1-6.9 15-14.7 0-3-1-17-1.7-29.5.2-20 20.8-44.6 31-44.6 6.6 0 5 9.2 17.7 9.2 8.9-.1 16-7.3 16-16.2 0-8-5.7-20.8-24.7-20.8l.1-.1zM397.8 51.7c0-14.4 8.5-25 17.5-25 10 0 14.2 10 14.2 20.8 0 26.3-19.3 51.4-33.3 67.6.6-24 1.6-58 1.6-63.4zm-339.5 127c-9.6 0-19.8-3.4-27-10.8l.5-20.7v-1c0-16 12-36.8 33.6-36.8 13.3 0 26.5 10.5 26.5 33 0 25.7-17.7 36-33.7 36l.1.3zm149.5-72c11.2 0 15 8.7 15 14.2 0 13-8.4 21.4-40 22 0-28.3 15.5-36.4 25-36.4v.2zm204 172.5c-9 0-13.8-8.5-13.8-22l-1.2-62.7c9.4 12 29 32.4 29 59.7 0 18.2-7.3 25-14 25zM787.6 143c0 16-12 36.8-33.6 36.8-13.4 0-26.6-10.5-26.6-33 0-25.6 17.6-37.2 33.6-37.2 12.2 0 20 4.6 26.5 11.4l.1 22zM903 106.6c8.1-.3 14.9 5.9 15.2 14v.4c0 12.6-8.5 21.3-40 21.8 0-28 15.5-36.2 25-36.2h-.2zm134.6 87.1c0 5.6-3.7 10.4-10.2 10.4s-10.2-4.6-10.2-10.3 3.7-10.4 10.2-10.4 10.2 4.7 10.2 10.3zm-18.3 0c0 4.6 3 8.4 8 8.4s8.2-3.6 8.2-8.3-3-8.5-8-8.5-8.2 3.7-8.2 8.4zm10 1.2c4-.8 3.6-6.8-1-6.8h-5v10.6h2V195h2l3 3.8h2v-.4l-3-3.5zm-1-5c.9 0 1.7.8 1.7 1.7 0 .9-.8 1.7-1.7 1.7h-3V190h3v-.1zM862 288.2V305h-17.5v-62h30c16.8 0 25 10.4 25 22.5 0 12.7-8.3 22.5-25 22.7H862zm0-14.8h12.6c5 0 7.4-3.5 7.4-7.6s-2.6-7.8-7.4-7.8H862v15.4zM964.7 305h-19.3L931 284.7h-6v20h-17.6v-62h30.3c16 0 24 10.3 24 21.4 0 7.6-2.6 14-13 18.7l16 20.8v1.4zm-40-48v14.8h13c4.6 0 6.6-3.5 6.6-7.2 0-4-2.2-7.7-6.8-7.7h-12.7l-.1.1zm78.3 49.4c-20.3 0-34.5-11.8-34.5-32.5 0-20.5 14.2-32.6 34.5-32.6s34.5 12 34.5 32.5c0 20.7-14 32.4-34.5 32.4v.2zm0-50c-10 0-17 7.3-17 17.5 0 10.3 7 17.4 17 17.4 10.3 0 17-7.3 17-17.5 0-10.7-6.7-17.6-17-17.6v.2z">
                </path>
            </symbol>
            <symbol id="logo-storybook" viewBox="0 0 1763.5 631">
                <style>
                    .st0 {
                        fill: #231f20
                    }

                    .st1 {
                        fill: #b57ee5
                    }

                    .st2 {
                        fill: #6dabf5
                    }

                    .st6 {
                        fill: #a2e05e
                    }
                </style>
                <circle class="st0" cx="862" cy="113.6" r="31.2"></circle>
                <path class="st0"
                    d="M1723.1 141c-28.9 0-51.3 20-64.3 40 .5-5.1.5-9.3.5-13-1.9-15.2-15.8-26.1-31-24.2h-.1c-13 1.4-22.8 11.6-24.2 24.7 0 16.8 3.7 42.3 3.7 69.3.1 4.3-.1 8.7-.5 13-25.6 26.1-57.2 46.5-97.7 46.5-30.7 0-44.7-11.6-50.7-28.4 71.2-.5 107.5-28.9 107.5-71.7 0-33-28.9-56.3-69.8-56.3-53.5 0-97.7 40.5-97.7 103.8-.4 13.2 1.8 26.3 6.5 38.6-5.8 8.3-15.5 13-25.6 12.6-20 0-27.5-15.8-27.5-101.5 0-41.4 3.7-86.6 3.7-126.1-.1-15.3-12.6-27.6-27.9-27.5-14.9.1-27.1 12.1-27.5 27 0 22.3 1.9 47 2.8 84.7-9.8-6-24.2-11.2-47-11.2-69.8 0-107 54.5-107 101.9-.5 13.5 2.3 27.5 7 40-7.9 7.4-18.1 11.7-28.9 12.1-11.6 0-24.2-10.2-24.2-47.9 0-8.4 1.4-41.9 1.4-54.5 0-32.6-23.7-52.1-58.6-52.1-33 0-55.4 18.6-68.9 40 .5-5.1.5-9.3.5-13-1.9-15.2-15.8-26.1-31-24.2h-.1c-13 1.4-22.8 11.6-24.2 24.7 0 16.8 3.7 42.3 3.7 69.3.1 4.3-.1 8.7-.5 13-2.4 21-33.6 44.3-60.6 44.3-34.9 0-48.4-20-48.4-52.6 0-14.9 11.6-25.6 11.6-42.3.5-19.5-14.9-35.8-34.4-36.3s-35.8 14.9-36.3 34.4v2.8c0 15.4 11.6 26.1 11.6 40.5 0 32.6-14.4 53.1-48.4 53.1-26.2 0-61.1-24.6-65-48.5 37.7-35.8 103.7-106.5 103.7-167.3C759.1 32.1 734 0 688.8 0c-55.8 0-84.7 41-84.7 83.3 0 17.7 2.3 74 2.3 152.7v11.6c-13 20-31.7 47.5-57.7 47.5-14 0-22.8-9.8-26.5-25.1-4.2-16.8-3.2-39.1-3.2-62.8 0-8.4 0-17.2.5-25.6 17.6.5 32.5.5 42.3.5 11.6.5 20.9-8.8 21.4-20.5 0-12.1-8.4-20.9-21.9-20.9-12.1 0-26.5.5-40 .5.9-20.9 1.9-41 1.9-57.7C524.6 68 513.3 54.4 498 53c-15-1.4-28.4 9.4-30.2 24.3v6.5c0 5.1 1.4 30.7 2.3 56.8-5.6 0-10.7-.5-16.3-.5-11.3-.4-20.8 8.3-21.4 19.5v1.3c.4 11.5 9.9 20.6 21.4 20.5 4.7 0 9.8-.5 17.7-.5v4.6c0 9.3-1.4 31.2-2.8 50.7-28.4 32.6-63.3 61-111.2 61-30.7 0-44.7-11.6-50.3-28.4 71.2-.5 107.5-28.9 107.5-71.7 0-33-28.9-56.3-70.3-56.3-53.5 0-97.7 40.5-97.7 103.8-.1 9.4 1 18.8 3.3 27.9-19.7 11.3-41.1 19.5-63.3 24.2 13.5-17.7 20.8-39.2 20.9-61.4 0-66.6-46.1-94-93.5-94-21.4 0-42.4 6.5-59.1 19.5-3.6-12-14.9-20.1-27.5-19.5C12.1 141 0 153.1 0 168.5c0 16.8 3.7 62.4 3.7 122.9C3.7 351.9 0 391.9 0 415.2c0 16.3 8.8 27.5 23.7 27.5 14 0 32.1-11.2 32.1-27.5 0-6-2.3-43.8-3.7-91.2 22.8 10.2 48.9 12 83.8 12 57.2 0 103.8-20.9 128.5-34.4 17.2 22.3 47 34.4 88.4 34.4 51.7 0 92.2-29.8 115.9-52.1 5.6 35.4 30.2 52.6 71.2 52.6 30.7 0 52.6-19.1 66.6-36.3-.9 54.9-3.3 99.6-3.3 123.8 0 65.6 36.8 80 63.8 80 54.5 0 83.3-42.3 83.3-90.3-.3-28.2-9.8-55.4-27-77.7 24.7-.5 49.8-6 69.3-34.4 19.6 30.8 52.2 34.5 71.2 34.5 23.3 0 41.9-9.8 57.7-25.1 2 15.3 15.9 26 31.2 24.1 13.3-1.7 23.4-12.6 24.2-25.9 0-5.1-1.9-27.5-2.8-48.4 0-28.4 29.8-78.2 56.3-78.2 13.5 0 21.9 11.6 21.9 27.9 0 12.6-1.4 37.2-1.4 53.5 0 38.6 9.8 72.6 64.2 72.6 22.4-.4 44-9 60.5-24.2 18.5 16.2 42.4 24.8 67 24.2 27.7.1 54.2-11.4 73.1-31.7 6.5 15.8 21.4 31.2 54 31.2 21.2.6 41.6-8.5 55.4-24.7 17.7 15.8 44.7 24.7 79.6 24.7 41.4 0 75.4-19.1 99.6-38.2 0 3.7-.5 7.5-.5 10.7 1.9 15.4 15.4 26.5 30.7 24.7 12.9-1.3 23.1-11.4 24.7-24.2 0-5.1-1.9-27.9-2.8-48.9.5-33.5 34.4-74 51.2-74 11.2 0 8.8 15.4 29.3 15.4 14.9 0 26.5-12.1 26.5-27 .2-12.7-9.1-33.6-40.3-33.6zM659 85.2c0-23.7 14-41.4 28.9-41.4 16.8 0 23.7 16.8 23.7 34.4 0 43.8-31.7 85.2-54.9 112.2.5-40.1 2.4-96.9 2.3-105.2zM96.8 295.1c-16.7.4-32.8-6-44.7-17.7 0-12.1.5-23.3.5-34V242c0-26.5 19.6-61 55.9-61 21.9 0 43.8 17.2 43.8 54.9-.1 42-29.4 59.2-55.5 59.2zM344 176c13-1 24.2 9.3 25.1 22.3v1.4c0 21.9-14 35.8-66.1 36.3 0-46.6 25.6-60 41-60zm338.3 285.7c-14.9 0-22.8-14-22.8-36.3 0-2.3-.9-54-1.9-103.8 15.4 19.5 47.9 53.5 47.9 98.7-.4 30.2-12.5 41.4-23.2 41.4zm621.8-225.3c0 26.5-20 61-55.8 61-21.9 0-43.8-17.2-43.8-54.9 0-42.4 29.3-61.4 55.8-61.4 16.7-.4 32.7 6.5 43.8 19.1v36.2zm191.8-60.4c13.3-.6 24.5 9.7 25.1 22.9v.8c0 20.9-14 35.4-66.1 36.3-.5-46.6 25.1-60 41-60zM1718.3 320.2c-.2-8.9-7.4-16.1-16.3-16.3-9.3-.2-16.9 7.1-17.2 16.3v1.9c.4 8.9 7.9 15.7 16.8 15.4h1.4c9-.7 15.8-8.3 15.3-17.3zm-3.2 0v1.9c-.4 7-6.5 12.4-13.5 12.1h-1.6c-7.2-.6-12.5-6.8-11.9-14 0-.7.1-1.3.5-1.9.4-7 6.5-12.4 13.5-12.1h1c7.2.6 12.6 6.9 12 14z">
                </path>
                <path class="st0"
                    d="M1705 322.5c2.9-1 4.6-3.9 4.1-7-.5-2.8-3.3-4.2-5.6-4.2h-7.9V329h3.3v-6.5h2.8l5.1 6h3.7v-.5l-5.5-5.5zm-6.6-2.3v-5.6h4.6c1.5-.3 3 .8 3.3 2.3.3 1.5-.8 3-2.3 3.3h-5.6z">
                </path>
                <g>
                    <path class="st1" d="M791.4 614l-11.8-241.4h-8.8l8.8 241.4h11.8z"></path>
                </g>
                <path class="st2"
                    d="M1334.2 453.3H1302v17.9c0 23.1-.2 41.6-.2 41.6 0 11.4-4.8 14.5-10.8 14.5-6.3 0-9.5-2.8-9.5-14.9 0-17.7 1.3-52.7 1.3-52.7l-32.2-.9c0-.4-1.1 26.8-1.1 59s20.3 34.5 29.6 34.5c8.8 0 18.6-3.5 23.7-9.1 0 18.3-5.8 24.4-18.8 24.4-8.2 0-18.1-4.1-23.5-8.6v29.5c8.9 5.2 19.1 7.9 29.4 7.8 21.6 0 42.8-12.5 43.2-48.6.7-40.1.9-80.2 1.1-94.4zM1496.7 453.1c-32.8 0-46.9 26.3-46.9 57.7 0 26.6 13 46.4 43.8 46.4 34.6 0 46.9-25.9 46.9-55.9 0-27.9-12.1-48.2-43.8-48.2zm-3 77.1c-8.2 0-11.4-9.5-11.4-19.4 0-16 5.6-28.3 14.5-28.3 9.1 0 11.4 11.8 11.4 22.9-.1 13.9-4.8 24.8-14.5 24.8z">
                </path>
                <path
                    d="M1013.8 557.4c10.9 0 21.8-.6 32.6-2 0-28.3 0-54.8.2-74.9 8.6-.9 15.8-2 15.8-2 .2-8.6 0-17.3-.7-25.9l-14.7.9c.4-20.5.9-31.1.9-31.1l-34.6 2.1s0 12.7.2 32.2c-6.2.7-12.3 1.9-18.3 3.5.4 11.4 4.5 23.8 4.5 23.8l14-.6.1 74z"
                    fill="#f3ad38"></path>
                <path
                    d="M1208.8 466.5c0-3.2.2-6.7.4-10.1l-30-1.1s-2.8 44-2.6 101.9c14.5 1.1 31.3 1.1 31.3 1.1-.2 0 0-19.2.9-48.1.4-16.8 6.5-22 15.6-22 4.1.2 8.2 1 12.1 2.4l3.5-30.1c-14-4.7-26.9-.6-31 6.1l-.2-.1z"
                    fill="#b57ee6"></path>
                <path
                    d="M1405.8 452.4c-7.5.1-14.6 3.5-19.4 9.2 1.9-32.2 3.5-52.7 3.5-52.7l-32.6-2.4c-1.9 22.5-5 96.7-4.5 150.9 9.9.4 19.7.1 29.6-.8 0-4.8.4-9.1.4-10.8 4.5 6.4 11.8 10.2 19.7 10.2 24.8 0 35.6-24.4 36.3-53.3.3-27.4-10.1-50.3-33-50.3zm0 51.2c-.2 11.7-2.6 24.8-11.7 24.8-6.3 0-9.2-4.5-9.9-14.7-.4-5.8-1.5-31.7 11-31.7 8.9 0 11 10.8 10.6 21.6z"
                    fill="#f16161"></path>
                <path class="st1"
                    d="M1755.6 460.2l-33.9-4.5s-11.7 17.5-28.1 37.6c2.6-46 5.8-76.9 5.8-76.9l-35.2-3.2s-3.9 79.9-4.8 143.4c14.7 1.7 31.7 1.7 31.7 1.7l1.1-38c16 18.1 33.9 36.9 33.9 36.9l37.3-6c-21.6-21.6-36.3-36.7-43.4-46.2 8.4-11.1 23.1-28.6 35.6-44.8z">
                </path>
                <path class="st6"
                    d="M1117.4 453.1c-32.8 0-46.9 26.3-46.9 57.6 0 26.6 13 46.4 43.8 46.4 34.5 0 46.8-25.9 46.8-55.9.1-27.8-12-48.1-43.7-48.1zm-3.1 77c-8.2 0-11.4-9.5-11.4-19.4 0-16 5.6-28.3 14.5-28.3 9.1 0 11.4 11.9 11.4 22.9 0 14-4.8 24.8-14.5 24.8zM1599.4 453.1c-32.8 0-46.9 26.3-46.9 57.6 0 26.6 13 46.4 43.8 46.4 34.6 0 46.9-25.9 46.9-55.9 0-27.8-12.1-48.1-43.8-48.1zm11.4 52.2c0 14-4.8 24.8-14.5 24.8-8.2 0-11.4-9.5-11.4-19.4 0-16 5.6-28.3 14.5-28.3 9.1 0 11.4 11.9 11.4 22.9z">
                </path>
                <path
                    d="M953.4 360.5v33.6l-11.6-10.5-14 10.5 2.4-32-145.7 10.4L796.3 614l180.6 8.8v-264l-23.5 1.7zm-68.8 212.8c-30.4 0-57-10.4-53.9-55.8h39.8c-.5 18.4 3.5 25 13.7 25 7.8 0 11.3-4.5 11.3-12 0-26.8-63.6-27.8-63.6-77 0-28.3 18.6-47.1 51.8-47.1s52.3 18.1 51.3 54.9l-37.9.9c.7-19.8-7.8-21.6-12.5-21.6-4.5 0-12 1.4-12 12 0 26.1 64.5 24.7 64.5 77.5 0 29.6-23.1 43.2-52.5 43.2z"
                    fill="#f1618c"></path>
            </symbol>
            <symbol id="logo-storybookLight" viewBox="0 0 1763.53 631.01">
                <circle class="cls-1" cx="861.99" cy="113.57" r="31.18"></circle>
                <path class="cls-1"
                    d="M1723.09 141h-.09c-28.86 0-51.2 20-64.23 40 .47-5.12.47-9.31.47-13a27.84 27.84 0 0 0-31-24.22h-.14c-13 1.4-22.81 11.64-24.2 24.67 0 16.76 3.72 42.35 3.72 69.35a117.5 117.5 0 0 1-.47 13c-25.6 26.06-57.25 46.54-97.74 46.54-30.72 0-44.68-11.64-50.73-28.39 71.21-.47 107.52-28.86 107.52-71.68 0-33-28.86-56.32-69.82-56.32-53.53 0-97.74 40.49-97.74 103.79a100.86 100.86 0 0 0 6.52 38.63 29.55 29.55 0 0 1-25.6 12.57c-20 0-27.46-15.82-27.46-101.46 0-41.42 3.72-86.57 3.72-126.13a27.7 27.7 0 0 0-55.39-.47c0 22.34 1.86 47 2.79 84.71-9.77-6.05-24.2-11.17-47-11.17-69.82 0-107 54.46-107 101.93-.47 13.5 2.33 27.46 7 40a44.79 44.79 0 0 1-28.86 12.1c-11.64 0-24.2-10.24-24.2-47.94 0-8.38 1.4-41.89 1.4-54.46 0-32.58-23.74-52.13-58.64-52.13-33 0-55.39 18.62-68.88 40 .47-5.12.47-9.31.47-13a27.84 27.84 0 0 0-31-24.22h-.14c-13 1.4-22.81 11.64-24.2 24.67 0 16.76 3.72 42.35 3.72 69.35a117.5 117.5 0 0 1-.47 13C923 271.7 891.78 295 864.78 295c-34.91 0-48.41-20-48.41-52.59 0-14.89 11.64-25.6 11.64-42.35a35.38 35.38 0 1 0-70.74-1.88V201c0 15.36 11.64 26.06 11.64 40.49 0 32.58-14.43 53.06-48.41 53.06-26.24 0-61.1-24.58-65-48.54 37.68-35.8 103.65-106.45 103.65-167.35C759.13 32.12 734 0 688.84 0c-55.84 0-84.7 41-84.7 83.31 0 17.69 2.33 74 2.33 152.66v11.64c-13 20-31.65 47.47-57.71 47.47-14 0-22.81-9.77-26.53-25.13C518 253.2 519 230.86 519 207.12c0-8.38 0-17.22.47-25.6 17.64.48 32.53.48 42.31.48 11.64.47 20.94-8.84 21.41-20.48 0-12.1-8.38-20.94-21.88-20.94-12.1 0-26.53.47-40 .47.93-20.94 1.86-41 1.86-57.71a27.86 27.86 0 0 0-55.39-6v6.52c0 5.12 1.4 30.72 2.33 56.78-5.59 0-10.71-.47-16.29-.47a20.68 20.68 0 0 0-21.41 19.55V161a21.16 21.16 0 0 0 21.41 20.48c4.65 0 9.77-.47 17.69-.47v4.65c0 9.31-1.4 31.18-2.79 50.73-28.39 32.58-63.3 61-111.24 61-30.72 0-44.68-11.64-50.27-28.39 71.21-.47 107.52-28.86 107.52-71.68 0-33-28.86-56.32-70.28-56.32-53.53 0-97.74 40.49-97.74 103.79a114.28 114.28 0 0 0 3.29 27.93 217.23 217.23 0 0 1-63.3 24.2 102.09 102.09 0 0 0 20.94-61.44c0-66.56-46.08-94-93.55-94C92.65 141.48 71.71 148 55 161a27.54 27.54 0 0 0-27.46-19.55C12.1 141 0 153.13 0 168.49c0 16.76 3.72 62.37 3.72 122.87S0 391.9 0 415.17c0 16.29 8.84 27.46 23.74 27.46 14 0 32.12-11.17 32.12-27.46 0-6.05-2.33-43.75-3.72-91.23C74.94 334.18 101 336 135.91 336c57.25 0 103.79-20.94 128.46-34.44 17.22 22.34 47 34.44 88.43 34.44 51.66 0 92.16-29.79 115.89-52.13 5.59 35.37 30.25 52.59 71.21 52.59 30.72 0 52.59-19.08 66.56-36.3-.93 54.92-3.26 99.6-3.26 123.81 0 65.63 36.77 80 63.76 80 54.46 0 83.31-42.35 83.31-90.29a130 130 0 0 0-27-77.73c24.67-.47 49.8-6.05 69.35-34.44 19.56 30.81 52.15 34.49 71.23 34.49 23.27 0 41.89-9.77 57.71-25.13A27.86 27.86 0 0 0 977 309c0-5.12-1.86-27.46-2.79-48.41 0-28.39 29.79-78.19 56.32-78.19 13.5 0 21.88 11.64 21.88 27.93 0 12.57-1.4 37.23-1.4 53.53 0 38.63 9.77 72.61 64.23 72.61a92 92 0 0 0 60.51-24.2 98.32 98.32 0 0 0 67 24.2 99.68 99.68 0 0 0 73.07-31.65c6.52 15.82 21.41 31.18 54 31.18a70.24 70.24 0 0 0 55.39-24.67c17.69 15.82 44.68 24.67 79.59 24.67 41.42 0 75.4-19.08 99.6-38.17 0 3.72-.47 7.45-.47 10.71 1.86 15.36 15.36 26.53 30.72 24.67a27.71 27.71 0 0 0 24.67-24.2c0-5.12-1.86-27.93-2.79-48.87.47-33.51 34.44-74 51.2-74 11.17 0 8.84 15.36 29.32 15.36 14.89 0 26.53-12.1 26.53-27 0-12.57-9.31-33.5-40.49-33.5zM96.81 295.09a61.83 61.83 0 0 1-44.68-17.69c0-12.1.47-23.27.47-34V242c0-26.53 19.55-61 55.85-61 21.88 0 43.75 17.22 43.75 54.92 0 41.94-29.33 59.17-55.39 59.17zM344 176c13-.93 24.2 9.31 25.13 22.34v1.4c0 21.88-14 35.84-66.09 36.3C303 189.43 328.64 176 344 176zm315-90.85c0-23.74 14-41.42 28.86-41.42 16.76 0 23.74 16.76 23.74 34.44 0 43.75-31.65 85.17-54.92 112.17.51-40 2.38-96.79 2.38-105.17zm23.33 376.56c-14.89 0-22.81-14-22.81-36.3 0-2.33-.93-54-1.86-103.79 15.36 19.55 47.94 53.53 47.94 98.67-.47 30.25-12.6 41.42-23.27 41.42zm621.82-225.27c0 26.53-20 61-55.85 61-21.88 0-43.75-17.22-43.75-54.92 0-42.35 29.32-61.44 55.85-61.44a56.25 56.25 0 0 1 43.75 19.08zM1495.9 176a24.06 24.06 0 0 1 25.08 23v.75c0 20.94-14 35.37-66.09 36.3-.46-46.61 25.11-60.05 41.01-60.05zM1718.35 320.22a16.76 16.76 0 0 0-33.51 0v1.86a16.11 16.11 0 0 0 16.76 15.36h1.4a16.52 16.52 0 0 0 15.39-17.23zm-3.21 0v1.86a12.93 12.93 0 0 1-13.5 12.1h-1.58a13 13 0 0 1-11.92-14 3.46 3.46 0 0 1 .47-1.86 12.93 12.93 0 0 1 13.5-12.1h1a13.07 13.07 0 0 1 12.03 14.03z">
                </path>
                <path class="cls-1"
                    d="M1705 322.5a6.26 6.26 0 0 0 4.11-7c-.47-2.79-3.26-4.19-5.59-4.19h-7.91V329h3.26v-6.52h2.79l5.12 6h3.72V328zm-6.6-2.28v-5.59h4.6a2.83 2.83 0 0 1 .93 5.59z">
                </path>
                <g>
                    <path data-name="path0 fill" class="cls-2" d="M791.41 614.05l-11.78-241.44h-8.82l8.83 241.44z">
                    </path>
                </g>
                <path data-name="path1 fill" d="M796.31 614.05l-11.78-241.44 192.38-13.75v264z" fill="#f1618c"></path>
                <g data-name="Vector 2">
                    <path data-name="path2 fill" class="cls-1" d="M927.83 394.2l2.45-32.87 23.13-2v34.84l-11.56-10.49z">
                    </path>
                </g>
                <path class="cls-4"
                    d="M1334.22 453.28h-32.17v17.89c0 23.12-.22 41.62-.22 41.62 0 11.44-4.76 14.47-10.8 14.47-6.27 0-9.5-2.81-9.5-14.9 0-17.71 1.29-52.69 1.29-52.69l-32.16-.86c0-.43-1.09 26.77-1.09 59s20.3 34.54 29.59 34.54c8.85 0 18.56-3.47 23.74-9.06 0 18.35-5.78 24.39-18.79 24.39-8.19 0-18.12-4.1-23.52-8.63v29.55a56.89 56.89 0 0 0 29.36 7.76c21.59 0 42.78-12.52 43.18-48.56.65-40.15.87-80.31 1.09-94.57zM1496.7 453.06c-32.82 0-46.86 26.34-46.86 57.66 0 26.59 13 46.43 43.84 46.43 34.55 0 46.86-25.91 46.86-55.92 0-27.86-12.09-48.17-43.84-48.17zm-3 77.11c-8.2 0-11.44-9.5-11.44-19.43 0-16 5.61-28.29 14.46-28.29 9.07 0 11.45 11.84 11.45 22.89-.02 14-4.77 24.83-14.49 24.83z">
                </path>
                <path data-name="path4 fill"
                    d="M1013.85 557.37a250.18 250.18 0 0 0 32.6-2c0-28.29 0-54.84.22-74.92 8.64-.87 15.76-1.95 15.76-1.95a246.3 246.3 0 0 0-.65-25.92l-14.68.87c.43-20.51.87-31.09.87-31.09l-34.56 2.15s0 12.72.22 32.18a141 141 0 0 0-18.35 3.47c.43 11.44 4.53 23.75 4.53 23.75l14-.64z"
                    fill="#f3ad38"></path>
                <path data-name="path5 fill"
                    d="M1208.82 466.46c0-3.24.22-6.69.42-10.15l-30-1.08s-2.81 44-2.59 101.93c14.46 1.08 31.3 1.08 31.3 1.08-.22 0 0-19.22.87-48.15.43-16.84 6.47-22 15.55-22a43 43 0 0 1 12.08 2.38l3.47-30.06c-14-4.71-27-.6-31 6.09z"
                    fill="#b57ee6"></path>
                <path data-name="path6 fill"
                    d="M1382.29 556.72c0-4.75.44-9.08.44-10.8a23.93 23.93 0 0 0 19.66 10.15c24.83 0 35.63-24.41 36.27-53.33.43-27.42-9.93-50.32-32.82-50.32a25.89 25.89 0 0 0-19.43 9.25c1.94-32.17 3.47-52.68 3.47-52.68l-32.61-2.38c-1.94 22.46-5 96.74-4.54 150.94a231.51 231.51 0 0 0 29.56-.82zm1.94-43c-.42-5.79-1.5-31.74 11-31.74 8.86 0 11 10.79 10.58 21.58-.22 11.67-2.59 24.84-11.66 24.84-6.26 0-9.25-4.53-9.94-14.68z"
                    fill="#f16161"></path>
                <path data-name="path7 fill" class="cls-2"
                    d="M1755.64 460.19l-33.9-4.53s-11.67 17.49-28.07 37.58c2.59-46 5.78-76.87 5.78-76.87l-35.19-3.24s-3.89 79.89-4.75 143.36c14.68 1.73 31.73 1.73 31.73 1.73l1.09-38c16 18.14 33.9 36.92 33.9 36.92l37.35-6c-21.6-21.6-36.28-36.71-43.4-46.25 8.25-11 22.94-28.45 35.46-44.65z">
                </path>
                <path class="cls-8"
                    d="M1117.36 453.06c-32.83 0-46.86 26.34-46.86 57.65 0 26.6 13 46.42 43.83 46.42 34.54 0 46.85-25.91 46.85-55.91 0-27.85-12.07-48.16-43.82-48.16zm-3 77.08c-8.21 0-11.45-9.5-11.45-19.42 0-16 5.62-28.29 14.48-28.29 9.05 0 11.43 11.87 11.43 22.88-.03 14-4.82 24.83-14.49 24.83zM1599.4 453.06c-32.82 0-46.86 26.34-46.86 57.65 0 26.6 13 46.42 43.83 46.42 34.55 0 46.86-25.91 46.86-55.91 0-27.85-12.09-48.16-43.83-48.16zm11.45 52.28c0 14-4.76 24.82-14.48 24.82-8.21 0-11.45-9.5-11.45-19.42 0-16 5.62-28.29 14.48-28.29 9.06 0 11.45 11.88 11.45 22.89z">
                </path>
                <path data-name="path9 fill" class="cls-1"
                    d="M897.08 462.19l37.92-.93c1-36.76-18.14-54.9-51.35-54.9s-51.82 18.85-51.82 47.12c0 49.24 63.59 50.17 63.59 77 0 7.54-3.47 12-11.31 12-10.13 0-14.13-6.59-13.67-25h-39.81c-3.07 45.47 23.56 55.83 53.94 55.83 29.45 0 52.54-13.66 52.54-43.33 0-52.78-64.55-51.36-64.55-77.46 0-10.62 7.54-12 12-12 4.71 0 13.19 1.85 12.51 21.63z">
                </path>
            </symbol>
            <symbol id="icon-barnyard" viewBox="0 0 101.8 87.7">
                <path
                    d="M93.6 35.3c-.7-.4-1.7-.2-2.2.5-.4.7-.2 1.7.5 2.2 1.2.8 1.6 2.4.8 3.6-.5.8-1.3 1.2-2.2 1.2-1.4-.1-2.5-1.4-2.5-2.9 0-15.1-11.6-25.2-28.9-25.2H32.6c-6.6-5.1-16-4.4-21.8 1.5-.6.6-.6 1.6 0 2.2l6.2 6.2c-1.9 2.2-3.4 4.7-4.6 7.4-.4 1-1.6 2.7-3 2.7H7.3c-2.2 0-3.9 1.8-3.9 3.9v8.7c0 2.2 1.8 4 3.9 4 1.5 0 3.2 1.7 5.4 3.7 3.5 3.5 8.3 8.1 16.9 10.1v4.2c0 4 3.2 7.2 7.2 7.2h.5c4 0 7.2-3.2 7.2-7.2v-1.8c3.1.5 6.2.7 9.3.8 3 0 6-.2 9-.8v1.8c0 4 3.2 7.2 7.2 7.2h.5c4 0 7.3-3.2 7.3-7.2v-6.9l1-.5c2.7-1.3 5.3-2.9 7.7-4.6.7-.5.8-1.5.3-2.2s-1.5-.8-2.2-.3c-2.3 1.6-4.7 3.1-7.3 4.3l-1.8.9c-.5.3-.8.8-.8 1.4v7.9c0 2.3-1.8 4.1-4.1 4.1h-.5c-2.3 0-4.1-1.8-4.1-4.1v-3.7c0-.9-.7-1.6-1.6-1.6h-.3c-3.4.7-6.8 1-10.3 1s-7.1-.4-10.5-1c-.8-.2-1.7.3-1.9 1.1V69.2c0 2.3-1.8 4.1-4.1 4.1h-.5c-2.3 0-4.1-1.8-4.1-4.1v-5.5c0-.7-.5-1.4-1.3-1.5-8.5-1.6-12.9-6-16.5-9.5-2.5-2.5-4.7-4.6-7.5-4.6-.5 0-.8-.4-.8-.8v-8.7c0-.5.4-.8.8-.8h2.1c3.3 0 5.3-2.9 5.9-4.6 1.2-2.8 2.9-5.4 5-7.5.6-.6.6-1.6 0-2.2l-6.2-6.1c5-4 12-3.9 16.9.1l5.1 5.1c.6.6 1.6.6 2.2-.1.6-.6.6-1.5 0-2.1l-2.5-2.5h23.2c12.8 0 25.8 6.8 25.8 22.1 0 3.2 2.5 5.9 5.7 6 3.2 0 5.7-2.6 5.7-5.8 0-2.1-1-3.9-2.7-4.9z">
                </path>
                <circle cx="23.9" cy="34.3" r="2.3"></circle>
            </symbol>
            <symbol id="icon-bird" viewBox="0 0 101.8 87.7">
                <circle cx="37.3" cy="34.1" r="2.3"></circle>
                <path
                    d="M83.7 46.4c-.6-.6-1.6-.6-2.2 0L69.2 58.7c-8.9 9-23.5 9-32.4 0-4.3-4.3-6.8-10.1-6.8-16.2v-9.7c0-5.8 4.7-10.4 10.4-10.4s10.4 4.7 10.4 10.4V37.7c-4.1 4.4-3.8 11.3.6 15.4 4.3 4 11 3.8 15.1-.3l4.5-4.5c7.8-7.9 7.8-20.7-.1-28.5-.6-.6-1.6-.6-2.2 0L54 34.5v-1.8c.1-7.5-5.9-13.6-13.4-13.7S27 24.9 26.9 32.4H17c-.9 0-1.6.7-1.6 1.6 0 .9.7 1.6 1.6 1.6h9.8v6.9c-.1 14.4 11.5 26 25.9 26.1 7 0 13.7-2.7 18.6-7.7l12.3-12.3c.7-.7.7-1.6.1-2.2zM69.9 23c2.6 3.1 4 6.9 4 10.9 0 4.5-1.8 8.9-5 12.1l-4.5 4.5c-3.1 3-8 2.9-11-.2-2.9-3-2.9-7.8 0-10.8L69.9 23z">
                </path>
            </symbol>
            <symbol id="icon-fish" viewBox="0 0 101.8 87.7">
                <path
                    d="M87.9 31.9c-1.3-.5-2.8-.3-3.9.7l-7.4 5c-2.1 1.2-4.7 1.2-6.9 0L50.2 24.7c-1.6-1.4-2.5-3.3-2.7-5.4v-2.9c.1-1.5-.6-2.9-1.8-3.6-1.4-.6-2.9-.3-4 .7l-26.1 20C12.2 36 10 39.9 9.9 44.2c.1 4.3 2.2 8.3 5.7 10.7l26.1 20c.7.5 1.7.4 2.2-.3.5-.7.4-1.7-.3-2.2l-26.1-20c-2.7-1.9-4.4-4.9-4.5-8.2.1-3.3 1.8-6.4 4.5-8.2l11.8-9c6.6 11 7.4 19.6 2.4 27.8-.5.7-.3 1.7.5 2.2.7.5 1.7.3 2.2-.5 0 0 0-.1.1-.1 5.7-9.4 4.9-19-2.5-31.1 0-.1-.1-.1-.1-.2l11.8-9c.2-.2.4-.3.7-.4.1.2.1.5.1.8v2.9c.1 3.1 1.6 5.9 3.9 7.9l.1.1 19.6 12.9c3.1 1.8 7 1.8 10.1.1l.1-.1 7.6-5.1c.2-.2.4-.3.7-.4.1.2.1.5.1.8v17.9c0 .3 0 .5-.1.8-.3-.1-.5-.2-.7-.4l-7.2-5.2c-3.2-2.1-7.4-2.2-10.7-.1L48.5 61.1c-.7.5-.9 1.4-.5 2.2s1.4.9 2.2.5L69.6 51c2.2-1.4 5-1.4 7.2 0l7.2 5.2c1.3 1.4 3.4 1.4 4.8.1.8-.8 1.2-1.9 1-3V35.5c.1-1.5-.6-2.9-1.9-3.6z">
                </path>
                <circle cx="25" cy="40.1" r="2.3"></circle>
            </symbol>
            <symbol id="icon-horse" viewBox="0 0 101.8 87.7">
                <circle cx="18.3" cy="13.8" r="1.8"></circle>
                <path
                    d="M92.7 35.4h-2c-3-4.3-7.8-6.9-13-7H48.3c-1.3-.2-2.5-.9-3.2-2.1l-7.9-13.8c-3.7-6.5-10-9.9-17-9L16.7.3c-.6-.6-1.6-.5-2.2.1-.3.3-.4.7-.4 1v5.9l-12.8 13c-1.7 1.7-1.7 4.5 0 6.2l2.5 2.4c1.7 1.5 4 1.5 6.2.1l4.6-3.5c2.1.8 4.4 1.1 6.7.8v20.5c.1 3 1.1 5.8 3 8.1 1.1 1.4 2.6 2.5 4.2 3.2V81c0 3.7 3 6.7 6.7 6.7s6.7-3 6.7-6.7V66.5c0-2 1.6-3.6 3.6-3.6h29.2c2 0 3.6 1.6 3.6 3.6V81c-.1 3.7 2.7 6.8 6.4 6.9 3.7.1 6.8-2.7 6.9-6.4V44.6c0-.9-.7-1.6-1.6-1.6-.9 0-1.6.7-1.6 1.6V81c.1 2-1.4 3.6-3.4 3.8-2 .1-3.6-1.4-3.8-3.4V66.5c0-3.7-3-6.8-6.8-6.8H45.5c-3.7 0-6.8 3-6.8 6.8V81c0 2-1.6 3.6-3.6 3.6S31.5 83 31.5 81V57.1c0-.7-.4-1.3-1.1-1.5-1.5-.5-2.8-1.4-3.8-2.7-1.4-1.7-2.2-3.9-2.3-6.2V25.6c.9-.3 1.7-.7 2.5-1.1l3.3-2c.8-.4 1.1-1.3.7-2.1s-1.3-1.1-2.1-.7c-.1 0-.1.1-.2.1l-3.3 2c-3.1 1.8-6.9 2-10.2.6-.5-.3-1.1-.2-1.6.1l-.1.1L8 26.5c-.6.6-1.6.6-2.3.1l-2.4-2.3c-.3-.5-.3-1.3.2-1.8L16.8 9.2c.3-.3.5-.7.5-1.1v-3l1.4 1.3c.3.3.8.4 1.3.3 8.5-1.4 13 4.7 14.5 7.4l7.9 13.8c1.3 2.1 3.5 3.5 5.9 3.6h29.3c4.4.1 8.5 2.5 10.8 6.3.3.5.8.7 1.3.8h2.9c2.1 0 3.8 1.7 3.8 3.8v22.8c0 .9.7 1.6 1.6 1.6.9 0 1.6-.7 1.6-1.6V42.4c.1-3.8-3-7-6.9-7z">
                </path>
            </symbol>
            <symbol id="icon-humanChild" viewBox="0 0 256.43 194.55">
                <path
                    d="M225.95 69.9c-1.88 0-3.74.19-5.57.53-4.97-16.4-14.26-31.39-27.1-43.17-8.53-7.82-23.25-18.1-38.97-23.51-18.72-6.43-34.45-4.58-45.49 5.37-9.72 8.76-12.93 22.42-8.17 34.8 4.5 11.71 15.06 18.99 27.57 18.99 10.19 0 19.67-5.06 25.34-13.54 1.54-2.29.92-5.4-1.37-6.94-2.3-1.54-5.4-.92-6.94 1.37-3.82 5.7-10.18 9.1-17.03 9.1-8.4 0-15.21-4.7-18.24-12.57-3.26-8.49-1.09-17.82 5.53-23.79 19.55-17.61 56.28 4.57 71.01 18.08 17.79 16.31 27.99 39.5 27.99 63.62 0 47.58-38.71 86.3-86.3 86.3s-86.3-38.71-86.3-86.3c0-32.57 18.03-62.03 47.05-76.88 2.46-1.26 3.43-4.27 2.17-6.73-1.26-2.46-4.27-3.43-6.73-2.17C60.59 24.66 43.42 45.68 36 70.42c-1.81-.33-3.66-.51-5.52-.51C13.67 69.9 0 83.57 0 100.38s13.67 30.48 30.48 30.48c2.32 0 4.61-.28 6.84-.8 13.17 37.52 48.94 64.49 90.89 64.49 41.96 0 77.73-26.98 90.89-64.49 2.24.51 4.52.8 6.84.8 16.81 0 30.48-13.67 30.48-30.48S242.76 69.9 225.95 69.9zM30.48 120.86c-11.29 0-20.48-9.19-20.48-20.48 0-11.29 9.19-20.48 20.48-20.48 1.06 0 2.11.09 3.15.25-1.12 5.9-1.71 11.95-1.71 18.11 0 7.64.9 15.06 2.59 22.19-1.33.26-2.67.41-4.03.41zm195.47 0c-1.36 0-2.71-.15-4.02-.41 1.69-7.13 2.59-14.56 2.59-22.19 0-6.11-.59-12.17-1.73-18.1 1.04-.16 2.1-.25 3.17-.25 11.29 0 20.48 9.19 20.48 20.48-.01 11.28-9.2 20.47-20.49 20.47z"
                    fill="#6406b5"></path>
                <path
                    d="M128.38 167.66c-19.22 0-37.17-9.5-48.01-25.4-1.56-2.28-.97-5.39 1.31-6.95 2.28-1.55 5.39-.97 6.95 1.32 8.98 13.17 23.84 21.04 39.75 21.04s30.77-7.86 39.75-21.04c1.56-2.28 4.67-2.87 6.95-1.32 2.28 1.56 2.87 4.67 1.32 6.95-10.85 15.9-28.79 25.4-48.02 25.4z">
                </path>
            </symbol>
            <symbol id="icon-rabbit" viewBox="0 0 101.8 87.7">
                <circle cx="24.7" cy="35.3" r="2.4"></circle>
                <path
                    d="M83.5 53.9c-.9 0-1.7.1-2.5.4-3.1-9.3-11.9-15.5-22.5-15.5h-9.7c.1-.5.1-.9.1-1.4 0-4.7-2.6-8.9-6.5-11l4.8-16c.9-3.1.2-5-.5-6.1-.8-1.2-2.2-2-3.9-2.2-1.6-.1-2.9.3-3.9 1.1-.7-.5-1.6-.8-2.6-.9-4.2-.4-6.1 3.3-7.2 6.5l-4.9 15c-1.3.6-4.2 2.1-7.5 5.3-.3.4-6.4 6.3-6.2 12.9.1 3 1.4 5.6 4 7.8.4.3 3.8 3.2 10.4 3.2 1.4 0 2.9-.1 4.5-.4v21.8c0 .9-.7 1.6-1.6 1.6h-1.2c-2.5.2-4.5 2.2-4.5 4.8V84c0 .9.7 1.6 1.6 1.6.9 0 1.6-.7 1.6-1.6v-3.2c0-.9.7-1.6 1.6-1.6h1.4c2.4-.3 4.3-2.3 4.3-4.8V50.1c-.2-.9-1.1-1.4-2-1.2-9.3 2.3-13.8-1.4-14-1.6-1.9-1.6-2.8-3.3-2.9-5.4-.2-5.1 5.1-10.3 5.2-10.3 3.9-3.8 7-4.9 7-4.9.5-.2.9-.5 1-1L32 10c1.5-4.2 2.8-4.5 3.9-4.4.2 0 .6.1.9.2-.5.9-.9 1.9-1.3 2.9v.1l-5 16c-.3.8.2 1.8 1 2 .8.3 1.8-.2 2-1l5.1-16.1c1.5-4.2 2.7-4.5 3.9-4.4.5 0 1.2.2 1.6.8.5.7.5 1.9.1 3.3L39 26.6c-.3.8.1 1.7.9 2 3.5 1.3 5.8 4.8 5.8 8.7 0 2.1-.7 4.2-2 5.9-.6.7-.4 1.7.3 2.3.3.2.6.3 1 .3.5 0 .9-.2 1.3-.6.8-1 1.4-2.1 1.9-3.3h10.3c9.8 0 17.7 6 19.9 15 .1.5.5.9 1 1.1.5.2 1 .1 1.5-.2.7-.4 1.6-.7 2.6-.7 2.6 0 4.6 2.1 4.6 4.6 0 2.6-2.1 4.6-4.6 4.6-.9 0-1.8-.3-2.6-.8-.4-.3-1-.4-1.5-.2s-.9.6-1 1.1C76.2 75.8 68 82.3 58.5 82.3H43.9v-1.6c0-.9.7-1.6 1.6-1.6h.9c2.7 0 4.8-2.2 4.8-4.8v-3.9c0-5.5 4.4-9.9 9.9-9.9.9 0 1.6-.7 1.6-1.6 0-.9-.7-1.6-1.6-1.6-7.2 0-13.1 5.9-13.1 13.1v3.9c0 .9-.7 1.6-1.6 1.6h-.9c-2.7 0-4.8 2.2-4.8 4.8v3.2c0 .9.7 1.6 1.6 1.6h16.2c10.3 0 19.3-6.6 22.5-16.2.8.3 1.6.4 2.5.4 4.3 0 7.9-3.5 7.9-7.9-.1-4.4-3.6-7.9-7.9-7.9z">
                </path>
            </symbol>
            <symbol id="icon-reptile" viewBox="0 0 101.8 87.7">
                <path
                    d="M67 16.8h-7.4c-2.1 0-3.9-1.7-3.9-3.9V8.3c0-2.1-1.7-3.7-3.7-3.7h-8.9c-10.8 0-19.6 8.8-19.6 19.6v4.1H12.3c-2.3-.2-4.2-2-4.3-4.4 0-1 .3-2 1.1-2.8.8-.7 1.8-1.1 2.9-1.1 1.6.1 2.9 1.4 3 3 0 .9.7 1.5 1.6 1.5.9 0 1.5-.7 1.5-1.6-.2-3.2-2.8-5.8-6-6-3.8-.2-7 2.7-7.2 6.4v.6c.1 4 3.4 7.2 7.4 7.3h16.4c.8 5.4 5.4 9.5 10.9 9.5h11.6c-.3 1-.5 2.1-.5 3.2v1.2c0 1.5-1.3 2.7-2.8 2.7h-4.5c-3.3 0-5.9 2.7-5.9 5.9s2.7 5.9 5.9 5.9h10.9c5.5.1 10.1-4.2 10.2-9.7v-2.1c0-.9-.7-1.6-1.6-1.6-.9 0-1.6.7-1.6 1.6v2.1c-.1 3.8-3.3 6.8-7.1 6.7H43.3c-1.6 0-2.8-1.3-2.8-2.8 0-1.6 1.3-2.8 2.8-2.8h4.5c3.2 0 5.9-2.6 5.9-5.8V44c-.1-3.6 2.7-6.6 6.3-6.7.9 0 1.6-.7 1.6-1.6 0-.9-.7-1.6-1.6-1.6-2.8 0-5.4 1.3-7.2 3.6H39.6c-3.8 0-7-2.7-7.7-6.3h9.8c.9 0 1.6-.7 1.6-1.6s-.7-1.6-1.6-1.6H26.6v-4.1C26.6 15 34 7.7 43 7.7h9c.3 0 .6.3.6.6v4.6c0 3.9 3.1 7 7 7H67c13.6 0 24.6 11 24.7 24.6v22.4c0 6.9-6 12.9-13.1 13.2-3.2.1-6.4-1.1-8.7-3.4-2.4-2.4-3.6-5.7-3.4-9 .2-5.3 4.5-9.6 9.8-9.9 2.5-.1 4.8.8 6.6 2.6 1.8 1.8 2.7 4.2 2.6 6.7-.2 3.6-3 6.4-6.6 6.6-3 .1-5.6-2-6-5-.1-.9-.9-1.5-1.7-1.3-.9.1-1.5.9-1.3 1.7v.1c.7 4.5 4.6 7.8 9.2 7.6 5.2-.3 9.3-4.4 9.6-9.6.2-3.4-1.1-6.7-3.5-9.1-2.3-2.3-5.5-3.6-8.8-3.5-7 .3-12.5 5.9-12.9 12.9-.2 4.2 1.4 8.3 4.3 11.3 2.8 2.8 6.6 4.3 10.5 4.3h.5c8.6-.2 16-7.7 16-16.2V44.6c0-15.4-12.5-27.8-27.8-27.8z">
                </path>
                <circle cx="40.5" cy="19.3" r="2.3"></circle>
            </symbol>
            <symbol id="icon-smallFurry" viewBox="0 0 101.8 87.7">
                <path
                    d="M85.3 49.7c-.9 0-1.6.7-1.6 1.6 0 3.7-3 6.6-6.6 6.6H25.6c-6.1 0-9.7-3.5-9.7-9.3S23 37.3 29.4 35.9l3.7-.7c.7-.1 1.3-.8 1.3-1.5 0-2.1 1.7-3.9 3.8-3.9h.1c2.2 0 3.9 1.8 3.9 3.9v4.2c0 2.2-1.8 3.9-3.9 3.9-.9 0-1.6.7-1.6 1.6s.7 1.6 1.6 1.6c3.9 0 7-3.2 7-7v-3.5h16.2c7.7 0 14 6.3 14 14v2.7c0 .9.7 1.6 1.6 1.6s1.6-.7 1.6-1.6v-2.7c0-9.5-7.7-17.1-17.1-17.2H44.9c-1.3-3.7-5.4-5.6-9-4.2-2.3.8-4 2.8-4.5 5.2l-2.6.5c-6.7 1.5-16.1 7.8-16.1 15.8 0 7.5 5 12.4 12.8 12.4h51.6c5.4 0 9.7-4.4 9.8-9.8 0-.8-.7-1.5-1.6-1.5z">
                </path>
                <circle cx="26.9" cy="44.1" r="2.3"></circle>
            </symbol>
            <symbol id="icon-addAnimal" viewBox="0 0 29 34.56">
                <title>icon-addAnimal</title>
                <path
                    d="M22.29,16.63V29.21a.85.85,0,0,1-.83.85H5.18a.85.85,0,0,1-.83-.85V7.55a.85.85,0,0,1,.83-.85h7.15a5.38,5.38,0,0,1,2.55-4.51H5.18A5.28,5.28,0,0,0,0,7.55V29.21a5.28,5.28,0,0,0,5.18,5.36H21.46a5.28,5.28,0,0,0,5.18-5.36V14.33A5.4,5.4,0,0,1,22.29,16.63Z">
                </path>
                <path
                    d="M27,4.69H24.3V2a2,2,0,0,0-4,0V4.69h-2.7a2,2,0,1,0,0,4h2.7v2.69a2,2,0,0,0,4,0V8.7H27a2,2,0,1,0,0-4Z">
                </path>
            </symbol>
            <symbol id="icon-addUser" viewBox="0 0 35.62 26.62">
                <title>icon-addUser</title>
                <path
                    d="M13.43,9.43a2,2,0,0,0-2-2H8.72V4.73a2,2,0,0,0-4,0V7.42H2a2,2,0,1,0,0,4h2.7v2.69a2,2,0,0,0,4,0V11.43h2.7A2,2,0,0,0,13.43,9.43Z">
                </path>
                <ellipse cx="22.92" cy="6.01" rx="6.03" ry="6.02"></ellipse>
                <path
                    d="M22.92,15.32c-7,0-12.7,2.29-12.7,6.43v.52a4,4,0,0,0,4.35,4.34H31.26a4,4,0,0,0,4.36-4.34v-.52C35.62,17.61,29.93,15.32,22.92,15.32Z">
                </path>
            </symbol>
            <symbol id="icon-alert" viewBox="0 0 25.01 30.66">
                <title>icon-alert</title>
                <path
                    d="M23.91,20.6a1.21,1.21,0,0,1-.5-.5s-1.3-7.2-1.5-9.9a6.86,6.86,0,0,0-4.3-6.1c-.5-.2-1-.3-1.5-.5a3.6,3.6,0,1,0-7.2,0c-.4.2-.9.3-1.4.5h-.1A6.7,6.7,0,0,0,3,10.2c-.2,2.8-1.3,10-1.3,10,0,.2-.1.3-.3.4A1.59,1.59,0,0,0,0,21.9a1.55,1.55,0,0,0,1.3,1.7h22.2A1.47,1.47,0,0,0,25,22.1,1.5,1.5,0,0,0,23.91,20.6Zm-7.4,4.9h-8a1.09,1.09,0,0,0-1.1.9.6.6,0,0,0,.1.4,5.2,5.2,0,0,0,6.3,3.7,5.31,5.31,0,0,0,3.7-3.7,1,1,0,0,0-.6-1.3Z">
                </path>
            </symbol>
            <symbol id="icon-arrowDownSmall" viewBox="0 0 24.68 15.84">
                <title>icon-arrowDownSmall</title>
                <path
                    d="M23.66,1a3.5,3.5,0,0,0-2.43-1H3.52A3.49,3.49,0,0,0,1,5.94l8.86,8.87h0l0,0h0a3.48,3.48,0,0,0,4.86,0l8.92-8.91A3.48,3.48,0,0,0,23.66,1Z">
                </path>
            </symbol>
            <symbol id="icon-arrowRightSmall" viewBox="0 0 15.8 24.7">
                <title>icon-arrowRightSmall</title>
                <path
                    d="M1 1c-.6.6-1 1.5-1 2.4v17.7c0 1.9 1.5 3.5 3.5 3.5.9 0 1.8-.4 2.5-1l8.9-8.9c1.3-1.4 1.3-3.5 0-4.9L5.9 1C4.5-.3 2.4-.3 1 1z">
                </path>
            </symbol>
            <symbol id="icon-article" viewBox="0 0 26.64 32.37">
                <title>icon-article</title>
                <path
                    d="M25,8.9,18,1.65A6.15,6.15,0,0,0,14.2,0h-9A5.28,5.28,0,0,0,0,5.36V27a5.28,5.28,0,0,0,5.18,5.36H21.46A5.28,5.28,0,0,0,26.64,27V12.88A6.61,6.61,0,0,0,25,8.9ZM22.29,27a.85.85,0,0,1-.83.85H5.18A.85.85,0,0,1,4.35,27V5.36a.85.85,0,0,1,.83-.85h8.64a1.15,1.15,0,0,1,1.13,1.16v5.27a1.15,1.15,0,0,0,1.12,1.17h5.09a1.15,1.15,0,0,1,1.13,1.16Z">
                </path>
            </symbol>
            <symbol id="icon-calendar" viewBox="0 0 31.98 31.41">
                <title>icon-calendar</title>
                <path
                    d="M32,8.25a4.58,4.58,0,0,0-4.56-4.46H25.62V2.29a2.28,2.28,0,1,0-4.57,0v1.5H10.93V2.29a2.28,2.28,0,1,0-4.57,0v1.5H4.57A4.58,4.58,0,0,0,0,8.25s0,0,0,.06V26.84a4.59,4.59,0,0,0,4.57,4.58H27.42A4.59,4.59,0,0,0,32,26.84V8.31S32,8.27,32,8.25ZM10,25.17a1.38,1.38,0,0,1-1.37,1.37H6.5a1.38,1.38,0,0,1-1.37-1.37V23.7A1.38,1.38,0,0,1,6.5,22.33H8.65A1.38,1.38,0,0,1,10,23.7Zm0-6.83a1.38,1.38,0,0,1-1.37,1.37H6.5a1.38,1.38,0,0,1-1.37-1.37V16.87A1.38,1.38,0,0,1,6.5,15.49H8.65A1.38,1.38,0,0,1,10,16.87Zm0-6.83a1.38,1.38,0,0,1-1.37,1.37H6.5a1.38,1.38,0,0,1-1.37-1.37V10A1.38,1.38,0,0,1,6.5,8.66H8.65A1.38,1.38,0,0,1,10,10Zm8.42,13.66a1.38,1.38,0,0,1-1.37,1.37H14.92a1.38,1.38,0,0,1-1.37-1.37V23.7a1.38,1.38,0,0,1,1.37-1.37h2.15a1.38,1.38,0,0,1,1.37,1.37Zm0-6.83a1.38,1.38,0,0,1-1.37,1.37H14.92a1.38,1.38,0,0,1-1.37-1.37V16.87a1.38,1.38,0,0,1,1.37-1.37h2.15a1.38,1.38,0,0,1,1.37,1.37Zm0-6.83a1.38,1.38,0,0,1-1.37,1.37H14.92a1.38,1.38,0,0,1-1.37-1.37V10a1.38,1.38,0,0,1,1.37-1.37h2.15A1.38,1.38,0,0,1,18.44,10Zm8.42,13.66a1.38,1.38,0,0,1-1.37,1.37H23.34A1.38,1.38,0,0,1,22,25.17V23.7a1.38,1.38,0,0,1,1.37-1.37h2.15a1.38,1.38,0,0,1,1.37,1.37Zm0-6.83a1.38,1.38,0,0,1-1.37,1.37H23.34A1.38,1.38,0,0,1,22,18.34V16.87a1.38,1.38,0,0,1,1.37-1.37h2.15a1.38,1.38,0,0,1,1.37,1.37Zm0-6.83a1.38,1.38,0,0,1-1.37,1.37H23.34A1.38,1.38,0,0,1,22,11.51V10a1.38,1.38,0,0,1,1.37-1.37h2.15A1.38,1.38,0,0,1,26.86,10Z">
                </path>
            </symbol>
            <symbol id="icon-check" viewBox="0 0 20.13 14.12">
                <title>icon-check</title>
                <path
                    d="M19.72 3.11l-10 10.07a3.22 3.22 0 0 1-4.55 0L.38 8.44a1.29 1.29 0 0 1 0-1.82l.91-.91a1.29 1.29 0 0 1 1.82 0l3.84 3.84a.65.65 0 0 0 .91 0L17 .38a1.29 1.29 0 0 1 1.82 0l.91.91a1.29 1.29 0 0 1 0 1.82z">
                </path>
            </symbol>
            <symbol id="icon-chevronDown" viewBox="0 0 24.8 15.92">
                <title>icon-chevronDown</title>
                <path
                    d="M9.95,14.95a3.57,3.57,0,0,0,4.9,0l8.9-8.9a3.5,3.5,0,0,0,0-5,3.5,3.5,0,0,0-5,0h0l-6.4,6.4-6.3-6.4a3.5,3.5,0,0,0-5,0,3.5,3.5,0,0,0,0,5l8.9,8.9Z">
                </path>
            </symbol>
            <symbol id="icon-chevronLeft" viewBox="0 0 15.8 24.7">
                <title>icon-chevronLeft</title>
                <path d="M1,14.7L1,14.7L1,14.7l8.8,8.9c1.4,1.4,3.6,1.4,4.9,0s1.4-3.6,0-4.9l-6.3-6.5l6.5-6.4c1.2-1.3,1.2-3.4,0-4.7
	c-1.3-1.4-3.5-1.6-4.9-0.3L1,9.8C-0.3,11.1-0.3,13.3,1,14.7L1,14.7z"></path>
            </symbol>
            <symbol id="icon-chevronRight" viewBox="0 0 15.86 24.62">
                <title>icon-chevronRight</title>
                <path
                    d="M14.87 14.69a3.48 3.48 0 0 0 0-4.86L5.95.91a3.49 3.49 0 0 0-4.93 4.93l6.4 6.42-6.4 6.4a3.493 3.493 0 1 0 4.94 4.94l8.87-8.86z">
                </path>
            </symbol>
            <symbol id="icon-chevronUp" viewBox="0 0 24.8 15.9">
                <title>icon-chevronUp</title>
                <path
                    d="M14.9 1C13.5-.3 11.4-.3 10 1L1.1 9.9c-1.4 1.4-1.4 3.6-.1 4.9l.1.1c1.4 1.4 3.6 1.4 4.9.1l.1-.1 6.4-6.4 6.3 6.4c1.4 1.4 3.6 1.4 4.9.1l.1-.1c1.4-1.4 1.4-3.6.1-4.9l-.1-.1L14.9 1z">
                </path>
            </symbol>
            <symbol id="icon-circleAlert" viewBox="0 0 32.07 32.07">
                <title>icon-circleAlert</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0ZM13.76,6.11A1.41,1.41,0,0,1,15.17,4.7H16.9a1.41,1.41,0,0,1,1.41,1.41V18.55A1.42,1.42,0,0,1,16.9,20H15.17a1.42,1.42,0,0,1-1.41-1.41ZM16,27.37a2.64,2.64,0,1,1,0-5.27,2.64,2.64,0,1,1,0,5.27Z">
                </path>
            </symbol>
            <symbol id="icon-circleBorderPlay" viewBox="0 0 32 32">
                <g>
                    <title>icon-circleBorderPlay</title>
                    <path
                        d="M16 2c7.7 0 14 6.3 14 14s-6.3 14-14 14S2 23.7 2 16 8.3 2 16 2m0-2C7.2 0 0 7.2 0 16s7.2 16 16 16 16-7.2 16-16S24.8 0 16 0z">
                    </path>
                </g>
                <path d="M22.4 14.6l-9.1-4.2c-1.6-.7-3 .1-3 1.9v7.5c0 1.8 1.3 2.7 3 1.9l9.1-4.2c1.6-.9 1.6-2.1 0-2.9z">
                </path>
            </symbol>
            <symbol id="icon-circleBorderPlus" viewBox="0 0 32 32">
                <title>icon-circleBorderPlus</title>
                <path
                    d="M16 2c7.7 0 14 6.3 14 14s-6.3 14-14 14S2 23.7 2 16 8.3 2 16 2m0-2C7.2 0 0 7.2 0 16s7.2 16 16 16 16-7.2 16-16S24.8 0 16 0z">
                </path>
                <path
                    d="M9.9 13.4h3.6V9.9c0-1.5 1.2-2.7 2.7-2.7s2.7 1.2 2.7 2.7v3.6h3.6c1.5 0 2.7 1.2 2.7 2.6 0 1.5-1.2 2.7-2.6 2.7h-3.5v3.6c0 1.5-1.2 2.7-2.7 2.7-1.5 0-2.7-1.2-2.7-2.7v-3.6H9.9c-1.5 0-2.7-1.2-2.7-2.6 0-1.6 1.2-2.8 2.7-2.8z">
                </path>
            </symbol>
            <symbol id="icon-circleBorderQuestion" viewBox="0 0 32 32">
                <title>icon-circleBorderQuestion</title>
                <path d="M16 2A14 14 0 1 1 2 16 14 14 0 0 1 16 2m0-2a16 16 0 1 0 16 16A16 16 0 0 0 16 0z"></path>
                <circle cx="16" cy="24.28" r="2.22"></circle>
                <path
                    d="M11 13.13h1.4A1.18 1.18 0 0 0 13.57 12v-.13a2.49 2.49 0 1 1 2.5 2.48h-.73a1.19 1.19 0 0 0-1.19 1.19v3.79a1.19 1.19 0 0 0 1.19 1.19h1.47A1.19 1.19 0 0 0 18 19.33v-1.48l.55-.21a6.35 6.35 0 0 0 3.28-8.36 6.28 6.28 0 0 0-12 2.85 1.18 1.18 0 0 0 1.17 1z">
                </path>
            </symbol>
            <symbol id="icon-circleCheck" viewBox="0 0 32.07 32.07">
                <title>icon-circleCheck</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0Zm9.69,12.15L15.65,22.22a3.22,3.22,0,0,1-4.55,0L6.35,17.48a1.29,1.29,0,0,1,0-1.82l.91-.91a1.29,1.29,0,0,1,1.82,0l3.84,3.84a.65.65,0,0,0,.91,0L23,9.42a1.29,1.29,0,0,1,1.82,0l.91.91A1.29,1.29,0,0,1,25.72,12.15Z">
                </path>
            </symbol>
            <symbol id="icon-circleCheckOutlined" viewBox="0 0 32.07 32.07">
                <path d="M16 1A15 15 0 1 1 1 16 15.05 15.05 0 0 1 16 1m0-1a16 16 0 1 0 16 16A16 16 0 0 0 16 0z"></path>
                <path
                    d="M11.17 22.22a3.22 3.22 0 0 0 4.55 0l10-10.07a1.3 1.3 0 0 0 0-1.82l-.9-.9a1.3 1.3 0 0 0-1.83 0l-9.1 9.16a.65.65 0 0 1-.9 0l-3.86-3.86a1.3 1.3 0 0 0-1.82 0l-.9.9a1.3 1.3 0 0 0 0 1.83z">
                </path>
            </symbol>
            <symbol id="icon-circleDeleted" viewBox="0 0 32.07 32.07">
                <title>icon-circleDeleted</title>
                <path
                    d="M27.38,4.7a16,16,0,1,0,0,22.68A16,16,0,0,0,27.38,4.7Zm-8.76,17.7-2.53-2.53-2.52,2.52a2.66,2.66,0,0,1-3.76-3.76l2.52-2.52L9.8,13.58a2.65,2.65,0,1,1,3.75-3.75l2.53,2.53L18.6,9.84a2.66,2.66,0,0,1,3.76,3.76l-2.52,2.52,2.53,2.53a2.65,2.65,0,1,1-3.75,3.75Z">
                </path>
            </symbol>
            <symbol id="icon-circleDownArrow" viewBox="0 0 32.07 32.07">
                <title>icon-cicleDownArrow</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0Zm7.26,17.29-6.14,7.08a1.29,1.29,0,0,1-2,0L9,17.29c-.74-.9-.4-1.64.76-1.64h2.1a.62.62,0,0,0,.61-.61V8.45a1.23,1.23,0,0,1,1.22-1.23H18.6a1.23,1.23,0,0,1,1.22,1.23V15a.61.61,0,0,0,.61.61h2.1C23.69,15.65,24,16.39,23.29,17.29Z">
                </path>
            </symbol>
            <symbol id="icon-circleEdit" viewBox="0 0 32.07 32.07">
                <title>icon-circleEdit</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0Zm5.27,17.68-5.8,5.8a4.2,4.2,0,0,1-2.23,1L9,24.89A1.06,1.06,0,0,1,7.79,23.7l.38-4.31a4.18,4.18,0,0,1,1-2.23l5.8-5.8a.44.44,0,0,1,.62,0l5.69,5.69A.44.44,0,0,1,21.31,17.68Zm3.77-3.77-1.61,1.61a.44.44,0,0,1-.62,0L17.16,9.83a.44.44,0,0,1,0-.62L18.77,7.6a1.31,1.31,0,0,1,1.85,0l4.45,4.45A1.31,1.31,0,0,1,25.08,13.91Z">
                </path>
            </symbol>
            <symbol id="icon-circleMinus" viewBox="0 0 32.07 32.07">
                <title>icon-circleMinus</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0ZM9.8,18.71a2.65,2.65,0,1,1,0-5.3H22.27a2.65,2.65,0,1,1,0,5.3Z">
                </path>
            </symbol>
            <symbol id="icon-circlePlus" viewBox="0 0 32.07 32.07">
                <title>icon-ciclePlus</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0Zm6.32,18.71H18.78v3.56a2.66,2.66,0,0,1-5.32,0V18.71H9.89a2.65,2.65,0,1,1,0-5.3h3.57V9.85a2.66,2.66,0,0,1,5.32,0v3.56h3.57a2.65,2.65,0,1,1,0,5.3Z">
                </path>
            </symbol>
            <symbol id="icon-circleQuestion" viewBox="0 0 32.07 32.07">
                <title>icon-cicleQuestion</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0Zm0,26.5a2.22,2.22,0,1,1,0-4.44,2.22,2.22,0,1,1,0,4.44ZM18,17.85v1.48a1.19,1.19,0,0,1-1.19,1.19H15.34a1.19,1.19,0,0,1-1.19-1.19V15.54a1.19,1.19,0,0,1,1.19-1.19h.73A2.49,2.49,0,1,0,13.57,12a1.18,1.18,0,0,1-1.17,1.13H11a1.18,1.18,0,0,1-1.16-1,6.31,6.31,0,0,1,2.63-5.34h0a6.35,6.35,0,0,1,9.36,2.49A6.35,6.35,0,0,1,18,17.85Z">
                </path>
            </symbol>
            <symbol id="icon-circleTransferred" viewBox="0 0 32.07 32.07">
                <title>icon-circleTransferred</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0ZM8.71,10.28l4.52-3.91c.57-.47,1-.26,1,.49V8.19a.39.39,0,0,0,.39.39h6.2a.78.78,0,0,1,.78.78v3.12a.78.78,0,0,1-.78.78h-6.2a.39.39,0,0,0-.39.39V15c0,.74-.47,1-1,.49L8.71,11.56A.82.82,0,0,1,8.71,10.28ZM23.6,21.79l-4.52,3.91c-.57.47-1,.26-1-.49V23.88a.39.39,0,0,0-.39-.39h-6.2a.78.78,0,0,1-.78-.78V19.6a.78.78,0,0,1,.78-.78h6.2a.39.39,0,0,0,.39-.39V17.09c0-.74.47-1,1-.49l4.52,3.91A.82.82,0,0,1,23.6,21.79Z">
                </path>
            </symbol>
            <symbol id="icon-circleUndeleted" viewBox="0 0 32.07 32.07">
                <title>icon-circleUndeleted</title>
                <path
                    d="M16,0a16,16,0,1,0,16,16A16,16,0,0,0,16,0ZM26.33,16.16H24.9a8.72,8.72,0,1,1-8.71-8.84h.39a.65.65,0,0,1,.65.65v2.58a.65.65,0,0,1-.65.64h-.39a4.85,4.85,0,1,0,4.84,5H19.61c-.61,0-.79-.39-.4-.86l3.23-3.73a.68.68,0,0,1,1.06,0l3.23,3.73C27.13,15.77,26.94,16.16,26.33,16.16Z">
                </path>
            </symbol>
            <symbol id="icon-close" viewBox="0 0 24.67 24.67">
                <title>icon-close</title>
                <path
                    d="M17.27,12.34l6.4-6.4A3.49,3.49,0,0,0,18.74,1l-6.4,6.4L5.93,1A3.49,3.49,0,0,0,1,5.93l6.4,6.4L1,18.74a3.49,3.49,0,0,0,4.94,4.94l6.4-6.4,6.4,6.4a3.49,3.49,0,0,0,4.94-4.94Z">
                </path>
            </symbol>
            <symbol id="icon-crossed_out_eye" viewBox="0 0 22 20">
                <path
                    d="m11 3.99922c3.79 0 7.17 2.13 8.82 5.5-.59 1.21998-1.42 2.26998-2.41 3.11998l1.41 1.41c1.39-1.23 2.49-2.77 3.18-4.52998-1.73-4.39-6-7.5-11-7.5-1.27 0-2.49.2-3.64.57l1.65 1.65c.65-.13 1.31-.22 1.99-.22zm-1.07 1.14 2.07 2.07c.57.25 1.03.71 1.28 1.28l2.07 2.06998c.08-.34.14-.69998.14-1.06998.01-2.48-2.01-4.49-4.49-4.49-.37 0-.72.05-1.07.14zm-8.92-3.27 2.68 2.68c-1.63 1.28-2.92 2.98-3.69 4.95 1.73 4.38998 6 7.49998 11 7.49998 1.52 0 2.98-.29 4.32-.82l3.42 3.42 1.41-1.41-17.73-17.739981zm7.5 7.5 2.61 2.60998c-.04.01-.08.02-.12.02-1.38 0-2.5-1.12-2.5-2.49998 0-.05.01-.08.01-.13zm-3.4-3.4 1.75 1.75c-.23.55-.36 1.15-.36 1.78 0 2.47998 2.02 4.49998 4.5 4.49998.63 0 1.23-.13 1.77-.36l.98.98c-.88.24-1.8.38-2.75.38-3.79 0-7.17-2.13-8.82-5.49998.7-1.43 1.72-2.61 2.93-3.53z"
                    fill="#000"></path>
            </symbol>
            <symbol id="icon-dashboard" viewBox="0 0 31.98 31.1">
                <title>icon-dashboard</title>
                <ellipse cx="28.44" cy="3.55" rx="3.54" ry="3.55"></ellipse>
                <path d="M3.54,7.11H18.59a3.55,3.55,0,0,0,0-7.11H3.54a3.55,3.55,0,0,0,0,7.11Z"></path>
                <ellipse cx="3.54" cy="15.55" rx="3.54" ry="3.55"></ellipse>
                <path d="M28.44,12H13.39a3.55,3.55,0,0,0,0,7.11H28.44a3.55,3.55,0,0,0,0-7.11Z"></path>
                <ellipse cx="28.44" cy="27.55" rx="3.54" ry="3.55"></ellipse>
                <path d="M18.59,24H3.54a3.55,3.55,0,0,0,0,7.11H18.59a3.55,3.55,0,0,0,0-7.11Z"></path>
            </symbol>
            <symbol id="icon-dogSizeLg" viewBox="0 0 380 380">
                <path
                    d="M274.94 257.17c10.5 2.91 31.6 17.48 36.11 25.08 3.97 6.69 4.46 14.44 5.4 21.97.72 5.74-4.85 6.48-7.56 9.48-1.92 2.12-2.97 4.45-1.71 7.22 1.16 2.56 3.66 2.57 5.98 2.67 2.32.09 4.65.14 6.96.01 10.38-.58 15.42-6.98 13.81-17.11-1.72-10.79-4.8-21.33-5.17-32.38-.2-5.78-2.52-10.87-7.82-14.27-3.96-2.54-6.6-6.24-8.89-10.47-7.91-14.66-9.24-31.33-16.25-47.2 31.1 11.52 58.22 13.27 74.59 5.2.73-3.61-1.6-5.62-4.25-7.01-6.47-3.38-13.06-6.45-20.6-6.85-4.96-.26-10-.54-14.81-1.68-15.2-3.61-30.49-7.15-40.77-20.68-2.58-3.4-5.86-6.3-8.97-9.27-11.02-10.5-23.95-17.94-38.72-21.27-9.97-2.25-20.34-2.84-30.55-3.95-16.1-1.76-32.06-3.07-47.64-8.9-27.72-10.37-41.76-32.96-53.15-57.51-3.85-8.3-7.86-14.99-15.45-19.66-10.17-6.26-20.66-8.42-33.04-7.46-12.95 1-21.38 8.28-24.95 17.64-3.39 8.89-8.63 12.33-15.87 15.51-2.12.93-4.17 2.06-6.21 3.16-6.59 3.54-7.03 4.69-4.57 11.74 1.55 4.45 4.01 8.31 7.22 11.78 6.94 7.51 16.33 8.08 25.54 9.28 3.86.5 8.05-.92 11.64 2.03 1.3 6.37 1.6 13.29 4.14 19.25 10.6 24.81 11.46 51.72 15.89 77.63 3.98 23.33 8 46.96 9.37 70.83.73 12.78-.04 23.85-12.92 30.43-1.78.91-3.03 2.66-2.71 4.92.33 2.29 2.03 3.49 4.05 3.83 7.41 1.23 14.92 3.68 23.52-1.48 7.83-26.61 6.44-55.83 13.47-83.91 11.57 1.65 13.31 11.43 15.06 19.6 3.83 17.91 3.07 36.27 2.5 54.49-.16 5.09-1.67 9.87-6.46 12.73-3.74 2.23-8.42 4.38-6.96 9.55 1.48 5.24 7.17 4.13 11.15 4.67 9.04 1.23 14.8-2.87 18.7-10.99 4.3-8.93 5.94-18.22 5.82-27.98-.07-6.31-.57-12.65-.05-18.92.95-11.45.62-23.13 4.57-34.44 2.79-.75 5.29-1.83 7.86-2.06 11.7-1.05 22.97-4.21 33.62-8.68 12.39-5.19 21.18 1.32 29.35 7.95 6.09 4.94 11.36 11.13 17.6 16.06 8.44 6.67 13.31 15.77 16.71 25.44 2.54 7.24 5.21 15.37-3.21 21.63-1.93 1.44-1.48 4.36.6 6.15 4.3 3.72 9.42 2.83 14.26 1.9 4.71-.91 6.02-4.98 6.19-9.12.2-4.62-.34-9.23-1.05-13.85-1.66-10.74-1.39-21.6-1.37-32.73z"
                    fill="#d6a5ff"></path>
            </symbol>
            <symbol id="icon-dogSizeMd" viewBox="0 0 380 380">
                <path
                    d="M147.89 307.22c0-.11 0-.22.01-.33 1.74 0 3.49.12 5.22-.02 4.92-.41 6.39-2.2 5.99-7.23-.11-1.46-.62-2.75-.22-4.4 1.27-5.26 4.37-10.04 3.97-15.75-.08-1.1.06-2.73 1.54-3.33.65-.27 1.43-.63 1.14-1.28-2.18-4.85 1.21-10.38-1.86-15.09-.54-.82-1.86-1.61.1-2.28 3.64-1.25 3.29-3.43 1.49-6.05-.47-.69-1.14-2.08-.95-2.24 3.95-3.38.24-6.94-.74-9.34-1.65-4.05-3.76-7 1.54-9.49 1.4-5.79 7.13-5.38 10.97-7.68 2.53 1.66 3.34-3.27 5.52-1.62 2.45 1.85 4.28.17 5.93-.79 5.2-3.03 10.98-4.73 16.24-7.78 5.6-3.25 12.16-5 18.98-5.33 3.2-.16 5.13.24 7 2.99 3.25 4.76 6.96 9.21 10.54 13.75.93 1.17 2.9 5.63 2.97 7.14.03.64.01 1.51.39 1.87 3.71 3.48 5.19 8.46 8.37 12.29 1.11 1.34 2.11 1.69 3.9 1.3 2.99-.64 3.21-.34 1.84 2.8-.62 1.42-.37 2.37.16 3.62.98 2.32 2.47 4.06 4.82 5.02 5.3 2.15 8.03 7.21 10.78 11.41 5.66 8.65 8.98 18.22 3.61 28.71-1.49 2.91.37 5.8 3.64 6.24 3.87.52 7.82.49 11.63-.63 2.2-.65 3.36-1.9 3.9-4.52 1.2-5.93 2.49-11.81 3.26-17.83.29-2.3.51-4.46-.61-6.22-2.91-4.61-.82-8.42 1.49-12.22.88-1.45 2.66-2.54 3.06-4.05.58-2.18-2.39-2.98-2.89-4.7-.63-2.19-2.43-2.97-3.75-4.32-1.06-1.09-2.76-2.07-2.69-3.55.16-3.14-2.21-4.92-3.26-7.37-.8-1.85-3.42-3.75-.43-6.05.3-.23-.11-1.64-.43-2.41-2.77-6.76-5.37-13.59-5.52-20.98-.13-6.24-.26-12.56.58-18.71.39-2.82.67-5.44.29-8.23-.62-4.69-.66-9.52-4.16-13.32-.38-.42-.36-1.22-.49-1.85-.51-2.49-.99-4.97-1.49-7.46 3.45-.93 1.14-3.84 1.93-5.7 1.07-2.57 1.2-5.93 2.97-7.7 1.73-1.73 2.38-2.71 1.31-4.79-.8-1.55 1.13-4.13-1.61-4.91-2.33-.66-3.19-1.5-.97-3.28.75-.6 1.41-1.16.88-2.08-1.25-2.15-1.3-4.53-1.71-6.88-.53-3.03-5.7-6.39-7.85-4.86-2.52 1.79-4.21.91-6.44.06-1.39-.53-3.1-.66-2.65 2.05.39 2.35-.67 3.41-2.83 1.67-1.31-1.06-2.49-1.67-4.09-.7-2.16 1.31-4.16.92-5.96-.74-2.55-2.36-1.33.14-1.67 1.15-2.15 6.55-6.64 10.29-12.92 9.1-5.01-.95-5.83 4.21-9.44 4.72.65 5.4-3.66 3.75-5.93 3.57-2.32-.18-4.88-1.11-7.05-.7-3.77.71-7.29-.17-10.92-.33-5.22-.21-10.37-1.69-15.53-1.32-9.47.69-17.78-2.49-25.81-6.77-2.31-1.23-4.33-2.78-7.15-2.66-1.5.07-3.3-.09-3.9-1.78-1.43-4.06-4.92-5.83-8.12-8.08-3.01-2.11-5.57-4.82-7.71-7.82-2.38-3.35-1.96-5.06 1.97-6.06 3.25-.83 5.31-2.47 6.88-5.29 4.14-7.45.85-13.91-7.7-14.65-2.79-.24-4.82-1.81-6.91-3.23-1.99-1.36-3.86-3.44-6.35-2.37-3.09 1.33-7.74.33-8.71 5.27-.11.58-.65 1.12-1.1 1.58-1.6 1.68-3.16 1.57-4.06-.88-.84-2.27-2.3-2.25-4.04-2.25-1.05 0-2.04.33-2.76-.98-2.48-4.49-7.52-5.82-11.32-8.68-1.32-.99-3.7-.69-5.6-.79-2.41-.12-1.16 2.4-2.25 3.35-1.44 1.26-2.44 3.45-4.05 3.98-3.83 1.26-4.32 2.55-3.3 6.75.73 2.98 1.08 4.76 3.77 6.47 4.18 2.65 4.94 6.65 3.14 11.83-.28.81-.6 1.67-.58 2.5.11 3.7-1.29 6.65-3.81 9.33-6.78 7.21 1.01 21.41 9.73 21.59 7.12.14 7.61.9 7.05 7.79-.34 4.15 1.5 6.83 4.36 8.42 4.32 2.4 5.35 6.72 5.27 10.29-.08 3.82.68 7.63.34 11.24-.46 4.76.14 8.91 2.13 13.09.83 1.75 1.58 3.63 1.86 5.52 1.25 8.35 6.28 15.45 7.73 23.72.21 1.22 1 2.31 2.02 3.26 4.57 4.24 6.51 9.45 5.24 15.67-.25 1.22.04 1.92 1.15 2.64 4.28 2.79 2.55 8.17 4.92 11.82-1.94 6.65.27 12.61 3.08 18.46.61 1.26.51 2.39.21 3.74-.73 3.29-2.74 5.3-5.65 6.68-2.46 1.17-3.47 3.46-3.34 5.89.12 2.29 2.48 2.78 4.3 3.42 1.42.5 2.91.78 4.38 1.14 6.2 1.53 6.2 1.53 3.69 7.65-.08.2-.21.39-.28.59-1.42 3.84-.17 6.39 3.86 7.2 2.14.42 4.35.28 6.52.39z"
                    fill="#d6a5ff"></path>
            </symbol>
            <symbol id="icon-dogSizeSm" viewBox="0 0 380 380">
                <path
                    d="M200.8 175.37c-9.4.74-19.74-.16-29.73-3.51-11.27-3.78-16.2-10.13-15.79-18.95.07-1.46-.2-2.97-.53-4.41-.74-3.29-.06-5.75 3.21-7.41 3.8-1.93 5.63-5.15 6.67-9.42 1.26-5.21 1.29-10.24.54-15.42-.35-2.43.58-5.82-2.02-6.81-2.62-1-4.74 1.85-6.89 3.33-.71.49-1.11 1.39-1.72 2.03-2.28 2.35-4.53 4.73-6.9 6.98-2.28 2.16-4.83 3.22-8.13 2.11-2.08-.7-4.41-1.22-6.57-1.04-4.5.38-6.9-1.63-8.33-5.66-2-5.63-5.87-9.88-10.38-13.69-2.21-1.87-3-1.33-4.08 1.11-4.34 9.82-1.39 18.92 2.64 27.84 1.08 2.4 2.21 4.48 1.28 7.13-.93 2.64-.47 5.11.38 7.79.91 2.87 2.77 5.75.8 9.15-.88 1.52.01 3.46 1.55 4.75 3.25 2.72 4.61 6.33 5.29 10.45.8 4.83 1.46 9.73 3.19 14.35 1.32 3.52 2.03 7.11 2.27 10.86.33 5.01 1.89 9.64 5.1 13.55 1.37 1.68 2.14 3.54 2.7 5.55 2.91 10.35 3.94 20.98 4.49 31.67.17 3.27-.06 6.53-.76 9.76-.47 2.15-1.18 3.92-3.41 4.83-1.83.75-3.15 2.22-4.32 3.77-.79 1.04-1.21 2.19.29 2.98 6.42 3.42 16.03-.87 16.44-6.71.35-5.01 2.33-9.74 2.17-14.91-.09-2.74.5-5.6.62-8.42.03-.71.02-1.69.96-1.77 1.21-.1 1.26 1 1.4 1.85.09.58.05 1.19.11 1.78.64 7.16-.9 14.22-1 21.36-.04 3.07-1.31 5.75-4.66 6.94-1.06.38-2.01 1.29-2.8 2.15-2.07 2.26-1.89 3.46.8 4.78 4.23 2.09 8.67 1.79 13.06.68 2.05-.52 3.48-2.24 3.47-4.23-.02-6.43 2.34-12.52 2.17-19-.23-8.63.91-17.18 3.04-25.56.43-1.71 1-3.47 3.01-4.13 9-2.92 17.6-7.26 27.57-6.41 5.77.5 5.8.1 4.93 5.79-.52 3.41.5 4.58 3.83 3.84 2.89-.64 5.77-1.55 8.48-2.72 1.91-.83 2.93-.56 4 1.17 3.14 5.06 7.66 8.58 12.81 11.48 2.83 1.6 5.49 3.57 8.04 5.61 4.01 3.22 5.09 7.67 5.4 12.66.27 4.26-2.68 5.56-5.3 7.45-.92.66-2.21 1.35-1.68 2.81.46 1.29 1.39 2.43 2.8 2.67 3.09.5 6.25.8 9.24-.36 2.56-.99 4.06-2.82 3.95-5.81-.13-3.27-.09-6.55-.01-9.82.02-.93-.63-2.35.65-2.7.75-.2 1.2 1.12 1.78 1.77 3.41 3.88 4.25 8.66 5.07 13.54.44 2.59.02 4.36-2.46 5.46-.81.36-1.6.82-2.3 1.36-.95.73-1.88 1.57-1.6 2.95.28 1.38 1.45 1.74 2.6 2.14 2.8.97 5.6.4 8.38-.02 4.35-.67 6.24-2.72 5.12-7.02-1.76-6.75-1.97-13.46-1.28-20.29.24-2.4-.52-4.26-2.58-5.75-8.48-6.11-11.28-14.98-11.21-24.86.06-8.29 1.35-16.62-1.77-24.67-.26-.66-.33-1.49-.2-2.19 1.23-6.53 2.04-13.2 6.1-18.83.68-.94 1.24-2.07 1.5-3.2 1.38-5.76 2.55-11.58 4-17.31.71-2.81.36-5.33-1.13-7.69-5.11-8.09-12.33-13.96-20.32-18.97-1.09-.68-2.6-1.52-3.75-.58-1.46 1.18-.43 2.86.14 4.1 1.37 2.96 2.73 6 4.61 8.64 3.08 4.32 4.56 9.29 6.65 14.04 3.77 8.59-6.66 21.98-14.06 23.22-5.9.99-11.87 1.48-17.77.79-6.3-.77-12.52-.49-19.86-.77z"
                    fill="#d6a5ff"></path>
            </symbol>
            <symbol id="icon-dogSizeXl" viewBox="0 0 380 380">
                <path
                    d="M115.86 299.35c-.14-17.59 1.15-34.99 5.57-52.14 1.46-5.68 4.27-7.66 9.6-7.75 24.5-.39 47.82-6.55 70.62-14.94 5.7-2.1 11.56-2.74 17.49-3.4 4.56-.5 7.83.15 8.22 5.74.38 5.46 3.53 6.16 8.39 4.74 9.22-2.71 9.62-2.57 11.82 7 3.18 13.85 11.19 23.59 23.4 30.49 8.38 4.74 15.76 10.94 22.96 17.35 10.63 9.48 15.34 21.32 14.83 35.36-.21 5.98-.18 12.17-6.88 15.31-1.28.6-2.3 1.63-1.53 3.13 1.93 3.71-.67 9.88 6.23 10.96 6.2.96 10.27-1.48 12.74-7.67 2.24-5.62 3.27-11.34 3.66-17.38.48-7.57 1.29-15.21 3.58-22.51 1.82-5.81 3.69-6.49 8.36-2.94 6.44 4.89 12.03 11.23 14.6 18.55C354 332.01 362 345.97 346 357.26c-1.24.87-1.86 2.72-2.55 4.22-1.37 2.98-.28 5.57 2.57 6.47 6.92 2.2 14.5 4.94 21.01.39 5.55-3.88 5.42-10.45 4.89-17.16-1.2-15.12-4.89-30.18-2.07-45.49.51-2.77.16-5.93-2.39-7.08-7.53-3.41-12.17-10.14-18.31-15.11-18.9-15.3-28.84-34.97-28.38-59.54.25-13-.41-25.95-4.65-38.3-3.7-10.77-9.81-19.67-22.51-21.06-2.57-.28-4.72-1.17-5.32-3.68-1.4-5.86-6.48-7.22-10.93-9.06-12.05-5-24.81-7.25-37.74-8.14-23.12-1.6-46.26-2.81-69.4-4.04-4.07-.22-7.96-1.11-11.53-2.76-13.22-6.1-26.64-11.8-38.19-21.08-4.39-3.53-7.41-7.28-8.39-12.86-3.07-17.34-7.1-34.4-15.98-49.88-.84-1.46-1.24-2.91-.98-4.7 1.42-9.81-1.26-18.97-4.62-28.03-1.94-5.22-4.89-10.24-3.86-16.2.23-1.3.33-2.72-1.36-3.22-1.45-.42-2.65.36-3.51 1.34-3.88 4.41-5.15 9.93-6.01 15.5-.45 2.94-.41 5.94-1.78 8.7-.71 1.42-2.05 2.48-2.72.66-2.15-5.8-7.02-10.67-6.2-17.51.21-1.78 2.5-4.39-.08-5.14-3.16-.92-4.42 2.27-5 4.86-1.24 5.5-.59 11.19-1.67 16.79-.98 5.12-2.88 8.61-8.15 9.91-6.25 1.54-10.44 6.38-13.4 11.26-2.98 4.93-7.02 6.65-11.8 8-18.94 5.3-19.02 2.59-15.1 23.89.24 1.3.12 2.76.68 3.88 3.08 5.99 6.89 10.73 13.97 13.09 9.63 3.22 18.25-.37 27.05-2.36 5.09-1.15 5.85.61 5.9 4.67.13 10.93.08 21.86.54 32.78.36 8.58.99 17.06.27 25.74-1.06 12.74-2.26 25.39 2.41 38.2 7.54 20.7 14.91 41.21 16.54 63.99 1.7 23.75 3.06 47.53 4.54 71.3.18 2.95-.04 5.98-.46 8.91-.8 5.67-1.84 11.21-8.92 12.69-3.19.67-4.28 3.84-6.07 6.21-3.46 4.6-1.96 7.14 2.94 8.76 3.64 1.21 8.11 1.27 8.46 6.8.06.92 1.64 2.05 2.75 2.56 12.72 5.75 21.04 2.51 27.1-10.37 1.44-3.06 2.38-6.16 2.28-9.57-.09-3.41.5-7.41 2.69-9.37 6.91-6.12 5.3-13.63 4.43-20.98-1.06-8.93-1.04-17.85-1.13-26.79z"
                    fill="#d6a5ff"></path>
            </symbol>
            <symbol id="icon-edit" viewBox="0 0 29.36 29.36">
                <title>icon-edit</title>
                <path
                    d="M13,6.9a.73.73,0,0,0-1,0L2.37,16.52a7,7,0,0,0-1.73,3.7L0,27.37a1.76,1.76,0,0,0,2,2l7.15-.63A7,7,0,0,0,12.83,27l9.63-9.63a.73.73,0,0,0,0-1Z">
                </path>
                <path
                    d="M28.72,8,21.33.63a2.18,2.18,0,0,0-3.07,0L15.58,3.31a.73.73,0,0,0,0,1L25,13.78a.73.73,0,0,0,1,0l2.68-2.68A2.18,2.18,0,0,0,28.72,8Z">
                </path>
            </symbol>
            <symbol id="icon-email" viewBox="0 0 29.78 26.78">
                <title>icon-email</title>
                <path
                    d="M1.44,6.84,13.78,17.66a1.75,1.75,0,0,0,2.22,0L28.34,6.84A3.41,3.41,0,0,0,29.78,4.3V4.23A4.26,4.26,0,0,0,25.53,0H4.26A4.26,4.26,0,0,0,0,4.23V4.3A3.56,3.56,0,0,0,1.44,6.84Z">
                </path>
                <path
                    d="M28.18,11.68l-9.84,8.63a5.31,5.31,0,0,1-6.9,0L1.6,11.68c-.88-.77-1.6-.45-1.6.72V22.55a4.26,4.26,0,0,0,4.26,4.24H25.53a4.26,4.26,0,0,0,4.25-4.24V12.4C29.78,11.23,29.06,10.91,28.18,11.68Z">
                </path>
            </symbol>
            <symbol id="icon-events" viewBox="0 0 32.07 29.74">
                <title>icon-events</title>
                <path
                    d="M27.49,3.74h-1.8V2.26a2.29,2.29,0,0,0-4.58,0V3.74H11V2.26a2.29,2.29,0,0,0-4.58,0V3.74H4.58A4.56,4.56,0,0,0,0,8.25v17a4.56,4.56,0,0,0,4.58,4.51H27.49a4.56,4.56,0,0,0,4.58-4.51v-17A4.56,4.56,0,0,0,27.49,3.74Zm-4,11.91-2.29,2.2a2.8,2.8,0,0,0-.73,2.23l.54,3.1c.12.72-.31,1-1,.69L17.22,22.4a2.91,2.91,0,0,0-2.38,0L12,23.87c-.65.34-1.09,0-1-.69l.54-3.1a2.8,2.8,0,0,0-.73-2.23l-2.29-2.2c-.53-.51-.36-1,.37-1.11l3.16-.45A2.86,2.86,0,0,0,14,12.71l1.42-2.82c.33-.65.86-.65,1.19,0L18,12.71A2.87,2.87,0,0,0,20,14.09l3.16.45C23.86,14.64,24,15.14,23.5,15.65Z">
                </path>
            </symbol>
            <symbol id="icon-expand" viewBox="0 0 30 30">
                <title>icon-expand</title>
                <path
                    d="M25.5,26H18.9a2,2,0,0,0-2,2h0a2,2,0,0,0,2,2H28a2,2,0,0,0,2-2V18.9a2,2,0,0,0-2-2h0a2,2,0,0,0-2,2v6.6A.5.5,0,0,1,25.5,26Z">
                </path>
                <path
                    d="M4.5,4h6.6a2,2,0,0,0,2-2h0a2,2,0,0,0-2-2H2A2,2,0,0,0,0,2v9.1a2,2,0,0,0,2,2H2a2,2,0,0,0,2-2V4.5A.5.5,0,0,1,4.5,4Z">
                </path>
                <path
                    d="M26,4.5v6.6a2,2,0,0,0,2,2h0a2,2,0,0,0,2-2V2a2,2,0,0,0-2-2H18.9a2,2,0,0,0-2,2h0a2,2,0,0,0,2,2h6.6A.5.5,0,0,1,26,4.5Z">
                </path>
                <path
                    d="M4,25.5V18.9a2,2,0,0,0-2-2H2a2,2,0,0,0-2,2V28a2,2,0,0,0,2,2h9.1a2,2,0,0,0,2-2h0a2,2,0,0,0-2-2H4.5A.5.5,0,0,1,4,25.5Z">
                </path>
            </symbol>
            <symbol id="icon-eye">
                <path fill-rule="evenodd" clip-rule="evenodd"
                    d="M20.681 6.829c.113.227.201.465.263.71.07.301.07.615 0 .916-.061.247-.15.487-.263.716-.706 1.53-3.914 6.329-9.684 6.329s-8.978-4.8-9.684-6.329a3.345 3.345 0 01-.263-.716 1.998 1.998 0 010-.916c.06-.246.148-.484.263-.71C2.019 5.299 5.226.5 10.997.5c5.77 0 8.978 4.8 9.684 6.329zM8.055 12.276a5.393 5.393 0 002.942.845l.006-.012a5.345 5.345 0 003.702-1.507A5.034 5.034 0 0016.235 8c0-1.014-.31-2.006-.891-2.849a5.246 5.246 0 00-2.374-1.886 5.425 5.425 0 00-3.054-.285 5.327 5.327 0 00-2.701 1.412A5.075 5.075 0 005.78 7.023c-.2.996-.09 2.027.315 2.962a5.16 5.16 0 001.96 2.291zm6.049-4.288c0 1.679-1.391 3.04-3.107 3.04-1.716 0-3.107-1.361-3.107-3.04 0-1.68 1.39-3.04 3.107-3.04 1.716 0 3.107 1.36 3.107 3.04z"
                    fill="#4D4751"></path>
            </symbol>
            <symbol id="icon-facebook" viewBox="0 0 13.91 29.94">
                <title>icon-facebook</title>
                <path
                    d="M13.37 15h-4.2v15H3V15H0V9.7h3V6.28C3 3.83 4.12 0 9.23 0h4.61v5.15h-3.35a1.27 1.27 0 0 0-1.32 1.44V9.7h4.74z">
                </path>
            </symbol>
            <symbol id="icon-facebookLogo" viewBox="0 0 58 58">
                <path
                    d="M53.85 0H3.15A3.15 3.15 0 0 0 0 3.15v50.7A3.15 3.15 0 0 0 3.15 57h27.3V35H23v-8.67h7.41V20c0-7.37 4.49-11.38 11.06-11.38a62.15 62.15 0 0 1 6.68.38v7.69h-4.54c-3.57 0-4.26 1.69-4.26 4.18v5.5h8.55L46.79 35h-7.44v22h14.5A3.15 3.15 0 0 0 57 53.85V3.15A3.15 3.15 0 0 0 53.85 0z">
                </path>
            </symbol>
            <symbol id="icon-favorite_outline" viewBox="0 0 35.07 29.87">
                <title>icon-favorite_outline</title>
                <path
                    d="M31,4.09a8.31,8.31,0,0,0-11.75-.31l-.31.31a8.8,8.8,0,0,0-1.43,2,8.8,8.8,0,0,0-1.43-2A8.31,8.31,0,0,0,4.31,3.78L4,4.09A9.09,9.09,0,0,0,4,16.61l9.81,10.18A5.1,5.1,0,0,0,21,27l.16-.17L31,16.61A8.87,8.87,0,0,0,31,4.09Z"
                    stroke-miterlimit="10" stroke-width="3"></path>
            </symbol>
            <symbol id="icon-filter" viewBox="0 0 31.9 27.4">
                <title>icon-filter</title>
                <path
                    d="M1.92,5.72H18.1a3.72,3.72,0,0,0,6.38,0H30a1.9,1.9,0,1,0,0-3.81H24.54a3.71,3.71,0,0,0-6.49,0H1.92a1.9,1.9,0,1,0,0,3.81Z">
                </path>
                <path
                    d="M30,11.75H13.77a3.72,3.72,0,0,0-6.33,0H1.92a1.9,1.9,0,1,0,0,3.81H7.34a3.71,3.71,0,0,0,6.54,0H30a1.9,1.9,0,1,0,0-3.81Z">
                </path>
                <path
                    d="M30,21.74H24.53a3.71,3.71,0,0,0-6.44,0H1.92a1.9,1.9,0,1,0,0,3.81H18.09a3.71,3.71,0,0,0,6.43,0H30a1.9,1.9,0,1,0,0-3.81Z">
                </path>
            </symbol>
            <symbol id="icon-gear" viewBox="0 0 29.17 31.99">
                <title>icon-gear</title>
                <path
                    d="M27.29,19l-.05,0a12.22,12.22,0,0,0,0-5.89l.05,0A3.66,3.66,0,0,0,28.66,8a3.8,3.8,0,0,0-5.14-1.34l0,0a13,13,0,0,0-5.13-2.92s0,0,0,0a3.76,3.76,0,0,0-7.52,0s0,0,0,0A13,13,0,0,0,5.7,6.67l-.05,0A3.8,3.8,0,0,0,.51,8,3.66,3.66,0,0,0,1.88,13l.05,0a12.22,12.22,0,0,0,0,5.89l-.05,0A3.66,3.66,0,0,0,.51,24a3.8,3.8,0,0,0,5.14,1.35l.05,0a13,13,0,0,0,5.13,2.92s0,0,0,0a3.76,3.76,0,0,0,7.52,0s0,0,0,0a13,13,0,0,0,5.13-2.92l0,0A3.8,3.8,0,0,0,28.66,24,3.66,3.66,0,0,0,27.29,19Zm-12.71,4.3A7.32,7.32,0,1,1,22,15.94,7.39,7.39,0,0,1,14.59,23.26Z">
                </path>
            </symbol>
            <symbol id="icon-goodMatch" viewBox="0 0 15 10">
                <title>icon-goodMatch</title>
                <path
                    d="M14.422,2.2 L7.458,9.333 C6.582,10.223 5.164,10.223 4.288,9.333 L0.954,5.976 C0.604,5.619 0.604,5.043 0.954,4.686 L1.587,4.042 C1.937,3.687 2.504,3.687 2.855,4.042 L5.529,6.762 C5.705,6.937 5.987,6.937 6.163,6.762 L12.529,0.266 C12.879,-0.089 13.446,-0.089 13.797,0.266 L14.43,0.911 C14.78,1.267 14.78,1.843 14.43,2.2 L14.423,2.2 L14.422,2.2 Z">
                </path>
            </symbol>
            <symbol id="icon-googleLogo" viewBox="0 0 18 18">
                <g fill="none" fill-rule="evenodd">
                    <path
                        d="M17.64 9.205c0-.639-.057-1.252-.164-1.841H9v3.481h4.844a4.14 4.14 0 0 1-1.796 2.716v2.259h2.908c1.702-1.567 2.684-3.875 2.684-6.615z"
                        fill="#4285F4"></path>
                    <path
                        d="M9 18c2.43 0 4.467-.806 5.956-2.18l-2.908-2.259c-.806.54-1.837.86-3.048.86-2.344 0-4.328-1.584-5.036-3.711H.957v2.332A8.997 8.997 0 0 0 9 18z"
                        fill="#34A853"></path>
                    <path
                        d="M3.964 10.71A5.41 5.41 0 0 1 3.682 9c0-.593.102-1.17.282-1.71V4.958H.957A8.996 8.996 0 0 0 0 9c0 1.452.348 2.827.957 4.042l3.007-2.332z"
                        fill="#FBBC05"></path>
                    <path
                        d="M9 3.58c1.321 0 2.508.454 3.44 1.345l2.582-2.58C13.463.891 11.426 0 9 0A8.997 8.997 0 0 0 .957 4.958L3.964 7.29C4.672 5.163 6.656 3.58 9 3.58z"
                        fill="#EA4335"></path>
                </g>
            </symbol>
            <symbol id="icon-hamburger" viewBox="0 0 1792 1792">
                <path
                    d="M1664 1344v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45zm0-512v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45zm0-512v128q0 26-19 45t-45 19h-1408q-26 0-45-19t-19-45v-128q0-26 19-45t45-19h1408q26 0 45 19t19 45z">
                </path>
            </symbol>
            <symbol id="icon-hours" viewBox="0 0 32 32">
                <title>icon-hours</title>
                <path
                    d="M16,0A16,16,0,1,0,32,16,16,16,0,0,0,16,0Zm6.26,22.69a2,2,0,0,1-2.53-.28l-5.07-5a1.92,1.92,0,0,1-.22-.27l0,0-.06-.11a1.87,1.87,0,0,1-.12-.23l0-.06a1.87,1.87,0,0,1-.09-.3v0a1.9,1.9,0,0,1,0-.33v0s0,0,0-.06V8.22a1.9,1.9,0,1,1,3.81,0V15a.5.5,0,0,0,.15.35l4.44,4.42A1.91,1.91,0,0,1,22.26,22.69Z">
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
            <symbol id="icon-link" viewBox="0 0 31.86 30.8">
                <title>icon-link</title>
                <path
                    d="M20.42,18.79a2.59,2.59,0,0,0-4.24-2.2,3.63,3.63,0,0,1-4.86-.21L6.23,11.3a3.6,3.6,0,0,1,5.1-5.09l.19.19a2.46,2.46,0,0,0,.37.3l.16.1.1.06.13.06.38.14a4.17,4.17,0,0,0,.71.1,2.55,2.55,0,0,0,1.82-.75,2.59,2.59,0,0,0,0-3.62L15,2.56A8.77,8.77,0,0,0,2.57,15L7.65,20a8.85,8.85,0,0,0,11.86.51A2.55,2.55,0,0,0,20.42,18.79Z">
                </path>
                <path
                    d="M29.29,15.85,24.2,10.78a8.75,8.75,0,0,0-11.81-.55,2.58,2.58,0,0,0,3.3,4,3.6,3.6,0,0,1,4.85.23l5.09,5.08a3.6,3.6,0,0,1-5.1,5.09l-.2-.2a2.65,2.65,0,0,0-3.66,0,2.58,2.58,0,0,0,0,3.65l.2.2A8.77,8.77,0,1,0,29.29,15.85Z">
                </path>
            </symbol>
            <symbol id="icon-location" viewBox="0 0 24.76 31.86">
                <title>icon-location</title>
                <path
                    d="M12.38,0A12.47,12.47,0,0,0,0,12.56,12.61,12.61,0,0,0,4.21,22,19.12,19.12,0,0,1,7,25.36H7L9.7,30c1.47,2.53,3.88,2.53,5.36,0l2.68-4.61A19.25,19.25,0,0,1,20.55,22a12.6,12.6,0,0,0,4.21-9.43A12.47,12.47,0,0,0,12.38,0Zm0,18.49a6,6,0,0,1,0-12,6,6,0,0,1,0,12Z">
                </path>
            </symbol>
            <symbol id="icon-locationArrow" viewBox="0 0 88 88">
                <path
                    d="M87.12.88A3 3 0 0 0 85 0a3 3 0 0 0-1.09.2l-82 32a3 3 0 0 0-.19 5.51l33 15.54 15.54 33A3 3 0 0 0 53 88h.14a3 3 0 0 0 2.66-1.9l32-82a3 3 0 0 0-.68-3.22zM52.83 79.94l-14-29.79a2 2 0 0 0-1-1l-29.79-14L81.48 6.52z">
                </path>
            </symbol>
            <symbol id="icon-lock" viewBox="0 0 26.74 31.99">
                <title>icon-lock</title>
                <path
                    d="M4.43,11.79H8a.72.72,0,0,0,.72-.73V9.81a4.64,4.64,0,1,1,9.28,0v1.26a.72.72,0,0,0,.72.73h3.58a.72.72,0,0,0,.72-.73V9.81A9.74,9.74,0,0,0,13.37,0,9.75,9.75,0,0,0,3.71,9.81v1.26A.72.72,0,0,0,4.43,11.79Z">
                </path>
                <path
                    d="M22.44,15.43H4.3A4.34,4.34,0,0,0,0,19.8v7.82A4.35,4.35,0,0,0,4.3,32H22.44a4.34,4.34,0,0,0,4.3-4.37V19.8A4.34,4.34,0,0,0,22.44,15.43Z">
                </path>
            </symbol>
            <symbol id="icon-magnifyingGlass" viewBox="0 0 70.2 67.8">
                <path
                    d="M7.5 28c-.8 0-1.5-.7-1.5-1.5C6 15.2 15.2 6 26.5 6c.8 0 1.5.7 1.5 1.5S27.3 9 26.5 9C16.9 9 9 16.9 9 26.5c0 .8-.7 1.5-1.5 1.5z">
                </path>
                <path
                    d="M69.7 65.2L46.6 42.4c-.1-.1-.2-.1-.3-.2C49.9 37.8 52 32.1 52 26 52 11.7 40.3 0 26 0S0 11.7 0 26s11.7 26 26 26c7.2 0 13.6-2.9 18.3-7.6 0 .1.1.1.1.2l23.2 22.8c.3.3.7.4 1.1.4.4 0 .8-.1 1.1-.4.5-.7.5-1.6-.1-2.2zM26 49C13.3 49 3 38.7 3 26S13.3 3 26 3s23 10.3 23 23-10.3 23-23 23z">
                </path>
            </symbol>
            <symbol id="icon-menu" viewBox="0 0 31.98 31.1">
                <title>menu</title>
                <path d="M3.54,7.11h24.9a3.55,3.55,0,0,0,0-7.11H3.54A3.55,3.55,0,0,0,3.54,7.11Z"></path>
                <path d="M28.44,12H3.54a3.55,3.55,0,0,0,0,7.11h24.9A3.55,3.55,0,0,0,28.44,12Z"></path>
                <path d="M28.44,24H3.54a3.55,3.55,0,0,0,0,7.11h24.9A3.55,3.55,0,0,0,28.44,24Z"></path>
            </symbol>
            <symbol id="icon-pause" viewBox="0 0 32 32">
                <title>icon-pause</title>
                <path d="M4 4h10v24H4zm14 0h10v24H18z"></path>
            </symbol>
            <symbol id="icon-paw" viewBox="0 0 31.98 28.39">
                <title>icon-paw</title>
                <ellipse cx="15.99" cy="19.95" rx="8.6" ry="8.44"></ellipse>
                <ellipse cx="21.08" cy="3.54" rx="3.6" ry="3.54"></ellipse>
                <ellipse cx="10.9" cy="3.54" rx="3.6" ry="3.54"></ellipse>
                <ellipse cx="28.38" cy="11.26" rx="3.6" ry="3.54"></ellipse>
                <ellipse cx="3.6" cy="11.26" rx="3.6" ry="3.54"></ellipse>
            </symbol>
            <symbol id="icon-phone" viewBox="0 0 25.9 26.34">
                <title>icon-phone</title>
                <path
                    d="M24.63,24.44a3.93,3.93,0,0,0,.44-5.31c-.66-.81-1.45-1.54-2.18-2.29A4.73,4.73,0,0,0,19.27,15,5,5,0,0,0,16.56,16a4,4,0,0,0-1,1.06c-.25.4-.43.82-1,.66-.81-.23-1.67-1.53-2.25-2.1s-1-1-1.44-1.49c-.76-.81-1.54-1.6-2.27-2.44-.3-.35-.58-.74-.25-1.19s.77-.38,1.09-.6a3.42,3.42,0,0,0,1-1.18c1.7-3.06-.65-6.45-3.31-8a4.16,4.16,0,0,0-5.48.73A8.68,8.68,0,0,0,.09,7.86c.42,3,2.37,4.85,4.29,6.91C5.6,16.08,6.8,17.42,8.05,18.7,9.67,20.36,11.33,22,13,23.61,15.88,26.48,21.43,27.59,24.63,24.44Z">
                </path>
            </symbol>
            <symbol id="icon-photo" viewBox="0 0 31.98 28.39">
                <title>icon-photo</title>
                <path
                    d="M27.42,4.33H22.59a1.47,1.47,0,0,1-1.14-.65L20,1.29A3,3,0,0,0,17.75,0H10.41A2.94,2.94,0,0,0,8.13,1.29L6.72,3.68a1.47,1.47,0,0,1-1.14.65h-1A4.54,4.54,0,0,0,0,8.82V23.9a4.54,4.54,0,0,0,4.57,4.49H27.42A4.54,4.54,0,0,0,32,23.9V8.82A4.54,4.54,0,0,0,27.42,4.33ZM14.22,24.67a9.29,9.29,0,0,1-9.36-9.2,9.36,9.36,0,0,1,18.73,0A9.29,9.29,0,0,1,14.22,24.67ZM27,11.44a1.88,1.88,0,1,1,1.91-1.88A1.89,1.89,0,0,1,27,11.44Z">
                </path>
                <ellipse cx="14.22" cy="15.47" rx="5.56" ry="5.46"></ellipse>
            </symbol>
            <symbol id="icon-pinterest" viewBox="0 0 23.18 29.94">
                <title>icon-pinterest</title>
                <path
                    d="M13.9 21.64a4.93 4.93 0 0 1-4.2-2.14s-1 4-1.21 4.73a18.35 18.35 0 0 1-3.1 5.63.23.23 0 0 1-.41-.1A19.26 19.26 0 0 1 5 23.22l2.21-9.37a6.59 6.59 0 0 1-.55-2.72c0-2.55 1.48-4.45 3.32-4.45a2.3 2.3 0 0 1 2.32 2.58c0 1.57-1 3.93-1.52 6.1a2.66 2.66 0 0 0 2.71 3.31c3.26 0 5.45-4.18 5.45-9.14 0-3.77-2.54-6.59-7.16-6.59a8.15 8.15 0 0 0-8.47 8.24 5 5 0 0 0 1.13 3.37.84.84 0 0 1 .25 1c-.08.31-.27 1.08-.35 1.38a.59.59 0 0 1-.86.43C1.12 16.33 0 13.7 0 10.74 0 5.86 4.12 0 12.29 0c6.57 0 10.89 4.75 10.89 9.85 0 6.75-3.75 11.79-9.28 11.79z">
                </path>
            </symbol>
            <symbol id="icon-play" viewBox="0 0 27.77 25.01">
                <title>icon-play</title>
                <path
                    d="M25.13 9.61L6.27.67A4 4 0 0 0 .06 4.63v15.75a4 4 0 0 0 6.22 4l18.86-8.92c3.52-1.62 3.52-4.15-.01-5.85z">
                </path>
            </symbol>
            <symbol id="icon-pointer" viewBox="0 0 30.1 30.2">
                <path
                    d="M18.2 29.8L29.4 3.1C31 .2 30-.9 27.1.8L.3 11.9c-.6.3-.3 1.2.3 1.2l12.7 3.1c.3.1.6.3.6.6L17 29.5c0 .7.9.9 1.2.3z">
                </path>
            </symbol>
            <symbol id="icon-print" viewBox="0 0 31.89 31.38">
                <title>icon-print</title>
                <path d="M16,21"></path>
                <path d="M15.92,21.64"></path>
                <path
                    d="M27.59,9.33H4.3A4.34,4.34,0,0,0,0,13.7v6.81a4.35,4.35,0,0,0,4.3,4.37H5V27A4.37,4.37,0,0,0,9.3,31.38H22.66A4.37,4.37,0,0,0,27,27V24.88h.61a4.34,4.34,0,0,0,4.3-4.37V13.7A4.34,4.34,0,0,0,27.59,9.33ZM23,26.48V27a.37.37,0,0,1-.32.39H9.3A.38.38,0,0,1,9,27V21.17a.37.37,0,0,1,.32-.39h.14a.75.75,0,0,1,.29-.06h12.5a.75.75,0,0,1,.29.06h.13a.38.38,0,0,1,.32.39v5.3Z">
                </path>
                <path
                    d="M23.89,5.68H7.39a.75.75,0,0,1-.75-.75V2.84A2.84,2.84,0,0,1,9.48,0H21.8a2.84,2.84,0,0,1,2.84,2.84V4.93A.75.75,0,0,1,23.89,5.68Z">
                </path>
            </symbol>
            <symbol id="icon-private" viewBox="0 0 31.98 27.88">
                <title>icon-private</title>
                <path d="M10.3,13.94a5.83,5.83,0,0,0,0,.62l6.32-6.32a5.67,5.67,0,0,0-6.36,5.7Z"></path>
                <path
                    d="M16,19.68a5.71,5.71,0,0,0,5.69-5.73,5.84,5.84,0,0,0,0-.63l-6.32,6.32A5.69,5.69,0,0,0,16,19.68Z">
                </path>
                <path
                    d="M11.12,20.79h0l1.94-1.94h0L20.89,11h0l1.94-1.94h0l3.55-3.55h0l3.14-3.14a1.4,1.4,0,0,0-2-2L2.46,25.49a1.4,1.4,0,1,0,2,2L7.9,24h0Z">
                </path>
                <path
                    d="M31.9,13.18A5.81,5.81,0,0,0,31.48,12,19.51,19.51,0,0,0,28,7l-4.09,4.09A8.42,8.42,0,0,1,16,22.38a8.27,8.27,0,0,1-2.88-.53l-3.2,3.2A15.3,15.3,0,0,0,16,26.3c9.23,0,14.36-7.91,15.49-10.43a5.86,5.86,0,0,0,.42-1.18A3.39,3.39,0,0,0,31.9,13.18Z">
                </path>
                <path
                    d="M8.11,16.79A8.43,8.43,0,0,1,16,5.5,8.26,8.26,0,0,1,18.88,6l3.2-3.2A15.29,15.29,0,0,0,16,1.58C6.76,1.58,1.63,9.49.5,12a5.58,5.58,0,0,0-.42,1.17,3.39,3.39,0,0,0,0,1.51A5.62,5.62,0,0,0,.5,15.87a19.48,19.48,0,0,0,3.52,5Z">
                </path>
            </symbol>
            <symbol id="icon-reporting" viewBox="0 0 30.67 31.98">
                <title>icon-reporting</title>
                <path
                    d="M27.18,7.74a3.48,3.48,0,0,0-3.49,3.45V28.54a3.49,3.49,0,0,0,7,0V11.19A3.48,3.48,0,0,0,27.18,7.74Z">
                </path>
                <path d="M15.31,0a3.48,3.48,0,0,0-3.49,3.45V28.54a3.49,3.49,0,0,0,7,0V3.45A3.48,3.48,0,0,0,15.31,0Z">
                </path>
                <path
                    d="M3.49,14.17A3.48,3.48,0,0,0,0,17.61V28.54a3.49,3.49,0,0,0,7,0V17.61A3.48,3.48,0,0,0,3.49,14.17Z">
                </path>
            </symbol>
            <symbol id="icon-rss" viewBox="0 0 29.78 31.06">
                <title>icon-rss</title>
                <path
                    d="M4.259 23.467c-2.35 0-4.259 1.917-4.259 4.252 0 2.349 1.909 4.244 4.259 4.244 2.358 0 4.265-1.895 4.265-4.244-0-2.336-1.907-4.252-4.265-4.252zM0.005 10.873v6.133c3.993 0 7.749 1.562 10.577 4.391 2.825 2.822 4.384 6.595 4.384 10.603h6.16c-0-11.651-9.478-21.127-21.121-21.127zM0.012 0v6.136c14.243 0 25.836 11.604 25.836 25.864h6.152c0-17.64-14.352-32-31.988-32z">
                </path>
            </symbol>
            <symbol id="icon-save" viewBox="0 0 31.98 29.74">
                <title>icon-save</title>
                <path
                    d="M29.7,20a2.29,2.29,0,0,0-2.29,2.3v2.11a.77.77,0,0,1-.76.77H5.33a.77.77,0,0,1-.76-.77V22.27a2.28,2.28,0,1,0-4.57,0v2.88a4.6,4.6,0,0,0,4.57,4.6H27.41A4.6,4.6,0,0,0,32,25.14V22.27A2.29,2.29,0,0,0,29.7,20Z">
                </path>
                <path
                    d="M14.74,21.38a1.61,1.61,0,0,0,2.5,0l7.65-8.83c.93-1.12.5-2-.95-2H21.32a.77.77,0,0,1-.76-.77V1.53A1.53,1.53,0,0,0,19,0H12.95a1.53,1.53,0,0,0-1.52,1.53V9.74a.77.77,0,0,1-.76.77H8c-1.45,0-1.88.92-1,2Z">
                </path>
            </symbol>
            <symbol id="icon-share_outline" viewBox="0 0 37.43 22.07">
                <path
                    d="M2.3 22.07a2 2 0 0 1-1.5-.6 2.29 2.29 0 0 1-.8-1.7 13.07 13.07 0 0 1 6.5-11.5 22.87 22.87 0 0 1 11.9-3.3h2v-2.3a3 3 0 0 1 1.4-2.4c.9-.5 2.1-.3 3.4.5l10.6 7.3a2.5 2.5 0 0 1 1.3 1.4 3.62 3.62 0 0 1 .2 2.5 3.33 3.33 0 0 1-1.6 1.9l-10.6 7.2a3.4 3.4 0 0 1-3.4.6 2.58 2.58 0 0 1-1.3-2.4v-2.1h-.6c-8.7 0-11.7 0-15.5 4a2.59 2.59 0 0 1-1.7.9h-.3zm16.1-15.1c-6.6 0-16.4 3.4-16.4 12.8a.35.35 0 0 0 .1.2.44.44 0 0 0 .3.1h.1c.1 0 .2 0 .2-.1l.1-.1c4.4-4.7 7.9-4.7 17-4.7h2.6v4.1a.68.68 0 0 0 .2.6 1.39 1.39 0 0 0 1.3-.4l10.8-7.3a1.85 1.85 0 0 0 .7-.8 1.15 1.15 0 0 0-.1-1l-.1-.3a1.09 1.09 0 0 0-.4-.2l-.1-.1L24 2.47a1.85 1.85 0 0 0-1.4-.4.91.91 0 0 0-.3.7 27.26 27.26 0 0 0 0 3.1l.1 1.1h-4z">
                </path>
            </symbol>
            <symbol id="icon-sizeExtraLarge" viewBox="0 0 55.32 29.77">
                <title>icon-sizeExtraLarge</title>
                <path
                    d="M19.43,15.07a.44.44,0,0,1,0-.49L27.75,1.41A.88.88,0,0,0,27,.06H20.31a1.33,1.33,0,0,0-1.13.64L16.85,4.51l-2.41,4.6a.44.44,0,0,1-.78,0L11.29,4.6,8.91.7A1.33,1.33,0,0,0,7.78.06H1.09A.88.88,0,0,0,.34,1.41L8.66,14.58a.44.44,0,0,1,0,.49L.23,27.71a1.33,1.33,0,0,0,1.1,2.06H7.27a1.33,1.33,0,0,0,1.1-.59l2.32-3.45,3-5a.44.44,0,0,1,.76,0l2.93,4.89,2.36,3.53a1.33,1.33,0,0,0,1.1.59h6.77a.88.88,0,0,0,.74-1.38Z">
                </path>
                <path
                    d="M54,22.58H41.54a.44.44,0,0,1-.44-.44V1.33A1.33,1.33,0,0,0,39.77,0H34a1.33,1.33,0,0,0-1.33,1.33V28.39A1.33,1.33,0,0,0,34,29.71H54a1.33,1.33,0,0,0,1.33-1.33V23.91A1.33,1.33,0,0,0,54,22.58Z">
                </path>
            </symbol>
            <symbol id="icon-sizeLarge" viewBox="0 0 22.67 29.77">
                <title>icon-sizeLarge</title>
                <path
                    d="M8.42,1.31V22.18a.44.44,0,0,0,.44.44H21.36a1.31,1.31,0,0,1,1.31,1.31v4.52a1.31,1.31,0,0,1-1.31,1.31h-20A1.33,1.33,0,0,1,0,28.44V1.31A1.31,1.31,0,0,1,1.31,0h5.8A1.31,1.31,0,0,1,8.42,1.31Z">
                </path>
            </symbol>
            <symbol id="icon-sizeMedium" viewBox="0 0 33.22 29.77">
                <title>icon-sizeMedium</title>
                <path
                    d="M24.88,13.25A.44.44,0,0,0,24.1,13s-6.34,7.37-6.83,7.86a1.5,1.5,0,0,1-1.49,0C15.3,20.34,9.12,13,9.12,13a.44.44,0,0,0-.78.28V28.46A1.31,1.31,0,0,1,7,29.77H1.31A1.31,1.31,0,0,1,0,28.46V1.31A1.31,1.31,0,0,1,1.31,0H8.16a1.31,1.31,0,0,1,1,.51l7.08,9.12a.44.44,0,0,0,.7,0L24.06.51a1.31,1.31,0,0,1,1-.51H31.9a1.31,1.31,0,0,1,1.31,1.31V28.46a1.31,1.31,0,0,1-1.31,1.31H26.19a1.31,1.31,0,0,1-1.31-1.31Z">
                </path>
            </symbol>
            <symbol id="icon-sizeSmall" viewBox="0 0 24.69 29.82">
                <title>icon-sizeSmall</title>
                <path
                    d="M19.93,7.27c-.62.79-1.29,1-1.81.65a11.15,11.15,0,0,0-5.8-1.38c-1.95,0-3.85.61-3.85,2.11,0,1.95,1.91,2.23,4.7,2.51,5.64.61,11.52,2.88,11.52,9.41s-6.08,9.21-12.45,9.25C7.49,29.86,4,29.09.37,25.66a1.24,1.24,0,0,1-.06-1.71L3.14,20.7a1.24,1.24,0,0,1,1.7-.16A11.51,11.51,0,0,0,12.28,23c2.64,0,4.46-.93,4.46-2.51,0-1.42-1.62-2.31-4.74-2.6C5.75,17.28.37,15.69.44,8.52A8.57,8.57,0,0,1,8,.32C13.88-.47,18.1.16,21.82,2.6a1.26,1.26,0,0,1,.33,1.84Z">
                </path>
            </symbol>
            <symbol id="icon-strongMatch" viewBox="0 0 19 10">
                <title>icon-strongMatch</title>
                <path
                    d="M2.163,4.042 L4.837,6.762 L4.873,6.79 L7.08,9.012 L6.767,9.333 C5.891,10.223 4.473,10.223 3.597,9.333 L0.263,5.976 C-0.087,5.619 -0.087,5.043 0.263,4.686 L0.896,4.042 C1.246,3.687 1.813,3.687 2.164,4.042 L2.163,4.042 Z M18.105,0.266 L18.738,0.911 C19.088,1.267 19.088,1.843 18.738,2.2 L18.731,2.2 L11.767,9.333 C10.891,10.223 9.473,10.223 8.597,9.333 L5.262,5.976 C4.912,5.619 4.912,5.043 5.262,4.686 L5.895,4.042 C6.245,3.687 6.812,3.687 7.163,4.042 L9.837,6.762 C10.013,6.937 10.295,6.937 10.471,6.762 L16.837,0.266 C17.187,-0.089 17.754,-0.089 18.105,0.266 L18.105,0.266 Z M13.105,0.266 L13.738,0.911 C14.088,1.267 14.088,1.843 13.738,2.2 L13.731,2.2 L10.15,5.867 L8.246,3.93 L11.837,0.266 C12.187,-0.089 12.754,-0.089 13.105,0.266 Z">
                </path>
            </symbol>
            <symbol id="icon-trash" viewBox="0 0 27.3 30.43">
                <title>icon-trash</title>
                <path d="M3.64,25.87c.54,2.72,2.08,4.57,4.61,4.57H19c2.54,0,4.08-1.51,4.61-4.57l2.05-14.58H1.6Z"></path>
                <path
                    d="M24.55,2.63H17.64a.43.43,0,0,0,0,0V1.49A1.39,1.39,0,0,0,16.38,0H10.87A1.39,1.39,0,0,0,9.6,1.49v1.1a.43.43,0,0,0,0,0H2.75A2.8,2.8,0,0,0,0,5.48V7.57a.74.74,0,0,0,.73.75H26.58a.74.74,0,0,0,.73-.75V5.48A2.8,2.8,0,0,0,24.55,2.63Z">
                </path>
            </symbol>
            <symbol id="icon-twitter" viewBox="0 0 29.94 24.33">
                <title>icon-twitter</title>
                <path
                    d="M26.88 6.06v.79c0 8.12-6.18 17.48-17.48 17.48A17.38 17.38 0 0 1 0 21.57a13 13 0 0 0 1.47.08A12.31 12.31 0 0 0 9.09 19a6.15 6.15 0 0 1-5.74-4.27 6.31 6.31 0 0 0 1.15.11 6.19 6.19 0 0 0 1.62-.22 6.15 6.15 0 0 1-4.93-6v-.06A6.13 6.13 0 0 0 4 9.32a6.15 6.15 0 0 1-1.9-8.2 17.43 17.43 0 0 0 12.65 6.42 6.15 6.15 0 0 1 10.47-5.6A12.26 12.26 0 0 0 29.11.45a6.16 6.16 0 0 1-2.7 3.4 12.26 12.26 0 0 0 3.53-1 12.46 12.46 0 0 1-3.06 3.21z">
                </path>
            </symbol>
            <symbol id="icon-video" viewBox="0 0 31.98 28.9">
                <title>icon-video</title>
                <path
                    d="M21,13.37,14,10.05a1.5,1.5,0,0,0-2.31,1.47v5.85A1.5,1.5,0,0,0,14,18.84L21,15.53C22.31,14.94,22.31,14,21,13.37Z">
                </path>
                <path
                    d="M27.42,0H4.57A4.58,4.58,0,0,0,0,4.57V24.33A4.58,4.58,0,0,0,4.57,28.9H27.42A4.58,4.58,0,0,0,32,24.33V4.57A4.58,4.58,0,0,0,27.42,0ZM16,24a9.6,9.6,0,1,1,9.6-9.59A9.59,9.59,0,0,1,16,24Z">
                </path>
            </symbol>
            <symbol id="icon-view" viewBox="0 0 31.98 24.72">
                <title>icon-view</title>
                <ellipse cx="15.99" cy="12.36" rx="4.97" ry="5.01"></ellipse>
                <path
                    d="M31.9,11.6a5.81,5.81,0,0,0-.42-1.17C30.35,7.91,25.22,0,16,0S1.63,7.91.5,10.43A5.58,5.58,0,0,0,.08,11.6a3.39,3.39,0,0,0,0,1.51A5.62,5.62,0,0,0,.5,14.29C1.63,16.81,6.76,24.72,16,24.72s14.36-7.91,15.49-10.43a5.86,5.86,0,0,0,.42-1.18A3.39,3.39,0,0,0,31.9,11.6ZM16,20.8a8.44,8.44,0,1,1,8.38-8.44A8.42,8.42,0,0,1,16,20.8Z">
                </path>
            </symbol>
            <symbol id="icon-youtube" viewBox="0 0 38.86 29.48">
                <title>icon-youtube</title>
                <path
                    d="M38.46 6.37s-.4-2.88-1.54-4.15A5.14 5.14 0 0 0 33 .47C27.61.07 19.43 0 19.43 0s-8.17.07-13.6.47a5.41 5.41 0 0 0-3.89 1.74C.74 3.48.4 6.37.4 6.37A67 67 0 0 0 0 13.2v3.15a64.89 64.89 0 0 0 .4 6.77S.8 26 1.94 27.27c1.47 1.68 3.42 1.61 4.29 1.81 3.08.34 13.2.4 13.2.4s8.17 0 13.6-.47a5.41 5.41 0 0 0 3.89-1.74c1.14-1.27 1.54-4.15 1.54-4.15a66.61 66.61 0 0 0 .4-6.77V13.2a67 67 0 0 0-.4-6.83zM14.74 22.51V8l12.73 7.44z">
                </path>
            </symbol>
        </svg>
    </div>



    <script src="${pageContext.request.contextPath}/views/catInfo/files/jquery.min.js"></script>

<script>

/* document.getElementById("gender").setAttribute('value','My default value'); */
	
	let breed;
	let age;
	let size;
	
 	$(".dropdown-menu li").on("click", function(){
 		/* console.log("hello"); */
		$(".dropdown-menu li").removeClass('selected');
		$(this).addClass('selected');
		$(this).parents('.dropdown').find('input').attr('value', $(this).attr('value'));
		/* var value = $('.dropdown-menu li.selected').attr('value'); */
		/* 
		  $.ajax({
			     url: "${pageContext.request.contextPath}/CatInfoServlet",
	              data: {
	            	"breed":breed,
	                "value":value
	                
	              },
	              type: "POST",
	              success: function () {
	               $(".animalSearchBody").load("http://localhost:8081/Adopets/views/catInfo/My_search.jsp .animalSearchBody");
 	               $(".count").load("http://localhost:8081/Adopets/views/catInfo/My_search.jsp .count");
 	               $("#	").load("http://localhost:8081/Adopets/views/catInfo/My_search.jsp #spage");
	               $("#spage").css("border", "1px solid red");
	               }
		  }) */
	});
 	//用js判斷EL有沒有值，有的話再回填標籤
 	$(document).ready(function() {
 		//品種
 		var breedtf = `${catInfoVO.breed == null}`
	 	if (breedtf == "false") {
	 		$(".breed > .select > span").text(`${catInfoVO.breed}`);
	 	 	$(".breed > input").attr('value', `${catInfoVO.breed}`);
	 	}
 		//年齡
 		let agetf = `${catInfoVO.age == null}`
 		let age;
	 	if (agetf == "false") {
	 		let num = `${catInfoVO.age}`;
	 		switch (num) {	 		
		 		case "0":
		 			age = "幼貓";
		 			break;
		 		case "1":
		 			age = "小貓";
		 			break;
		 		case "2":
		 			age = "成貓";
		 			break;
		 		case "3":
		 			age = "老貓";
		 			break;
	 		}
	 		$(".age > .select > span").text(age);
	 	 	$(".age > input").attr('value', age);
	 	}
 		//性別
 		var hasSex = `${catInfoVO.sex == null}`
	 	if (hasSex == "false") {
	 		$(".sex > .select > span").text(`${catInfoVO.sex}`);
	 	 	$(".sex > input").attr('value', `${catInfoVO.sex}`);
	 	}
 		//大小
 		var hasSize = `${catInfoVO.size == null}`
	 	if (hasSize == "false") {
	 		$(".size > .select > span").text(`${catInfoVO.size}`);
	 	 	$(".size > input").attr('value', `${catInfoVO.size}`);
	 	}
 		//毛色
 		var hasCoatColor = `${catInfoVO.coatColor == null}`
	 	if (hasCoatColor == "false") {
	 		$(".coatcolor > .select > span").text(`${catInfoVO.coatColor}`);
	 	 	$(".coatcolor > input").attr('value', `${catInfoVO.coatColor}`);
	 	}
 		//在收容所天數
 		var hasShelter = `${catInfoVO.createDate == null}`
	 	if (hasShelter == "false") {
	 		let beforeString = `${catInfoVO.createDate}`; //EL取到String
	 		let now = new Date().getTime();//js的1970毫秒(number)
	 		let day = 24 * 3600 * 1000;
	 		let diff = now - Date.parse(beforeString);
	 		let diffday = parseInt(diff / day);
	 		
	 		$(".shelter > .select > span").text(diffday);
	 	 	$(".shelter > input").attr('value', diffday);
	 	}
	});
 	//我的最愛效果
 	$(".petCard-favoriteBtn > button").on("click", function(){
 		/* console.log("favorite btn"); */
 		$(this).toggleClass("s-favoriteBtn_favorited s-favoriteBtn_sessionFavorited");
 		
 	})

	
	</script>
    <!-- pkg:dotcom-search-web -->
    <!-- <script src="./Cats for Adoption Near New York City, NY _ Petfinder_files/common.1797671f.js"></script> -->
    <!-- <script src="./Cats for Adoption Near New York City, NY _ Petfinder_files/dotcom-search-web.1797671f.js"></script> -->
<!-- <link rel="prefetch"
        href="https://www.petfinder.com/assets/www/scripts/vendors_dotcom-animal-detail-web_dotcom-happy-tails-submission-web_dotcom-legacy.1797671f.js">
    <link rel="prefetch" href="https://www.petfinder.com/assets/www/scripts/dotcom-animal-detail-web.1797671f.js">
    <link href="./Cats for Adoption Near New York City, NY _ Petfinder_files/css" rel="stylesheet"> -->
    
    <script src="${pageContext.request.contextPath}/views/catInfo/files/my_search.js"></script>
    <%-- <script src="${pageContext.request.contextPath}/views/catInfo/files/my_search2.js"></script> --%>


</body>

</html>