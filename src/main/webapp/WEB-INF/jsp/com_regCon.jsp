<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_companyContact.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/com_companyContact.js"></script>
<style type="text/css">
.setting{display:block; text-indent: 15px;}
</style>
<title>Insert title here</title>
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
                <div class="imgu231"> <img src="${pageContext.request.contextPath}/img/sys/u231.png"><div class="number">3</div>
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
            <form id="information" action="${pageContext.request.contextPath}/com/regDoCon" method="post"> 
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">法人姓名</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_legalUsername" class="Corporatename"  id="legal1">
                    </div>
                    <div class="setting" id="legal1ABC"></div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">法人手机号码</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_legalPhone" class="Corporatename"  id="legal2" />
                        <span class="error" id="photoa"></span>
                    </div>
                    <div class="setting" id="legal2ABC"></div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">法人邮箱</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_legalEmail" class="Corporatename"  id="legal3">
                        <span class="error" id="Email"></span>
                    </div>
                     <div class="setting" id="legal3ABC"></div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">法人QQ</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_legalQQ" class="Corporatename"  id="legal4"/>
                        <span class="error" id="QQ"></span>
                    </div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">法人微信号</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_legalWechat" class="Corporatename"  id="legal5"/>
                    </div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">法人微博昵称</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_legalWNickname" class="Corporatename"  id="legal6"/>
                    </div>
                </div>
                <div id="xian2"></div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">总经理姓名</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_managerName" class="Corporatename" id="com_managerName">
                    </div>
                    <div class="setting" id="com_managerNameABC"></div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">总经理手机号码</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_managerPhone" class="Corporatename"  id="com_managerPhone" >
                    </div>
                    <div class="setting" id="com_managerPhoneABC"></div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">总经理邮箱</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_managerEmail" class="Corporatename" id="com_managerEmail">
                    </div>
                    <div class="setting" id="com_managerEmailABC"></div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">总经理QQ</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_managerQQ" class="Corporatename"/>
                    </div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">总经理微信号</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_managerWechat" class="Corporatename"/>
                    </div>
                </div>
                <div class="inforCorporate">
                    <div class="inforname">
                        <span class="dateCorporate">总经理微博昵称</span>
                    </div>
                    <div class="Corporatesan">
                        <input type="text" name="com_managerWNickname" class="Corporatename"/>
                    </div>
                </div>
                <div id="showInfo" style="height:30px;"></div>
                <input onclick="checkLeagle()" type="button" value="下一步" id="button2">
            </form>
        </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>