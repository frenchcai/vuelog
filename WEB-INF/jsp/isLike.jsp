<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
<script type="text/javascript">

function isLike(textID){
	var userID=$("#"+textID).children().eq(0).val();
	var textID2=$("#"+textID).children().eq(1).val();
	
	
	
	
	
	$.ajax({
		url:"/mybatis_first_demo2/isLikeServlet",
		type:"POST",
		data:"userID="+userID+"&textID="+textID2,
		dataType:'json',
		success:function(json){
		//	$("#"+textID+" #good"+textID).css("background-color","yellow");
		
			$("#"+textID+" button").css("background-color","skyblue");	
			$("#"+textID+" #good"+textID).attr("disabled",true);
			alert("点赞成功");
			
			
			
		},
		error:function(){
			alert("点赞失败");
		}
		
	})
	
	
	
}

</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div id=1>
<input name="userID" type="text" />
<input name="textID" type="text" />
<button id=good1 onclick=isLike(1) >点赞</button>
</div>


<div id=2>
<input name="userID" type="text" value=2017254143 />
<input name="textID" type="text"  value=201725412225559 />
<button  onclick=isLike(2) id="good2">点赞</button>
</div>
</body>
</html>