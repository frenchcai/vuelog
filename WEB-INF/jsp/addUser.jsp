<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" type="text/css" href="../../css/bootstrap.css">
	<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
	
	<script type="text/javascript">
	
	$(document).ready(function(){
		$("#phone").trigger("input");
		$("#phone").bind("input propertychange",function(event){
			
		var reg = /^([a-zA-Z0-9_-])+@([a-zA-Z0-9_-])+((\.[a-zA-Z0-9_-]{2,3}){1,2})$/;
		     isok= reg.test($("#phone").val());
		    	if (!isok) {
		      
		       $("#phoneerror").show();
				$("#phone").css("border-color","red");
				$("#phone").focus();
		       
		      }else{
		    	  $("#phone").css("border-color","#ccc");
					$("#phoneerror").hide();
		      }	
			
			
			
			
	//		$("#phone").blur(function(){
	//			if(!$("#phone").val().match(/^(((13[0-9]{1})|159|153)+\d{8})$/)) { 
	//				$("#phoneerror").show();
					
					
	//			$("#phone").css("border-color","red");
	//			$("#phone").focus();
	//			}else{
					
	//			$("#phone").css("border-color","#ccc");
	//			$("#phoneerror").hide();
	//			};
				
			
	//		})
			})
			
			
			
			
			$("#surepassword").bind("input propertychange",function(event){
			
		//	$("#surepassword").blur(function(){
				if($("#password").val()!=$("#surepassword").val()) { 
					$("#passworderror").show();
					
					
				$("#surepassword").css("border-color","red");
				}else{
				$("#surepassword").css("border-color","#ccc");
				$("#passworderror").hide();
				};
				
			
		//	})
			})
			
			
			
	})
	
	
	
	
	 
	
	
	
	
	
	function addUser(){
		var username=$("#username").val();
		var password=$("#password").val();
		var surepassword=$("#surepassword").val();
		var phone=$("#phone").val();
		var sex=$("input[name='sex']:checked").val(); 

		console.log(sex+username+password+surepassword+phone);
	if(password==surepassword){
			
		
		
		if(username.length!=0&&password.length!=0&&phone.length!=0){
			$.ajax({
				url:"/mybatis_first_demo2/addUserServlet",
				type:"POST",
				data:"username="+username+"&password="+password+"&phone="+phone+"&sex="+sex,
				dataType:"json",
				success:function(json){
					 if(confirm("您已经注册成功，是否前往登录页面？"))
				     {
						 location.href="jietao.jsp" ;
				     }else{
				         return false;
				     }
				},
				error:function(){
					alert("该用户名已经存在，请重新选择");
					$("#username").focus(); 
				}
			})
			
			
		}else{
			alert("信息填写不全");
			}
		
	}else{
		alert("请再次确认密码");
		$("#surepassword").focus(); 
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
<div class="panel panel-info">
	<div class="panel-heading">
		<h3 class="panel-title">个人信息填写</h3>
	</div>
	<div class="panel-body">
		<div class="form-horizontal" role="form">
	<div class="form-group">
		<label for="firstname" class="col-sm-2 control-label">用户名</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="username" 
				   placeholder="请输入用户名">
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">密码</label>
		<div class="col-sm-10">
			<input  class="form-control" type="password" id="password" 
				   placeholder="请输入注册密码">
		</div>
	</div>
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">确认密码</label>
		<div class="col-sm-10">
			<input  class="form-control" type="password"  id="surepassword" 
				   placeholder="再次输入密码，确认密码">
				<label for="lastname" id='passworderror' class="control-label" style="color:red;display:none;">前后输入密码不对应</label>
		
		</div>
	</div>
	
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">邮箱地址</label>
		<div class="col-sm-10">
			<input type="text" class="form-control" id="phone" 
				
				   placeholder="输入邮箱地址">
				   
				   		<label for="lastname" id='phoneerror' class="control-label" style="color:red;display:none;">邮箱格式不对，请继续输入</label>
				   
		</div>
	</div>
	
	
	
	<div class="form-group">
		<label for="lastname" class="col-sm-2 control-label">性别</label>
		<div class="col-sm-10">
			<div class="radio">
    <label>
        <input type="radio" name="sex" id="radios1" value="小哥哥" checked> 小哥哥
    </label>
    <label>
        <input type="radio" name="sex" id="radios2" value="小姐姐" > 小姐姐
    </label>
</div>
		</div>
	</div>
	
	
	
	
	
	
	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<button  class="btn btn-default" id='adduser' onclick="addUser()">注册</button>
		</div>
	</div>
</div>
	</div>
</div>

</body>
</html>