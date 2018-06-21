//第一
function isChinaName(name) {
    var pattern = /^[\u4E00-\u9FA5]{1,6}$/;
    return pattern.test(name);
}
/*姓名判断*/
function userName(inputid, spanid) {
	$(function(){
		$(inputid).blur(function() {
			if ($.trim($(inputid).val()).length == 0) {
				$(spanid).html("× 名称没有输入").css('color','red');
			} else {
				if (isChinaName($.trim($(inputid).val())) == false) {
					$(spanid).html("× 名称不合法,请输入6位中文名").css('color','red');
				}else{
					$(spanid).html("√").css('color','green');
				}
			}
		});
		$(inputid).focus(function() {
			$(spanid).html("");
		});
	})
};
userName('#namea', "#checkExistname");





//第二
//验证手机号
function isPhoneNo(phone) {
    var pattern = /^1[34578]\d{9}$/;
    return pattern.test(phone);
}
function checkExitPhone(value){
	var flag=false;
	jQuery.ajax(
			{ url: "/seagate/user/checkPhone",
				data:{u_phone:value},
				dataType:"json",
				type:"GET",
				async:false,
				success:function(data) {
					var status = data;
					if(status == 1){
						flag = true;
					}
				}
			});
	return flag;
}
/*手机号判断*/
function userTel(inputid, spanid) {
	$(function(){
		$(inputid).blur(function() {
			if ($.trim($(inputid).val()).length == 0) {
				$(spanid).html("×手机号没有输入").css('color','red');return;
			} else {
				if (isPhoneNo($.trim($(inputid).val())) == false) {
					$(spanid).html("×手机号码不正确").css('color','red');return;
				}else{
					if(checkExitPhone($(inputid).val())){
						$(spanid).html("×手机号码已被注册").css('color','red');return;
					}
					else{
						$(spanid).html("√").css('color','green');return;
					}
				}
			}
			$(inputid).focus(function() {
				$(spanid).html("");
			});
		});
	})
};
userTel('#phone1a', "#checkExistPhone");



//第三、验证邮箱
function vailEmail(){
		var email = $("#email1a").val();
		var message = "";
		var myreg = /^([\.a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+(\.[a-zA-Z0-9_-])+/;  
		var checkSpan=$('#checkEmail');
		
		var email = jQuery("#email1a").val();
		var flag = false;
		jQuery.ajax(
				{ url: "/seagate/user/checkEmail",
					data:{email:email},
					dataType:"json",
					type:"GET",
					async:false,
					success:function(data) {
						var status = data;
						if(status == 1){
							flag = true;
						}
					}
				});
		
		if(email ==''){
			message = "邮箱不能为空！";
			checkSpan.text(message).css('color','red');
		}else if(!myreg.test(email)){
			message = "请输入有效的邮箱地址！";
			checkSpan.text(message).css('color','red');
		}else if(flag){
			message = "该邮箱地址已经被注册！";
			checkSpan.text(message).css('color','red');
		}else{
			checkSpan.text("√").css('color','green');
		}
}



function checkCompanySpan(value){
	var checkCompanySpan=$('#checkCompanySpan');
	if(value.length==0 || value.length>20){
		checkCompanySpan.text("长度不符，应为0-20个字符").css('color','red');
	}else{
		checkCompanySpan.text("√").css('color','green');
	}
}
function checkPosition(value){
	var checkPositionSpan=$('#checkPositionSpan');
	if(value.length==0 || value.length>20){
		checkPositionSpan.text("长度不符，应为0-20个字符").css('color','red');
	}else{
		checkPositionSpan.text("√").css('color','green');
	}
}





/*验证码验证*/

	$(function(){
		$('#yzm2a').blur(function(){
			var s=$(this).val();
			var checkVAL=$('#checkVAL');
			$.getJSON('/seagate/user/checkVAL',{val:s},function(data){
				if(data=='1'){
					checkVAL.text('√').css('color','green');
				}else{
					checkVAL.text("验证码不正确").css('color','red');
				}
			})
		})
		
	})

	
function checkPassword(value){
	$('#u_password').blur(function(){
		var checkPassword=$('#checkPassword');
			if(value==null){
				checkPassword.text('x密码不能为空').css('color','red');
				return;
			}else if(value.length<6 || value.length>20){
				checkPassword.text("x长度应该为6-20个字符").css('color','red');
				return;
			}else{
				checkPassword.text('√').css('color','green');
			}
	})
		
	}