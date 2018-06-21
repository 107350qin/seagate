<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_personalCenter.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/AreaData_min.js"></script>
<script type="text/javascript">
	window.onload=function(){
		$(function(){
			var a = '<%=(String)request.getAttribute("sheng")%>';
			var b = '<%=(String)request.getAttribute("shi")%>';
			$('#sheng').text(area_array[a])
			$('#shi').text(sub_array[a][b])
		})
	}
</script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_base.jsp" %>
<div class="nav">
    <a href="${pageContext.request.contextPath}/user/index">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp; </a>
    <a href="${pageContext.request.contextPath}/user/notice">公告资讯</a>
    <a href="${pageContext.request.contextPath}/user/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/user/studyOnline">在线学习</a>
    <a href="${pageContext.request.contextPath}/user/personalCenter" style="background-color:#00C4C4;">个人中心</a>
</div>

<!-- 公告通知呈现部分开始 -->
<div class="all">
    <div class="left">
        <a style="background-color: rgb(210, 248, 235);">个人资料</a>
        <a href="${pageContext.request.contextPath}/user/myMessage">我的消息</a>
        <a href="${pageContext.request.contextPath}/user/myColl">我的收藏</a>
        <a href="${pageContext.request.contextPath}/user/myStudy">我的学习</a>
    </div>
    <div class="right">
        <table  cellspacing="0"  style="width:98.5%">
            <tr class="atr">
                <th>个人资料</th>
                <th></th>
            </tr>

            
            <tr class="btr">
                <td class="atd">
                    <div class="adiv">
                        <img src="${pageContext.request.contextPath}/img/user/${ CUR_USER.u_photo }" alt="">
                        <p>${ CUR_USER.u_name }</p>
                    </div>
                    <div class="bdiv">
                        <p>积分 ：<span>${ CUR_USER.u_score }</span></p>
                        <p>成长值 ：<span>${ CUR_USER.u_grow }</span></p>
                        <p>等级 ：<span>${ CUR_USER.u_rank }</span></p>
                    </div>
                </td>
                <td class="btd">
                    <p></p>
                    <p>角色 ：<span>${ CUR_USER.u_position }</span></p>
                    <p>所在公司 ：<span>${ CUR_USER.u_company }</span></p>
                </td>
            </tr>
            
            <tr class="ctr">
                <td  class="atd">
                    <p>
                        <a style="background-color: rgb(175, 224, 171);">基本资料</a>
                        <a href="${pageContext.request.contextPath}/user/headerImageSetting">头像设置</a>
                        <a href="${pageContext.request.contextPath}/user/changePassword">密码修改</a>
                    </p><br><br>
                    <p></p>
                    <p>姓名：<span>${ CUR_USER.u_name }</span></p>
                    <p>手机号码：<span>${ CUR_USER.u_phone }</span></p>
                    <p>邮箱：<span>${ CUR_USER.u_email }</span></p>
                    <p>职位：<span>${ CUR_USER.u_position }</span></p>
                </td>
               
                <td class="btd">
                        <p></p><br><br><br>
                        <p><a href="个人资料不正确？"></a></p>
                        <p>所在省份：<span id="sheng">${sheng}</span></p>
                        <p>所在城市：<span id="shi">${shi}</span></p>
                        <p>所在公司：<span>${ CUR_USER.u_company }</span></p>
                        <p>联系地址：<span>${ CUR_USER.u_addressDetail }</span></p>
                </td>
               
            </tr>
        </table>
    </div>
</div>
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>