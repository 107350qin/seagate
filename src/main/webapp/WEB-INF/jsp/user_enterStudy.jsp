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


    <!-- 主页内容呈现部分开始 -->
    <div class="enter">
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
                    <a href="${pageContext.request.contextPath}/user/startStudy?c_id=${course.c_id}">开始学习</a>
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

                <div class="three">
                    <div>学习过该课程的人还学习过：</div>

			<c:forEach var="co" items="${ courseList }">
                    <div class="divB">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/img/course/${co.c_pic}">
                        </a>
                        <div class="thrRight">
                            <p class="ap">
                                <a href="">${co.c_name}</a>
                            </p>
                            <p class="bp">
                                <span class="xing">
                                	<c:forEach begin="1" end="${co.c_score}">
	                                    <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                                	</c:forEach>
                                </span>
                                <span>(${fn:length(co.commList)}人评价)</span>&nbsp;&nbsp;
                                <span> ${fn:length(co.studyList)}人在学习</span>
                            </p>
                            <p class="cp">类型：
                            	<c:if test="${ co.c_class==1 }">
			                		初级课程
			                	</c:if>
			                	<c:if test="${ co.c_class==2 }">
			                		中级课程
			                	</c:if>
			                	<c:if test="${ co.c_class==3 }">
			                		高级课程
			                	</c:if>
                            </p>
                            <p class="dp">发布日期：${ co.c_time }</p>
                        </div>
                    </div>
			</c:forEach>

                </div>

            </div>
            <div class="xiaRight">
                <div class="tt">
                    <div class="border">评价
                        <a href="${pageContext.request.contextPath}/user/comm?c_id=${ course.c_id }">我要评论</a>
                    </div>

                    <c:forEach var="comm" items="${ course.commList }" begin="0" end="4">
	                    <div class="border">
	                        <img src="${pageContext.request.contextPath}/img/user/${ comm.user.u_photo }">
	                        <div>
	                            <p>
	                                <span>${ comm.user.u_name }</span>
	                                <span>${ comm.comm_time }</span>
	                            </p>
	                            <p>
	                            <c:forEach begin="1" end="${ comm.comm_score }">
	                                <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
	                            </c:forEach>
	                            </p>
	                        </div>
	                        <br>
	                        <p>${ comm.comm_content }</p>
	                    </div>
                    </c:forEach>

                   

                  
                    

                    <a href="">查看更多>></a>

                </div>
                <div class="bb">
                    <div>${fn:length(course.studyList)}人在学习该课程</div>
                    <div>

                        <p>
                            <c:forEach var="study" items="${course.studyList}" begin="0" end="11">
                            	<div class="floatLeft">
                                	<img src="${pageContext.request.contextPath}/img/user/${ study.u_photo }" alt="">
                                <span>${ study.u_name }</span>
                            </div>
                            </c:forEach>
                           
                        </p>

                    </div>

                </div>
            </div>
        </div>
    </div>

    <!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>