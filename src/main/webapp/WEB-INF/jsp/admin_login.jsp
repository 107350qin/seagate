<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_com_login.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<form action="${pageContext.request.contextPath}/admin/loginDo" method="post">
<div id="one">
    <div id="center">
        <div id="login" style="height:300px;margin-top:100px;border-radius:8px;">
            <div id="top_text">
                <div id="text9" style="margin-left:66px;">
                    <span style="font-weight:bold;">Admin</span>
                </div>
            </div>
            <div id="name">
                <div id="u14_png">
                    <img src="${pageContext.request.contextPath}/img/sys/u14.png" class="u14_png">
                </div>
                <div id="text11" style="margin-left: 26px;margin-top:-33px;">
                    <input id="user" name="username" type="text" placeholder="账号">
                </div>
            </div>
            <div id="password">
                <div id="u13_png">
                    <img src="${pageContext.request.contextPath}/img/sys/u13.png" class="u13_png">
                </div>
                <div id="text12" style="margin-left: 26px;margin-top:-33px;">
                    <input id="password_text" name="password" type="password" placeholder="密码">
                </div>
            </div>
           
            <div id="check" style="margin-top:50px;">
                <input type="submit" value="登录" class="submit">
            </div>
        </div>
    </div>
</div>
</form>
<%@ include file="./footer.jsp" %>
</body>
</html>