<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_index.css">
<title>Insert title here</title>
<style>
.lun{
width:83%;
margin:0 auto;
}
.lun img{
width:360px;
height:352px;
}
</style>
</head>
<body>
<%@ include file="./admin_header.jsp" %>
<div class="nav">
    <a href="${pageContext.request.contextPath}/admin/index">公告通知</a>
    <a href="${pageContext.request.contextPath}/admin/latestInfo">最新资讯</a>
    <a href="${pageContext.request.contextPath}/admin/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/admin/incentivePlan">奖励计划</a>
    <a href="${pageContext.request.contextPath}/admin/lunbo" style="background-color:#00C4C4;">课程轮播</a>
    <a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=0">课程审核</a>
</div>
<p style="width:83%;margin:0 auto;font-size:20px;">当前轮播：</p>
<div class="lun">
	<c:forEach var="one" items="${ list }">
		<img alt="" src="${pageContext.request.contextPath}/img/lunbo/${one.name}">
		<a href="${pageContext.request.contextPath}/admin/deleteLunboPic?name=${one.name}" style="color:red;margin-right:20px;font-size:18px;">删除</a>
	</c:forEach>
</div>
<form action="${pageContext.request.contextPath}/admin/addLunboPic" style="width:83%;margin:0 auto;padding-bottom:30px;" method="post" enctype ="multipart/form-data">
<p style="margin-top:12px;"><span>添加图片[图片数量5张] </span><input style="width:381px;" type="file" name="files" multiple="multiple"></p>
<p style="margin-top:15px;"><input style="width:385px;height:35px;background-color:#F4F6FC;" type="submit" value="确定"/></p>
</form>
<%@ include file="./footer.jsp" %>
</body>
</html>












