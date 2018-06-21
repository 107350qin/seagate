<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_reg.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/user_reg.js"></script>
<script src="${pageContext.request.contextPath}/js/Area.js"></script>
<script src="${pageContext.request.contextPath}/js/AreaData_min.js"></script>
<script src="${pageContext.request.contextPath}/js/com_reg.js"></script>
<title>Insert title here</title>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<form action="${pageContext.request.contextPath}/user/regDo" method="post">
<div id="twoa">

    <div id="centera" style="width:30%;margin:0 auto;margin-top:50px;padding:80px;height: 630px;">
        <div id="center1a">
          <div id="text3a" style="width:500px;">
              <a style="text-decoration: none;color:black;font-weight:bold;margin-left :65px;">个人用户注册</a>
              <a href="${pageContext.request.contextPath}/com/reg" style="margin-left:50px;text-decoration: none;color:black;">企业用户注册</a>
          </div>
        </div>
        <div id="phonea">
          <div id="phonenumbera">
           <span>手机号码</span>
          </div>
           <div id="boxa">
            <input type="text" name="u_phone" id="phone1a"><br/>
               <span id="checkExistPhone"></span>
           </div>
        </div>
        <div style="margin-top:25px;">
           <span style="font-size: 14px;margin-left: 60px;">密码</span>
            <input style="height:35px;width:228px;background-color: white;" onblur="checkPassword(this.value)" type="password" name="u_password" id="u_password"><br/>
               <span style="margin-left:90px;display: block;height:0px;" id="checkPassword"></span>
        </div>
        <div id="emaila" style="margin-top: 25px;">
            <div id="text4a">
                <span>邮箱</span>
            </div>
            <div id="box2a">
                <input onblur="vailEmail()" type="text" name="u_email" id="email1a"><br/>
                <span id="checkEmail"></span>
            </div>


        </div>
        <div id="usernamea">
            <div id="text5a">
                <span>姓名</span>
            </div>
            <div id="box3a">
                <input style="background-color: white;" type="text" name="u_name"  id="namea"><br/>
                <span id="checkExistname"></span>
            </div>
        </div>
        <div id="comnamea">
          <div id="comname1a">
              <span>所在公司</span>
          </div>
            <div id="box6a">
                <input type="text" name="u_company" id="comname2a" onblur="checkCompanySpan(this.value)"><br/>
                <span id="checkCompanySpan"></span>
            </div>
        </div>
        <div id="worka">
            <div id="work1a">
                <span>职位</span>
            </div>
            <div id="box7a">
                <input type="text" name="u_position"  id="work2a" onblur="checkPosition(this.value)"><br/>
                 <span id="checkPositionSpan"></span>
            </div>
        </div>
        <div id="citya">
            <div id="city1a">
                <span>所在城市</span>
            </div>
            <div id="box8a">
             <select name="sheng" style="height: 40px;" id="seachprov" class="select,box9a" name="com_address" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
             <select name="shi" style="height: 40px;" id="seachcity" class="select,box9a" name="com_address" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>
             <span id="seachdistrict_div"><select name="xian" style="height: 40px;" id="seachdistrict" class="select" name="com_address"></select></span>
            </div>
        </div>
        <div id="yzma">
         <div id="yzm1a">
             <span>验证码</span>
         </div>
            <div id="box11a">
            	<input type="text" name="yzm" id="yzm2a"/>
            </div>
            <img id="box12a" onclick='this.src=this.src+"?c="+Math.random()' src="${pageContext.request.contextPath}/user/VAL"/>
            <span id="checkVAL" style="margin-left: 45px;"></span>
        </div>
        <div id="submita" style="margin-top:50px;">
          <a href=""> <input type="submit" value="提交审核" class="submita"></a>
          <a style="display:block;padding-top:15px; width:220px;text-align:center; margin: 0 auto;" href="${pageContext.request.contextPath}/user/login">已有账号，前往登陆</a>
        </div>



    </div>
</div>
</form>
<%@ include file="./footer.jsp" %>
</body>
</html>