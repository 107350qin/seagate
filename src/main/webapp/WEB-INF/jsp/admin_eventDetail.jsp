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
<style type="text/css">
pre{white-space:pre-wrap;white-space:-moz-pre-wrap;white-space:-pre-wrap;white-space:-o-pre-wrap;word-wrap:break-word;}
</style>
</head>
<body>
<%@ include file="./admin_header.jsp" %>
<div class="nav">
	<c:if test="${event.event_boo!=1}">
    	<a href="${pageContext.request.contextPath}/admin/index">公告通知</a>
	</c:if>
	<c:if test="${event.event_boo==1}">
    	<a style="background-color: #00C4C4" href="${pageContext.request.contextPath}/admin/index">公告通知</a>
	</c:if>
	<c:if test="${event.event_boo!=2}">
    	<a href="${pageContext.request.contextPath}/admin/latestInfo">最新资讯</a>
	</c:if>
	<c:if test="${event.event_boo==2}">
		<a style="background-color: #00C4C4" href="${pageContext.request.contextPath}/admin/latestInfo">最新资讯</a>
	</c:if>
	<c:if test="${event.event_boo!=3}">
    	<a href="${pageContext.request.contextPath}/admin/marketActivity">市场活动</a>
	</c:if>
	<c:if test="${event.event_boo==3}">
		<a style="background-color: #00C4C4" href="${pageContext.request.contextPath}/admin/marketActivity">市场活动</a>
	</c:if>
	<c:if test="${event.event_boo!=4}">
    	<a href="${pageContext.request.contextPath}/admin/incentivePlan">奖励计划</a>
	</c:if>
	<c:if test="${event.event_boo==4}">
		<a style="background-color: #00C4C4" href="${pageContext.request.contextPath}/admin/incentivePlan">奖励计划</a>
	</c:if>
    
    <a href="${pageContext.request.contextPath}/admin/lunbo">课程轮播</a>
    <a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=0">课程审核</a>
</div>
<div class="content" style="margin-bottom:30px;border:solid 1px #BCD3C4;padding:40px;padding-top:30px;width:76.5%;">
<p style="font-size:20px;margin:15px;">
	<c:if test="${event.event_boo==1}">公告通知</c:if>
	<c:if test="${event.event_boo==2}">最新资讯</c:if>
	<c:if test="${event.event_boo==3}">市场活动</c:if>
	<c:if test="${event.event_boo==4}">奖励计划</c:if>
</p>
<p style="font-size:20px;font-weight:bold;text-align:center;line-height:70px;">${event.event_title}</p>
<p style="font-size:18px;text-align:center;">[${event.event_desc}]</p>
<p style="font-size:20px;text-align:center;">${event.event_time}</p>
<p style="font-size:20px;text-align:center;">浏览次数：${event.event_browCount}</p>
<p style="font-size:20px;text-indent:2em;width:55%;margin:0 auto;margin-top:20px;">${event.event_content}</p>
<p style="width:55%;margin:0 auto;margin-top:20px;">
	<c:forEach var="p" items="${path}">
    	<img style="width:500px;margin:0 auto;margin-top:15px;" src="${pageContext.request.contextPath}/img/event/${ p }"/>
	</c:forEach>
</p>

</div>
    
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>