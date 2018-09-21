<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
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
<link href='<spring:url value="/resources/css/style.css"/>' rel="stylesheet">
</head>
<body id="top">
	 <!-- Footer -->
			<footer id="footer" >
                <div class="footerdown">
                    <ul class="icons">
                        <li><a href="https://twitter.com/login" class="icon fa-twitter"><span class="label"><img src='<spring:url value="/resources/images/twitter.png"/>' width="50" height="50"></span></a></li>
                        <li><a href="https://zh-tw.facebook.com/" class="icon fa-facebook"><span class="label"><img src='<spring:url value="/resources/images/facebook.png"/>' width="50" height="50"></span></a></li>
                        <li><a href="https://www.instagram.com/?hl=zh-tw" class="icon fa-instagram"><span class="label"><img src='<spring:url value="/resources/images/instagram.png"/>' width="50" height="50"></span></a></li>
                        <li><a href="#" class="icon fa-linkedin"><span class="label">LinkedIn</span></a></li>
                        <li><a href="#" class="icon fa-pinterest"><span class="label">Pinterest</span></a></li>
                    </ul>
                </div>
            </div>
            <ul class="copyright">
                <li>&copy; Untitled. All rights reserved.</li>
                <li>Design: TEMPLATED</a></li>
                <li>Images: Unsplash</a></li>
            </ul>
        </div>
    </footer>

</body>

</html>