<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="java.text.SimpleDateFormat,java.util.Date"%>
    
<!DOCTYPE html>
<html>
<% SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy年MM月dd日");
 	String date=sdf2.format(new Date()); 
   %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	 <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../../js/jquery.cookie.js"></script>
	<script type="text/javascript" src="../../js/bootstrap.js"></script>
	<script type="text/javascript">
	var user="";
	if($.cookie('user')!="undefined"){
		 user=JSON.parse($.cookie('user'));
	}
	
	$(document).ready(function(){
		var picpath1="";
		var picpath2="";
		//alert(picpath2);
		
		$("#writetext").hide();
		if($.cookie("user")!="undefined"){
			
			$.ajax({
				url:"./queryTextByUser",
				type:"POST",
				data:"username="+user.user.username,
				dataType:"json",
				success:function(json){
					if(json.length>0){
						for(var i=1;i<json.length;i++){
						var picpath1=json[i].picpath1;
						var picpath2=json[i].picpath2;
						
						
						
						if(picpath1.length!=0&&picpath2.length!=0){
						
						
							$(".container").append("<div clss=media ><div class=media-left id=left"+i+"><img src=./images/"+json[i].username+"/"+json[i].picpath1+" ><img src=./images/"+json[i].username+"/"+json[i].picpath2+" ></div><div class=media-body id=body"+i+"><h4>"+json[i].title+"</h4><span>"+json[i].date+"</span><p>"+json[i].text+"</p><p><input id=unionID"+i+" type=hidden value="+json[i].textID+" />"+"<a role='button' data-toggle='modal' data-target='#myModal1'  class='btn btn-info' onclick=queryMessage("+i+") ><span class='glyphicon glyphicon-envelope' ></span>留言"+json[i].num_message+"</a><a role=button class='btn btn-danger' onclick=deleteText("+json[i].textID+",+"+i+") id=blike"+i+">删除</a><a role=button class='btn btn-primary' onclick=reWriteText("+i+") id=btome"+i+">修改</a><a href='#'></a><a role=button class='btn btn-default btn-sm'><span class='glyphicon glyphicon-heart'>"+json[i].num_like+"</span></a></p></div></div><hr>")
						
																																																																																																			//	a role=button onclick=sendMessage("+i+") data-toggle='modal' data-target='#myModal'
						}else if(picpath2.length==0){
							$(".container").append("<div clss=media><div class=media-left id=left"+i+"><img src=./images/"+json[i].username+"/"+json[i].picpath1+" >"+"</div><div class=media-body id=body"+i+"><h4>"+json[i].title+"</h4><text>"+json[i].date+"</text><p>"+json[i].text+"</p><p><input id=unionID"+i+" type=hidden value="+json[i].textID+" />"+"<a role='button' data-toggle='modal' data-target='#myModal1'  onclick=queryMessage("+i+") class='btn btn-info btn-lg'><span class='glyphicon glyphicon-envelope' ></span>留言"+json[i].num_message+"</a><a role='button' class='btn btn-danger' onclick=deleteText("+json[i].textID+") id=blike"+i+">删除</a><a role=button class='btn btn-primary' onclick=reWriteText("+i+") id=btome"+i+">修改</a><a role=button class='btn btn-default btn-sm'></a><a href='#'><span class='glyphicon glyphicon-heart'>"+json[i].num_like+"</span></a></p></div></div><hr>");
							
						}else{
							
							
							$(".container").append("<div clss=media><div class=media-left id=left"+i+"><img src=./images/"+json[i].username+"/"+json[i].picpath2+" >"+"</div><div class=media-body id=body"+i+"><h4>"+json[i].title+"</h4><text>"+json[i].date+"</text><p>"+json[i].text+"</p><p><input id=unionID"+i+" type=hidden value="+json[i].textID+" />"+"<a  role='button' data-toggle='modal' data-target='#myModal1'  onclick=queryMessage("+i+") class='btn btn-info'><span class='glyphicon glyphicon-envelope' data-toggle='modal' data-target='#myModal1'></span>留言"+json[i].num_message+"</a><a role='button' class='btn btn-danger' onclick=deleteText("+json[i].textID+") id=blike"+i+">删除</a><a role=button class='btn btn-primary' onclick=reWriteText("+i+") id=btome"+i+">修改</a><a href='#'></a> <a role=button class='btn btn-default btn-sm'><span class='glyphicon glyphicon-heart'>"+json[i].num_like+"</span></a></p></div></div><hr>");
							
						}
						
					}	
						
		
						
						
						
						
						$("img").css("margin","auto 0");
						//$(".media-body").addClass("caption");
							$(".media-left").addClass("media-top");
							
							$("h4").next().css("float","right");
		
							
							$(".media-left img").addClass("media-object");
							$(".media-left img").css("width","100px");
							$("h4").addClass("media-heading");
							
							
			
							
							
							var size=$("h4").next().next().css("margin-top","4%");
							var size=$("h4").next().next().css("font-size");
							var strsize=parseFloat(size)*1.1;
							var size=$("h4").next().next().css("font-size",strsize);
							
							
						
							$("h4").next().next().next().css("float","right");
					//		$("p>a").addClass("btn btn-default");
						
							
							
						
							
							
							
					}else{
						$(".container").append("<div clss=media><div class=media-body><h4 >你还没有发布过文章哦</h4><p>"+"\"<%=date%>"+"\"+</p><p><a role=button onclick=addNewText()>前往发布文章</a><a role=button onclick=toHome()>前往主页</a></p></div></div><hr>" );
						
						$(".media-left").addClass("media-top");
						
						$("h4").next().css("float","right");
						$("h4").next().next().next().css("float","right");
						$("p>a").addClass("btn btn-default");
					}
					
					
				},
				error:function(){
				//	alert("错误了");
					
					$(".container").append("<div clss=media><div class=media-body><h4 >你还没有发布过文章哦</h4><p id=nowtime></p><p><a role=button onclick=addNewText()>前往发布文章</a><a role=button onclick=toHome()>前往主页</a></p></div></div><hr>" );
					
					$(".media-left").addClass("media-top");
					
					$("h4").next().css("float","right");
					$("h4").next().next().next().css("float","right");
					$("p>a").addClass("btn btn-default");
				//	
				
				
				
				}
				
				
				
				
				
			})
			
			
			
			
		}else{
			alert("你尚未登录账号，请前往登录");
			location.href="jietao.jsp";
			
		}
		
		
		
		
		
		
	});
	
	
	function addNewText(){
		location.href="addText.jsp";
	};
	
	
	
	function reWriteText(id){
		
	//	text,buttonid
	//	text=JSON.parse(text);
	//	var json=[];
	//	json=text;
		
	
		var picpath1=$("#left"+id).children().eq(0).attr("src");
		var picpath2=$("#left"+id).children().eq(1).attr("src");
		
		var last1= picpath1.lastIndexOf('/');
		if(typeof picpath2!="undefined"){
			var last2=picpath2.lastIndexOf('/');
			picpath2=picpath2.substring(last2+1);
		}else{
			//如果这里不定义picpath2为空的话，他的值是上次的值，会导致误删
		}
		
		picpath1= picpath1.substring(last1+1); 
		
	
	var title=$("#body"+id).children().eq(0).text();
	var text=$("#body"+id).children().eq(2).text();
	var textID=$("#unionID"+id).val();
		$(".container").hide();
		$("#writetext").show();
		$("#title").val(title);
		$("#text").val(text);
		$("#textID").val(textID);	
		$("#f1").hide();
		$("#f2").hide();
		$("#show1 img").attr("src","./images/"+user.user.username+"/"+picpath1)
	
		$("#show2 img").attr("src","./images/"+user.user.username+"/"+picpath2)
	
	//	$("#f1picpath").val(picpath1);
	//	$("#f2picpath").val(picpath2);
	
	};
	function cancelReWrite(){
		$("#writetext").hide();
		$(".container").show();
	};
	
	
	
	function toHome(){
		location.href="jietao.jsp";
	};
	
	
	
	
	 function repic(inputid,show){
		 
		 var picpath1= $("#show1 img").attr("src");
		 var picpath2= $("#show2 img").attr("src");
		 
		 var last1=picpath1.lastIndexOf('/');
			picpath1=picpath1.substring(last1+1);
			
			if(typeof picpath2!="undefined"){
				var last2=picpath2.lastIndexOf('/');
				picpath2=picpath2.substring(last2+1);
			}
			
			
			 if(inputid=="f1"){
				 data=picpath1;
				 console.log("jinlai2");
			 }else {
				 data=picpath2;
				 console.log("jinlai3");
			 }
		 
		 
		 
		 console.log(data);
		 var username=user.user.username;
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
	        	  $("#"+inputid).val("");
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
			            	 //上传成功也要删除input的值
			            	
			            	 $("#"+inputid).hide();
			            	 $("#reload"+inputid).show();
			            	 
			            	            	 
			             },
			             error: function(json){
			            	 console.log("11111111");
			            	 alert("不能重复上传图片，请重新上传");
			            	 $("#"+inputid).val("");
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
		 
		 
		 
		 
		 
		 var picpath1= $("#show1 img").attr("src");
		 var picpath2= $("#show2 img").attr("src");
		
		if(typeof picpath1=="undefined"){
			alert("第一张图片不能为空");
		}
		 
		 var last1=picpath1.lastIndexOf('/');
			picpath1=picpath1.substring(last1+1);
			if(typeof picpath2!="undefined"){
				var last2=picpath2.lastIndexOf('/');
				picpath2=picpath2.substring(last2+1);
				
			}
			
		 
		 
		 
	//	 var date=$("#date").val();
		 //val()方法可以获取变化后的值和变化前的值，text只能获取变化之前的值
		 if(title.length!=0&&text.length!=0){
			 $.ajax({
				 url:"/mybatis_first_demo2/addTextServlet",
				 type:"POST",
				 data:"userID="+userID+"&textID="+textID+"&title="+title+"&text="+text+"&picpath1="+picpath1+"&picpath2="+picpath2+"&username="+username+"&rewrite=1",
				 dataType:"json",
				 success:function(json){
					 alert("发布成功");
					 $("#writetext").hide();
					 $("#f1").val("");
					 $("#f2").val("");
					 window.location.reload();
					 
					 
	
					 
					 
					 
				 },
				 error:function(){
					 alert("发布失败");
				 }
			 })
			 
		 }else{
			 alert("文章标题和内容不能为空");
		 }
		 
	 };
	 
	 function deleteText(textID,id){
		 
		 var r=confirm("你确定删除该文章吗？");
		    if (r==true){
		        
		    	
		    
		 
		 var userID=user.user.userID;
		
		 var picpath1=$("#left"+id).children().eq(0).attr("src");
		 var picpath2=$("#left"+id).children().eq(1).attr("src");
		 
		 //console.log("deletepic "+picpath1+"  "+picpath2);
		
		 var last1=picpath1.lastIndexOf('/');
			picpath1=picpath1.substring(last1+1);
			
			if(typeof picpath2!="undefined"){
				var last2=picpath2.lastIndexOf('/');
				picpath2=picpath2.substring(last2+1);
				
			}
		 
		// alert("第一张图片不能为空");
		 
		
		 
		 
		 $.ajax({
			 url:"./deleteTextServlet",
			 type:"POST",
			 data:"userID="+userID+"&textID="+textID,
			 dataType:"json",
			 success:function(json){
				 alert("删除成功");
				 
				 $.ajax({
					 url:"./deletePicServlet",
					 type:"GET",
					 data:"picpath="+picpath1+"&picpath2="+picpath2+"&username="+user.user.username,
					 dataType:"json",
					 success:function(json){
						 alert("删除成功");
						 window.location.reload();
					 },
					 error:function(){
					 alert("删除失败");
				 }
				 })
				 
				
				 
				 
			 },
			 error:function(){
				 alert("删除失败");
			 }
			 
			 
		 })
		 
		}
		  else{
		        
		    	
		    	
		    }
		 
		 
	 }
	 
	 function queryMessage(id){
		 
			var userID=user.user.userID;
			var textID=$("#unionID"+id).val();
			$("#mtextID").val(textID);
			
			
			if(userID!=null&&textID!=null){
				$.ajax({
					url:"./queryMessageServlet",
					type:"POST",
					data:"userID="+userID+"&textID="+textID,
					dataType:"json",
					success:function(json){
						$("#allmessage").empty();
						for(var i=0;i<json.length;i++){
							$("#allmessage").append("<div class='modal-body'><p id="+json[i].myName+">用户："+json[i].myName+"</p><p>"+json[i].message+"</p></div>");
						}
					
						
					},
					error:function(){
						$("#allmessage").empty();
						$("#allmessage").append("<div class='modal-body'><p>此文章暂时没有评论哦</p></div>");
					}
					
					
				})
				
			}
			
		}
	 
	 
	 
	 function sendNow(){
			var myName=user.user.username;
			if(myName!=null){
			var message=$("#message").val();
		//	alert(message);
			var userID=user.user.userID;
			var textID=$("#mtextID").val();
			
			if(typeof message !=null){
				$.ajax({
					url: "/mybatis_first_demo2/sendMessageServlet",
					type: "POST",
					data:"userID="+userID+"&textID="+textID+"&myName="+myName+"&message="+message,
					dataType:"json",
					success:function(json){
					alert("留言成功");
					},
					error:function(){
						alert("不能发送空信息");
					}
				})
				
			}else{
				
				
			}
				
			}else{
				
				alert("请先登录账号");
				$("#check").show();
			}
			
			
			
		}
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
			
			
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
					&times;
				</button>
				<h4 class="modal-title" id="myModalLabel">
					留言信息
				</h4>
			</div>
			<div class="modal-body">
				输入留言<input type=text id='message' placeholer="此处输入留言" />
				<input type=hidden id=mtextID value='1' />
				<input type=hidden id=muserID  value='2' />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">关闭
				</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" onclick="sendNow()">
					提交留言
				</button>
				
				</div>
				
				
				
			
		</div>
		<div class="modal-content" id="allmessage">
		
		</div>
		
		
		
		
		
		
		<!-- /.modal-content -->
	</div><!-- /.modal -->
</div>
			
			
			
			

<div class="container">
  <h2>我的文章</h2>
  <p>你可以修改和删除文章</p><br>
  
  <div class="media">
   
   
  </div>
  <hr>
  
</div>

<div class="panel panel-primary" id=writetext>
	<div class="panel-heading">
		<h3 class="panel-title">编写文章从这里开始</h3>
	</div>
	
	<div class="panel-body">
		
		<div role="form">
	<div class="form-group">
	<input type=hidden value="" id=textID />
	<input type=hidden value=<%=date %>	id=date />
		<label for="name">文章标题</label>
		<input type="text" class="form-control" id="title" 
			   placeholder="请输入标题">
	</div>
	
	
		
	<div class="col-xs-6 col-sm-6 col-md-6 col-log-6">
		<form class="form-group" id="form1"  method=POST enctype=multipart/form-data > 
		<label >选择第一张图片</label>
		<input type="file" id="f1" name="f" onchange="setpicpath('form1','f1','show1')" />
		 
		 
        	<div class="thumbnail" id="show1">
           	<img src=''>
        	</div>
        	<button  id="reloadf1" class="btn btn-default" type=button onclick="repic('f1','show1')">重新上传</button>
    		</form>
    	</div>
		
		
	
		 <div class="col-xs-6 col-sm-6 col-md-6 col-log-6">
		 <form class="form-group"  method=POST enctype=multipart/form-data id="form2">
		<label >选择第二张图片</label>
		<input type="file" id="f2" name="f2" onchange="setpicpath('form2','f2','show2')"/>
        	<div class="thumbnail" id="show2">
           	 	<img src=''>
        	</div>
        	
        	<button  id="reloadf2" class="btn btn-default" type=button onclick="repic('f2','show2')">重新上传</button>
    	</form>
    	</div>
		
		
		
	<div class="form-group" class="col-xs-12 col-sm-12 col-md-12 col-log-12" id='bottom'>
		<label for="name">文本框</label>
	<textarea class="form-control" rows="10" id="text"></textarea>
	<input type="hidden" id='f1picpath' name='picpath1' value=''>
	<input type="hidden" id='f2picpath' name='picpath2' value=''>
	
	</div>

	<button id ='submit' class="btn btn-danger" onclick="addText()">确认修改</button>
	<button  class="btn btn-warning" onclick="cancelReWrite()">取消修改</button>

</div>
		
		
		
		
		
	</div>
</div>










</body>
</html>