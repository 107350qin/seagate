function remember(){
	var com_name=$('#com_name').val();
	var com_password=$('#com_password').val();
	if(!$("#rmbuser").attr("checked")){
		$("#rmbuser").attr("checked",true);
		$.cookie('rmbuser',"true",{ expires:7 });
		$.cookie('com_name',com_name,{ expires:7 });
		$.cookie('com_password',com_password,{ expires:7 });
	}else{
		$("#rmbuser").attr("checked",false);
		$.cookie('rmbuser',"false",{ expires:0 });
        $.cookie("com_name", '', { expires: -1 });   
        $.cookie("com_password", '', { expires: -1 });      
	}
}

$(function(){
	if ($.cookie("rmbuser") == "true") { 
		$("#rmbuser").attr('checked',true);  
        $("#com_name").val($.cookie("com_name"));   
        $("#com_password").val($.cookie("com_password"));   
    }else{
    	$("#rmbuser").attr('checked',false);  
    }  
})
