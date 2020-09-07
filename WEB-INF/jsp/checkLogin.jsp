<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script >
 <script type="text/javascript">
 function checkLanding(){
	 var username=$("#username").val();
	 var password=$("#password").val();
	 
	 
	
	 
	 
	 $.ajax({
		 url:"/mybatis_first_demo2/queryLanding",
		 type:"POST",
		 data:"username="+username+"&password="+password,
		 dataType:"json",
		 success:function(json){
			 $("#myname").text(json.username);
		 },
		 error:function(){
			 alert("登陆失败");
		 }
	 })
	 
 }
 
 
 
 </script>
 
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<input name="username" id=username type="text" />
<input name="password" id=password type="text" />
<button onclick=checkLanding()>提交</button>

<text id="myname"></text>
</body>
</html>