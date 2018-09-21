<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html lang="zh-tw">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>page1</title>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/CssJs/page1.css" /> --%>

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/css/jumbotron.css">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.3.1/css/all.css"
	integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU"
	crossorigin="anonymous">
<style>
@import url(https://fonts.googleapis.com/earlyaccess/notosanstc.css);

* {
	margin: 0;
	padding: 0;
}
/* ALL */
.a1 {
	font-family: 'Noto Sans TC';
	color: rgb(48, 43, 43);
}

.a1:hover {
	transition-property: all;
	transition-duration: 0.8s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(18, 139, 148);
}

img:hover {
	transition-property: all;
	transition-duration: 0.3s;
	transition-delay: 0s;
	transition-timing-function: linear;
	opacity: 0.7;
}

.d1 {
	margin: auto;
	width: 300px;
}

hr.style-two {
	border: 0;
	height: 1px;
	background-image: linear-gradient(to right, rgba(226, 15, 15, 0),
		rgba(0, 0, 0, 0.75), rgba(0, 0, 0, 0));
}

.nav-link {
	font-family: 'Noto Sans TC';
	color: rgb(59, 54, 54);
}

.nav-link:hover {
	background-color: rgb(210, 205, 247);
}

#carouselExampleIndicators {
	margin: auto;
	padding-left: 20px;
}

#carouselExampleIndicators ol li {
	width: 20px;
	height: 20px;
	border-radius: 25%;
}

.carousel-control-prev span {
	width: 100px;
	height: 100px;
}

.carousel-control-next span {
	width: 100px;
	height: 100px;
}

.navbar {
	border-radius: 20px;
}

.x2 {
	position: absolute;
	top: 200;
	right: 0;
	left: 0;
	margin: auto;
	border: 8px rgb(58, 56, 56, 0.1);
	border-style: solid;
	width: 1050px;
	height: 460px;
	display: none;
	background-color: white;
	z-index: 2;
}

.div1 {
	margin: auto;
	width: 1040px;
	height: 350px;
	text-align: center;
}

.div2 {
	width: 255px;
	height: 330px;
	text-align: center;
	display: inline-block;
	vertical-align: top;
	border-radius: 3px;
	margin-top: 15px;
}

.div3 {
	margin: auto;
	height: 235px;
	width: 242px;
	text-align: center;
	background-size: contain;
}

.div4 {
	margin: auto;
	margin-top: 12px;
	height: 70px;
	width: 242px;
	text-align: center;
}

.sticky {
	background-color: rgb(177, 171, 171);
	position: fixed;
	top: 0;
	width: 100%;
	z-index: 7;
	opacity: 0.8;
}

.sticky:hover {
	opacity: 1;
	z-index: 7;
}

#d4 {
	/* border: 1px rgb(90, 32, 228) solid; */
	overflow: auto;
}

.hr1 {
	height: 1px;
	border: none;
	border-top: 1px dashed #0066CC;
}

/* article */
.divHeight {
	/*             border: 1px solid red; */
	height: 480px;
}

.hot {
	overflow: auto;
	padding-top: 10px;
}

.hot0 {
	display: inline-block;
	padding-left: 20px;
}

.hot0 button {
	font-size: 130%;
	border-radius: 100%;
}

.hot1 {
	display: inline-block;
}

.hot1 button {
	font-size: 130%;
	border-radius: 100%;
}

.hot2 {
	border-radius: 100%;
}

article {
	/* border: 1px red solid; */
	width: 65%;
	float: left;
}

#d5 {
	/* border: 3px rgb(15, 73, 10) dashed; */
	overflow: auto;
}

.divAS1 {
	/* border: crimson solid 1px; */
	float: left;
	display: inline-block;
	margin-top: 10px;
	margin-left: 20px;
}

.divAS2 {
	/* border: crimson solid 1px; */
	float: right;
	display: inline-block;
	margin-top: 10px;
	margin-right: 20px;
}

.divAS11 {
	margin-top: 5px;
	width: 450px;
	height: 300px;
}

.divAS12 {
	margin: auto;
	margin-top: 5px;
	width: 450px;
	text-align: center;
	font-size: 80%;
}

.distance {
	padding-right: 15px;
	padding-left: 10px;
}

.border1 {
	border-right: 1px solid grey;
	padding-right: 15px;
	padding-left: 10px;
}

.divAS13 {
	margin-top: 5px;
	width: 450px;
	text-align: center;
	font-size: 120%;
}

.divAS14 {
	margin-top: 5px;
	width: 450px;
	text-align: center;
	font-size: 80%;
}

.divAS15 {
	margin-top: 10px;
	margin-bottom: 10px;
	width: 450px;
	text-align: center;
}

.a2 {
	font-family: 'Noto Sans TC';
	color: rgb(10, 0, 70);
}

.a2:hover {
	transition-property: all;
	transition-duration: 0.8s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(94, 0, 8);
}

.divAS16 {
	margin: auto;
	text-align: center;
	width: 450px;
}

.liBG {
	background-color: rgb(18, 139, 148);
	color: black;
	border-radius: 50%;
}

.liBG2 {
	background-color: rgb(18, 139, 148);
	color: black;
}

.pagination-lg .page-item:last-child .page-link {
	/* border-radius: 0; */
	border-radius: 50%;
}

.pagination-lg .page-item:first-child .page-link {
	/* border-radius: 0; */
	border-radius: 50%;
}

/* aside */
aside {
	width: 33%;
	float: right;
	/* border: 1px rgb(119, 94, 94) solid; */
}

hr {
	text-align: right;
}

.d2 {
	padding-top: 50px; 
}

.form-inline input {
	border-radius: 20px;
}

.h5{
	color: #535050;
	padding-top: 50px; 
	text-align: center;
}
.title-text span {
	display: block;
	position: relative;
	color: #0d2335;
	text-align: center;
	font-family: 'Noto Sans TC';
/* 	padding-left:50px; */

}

.title-text span:before, .title-text span:after {
	content: '';
	position: absolute;
	top: 50%;
	background: #8c8c8c;
	width: 20%;
	height: 3px;
}

.title-text span:before {
	left: 2%;
}

.title-text span:after {
	right: 2%;
}

.divborder {

	margin-top: 20px;
	margin-bottom: 20px;
	padding-bottom: 15px;
	padding-top: 15px;
}

.transition1:hover {
	transition-property: all;
	transition-duration: 0.3s;
	transition-delay: 0s;
	transition-timing-function: linear;
	border: 1px solid rgb(37, 37, 97);
}


.btnt1 {
	margin-right: 40px;
}

.divT1 {
	/* border: 2px red solid; */
	margin-top: 20px;
	margin-bottom: 10px;
	height: 800px;
	text-align: center;
}

.divT2 {
	/* border: 1px rgb(201, 92, 92) solid; */
	margin-top: 20px;
	padding-top: 5px;
	height: 180px;
	text-align: center;
	overflow: auto;
}

.divT3 {
	/* border: 1px rgb(71, 28, 28) solid; */
	padding-top: 5px;
	float: left;
	margin: auto;
	display: inline-block;
	width: 140px;
	height: 140px;
	background-size: contain;
}

.divT4 {
	/* border: 1px rgb(31, 4, 4) solid; */
	margin-left: 2px;
	margin-right: 2px;
	margin-top: 8px;
	display: inline-block;
	text-align: center;
	width: 240px;
	height: 145px;
	float: right;
}

.divText {
	padding-top: 90px;
	margin-left: 2px;
	margin-right: 2px;
	margin-top: 3px;
	height: 25px;
	float: right;
	font-size: 90%;
	font-family: 'Noto Sans TC';
	color: grey;
}

.divText:hover {
	transition-property: all;
	transition-duration: 0.3s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(17, 17, 63);
}

.divT31 {
	margin: auto;
	width: 130px;
	height: 130px;
}

#top1 {
	position: fixed;
	/* display: flex; */
	right: 0px;
	bottom: 0px;
	/* float: right; */
}

#top1:hover {
	color: #164927;
}
</style>
</head>

<body>

			<div class="d2 container">
				<div class="title">
					<h2 class="title-text">
						<span><input type="button" value="Oops! It Looks Like Nothing Was Found!" id="buttonFade0"
							class="btn btn-info fa-1x"></span>
					</h2>

					<h5 class="h5">Sorry, but nothing matched your search terms. Please try again with some different keywords.</h5>
					<div id="">
						<div class="divborder">
							<div>
								<nav class="nav justify-content-center navbar navbar-dark bg-white "
									style="background-color: #5ea0cf">
									
									<form class="form-inline" method="get"
										action="<c:url value="/Blog/BlogIndex.controller"/>">
										<input id="keyword" name="search" class="form-control mr-sm-2 transition1 fa-3x" type="search"
											placeholder="國家，城市及關鍵字" aria-label="Search" required value="${search}">
										<button id="keyword1" class="btn btn-outline-success my-2 my-sm-0 btnt1 fa-3x"
											type="submit">Search</button>
									</form>
								</nav>
							</div>
						</div>
					</div>
				</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function() {
							//Change 6FORM
// 							alert('${result}');
							if ('${result}' != "") {
								
								//top1
								$('#changePic1').attr("src","data:image/png;base64,${result[0].blogCoverToBase64}");
								//$('#changeNation1').html('${result[0].blogCity}');
								$('#changeViews1').html('${result[0].blogView}');
								$('#changeCity1').html('${result[0].blogCity}');
								$('#changeTitle1').html('${result[0].blogTitle}');
								$('#changeDate1').html('${result[0].blogReleaseTime}'.substring(0, 10));
								//$('#changeMember1')

								//top4
								$('#changePic2').attr("src","data:image/png;base64,${result[1].blogCoverToBase64}");
								//$('#changeNation2').html('${result[1].blogCity}');
								$('#changeViews2').html('${result[1].blogView}');
								$('#changeCity2').html('${result[1].blogCity}');
								$('#changeTitle2').html('${result[1].blogTitle}');
								$('#changeDate2').html('${result[1].blogReleaseTime}'.substring(0, 10));
								//$('#changeMember2')

								//top2
								$('#changePic3').attr("src","data:image/png;base64,${result[2].blogCoverToBase64}");
								//$('#changeNation3').html('${result[2].blogCity}');
								$('#changeViews3').html('${result[2].blogView}');
								$('#changeCity3').html('${result[2].blogCity}');
								$('#changeTitle3').html('${result[2].blogTitle}');
								$('#changeDate3').html('${result[2].blogReleaseTime}'.substring(0, 10));
								// $('#changeMember3')

								//top5
								$('#changePic4').attr("src","data:image/png;base64,${result[3].blogCoverToBase64}");
								//$('#changeNation4').html('${result[3].blogCity}');
								$('#changeViews4').html('${result[3].blogView}');
								$('#changeCity4').html('${result[3].blogCity}');
								$('#changeTitle4').html('${result[3].blogTitle}');
								$('#changeDate4').html('${result[3].blogReleaseTime}'.substring(0, 10));
								//$('#changeMember4')

								//top
								$('#changePic5').attr("src","data:image/png;base64,${result[4].blogCoverToBase64}");
								//$('#changeNation5').html('${result[4].blogCity}');
								$('#changeViews5').html('${result[4].blogView}');
								$('#changeCity5').html('${result[4].blogCity}');
								$('#changeTitle5').html('${result[4].blogTitle}');
								$('#changeDate5').html('${result[4].blogReleaseTime}'.substring(0, 10));
								//$('#changeMember5')
								
								//top6
								$('#changePic6').attr("src","data:image/png;base64,${result[5].blogCoverToBase64}");
								//$('#changeNation6').html('${result[5].blogCity}');
								$('#changeViews6').html('${result[5].blogView}');
								$('#changeCity6').html('${result[5].blogCity}');
								$('#changeTitle6').html('${result[5].blogTitle}');
								$('#changeDate6').html('${result[5].blogReleaseTime}'.substring(0, 10));
								//$('#changeMember6')
							}
							else if ('${result}' == ""){
// 								 alert('GOGOGO');
								 $.getJSON('../Blog/BlogIndexFirst.controller',function(json){
// 									 alert('GOGOGO123');
//    								alert(JSON.stringify(json));
// 									 alert(json[0].blogCover);	
									 $.each(json,function(i,product){
// 										 alert(i);
// 											alert(product.blogTitle);
// 											alert(product.blogTitle);
// 											alert(product.blogCover);
// 											alert(arrayBufferToBase64(product.blogCover));
										$('#changePic'+(i+1)).attr("src","data:image/png;base64,"+product.blogCover);
										$('#changeViews'+(i+1)).html(product.blogView);
// 										alert('#changeViews'+(i+1));
										$('#changeCity'+(i+1)).html(product.blogCity);
										$('#changeTitle'+(i+1)).html(product.blogTitle);
// 										alert(new Date(product.blogReleaseTime).toISOString());
// 										alert(new Date(product.blogReleaseTime).toISOString().split('T')[0]);
										$('#changeDate'+(i+1)).html(new Date(product.blogReleaseTime).toISOString().split('T')[0]);
										
// 										aside
										$("#changeAsidePic"+(i+1)).attr("src","data:image/png;base64,"+product.blogCover);
										$("#changeAsideTitle"+(i+1)).html(product.blogTitle);
										$("#changeAsideViews"+(i+1)).html(product.blogView);
									 });
								 });
								 
								 $.getJSON('../Blog/BlogIndexDate.controller',function(json2){
									 $.each(json2,function(i2,product2){
// 										 alert(i2);
										$("#changeAsidePicDate"+(i2+1)).attr("src","data:image/png;base64,"+product2.blogCover);
										$("#changeAsideTitleDate"+(i2+1)).html(product2.blogTitle);
										$("#changeAsideViewsDate"+(i2+1)).html(new Date(product2.blogReleaseTime).toISOString().split('T')[0]);
									 });
								 });
							}

							$('#n1 ul li').hover(function() {
								$(this).find('.x2').stop().slideToggle();
							})

							window.onscroll = function() {
								myFunction()
							};
							var navbar = document.getElementById("n1");
							var sticky = navbar.offsetTop;
							function myFunction() {
								if (window.pageYOffset >= sticky) {
									navbar.classList.add("sticky")
								} else {
									navbar.classList.remove("sticky");
								}
							}
							
							var url = location.href;
							if(url.indexOf('?')!=-1){
							    var page = "";
							    var ary = url.split('?')[1].split('&');
							    for(i=0;i<=ary.length-1;i++){
							        if(ary[i].split('=')[0] == 'page')
							            page = ary[i].split('=')[1];
							    }
							    
							    if(page==5){					
							    	$('#page5').addClass('disabled');
							    	$('#page6').addClass('disabled');
							    }
							    if(page==4){					
							    	$('#page4').addClass('disabled');						
							    }
							    if(page==3){					
							    	$('#page3').addClass('disabled');
							    }
							    if(page==2){					
							    	$('#page2').addClass('disabled');
							    }
							    if(page==1&&(url.indexOf('?')==(-1))){					
							    	$('#page0').addClass('disabled');
							    	$('#page1').addClass('disabled');
							    }
							    
							}if(url.indexOf('?')==(-1)){					
						    	$('#page0').addClass('disabled');
						    	$('#page1').addClass('disabled');
						    }

	
							
							
							
							
						})
						
						
						
						
		$('#buttonFade0').click(function() {
			$('#toggle0').toggle(1000);
		})
		$('#buttonFade1').click(function() {
			$('#toggle1').toggle(1000);
		})
		$('#buttonFade2').click(function() {
			$('#toggle2').toggle(1000);
		})

		$('#top1').click(function() {

		})

		$(window).scroll(function() {
			if ($(this).scrollTop() > 100) {
				$('.scrollToTop').fadeIn();
			} else {
				$('.scrollToTop').fadeOut();
			}
		});

		$('#top1').click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
	
		});
		


	</script>

</body>

</html>