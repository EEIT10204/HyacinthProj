<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>註冊</title>

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/earlyaccess/notosanstc.css">

<%@ include file="../Index/head2.jsp"%>
</head>


<body>
	
		<div style="width: 50% ; margin: auto">
		<h2 style="margin-top: 5rem ; margin-bottom:1rem;">Sign Up</h2>
			<form action="<c:url value="/register.controller"/>" method="post">
				<input placeholder="Account" id="memberAccount" name="memberAccount"  type="text" required=""><span class="AccountStatus" style="color: red"></span><br>
				
				<input placeholder="Password" id="memberPwd" name="memberPwd"  type="password" required=""><span id="errorMsg">英數混合且六位以上</span><br>
				
<!-- 				<input placeholder="Confirm Password" id="confirmPassword" name="confirmPassword" type="password" required=""><br> -->
				
				<input placeholder="Eamil" id="memberMail" name="memberMail" type="email" required=""><span class="MailStatus" style="color: red"></span><br>
				
				<input placeholder="Name" id="memberName" name="memberName"  type="text" required=""><br>
				
				<input style="display: none" id="memberHierachy" name="memberHierachy" value="Uncertified" type="text"><br>

				<button class="btn btn-success" type="submit">Sign Up</button>
				<button class="btn btn-danger" type="reset" id="Reset">Reset</button>
			</form>
		</div>
		
</div>
<!--//main-->
<script type="text/javascript">
$("#memberAccount").on("change",function(){
    $.post("/HyacinthProj/memberAccountCheck",{"memberAccount":$("#memberAccount").val()},function(responseText){
    	 $(".AccountStatus").text(responseText);
    })
});
$("#memberMail").on("change",function(){
    $.post("/HyacinthProj/memberMailCheck",{"memberMail":$("#memberMail").val()},function(responseText){
    	 $(".MailStatus").text(responseText);
    })
});

</script>
<script type="text/javascript">
	document.addEventListener("DOMContentLoaded", function () {
	    document.getElementById("memberPwd").addEventListener("blur", blurforPwd);	
	    document.getElementById("Reset").addEventListener("click",function(){window.location.reload();},false);
	});
	function blurforPwd() {
		
		var thePwd = document.getElementById("memberPwd").value;
		var thePwdLen = thePwd.length;
		var flag1 = false; 
		var flag2 = false;
		if (thePwdLen >= 6) {
         //alert(">=6");
         	for (var i = 0; i < thePwdLen; i++) {
             	var PwdChr = thePwd.charAt(i).toUpperCase();//都轉大寫
             	if (PwdChr >= "A" && PwdChr <= "Z") {
                 	flag1 = true;
             	}else if (PwdChr >= "0" && PwdChr <= "9") {
                 	flag2 = true;
             	}
             	if (flag1 && flag2) {
                    break;
                }
         	}
         	if (flag1 && flag2) {
                document.getElementById("errorMsg").
                    innerHTML = "<img src='<spring:url value='/resources/images/correct.png'/>' style='width='17px' height='17px''>密碼已接受";
                document.getElementById("errorMsg").style.color = "green";
            }else{
                document.getElementById("errorMsg").
                    innerHTML = "<img src='<spring:url value='/resources/images/error.png'/>'>格式不符,英數混合";
                document.getElementById("errorMsg").style.color = "red";
            }
		}else { //字數小於6
            document.getElementById("errorMsg").
                innerHTML = "<img src='<spring:url value='/resources/images/error.png'/>'>長度不符,至少六位";
            document.getElementById("errorMsg").style.color = "red";
        }
	 	
	};
</script>
</body>
</html>