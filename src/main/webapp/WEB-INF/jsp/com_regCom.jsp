<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_companyRegistration.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/manhuaDate.1.0.css">
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery-1.7.2.min.js"></script>
<script src="${pageContext.request.contextPath}/js/manhuaDate.1.0.js"></script>
<script src="${pageContext.request.contextPath}/js/Area.js"></script>
<script src="${pageContext.request.contextPath}/js/AreaData_min.js"></script>
<script src="${pageContext.request.contextPath}/js/com_reg.js" charset="UTF-8"></script>


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
            <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u231.png"><div class="number">2</div>
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

        <form id="information" action="${pageContext.request.contextPath}/com/regDoCom" method="post" enctype="multipart/form-data">
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">公司名称</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_name" class="Corporatename"  id="com_name">
                </div>
                    <span id="comName" style="line-height:40px;margin-left:10px;"></span>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">公司密码</span>
                </div>
                <div class="Corporatesan">
                    <input type="password" name="com_password" class="Corporatename"  id="com_password">
                </div>
                <span id="comPassword" style="line-height:40px;margin-left:10px;"></span>

                   

            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">确认密码</span>
                </div>
                <div class="Corporatesan">
                    <input type="password"  class="Corporatename"  id="com_passwordAgain">
                </div>
                <span id="comPasswordAgain" style="line-height:40px;margin-left:10px;"></span>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">希捷经销商</span>
                </div>
                <div class="Corporatesan">
                    <select class="select" name="com_agencyClass" id="com_agencyClass">
                        <option value="0" selected="selected">请选择类别</option>
                        <option value="Value">Value</option>
                        <option value="Volume">Volume</option>
                    </select>
                    <select  class="select" name="com_agencyRank" id="com_agencyRank">
                        <option value="0" selected="selected">请选择级别</option>
                        <option value="VSPPP">VSPPP</option>
                        <option value="Disti">Disti</option>
                        <option value="R2">R2</option>
                        <option value="R3">R3</option>
                        <option value="R4">R4</option>
                    </select>
                </div>
                	<span id="comAgency" style="line-height:40px;margin-left:10px;"></span>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">上级代理</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_parent" class="Corporatename"id="Corporatename2">
                </div>
                <div id="dataclick2" style="line-height: 40px;"></div>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">所在城市</span>
                </div>
                <div id="Corporatesan_div">
                    <select id="seachprov" class="select" name="com_address" onChange="changeComplexProvince(this.value, sub_array, 'seachcity', 'seachdistrict');"></select>
                    <select id="seachcity" class="select" name="com_address" onChange="changeCity(this.value,'seachdistrict','seachdistrict');"></select>
                    <span id="seachdistrict_div"><select id="seachdistrict" class="select" name="com_address"></select></span>
                </div>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">公司地址</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_addressDetail" class="Corporatename" id="Corporatename3">
                </div>
                <div id="dataclick3" style="line-height: 40px;"></div>
            </div>
            
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">邮编</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_zcode" class="Corporatename" id="Corporatename4">
                </div>
                <div id="dataclick4" style="line-height: 40px;"></div>

            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">成立日期</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_born"  class="Corporatename" id="Corporatenamecheng" readonly="true"/>
                </div>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">公司人数</span>
                </div>
                <div class="Corporatesan">
                    <select class="select2" name="com_userCount" id="com_pnum">
                        <option selected="selected" value="0">请选择公司人数</option>
                        <option>1-10</option>
                        <option>10-50</option>
                        <option>50-100</option>
                        <option>100-200</option>
                        <option>200-500</option>
                        <option>500以上</option>

                    </select>
                </div>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">注册资本</span>
                </div>
                <div class="Corporatesan">
                    <select class="select2" name="com_regMoney" id="reg_money">
                        <option selected="selected" value="0">请选择公司注册资本</option>
                        <option>30万以下</option>
                        <option>30-50万</option>
                        <option>50-100万</option>
                        <option>100-500万</option>
                        <option>500-1000万</option>
                        <option>1000万以上</option>
                    </select>
                </div>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">分公司数</span>
                </div>
                <div class="Corporatesan">
                    <input type="text" name="com_branchCount" class="Corporatename" id="Corporatename5">
                </div>
                <div id="dataclick5"class="dataclick">请填写您的分公司数量</div>
            </div>
            <div class="inforCorporate">
                <div class="inforname">
                    <span class="dateCorporate">公司性质</span>
                </div>
                <div class="Corporatesan">
                    <select class="select2" name="com_property" id="com_class">
                        <option selected="selected" value="0">请选择公司性质</option>
                        <option>股份</option>
                        <option>民营</option>
                        <option>国有</option>
                        <option>上市公司</option>
                    </select>
                </div>
            </div>
            <div class="inforscanning">
                <div class="inforsaomiao">
                    <span >营业执照副</br>本扫描件</span>
                </div>
                <div class="scanning">
               <span>
                   请上传营业执照清晰彩色原件扫描件或数码照,在有效期内且年检章齐全。</br>
                   支持jpg.jpeg.png.bmp.gif格式照片,大小不超过2M。</br>
                   <input type="file" value="选择文件" class="button1" name="com_pic" id="pic1">
               </span>
                    </div>
            </div>
            <div class="inforscanning">
                <div class="inforsaomiao">
                    <span >税务登记证</br>扫描件</span>
                </div>
                <div class="scanning">
               <span>
                   请上传税务登记证原件扫描件或数码照,务必加盖公司公章。</br>
                   支持jpg.jpeg.png.bmp.gif格式照片,大小不超过2M。</br>
                   <input type="file" value="选择文件" class="button1" name="com_pic" id="pic2">
               </span>
                </div>
            </div>
            <div id="infordomain">
                <div class="inforname">
                    <span class="dateCorporate">公司介绍</span>
                </div>

                <textarea cols="70"  rows="6" name="com_desc" placeholder="请填写公司介绍,字数在500字以内"></textarea>
            </div>
            <div id="showInfo" style="line-height: 30px;height:30px;"></div>
            <input onclick="COMINFO()" type="button" value="下一步" id="button2">
        </form>

    </div>
</div>
<%@ include file="./footer.jsp" %>
</body>
</html>