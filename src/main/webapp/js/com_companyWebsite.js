$(function(){
	$('#web_uname').blur(function(){
		if(leagle_name($(this).val())){
			$('#webUname').text('√').css('color','green');
		}else{
			$('#webUname').text('姓名不能为空').css('color','red');
		}
	})
	$('#web_position').blur(function(){
		if(leagle_name($(this).val())){
			$('#webPosition').text('√').css('color','green');
		}else{
			$('#webPosition').text('职位不能为空').css('color','red');
		}
	})
	$('#web_com').blur(function(){
		if(leagle_phone($(this).val())==-1){
			$('#webCom').text('手机号码不能为空').css('color','red');
		}else if(leagle_phone($(this).val())==0){
			$('#webCom').text('手机号码格式不对').css('color','red');
		}else{
			$('#webCom').text('√').css('color','green');
		}
	})
	$('#web_email').blur(function(){
		if(leagle_email($(this).val())==-1){
			$('#webEmail').text('邮箱不能为空').css('color','red');
		}else if(leagle_email($(this).val())==0){
			$('#webEmail').text('邮箱格式不对').css('color','red');
		}else{
			$('#webEmail').text('√').css('color','green');
		}
	})
	
})

function radioChecked(){
	var objs=$('.aaa');
	for(var i=0;i<objs.length;i++){
		if(objs[i].checked==true){
			return true;
		}
	}
	return false;
}







function checkLeagle(){
	
	var form=$('#information');
	var showInfo=$('#showInfo');
	
		if($('#web_uname').val()!=''){
			showInfo.text('');
		}else{
			showInfo.text('姓名不能为空').css('color','red');
			return;
		}
		
		if($('#web_position').val()!=''){
			showInfo.text('');
		}else{
			showInfo.text('职位不能为空').css('color','red');
			return;
		}
		
		if($('#web_com').val()==''){
			showInfo.text('电话不能为空').css('color','red');
			return;
		}else if(!(/^[1][3,4,5,7,8][0-9]{9}$/).test($('#web_com').val())){
			showInfo.text('电话格式不正确').css('color','red');
			return;
		}else{
			showInfo.text('');
		}
		
		if($('#web_email').val()==''){
			showInfo.text('邮箱不能为空').css('color','red');
			return;
		}else if(!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/).test($('#web_email').val())){
			showInfo.text('邮箱格式不正确').css('color','red');
			return;
		}else{
			showInfo.text('');
		}
		
		if(!radioChecked()){
			showInfo.text('是否指关键联系人没选择哟').css('color','red');
			return;
		}else{
			showInfo.text('');
		}
			
	form.submit()
}