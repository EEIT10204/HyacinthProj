<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- <link rel="stylesheet" type="text/css" href="../css/main.css" /> -->

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {	
	 $('#idusername').blur(function(){
// 	 	alert("blur");
		$.getJSON('../accountJudge',{"account":$('#idusername').val()},function(datas){
// 			alert(datas.memberPic);
// 			$('#show').text(datas.memberBirthday);
// 			$.each(datas,function(idx,getObj){
// 				alert(idx+"-"+getObj.memberName);
// 			});
		});
	 });
})
</script>

<title>Login</title>
</head>
<body>
<a href="<c:url value="/Index/index.jsp" />"><h1>Hyacinth</h1></a>
<h3>Login,${user.memberMail}</h3>

<form action="<c:url value="/login.controller" />" method="get">
<table>
	<tr>
		<td>ID : </td>
		<td><input id="idusername" type="text" name="username" value="${param.username}"></td>
		<td>${errorMsgs["xxx1"]}</td>
	</tr>
	<tr>
		<td>PWD : </td>
		<td><input type="text" name="password" value="${param.password}"></td>
		<td>${errorMsgs["xxx2"]}</td>
	</tr>
	<tr>
		<td>
			<select name="custom_locale">
				<option value="zh_TW">中文</option>
				<option value="en_US">英文</option>
				<option value="de_DE">德文</option>
			</select>
		</td>
		<td align="right"><input type="submit" value="Login"></td>
	</tr>
</table>

<div id=show></div>
<span id="query">Query</span>
</form>

</body>
</html>