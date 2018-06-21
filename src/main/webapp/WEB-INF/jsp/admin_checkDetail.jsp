<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_enterStudy.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<style>
#hello:hover{
background-color:#00C4C4;
}
</style>
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
    <div class="enter" style="height:1365px;">
        <div class="shang">
            <img src="${pageContext.request.contextPath}/img/lunbo/f.PNG" alt="">
            <div class="rig">
                <p>希捷企业级1200系列固态硬盘</p>
                <p class="marginT">
                    <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                    <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                    <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                    <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                    <img src="${pageContext.request.contextPath}/img/xing.png" alt="">
                    <span>（13人评价）</span>
                    <span>231人在学习</span>
                </p>
                <p class="marginT">类型 :
                    <span>中级课程</span>
                </p>
                <p class="marginT">发布日期 :
                    <span>2018-12-14</span>
                </p>
                <p class="marginT">时长 :
                    <span>56.09</span>
                </p>
                <p class="start">
                    <a href="">开始学习</a>
                </p>
            </div>
        </div>
        <div class="xia" style="width:142.7%;">
            <div class="xiaLeft">
                <div class="one">
                    <div>课程简介</div>
                    <div>
                        <p>内容 :
                            <span>的减肥了快速健康的减肥瘦了快放假了SD卡附近的两个阶段过来看地方老公科技发达离开过地方老公觉得发过来开放的就过来哈饭店喝酒；输卵管和客服经理开会决定省略号；解放东路；是高科技地方立刻感觉到发生了花开四季gkj</span>
                        </p>
                        <p>课程类型 :
                            <span>中级课程</span>
                        </p>
                        <p>使用人群 :
                            <span>希捷Value合作伙伴</span>
                        </p>
                    </div>
                </div>

                <div class="two">
                    <div>目录</div>
                    <div style="height:700px;overflow-y:scroll;">
                        <a href="" title="点击进入学习">
                            <span>第一章</span>
                            <span>SSD HD硬盘的介绍</span>
                            <span>12 ：09</span>
                            <span>
                                <img src="${pageContext.request.contextPath}/img/ke.png" alt="">
                            </span>
                        </a>
                        
                        <a href="" title="点击进入学习">
                            <span>第一章</span>
                            <span>SSD HD硬盘的介绍</span>
                            <span>12 ：09</span>
                            <span>
                                <img src="${pageContext.request.contextPath}/img/ke.png" alt="">
                            </span>
                        </a>
                       
                    </div>
                </div>
                <a id="hello" href="" style="display:block;color:white;width:100%;text-align:center;line-height:33px;eight:33px;font-size:20px;background-color:#F80492;">未通过审核</a>
            </div>
        </div>
    </div>

    <!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>