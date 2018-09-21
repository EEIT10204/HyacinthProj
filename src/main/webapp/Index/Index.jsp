<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Home</title>
<%@ include file="/Index/NewHeader.jsp"%>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<script type="text/javascript">

$(document).ready(function() {	
// 	alert("ready");
	 $('#jsonBut').click(function(){
	 	alert("click");
		$.getJSON('sendMail.do',function(datas){
			alert("sendMail.do");
			alert(datas.result);
//			$.each(datas,function(idx,getObj){
//				alert(idx+"-"+getObj.memberName);
//			});
		});
	 });
})
</script>
</head>
<body>

<h3>Welcome ${user.memberMail}
<c:if test="${not empty user.memberPicToBase64}">
    <img id="idGetPicThumb" src="data:image/png;base64,${user.memberPicToBase64}" alt="" style="width:50px">
</c:if> 
</h3>
<h3><a href="<c:url value="/Index/login.jsp" />">Login</a></h3>
<h3><a href="<c:url value="/logout.controller" />">Logout</a></h3>
<h3><a href="<c:url value="/Index/profile.jsp" />">profile</a></h3>
<h3><a href="<c:url value="/Member/profileSelf.jsp" />">profileSelf</a></h3>

<h3><a href="<c:url value="/TestAjax.jsp" />">TestAJAX</a></h3>
<button id="jsonBut">TestJSON</button>



</body>
</html>
