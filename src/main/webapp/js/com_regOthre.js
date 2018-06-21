function checkSize(){
	var showInfo=$('#showInfo');
	var information=$('#information');
	$(function(){
		var input1=$('.Corporatesan input');
		var num=0;
		for(var i=0;i<input1.length;i++){
			if(input1[i].checked==true){
				num++;
			}
		}
		if(num==0){
			showInfo.text('面向客户行业最少选择1项！').css('color','red');
			return;
		}
		if(num>5){
			showInfo.text('面向客户行业最多选择5项！').css('color','red');
			return;
		}
		
		var input2=$('.Subindustry input');
		var num1=0;
		for(var i=0;i<input2.length;i++){
			if(input2[i].checked==true){
				num1++;
			}
		}
		if(num1==0){
			showInfo.text('子行业最少选择1项！').css('color','red');
			return;
		}
		if(num1>10){
			showInfo.text('子行业最多选择10项！').css('color','red');
			return;
		}else{
			showInfo.text('*').css('color','white');
			information.submit();
		}
	})
}