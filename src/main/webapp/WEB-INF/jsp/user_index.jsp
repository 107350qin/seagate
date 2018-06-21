<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/js/lunbo.js"></script>
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

<!-- 主页内容呈现部分开始 -->
<div class="main">
    <div class="mainTop">
        <div class="a">
                <div class="middle_right">
                        <div id="lunbobox">
                            <div id="toleft">
                                &lt;</div>
                                    <div class="lunbo">
	                                    <c:forEach var="name" items="${ lunboList }">
                                        	<a><img src="${pageContext.request.contextPath}/img/lunbo/${name}"></a>
	                                    </c:forEach>
                                    </div>
                                    <div id="toright">&gt;</div>
                                    <ul>
                                        <li></li>
                                        <li></li>
                                        <li></li>
                                        <li></li>
                                        <li></li>
                                    </ul>
                                    <span></span>
                            </div>
                        </div>      
                            
        </div>
        <div class="b">
        	<c:forEach begin="0" end="9" var="i" items="${lista}" varStatus="status">
        		<c:if test="${ status.index==0 || status.index==5 }">
          			<p><a class="bolder" href="${pageContext.request.contextPath}/user/eventDtail?event_id=${i.event_id}">${i.event_title}</a></p>
        		</c:if>
        		<c:if test="${ status.index!=0 && status.index!=5 }">
          			<p><a href="${pageContext.request.contextPath}/user/eventDtail?event_id=${i.event_id}">${i.event_title}</a></p>
        		</c:if>
        	</c:forEach>
        </div>
        <c:if test="${ CUR_USER!=null }">
        	<div class="c">
        <p id="theUser" style="display:none;">${ CUR_USER }</p>
            <p><span class="one">個人中心</span><span class="two">${ CUR_USER.u_rank }</span></p>
            <p>
                <img class="three" src="${pageContext.request.contextPath}/img/user/${ CUR_USER.u_photo }" alt="">
                <span class="four">积分</span><span class="five">${ CUR_USER.u_score }</span>
                <span class="six">成长值</span><span class="seven">${ CUR_USER.u_grow }</span>
                <span class="eight">职位：  ${ CUR_USER.u_position }</span>
            <span class="nine">${ CUR_USER.u_name }</span><span class="ten">公司：${ CUR_USER.u_company }</span>
            </p>
            <div>
                <a href="">个人资料</a>
                <a href="">我的消息</a>
                <a href="">我的收藏</a>
                <a href="">我的学习</a>
            </div>
            <a href="" class="linkTo">进入个人中心 >></a>
        </div>
        </c:if>
        
    </div>
    <div class="mainFloor">
        <div class="i">
            <p><span>市场活动</span><a href="${pageContext.request.contextPath}/user/marketActivity">更多>></a></p><br>
            <c:forEach var="b" items="${ listb }">
            	<p><a href="${pageContext.request.contextPath}/user/eventDtail?event_id=${b.event_id}">${b.event_title}</a><span>${b.event_time}</span></p>
	        </c:forEach>
        </div>
        <div class="i">
            <p><span>在线学习</span><a href="${pageContext.request.contextPath}/user/studyOnline">更多>></a></p><br>
            <c:forEach var="c" items="${ listc }">
            	<p><a href="${pageContext.request.contextPath}/user/enterStudy?c_id=${c.c_id}">${ c.c_time }  ${ c.c_name } </a><span>${ c.c_brow } 人浏览</span></p>
	        </c:forEach>
        </div>
    </div>
</div>
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>