<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_header.css">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<title>Insert title here</title>
</head>
<body>
<div class="header">
        <div class="header-inner">
            <a>安卓版</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a>iPhone版</a>
            <div class="header-inner-right">
            	<c:if test="${ CUR_USER!=null }">
	                <span>${ CUR_USER.u_name}，欢迎您！</span>&nbsp;&nbsp;
	                <a href="">消息（0）</a>
	                <span> | </span>
	                <a href="${pageContext.request.contextPath}/user/personalCenter">个人中心</a>
	                <span> | </span>
	                <a href="${pageContext.request.contextPath}/user/cancel">退出</a>
            	</c:if>
            	<c:if test="${ CUR_USER==null }">
	                <a href="${pageContext.request.contextPath}/user/login">登陆</a>
	                <span> | </span>
	                <a href="${pageContext.request.contextPath}/user/reg">注册</a>
            	</c:if>
            </div>
        </div>
    </div>

    <div class="neck">
        <div class="top">
            <img src="${pageContext.request.contextPath}/img/sys/logo.png" alt="">
            <form action="${pageContext.request.contextPath}/user/search" method="get">
                <input placeholder=" 输入关键字搜索" type="text" name="keyword" id="">
                <input type="submit" value="搜索">
            </form>
        </div>
    </div>
</body>
</html>