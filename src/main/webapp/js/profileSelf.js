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
	 	alert("click");
		$.getJSON('../sendMail.do',function(datas){
			alert("sendMail.do");
			alert(datas.result);
		});
	});
});