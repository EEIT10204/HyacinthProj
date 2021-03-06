<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- <title>Header</title> -->
<link href='<c:url value="/css/bootstrap.min.css"/>' rel="stylesheet">
<link href='<c:url value="/css/bootstrap-datepicker.min.css"/>' rel="stylesheet">
<script type="text/javascript" src='<c:url value="/js/jquery-3.3.1.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap.bundle.min.js"/>'></script>
<%-- <script src='<c:url value="/js/bootstrap.min.js"/>'></script> --%>
<script src='<c:url value="/js/bootstrap-datepicker.min.js"/>'></script>
<script src='<c:url value="/js/bootstrap-datepicker.zh-TW.min.js"/>'></script>

<!-- 字型 -->	
<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/notosanstc.css">
<!-- ICON -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<style type="text/css">
html, body {
	font-family:'Noto Sans TC',san-serif;
}

</style>
</head>
<body>
<div id="fb-root"></div>
<script>
		function checkLoginState() {
		    FB.getLoginStatus(function(response) {
		      statusChangeCallback(response);
		    });
		 }
		function statusChangeCallback(response) {
		    console.log('statusChangeCallback');
		    console.log(response);
		    // The response object is returned with a status field that lets the
		    // app know the current login status of the person.
		    // Full docs on the response object can be found in the documentation
		    // for FB.getLoginStatus().
		    if (response.status === 'connected') {
		      // Logged into your app and Facebook.
		      GoToBack();
		    } 
		  }

		  window.fbAsyncInit = function() {
		    FB.init({
		      appId      : '301047760708850',
		      cookie     : true,  // enable cookies to allow the server to access 
		                          // the session
		      xfbml      : true,  // parse social plugins on this page
		      version    : 'v3.1' 
		    });

  };
  
(function(d, s, id) {
	var js, fjs = d.getElementsByTagName(s)[0];
	if (d.getElementById(id)) return;
	js = d.createElement(s); js.id = id;
	js.src = "https://connect.facebook.net/zh_TW/sdk.js#xfbml=1&version=v3.1&appId=301047760708850&autoLogAppEvents=1";
	fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

	  // Here we run a very simple test of the Graph API after login is
	  // successful.  See statusChangeCallback() for when this call is made.
	  function GoToBack() {
	    FB.api('/me','GET', { "fields": "id,name,email" }, function (response) {
	    	console.log('Successful login for: ' + response.name);
		      console.log('Successful login for: ' + response.id);
		      console.log('Successful login for: ' + response.email);
	      $.post("${pageContext.request.contextPath}/fbController",{"fbToken":response.id,"memberName":response.name,"memberMail":response.email},function(data){
	    	  if(data!=null){
	    		  window.location.reload();
	    	  }
	      })
	      
	    });
	  }
</script>
<nav class="navbar navbar-expand-md bg-light navbar-light" style="border-radius:10px;">
    <a href="${pageContext.request.contextPath}/Index/Index.jsp"><img class="navbar-brand" src='<c:url value="/Images/Index/Logo.png"/>' width="250px" height="70px"/></a>
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav ml-auto">
        <form class="form-inline" action="">
          <input id="condition"class="form-control mr-sm-2" type="text" placeholder="Search">
          <select id="searchType" class="form-control" id="sel1" style="margin-right: 10px">
		    <option value="blog">Blog</option>
		    <option value="act">Activity</option>
  		  </select>
          <button id="navSerach" class="btn btn-success" type="submit">搜尋</button>
        </form>
        
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
          	<c:if test="${user == null }">
            <i class="far fa-user" style="font-size:36px"></i>
            </c:if>
            <c:if test="${user != null }">
            <i class="fas fa-user-check" style="font-size:36px"></i>
            </c:if>
          </a>
          <div id="memberNav" class="dropdown-menu">  
            <button class="dropdown-item" type="button" data-toggle="modal" data-target="#myModal">登入</button>
          </div>      
        </li>
        <div id="noticeNav">
        
        </div>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
            <i class="fas fa-edit" style="font-size:36px;"></i>
          </a>
          <div id="blogNav" class="dropdown-menu">
            <a class="dropdown-item" href="<c:url value='/Blog/BlogIndex.jsp'/>">網誌首頁</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
            <i class="fas fa-map-marker-alt" style="font-size:36px;"></i>
          </a>
        <div id="ActNav" class="dropdown-menu">
            <a class="dropdown-item" href="<c:url value='/Act/ActMain.jsp'/>">活動首頁</a>
          </div>
        </li>
        <li class="nav-item dropdown">
          <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
            <i class="fas fa-home" style="font-size:36px;"></i>
          </a>
        <div id="HomeNav" class="dropdown-menu">
            <a class="dropdown-item" href="<c:url value='/Index/Index.jsp'/>">回首頁</a>
          </div>
        </li>
      </ul>
    </div>
</nav>

<div>
<!-- 模態框的宣告 class="modal show" 顯示模態框 fade淡入淡出效果-->
				<div class="modal fade" id="myModal" tabindex="-1"> <!-- id:設定id定位, tabindex: 設定取消 -->
			<!-- 模態框視窗的宣告 -->
				<div class="modal-dialog modal-lg"> <!-- modal-lg,sm 設定模態框大小 -->
			<!-- 內容宣告 -->
				<div class="modal-content">
			<!-- 模態框主體 -->
					<div class="modal-body" style="width:80% ;margin: auto;">
					<button type="button" class="close" data-dismiss="modal" style="float: right" >&times;</button>
					<!-- Nav tabs -->
					  <ul class="nav nav-tabs" role="tablist">
					    <li class="nav-item">
					      <a class="nav-link active" data-toggle="tab" href="#loginTAB"><h6>會員登入</h6></a>
					    </li>
					    <li class="nav-item">
					      <a class="nav-link" data-toggle="tab" href="#registerTAB">會員註冊</a>
					    </li>
					  </ul>
					  <!-- Tab panes -->
					  <div class="tab-content">
					    <div id="loginTAB" class="container tab-pane active"><br>
					    	<form class="form-signin" action="<c:url value="LoginController" />" method="post">
					    	<div style="text-align: center;">
					        <img class="mb-4 ml-auto" src='<c:url value="/Images/Index/Logo.png"/>' alt="" width="400" height="120px">
					        </div>
						    <label for="inputAccount">帳號:</label><br>
					        <input style="margin-bottom: 1rem" type="text" id="inputAccount" name="memberAccount" 
					      	class="form-control" placeholder="Account" autofocus/><br>
					        <label for="inputPassword">密碼:</label><br>
					        <label for="inputPassword" class="sr-only">Password</label>
					        <input type="password" id="inputPassword" name="memberPwd"
					      		   class="form-control" placeholder="Password" >
					      	<hr>
					      	<div class="fb-login-button" data-max-rows="1" data-size="medium" data-button-type="login_with" data-show-faces="false" data-auto-logout-link="false" data-use-continue-as="false" onlogin="checkLoginState();" scope="public_profile,email"></div>
					      	<hr>		      	
					        <div id="errormessage"></div>
					        <hr/>
					        <button id="loginButton" class="btn btn-sm btn-primary btn-block" type="submit" style="width: 80%; margin: auto;">登入</button>
					    </form>
					    </div>
					    <!-- 登入成功彈窗(暫定)The Modal -->
						  <div class="modal fade" id="loginSuccessModal">
						    <div class="modal-dialog modal-dialog-centered">
						      <div class="modal-content">
						      <div class="modal-body">
						          
						      </div>
						      </div>
						    </div>
						  </div>
						  <!-- 登入成功彈窗end -->
					    <div id="registerTAB" class="container tab-pane fade"><br>
					    	<h2>註冊會員</h2><button type="button" class="btn btn-outline-success btn-sm" id="hehe">一鍵輸入</button><br>
							<form class="form-signin" action="<c:url value="/RegistController" />" method="post" enctype="multipart/form-data">
							    <div class="form-group">
							      <label for="memberAccount">帳號*:</label><br>
							      <input type="text" class="form-control" id="memberAccount" name="memberAccount" required="">
							      <span id="AccountStatus"></span>
							    </div>
							    <div class="form-group">
							      <label for="memberPwd">密碼*:  rule:英數混合且六位以上</label><br>
							      <input type="password" class="form-control" id="memberPwd" name="memberPwd" required="" >
							      <span id="PasswordStatus"></span>
							    </div>
							    <div class="form-group">
							      <label for="memberMail">電子郵件*:</label><br>
							      <input type="email" class="form-control" id="memberMail" name="memberMail" required="">
							      <span id="MailStatus"></span>
							    </div>
							    <div class="form-group">
							      <label for="memberName">用戶名稱*:</label><br>
							      <input type="text" class="form-control" id="memberName" name="memberName" required="" >
							    </div>
							    <div class="form-group" style="display: none;">
							      <label for="memberHierachy">用戶權限:</label>
							      <input type="text" class="form-control" id="memberHierachy" name="memberHierachy" value="Uncertified">
							    </div>
							    <a id="moreInfo" href="#hideInfo"  data-toggle="collapse">選填資訊<i class="fas fa-angle-down"></i></a>
							    <div id="hideInfo" class="collapse" style="margin-top:20px;"> 
							    	<div class="form-group">
								      <label for="memberNickName">暱稱:</label><br>
								      <input type="text" class="form-control" id="memberNickName" name="memberNickName">
								    </div>
								    <div class="form-group">
								      <label for="memberTel">電話:</label><br>
								      <input type="tel" class="form-control" id="memberTel" name="memberTel">
								    </div>
								    <div class="form-group">
										<label for="">性別: </label><br>
									    <div class="form-check-inline">
									     	 <label class="form-check-label" for="male">
										        <input type="radio" class="form-check-input" id="male" name="memberGender" value="M" >男
										      </label>
										</div>
										    <div class="form-check-inline">
										      <label class="form-check-label" for="female">
										        <input type="radio" class="form-check-input" id="female" name="memberGender" value="F">女
										      </label>
										 	</div>
										 	 <div class="form-check-inline">
										      <label class="form-check-label" for="secret">
										        <input type="radio" class="form-check-input" id="secret" name="memberGender" value="S">Secret
										      </label>
										 	</div>
									 </div>
										 <div class="form-group">
											<label for="memberBirthDay">生日:</label><br>
											 <div id="sandbox-container">
												 <div class="input-group date" data-provide="datepicker">
													    <input type="text" class="form-control inline"  width="15px;" size="15px" id="memberBirthDay" name="memberBirthDay">
													    <div class="input-group-addon">
													        <span><i class="far fa-calendar-alt" style="font-size: 36px;"></i></span>
													    </div>
												</div>
										</div>
									</div>

								    <div class="form-group">
								      <label for="memberPic">個人照片:</label>
								     <div class="text-center">
                                          <img class="avatarP img-circle img-thumbnail" src="<c:url value="/Images/Member/memberPic_default.png" />" style="border-radius: 50% ; width: 200px; height: 200px" alt="avatar"><br>
                                          <input type="file" name="memberPic" accept="image/*" class="text-center center-block file-upload">
                                      </div>
								    </div>
							    </div>
							    
							    <hr>
							    <button id="registButton" type="submit" class="btn btn-primary">註冊</button>
							    <button type="reset" class="btn btn-sm btn-second">清除</button>
							</form>
					    </div>
					  </div>	
					</div>
				</div>
			</div>
		</div>
	</div>
<script type="text/javascript"> // 登入驗證功能
		  $('#loginButton').click(function(event) {
		   event.preventDefault();
		    $.post("${pageContext.request.contextPath}/LoginController",{"memberAccount":$("#inputAccount").val(),"memberPwd":$("#inputPassword").val()},function(data) {    
		      if(data == "success"){
	//	        window.location.href = "index.jsp";
		       location.reload();
		      }else{
		       $('#errormessage').html("<span class=\"text-danger\">帳號 或 密碼錯誤，請重新輸入</span>");
		      }  
		     });
		   });
</script>
<script type="text/javascript"> //nav 搜尋
$('#navSerach').click(function(event) {
	event.preventDefault();
	   var condition = $("#condition").val();
	   var searchType =$('#searchType').val();
	   if($('#searchType').val()=='blog'){
	    	location.href="${pageContext.request.contextPath}/Blog/BlogIndex.controller?search="+condition; 
	   }
	   if(searchType =='act'){		  
		  location.href="${pageContext.request.contextPath}/Act/ActMain.jsp?search="+condition;
	   }
	    });
</script>
<script type="text/javascript"> //修改NavBar按鈕功能
	$( document ).ready(function() {
		if('${user}'!=""){
				$.getJSON("${pageContext.request.contextPath}/getNotice",{"memberID":${user.memberID}},function(data){
		    	if(data.status=="findNoticeList"){
					if('${user.memberHierachy}'=='Admin'){
						$('#memberNav').html("<button class='dropdown-item' type='button'><a href='${pageContext.request.contextPath}/ProfilePageGet?memberID=${user.memberID }&lmi=${user.memberID }&page=main' style='text-decoration:none;color:black'>個人首頁</a></button><a style='text-decoration:none;color:black' href='${pageContext.request.contextPath}/LogoutController'><button id='logoutButton' class='dropdown-item'>登出</button></a></div>"
						);
						$('#noticeNav').html("<li class='nav-item dropdown '><a class='nav-link' href='<c:url value='/ProfilePageGet?memberID=${user.memberID}&lmi=${user.memberID}&page=notice'/>'  style='margin:5px 5px 5px 0px;'><i class='far fa-envelope' style='font-size:36px'></i><span id='spanNoticeCount' class='badge' style='position: absolute;top: 5px;right: 0px;padding: 4px 8px;border-radius: 50%;background: red;color: white;'>"+data.count+"</span></a></li>")
						$('#blogNav').html("<a class='dropdown-item' href='<c:url value='/Blog/BlogIndex.jsp'/>'>網誌首頁</a><a class='dropdown-item' href='<c:url value='/Blog/BlogNew.jsp'/>'>新增網誌</a>")
						$('#ActNav').html("<a class='dropdown-item' href='<c:url value='/Act/ActMain.jsp'/>'>活動首頁</a><a class='dropdown-item' href='<c:url value='/before.act.controller'/>'>新增活動</a>")
						$('#HomeNav').html("<a class='dropdown-item' href='<c:url value='/Index/Index.jsp'/>'>回首頁</a><a class='dropdown-item' href='<c:url value='/Console/ViewPointManage.jsp'/>'>景點管理</a><a class='dropdown-item' href='<c:url value='/Console/Console.jsp'/>'>檢舉管理</a>");	
						$('#spanNoticeCount1').text(data.count);
					}else if( '${user.memberID}' != ""){
						$('#memberNav').html("<button class='dropdown-item' type='button'><a href='${pageContext.request.contextPath}/ProfilePageGet?memberID=${user.memberID }&lmi=${user.memberID}&page=main' style='text-decoration:none;color:black'>個人首頁</a></button><a style='text-decoration:none;color:black' href='${pageContext.request.contextPath}/LogoutController'><button id='logoutButton' class='dropdown-item'>登出</button></a></div>"
						);
						$('#noticeNav').html("<li class='nav-item dropdown '><a class='nav-link' href='<c:url value='/ProfilePageGet?memberID=${user.memberID}&lmi=${user.memberID}&page=notice'/>'  style='margin:5px 5px 5px 0px;'><i class='far fa-envelope' style='font-size:36px'></i><span id='noticeCount' class='badge' style='position: absolute;top: 5px;right: 0px;padding: 4px 8px;border-radius: 50%;background: red;color: white;'>"+data.count+"</span></a></li>");
						$('#blogNav').html("<a class='dropdown-item' href='<c:url value='/Blog/BlogIndex.jsp'/>'>網誌首頁</a><a class='dropdown-item' href='<c:url value='/Blog/BlogNew.jsp'/>'>新增網誌</a>")
						$('#ActNav').html("<a class='dropdown-item' href='<c:url value='/Act/ActMain.jsp'/>'>活動首頁</a><a class='dropdown-item' href='${pageContext.request.contextPath}/before.act.controller'>新增活動</a>")
						$('#spanNoticeCount1').text(data.count);				
		    		}
		    	}else if (data.status=="NoNewNoticeList"){
		    		if('${user.memberHierachy}'=='Admin'){
						$('#memberNav').html("<button class='dropdown-item' type='button'><a href='${pageContext.request.contextPath}/ProfilePageGet?memberID=${user.memberID }&lmi=${user.memberID }&page=main' style='text-decoration:none;color:black'>個人首頁</a></button><a style='text-decoration:none;color:black' href='${pageContext.request.contextPath}/LogoutController'><button id='logoutButton' class='dropdown-item'>登出</button></a></div>"
						);
						$('#noticeNav').html("<li class='nav-item dropdown '><a class='nav-link' href='<c:url value='/ProfilePageGet?memberID=${user.memberID}&lmi=${user.memberID}&page=notice'/>' style='margin:5px 5px 5px 0px;'><i class='far fa-envelope' style='font-size:36px'></i><span id='spanNoticeCount' class='badge' style='position: absolute;top: 5px;right: 0px;padding: 4px 8px;border-radius: 50%;background: red;color: white;'>"+data.count+"</span></a></li>")
						$('#blogNav').html("<a class='dropdown-item' href='<c:url value='/Blog/BlogIndex.jsp'/>'>網誌首頁</a><a class='dropdown-item' href='<c:url value='/Blog/BlogNew.jsp'/>'>新增網誌</a>")

						$('#ActNav').html("<a class='dropdown-item' href='<c:url value='/Act/ActMain.jsp'/>'>活動首頁</a><a class='dropdown-item' href='${pageContext.request.contextPath}/before.act.controller'>新增活動</a>")
						$('#HomeNav').html("<a class='dropdown-item' href='<c:url value='/Index/Index.jsp'/>'>回首頁</a><a class='dropdown-item' href='<c:url value='/Console/ViewPointManage.jsp'/>'>景點管理</a><a class='dropdown-item' href='<c:url value='/Console/Console.jsp'/>'>檢舉管理</a>");
						$('#spanNoticeCount1').text(data.count);
					}else if( '${user.memberID}' != ""){

						$('#memberNav').html("<button class='dropdown-item' type='button'><a href='${pageContext.request.contextPath}//ProfilePageGet?memberID=${user.memberID }&lmi=${user.memberID }&page=main' style='text-decoration:none;color:black'>個人首頁</a></button><a style='text-decoration:none;color:black' href='${pageContext.request.contextPath}/LogoutController'><button id='logoutButton' class='dropdown-item'>登出</button></a></div>"
						);
						$('#noticeNav').html("<li class='nav-item dropdown '><a class='nav-link' href='<c:url value='/ProfilePageGet?memberID=${user.memberID}&lmi=${user.memberID}&page=notice'/>'  style='margin:5px 5px 5px 0px;'><i class='far fa-envelope' style='font-size:36px'></i><span id='noticeCount' class='badge' style='position: absolute;top: 5px;right: 0px;padding: 4px 8px;border-radius: 50%;background: red;color: white;'>"+data.count+"</span></a></li>");
						$('#blogNav').html("<a class='dropdown-item' href='<c:url value='/Blog/BlogIndex.jsp'/>'>網誌首頁</a><a class='dropdown-item' href='<c:url value='/Blog/BlogNew.jsp'/>'>新增網誌</a>")
						$('#ActNav').html("<a class='dropdown-item' href='<c:url value='/Act/ActMain.jsp'/>'>活動首頁</a><a class='dropdown-item' href='${pageContext.request.contextPath}/before.act.controller'>新增活動</a>")
						$('#spanNoticeCount1').text(data.count);
					}
		    	}
			})
		}
		})

	</script>
	
	<script type="text/javascript">
	function reloadOnce() {
	    if(!window.location.hash) {
	        window.location = window.location + '#loaded';
	        window.location.reload();
	    }
	}
	
	</script>

    <script type="text/javascript"> //檢查帳號及EMAIL是否重複
    $("#memberAccount").on("blur",function(){
        $.post("${pageContext.request.contextPath}/memberAccountCheck",{"memberAccount":$("#memberAccount").val()},function(data){
        	if(data == "success"){
		    	 $("#AccountStatus").html("<span class=\"text-success\">帳號可使用</span>");
			}else{
				$("#AccountStatus").html("<span class=\"text-danger\">帳號不可為空或已被註冊</span>");
			}
        })
    });
    $("#memberMail").on("blur",function(){
        $.post("${pageContext.request.contextPath}/memberMailCheck",{"memberMail":$("#memberMail").val()},function(data){
        	if(data == "success"){
		    	 $("#MailStatus").html("<span class=\"text-success\">Email可使用</span>");
			}else{
				$("#MailStatus").html("<span class=\"text-danger\">Email不可為空或已被註冊</span>");
			}
        })
    });   
    </script>
    <script type="text/javascript"> //註冊密碼判斷
    	
	    $("#memberPwd").on("blur",function(){
	    	var thePwd = document.getElementById("memberPwd").value;
	        var thePwdLen = thePwd.length;
	        var flag1 = false, flag2 = false;
	        if (thePwd == "") {
	        	$('#PasswordStatus').html("<span class=\"text-danger\">密碼不可為空</span>");
	        }
	        else if (thePwdLen >= 6) {
	            //alert(">=6");
	            for (var i = 0; i < thePwdLen; i++) {
	                var PwdChr = thePwd.charAt(i).toUpperCase();//都轉大寫
	                if (PwdChr >= "A" && PwdChr <= "Z") {
	                    flag1 = true;
	                }
	                else if (PwdChr >= "0" && PwdChr <= "9") {
	                    flag2 = true;
	                }
	                if (flag1 && flag2) {
	                    break;
	                }
	            }
	            if (flag1 && flag2) {
	            	$('#PasswordStatus').html("<span class=\"text-success\">密碼已接受</span>");
	            } else {
	            	$('#PasswordStatus').html("<span class=\"text-danger\">密碼格式不符</span>");
	            }
	        }
	        else { //字數小於6
	        	$('#PasswordStatus').html("<span class=\"text-danger\">密碼字數不符</span>");
	        }
	    });
    </script>
    <script type="text/javascript"> //日曆格式設定
		$('#sandbox-container .input-group.date').datepicker({
			clearBtn: true,
		    language: "zh-TW",
		});
	</script>
	<script> //註冊區域預覽圖顯示
	 var readURL = function(input) {
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $(input).prev().prev().attr('src', e.target.result);
            }
            reader.readAsDataURL(input.files[0]);
        }
    }   
    $(".file-upload").on('change', function(){
        readURL(this);
    });
    </script>
    <script type="text/javascript">
    $(document).ready(function(){
   	 $("#hehe").click(function(){
   		$('#memberAccount').val("DemoTest");
   		$('#memberPwd').val("qwe123");
   		$('#memberMail').val("Demo@gmail.com");
   		$('#memberName').val("註冊展示");
   		$('#memberNickName').val("Demo");
   		$("input[name='memberGender'][value='S']").prop("checked", true);
   		$('#memberTel').val("0912345678");
   		$('#memberBirthDay').val("1994-01-01");
   	 })
    })
    
    </script>
</body>
</html>