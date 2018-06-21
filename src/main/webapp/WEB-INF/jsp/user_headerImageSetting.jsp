<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_headerImageSetting.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_personalCenter.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<script src='${pageContext.request.contextPath}/js/jquery.min.js'></script>
	   <script>
	      $(function(){
		   $("#imgUpload").change(function(e) {
          for (var i = 0; i < e.target.files.length; i++) {
            var file = e.target.files.item(i);			
            var freader = new FileReader();
            freader.readAsDataURL(file);
            freader.onload = function(e) {
              var src = e.target.result;
              $("#big").attr("src",src);
              $("#small").attr("src",src);
            }
          }
          $('#out').attr('checked','checked');
        });
		   
		   $('.inp').change(function(){
			   $('#def').attr('checked','checked');
		   })
		})
		</script>
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
    <div class="left">
        <a href="" style="background-color: rgb(210, 248, 235);">个人资料</a>
        <a href="">我的消息</a>
        <a href="">我的收藏</a>
        <a href="">我的学习</a>
    </div>
    <div class="right">
     <form action="${pageContext.request.contextPath}/user/headerImageSettingDo" method="post" enctype="multipart/form-data">
        <table  cellspacing="0"  style="width:98.5%;">
            <tr class="atr">
                <th>个人资料</th>
                <th></th>
            </tr>

            
            <tr class="btr">
                <td class="atd">
                    <div class="adiv">
                        <img src="${pageContext.request.contextPath}/img/user/${CUR_USER.u_photo}" alt="">
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
                        <a href="${pageContext.request.contextPath}/user/personalCenter">基本资料</a>
                        <a style="background-color: rgb(175, 224, 171);">头像设置</a>
                        <a href="${pageContext.request.contextPath}/user/changePassword">密码修改</a>
                    </p><br><br>
                    <p>请选择你的头像</p>
                   

                    <p><input type="radio" name="out" value="0" id="def"><label for="def">默认头像</label></p><br>
                    <p>
                        <input value="${names[0]}"  class="inp" type="radio" name="inLeft" id="a"><label for="a"><img src="${pageContext.request.contextPath}/img/user/${names[0]}" alt=""></label> 
                        <input value="${names[1]}"   class="inp" type="radio" name="inLeft" id="b"><label for="b"><img src="${pageContext.request.contextPath}/img/user/${names[1]}" alt=""></label>
                    </p>
                    <p>
                        <input value="${names[2]}"   class="inp" type="radio" name="inLeft" id="c"><label for="c"><img src="${pageContext.request.contextPath}/img/user/${names[2]}" alt=""></label>
                        <input value="${names[3]}"   class="inp" type="radio" name="inLeft" id="d"><label for="d"><img src="${pageContext.request.contextPath}/img/user/${names[3]}" alt=""></label>
                    </p>
                    <p><a href="${pageContext.request.contextPath}/user/headerImageSetting">换一换</a></p>
                </td>

                <td  class="btd">
                    <p><input type="radio" name="out" id="out" value="1"><label for="out">自定义头像</label></p>
                    <p class="bp">
                        <img id="big" src="${pageContext.request.contextPath}/img/user/${CUR_USER.u_photo}" alt="">
                        <img id="small" src="${pageContext.request.contextPath}/img/user/${CUR_USER.u_photo}" alt="">
                        <input type="file" name="imgUpload" id="imgUpload">
                    </p>
                    <p><span class="propertyA">大小 : 200x200像素;格式jpeg、png</span><span class="propertyB">预览</span></p>
                </td>
            </tr>
            <tr class="dtr" style="height:170px;">
                <td colspan="2">
                    <input type="submit" value="保存">
                </td>
            </tr>
        </table>
</form>
    </div>
</div>
<!-- 主页内容呈现部分结束 -->
<%@ include file="./footer.jsp" %>
</body>
</html>