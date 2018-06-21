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
<%@ include file="./user_base.jsp" %>
<div class="nav">
    <a href="${pageContext.request.contextPath}/user/index" style="background-color:#00C4C4;">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp; </a>
    <a href="${pageContext.request.contextPath}/user/notice">公告资讯</a>
    <a href="${pageContext.request.contextPath}/user/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/user/studyOnline">在线学习</a>
    <c:if test="${CUR_USER!=null}">
    <a href="${pageContext.request.contextPath}/user/personalCenter">个人中心</a>
    </c:if>
</div>
<div class="content" style="margin-bottom:30px;">
<a href="${pageContext.request.contextPath}/user/search?keyword=${keyword}" style="display:block;float:left; width:100px;height:30px;background-color: green;color:white;text-align: center;line-height: 30px;">事件</a>
            <a href="${pageContext.request.contextPath}/user/search?keyword=${keyword}&flag=1" style="display:block;width:100px;height:30px;background-color: green;color:white;text-align: center;line-height: 30px;float:left;margin-left:5px;">课程</a>
            <br/>
        <p class="pa">
            <span>搜索结果</span>
            <span>共${pager.totalCount}个结果</span>
        </p>
       
       
       <c:forEach var="event" items="${pager.content}">
       	<p class="pb">
        <a href="${pageContext.request.contextPath}/admin/eventDetail?event_id=${event.event_id}">
            <span>
            	<c:if test="${event.event_boo==1}">公告通知</c:if>
				<c:if test="${event.event_boo==2}">最新资讯</c:if>
				<c:if test="${event.event_boo==3}">市场活动</c:if>
				<c:if test="${event.event_boo==4}">奖励计划</c:if>
            </span>
            <span class="spa" style="width:660px;">${event.event_title}</span>
            <span class="spb">${event.event_time}</span>
            <span class="spc">${event.event_browCount}次浏览</span>
        </a>
       </p>
       </c:forEach>
    </div>
    
    <!-- 分页 -->
    <div style=" padding:30px 0;width:84%;margin:0 auto;margin-bottom:50px;">
    <c:if test="${pager.pageNow>1}">
     <a href="${pageContext.request.contextPath}/user/search?pageNow=${pager.pageNow-1}&keyword=${keyword}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
    		上一页
    </a>
    </c:if>
    
    <c:forEach begin="1" end="${pager.pageCount}" var="i">
    <c:if test="${pager.pageNow==i}">
    <a style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:30px;height:30px;background-color:green;color:white">
    		${ i }
    </a>
    </c:if>
    <c:if test="${pager.pageNow!=i}">
    <a href="${pageContext.request.contextPath}/user/search?pageNow=${ i }&keyword=${keyword}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:30px;height:30px;background-color:red;">
    		${ i }
    </a>
    </c:if>
    
    </c:forEach>
        <c:if test="${pager.pageNow<pager.pageCount}">
     <a href="${pageContext.request.contextPath}/user/search?pageNow=${pager.pageNow+1}&keyword=${keyword}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
    		下一页
    </a>
    </c:if>
    </div>
    
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>