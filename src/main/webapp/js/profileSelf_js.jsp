<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script>
$(document).ready(function() {
	
	//切換使用者上傳圖片
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
    
    
    //寄發驗證信
	$('#sendMail').click(function(){
	 	alert("驗證信已寄出，請稍後~");
		$.getJSON('${pageContext.request.contextPath}/sendMail.do',function(datas){
// 			alert("sendMail.do");
			alert(datas.result);
		});
	});
	
	
	$('#privacyForm').submit(function( event ) {
		 var re4=/^(?=.*[0-9])(?=.*[a-zA-Z])\S{6,}$/;
// 		 alert($('#memberPwd').val());
		 $('#privacyMsg').css("color","red");
// 		 if($('#memberPwd').val()==$('#verifyPwd').val()){
// 			 $('#privacyForm').submit();
// 		 }
		 if($('#memberPwd').val()!="" && !re4.test($('#memberPwd').val())){
			 $('#privacyMsg').html('<img src="../Images/Member/error2.png">密碼須為六位數以上且英文數字至少一個');
			 event.preventDefault();
		 }
		 if($('#memberPwd').val()!=$('#verifyPwd').val()){
			 $('#privacyMsg').html('<img src="../Images/Member/error2.png">密碼不一致');
			 event.preventDefault();
		 }
	});
	
	$('#memberMail').on("change keyup",function(){
		 $('#privacyMsg').css("color","red");
		 $('#privacyMsg').html('提醒您:更改E-mail必須重新驗證!');
	});

});
</script>