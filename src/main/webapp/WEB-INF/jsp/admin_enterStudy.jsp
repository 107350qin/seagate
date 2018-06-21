<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_enterStudy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
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
    <a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=0" style="background-color:#00C4C4;">课程审核</a>
</div>
    <!-- 主页内容呈现部分开始 -->
    <div class="enter" style="margin-top:10px;height:1000px;">
        <div class="shang">
            <img src="${pageContext.request.contextPath}/upload/course/${ course.c_name }/${ course.c_pic }" alt="">
            <div class="rig">
                <p>${course.c_name}</p>
                <p class="marginT">
                	<c:forEach begin="1" end="${course.c_score}">
                    	<img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                	</c:forEach>
                
                    <span>（${fn:length(course.commList)}人评价）</span>
                    <span>${fn:length(course.studyList)}人在学习</span>
                </p>
                <p class="marginT">类型 :
                    <span>
	                    <c:if test="${ course.c_class==1 }">
	                		初级课程
	                	</c:if>
	                	<c:if test="${ course.c_class==2 }">
	                		中级课程
	                	</c:if>
	                	<c:if test="${ course.c_class==3 }">
	                		高级课程
	                	</c:if>
                    </span>
                </p>
                <p class="marginT">发布日期 :
                    <span>${ course.c_time }</span>
                </p>
                <p class="marginT">时长 :
                    <span>${ course.c_long }</span>
                </p>
                <p class="start">
                    <a href="${pageContext.request.contextPath}/admin/startStudy?c_id=${course.c_id}">查看视频</a>
                    	<c:if test="${ course.c_boo==0 }">
                    		<a  style="background-color: #FF6455;margin-left:230px;margin-top:-50px;" title="点击通过审核" href="${pageContext.request.contextPath}/admin/detailPass?c_id=${course.c_id}&pass=1">未通过审核</a>
                    	</c:if>
                    	<c:if test="${ course.c_boo==1 }">
                    		<a style="background-color: green;margin-left:230px;margin-top:-50px;" title="点击未通过审核" href="${pageContext.request.contextPath}/admin/detailPass?c_id=${course.c_id}&pass=0">已通过审核</a>
                    	</c:if>
                </p>
            </div>
        </div>
        <div class="xia">
            <div class="xiaLeft">
                <div class="one">
                    <div>课程简介</div>
                    <div>
                        <p>内容 :
                            <span>${ course.c_desc }</span>
                        </p>
                        <p>课程类型 :
                            <span>
		                        <c:if test="${ course.c_class==1 }">
			                		初级课程
			                	</c:if>
			                	<c:if test="${ course.c_class==2 }">
			                		中级课程
			                	</c:if>
			                	<c:if test="${ course.c_class==3 }">
			                		高级课程
			                	</c:if>
                            </span>
                        </p>
                        <p>使用人群 :
                            <span>${ course.c_for }</span>
                        </p>
                    </div>
                </div>

                <div class="two">
                    <div>目录</div>
                    <div>
                        
                        <c:forEach var="ch" items="${ course.chapterList }">
	                        <c:if test="${fn:length(ch.list)>0}">
		                        <a href="" title="点击进入学习">
		                            <span style="font-weight:bold;color:black;">第${ ch.ch_id }章</span>
		                            <span style="font-weight:bold;color:black;">${ ch.ch_title }</span>
		                            <span style="font-weight:bold;color:black;">${ ch.ch_long }</span>
		                        </a>
		                        <c:forEach var="section" items="${ ch.list }">
			                        <a class="section" href="" title="点击进入学习" style="height:20px;line-height:12px;backround-color:#C9FCD3">
			                            <span style="height:12px;line-height:12px;">第${ section.section_id }节</span>
			                            <span>${ section.section_title }</span>
			                            <span>${ section.section_long }</span>
			                            <span>
			                                <img style="margin-top:5px;" src="${pageContext.request.contextPath}/img/ke.png" alt="">
			                            </span>
			                        </a>
	                        	</c:forEach>
	                        </c:if>
                        </c:forEach>
                        
                        <!-- 两个时长和一个课程对象 -->
                        
                        
                    </div>
                </div>

               

            </div>
            
        </div>
    </div>

    <!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>