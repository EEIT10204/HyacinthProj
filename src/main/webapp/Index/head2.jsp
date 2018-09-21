<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href='<spring:url value="/resources/css/bootstrap.css"/>' rel="stylesheet">
<script type="text/javascript" src='<spring:url value="/resources/js/jquery-3.3.1.js"/>'></script>
<script src='<spring:url value="/resources/js/bootstrap.bundle.js"/>'></script>
<script src='<spring:url value="/resources/js/bootstrap.js"/>'></script>
<link href='<spring:url value="/resources/css/style.css"/>'rel="stylesheet">
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/notosanstc.css">

<style type="text/css">
html, body {
   font-family:'Noto Sans TC',san-serif;
}
</style>
</head>
<body id="top"  onload="GetSessionChangeNav()">
<!-- Header -->
<header id="header" class="skel-layers-fixed">
        <h1>Hyacinth</h1>
        <nav id="nav">
            <ul>
                <li>
                <div id="dropdown" class="dropdown">
					<button type="button" class="btn btn-light dropdown-toggle  id="dropdownMenu1" data-toggle="dropdown"
				          aria-haspopup="true" aria-expanded="false">
						<img src='<spring:url value="/resources/images/user.png"/>'width="30px">
					</button>
					  <div id="userMenu" class="dropdown-menu" aria-labelledby="dropdownMenu1">
					    <a class="dropdown-item" href="../Member/login.jsp">登入</a>
					  </div>
				</div>
                </li>
                <li><a href="index.jsp"><img src='<spring:url value="/resources/images/home.png"/>' width="30px"></a></li>
                <li><img src='<spring:url value="/resources/images/message.png"/>'  width="30px"></li>
                <li><img src='<spring:url value="/resources/images/blog.png"/>' width="30px"></li>
                <li></li>
            </ul>
        </nav>
    </header>
<script type="text/javascript">
function GetSessionChangeNav(){
	alert('${user}')
    if ( '${user}' != '') {
    	$("body").style="font-family:'Noto Sans TC',san-serif;";
    	var outerHTML_text = $('#dropdown').prop('outerHTML');
    	$('#dropdown').prop('outerHTML', 
    	"<button type='button' class='btn btn-light dropdown-toggle id='dropdownMenu1' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'><img src='<spring:url value='/resources/images/user.png'/>'width='30px'></button><div class='dropdown-menu' aria-labelledby='dropdownMenu1'><a class='dropdown-item' href='Profile.jsp'>個人頁面</a><form id='logoutN' action='<c:url value='/logout.controller'/>' method='post'><button onclick='this.form.submit();' class='dropdown-item'>登出</button></form></div>");
    }
}
</script>
</body>
</html>