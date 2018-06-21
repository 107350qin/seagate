var ff=false;
function sendyzm(){
	var com_name=$('#com_name').val();
	var com_email=$('#com_email').val();
	if(com_name==''){
		alert('公司名字不允许为空！')
		return;
	}else if(com_email==''){
		alert('验证邮箱不允许为空！')
		return;	
	}else if(!(/^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/).test(com_email)){
		alert('邮箱格式不正确！')
		return;
	}
	$.getJSON('/seagate/com/sendEmail',{com_email:com_email},function(data){
		if(data=='1'){
			startTime();
			$('#button').css('display','none');
		}
	});
	ff=true;
}

function startTime(){
		var secondShow=$('#second');
	    var i=60;
	    var time=setInterval(function(){
	    	secondShow.text(i--+'S');
	    	if(i==-1){
	    		window.clearInterval(time);
	    		$('#button').css('display','block');
	    		secondShow.text('');
	    		$.getJSON('/seagate/com/deleteEmailVal',{},function(data){
	    		});
	    	}
	    },1000)
}

function theNext(){
	if(ff){
		$('#theForm').submit();
	}else{
		alert('输入错误')
	}
}