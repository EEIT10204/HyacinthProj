<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<form method="post" action="<c:url value="/memberact.controller"/>"> 
<input type="hidden" name=ActSNum value="2">
<input type="hidden" name=memberID value="2">
<input type="submit"  value="I'm 2 ">
</form>
</body>
</html>