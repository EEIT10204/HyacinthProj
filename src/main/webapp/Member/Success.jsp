<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>成功</title>
<style>
.msg{
margin-top: 150px;
text-align: center;
font-size: 32px;
}
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
function setClock(){
	 $('#sec').text($('#sec').text()-1); 
// 	 alert( $('#sec').text());
	 if( $('#sec').text()<=0){
		 location.href='<c:url value="/Index/Index.jsp"/>';
	 }
}
window.setInterval(setClock,1000);

</script>
</head>

<body>

<div class="msg">${msg}成功,<span id="sec">3</span>秒後將跳回首頁，請重新登入!</div>
</body>
</html>