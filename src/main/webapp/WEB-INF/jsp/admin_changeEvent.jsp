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
</head>
<body>
<%@ include file="./admin_header.jsp" %>
<div class="nav">
    <a href="${pageContext.request.contextPath}/admin/index">公告通知</a>
    <a href="${pageContext.request.contextPath}/admin/latestInfo">最新资讯</a>
    <a href="${pageContext.request.contextPath}/admin/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/admin/incentivePlan">奖励计划</a>
    <a href="${pageContext.request.contextPath}/admin/lunbo">课程轮播</a>
    <a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=0">课程审核</a>
</div>
<div>
<h1 style="text-align:center;line-height:50px;font-size:20px;font-weight:bold;">您正在做修改动作</h1>
<p style="font-size:20px;width:83%;margin:0 auto;margin-top:0px;">
	<c:if test="${event.event_boo==1}">公告通知</c:if>
	<c:if test="${event.event_boo==2}">最新资讯</c:if>
	<c:if test="${event.event_boo==3}">市场活动</c:if>
	<c:if test="${event.event_boo==4}">奖励计划</c:if>
</p>
	<form action="${pageContext.request.contextPath}/admin/changeEventDo" method="post" style="width:40%;margin:0 auto;margin-bottom:50px;" enctype ="multipart/form-data">
		<input type="hidden" name="event_id" value="${event.event_id}"/>
		<span>标题 ： </span><input style="width:500px;height:30px;" type="text" name="event_title" value="${event.event_title}"/><br>
		<span>特点 ： </span><input style="width:500px;height:30px;margin-top:10px;" type="text" name="event_desc" value="${event.event_desc}"/><br>
		<span>内容 ： </span><textarea style="width:502px;height:300px;margin-top:10px;" name="event_content">${event.event_content}</textarea><br>
		<p style="line-height:40px;margin-top:10px;">发布时间：${event.event_time}</p>
		<p style="line-height:40px;">浏览次数：${event.event_browCount}</p>
	<p style="width:82%;margin:0 auto;margin-top:20px;">
		<c:forEach var="p" items="${path}">
    		<img style="width:170px;margin-top:15px;" src="${pageContext.request.contextPath}/img/event/${ p }"/>
    		<a href="${pageContext.request.contextPath}/admin/deletePicOfEvent?event_id=${event.event_id}&pic=${ p }" style="margin-right:40px;color:red;">删除</a>
		</c:forEach>
	</p>
	<p style="margin-top:12px;"><span>图片新增： </span><input style="width:381px;" type="file" name="files" multiple="multiple"></p>
		<input style="margin-top:15px;width:100px;height:30px;background-color:green;color:white;border-radius:8px;border:none;outline:none;" type="submit" value="修改"/>
	</form>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>