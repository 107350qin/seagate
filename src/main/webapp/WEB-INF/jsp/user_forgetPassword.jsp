<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_forgetPassword.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<div id="aa">
    <div id="centera">
        <div id="typea">
            <div id="text4a">
                <span>选择类型</span>
            </div>
            <div id="text5a">
                <input type="radio" id="personala" name="hello" checked="checked">
                <label for="personala" class="personala">个人用户</label>
            </div>
            <div id="text6a">
                <input type="radio" id="companya" name="hello">
                <label for="companya" class="companya">企业用户</label>
            </div>
        </div>
        <div id="phonea">
            <div id="text7a">
                <span>手机号码</span>
            </div>
            <div id="boxa">
                <input type="text" name="phone" class="boxa">
            </div>
        </div>
        <div id="validationa">
            <div id="text8a">
                <span>验证码</span>
            </div>
            <div id="box2a">
                <input type="text" name="phone" class="box2a">
            </div>
            <div id="yzma">
                <img src="${pageContext.request.contextPath}/img/yzm.jpg" class="yzma">
            </div>
        </div>
        <div id="buttona">
            <input type="button" value="下一步" class="buttona">
        </div>
    </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>