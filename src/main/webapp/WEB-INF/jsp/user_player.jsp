<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="Shortcut Icon" href="${pageContext.request.contextPath}/img/qin.ico">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_player.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_base.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/user_index_header.css">
<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/jwplayer-7.2.2/jwplayer.js"></script>
<script>jwplayer.key="iP+vLYU9H5KyhZeGt5eVuJJIoULUjltoaMeHXg==";</script>
<style type="text/css">
a:hover{
text-decoration:none;
}
 .video{  
        height: 100%;  
        width: 100%;  
        border: 7px solid #fff;  
        border-radius: 10px;  
        border-color:rgba(255,255,255,0.3) ;  
        background: #fff;  
        background-clip: content-box;  
       }  
</style>
<script type="text/javascript">
$(function(){
    var s=$('.silde').children('h6').length;
    for(var i=1;i<=s;i++){
    /* 章号 */
     $('.silde').children('h6').eq(i-1).children('span').eq(0).text('第'+i+'章');
     /* 节号 */
     for(var j=1;j<=$('.silde').children('div').eq(i-1).children('a').length;j++){
    	 $('.silde').children('div').eq(i-1).children('a').eq(j-1).children('span').eq(0).text('第'+j+'节');
    	 $('.silde').children('div').eq(i-1).children('a').eq(j-1).hover(function(){
    		 $(this).css('background-color','#F80492');
    	 },function(){
    		 $(this).css('background-color','#1AA139');
    	 });
     }
     
    }
 })
 
 
var thePlayer;  
window.onload=function(){  
 
 $('.video').css('display','block')  
   

 //调用播放器  
     var myid=2678;
 	 var section_link=$('.section_link').text();
 	 var section_title=$('.section_title').text();
 	 var c_name=$('.c_name').text();
 	 var index=$('.index').text();
 	 var ch_title=$('.ch_title').text();
     poster = 'test.jpg';  
     thePlayer=jwplayer("jw_player").setup({  
         file:'/seagate/upload/course/'+c_name+'/第'+index+'章  '+ch_title+'/'+section_link,
         image: poster,  
         primary: 'flash',  
         flashplayer: 'jwplayer.flash.swf',      
         html5player: 'jwplayer.html5.js',  
         width:1062,  
         height:558,  
         startparam:true
     });  
 }
window.onbeforeunload= function(event) { 
	$(function(){
		var po=thePlayer.getPosition();
		var id=$('.section_id').text();
		$.getJSON("${pageContext.request.contextPath}/user/position",{position:po,section_id:id},function(data){
		});
	})
	
}

/* window.onload= function(event) { 
	$(function(){
		var id=$('.section_id').text();
		var position;
		$.getJSON("${pageContext.request.contextPath}/user/getPosition",{section_id:id},function(data){
			
		});
		
		if (thePlayer.getState() != 'PLAYING') {    //若当前未播放，先启动播放器 
		    thePlayer.play(); 
		    } 
		thePlayer.seek(position);
	})
	
} */
</script>
<title>Insert title here</title>
</head>
<body style="height:1500px;width:100%;background-color:white;">
<p class="section_id" style="display:none;">${ section.section_id }</p>
<p class="section_link" style="display:none;">${ section.section_link }</p>
<p class="section_title" style="display:none;">${ section.section_title }</p>
<p class="c_name" style="display:none;">${ course.c_name }</p>
<p class="index" style="display:none;">${ index }</p>
<p class="ch_title" style="display:none;">${ chapter.ch_title }</p>
    <div id="top" style="margin:0 auto;">
        <div id="top1">
            <div id="u2_png">
                <a href="">
                    <img src="${pageContext.request.contextPath}/img/u2.png">
                </a>
            </div>
            <div id="text">
                <a href="">希 捷 精 英 汇</a>
            </div>
            <div id="top2" style="margin-top: 50px;float: right;">
                <div id="u31_png">
                    <img src="${pageContext.request.contextPath}/img/u31.png" class="email">
                </div>
                <div id="text2">
                    <span>&nbsp;service@seagateelite.com</span>
                </div>
                <div id="top3" style="margin-left: 70px;">
                    <div id="u25_pn">
                        <img src="${pageContext.request.contextPath}/img//u25.png" class="phone">
                    </div>
                    <div id="text3">
                        <span>400-820-1234</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
<div class="nav" style="margin-left: 100px;">
    <a href="${pageContext.request.contextPath}/user/index">&nbsp;&nbsp;&nbsp;首页&nbsp;&nbsp;&nbsp; </a>
    <a href="${pageContext.request.contextPath}/user/notice">公告资讯</a>
    <a href="${pageContext.request.contextPath}/user/marketActivity">市场活动</a>
    <a href="${pageContext.request.contextPath}/user/studyOnline" style="background-color:#00C4C4;">在线学习</a>
    <c:if test="${CUR_USER!=null}">
    <a href="${pageContext.request.contextPath}/user/personalCenter">个人中心</a>
    </c:if>
</div>
 <div class="main" style="width:100%;height:80%;background-color:#e7e3e3;">
        <div style="height:570px;width:100%;background-color:#31373a;">
        <div  style="float:left;width:68%;height:572px;margin-left:100px;background-color:#484545;">
        	<!-- 添加的插件开始 -->
        		<div class="video">  
            		<div id="jw_player"></div>  
        		</div> 
        	<!-- 添加的插件 结束-->
        </div>
            <div class="float-left" style="width:280px;height:540px;color:rgb(233,203,216);">
                <h4 style="text-align: center;width:80%">目录</h4>
                <div class="silde">
                    
	                    	<% int index=1; %>
                    <c:forEach var="chapter" items="${ course.chapterList }">
                    	<c:if test="${fn:length(chapter.list)>0}">
                    		<h6 style="margin-left: 15px;font-weight: normal;"><span style="color:white;"></span>  &nbsp;&nbsp;&nbsp;   ${ chapter.ch_title }</h6>
	                    	<div>
	                    	
	                    	
	                    	<c:forEach var="section" items="${ chapter.list }">
	                    		<a href="${pageContext.request.contextPath}/user/startStudy?c_id=${ course.c_id }&section_id=${ section.section_id }&index=<%=index%>" style="display:block;border-bottom:solid 0.1px white; text-indent:25px;background-color: #434D50;">
	                        		<span style="color: white;"></span>&nbsp;&nbsp;
	                        		<span style="color: white;">${ section.section_title }</span>
	                    		</a>
	                    	</c:forEach>
	                    	</div>
                    	</c:if>
	                    		<% index++; %>
                    </c:forEach>
                    
                </div>
            </div>
        </div>
    </div>
   
<%@ include file="./footer.jsp" %>
    <script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
</body>
</html>