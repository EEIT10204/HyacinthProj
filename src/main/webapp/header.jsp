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
</head>
<body id="top">
	<!-- FB -->
	<script>
		window.fbAsyncInit = function() {
			FB.init({
				appId : '301047760708850',
				cookie : true,
				xfbml : true,
				version : 'v3.1'
			});
			function checkLoginState() {
				FB.getLoginStatus(function(response) {
					statusChangeCallback(response);
				});
			}

			FB.AppEvents.logPageView();

		};

		(function(d, s, id) {
			var js, fjs = d.getElementsByTagName(s)[0];
			if (d.getElementById(id)) {
				return;
			}
			js = d.createElement(s);
			js.id = id;
			js.src = "https://connect.facebook.net/en_US/sdk.js";
			fjs.parentNode.insertBefore(js, fjs);
		}(document, 'script', 'facebook-jssdk'));
	</script>
	<script type="text/javascript">
	$('#buttonAdd').click(function(){
	    	var datas = $('form[name="myForm"]').serialize();
	    	$.post('ProductsInsert',datas,function(data){
	    		alert(data);	 		    		
	    		loadProduct(1);	 		    		
	    		$('#ProductID').val('');
				$('#ProductName').val('');
				$('#UnitPrice').val('');
				$('#UnitsInStock').val('');
	    	});
    })
	
	</script>

	<!-- Header -->
	<header id="header" class="skel-layers-fixed">
	<h1>Hyacinth</h1>
	<nav id="nav">
	<ul>
		<li>
			<button id="loginbutton" type="button" class="btn btn-outline-light">
				<img src='<spring:url value="/resources/images/user.png"/>'width="30px">
			</button>
		</li>
		<li><a href=index02.html> <img src='<spring:url value="/resources/images/home.png"/>' width="30px">
		</a></li>
		<li><img src='<spring:url value="/resources/images/message.png"/>' width="30px"></li>
		<li><img src='<spring:url value="/resources/images/blog.png"/>' width="30px"></li>
		<li></li>
	</ul>
	<h3 align="right">(Test)Welcome ${user.memberAccount}</h3>
	</nav> <!-- The Modal -->
	<div id="loginModal" class="modal_fade">
		<!-- Modal content -->
		<div class="modal-content">
			<div>
				<span class="close" style="float: right;">&times;</span>
			</div>
			<div class="btn-group" role="group">
				<button type="button" class="btn btn-primary" id="loginTab">登入</button>
				<button type="button" class="btn btn-secondary" id="registerTag">註冊</button>
			</div>
			<div id="loginform" class="loginform">
				<form action="<c:url value="/login.controller" />" method="post"><!-- 呼叫controller -->
					<div class="form-group">
						<label>帳號</label>
						<input type="text" id="memberAccount" name="memberAccount" value="${param.memberAccount}" class="form-control" placeholder="Account">
						<p style="color: red">${errorMsg.empty1}<p>
					</div>
					<div class="form-group">
						<label for="formGroupExampleInput2">密碼</label> <input type="text"
							name="memberPwd" value="${param.memberPwd}" class="form-control"
							id="memberPwd" placeholder="password">
							<p style="color: red">${errorMsg.empty2}<p>
					</div>
					<button type="submit" value="login" class="btn btn-primary">Sign
						in</button>
					<div class="fb-login-button" data-scope="public_profile,email"
						onlogin="checkLoginState();"></div>

				</form>
			</div>
			<div id="registerform" class="registerform">
				<form action="<c:url value="/inputCheck"/>" method='post' target='ifrm'>
					<div class="form-group">
						<label>帳號</label> <input type="text"
							name="memberAccount " class="form-control"
							id="memberAccount" value="${param.memberAccount}"
							placeholder="Account">
						<p style="color: red">${errorMsg.empty1}<p>
					</div>
					<div class="form-group">
						<label>密碼</label> <input type="password" 
						name="memberPwd" class="form-control"
							id="memberPwd" value="${param.memberPwd}" placeholder="password">
							<p style="color: red">${errorMsg.empty2}<p>
					</div>
					<div class="form-group">
						<label>信箱</label> <input type="email" class="form-control"
						name="memberEmailregister"
							id="memberEmailregister" value="${memberEmail}" placeholder="Email">
					</div>
					<p style="color: red">${errorMsg.empty3}<p>
					<button type="submit" class="btn btn-primary">Register</button>
				</form>
				<iFRAME width='100%' height="0" name='ifrm' src=' '  scrolling='no'
					frameborder='0' marginwidth='0' marginheight='0' framespacing='0'
					noresize></iFRAME>
			</div>
		</div>

	</div>

		<script>
			// Get the modal
			var modal = document.getElementById('loginModal');
			// Get the button that opens the modal
			var btn = document.getElementById("loginbutton");
			//彈窗內登入標籤
			var loginlab = document.getElementById("loginTab");
			//彈窗內註冊標籤
			var registerlab = document.getElementById("registerTag");
			//彈窗內登入表格
			var loginform = document.getElementById("loginform");
			//彈窗內簡易註冊表格
			var registerform = document.getElementById("registerform");
			// Get the <span> element that closes the modal
			var span = document.getElementsByClassName("close")[0];
			// When the user clicks the button, open the modal 
			btn.onclick = function() {
				modal.style.display = "block";
			}
			//彈窗內登入標籤點擊效果(預設為此 但為了返回點擊)
			loginlab.onclick = function() {
				registerlab.className = "btn btn-secondary";//改變註冊標前樣式(藍到灰)
				loginlab.className = "btn btn-primary";//改變登入標籤樣式(灰到藍)(預設)
				loginform.style.display = "block";//開啟登入表格
				registerform.style.display = "none";//關閉註冊表格
			}
			//彈窗內註冊標籤點擊效果
			registerlab.onclick = function() {
				registerlab.className = "btn btn-primary";//改變註冊標前樣式(灰到藍)
				loginlab.className = "btn btn-secondary"; //改變登入標籤樣式(藍到灰)
				loginform.style.display = "none"; //關閉登入表格
				registerform.style.display = "block";//開啟註冊表格
			}
			// When the user clicks on <span> (x), close the modal
			span.onclick = function() {
				modal.style.display = "none";
			}
			// When the user clicks anywhere outside of the modal, close it
			// window.onclick = function (event) {
			//     if (event.target == modal) {
			//         modal.style.display = "none";
			//     }
			// }
			
		</script>
	</header>
</body>

</html>