<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<a href="${pageContext.request.contextPath}/com/cancel" class="upload"  style="text-decoration: none;">退出登录</a>
<%@ include file="./user_login_header.jsp" %>
<table style="width:70%;margin:0 auto;margin-bottom: 300px;"  cellspacing="0"  style="width:98.5%">
<c:forEach var="course" items="${ courseList }">         
            <tr class="btr">
                <td  style="width:200px;margin-left: 0px;">
                <a href="">
                <img style="width:150px;height:150px;" src="${pageContext.request.contextPath}/upload/course/${ course.c_name }/${ course.c_pic }" alt=""> 
                </a>
                </td>
                <td style="width:300px;">
                    <p class="ap"><a href="">${ course.c_name }</a></p>
                    <p class="bp">
                        <span class="xing">
                        	<c:if test="${ course.c_score>0 }">
	                        	<c:forEach begin="1" end="${ course.c_score }"> 
		                            <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
	                        	</c:forEach>
                        	</c:if>
                        </span>
                        
                        <span>(<c:out value="${fn:length(course.commList)}"></c:out>人评价)</span>&nbsp;&nbsp;
                        <span><c:out value="${fn:length(course.studyList)}"></c:out>人在学习</span>
                    </p>
                    <p class="cp">类型：
                    	<c:if test="${ course.c_class==1 }">
                    		初级课程
                    	</c:if>
                    	<c:if test="${ course.c_class==2 }">
                    		中级课程
                    	</c:if>
                    	<c:if test="${ course.c_class==3 }">
                    		高级课程
                    	</c:if>
                    </p>
                    <p class="dp">发布日期：${ course.c_time }</p>
                </td>
                <td style="width:170px;"><a href="${pageContext.request.contextPath}/com/enterStudy?c_id=${ course.c_id }">查看课程</a></td>
                <td class="dtd">
                    <dl>
                        <dt>课程简介:</dt>
                        <dd style="width:200px;height:140px;overflow: hidden;">${ course.c_desc }</dd>
                    </dl>
                </td>
            </tr>
</c:forEach>
</table>
<%@ include file="./footer.jsp" %>
</body>
</html>