<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_setPassword.css">
<script src="${pageContext.request.contextPath}/js/user_setPassword.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
 <div id="onea">
        <div id="centera">
            <div id="center1a">
                <div id="text3a">
                    <span>找回密码</span>
                </div>
            </div>
            <div id="newa">
                <div id="text4a">
                    <span>设置新密码</span>
                </div>
                <div id="boxa">
                    <input type="password" name="newpassword" id="newpassworda">
                    <span style="font-size: 15px;whith:200px;">请填写6-20个字符,区分大小写</span>
                </div>

            </div>
            <div id="surea">
                <div id="text5a">
                    <span>再次确认</span>
                </div>
                <div id="box2a">
                    <input type="password" name="newpassword" id="newpassword1a">
                    <span style="font-size: 15px">密码不匹配，请重新输入</span>
                </div>
            </div>
            <div id="submita">
                <a href="">
                    <input type="submit" value="确定" class="submit1a">
                </a>
            </div>
        </div>
        <div id="righta">
            <div id="text10a" style="margin-top:90px;">
                <span>亲爱的用户，您可以通过注册时使用的手机号码找回密码。针对企业用户，找回密码中的手机号码是注册时填写的网站关键负责人的手机号码。</span>
            </div>
            <div id="text11a">
                <span>如果您需要帮助，请联系客服，谢谢！</span>
            </div>
            <div id="text12a">
                <span>客服邮箱：service@seagateelite.com</span>
            </div>
            <div id="text13a">
                <span>客服电话：400-820-1234</span>
            </div>
        </div>
    </div>
<%@ include file="./footer.jsp" %>
</body>
</html>