<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/com_resetPassword.js"></script>
<title>Insert title here</title>
</head>
<body>
<form id="resetForm" action="${pageContext.request.contextPath}/com/resetPasswordDo" method="post">
公司名称：<input name="com_name" type="text" value="${ com_name }" readonly="readonly"><br/>
新密码是：<input id="com_passworda" type="password" name="com_password"><span id="comPassword"></span><br/>
再次输入：<input id="com_passwordAgaina" type="password" name="com_passwordAgain"><span id="comPasswordAgain"></span><br/>
infoShow：<div  id="info"></div>
<input onclick="resetButton()" type="button" value="确定"><br/>
</form>
</body>
</html>