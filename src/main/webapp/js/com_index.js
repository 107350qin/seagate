function checkSubmit(){
	if($('#Corporatename').val()==""){
		alert("课程名字不能为空")
		return;
	}
	if($('#c_class').val()=="0"){
		alert("您没有选择课程类型")
		return;
	}
	if($('#c_desc').val()==""){
		alert("课程简介不能为空")
		return;
	}
	if($('#tupian').val()==""){
		alert("您没有上传课程图片")
		return;
	}
	
	var index1=$('#tupian').val().lastIndexOf(".")+1;  
	var index2=$('#tupian').val().length;
	var after=$('#tupian').val().substring(index1,index2);//后缀名  
	if(!support(after)){
		alert("图片格式不正确")
		return;
	}
	
	var form=$('#information');
	form.submit();
}


function support(value){
	var string=['jpg','png','gif','bmp','jpeg'];
	var flag=false;
	for(var i=0;i<string.length;i++){
		if(value==string[i]){
			flag=true;
		}
	}
	return flag;
}