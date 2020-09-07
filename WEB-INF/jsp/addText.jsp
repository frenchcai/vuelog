<%@page import="java.text.SimpleDateFormat,java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
String path = request.getContextPath(); 
// 获得项目完全路径（假设你的项目叫MyApp，那么获得到的地址就是 http://localhost:8080/MyApp/）: 
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; 
%> 
    
<%   SimpleDateFormat sdf2 = new SimpleDateFormat("yyyyMMddHHmmssss");
		String date=sdf2.format(new Date()); 
		request.setAttribute(date, "date");
		%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>发布文章</title>
 <meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
	<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../../js/jquery.cookie.js"></script>
 <script type="text/javascript">
 if($.cookie('user')!="undefined"){
	 var user=JSON.parse($.cookie('user'));
 }
 
 function repic(inputid,show){
	 var data= $("#"+inputid).val();
	 var username=user.user.username;
	 console.log(data);
	 $("#"+show).empty();
	 $.ajax({
		  url: "/mybatis_first_demo2/deletePicServlet", 
          type: 'GET',  
          data: "picpath="+data+"&username="+username,  
          processData: false,
          contentType: false,
          dataType: 'json',  
          success:function(json){
        	  console.log("success delete");
          },
	 		error:function(){
        	  console.log("error");
          }
          
  
	 })
	  $("#"+inputid).click();
	
	 
 };
 
 function setpicpath(formid,inputid,show){
			 console.log("1223");
		     var animateimg = $("#"+inputid).val(); //获取上传的图片名 带//
		     var imgarr=animateimg.split('\\'); //分割
		     var myimg=imgarr[imgarr.length-1]; //去掉 // 获取图片名
		     var houzui = myimg.lastIndexOf('.'); //获取 . 出现的位置
		     var ext = myimg.substring(houzui, myimg.length).toUpperCase();  //切割 . 获取文件后缀
		     
		     var file = $('#'+inputid).get(0).files[0]; //获取上传的文件
		     var fileSize = file.size;           //获取上传的文件大小
		     var maxSize = 10485760;              //最大10MB
		     if(ext !='.PNG' && ext !='.GIF' && ext !='.JPG' && ext !='.JPEG' && ext !='.BMP'){
		         alert('文件类型错误,请上传图片类型');
		     }else if(parseInt(fileSize) >= parseInt(maxSize)){
		        alert('上传的文件不能超过10MB');
		        
		         
		     }else{  
		    	 var user=JSON.parse($.cookie('user'));
		    	 var username=user.user.username;
		         var data = new FormData($('#'+formid)[0]); 
		         console.log(data);
		         $.ajax({  
		             url: "/mybatis_first_demo2/insertPicPathServlet?username="+username, 
		             type: 'POST',  
		             data: data,  
		             processData: false,
		             contentType: false,
		             dataType: 'json',  
		             success:function(json){
		            	 for(var i=0;i<json.length;i++){
		            		 console.log(json[i]);
		            		 
		            			 $("#"+show).append("<img src=./images/"+username+"/"+json[i]+" />");
		            		 }
		            		
		            	 $("#"+inputid+"picpath").val(json[0]);
		            	 console.log("inputidpicpath value"+json[0]);
		            	 $("#"+inputid).hide();
		            	 $("#reload"+inputid).show();
		            	 
		            	            	 
		             },
		             error: function(json){
		            	 console.log("11111111");
		            	 alert("不能重复上传图片，请重新上传");
		             }
		             
		         })
		         
		       
		         return false;
		        }  
		 
};
 function addText(){
	 var username=user.user.username;
	 var userID=user.user.userID;
	 var title=$("#title").val();
	 var textID=$("#textID").val();
	 var text=encodeURIComponent($("#text").val());
	 var picpath1=$("#f1picpath").val();
	 var picpath2=$("#f2picpath").val();
	 //val()方法可以获取变化后的值和变化前的值，text只能获取变化之前的值
	 if(title.length!=0&&text.length!=0){
		 $.ajax({
			 url:"/mybatis_first_demo2/addTextServlet",
			 type:"POST",
			 data:"userID="+userID+"&textID="+textID+"&title="+title+"&text="+text+"&picpath1="+picpath1+"&picpath2="+picpath2+"&username="+username,
			 dataType:"json",
			 success:function(json){
				 alert("发布成功");
				 $("#writetext").hide();
				$("#success").show();
				 
				 
			 },
			 error:function(){
				 alert("发布失败");
			 }
		 })
		 
	 }else{
		 alter("文章标题和内容不能为空");
	 }
	 
 }
 
 $(document).ready(function(){

	 $("#reloadf1").hide();
	 $("#reloadf2").hide();
	 $("#success").hide();
	 
	 
	 
	 

 });
 
 

 </script>
</head>
<body>
			<div class=row style="background-color: #edf3ff">

				<div class="col logo">
					<h3>
						<a href="jietao.jsp">&nbsp&nbsp 捷淘——记录生活美好</a>
					</h3>
				</div>
	
			</div>

<div class="panel panel-primary" id=writetext>
	<div class="panel-heading">
		<h3 class="panel-title">编写文章从这里开始</h3>
	</div>
	
	<div class="panel-body">
		
		<div role="form">
	<div class="form-group">
	<input type=hidden value=<%=date %>	 id=textID />
		<label for="name">文章标题</label>
		<input type="text" class="form-control" id="title" 
			   placeholder="请输入标题">
	</div>
	
	
		
	<div class="col-xs-6 col-sm-6 col-md-6 col-log-6">
		<form class="form-group" id="form1"  method=POST enctype=multipart/form-data > 
		<label >选择第一张图片</label>
		<input type="file" id="f1" name="f" onchange="setpicpath('form1','f1','show1')" />
		 
		 
        	<div class="thumbnail" id="show1">
           
        	</div>
        	<button  id="reloadf1" class="btn btn-default" type=button onclick="repic('f1','show1')">重新上传</button>
    		</form>
    	</div>
		
		
	
		 <div class="col-xs-6 col-sm-6 col-md-6 col-log-6">
		 <form class="form-group"  method=POST enctype=multipart/form-data id="form2">
		<label >选择第二张图片</label>
		<input type="file" id="f2" name="f2" onchange="setpicpath('form2','f2','show2')"/>
        	<div class="thumbnail" id="show2">
           
        	</div>
        	
        	<button  id="reloadf2" class="btn btn-default" type=button onclick="repic('f2','show2')">重新上传</button>
    	</form>
    	</div>
		
		
		
	<div class="form-group" class="col-xs-12 col-sm-12 col-md-12 col-log-12">
		<label for="name">文本框</label>
	<textarea class="form-control" rows="10" id="text"></textarea>
	<input type="hidden" id='f1picpath' name='picpath1' value=''>
	<input type="hidden" id='f2picpath' name='picpath2' value=''>
	
	</div>

	<button type="submit" class="btn btn-primary" onclick="addText()">发布文章</button>
</div>
		
		
		
		
		
	</div>
</div>


<div class="panel panel-success" id=success>
	<div class="panel-heading">
		<h3 class="panel-title">发布成功</h3>
	</div>
	<div class="panel-body">
		<h1><a href="./addText.jsp">继续写文章</a></h1>
		<h1><a href="jietao.jsp">返回主页</a></h1>
	</div>
</div>

</body>
</html>