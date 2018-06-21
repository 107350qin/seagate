<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/com_companyOther.css">
<title>Insert title here</title>
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.js"></script>
<script src="${pageContext.request.contextPath}/js/com_regOthre.js"></script>
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
                <div class="imgu231"><img src="${pageContext.request.contextPath}/img/sys/u231.png"><div class="number">5</div>
                    <div class="process"><span>提交审核</span></div>
                </div>
            </div>

            <form id="information" action="${pageContext.request.contextPath}/com/regDoAther" method="post">

                <div class="inforCorporate">

                        <span>面向的客户行业(最多选择五项)</span>

                </div>
                <div id="industry">
                 <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="电信业" id="a"><label for="a">电信业</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="媒体娱乐" id="b"><label for="b">媒体娱乐</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="电子能源" id="c"><label for="c">电子能源</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="CPG" id="d"><label for="d">CPG</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="零售业" id="e"><label for="e">零售业</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="交通运输" id="f"><label for="f">交通运输</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="金融" id="g"><label for="g">金融</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="保险" id="h"><label for="h">保险</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="电子制造" id="i"><label for="i">电子制造</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="制造" id="j"><label for="j">制造</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="化工石油" id="k"><label for="k">化工石油</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="航空" id="l"><label for="l">航空</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="教育" id="m"><label for="m">教育</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="政府" id="n"><label for="n">政府</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="国防" id="o"><label for="o">国防</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="生命科学" id="p"><label for="p">生命科学</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="计算机服务" id="q"><label for="q">计算机服务</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="专业服务" id="r"><label for="r">专业服务</label></div>
                <div class="Corporatesan"><input type="checkbox" name="com_customerTrade" value="其他" id="s"><label for="s">其他</label></div>
                    </div>

                <div class="inforCorporate">
                    <span >子行业(最多选择十项)</span>
                </div>


                <div id="Subindustry">
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="电信运营商" id="a1"><label for="a1">电信运营商</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="经营互联网服务的电信业单位" id="a2"><label for="a2">经营互联网服务的电信业单位</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="供电局 核电站电厂 电力公司 热能" id="a3"><label for="a3">供电局 核电站电厂 电力公司 热能</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="水电站 水厂 水力公司 水利局" id="a4"><label for="a4">水电站 水厂 水力公司 水利局</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="天然气 煤气公司" id="a5"><label for="a5">天然气 煤气公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="网上电力能源类单位" id="a6"><label for="a6">网上电力能源类单位</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="仓储式商城或商场 商厦 购物中心 百货总公司" id="a7"><label for="a7">仓储式商城或商场 商厦 购物中心 百货总公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="直销 电视购物" id="a8"><label for="a8">直销 电视购物</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="家电城 家电超市 电脑城 电脑商厦 建材城 建材超市" id="a9"><label for="a9">家电城 家电超市 电脑城 电脑商厦 建材城 建材超市</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="服装 服饰专卖店" id="a10"><label for="a10">服装 服饰专卖店</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="餐饮业 连锁快餐店" id="a11"><label for="a11">餐饮业 连锁快餐店</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="书店 文具 办公用品商店" id="a12"><label for="a12">书店 文具 办公用品商店</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="无法区分的零售行业专卖店" id="a13"><label for="a13">无法区分的零售行业专卖店</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="超市 自选市场 连锁市场" id="a14"><label for="a14">超市 自选市场 连锁市场</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="机场" id="a15"><label for="a15">机场</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="药店 保健品商店 医疗器械商店" id="a16"><label for="a16">药店 保健品商店 医疗器械商店</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="铁路局 铁路公司" id="a17"><label for="a17">铁路局 铁路公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="网上零售类" id="a18"><label for="a18">网上零售类</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="城市运输 高速公路公司" id="a19"><label for="a19">城市运输 高速公路公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="航空公司 民航管理局" id="a20"><label for="a20">航空公司 民航管理局</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="货运公司 快递公司 物流公司" id="a21"><label for="a21">货运公司 快递公司 物流公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="29个省级交通厅及城市交通局" id="a22"><label for="a22">29个省级交通厅及城市交通局</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="旅行社" id="a23"><label for="a23">旅行社</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="远洋运输 其他轮船公司 船运公司运输" id="a24"><label for="a24">远洋运输 其他轮船公司 船运公司运输</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="网上交通 旅游类单位" id="a25"><label for="a25">网上交通 旅游类单位</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="港口 码头" id="a26"><label for="a26">港口 码头</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="证监会 国债登记清算公司" id="a27"><label for="a27">证监会 国债登记清算公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="饭店 酒店 宾馆 公寓" id="a28"><label for="a28">饭店 酒店 宾馆 公寓</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="证劵公司 上海证券交易所 深圳证卷交易所" id="a29"><label for="a29">证劵公司 上海证券交易所 深圳证卷交易所</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="证券公司营业部" id="a30"><label for="a30">证券公司营业部</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="外资银行" id="a31"><label for="a31">外资银行</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="信托投资公司 商品交易所 期贷公司" id="a32"><label for="a32">信托投资公司 商品交易所 期贷公司</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="网上金融机构" id="a33"><label for="a33">网上金融机构</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="银行非主业部门" id="a34"><label for="a34">银行非主业部门</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="电子 电器 仪器 仪表 电线电缆" id="a35"><label for="a35">电子 电器 仪器 仪表 电线电缆</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="其他金融机构" id="a36"><label for="a36">其他金融机构</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="网上电子制造类单位" id="a37"><label for="a37">网上电子制造类单位</label></div>
                    <div class="Subindustry"><input type="checkbox" name="com_subTrade" value="通讯设备制造公司" id="a38"><label for="a38">通讯设备制造公司</label></div>


                </div>
<div id="showInfo" style="margin-left:0px;heigth:40px;width:300px;">*</div>
                <input onclick="checkSize()" type="button" value="下一步" id="button2">
            </form>

        </div>

    </div>
<%@ include file="./footer.jsp" %>
</body>
</html>