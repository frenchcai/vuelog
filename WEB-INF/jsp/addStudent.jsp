<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="${pageContext.request.contextPath}/add" method="get">
<input name="username" type="text" />
<%out.print(request.getContextPath());%>
<input name="password" type="text" />
<button type="submit" value="提交">提交</button>
</form>
</body>
</html>