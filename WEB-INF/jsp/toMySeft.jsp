<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
	<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
	<script type="text/javascript" src="../../js/jquery.cookie.js"></script>
<script type="text/javascript" >
$(document).ready(function(){
	var user=JSON.parse($.cookie("user"));
	if(typeof user!="undefined"){
		$.ajax({
			url:"./queryMyLikeServlet",
			type:"POST",
			data:"userID="+user.user.userID,
			dataType:"json",
			success:function(json){
			
				for(var i=0;i<json.length;i++){
			
					$(".list-group").append("<div class=list-group-item><h4 class='list-group-item-heading' ><a onclick=toJsp("+json[i].textID+")>"+json[i].title+"</a><button style='float:right;' type='button' class='btn btn-danger btn-sm' onclick=cancelLike("+i+")><span class='glyphicon glyphicon-remove'></span>取消收藏</button><input type=hidden id=textID"+i+" value="+json[i].textID+" /><input type=hidden id=userID"+i+" value="+json[i].userID+" /></h4></div>");
			
		
				}
				var myjson=[];
				for(var i=0;i<json.length;i++){
					myjson.push(json[i]);
				}
		//		$.cookie('user',user, {expires: 7, path: '/' });
		//同名会覆盖
				var a=JSON.stringify(myjson);
				$.cookie(user.user.username,a,{expires:1, path:'/'});
				
			//	if(typeof $.cookie(user.user.username)!="undefined"){
			//		var mylike=JSON.parse($.cookie(user.user.username));
					
					
			//	}
		
			}
		,error:function(){
			$(".list-group").append("<div class=list-group-item><a href='jietao.jsp'><h4 class='list-group-item-heading'>你还没有收藏过文章哦，现在去挑喜欢的</h4></a></div>");

		}
			
			})
		
		
	}else{
		alert("登录缓存不存在，请先登录账号");
	}
	
	
	
	
	
})
 function toJsp(textID){
	location.href="./moreDetails.jsp?textID="+textID;
}

function cancelLike(id){
	var user=JSON.parse($.cookie("user"));
	var myID=user.user.userID;
	var textID=$("#textID"+id).val();
	var userID=$("#userID"+id).val();
	var r=confirm("你确定从收藏中移除这篇文章吗？");
	if(r==true){
		$.ajax({
			url:"./cancelLikeServlet",
			type:"POST",
			data:"myID="+myID+"&userID="+userID+"&textID="+textID,
			dataType:"json",
			success:function(json){
				alert("移除成功");
				window.location.reload();
			},
			error:function(){
				alert("移除失败");
			}
			
		})
		
		
	}else{
		
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
<div class="list-group">
				 <a href="#" class="list-group-item active">我的收藏</a>
			
				<div class="list-group-item">
					<h4 class="list-group-item-heading">
						你喜欢的都在这
					</h4>
				</div>
			</div>

</body>
</html>