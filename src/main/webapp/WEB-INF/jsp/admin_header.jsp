<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
            <a href="">安卓版</a>&nbsp;&nbsp;&nbsp;&nbsp;
            <a href="">iPhone版</a>
            <div class="header-inner-right">
                <span>${ CUR_ADMIN.username }，欢迎您！</span>&nbsp;&nbsp;
                <a href="${pageContext.request.contextPath}/admin/cancel">退出</a>
            </div>
        </div>
    </div>

    <div class="neck">
        <div class="top">
            <img src="${pageContext.request.contextPath}/img/sys/logo.png" alt="">
            <form action="${pageContext.request.contextPath}/admin/search" method="post">
                <input placeholder=" 输入关键字搜索讯息、课程" type="text" name="keyword">
                <input type="submit" value="搜索">
            </form>
        </div>
    </div>
</body>
</html>