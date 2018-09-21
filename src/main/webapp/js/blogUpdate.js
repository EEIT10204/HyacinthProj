$(document).ready(function(){
	$(".divblog239 span").click(function(){
//		alert(this.nodeName)
		alert("hello");
		$(this).parent().children().prop("disabled",false);
//		$(this).parent().parent().prev().children.prop("disabled",false);
//		alert($(this).parent().prev().children().nodeName)
//		$(".messB input").prop("disabled","false");
		
		$(this).next().attr("type","submit");
	});
});


//parent:父(上一層),prev:同一層,children:子(下一層)
//attr():改變屬性(有=""的),EX:src=""
//prop():改變屬性(沒=""的),EX:disabled