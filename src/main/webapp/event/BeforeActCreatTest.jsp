<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../Index/NewHeader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" action="<c:url value="/before.act.controller"/>">
		<input type="hidden" value="1" name="memberID">
		<input type="submit" value="newAct">
		
	</form>
	
	<a href="${pageContext.request.contextPath}/actdisplay.controller?actSNum=2"><p>Test Act Display</p></a>
</body>
</html>