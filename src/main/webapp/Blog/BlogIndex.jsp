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
<jsp:include page="../Index/NewHeader.jsp" />
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jumbotron.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<%-- <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script> 
<%-- <script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
<script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-5b8e2eafee0a0c7c"></script>
<style>
@import url(https://fonts.googleapis.com/earlyaccess/notosanstc.css);

* {
	margin: 0;
	padding: 0;
}
body{
	padding-top:0;
}
/* ALL */
.containerMY{
	padding-top:20px;
	border-radius: 50px;
	background-image: linear-gradient(to top, #e6e9f0 0%, #eef1f5 100%);
}
img{
border-radius: 10px;
}
.border001{
			border-top: 5px #378e70 ridge ;
            border-bottom: 5px #50c49b groove; 
            border-right: 5px #50c49b groove; 
            border-left: 5px #378e70 ridge;
}
.border002{
border-top: 5px #378e70 ridge ;
            border-bottom: 5px #50c49b groove; 
            border-right: 5px #50c49b groove; 
            border-left: 5px #378e70 ridge;
}
.border0034{
border-top: 5px #378e70 ridge ;
            border-bottom: 5px #50c49b groove; 
            border-right: 5px #50c49b groove; 
            border-left: 5px #378e70 ridge;
}
.border005{
border-top: 5px #378e70 ridge ;
            border-bottom: 5px #50c49b groove; 
            border-right: 5px #50c49b groove; 
            border-left: 5px #378e70 ridge;
}
.border006{
border-top: 5px #378e70 ridge ;
            border-bottom: 5px #50c49b groove; 
            border-right: 5px #50c49b groove; 
            border-left: 5px #378e70 ridge;
}


a {
    text-decoration:none;
}
.a3 {
 	font-family: 'Noto Sans TC'; 
 	COLOR: RGB(223, 253, 255); 
 	text-decoration:none;
}
.a3:hover {
	transition-property: all;
	transition-duration: 0.8s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(0, 90, 126);
}
.a1 {
	font-family: 'Noto Sans TC';
	color: rgb(48, 43, 43);
}

.a1:hover {
	transition-property: all;
	transition-duration: 0.8s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: #26BEC9;
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

.nav-linkmy:hover {
 	background-color: rgb(210, 205, 247); 
 	border:1px solid;
	border-radius: 5px;
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
/* 	border:2px rgb(90, 32, 228) solid;  */
	display:flex;
	overflow: auto;
}

.hr1 {
	height: 1px;
	border: none;
/* 	border-top: 1px dashed #0066CC; */
}

/* article */
.divHeight {
/*  	border: 2px solid green;  */
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
/* 	border: 1px red solid; */
/* 	width: 65%; */
/* 	float: left; */
}

#d5 {
/* 	 border: 3px rgb(15, 73, 10) dashed;  */
	 display:flex;

}

.divAS1 {
/* 	border: crimson solid 1px;  */
/* 	margin-top: 2px; */
	flex:0.5;
  	margin-right: 10px;  
}

.divAS2 {
	/* border: crimson solid 1px; */
	flex:0.5;
/* 	margin-top: 10px; */

}

.divAS11 {
/* 	margin-top: 5px; */
    width: 100%;
	height: 250px;
/*  	border:2px solid;  */
}

.divAS12 {
	margin: auto;
	margin-top: 5px;
	text-align: center;
	font-size: 90%;
	height: 20px;
/* 	border:2px solid;  */
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
	margin-top: 15px;
/* 	margin-bottom: 20px; */
/* 	width: 450px; */
	text-align: center;
	font-size: 120%;
/* 	border:2px solid;  */
	height: 60px;
}

.divAS14 {
/* 	padding-top: 10px; */
	padding-bottom: 5px;
/* 	width: 450px; */
	text-align: center;
	font-size: 80%;
/* 	border:2px solid;  */
	height: 40px;
}

.divAS15 {
/* 	padding-top: 10px; */
/* 	width: 450px; */
	text-align: center;
/* 	border:2px solid;  */
	height: 60px;
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
	background-color: #26BEC9;
	color: black;
	border-radius: 50%;
}

.liBG2 {
	background-color: #26BEC9;
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
/* 	width: 33%; */
/* 	float: right; */
/* 	border: 1px rgb(119, 94, 94) solid;  */
}

hr {
	text-align: right;
}

/* .d2 { */
/* 	padding-right: 100px; */
/* } */

.form-inline input {
	border-radius: 20px;
	display:flex;
}

.title-text span {
	display: block;
	position: relative;
	color: #0d2335;
	text-align: center;
	font-family: 'Noto Sans TC';

}

.title-text span:before, .title-text span:after {
	content: '';
	position: absolute;
	top: 50%;
	background: #8c8c8c;
	width: 33%;
	height: 3px;
}

.title-text span:before {
	left: 2%;
}

.title-text span:after {
	right: 2%;
}

.divborder {
 	margin-top: 35px; 
 	margin-bottom: 35px; 
}

.transition1:hover {
	transition-property: all;
	transition-duration: 0.3s;
	transition-delay: 0s;
	transition-timing-function: linear;
	border: 1px solid rgb(37, 37, 97);
}


/* .btnt1 { */
/* 	margin-right: 40px; */
/* } */

.divT1 {
/* 	border: 2px red solid;  */
	margin-top: 20px;
	margin-bottom: 10px;
	height: 850px;
	text-align: center;
}

.divT2 {
/*  border: 3px rgb(201, 92, 92) solid;   */
	margin-top: 40px;
	padding-top: 5px;
	text-align: center;
	display:flex;

}

.divT3 {
/* 	 border: 1px rgb(71, 28, 28) solid;  */
	background-size: contain;
	flex:0.5;
}

.divT4 {
/* 	border: 3px rgb(31, 4, 4) solid;  */
	text-align: center;
	flex:0.5;
	position:relative;

}

.divText {
/* 	border: 3px green solid;  */
	font-size:90%;
	font-family: 'Noto Sans TC';
	color: grey;
	width:160px; 
	position: absolute;
	bottom:0;
	right:0;
	padding-left:7px;
	
}

.divText:hover {
	transition-property: all;
	transition-duration: 0.3s;
	transition-delay: 0s;
	transition-timing-function: linear;
	color: rgb(17, 17, 63);
}

.divT31 {
/* border: 1px green solid; */
	margin: auto;
	width: 150px;
	height: 150px;
	margin-right:5px;
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
	<nav id="n1">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a class="nav-link nav-linkmy" href="#" >台灣</a>

				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA1" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/taipei1.jpg" --%>
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB1" href="#" class="a1 urlC1">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a  class="urlC2" href="#"><img id="navA2" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/taipei1.jpg" --%>
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB2" href="#" class="a1 urlC2">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA3" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/taipei3.jpg" --%>
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB3" href="#" class="a1 urlC3">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA4" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/taipei4.jpg" --%>
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB4" href="#" class="a1 urlC4">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
					</div>
					<hr class="hr1">
					<nav>
						<ul class="nav justify-content-center ">
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(148, 221, 255);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(126, 200, 250);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(50, 193, 250);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(53, 135, 243);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(89, 113, 253);"></i>
							</span>
							<li class="nav-item "><a class="nav-link nav-linkmy link1" href="#" name="台北">台北</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link2" href="#" name="台中">台中</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link3" href="#" name="台南">台南</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link4" href="#" name="高雄">高雄</a></li>
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(161, 253, 161);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(137, 252, 137);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(93, 250, 93);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(46, 252, 46);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(11, 253, 11);"></i>
							</span>
						</ul>
					</nav>


				</div></li>
			<li class="nav-item"><a class="nav-link nav-linkmy" href="#">日本</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA5" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/japan1.jpg" --%>
									alt="japan1">
							</div>
							<div class="div4">
								<a id="navB5" href="#" class="a1 urlC1">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC2" href="#"><img id="navA6" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/japan2.jpg" --%>
									alt="japan2">
							</div>
							<div class="div4">
								<a id="navB6" href="#" class="a1 urlC2">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA7" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/japan3.jpg" --%>
									alt="japan3">
							</div>
							<div class="div4">
								<a id="navB7" href="#" class="a1 urlC3">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="urlC4" class="div3">
								<a href="#"><img id="navA8" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/japan4.jpg" --%>
									alt="japan4">
							</div>
							<div class="div4">
								<a id="navB8" href="#" class="a1 urlC4">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
					</div>
					<hr class="hr1">
					<nav>
						<ul class="nav justify-content-center ">
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(247, 159, 235);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(240, 130, 225);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(252, 86, 230);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(250, 44, 222);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(247, 1, 214);"></i>
							</span>
							<li class="nav-item "><a class="nav-link nav-linkmy link5" href="#" name="東京">東京</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link6" href="#" name="大阪">大阪</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link7" href="#" name="沖繩">沖繩</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link8" href="#" name="北海道">北海道</a></li>
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(250, 216, 152);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(248, 204, 123);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(250, 196, 96);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(252, 180, 47);"></i> <i
								class="fas fa-shoe-prints " style="color: orange;"></i>
							</span>
						</ul>
					</nav>

				</div></li>
			<li class="nav-item"><a class="nav-link nav-linkmy" href="#">韓國</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA9" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/korea1.jpg" --%>
									alt="korea1">
							</div>
							<div class="div4">
								<a id="navB9" href="#" class="a1 urlC1">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC2" href="#"><img id="navA10" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/korea2.jpg" --%>
									alt="korea2">
							</div>
							<div class="div4">
								<a id="navB10" href="#" class="a1 urlC2" >尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA11" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/korea3.jpg" --%>
									alt="korea3">
							</div>
							<div class="div4">
								<a id="navB11" href="#" class="a1 urlC3">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA12" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/korea4.jpg" --%>
									alt="korea4">
							</div>
							<div class="div4">
								<a id="navB12" href="#" class="a1 urlC4 ">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
					</div>
					<hr class="hr1">
					<nav>
						<ul class="nav justify-content-center ">
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(247, 189, 187);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(248, 160, 157);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(255, 108, 103);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(255, 59, 52);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(252, 16, 8);"></i>
							</span>
							<li class="nav-item "><a class="nav-link nav-linkmy link9" href="#" name="首爾">首爾</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link10" href="#" name="釜山">釜山</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link11" href="#" name="大邱">大邱</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link12" href="#" name="濟州島">濟州島</a></li>
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(9, 163, 252);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(9, 163, 252);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(9, 163, 252);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(9, 163, 252);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(9, 163, 252);"></i>
							</span>
						</ul>
					</nav>

				</div></li>
			<li class="nav-item"><a class="nav-link nav-linkmy" href="#">美國</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA13" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/us1.jpg" --%>
									alt="us1">
							</div>
							<div class="div4">
								<a id="navB13" href="#" class="a1 urlC1">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a  class="urlC2" href="#"><img id="navA14" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/us2.jpg" --%>
									alt="us2">
							</div>
							<div class="div4">
								<a id="navB14" href="#" class="a1 urlC2">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA15" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/us3.jpg" --%>
									alt="us3">
							</div>
							<div class="div4">
								<a id="navB15" href="#" class="a1 urlC3">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA16" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/us4.jpg" --%>
									alt="us4">
							</div>
							<div class="div4">
								<a id="navB16" href="#" class="a1 urlC4">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
					</div>
					<hr class="hr1">
					<nav>
						<ul class="nav justify-content-center ">
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(96, 133, 108);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(84, 134, 101);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(54, 116, 74);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(27, 100, 51);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(1, 104, 36);"></i>
							</span>
							<li class="nav-item "><a class="nav-link nav-linkmy link13" href="#" name="紐約">紐約</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link14" href="#" name="洛杉磯">洛杉磯</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link15" href="#" name="舊金山">舊金山</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link16" href="#" name="邁阿密">邁阿密</a></li>
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(116, 178, 180);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(99, 174, 177);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(58, 166, 170);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(24, 198, 204);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(0, 171, 177);"></i>
							</span>
						</ul>
					</nav>
				</div></li>
			<li class="nav-item"><a class="nav-link nav-linkmy " href="#">德國</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA17" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/germany1.jpg" --%>
									alt="germany1">
							</div>
							<div class="div4">
								<a id="navB17" href="#" class="a1 urlC1">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC2" href="#"><img id="navA18" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/germany2.jpg" --%>
									alt="germany2">
							</div>
							<div class="div4">
								<a id="navB18" href="#" class="a1 urlC2">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA19" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/germany3.jpg" --%>
									alt="germany3">
							</div>
							<div class="div4">
								<a id="navB19" href="#" class="a1 urlC3">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA20" class="div3"
<%-- 									src="${pageContext.request.contextPath}/Images/Blog/germany4.jpg" --%>
									alt="germany4">
							</div>
							<div class="div4">
								<a id="navB20" href="#" class="a1 urlC4">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
							</div>
						</div>
					</div>
					<hr class="hr1">
					<nav>
						<ul class="nav justify-content-center ">
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(253, 150, 193);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(247, 127, 177);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(247, 70, 143);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(230, 41, 119);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(241, 12, 108);"></i>
							</span>
							<li class="nav-item "><a class="nav-link nav-linkmy link17" href="#" name="柏林">柏林</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link18" href="#" name="漢堡">漢堡</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link19" href="#" name="慕尼黑">慕尼黑</a></li>
							<li class="nav-item "><a class="nav-link nav-linkmy link20" href="#" name="法蘭克福">法蘭克福</a></li>
							<span> <i class="fas fa-shoe-prints"
								style="color: rgb(233, 133, 133);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(250, 117, 117);"></i> <i
								class="fas fa-shoe-prints fa-3x"
								style="color: rgb(243, 70, 70);"></i> <i
								class="fas fa-shoe-prints fa-2x"
								style="color: rgb(230, 32, 32);"></i> <i
								class="fas fa-shoe-prints " style="color: rgb(243, 9, 9);"></i>
							</span>
						</ul>
					</nav>
				</div></li>

		</ul>
	</nav>

<div class="container containerMY">
	<div id="d4">
		<article class="col-sm-8">
			<div class="hot">
				<div class="hot0 ">
					<button type="button" class="btn btn-info "><a class="a3" href="<c:url value="/Blog/BlogIndex.controller">
																			  <c:param name="page" value="1"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="new"/>
																			  </c:url>">最新文章</a></button>
				</div>
				<div class="hot1">
					<button type="button" class="btn btn-info "><a class="a3" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="1"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="hot"/>
																			  </c:url>">熱門文章</a></button>
				</div>

				<h5 class="title-text">
					<span><button id="changeKeyword" type="button" class="btn btn-info fa-2x hot2">
					<c:if test="${empty search}">台灣</c:if>
					<c:if test="${not empty search}">${search}</c:if>
					</span>
				</h5>
			</div>


			<div id="d5">
				<div class="divAS1">
					<div class="divHeight border01">
						<div>
							<a class="url1" href="#"> 
							<img id="changePic1" class="divAS11" alt="">
							</a>
						</div>		
						<div class="divAS12">
							<a id="changeNation1" href="#" class="a1 border1 distance">亞洲</a>
							<span class="a1 border1 distance">瀏覽次數(<span id="changeViews1">999</span>)</span> 
							<a id="changeCity1" href="#" class="a1 distance">台灣</a>
						</div>
						<div class="divAS13">
							<a id="changeTitle1" href="#" class="a1 url1">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
						</div>
						<div class="divAS14">
							<span id="changeDate1" class="border1 distance">2018-09-28</span>
							<span class="distance">by</span> 
							<a id="changeMember1" href="#" class="a1 ">Kobe</a>
						</div>
						<div class="divAS15">
							<a class="url1" href="#"><button type="button" class="btn btn-info a2">閱讀全文</button></a>
						</div>
					</div>
					
					
					<div class="divHeight border034">
						<div>
							<a class="url3" href="#"> <img id="changePic3" class="divAS11" alt="">
							</a>
						</div>
						<div class="divAS12">
							<a id="changeNation3" href="#" class="a1 border1 distance">亞洲</a>
							<span class="a1 border1 distance">瀏覽次數(<span
								id="changeViews3" href="#">999</span>)
							</span> <a id="changeCity3" href="#" class="a1 distance">台灣</a>
						</div>
						<div class="divAS13">
							<a id="changeTitle3" href="#" class="a1 url3">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
						</div>
						<div class="divAS14">
							<span id="changeDate3" class="border1 distance">2018-09-28</span>
							<span class="distance">by</span> <span id="changeMember3" class="a1 ">Kobe</span>
						</div>
						<div class="divAS15">
							<a class="url3" href="#"><button type="button" class="btn btn-info a2">閱讀全文</button></a>
						</div>
					</div>
					
					<div class="divHeight border05">
						<div>
							<a class="url5" href="#"> <img id="changePic5" class="divAS11" alt="">
							</a>
						</div>
						<div class="divAS12">
							<a id="changeNation5" href="#" class="a1 border1 distance">亞洲</a>
							<span class="a1 border1 distance">瀏覽次數(<span
								id="changeViews5" href="#">999</span>)
							</span> <a id="changeCity5" href="#" class="a1 distance">台灣</a>
						</div>
						<div class="divAS13">
							<a id="changeTitle5" href="#" class="a1 url5">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
						</div>
						<div class="divAS14">
							<span id="changeDate5" class="border1 distance">2018-09-28</span>
							<span class="distance">by</span> <a id="changeMember5" href="#"
								class="a1 ">Kobe</a>
						</div>
						<div class="divAS15">
							<a class="url5" href="#"><button type="button" class="btn btn-info a2">閱讀全文</button></a>
						</div>
					</div>
				</div>
				<div class="divAS2">
					<div class="divHeight border02">
						<div>
							<a class="url2" href="#"> <img id="changePic2" class="divAS11" alt="">
							</a>
						</div>
						<div class="divAS12">
							<a id="changeNation2" href="#" class="a1 border1 distance">亞洲</a>
							<span class="a1 border1 distance">瀏覽次數(<span
								id="changeViews2" href="#">999</span>)
							</span> <a id="changeCity2" href="#" class="a1 distance">台灣</a>
						</div>
						<div class="divAS13">
							<a id="changeTitle2" href="#" class="a1 url2">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
						</div>
						<div class="divAS14">
							<span id="changeDate2" class="border1 distance">2018-09-28</span>
							<span class="distance">by</span> <a id="changeMember2" href="#"
								class="a1 ">Kobe</a>
						</div>
						<div class="divAS15">
							<a class="url2" href="#"><button type="button" class="btn btn-info a2">閱讀全文</button></a>
						</div>
					</div>
					<div class="divHeight border034">
						<div>
							<a class="url4" href="#"> <img id="changePic4" class="divAS11"alt="">
							</a>
						</div>
						<div class="divAS12">
							<a id="changeNation4" href="#" class="a1 border1 distance">亞洲</a>
							<span class="a1 border1 distance">瀏覽次數(<span
								id="changeViews4" href="#">999</span>)
							</span> <a id="changeCity4" href="#" class="a1 distance">台灣</a>
						</div>
						<div class="divAS13">
							<a id="changeTitle4" href="#" class="a1 url4">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
						</div>
						<div class="divAS14">
							<span id="changeDate4" class="border1 distance">2018-09-28</span>
							<span class="distance">by</span> <a id="changeMember4" href="#"
								class="a1 ">Kobe</a>
						</div>
						<div class="divAS15">
							<a class="url4" href="#"><button type="button" class="btn btn-info a2">閱讀全文</button></a>
						</div>
					</div>
					
					<div class="divHeight border06">
						<div>
							<a class="url6" href="#"> <img id="changePic6" class="divAS11" alt="">
							</a>
						</div>
						<div class="divAS12">
							<a id="changeNation6" href="#" class="a1 border1 distance">亞洲</a>
							<span class="a1 border1 distance">瀏覽次數(<span
								id="changeViews6" href="#">999</span>)
							</span> <a id="changeCity6" href="#" class="a1 distance">台灣</a>
						</div>
						<div class="divAS13">
							<a id="changeTitle6" href="#" class="a1 url6">尚未有相關的網誌，<br>歡迎您分享旅遊經驗。</a>
						</div>
						<div class="divAS14">
							<span id="changeDate6" class="border1 distance">2018-09-28</span>
							<span class="distance">by</span> <a id="changeMember6" href="#"
								class="a1 ">Kobe</a>
						</div>
						<div class="divAS15">
							<a class="url6" href="#"><button type="button" class="btn btn-info a2">閱讀全文</button></a>
						</div>
					</div>
				</div>
			</div>

			<div class="divAS16">
				<nav aria-label="Page navigation example ">
					<ul class="pagination justify-content-center pagination-lg">
						<li class="page-item" id="page0"><a  class="page-link liBG2" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="replaced"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
								<span class="sr-only ">Previous</span>
						</a></li>
						<li class="page-item" id="page1"><a class="page-link liBG" href="<c:url value="/Blog/BlogIndex.controller">
    																		   <c:param name="page" value="1"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>">1</a></li>
						<li class="page-item" id="page2"><a class="page-link liBG" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="2"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>">2</a></li>
						<li class="page-item"id="page3"><a class="page-link liBG" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="3"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>">3</a></li>
						<li class="page-item" id="page4"><a class="page-link liBG" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="4"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>">4</a></li>
						<li class="page-item " id="page5"><a class="page-link liBG" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="5"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>">5</a></li>
						<li class="page-item" id="page6"><a   tabindex="-1" class="page-link liBG2" href="<c:url value="/Blog/BlogIndex.controller">
    																		  <c:param name="page" value="replaced"/>
    																		  <c:param name="search" value="${search}"/>
    																		  <c:param name="newhot" value="${newhot}"/>
																			  </c:url>"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span> <span
								class="sr-only ">Next</span>
						</a></li>
					</ul>
				</nav>
			</div>
		</article>
		<aside class="col-sm-4">
			<div class="d2">
				<div class="title">
					<h5 class="title-text">
						<span><input type="button" value="搜尋" id="buttonFade0"
							class="btn btn-info"></span>
					</h5>

					<div id="toggle0">
						<div class="divborder">
							<div>
									<form class="form-inline" method="get"
										action="<c:url value="/Blog/BlogIndex.controller"/>">
										<input id="keyword" maxlength="6"  name="search" class="form-control mr-sm-2 transition1 " type="search"
											placeholder="國家，城市及關鍵字" aria-label="Search" required>
										<button id="keyword1" class="btn btn-outline-success my-2 my-sm-0 btnt1 "
											type="submit">Search</button>
									</form>
							</div>
						</div>
					</div>
				</div>

				<div class="title">
					<h5 class="title-text">
						<span><input type="button" value="最新文章" id="buttonFade1"
							class="btn btn-info"></span>
					</h5>
				</div>
				<div id="toggle1">
					<div class="divT1">

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlA1" href="#"> <img id="changeAsidePicDate1" class="divT31"
<%-- 										src="${pageContext.request.contextPath}/Images/Blog/asideP1.jpg" --%>
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitleDate1" href="#" class="a1 urlA1"></a>
								<div id="changeAsideViewsDate1" class="divText">2018-8-8</div>
							</div>
						</div>

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlA2" href="#"> <img id="changeAsidePicDate2" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP2.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitleDate2" href="#" class="a1 urlA2"></a>
								<div id="changeAsideViewsDate2" class="divText">2018-8-8</div>
							</div>
						</div>

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlA3" href="#"> <img id="changeAsidePicDate3" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP3.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitleDate3" href="#" class="a1 urlA3"></a>
								<div id="changeAsideViewsDate3" class="divText">2018-8-8</div>
							</div>
						</div>

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlA4" href="#"> <img id="changeAsidePicDate4" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP4.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
							
								<a id="changeAsideTitleDate4" href="#" class="a1 urlA4"></a>
								<div id="changeAsideViewsDate4" class="divText">2018-8-8</div>
							</div>
						</div>
					</div>
				</div>


				<div class="title">
					<h5 class="title-text">
						<span><input type="button" value="熱門文章" id="buttonFade2"
							class="btn btn-info"></span>
					</h5>
				</div>
				<div id="toggle2">
					<div class="divT1">

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlB1" href="#"> <img id="changeAsidePic1" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP1.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitle1" href="#" class="a1 urlB1"></a>
								<span class="divText a1">瀏覽次數(<span	id="changeAsideViews1">999</span>)
							</div>
						</div>

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlB2" href="#"> <img id="changeAsidePic2" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP2.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitle2" href="#" class="a1 urlB2"></a>
								<span class="divText a1">瀏覽次數(<span	id="changeAsideViews2">999</span>)
							</div>
						</div>

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlB3" href="#"> <img id="changeAsidePic3" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP3.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitle3" href="#" class="a1 urlB3"></a>
								<span class="divText a1">瀏覽次數(<span	id="changeAsideViews3">999</span>)
							</div>
						</div>

						<div class="divT2">
							<div class="divT3">
								<div class="divT31">
									<a class="urlB4" href="#"> <img id="changeAsidePic4" class="divT31"
										src="${pageContext.request.contextPath}/Images/Blog/asideP4.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a  id="changeAsideTitle4" href="#" class="a1 urlB4"></a>
								<span class="divText a1">瀏覽次數(<span	id="changeAsideViews4">999</span>)
							</div>
						</div>
					</div>
				</div>
			</div>

		</aside>

		<i id="top1" class="fas fa-chevron-circle-up fa-2x btn btn-info"></i>

	</div>
	</div>
		
	<script>
		$(document).ready(function() {
							//NAV 	
							
							var member = "${user.memberID}"; 
// 							alert('member= ' +  member);
							
							var nav = ["台北","台中","台南","高雄","東京","大阪","沖繩","北海道","首爾","釜山","大邱","濟州島","紐約","洛杉磯","舊金山","邁阿密","柏林","漢堡","慕尼黑","法蘭克福"]; 
							var path2 = "<c:url value='/Blog/BlogIndex.controller'><c:param name='search' value=""/></c:url>"; 
							var path = "<c:url value='/Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
							 $.getJSON('${pageContext.request.contextPath}/Blog/BlogIndexNav.controller',function(jsonNav){
// 								 		alert(JSON.stringify(jsonNav));
									 $.each(jsonNav,function(idx,navProduct){
// 										 alert(idx+"====="+navProduct.blogTitle);
										 for(var i = 1;i<=20;i++){
										 if(navProduct.blogCity==nav[i-1]){
											    $('.urlC'+(i)).attr("href",path+navProduct.blogSNum);
												$('#navA'+(i)).attr("src","data:image/png;base64,"+navProduct.blogCover);
												$('#navB'+(i)).html(navProduct.blogTitle);
												$('.link'+(i)).attr("href",path2+navProduct.blogCity);
										 }
										 }
										
									 });
								 });

							//Change 6FORM
							if ('${result}' != "") {
// 								alert('${result}');
								var path3 = "<c:url value='/ProfilePageGet'><c:param name='memberID' value=""/></c:url>";
								var path2 = "<c:url value='/Blog/BlogIndex.controller'><c:param name='search' value=""/></c:url>"; 
								var path = "<c:url value='/Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
// 								 alert(path);
								//FIRST
								<c:forEach var="i" begin="0" end="5" step="1">
// 								alert('${result[i][0].blogSNum}');
								 $('.url${i+1}').attr("href",path+"${result[i][0].blogSNum}");
								 $('.urlA${i+1}').attr("href",path+"${result[i][0].blogSNum}");
								 $('.urlB${i+1}').attr("href",path+"${result[i][0].blogSNum}");
						         $('#changePic${i+1}').attr("src","data:image/png;base64,${result[i][0].blogCoverToBase64}");
						         $('#changeNation${i+1}').html('${result[i][1].nation}').attr("href",path2+"${result[i][1].nation}");
						         $('#changeViews${i+1}').html('${result[i][0].blogView}');
						         $('#changeCity${i+1}').html('${result[i][0].blogCity}').attr("href",path2+"${result[i][0].blogCity}");
						         $('#changeTitle${i+1}').html('${result[i][0].blogTitle}');
						         $('#changeDate${i+1}').html('${result[i][0].updateTime}'.substring(0, 10));
						         $('#changeMember${i+1}').html('${result[i][2].memberNickName}').attr("href",path3+"${result[i][0].memberID}"+"&lmi="+"${user.memberID}"+"&page=main");
						         
						        </c:forEach>
								
						        <c:forEach var="i" begin="0" end="3" step="1">
// 						         $('.url${i+1}').attr("href",path+"${result2[i][0].blogSNum}");
// 						         $('.urlA${i+1}').attr("href",path+"${result2[i][0].blogSNum}");
								 $('.urlB${i+1}').attr("href",path+"${result2[i][0].blogSNum}");
						         $('#changeAsidePic${i+1}').attr("src","data:image/png;base64,${result2[i][0].blogCoverToBase64}");
						         $('#changeAsideTitle${i+1}').html('${result2[i][0].blogTitle}');
						         $('#changeAsideViews${i+1}').html('${result2[i][0].blogView}');
						         </c:forEach>
						        
						         <c:forEach var="i" begin="0" end="3" step="1">
// 						         $('.url${i+1}').attr("href",path+"${result3[i][0].blogSNum}");
						         $('.urlA${i+1}').attr("href",path+"${result3[i][0].blogSNum}");
// 								 $('.urlB${i+1}').attr("href",path+"${result3[i][0].blogSNum}");
						         $('#changeAsidePicDate${i+1}').attr("src","data:image/png;base64,${result3[i][0].blogCoverToBase64}");
						         $('#changeAsideTitleDate${i+1}').html('${result3[i][0].blogTitle}');
						         $('#changeAsideViewsDate${i+1}').html('${result3[i][0].updateTime}'.substring(0, 10));
						         </c:forEach>
						        
}
							else if ('${result}' == ""){
								
								 $.getJSON('${pageContext.request.contextPath}/Blog/BlogIndexFirstOnload2.controller',function(json){
									 
									 var path = "<c:url value='/Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
// 										alert(path);
									 var path2 = "<c:url value='/Blog/BlogIndex.controller'><c:param name='search' value=""/></c:url>"; 
									 var path3 = "<c:url value='/ProfilePageGet'><c:param name='memberID' value=""/></c:url>";
									 $.each(json,function(i,product){
// 										 alert(product[0].blogSNum);    .attr("href",path2+"${result[i][0].blogCity}");
										if(i < 6){
										$('.url'+(i+1)).attr("href",path+product[0].blogSNum);
// 										$('.urlA'+(i+1)).attr("href",path+product[0].blogSNum);
// 										$('.urlB'+(i+1)).attr("href",path+product[0].blogSNum);
										$('#changePic'+(i+1)).attr("href",path+product[0].blogSNum).attr("src","data:image/png;base64,"+product[0].blogCover);
										$('#changeNation'+(i+1)).html(product[1].nation).attr("href",path2+product[1].nation);
										$('#changeViews'+(i+1)).html(product[0].blogView);
										$('#changeCity'+(i+1)).html(product[0].blogCity).attr("href",path2+product[0].blogCity);
										$('#changeTitle'+(i+1)).html(product[0].blogTitle);
										$('#changeDate'+(i+1)).html(new Date(product[0].updateTime).toISOString().split('T')[0]);
										$('#changeMember'+(i+1)).html(product[2].memberNickName).attr("href",path3+product[0].memberID+"&lmi="+"${user.memberID}"+"&page=main");
										}
// 										aside
										if(i >= 6 && i<10){
// 											$('.url'+((i+1)-6)).attr("href",path+product[0].blogSNum);
											$('.urlA'+((i+1)-6)).attr("href",path+product[0].blogSNum);
// 											$('.urlB'+((i+1)-6)).attr("href",path+product[0].blogSNum);
											$("#changeAsidePicDate"+((i+1)-6)).attr("src","data:image/png;base64,"+product[0].blogCover);
											$("#changeAsideTitleDate"+((i+1)-6)).html(product[0].blogTitle);
											$("#changeAsideViewsDate"+((i+1)-6)).html(new Date(product[0].updateTime).toISOString().split('T')[0]);
											}
									
										if(i >= 10){
// 										$('.url'+((i+1)-10)).attr("href",path+product[0].blogSNum);
// 										$('.urlA'+((i+1)-10)).attr("href",path+product[0].blogSNum);
										$('.urlB'+((i+1)-10)).attr("href",path+product[0].blogSNum);
										$("#changeAsidePic"+((i+1)-10)).attr("src","data:image/png;base64,"+product[0].blogCover);
										$("#changeAsideTitle"+((i+1)-10)).html(product[0].blogTitle);
										$("#changeAsideViews"+((i+1)-10)).html(product[0].blogView);
										}
										
									 });
								 });
							
							}
		})
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
					          var page = 1;
					          var search = "";
					       if(url.indexOf('?')!=-1){      
					           var temp = url.split('?')[1].split('&')[0].substring(5);
					           if(parseInt(temp)){
					            page=parseInt(temp);
					           }
					       }
					       
					          if(page==1){
					           $('#page0').addClass('disabled');$('#page1').addClass('disabled');
					          }else if(page==5){
					           $('#page6').addClass('disabled');
					          }
					          $('#page'+page).addClass('disabled');
					          var tempPrev = $('#page0>a');
					          var newTempPrev = tempPrev.attr('href').replace("replaced", (page-1));
					          tempPrev.attr('href',newTempPrev);
					          var tempNext = $('#page6>a');
					          var newTempNext = tempNext.attr('href').replace("replaced", (page+1));
					          tempNext.attr('href',newTempNext);

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
<!-- 	</div> -->
</body>
</html>