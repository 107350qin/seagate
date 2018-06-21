<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_companyHome.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/com_index.js"></script>
<title>Insert title here</title>
</head>
<body>

<a  href="${pageContext.request.contextPath}/com/cancel" style="text-decoration: none;display:fixed;top:0px;left:0px;">退出登录</a>
<%@ include file="./user_login_header.jsp" %>
<div id="Lower" style="height:400px;margin-bottom: 70px;">
        <div style="width:70%;margin:0 auto;margin-top: -100px;">
                <a class="upload" style="text-decoration: none;background-color: #5DF57E;">课程上传</a>
                <a href="${pageContext.request.contextPath}/com/courseList" class="upload"  style="text-decoration: none;">课程查看</a>
        </div>
            <form style="width:92%;height:410px;margin:0 auto;" id="information" action="${pageContext.request.contextPath}/com/homeDoOne" method="post" enctype="multipart/form-data">
                <div class="inforCorporate">
                    <div class="inforname">
                    	<input type="hidden" name="chapter_num" value="0"/>
                        <span class="dateCorporate">课程名字</span>
                    </div>
                    <div class="Corporatesan">
                        <input onblur="checkName(this.value)" type="text" name="c_name" id="Corporatename" >
                    </div>
                  </div>
                        <div class="inforCorporate">
                            <div class="inforname">
                                <span class="dateCorporate">课程类别</span>
                            </div>
                            <div class="Corporatesan">
                                <select name="c_class" id="c_class">
                                    <option value="0" selected="selected">请选择</option>
                                    <option value="1">初级课程</option>
                                    <option value="2">中级课程</option>
                                    <option value="3">高级课程</option>
                                </select>
                            </div>
                        </div>
                            <div id="infortextarea">
                                <div class="inforname">
                                    <span class="dateCorporate">课程介绍</span>
                                </div>
                                    <textarea onblur="checkDesc(this.value)" id="c_desc" cols="5" role="10"  name="c_desc"></textarea>
                        </div>
                        <div id="inforCorporatetu" style="margin-top:20px;">
                        <span>课程图片</span>
                        <input type="file" name="c_pic" id="tupian">
                  		</div>
  
                            <input onclick="checkSubmit()" style="margin-top:20px;margin-left: 74px;" type="button" value="下一步" id="button2">
            </form>
        </div>
<%@ include file="./footer.jsp" %>
</body>
</html>