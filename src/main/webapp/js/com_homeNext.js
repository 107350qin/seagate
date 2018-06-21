function upload(){
	if($('#files').val()==""){
		alert('您没有选择文件，无法上传！');
		return;
	}
	if($('#chapter_name').val()==""){
		alert('您没有输入章名，无法上传！');
		return;
	}
	var files=$("#files").prop('files');
	for(var i=0;i<files.length;i++){
		var fileName=$(files)[i].name;
		
		var index1=fileName.lastIndexOf(".")+1;  
		var index2=fileName.length;
		var after=fileName.substring(index1,index2);//后缀名  
		if(!support(after)){
			alert('您上传的文件类型不符合')
			return;
		}
	}
	$('#form').submit();
}


function support(value){
	var string=['wmv','asf','asx','rm','rmvb','mpg','mpeg','mpe','3gp','mov','m4v','mp4','avi','dat','mkv','flv','vob','MOD','OGG','MOV','DV'];
	var flag=false;
	for(var i=0;i<string.length;i++){
		if(value==string[i]){
			flag=true;
		}
	}
	return flag;
}