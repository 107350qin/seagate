<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_index.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/admin_addNotice.css">
<title>Insert title here</title>
<style>
.choose+label{
margin-right:15px;
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
    <a href="${pageContext.request.contextPath}/admin/lunbo">课程轮播</a>
    <a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=0">课程审核</a>
</div>

<form action="${pageContext.request.contextPath}/admin/addEventDo" style="width:35%;margin:0 auto;padding-bottom:30px;" method="post" enctype ="multipart/form-data">
<input style="margin-top:30px;margin-left:35px;" type="radio" id="choose1" name="event_boo" value="1" class="choose"/>
<label for="choose1">公告通知</label>
<input type="radio" id="choose2" name="event_boo" value="2" class="choose"/>
<label for="choose2">最新资讯</label>
<input type="radio" id="choose3" name="event_boo" value="3" class="choose"/>
<label for="choose3">市场活动</label>
<input type="radio" id="choose4" name="event_boo" value="4" class="choose"/>
<label for="choose4">奖励计划</label>

<p style="margin-top:15px;"><span>标题 </span><input maxlength="30"; required="required" placeholder="必须填写" style="width:380px;" type="text" name="event_title"/></p>
<p style="margin-top:15px;"><span>特点 </span><input placeholder="选填" style="width:380px;" type="text" name="event_desc"/></p>
<p style="margin-top:15px;"><span>内容 </span><textarea placeholder="必须填写" required="required" style="width:381px;height:300px;" name="event_content"></textarea></p>
<p style="margin-top:12px;"><span>图片 </span><input style="width:381px;" type="file" name="files" multiple="multiple"></p>

<p style="margin-top:15px;"><input style="width:385px;height:35px;background-color:#F4F6FC;margin-left:35px;" type="submit" value="发布"/></p>
</form>
<%@ include file="./footer.jsp" %>
</body>
</html>
