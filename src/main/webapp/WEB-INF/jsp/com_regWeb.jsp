<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_companyWebsite.css">
<title>Insert title here</title>
<style type="text/css">
.showInfo{
text-indent: 15px;
line-height:35px;
}
</style>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/com_companyContact.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/com_companyWebsite.js"></script>
</head>
<body>
<%@ include file="./user_login_header.jsp" %>
<div id="Lower" style="width:70%;margin:0 auto;margin-top:50px;margin-bottom: 200px;">
        <div id="attribute">
            <div id="typefacezhuce">
            <div class="Typeface">
                <a style="color:black;text-decoration: none;" href="${pageContext.request.contextPath}/user/reg">个人用户注册</a>
            </div>
            <div class="Typeface">
                <a style="font-weight: bold;">企业用户注册</a>
            </div>
        </div>
            <div id="circular">
                <div class="imgu228"><img src="${pageContext.request.contextPath}/img/sys/u228.png" ><div class="number">1</div>
                    <div class="process"><span>公司基本信息</span></div>
                </div>
                <div class="imgu233"><img src="${pageContext.request.contextPath}/img/sys/u233.png"></div>
                <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u228.png"><div class="number">2</div>
                    <div class="process"><span>联系人信息</span></div>
                </div>
                <div class="imgu233"><img src="${pageContext.request.contextPath}/img/sys/u233.png"></div>
                <div class="imgu231"> <img src="${pageContext.request.contextPath}/img/sys/u228.png"><div class="number">3</div>
                    <div class="process"><span>网站负责人信息</span></div>
                </div>
                <div class="imgu233"><img src="${pageContext.request.contextPath}/img/sys/u233.png"></div>
                <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u231.png"><div class="number">4</div>
                    <div class="process"><span>其他信息</span></div>
                </div>
                <div class="imgu233"> <img src="${pageContext.request.contextPath}/img/sys/u233.png"></div>
                <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u231.png"><div class="number">5</div>
                    <div class="process"><span>提交审核</span></div>
                </div>
            </div>

            <form id="information" action="${pageContext.request.contextPath}/com/regDoWeb" method="post">

                <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">姓名</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_webUsername" class="Corporatename" id="web_uname">
                </div>
                <div id="webUname" class="showInfo"></div>
                </div>


                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">职位</span>
                    </div>
                    <div class="Corporatesan">
                        <input id="web_position" type="text" name="com_webJob" class="Corporatename">
                    </div>
                    <div id="webPosition" class="showInfo"></div>
                </div>


                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">手机号码</span>
                    </div>
                    <div class="Corporatesan">
                        <input id="web_com" type="text" name="com_webPhone" class="Corporatename">
                    </div>
                    <div id="webCom" class="showInfo"></div>
                </div>


                <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">固定电话</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_webPhoneG" class="Corporatename"
                           value="选填" onfocus="javascript:if(this.value=='选填')this.value='';">
                </div>
            </div>


             <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">电子邮箱</span>
                </div>
                <div class="Corporatesan">
                    <input id="web_email" type="text" name="com_webEmail" class="Corporatename">
                </div>
                <div id="webEmail" class="showInfo"></div>
            </div>


                <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">QQ</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_webQQ" class="Corporatename"
                           value="选填" onfocus="javascript:if(this.value=='选填')this.value='';">
                </div>
            </div>


                <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">微信号</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_webWechat" class="Corporatename"
                           value="选填" onfocus="javascript:if(this.value=='选填')this.value='';">
                </div>
            </div>


                <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">微博昵称</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_webWNickname" class="Corporatename"
                           value="选填" onfocus="javascript:if(this.value=='选填')this.value='';">
                </div>
            </div>

                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">是否关键联系人</span>
                    </div>
                    <div style="margin-top:10px;" class="Corporatesan">
                        <input type="radio" name="com_webContactBoo" value="1" id="yes" class="aaa"/><label for="yes">是</label>
                        <input type="radio" name="com_webContactBoo" value="0" id="no" class="aaa"/><label for="no">否</label>
                    </div>
                </div><br/>
                <div id="showInfo" style="height:20px; width:300px;text-indent: 30px;"></div>
                <input onclick="checkLeagle()"  style="margin-left:150px;" type="button" value="下一步" id="button2">
            </form>
        </div>


</div>
<%@ include file="./footer.jsp" %>
</body>
</html>