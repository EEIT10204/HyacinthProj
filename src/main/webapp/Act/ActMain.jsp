<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="../Index/NewHeader.jsp" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/style.css" rel="stylesheet"> 
 
<%--   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/flexslider.css" /> --%>
<%--   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reset.css" /> --%>
  <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/zoomify.min.css">
<%--   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
  
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<%--   <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--   <script src="js/jquery.flexslider.js"></script> -->
  <script src="${pageContext.request.contextPath}/js/zoomify.min.js"></script>
<%--   <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script> --%>
  <script src="${pageContext.request.contextPath}/js/ActOnload.js"></script>
    
<title>Activities</title>
<style>
#bodyContent{
 	width:100%;
	height:790px;
/* 	border:1px solid red; */
}
.ulcolor{
	background-color: rgb(85, 134, 180);
}
.licolor{
	
}
.aaaaa{
	display: inline-block;
	border: 1px solid red;
	float: right;
}
.aaaaa1{
	border: 2px solid rgb(31, 18, 18);
	overflow: auto;
}
.d1{
	width: 30px;
	height: 30px;
	float: left;
	/* margin-left: 230px; */
	/* margin-right: 10px; */
	position: absolute;
	display: inline-block;	
}
*{
	margin: 0px;
	padding: 0px;
}
.A1{
	width: 370px;
	height: 310px;
/* 	border: 2px solid rgb(37, 37, 37); */
  	margin-left: 60px; 
	margin-top: 30px;
	float: left;
	background-color: rgb(255, 255, 255);
}
.A2{
	width: 360px;
	height: 30px;
	/* border: 1px solid red; */
	text-shadow:2px 1px 2px #aaabac;
	font-family:Microsoft JhengHei;
}
.A3{
	width: 360px;
	height: 230px;
	/* border: 1px solid red; */
}
.A4{
	width: 360px;
	height: 40px;
	/* border: 1px solid rgb(112, 4, 4); */
}
.A3 img{
	width: 360px;
	height: 230px;
	margin-left:5px;
}
.aa1{
	display: inline;
	margin-left: 230px;
}
.aa2{
	display: inline;
	text-shadow:2px 1px 2px #aaabac;
	font-family:Microsoft JhengHei;  
}
.aa3{
	display: inline;
	text-align: center;  
}
.boxlong{
	float: left;
	margin-left: 120px;
	margin-top: 20px;
/*     border: 1px solid green; */
}


/*----Search用CSS-----*/
#bodyContent{
	height:830px;
/* 	border: 1px solid green; */
}
.picRow{
/*  	border: 1px solid red; */
/*  	background-color: orange; */
}
#tabs{
/* 	border: 1px solid blue; */
	width:99.1%;
	height:790px;
	padding:0;
}
#tabs-1,#tabs-2,#tabs-3{
/* 	border: 1px solid brown; */
	width:90%;
	height:790px;
	padding:0;
	margin: 0 auto;
}
#myPageList{
/*  	border: 1px solid red; */
	visibility :hidden;
 	margin: 0 auto;
 	padding: 0px;
}
#myPageList li>a{
	font-size: 24px;
}
.pagination{
	margin:0;
}
#actNums{
	margin:0;
	font-size:24px;
}
/* #footer{ */
/*  	margin-top:150px !important; */
/* } */
</style>
</head>

<script>
$( function() {
    $( "#tabs" ).tabs();
  } ); 
</script>

<body onload="forNavSearch()">
<div id ="bodyContent">
	<div class="row picRow">
		<div id="tabs">
			<ul class="ulcolor">
				<li><a href="#tabs-1">Newest</a></li>
				<li><a href="#tabs-2">Popular</a></li>
				<li><a id="actResult" style="display: none;" href="#tabs-3">SearchResult</a></li>
				<form class="form-inline" action="" style="float:right">
					<input id="actKeyword" class="form-control mr-sm-2" type="text" placeholder="輸入地點 or關鍵字">
					<select id="actType" class="form-control" style="margin-right: 10px">
						<option value="" selected disabled hidden>活動狀態</option>
						<option value="prepare">揪團中</option>
						<option value="inProgress">進行中</option>
						<option value="finished">已結束</option>
					</select>
					<select id="actSorting" class="form-control" style="margin-right: 10px">
					    <option value="" selected disabled hidden>排序</option>
						<option value="actStartTime">開始時間</option>
						<option value="actEndTime">結束時間</option>
						<option value="actView">瀏覽次數</option>
						<option value="budget">活動預算</option>
					</select>
					<button id="actSearch" class="btn btn-info">搜尋</button>
				</form>
			</ul>
			<!-- myPageList -->
			<div class ="row" id="myPageList">
			  <div class="col-sm-3"><span id="actNums"></span></div>
			  <div class="col-sm-7">
			  <nav aria-label="Page navigation example">
				  <ul class="pagination justify-content-center">
				  	      <li class="page-item"><a class="page-link" href="#">&nbsp;</a></li>
				  	  <!-- Pagination generated here. -->
				  </ul>
				</nav>
				</div>
			</div>
			<!--tabs-1-->
		   <div id="tabs-1">
<!-- 		  	 <div class="row tabRow"> -->
				<div class="A1" id="Titleout1">
					<div class="A2" id="ActT1">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActP1"><img src=""></div>
					<div class="A4" id="ActB1">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="view1">129</div> 
						<div class="aa3"><a href="" id="ActM1"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>    
					</div>
			  	</div>
				<div class="A1" id="Titleout2">
					<div class="A2" id="ActT2">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActP2"><img src=""></div>
					<div class="A4" id="ActB2">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="view2">129</div> 
						<div class="aa3"><a href="" id="ActM2"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
				<div class="A1" id="Titleout3">
					<div class="A2" id="ActT3">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActP3"><img src=""></div>
					<div class="A4" id="ActB3">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="view3">129</div> 
						<div class="aa3"><a href="" id="ActM3"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
			<!-- 		<div style="width:1100px; height: 5px;" class="boxlong"></div> -->	
				<div class="A1" id="Titleout4">
					<div class="A2" id="ActT4">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActP4"><img src=""></div>
					<div class="A4" id="ActB4">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="view4">129</div> 
						<div class="aa3"><a href="" id="ActM4"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>    
					</div>
				</div>
				<div class="A1" id="Titleout5">
					<div class="A2" id="ActT5">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActP5"><img src=""></div>
					<div class="A4" id="ActB5">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="view5">129</div> 
						<div class="aa3"><a href="" id="ActM5"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
				<div class="A1" id="Titleout6">
					<div class="A2" id="ActT6">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActP6"><img src=""></div>
					<div class="A4" id="ActB6">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="view6">129</div> 
						<div class="aa3"><a href="" id="ActM6"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>    
					</div>
				</div>
<!-- 			  </div> -->
			</div>
			<!--tabs-2-->
			<div id="tabs-2">
<!-- 			 <div class="row tabRow"> -->
				<div class="A1" id="Titleouts">
					<div class="A2" id="ActTpu1">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu1"><img src=""></div>
					<div class="A4" id="ActBpu1">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="views1">129</div> 
						<div class="aa3"><a href="" id="ActMpu1"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
				<div class="A1" id="Titleouts">
					<div class="A2" id="ActTpu2">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu2"><img src=""></div>
					<div class="A4" id="ActBpu2">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="views2">129</div> 
						<div class="aa3"><a href="" id="ActMpu2"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>    
					</div>
				</div>
				<div class="A1" id="Titleouts">
					<div class="A2" id="ActTpu3">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu3"><img src=""></div>
					<div class="A4" id="ActBpu3">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="views3">129</div> 
						<div class="aa3"><a href="" id="ActMpu3"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
		<!-- 		<div style="width:1100px; height: 5px;" class="boxlong"></div> -->		
				<div class="A1" id="Titleouts">
					<div class="A2" id="ActTpu4">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu4"><img src=""></div>
					<div class="A4" id="ActBpu4">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="views4">129</div> 
						<div class="aa3"><a href="" id="ActMpu4"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
				<div class="A1" id="Titleouts">
					<div class="A2" id="ActTpu5">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu5"><img src=""></div>
					<div class="A4" id="ActBpu5">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="views5">129</div> 
						<div class="aa3"><a href="" id="ActMpu5"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
										 
				<div class="A1" id="Titleouts">
					<div class="A2" id="ActTpu6">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu6"><img src=""></div>
					<div class="A4" id="ActBpu6">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;"></div>
						<div class="aa2" id="views6">129</div> 
						<div class="aa3"><a href="" id="ActMpu6"><button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button></a></div>     
					</div>
				</div>
<!-- 			</div> -->
			</div>
			<!-- tabs-3 -->
			<div id="tabs-3">
			  	<div class="row tabRow" id="genRow">
				<!-- search results generated here. -->
				</div>
			</div>
		
		</div> <!-- tabs end -->
	</div><!--  picRow end -->
</div> <!--  body content end -->

 <script src="${pageContext.request.contextPath}/js/zoomify.min.js"></script>
 <script type="text/javascript">
	 $('.A1').zoomify({scale:0.8});
 </script>
<script type="text/javascript">
function forNavSearch() {
	urlParams = new URLSearchParams(window.location.search);
	myParam = urlParams.get('search');
    if(myParam!="") {
    	$('#actKeyword').attr("value",myParam);
    	$('#actSearch').click();
    }
}
</script>
<script>
var actPath = "${pageContext.request.contextPath}/actdisplay.controller?actSNum=";

var keyword = $('#actKeyword').val();
var status = $('#actType :selected').val();
var sorting = $('#actSorting :selected').val();

var searchPage = 1;
var pageNum = 0 ;

$("#bodyContent img").addClass("img-fluid");

$('#tabs a[href="#tabs-1"]').click(function(){
// 	alert('hi1')
	$('#myPageList').css("visibility","hidden");
});
$('#tabs a[href="#tabs-2"]').click(function(){
// 	alert('hi2')
	$('#myPageList').css("visibility","hidden");
});
$('#tabs a[href="#tabs-3"]').click(function(){
// 	alert('hi3')
	$('#myPageList').css("visibility","visible");
});

$('#actSearch').click(function(event) {
	event.preventDefault();
	$("#actResult").css("display","block");
	$("#actResult").click();
	$('#myPageList').css("visibility","visible");
// 	$("#tabs-3").empty();
// 	alert($('#actKeyword').val());
// 	alert($('#actType :selected').val());
// 	alert($('#actSorting :selected').val());
    keyword = $('#actKeyword').val();
    status = $('#actType :selected').val();
    sorting = $('#actSorting :selected').val();
    searchPage = 1;
	showSearch(keyword,status,sorting,searchPage);

});

$('#myPageList').on("click",".myPage,.myPrev,.myNext",function(){
	var nowClick=$(this).text();
	if(nowClick=="上一頁"){
		searchPage=parseInt(searchPage)-1;
		showSearch(keyword,status,sorting,searchPage);
	}else if(nowClick=="下一頁"){
		searchPage=parseInt(searchPage)+1;
		showSearch(keyword,status,sorting,searchPage);
	}else{
		showSearch(keyword,status,sorting,nowClick);
		searchPage=nowClick;
	}	
	
	//索引值第幾個li,因為Prev為索引值0，所以之後li的索引值皆等於頁數。
	$('#myPageList li').removeClass("active");
	$('#myPageList li:eq('+searchPage+')').addClass("active");
// 	alert($('li:eq('+searchPage+')').text());
// 	alert(searchPage+","+pageNum);
	if(parseInt(searchPage)==1){
// 		alert('leftEnd');
		$('.myPrev').css("visibility","hidden");
		$('.myNext').css("visibility","visible");
	}else if(parseInt(searchPage)==pageNum){
// 		alert('rightEnd');
		$('.myNext').css("visibility","hidden");
		$('.myPrev').css("visibility","visible");
	}else{
// 		alert('else');
		$('.myPrev').css("visibility","visible");
		$('.myNext').css("visibility","visible");
	}
	
});

   function showSearch(keyword,status,sorting,page){
	 $("#tabs-3").empty();

	 $.getJSON('${pageContext.request.contextPath}/showSelectResults.do',{"keyword":keyword,"status":status,"sorting":sorting,"page":page},function(datas){
// 		alert("page="+page);
// 		alert(JSON.stringify(datas[0]));
// 		alert(JSON.stringify(datas.length));
// 		alert(JSON.stringify(Math.ceil(datas.length/6)));
		if(page == 1){
			$('#myPageList ul').empty();
			var fragment0 = $(document.createDocumentFragment());
			var liPrev = $('<li class="page-item"><a class="page-link" tabindex="-1">上一頁</a></li>').addClass("myPrev").css("visibility","hidden");
			fragment0.append(liPrev);
			var liNext = $('<li class="page-item"><a class="page-link">下一頁</a></li>').addClass("myNext");
			pageNum = Math.ceil(datas[0]/6);
			for(var i=1;i<=pageNum;i++){
				var aPage = $('<a></a>').addClass("page-link").text(i);
				var liItem = $('<li></li>').addClass("page-item myPage").append(aPage);
				if(i==1){
					liItem.addClass("active");
				}
				fragment0.append(liItem);
			}
			fragment0.append(liNext);
			$('#myPageList ul').append(fragment0);
		 	$('#actNums').text('共有'+datas[0]+'筆相關結果。')
		}
		
		 var fragment = $(document.createDocumentFragment());
	           
         $.each(datas[1],function(idx,getObj){
        	var	aHref= $('<a></a>').attr('href',actPath+getObj.actSNum).append('<button type="button" class="btn btn-primary btn-sm" style="margin-top: 3px">More</button>');
        	
        	if(sorting=="actStartTime"){
        		var divaa0=$('<span></span>').text("開始時間:"+new Date(getObj.actStartTime).toLocaleString());
        	}else if(sorting=="actEndTime"){
        		var divaa0=$('<span></span>').text("結束時間:"+new Date(getObj.actEndTime).toLocaleString());
        	}else if(sorting=="budget"){
       			var divaa0=$('<span></span>').text("活動預算: $"+getObj.budget);
        	}
        	
        	var divaa3=$('<div></div>').addClass('aa3').append(aHref);
        	var divaa2=$('<div></div>').addClass('aa2').text(getObj.actView);
        	var divaa1=$('<div></div>').addClass('aa1').append('<img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 35px;height: 35px;">');
         	var divA4=$('<div></div>').addClass('A4').append(divaa0,divaa1,divaa2,divaa3);
         	var imgActPhoto = $('<img>').attr('src','data:image/png;base64,'+getObj.actPhoto);
         	var divA3=$('<div></div>').addClass('A3').append(imgActPhoto);
         	var divA2=$('<div></div>').addClass('A2').append(getObj.actTitle);
         	var divA1=$('<div></div>').addClass('A1').append(divA2,divA3,divA4);
         	fragment.append(divA1);
         });
         
         $("#tabs-3").append(fragment);
//          alert('completed');
	 });
}

</script>

</body>
<%--  <jsp:include page="${pageContext.request.contextPath}/Index/Footer.jsp"></jsp:include> --%>
<jsp:include page="../Index/Footer.jsp" />
</html>