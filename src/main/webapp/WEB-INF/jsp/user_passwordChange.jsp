<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_personalCenter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_passwordChange.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_base.jsp" %>
<div class="nav">
    <a href="">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp; </a>
    <a href="">公告资讯</a>
    <a href="">市场活动</a>
    <a href="">在线学习</a>
    <a href="" style="background-color:#00C4C4;">个人中心</a>
</div>



<!-- 公告通知呈现部分开始 -->
<div class="all">
    <div class="left" style="height:585px;">
        <a href="" style="background-color: rgb(210, 248, 235);">个人资料</a>
        <a href="">我的消息</a>
        <a href="">我的收藏</a>
        <a href="">我的学习</a>
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
                        <img src="${pageContext.request.contextPath}/img/lunbo/a.JPG" alt="">
                        <p>张三</p>
                    </div>
                    <div class="bdiv">
                        <p>积分 ：<span>2568</span></p>
                        <p>成长值 ：<span>568</span></p>
                        <p>等级 ：<span>新兵二级</span></p>
                    </div>
                </td>
                <td class="btd">
                    <p></p>
                    <p>角色 ：<span>希捷Value合作伙伴（VSPPP）</span></p>
                    <p>所在公司 ：<span>北京天极科技有限公司</span></p>
                </td>
            </tr>
            








            <tr class="ctr">
                <td  class="atd" style="padding-bottom:29px;">
                    <p>
                        <a href="">基本资料</a>
                        <a href="">头像设置</a>
                        <a style="background-color: rgb(175, 224, 171);">密码修改</a>
                    </p><br>
                    <form action="">
                        <p><span>当前密码</span><input placeholder="密码长度为6到16位英文字符" type="text" name="" id=""></p>
                        <p><span> 新密码 </span><input placeholder="密码长度为6到16位英文字符" type="text" name="" id=""></p>
                        <p><span>确认密码</span><input placeholder="密码长度为6到16位英文字符" type="text" name="" id=""></p>
                        <p><input class="submit" type="submit" value="保存"></p>
                    </form>
                </td>

            </tr>
        </table>
    </div>
</div>
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>