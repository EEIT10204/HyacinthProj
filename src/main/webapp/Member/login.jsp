<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Login</title>
		<c:import url="/Index/head2.jsp" />
		<link href='<c:url value="/css/signin.css"/>'rel="stylesheet">
		<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/notosanstc.css">
			<style type="text/css">
			html, body {
			   font-family:'Noto Sans TC',san-serif;
			}
			</style>
	</head>
	<body class="text-center">
	    <form class="form-signin" action="<c:url value="/login.controller" />" method="post">
	      <img class="mb-4" src='<c:url value="/images/CCC.png"/>' alt="" width="200" height="200">
	      <label for="inputAccount" class="sr-only">Account</label>
	      <input style="margin-bottom: 1rem" type="text" id="inputAccount" name="memberAccount" 
	      		 class="form-control" placeholder="Account" autofocus/>
	      <span style="color: red">${errorMsgs["xxx1"]}</span>
	      <label for="inputPassword" class="sr-only">Password</label>
	      <input type="password" id="inputPassword" name="memberPwd"
	      		 class="form-control" placeholder="Password" >
	      <span style="color: red">${errorMsgs["xxx2"]}</span>
	      <span style="color: red">${errorMsgs["xxx3"]}</span>
	      <button class="btn btn-sm btn-primary btn-block" type="submit">登入</button>
	      <a href="register.jsp" type="button" class="btn btn-sm btn-success btn-inline" style="margin-top: 10px;text-decoration:none;">前往註冊</a>
	    </form>
	    
	 </body>
</html>