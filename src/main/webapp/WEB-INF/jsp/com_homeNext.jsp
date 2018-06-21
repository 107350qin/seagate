<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/com_homeNext.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<div style="width:70%;margin:0 auto;">
     <p>课程名字:${ addCourse.c_name }</p>
                        <p>课程类别:
                        <c:if test="${addCourse.c_class==1}">
                        	初级课程
                        </c:if>  
                        <c:if test="${addCourse.c_class==2}">
                        	中级课程
                        </c:if>  
                        <c:if test="${addCourse.c_class==3}">
                        	高级课程
                        </c:if>  
                        </p>
                        <p>课程介绍:${ addCourse.c_desc }</p>
                       
                        <span>课程图片</span>
                        <img style="width:300px;height:300px;" src="${pageContext.request.contextPath}/upload/course/${ addCourse.c_name }/${ addCourse.c_pic }">
                        
                        <form id="form" action="${pageContext.request.contextPath}/com/homeDoTwo" method="post" enctype="multipart/form-data"> 
                        	<p>第 ${chapter_num}章 
                        	<input type="hidden" name="chapter_num" value="${chapter_num}"/> 
                        	<input id="chapter_name" type="text" name="chapter_name"/> 
                        	 <input id="files" type="file" name="file" multiple="multiple"/> 
                        	 </p>
                           <input onclick="upload()" type="button" value="上传" id="button2" style="font-size:20px ;width:150px;height:50px;background-color: green;color:white;text-align: center;line-height: 50px;">
                           <a href="${pageContext.request.contextPath}/com/uploadOver">上传完成</a>
                        </form>
</div>

<%@ include file="./footer.jsp" %>
</body>
</html>