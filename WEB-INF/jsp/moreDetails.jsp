<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
	<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../../js/jquery.cookie.js"></script>
	<script type="text/javascript">
	
	$(document).ready(function(){
		var a=location.href.indexOf("=");
		var textID=location.href.substr(a+1);
		//alert(textID);
		
		if(typeof $.cookie("user")!="undefined"){
			var user=JSON.parse($.cookie("user"));
			var username=user.user.username;
			var mylike=$.cookie(user.user.username);
			if(typeof mylike!="undefined"){
				console.log(mylike);
				mylike=JSON.parse(mylike);
				for(var i=0;i<mylike.length;i++){
					if(mylike[i].textID==textID){
						$("#title").text(mylike[i].title);
						$("#pic1").attr("src","./images/"+mylike[i].username+"/"+mylike[i].picpath1);
						$("#pic2").attr("src","./images/"+mylike[i].username+"/"+mylike[i].picpath2);
						$("#text").val(mylike[i].text);
					}
				}
				
				
			}
		}
		
		
	})
		
	
	function backMySeft(){
		location.href="toMySeft.jsp";
	}
		
	</script>
<title>Insert title here</title>
</head>
<body>
		<div class=row style="background-color: #edf3ff">

				<div class="col logo">
					<h3>
						<a href="jietao.jsp">&nbsp&nbsp 捷淘——记录生活美好</a>
					</h3>
				</div>
	
			</div>
<div class="panel panel-success" id=writetext>
	<div class="panel-heading">
		<h3 class="panel-title">收藏的文章</h3>
	</div>
	
	<div class="panel-body">
		
		<div role="form">
	<div class="form-group">
	<input type=hidden 	id=textID />
		<label for="name">文章标题</label>
		<h4 type="text" class="form-control" id="title" ></h4>
			   
	</div>
	
	
		
	<div class="col-xs-6 col-sm-6 col-md-6 col-log-6">
	<form class="form-group" id="form1" >	 
		<label >选择第一张图片</label>
        	<div class="thumbnail" id="show1">
        		<img src='' id=pic1>
        	</div>
    		</form>
    	</div>
		
	
		 <div class="col-xs-6 col-sm-6 col-md-6 col-log-6">
		 <form class="form-group"   id="form2">
		<label >第二张图片</label>
        	<div class="thumbnail" id="show2">
           	<img src='' id=pic2>
        	</div>
        	
    	</form>
    	</div>
		
		
		
	<div class="form-group" class="col-xs-12 col-sm-12 col-md-12 col-log-12">
	<textarea class="form-control" rows="10" id="text"></textarea>
	</div>

	<button type="submit" class="btn btn-warning" onclick="backMySeft()">返回我的收藏</button>
</div>
		
		
		
		
		
	</div>
</div>
</body>
</html>