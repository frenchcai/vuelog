<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
<script type="text/javascript">

function addToMine(textID){
	var userID=$("#"+textID).children().eq(0).val();
	var textID=$("#"+textID).children().eq(1).val();
	
	
	$.ajax({
		url:"/mybatis_first_demo2/addToMineServlet",
		type:"POST",
		data:"userID="+userID+"&textID="+textID,
		dataType:'json',
		success:function(json){
			alert("收藏成功");
		
		},
		error:function(){
			alert("收藏失败");
		}
		
		
	})
	
	
	
	
}

</script>
</head>
<body>

<div id=1>
<input name="userID" type="text" />
<input name="textID" type="text" />

<button type=button onclick=addToMine(1) >收藏</button>
</div>





<div id=2>
<input name="userID" type="text" value=2017254143 />
<input name="textID" type="text" value=201725412225559 />
<button type=button onclick=addToMine(2) >收藏</button>

</div>

</body>
</html>