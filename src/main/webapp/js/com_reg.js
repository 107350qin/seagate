/**
 * Created by Administrator on 2018/5/16.
 */

 $(function (){
	        initComplexArea('seachprov', 'seachcity', 'seachdistrict', area_array, sub_array, '44', '0', '0');
	    });
$(function(){
	$("#Corporatenamecheng").manhuaDate({
        Event : "click",//可选
        Left : 0,//弹出时间停靠的左边位置
        Top : -16,//弹出时间停靠的顶部边位置
        fuhao : "-",//日期连接符默认为-
        isTime : false,//是否开启时间值默认为false
        beginY : 1949,//年份的开始默认为1949
        endY :2100//年份的结束默认为2049
    });
	

	//得到地区码
	    function getAreaID(){
	        var area = 0;
	        if($("#seachdistrict").val() != "0"){
	            area = $("#seachdistrict").val();
	        }else if ($("#seachcity").val() != "0"){
	            area = $("#seachcity").val();
	        }else{
	            area = $("#seachprov").val();
	        }
	        return area;
	    }

	    function showAreaID() {
	        //地区码
	        var areaID = getAreaID();
	        //地区名
	        var areaName = getAreaNamebyID(areaID) ;
	        alert("您选择的地区码：" + areaID + "      地区名：" + areaName);
	    }

	//根据地区码查询地区名
	    function getAreaNamebyID(areaID){
	        var areaName = "";
	        if(areaID.length == 2){
	            areaName = area_array[areaID];
	        }else if(areaID.length == 4){
	            var index1 = areaID.substring(0, 2);
	            areaName = area_array[index1] + " " + sub_array[index1][areaID];
	        }else if(areaID.length == 6){
	            var index1 = areaID.substring(0, 2);
	            var index2 = areaID.substring(0, 4);
	            areaName = area_array[index1] + " " + sub_array[index1][index2] + " " + sub_arr[index2][areaID];
	        }
	        return areaName;
	    }
	    
    $("#com_name").blur(function(){
        var comName = $("#comName");
        var patt=/^.{2,20}$/;
       
        if(!patt.test($(this).val())){
        	comName.text("公司名字长度应为2-20").css('color','red');
        }
        else{
        	checkComNameExit();
        }
    });
    $("#com_password").blur(function(){
    	var comPassword = $("#comPassword");
    	var patt=/^(\w){6,20}$/;
    	if(patt.test($(this).val())){
    		comPassword.text("√").css('color','green');
    	}else{
    		comPassword.text("只能输入6-20个字母、数字、下划线").css('color','red');
    	}
    });
    $("#com_passwordAgain").blur(function(){
    	var comPasswordAgain = $("#comPasswordAgain");
    	var patt=/^(\w){6,20}$/;
    	if(patt.test($(this).val())){
    		var com_password=$('#com_password');
    		if($(this).val()==com_password.val()){
    			comPasswordAgain.text("√").css('color','green');
    		}else{
    			comPasswordAgain.text("两次输入的密码不匹配，请重新输入").css('color','red');
    		}
    	}else{
    		comPasswordAgain.text("只能输入6-20个字母、数字、下划线").css('color','red');
    	}
    });
  
    $("#Corporatename2").blur(function(){
    	var dataclick2 = $("#dataclick2");
    	if($(this).val()!=''){
    		dataclick2.html("&nbsp;&nbsp;√").css('color','green');
    	}else{
    		dataclick2.html("&nbsp;&nbsp;上级代理不能为空").css('color','red');
    	}
    });
    
    $("#Corporatename3").blur(function(){
    	var dataclick3 = $("#dataclick3");
    	if($(this).val()!=''){
    		dataclick3.html("&nbsp;&nbsp;√").css('color','green');
    	}else{
    		dataclick3.html("&nbsp;&nbsp;公司地址不能为空").css('color','red');
    	}
    });
    
    $("#Corporatename4").blur(function(){
    	var dataclick4 = $("#dataclick4");
    	if($(this).val()!=''){
    		dataclick4.html("&nbsp;&nbsp;√").css('color','green');
    	}else{
    		dataclick4.html("&nbsp;&nbsp;邮编不能为空").css('color','red');
    	}
    });
    
});

function COMINFO(){
	 /*点击提交按钮时*/
    	var form=$('#information');
    	var showInfo=$('#showInfo');
    	
        var patt=/^.{2,20}$/;
        if(patt.test($("#com_name").val())){
        	showInfo.text("");
        }else{
        	showInfo.text("公司名字长度应为2-20").css('color','red');
        	return;
        }
        
    	patt=/^(\w){6,20}$/;
    	if(patt.test($("#com_password").val())){
    		showInfo.text("");
    	}else{
    		showInfo.text("密码只能输入6-20个字母、数字、下划线").css('color','red');
    		return;
    	}
    	
    	var com_passwordAgain = $("#com_passwordAgain").val();
    	patt=/^(\w){6,20}$/;
    	if(patt.test(com_passwordAgain)){
    		var com_password=$('#com_password');
    		if(com_passwordAgain==com_password.val()){
    			showInfo.text("");
    		}else{
    			showInfo.text("两次输入的密码不匹配，请重新输入").css('color','red');
    			return;
    		}
    	}else{
    		showInfo.text("密码again只能输入6-20个字母、数字、下划线").css('color','red');
    		return;
    	}
        
    	var com_agencyClass = $("#com_agencyClass").val();
    	if(com_agencyClass!='0'){
    			showInfo.text("");
    	}else{
    		showInfo.text("经销商类别没有选择！").css('color','red');
    		return;
    	}
    	
    	var com_agencyRank = $("#com_agencyRank").val();
    	if(com_agencyRank!='0'){
    		showInfo.text("");
    	}else{
    		showInfo.text("经销商级别没有选择！").css('color','red');
    		return;
    	}
    	
        var Corporatename2 = $("#Corporatename2").val();
        if(Corporatename2!=''){
        	showInfo.text("");
        }else{
        	showInfo.html("&nbsp;&nbsp;上级代理不能为空").css('color','red');
        	return;
        }
        
        var seachprov = $("#seachprov").val();
        if(seachprov!='0'){
        	showInfo.text("");
        }else{
        	showInfo.text("您还没有选择省！").css('color','red');
        	return;
        }
    	
        var seachcity = $("#seachcity").val();
        if(seachcity!='0'){
        	showInfo.text("");
        }else{
        	showInfo.text("您还没有选择市！").css('color','red');
        	return;
        }
        
        var size = $("#seachdistrict option").size();
        if(size!=1){
        	if($("#seachdistrict").val()!='0'){
        		showInfo.text("");
        	}else{
        		showInfo.text("您还没有选择县！").css('color','red');
        		return;
        	}
        }
        
        var Corporatename3 = $("#Corporatename3").val();
        	if(Corporatename3!=''){
        		showInfo.text("");
        	}else{
        		showInfo.text("公司地址不能为空！").css('color','red');
        		return;
        	}
        	
        	var Corporatename4 = $("#Corporatename4").val();
        	if(Corporatename4!=''){
        		showInfo.text("");
        	}else{
        		showInfo.text("邮编不能为空！").css('color','red');
        		return;
        	}
        
        	var Corporatenamecheng = $("#Corporatenamecheng").val();
        	if(Corporatenamecheng!=''){
        		showInfo.text("");
        	}else{
        		showInfo.text("请选择公司成立时间！").css('color','red');
        		return;
        	}
        	
        	var com_pnum = $("#com_pnum").val();
        	if(com_pnum!='0'){
        		showInfo.text("");
        	}else{
        		showInfo.text("请选择公司人数！").css('color','red');
        		return;
        	}
        	
        	var reg_money = $("#reg_money").val();
        	if(reg_money!='0'){
        		showInfo.text("");
        	}else{
        		showInfo.text("请选择公司注册资本！").css('color','red');
        		return;
        	}
        	
        	var Corporatename5 = $("#Corporatename5").val();
        	re = /^[0-9]*$/;   //判断字符串是否为数字  
        	if(Corporatename5==""){
        		showInfo.text("请填写分公司数量！").css('color','red');
        		return;
        	}
        	if (re.test(Corporatename5)){  
        			showInfo.text("");
        	}else{
        		showInfo.text("分公司数量应该是整数！").css('color','red');
        		return;
        	}
        	
        	var com_class = $("#com_class").val();
        	if(com_class!='0'){
        		showInfo.text("");
        	}else{
        		showInfo.text("请选择公司性质！").css('color','red');
        		return;
        	}
        	
        	var pic1 = $("#pic1").val();
        	if(pic1==''){
        		showInfo.text("請上傳营业执照副本扫描件！").css('color','red');
        		return;
        	}else if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(pic1)){
        		showInfo.text("营业执照副本扫描件类型必须是.gif,jpeg,jpg,png中的一种！").css('color','red');
        		return;
        	}else{
        		showInfo.text("");
        	}
        	
        	
        	var pic2 = $("#pic2").val();
        	if(pic2==''){
        		showInfo.text("請上傳税务登记证扫描件！").css('color','red');
        		return;
        	}else if(!/\.(gif|jpg|jpeg|png|GIF|JPG|PNG)$/.test(pic2)){
        		showInfo.text("税务登记证扫描件类型必须是.gif,jpeg,jpg,png中的一种！").css('color','red');
        		return;
        	}else{
        		showInfo.text("");
        	}
        	
        	form.submit();
}



function checkComNameExit(){
	var name=$("#com_name").val();
	$.ajax({
		  type: 'POST',
		  url: '/seagate/com/checkComNameExit',
		  data: {com_name:name},
		  dataType: "json",
		  contentType:"application/x-www-form-urlencoded; charset=gb2312",
			  success: function(data){
				  if(data==0){
						$('#comName').text("√").css('color','green');
					}else{
						$('#comName').text("已被注册！").css('color','red');
					}
			  }
		});
		
}