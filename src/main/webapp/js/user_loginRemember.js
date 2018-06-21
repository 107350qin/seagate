function remember(){
	var user_name=$('#user').val();
	var user_password=$('#password_text').val();
	if(!$("#haha").attr("checked")){
		$("#haha").attr("checked",true);
		$.cookie('haha',"true",{ expires:7 });
		$.cookie('user_name',user_name,{ expires:7 });
		$.cookie('user_password',user_password,{ expires:7 });
	}else{
		$("#haha").attr("checked",false);
		$.cookie('haha',"false",{ expires:0 });
        $.cookie("user_name", '', { expires: -1 });   
        $.cookie("user_password", '', { expires: -1 });      
	}
}

$(function(){
	if ($.cookie("haha") == "true") { 
		$("#haha").attr('checked',true);  
        $("#user").val($.cookie("user_name"));   
        $("#password_text").val($.cookie("user_password"));   
    }else{
    	$("#haha").attr('checked',false);  
    }  
})
