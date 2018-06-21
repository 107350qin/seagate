<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_studyOnline.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_base.jsp" %>
<div class="nav">
    <a href="${pageContext.request.contextPath}/user/index">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp; </a>
    <a href="${pageContext.request.contextPath}/user/notice">公告资讯</a>
    <a href="${pageContext.request.contextPath}/user/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/user/studyOnline" style="background-color:#00C4C4;">在线学习</a>
    <c:if test="${CUR_USER!=null}">
    <a href="${pageContext.request.contextPath}/user/personalCenter">个人中心</a>
    </c:if>
</div>



<!-- 公告通知呈现部分开始 -->
<div class="all">
    <div class="left">
        <a class="aa" href="${pageContext.request.contextPath}/user/studyOnline?c_class=0" >最新</a>
        <a class="ab" href="${pageContext.request.contextPath}/user/studyOnline?c_class=1">初级课程</a>
        <a class="ac" href="${pageContext.request.contextPath}/user/studyOnline?c_class=2">中级课程</a>
        <a class="ad" href="${pageContext.request.contextPath}/user/studyOnline?c_class=3">高级课程</a>
        <a class="ae" href="${pageContext.request.contextPath}/user/studyOnline?c_class=4">全部</a>
    </div>
    <div class="right">
        <table  cellspacing="0"  style="width:98.5%">
            <tr class="atr">
                <th style="display:block;width:170px;">学习课程-
                	<c:if test="${ c_class==0 }">
                		最新
                	</c:if>
                	<c:if test="${ c_class==1 }">
                		初级课程
                	</c:if>
                	<c:if test="${ c_class==2 }">
                		中级课程
                	</c:if>
                	<c:if test="${ c_class==3 }">
                		高级课程
                	</c:if>
                	<c:if test="${ c_class==4 }">
                		全部
                	</c:if>
                </th>
                <th></th>
                <th></th>
                <th><a href="" style="line-height:35px;">我的学习</a></th>
            </tr>

   <c:forEach var="course" items="${ pager.content }">         
            <tr class="btr">
                <td class="atd"><a href=""><img src="${pageContext.request.contextPath}/upload/course/${ course.c_name }/${ course.c_pic }" alt=""> </a></td>
                <td class="btd">
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
                <td class="ctd"><a href="${pageContext.request.contextPath}/user/enterStudy?c_id=${ course.c_id }">进入学习</a></td>
                <td class="dtd">
                    <dl>
                        <dt>课程简介:</dt>
                        <dd>${ course.c_desc }</dd>
                    </dl>
                </td>
            </tr>
</c:forEach>

          <%--   <tr class="btr">
                <td class="atd"><a href=""><img src="${pageContext.request.contextPath}/img/lunbo/a.JPG" alt=""> </a></td>
                <td class="btd">
                    <p class="ap"><a href="">希捷企业级1200系列固态硬盘</a></p>
                    <p class="bp">
                        <span class="xing">
                            <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                            <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                            <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                            <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                            <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                        </span>
                        <span>(13人评价)</span>&nbsp;&nbsp;
                        <span>231人在学习</span>
                    </p>
                    <p class="cp">类型：初级课程</p>
                    <p class="dp">发布日期：2014-06-04</p>
                </td>
                <td class="ctd"><a href="">进入学习</a></td>
                <td class="dtd">
                    <dl>
                        <dt>课程简介:</dt>
                        <dd>的sfdd打发士大夫大师傅房间数量的开法国德国发建设的开发建设带来狂风数量的快捷方式打开就发生了的开发建设的雷锋精神劳动分局深大路口附件是的dfgfdg反馈数据的受到官方的说法高浮雕高浮雕鬼地方高浮雕法律收到附件是打开了封建士大夫是独立开发建设的疯狂的事件发生了的空间</dd>
                    </dl>
                </td>
            </tr>
 --%>


           
        </table>
        <p class="page" style="margin-left:5px;">
        
    <!-- 分页 -->
    <c:if test="${pager.pageNow>1}">
     <a href="${pageContext.request.contextPath}/user/studyOnline?pageNow=${pager.pageNow-1}&c_class=${c_class}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
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
    <a href="${pageContext.request.contextPath}/user/studyOnline?pageNow=${ i }&c_class=${c_class}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:30px;height:30px;background-color:red;">
    		${ i }
    </a>
    </c:if>
    
    </c:forEach>
        <c:if test="${pager.pageNow<pager.pageCount}">
     <a href="${pageContext.request.contextPath}/user/studyOnline?pageNow=${pager.pageNow+1}&c_class=${c_class}" style="text-align:center;line-height:30px;margin-left:10px;display:block;float:left;width:80px;height:30px;background-color:yellow;">
    		下一页
    </a>
    </c:if>
    
        </p>
    </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>