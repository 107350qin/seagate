$(function(){
	$("#com_passworda").blur(function(){
	    	var comPassword = $("#comPassword");
	    	var patt=/^(\w){6,20}$/;
	    	if(patt.test($(this).val())){
	    		comPassword.text("√").css('color','green');
	    	}else{
	    		comPassword.text("只能输入6-20个字母、数字、下划线").css('color','red');
	    	}
	    });
	    $("#com_passwordAgaina").blur(function(){
	    	var comPasswordAgain = $("#comPasswordAgain");
	    	var patt=/^(\w){6,20}$/;
	    	if(patt.test($(this).val())){
	    		var com_password=$('#com_passworda');
	    		if($(this).val()==com_password.val()){
	    			comPasswordAgain.text("√").css('color','green');
	    		}else{
	    			comPasswordAgain.text("两次输入的密码不匹配，请重新输入").css('color','red');
	    		}
	    	}else{
	    		comPasswordAgain.text("只能输入6-20个字母、数字、下划线").css('color','red');
	    	}
	    });
})

function resetButton(){
	var patt=/^(\w){6,20}$/;
	var resetForm=$('#resetForm');
	var info=$('#info');
	if(!patt.test($("#com_passworda").val())){
		info.text("密码只能输入6-20个字母、数字、下划线").css('color','red');
		return;
	}
	
	var com_password=$('#com_passworda');
	if(!patt.test($("#com_passwordAgaina").val())){
		info.text("密码again只能输入6-20个字母、数字、下划线").css('color','red');
		return;
	}else{
		if($("#com_passwordAgaina").val()!=com_password.val()){
			info.text("两次输入的密码不匹配，请重新输入").css('color','red');
			return;
		}else{
			info.text("");
		}
	}
	resetForm.submit();
}