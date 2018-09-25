$(document).ready(function(){
	$(".outdoubleT").hide();
		$(".flips").mouseenter(function(){
			$(".flips").css("background-color","#999e8a");
		});	
		$(".flips").mouseout(function(){
			$(".flips").css("background-color","#e5eecc");
		});	
		$(".flips").click(function(){
			$(".flips").css("background-color","#999e8a");
		});
	
$(".flips").click(function(){
$(".outdoubleT").slideToggle("fast");	
});	

//$(".flip").click(function(){
//	$(".uuu div,img,h6,input:gt(2)").slideToggle("normal");	
//	});	
});