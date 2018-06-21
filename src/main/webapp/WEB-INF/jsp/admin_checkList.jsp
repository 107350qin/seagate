<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_studyOnline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<title>Insert title here</title>
<style type="text/css">
ul{
list-style-type: none;
}
.inner-ul{
float:left;
display:none;
}
.inner-ul li{
font-size: 12px;
width:196px;
color:red;
}
.inner-ul li a{
font-family: 宋体;
}
.inner-a{
font-size:20px;
display:block;
width:196px;
height:50px;
float:left;
cursor:pointer;
text-align: center;
line-height: 50px;
}
.inner-a:hover{
background-color:rgb(210, 248, 235); 
}
.inner-ul li{
background-color: #C4C6C3;
}
.inner-ul li:hover{
background-color: #C6C6C6;color:#E527B9;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script type="text/javascript">
	$(function(){
		$('.inner-a').click(function(){
			$(this).next('.inner-ul').slideToggle();
		})
	}) 
</script>
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



<!-- 公告通知呈现部分开始 -->
<div class="all">
    <div class="left">
    	<ul>
    		<li>
    			<span class="inner-a"  style="background-color: rgb(210, 248, 235);">最新</span>
    			<ul class="inner-ul">
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=1&rank=0">已通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=0&rank=0">未通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=0">任何</a></li>
    			</ul>
    		</li>
    		<li>
    			<span class="inner-a">初级课程</span>
    			<ul class="inner-ul">
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=1&rank=1">已通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=0&rank=1">未通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=1">任何</a></li>
    			</ul>
    		</li>
    		<li>
    			<span class="inner-a">中级课程</span>
    			<ul class="inner-ul">
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=1&rank=2">已通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=0&rank=2">未通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=2">任何</a></li>
    			</ul>
    		</li>
    		<li>
    			<span class="inner-a">高级课程</span>
    			<ul class="inner-ul">
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=1&rank=3">已通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=0&rank=3">未通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=3">任何</a></li>
    			</ul>
    		</li>
    		<li>
    			<span class="inner-a">全部</span>
    			<ul class="inner-ul">
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=1&rank=4">已通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=0&rank=4">未通过审核</a></li>
    				<li><a href="${pageContext.request.contextPath}/admin/check?isPass=-1&rank=4">任何</a></li>
    			</ul>
    		</li>
    	</ul>
    </div>
    <div class="right">
        <table  cellspacing="0"  style="width:98.5%">
        <caption style="font-size:20px;text-align:left;">
        	学习课程-
                
                <c:if test="${ rank==0 }">最新</c:if>
                <c:if test="${ rank==1 }">初级课程</c:if>
                <c:if test="${ rank==2 }">中级课程</c:if>
                <c:if test="${ rank==3 }">高级课程</c:if>
                <c:if test="${ rank==4 }">全部</c:if>
                -
                <c:if test="${ isPass==-1 }">任何</c:if>
                <c:if test="${ isPass==0 }">未通过审核</c:if>
                <c:if test="${ isPass==1 }">已通过审核</c:if>
        </caption>

            
            <c:forEach var="course" items="${pager.content}">
            	<tr class="btr">
	                <td class="atd"><a href=""><img src="${pageContext.request.contextPath}/upload/course/${course.c_name}/${course.c_pic}" alt=""> </a></td>
	                <td class="btd">
	                    <p class="ap"><a href="">${course.c_name}</a></p>
	                    <p class="cp">类型：
					         <c:if test="${course.c_class==1}">
					          		初级课程
					         </c:if>           
					         <c:if test="${course.c_class==2}">
					          		初级课程
					         </c:if>           
					         <c:if test="${course.c_class==3}">
					          		高级课程
					         </c:if>  
					          【${course.com.com_name}】        
	                   </p>
	                    <p class="dp">发布日期：${course.c_time}</p>
	                    <p class="bp">
	                    <c:if test="${course.c_boo==0}">
	                        <a id="hello" title="点击通过审核" href="${pageContext.request.contextPath}/admin/pass?c_id=${course.c_id}&rank=${rank}&pass=1&isPass=${isPass}&pageNow=${pager.pageNow}" style="display:block;color:white;width:40%;text-align:center;line-height:33px;eight:33px;font-size:20px;background-color:#F80492;border-radius:8px;">未通过审核</a>
					    </c:if>  
	                    <c:if test="${course.c_boo==1}">
	                        <a id="hello" title="点击未通过审核" href="${pageContext.request.contextPath}/admin/pass?c_id=${course.c_id}&rank=${rank}&pass=0&isPass=${isPass}&pageNow=${pager.pageNow}" style="display:block;color:white;width:40%;text-align:center;line-height:33px;eight:33px;font-size:20px;background-color:#F80492;border-radius:8px;">通过审核</a>
					    </c:if>  
	                    </p>
	                </td>
	                <td class="ctd"><a href="${pageContext.request.contextPath}/admin/enterStudy?c_id=${course.c_id}">查看内容</a></td>
	                <td class="dtd">
	                    <dl>
	                        <dt>课程简介:</dt>
	                        <dd>${course.c_desc}</dd>
	                    </dl>
	                </td>
            	</tr>
            </c:forEach>
      </table>

           


        


       


        
           
  
        <p class="page">
        <!-- 分页 -->
    <c:if test="${pager.totalCount>0}">
    <div style=" padding:30px 0;width:84%;margin:0 auto;margin-bottom:50px;">
    <c:if test="${pager.pageNow>1}">
     <a href="${pageContext.request.contextPath}/admin/check?pageNow=${pager.pageNow-1}&isPass=${isPass}&rank=${rank}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
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
    <a href="${pageContext.request.contextPath}/admin/check?pageNow=${ i }&isPass=${isPass}&rank=${rank}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:30px;height:30px;background-color:red;">
    		${ i }
    </a>
    </c:if>
    
    </c:forEach>
        <c:if test="${pager.pageNow<pager.pageCount}">
     <a href="${pageContext.request.contextPath}/admin/check?pageNow=${pager.pageNow+1}&isPass=${isPass}&rank=${rank}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
    		下一页
    </a>
    </c:if>
    </div>
    
    </c:if>
    <c:if test="${pager.totalCount==0}">
    <div style="width:100%;height:250px;"></div>
    </c:if>
        </p>
    </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>