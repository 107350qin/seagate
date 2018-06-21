<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_com_login.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/user_loginRemember.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<form action="${pageContext.request.contextPath}/user/loginDo" method="post">
<div id="one">
    <div id="center">
        <div id="login">
            <div id="top_text">
                <div id="text9">
                    <a>个人用户</a>
                </div>
                <div id="text10">
                    <a href="${pageContext.request.contextPath}/com/login">企业用户</a>
                </div>
            </div>
            <div id="name">
                <div id="u14_png">
                    <img src="${pageContext.request.contextPath}/img/sys/u14.png" class="u14_png">
                </div>
                <div id="text11">
                    <input style="margin:-33px 40px;" id="user" name="phone_or_email" type="text" placeholder="手机号或邮箱">
                </div>
            </div>
            <div id="password">
                <div id="u13_png">
                    <img src="${pageContext.request.contextPath}/img/sys/u13.png" class="u13_png">
                </div>
                <div id="text12">
                    <input style="margin:-33px 40px;" id="password_text" name="u_password" type="password" placeholder="密码">
                </div>
            </div>
            <div id="check">
                <div id="check1">
                    <input onclick="remember()" type="checkbox" id="haha" name="remenberPassword" class="check_1" />
                    <label for="haha" class="text13">记住密码</label>
                </div>
                <div id="check2">
                   
                    <a href="">忘记密码？</a>
                </div>
            </div>
            <div id="login1">
                <input type="submit" value="登录" class="submit">
            </div>
            <a id="text14" href="${pageContext.request.contextPath}/user/reg">立即注册>></a>
        </div>
    </div>
</div>
</form>
<%@ include file="./footer.jsp" %>
</body>
</html>