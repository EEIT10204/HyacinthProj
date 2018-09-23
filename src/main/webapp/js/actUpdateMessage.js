$(document).ready(function(){
//	$(".updates span").click(function(){
	
		$(".updates span").click(function(){
//		alert(this.nodeName)
		$(this).parent().prev().children().prop("disabled",false);
//		$(this).parent().parent().prev().children.prop("disabled",false);
//		alert($(this).parent().prev().children().nodeName)
//		$(".messB input").prop("disabled","false");
		
		$(this).next().attr("type","submit");
		var Comment = $(this).parent().prev().children().val();
		
//		function(){
//			$(this).parent().prev().children().prop("disabled","disabled");
//			$(this).next().attr("type","hidden");
//		}
		
//		$(this).parent().next().attr("type","submit");
	});
//		$(".updates span").click(function(){
//			$(this).text("取消");
//			$(this).parent().prev().children().prop("disabled","disabled");
//			$(this).next().attr("type","hidden");
//			var ResetComment = $(this).parent().prev().children().val(Comment);
//			alert('ResetComment');
//		});
});


//parent:父(上一層),prev:同一層,children:子(下一層)
//attr():改變屬性(有=""的),EX:src=""
//prop():改變屬性(沒=""的),EX:disabled