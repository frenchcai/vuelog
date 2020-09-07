<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
function sendMessage(){
	var userID=$("#userID").val();
	var textID=$("#textID").val();
	var message=$("#message").val();
	$.ajax({
	
		
		
		url: "/mybatis_first_demo2/sendMessageServlet",
		type: "POST",
		data: "userID="+userID+"&textID="+textID+"&message="+message,
		dataType:'json',  
        success:function(json){
        	
        	confirm(json.ok+"，留言成功！");
     

        	
          },
          error:function(){
        	  alert("sorry,留言失败,请重试");
          }
	})
	
}



</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<input name="userID" type="hidden" value="1" id=userID />
<input name="textID" type="hidden" value='20100731231200012' id=textID />
<input name="message" type="text" id=message />
<button onclick="sendMessage()">提交</button>
</body>
</html>