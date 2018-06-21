<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_companyAudit.css">
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
                <div class="imgu231"> <img src="${pageContext.request.contextPath}/img/sys/u228.png"><div class="number">3</div>
                    <div class="process"><span>网站负责人信息</span></div>
                </div>
                <div class="imgu233"><img src="${pageContext.request.contextPath}/img/sys/u233.png"></div>
                <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u228.png"><div class="number">4</div>
                    <div class="process"><span>其他信息</span></div>
                </div>
                <div class="imgu233"> <img src="${pageContext.request.contextPath}/img/sys/u233.png"></div>
                <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u228.png"><div class="number">5</div>
                    <div class="process"><span>提交审核</span></div>
                </div>
            </div>

            <form id="information"action="${pageContext.request.contextPath}/com/regAuditDo" method="post">
                    <span>您的企业信息已经填写完成，现在可以提交审核。我们会在7个工作日内完成审核工作，审核完成后会发送短信和邮件给网站负责人，谢谢！</span></br>
                    <span>网站负责人为：张三   18767387637   zhangsan@163.com</span>
                    <input type="submit" value="提交审核" id="button2">
            </form>

        </div>


</div>
<%@ include file="./footer.jsp" %>
</body>
</html>