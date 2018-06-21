/*法人姓名*/
function leagle_name(value){
	if(value==''){
		return false;
	}
	return true;
}
/*法人手機*/
function leagle_phone(value){
	if(value==''){
		return -1;
	}else if(!(/^[1][3,4,5,7,8][0-9]{9}$/).test(value)){
		return 0;
	}else{
		return 1;
	}
}
/*法人郵箱*/
function leagle_email(value){
	if(value==''){
		return -1;
	}else if(!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/).test(value)){
		return 0;
	}else{
		return 1;
	}
}

$(function(){
	$('#legal1').blur(function(){
		if(leagle_name($(this).val())){
			$('#legal1ABC').text('√').css('color','green');
		}else{
			$('#legal1ABC').text('法人姓名不能為空').css('color','red');
		}
	})
	$('#legal2').blur(function(){
		if(leagle_phone($(this).val())==-1){
			$('#legal2ABC').text('法人手机号码不能为空').css('color','red');
		}else if(leagle_phone($(this).val())==0){
			$('#legal2ABC').text('法人手机格式不对').css('color','red');
		}else{
			$('#legal2ABC').text('√').css('color','green');
		}
	})
	$('#legal3').blur(function(){
		if(leagle_email($(this).val())==-1){
			$('#legal3ABC').text('法人邮箱不能为空').css('color','red');
		}else if(leagle_email($(this).val())==0){
			$('#legal3ABC').text('法人邮箱格式不对').css('color','red');
		}else{
			$('#legal3ABC').text('√').css('color','green');
		}
	})
	
	
	
	
	
	$('#com_managerName').blur(function(){
		if(leagle_name($(this).val())){
			$('#com_managerNameABC').text('√').css('color','green');
		}else{
			$('#com_managerNameABC').text('总经理姓名不能为空').css('color','red');
		}
	})
	$('#com_managerPhone').blur(function(){
		if(leagle_phone($(this).val())==-1){
			$('#com_managerPhoneABC').text('经理手机号码不能为空').css('color','red');
		}else if(leagle_phone($(this).val())==0){
			$('#com_managerPhoneABC').text('经理手机格式不对').css('color','red');
		}else{
			$('#com_managerPhoneABC').text('√').css('color','green');
		}
	})
	$('#com_managerEmail').blur(function(){
		if(leagle_email($(this).val())==-1){
			$('#com_managerEmailABC').text('经理邮箱不能为空').css('color','red');
		}else if(leagle_email($(this).val())==0){
			$('#com_managerEmailABC').text('经理邮箱格式不对').css('color','red');
		}else{
			$('#com_managerEmailABC').text('√').css('color','green');
		}
	})
})

function checkLeagle(){
	var form=$('#information');
	var showInfo=$('#showInfo');
	var i=leagle_name($('#legal1').val());
	if(i){
		showInfo.text("");
	}else{
		showInfo.text("法人姓名不能为空！").css('color','red');
		return;
	}
	
	var j=leagle_phone($('#legal2').val());
	if(j==-1){
		showInfo.text('法人手机号码不能为空').css('color','red');
		return;
	}else if(j==0){
		showInfo.text('法人手机格式不对').css('color','red');
		return;
	}else{
		showInfo.text('');
	}
	
	j=leagle_email($('#legal3').val());
	if(j==-1){
		showInfo.text('法人邮箱不能为空').css('color','red');
		return;
	}else if(j==0){
		showInfo.text('法人邮箱格式不对').css('color','red');
		return;
	}else{
		showInfo.text('');
	}
	
	
////////////////
	i=leagle_name($('#com_managerName').val());
	if(i){
		showInfo.text("");
	}else{
		showInfo.text("经理名不能为空！").css('color','red');
		return;
	}
	
	j=leagle_phone($('#com_managerPhone').val());
	if(j==-1){
		showInfo.text('经理手机号码不能为空').css('color','red');
		return;
	}else if(j==0){
		showInfo.text('经理手机格式不对').css('color','red');
		return;
	}else{
		showInfo.text('');
	}
	
	j=leagle_email($('#com_managerEmail').val());
	if(j==-1){
		showInfo.text('经理邮箱不能为空').css('color','red');
		return;
	}else if(j==0){
		showInfo.text('经理邮箱格式不对').css('color','red');
		return;
	}else{
		showInfo.text('');
	}
	
	form.submit()
}