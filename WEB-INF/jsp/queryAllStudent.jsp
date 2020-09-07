<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../../js/jquery-3.3.1.js"></script>
<script type="text/javascript">
	var Allcount=0;
	var allNum=0;
	var ALLPAGE=0;
	
	function test(textID){
		alert($("#"+textID+":first").text());
	};
	
function query(begin, num){
	$("#info").empty();
	num=$("#num").val();
	allNum=num;
	$.ajax({
		  url: "/mybatis_first_demo2/queryAllStudentServlet", 
          type: 'POST',  
          data: "begin="+begin+"&num="+num,  
          dataType: 'json',  
          success:function(json){
        	
        	var count=json[0].count
        		$("#info").append("<tr><th>姓名</th><th>性别</th><th>密码</th><th>学院</th><th>班级</th><th>电话</th></tr>");
        	  for(var i=1;i<json.length;i++){
        		
    				$("#info").append("<tr id="+i+">"+"<td onclick=test("+i+")>"+json[i].name+"</td><td>"+json[i].sex+"</td><td>"+json[i].password+"</td><td>"+json[i].school+"</td><td>"+json[i].major+"</td><td>"+json[i].phone+"</td></tr>");
        	//	  $("#"+"major"+i.toString()).html(json[i].major);
        	//	  $("#"+"name"+i.toString()).html(json[i].name);
        	//	  $("#"+"password"+i.toString()).html(json[i].password);
        	//	  $("#"+"phone"+i.toString()).html(json[i].phone);
        	//	  $("#"+"school"+i.toString()).html(json[i].school);
        	//	  $("#"+"sex"+i.toString()).html(json[i].sex);
        	  }
        	$("#count").html(count);
   
        	$("#nowpage").html(begin);
        	//显示当前页数，因为begin默认为一，所以，第一次查询当前页都是一
        	

        	console.log(num);
      //设置总页数。当总数除以每页的记录数的时候，如果余数不为零，说明最后一页的记录数的条数是余数，我们要增加一页来放置剩下来的记录
	 //     这种情况包含两种情况，当总记录数小于每页的记录的时候，不能被整除，余数为总记录数。这个时候页数为一页，不能为零
    //  第二张情况是总记录数大于每页记录，但不能被整除，一样需要增加一页
        	var num2=Number(num);
        	var count2=Number(count);
        	Allcount=count2;
        	var page=0;
        	if(count2%num2!==0){
        		
        		page=(count2/num2)+1;
        	

        	}else{
        		page=count2/num2;
        	
        	}
        	
        	
        	
  
        	//当下一页的按钮隐蔽之后，点击页数的查找记录时候，如果不是小于最后一页，激活按钮
        	numbegin=Number(begin);
        	if(numbegin<parseInt(Number(page))){
        		$("#nextpage").show();
        	}else{
        		$("#nextpage").hide();
        	}
        	
        	
        	//激活上一页——如果当前页不是第一页，则显示按钮，否则显示按钮
        	if(numbegin!=1){
        		$("#prepage").show();
        	}else{
        		$("#prepage").hide();
        	}
        	
        	
        	
  
        	console.log(page);
        	
        	ALLPAGE=page;
        		$("#page").empty();
        		//当每一页的记录数目发生变化的时候，我们可以调整页码，在调整之前，要对之前的页数进行清除
        	
        		//显示当前页数
        	for(var j=1;j<=page;j++){
        		$("#page").append("<td><button onclick=topage("+j+")>第"+j+"页</button></td>");
        	}
        	  
          },
	 error:function(){
        	  console.log("error");
          }
          
	})
	
	
};
//跳转到对应的页数
			function topage(page){
			
				$("#page").empty();
				var num=$("#num").val();
				query(page,num);
				$("#nowpage").html(page);
				
			};
//跳转到下一页			
			function nextpage(){
				//console.log($("#nowpage").text());
				var nowpage=Number($("#nowpage").text());
				var nextpage=nowpage+1;
				console.log(ALLPAGE);
			//	var a = 160.58;
			//	var b = parseInt(a);//截取整数部分
			//	alert(b);
			//	//或者
			//	var c= Math.round(a);//四舍五入
			//	alert(c);
				
				//if(nextpage==parseInt(ALLPAGE)){
				//	$("#nextpage").hide();
				//}
				topage(nextpage.toString());
			};
	//跳转到上一页		
			function prepage(){
				var nowpage=Number($("#nowpage").text());
				
			//	if(nowpage==1){
			//		$("#prepage").hide();
			//	}else{
					topage((nowpage-1).toString());
			//	}
			}
			
			
			

</script>
</head>
<body>
<table id=info></table>
<table id=input>
<tr>共有<td id=count></td>条记录<td>当前页</td><td id=nowpage></td><td>每页</td><td><input id=num value=10 /></td><td>条记录</td><td><button onclick="query(1,10)">查询</button></td></tr>
<tr><td></td></tr>
<tr id=page></tr>
</table>
<button id=nextpage onclick="nextpage()") hidden='true'>下一页</button>
<button id=prepage onclick="prepage()") hidden='true'>上一页</button>
</body>
</html>