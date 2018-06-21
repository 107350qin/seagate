<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_com_login.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.cookie.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/com_loginRemember.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<div id="one">
    <div id="center">
        <div id="login">

            <div id="top_text">
                <div id="text9" style="background-color: #CCCCCC;">
                    <span>个人用户</span>
                </div>
                <div id="text10" style="background-color: #ffffff;">
                    <span>企业用户</span>
                </div>
            </div>
            <form action="${pageContext.request.contextPath}/com/loginDo" method="post">
            <div id="name">
                <div id="u14_png">
                    <img src="${pageContext.request.contextPath}/img/sys/u14.png" class="u14_png">
                </div>
                <div id="text11">
                    <input id="com_name" type="text" placeholder="公司名称" name="com_name">
                </div>
            </div>
            <div id="password">
                <div id="u13_png">
                    <img src="${pageContext.request.contextPath}/img/sys/u13.png" class="u13_png">
                </div>
                <div id="text12">
                    <input id="com_password" type="password" placeholder="密码" name="com_password">
                </div>
            </div>
            <div id="check">
                <div id="check1">
                    <input onclick="remember()" type="checkbox" id="rmbuser" name="flagRemenber" class="check_1" />
                    <label for="rmbuser" class="text13">记住密码</label>
                </div>
                <div id="check2">
                    <a href="${pageContext.request.contextPath}/com/forgetPassword">忘记密码？</a>
                </div>
            </div>
            <div id="login1">
                <input type="submit" value="登录" class="submit">
            </div>
            <a id="text14" href="${pageContext.request.contextPath}/com/reg">立即注册>></a>
            </form>
        </div>
    </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>