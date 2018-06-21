<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_notice.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_base.jsp" %>
<div class="nav">
    <a href="${pageContext.request.contextPath}/user/index">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp; </a>
    <a href="${pageContext.request.contextPath}/user/notice" style="background-color:#00C4C4;">公告资讯</a>
    <a href="${pageContext.request.contextPath}/user/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/user/studyOnline">在线学习</a>
    <c:if test="${CUR_USER!=null}">
    <a href="${pageContext.request.contextPath}/user/personalCenter">个人中心</a>
    </c:if>
</div>



<!-- 公告通知呈现部分开始 -->
<div class="all">
    <div class="left">
        <a href="${pageContext.request.contextPath}/user/notice">公告通知</a>
        <a  style="background-color: rgb(210, 248, 235);">最新资讯</a>
    </div>
    <div class="right">
        <table  cellspacing="0"  style="width:98.5%">
            <tr style="background-color:#F2F2F2">
                <th style="text-align: left;font-weight: bold;font-size: 18px">最新资讯</th>
                <th></th>
                <th style="font-weight: bold;font-size: 18px">共${pager.totalCount}条信息</th>
            </tr>
         
        
        <c:forEach var="p"  items="${pager.content}">
        	<tr>
                <td style="width:65%;overflow: hidden;"><a href=""> ${p.event_title}</a><img style="width:25px;margin-left:10px;padding-bottom: 7px;" src="img/rightTopNew.png" alt=""></td>
                <td>${p.event_time}</td>
                <td style="width:10%;">${p.event_browCount} 次浏览</td>
            </tr>
         </c:forEach>
        </table>
       
<p class="page">
        
    <!-- 分页 -->
    <c:if test="${pager.pageNow>1}">
     <a href="${pageContext.request.contextPath}/user/latestInfo?pageNow=${pager.pageNow-1}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
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
    <a href="${pageContext.request.contextPath}/user/latestInfo?pageNow=${ i }" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:30px;height:30px;background-color:red;">
    		${ i }
    </a>
    </c:if>
    
    </c:forEach>
        <c:if test="${pager.pageNow<pager.pageCount}">
     <a href="${pageContext.request.contextPath}/user/latestInfo?pageNow=${pager.pageNow+1}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
    		下一页
    </a>
    </c:if>
    
</p>
       
       
    </div>
</div>
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>