/**
 * Created by pc on 2018/5/14.
 */
window.onload=function(){
    var newpassword = document.getElementById("newpassworda");
    newpassword.onblur = function (){
        var span = document.querySelector("#newpassworda + span");
        if(checkPassword(this.value)){
            span.innerText = "√";
            span.style.color = "green";
        }else{
            span.innerText = "×应为6-20个字,区分大小写";
            span.style.color = "red";
        }
    }


    var newpassword1 = document.getElementById("newpassword1a");
    newpassword1.onblur = function (){
        var span = document.querySelector("#newpassword1a + span");
        if(checkPassword(this.value)){
            span.innerText = "√";
            span.style.color = "green";
        }else{
            span.innerText = "×不匹配，请重新输入";
            span.style.color = "red";
        }
    }
};
function charCount(str){
    //验证是不是字母数字下划线的至少3种组合
    var isHavNum = 0;//是不是有数字
    var isHavUpper = 0;//是不是有大写字母
    var isHavLower = 0;//是不是有小写字母
    var isHavLine = 0;//是不是有下划线
    var isHavOther = 0;//是不是有其他的字符
    for(var i = 0;i < str.length;i++){
        var c = str.charAt(i);
        if(isNum(c)){
            isHavNum = 1;
        }else if(isLower(c)){
            isHavLower = 1;
        }else if(isUpper(c)){
            isHavUpper = 1;
        }else if(isLine(c)){
            isHavLine = 1;
        }else {
            isHavOther = 1;
            break;
        }
    }
    return isHavOther==1?0:(isHavNum+isHavLower+isHavUpper+isHavLine);
}
/**
 * 验证密码是否符合规范
 * @param username
 */
function checkPassword(newpassword){
    // ""  0  false undefined null
    if(newpassword){//验证非空
        if(newpassword.length >= 8 && newpassword.length <= 20){//验证长度
            return charCount(newpassword) >= 3;
        }
    }
}
function checkPassword(newpassword1){
    // ""  0  false undefined null
    if(newpassword1){//验证非空
        if(newpassword1.length >= 8 && newpassword1.length <= 20){//验证长度
            return charCount(newpassword1) >= 3;
        }
    }
}
