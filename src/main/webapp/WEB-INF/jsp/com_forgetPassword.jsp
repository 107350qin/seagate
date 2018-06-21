<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_forgetPassword.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/com_forgetPassword.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<div id="twoa" style="height:600px;">
    <div id="centera">
        <div id="center1a">
            <div id="text3a">
                <span>找回密码</span>
            </div>

        </div>
        <div id="typea">
            <div id="text6a">
                <input type="radio" name="choose" checked="checked" id="aa" ><span class="companya"><label for="aa">  企业用户</label></span>
            </div>
        </div>
        <form id="theForm" action="${pageContext.request.contextPath}/com/checkEmailVal" method="post">
        <div id="comnamea">
            <div id="comname1a">
                <span>公司名称</span>
            </div>
            <div id="comname2a">
             <input style="border: solid 1px #A9A9A9;" id="com_name" style="float:left" type="text" name="com_name" class="comnamea">
            </div>
        </div>
        <div id="phonea">
            <div id="text7a">
                <span>邮箱</span>
            </div>
            <div id="boxa">
                <input type="text" name="com_email" id="com_email">
            </div>
        </div>
        <div id="button" onclick="sendyzm()" style="margin-left: 97px;margin-top:10px;cursor:pointer; color:white; width:100px;height:30px; background-color: green;border-radius: 5px;font-size: 18px;text-align: center;line-height:30px">发送验证码</div>
        <span id="second" style="margin-top:15px;margin-left:60px;color:red;">
               
        </span>
        <div id="validationa">
            <div id="text8a">
                <span>验证码</span>
            </div>
            <div id="box2a">
                <input type="text" name="yzm" class="box2a">
            </div>
            
            
        </div>
        <div id="buttona">
         <input onclick="theNext()" id="next" type="button" value="下一步" class="buttona">
        </div>
        </form>
    </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>