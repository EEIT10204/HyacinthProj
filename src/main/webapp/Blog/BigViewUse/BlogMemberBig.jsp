<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="zh-tw">

<head>
<%-- <jsp:include page="../Index/NewHeader.jsp" /> --%>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>page1</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/jumbotron.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.3.1/css/all.css" integrity="sha384-mzrmE5qonljUremFsqc01SB46JvROS7bZs3IO2EmfFsd15uHvIt+Y8vEf7N7fWAU" crossorigin="anonymous">
<!-- <link href="https://cdn.bootcss.com/bootstrap/4.1.0/css/bootstrap.min.css" rel="stylesheet"> -->
<!-- <link href="http://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet"> -->
<script src="http://www.jq22.com/jquery/jquery-1.10.2.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/js/jquery.rating-stars.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.0.0/sweetalert2.all.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script>
<%-- 	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
	
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
img{
border-radius: 10px;
}

/* star */
		#changeKeyword{
			border-radius: 50%;
			margin-top:5px;
		}
 		.rating-stars {
/*  			border: 1px solid red; */
            width: 80%;
            text-align: center;
        }

        .rating-stars .rating-stars-container {
            font-size: 0px;
        }

        .rating-stars .rating-stars-container .rating-star {
            display: inline-block;
            font-size: 60px;
            color: #555555;
            cursor: pointer;
            padding: 5px 10px;
        }

        .rating-stars .rating-stars-container .rating-star.is--active,
        .rating-stars .rating-stars-container .rating-star.is--hover {
            color: #f1c40f;
        }

        .rating-stars .rating-stars-container .rating-star.is--no-hover {
            color: #555555;
        }
        .rating-stars-container{
            display: inline-block;
        }
        #rating-stars-value {
        font-family: 'Noto Sans TC'; 
        color: rgb(0, 86, 92);
        padding:5px 15px; 
        background:#ccc; 
        border:0 none;
        cursor:pointer;
        -webkit-border-radius: 5px;
        border-radius: 5px; 
        width:170px;
        }
/* ALL */
		a {
		    text-decoration:none;
		}
		.a3 {
		 	font-family: 'Noto Sans TC'; 
		 	color: rgb(0, 86, 92);
		 	text-decoration:none;
		 	font-size: 200%;
		}
		.a3:hover {
			transition-property: all;
			transition-duration: 0.8s;
			transition-delay: 0s;
			transition-timing-function: linear;
			color: rgb(0, 206, 221);
		}
		.a11 {
            font-family: 'Noto Sans TC';
            color: rgb(51, 7, 7);
            font-size: 110%;
        }
		.a1 {
            font-family: 'Noto Sans TC';
            color: rgb(51, 7, 7);
            font-size: 110%;
        }
		#likebutton {
            font-family: 'Noto Sans TC';
            color: white;
            font-size: 110%;
        }
        .a1:hover {
            transition-property: all;
            transition-duration: 0.8s;
            transition-delay: 0s;
            transition-timing-function: linear;
            color: rgb(13, 145, 155);
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

article {
	/* border: 1px red solid; */
	width: 65%;
	float: left;
}

 .divblog20 {
/*              border: 1px solid red; */
            overflow: auto;
        }

        .divblog21 {
/*              border: 1px solid red;  */
            display: inline-block;
            margin-top: 0px;
            margin-left: 10px;
            margin-right: 2px;
            float: left;
        }

        .divblog210 {
/*        border: 1px solid rgb(146, 58, 58);  */
            border-radius: 50%;
            width: 120px;
        }

        .divblog22 {
/*         border: 3px solid rgb(146, 58, 58); */
/*             width: 85%; */
            /* float: right;
            margin-top: 10px;
            margin-right: 5px;
            overflow:auto; */
            display:flex;
        	align-items: center;
            
        }

        .divblog220 {
/*             border: 1px solid red; */
            font-size: 120%;
            display: inline-block;
            width: 100px;
            height: 40px;
            text-align: center;
        }

        .divblog221 {
/*              border: 3px solid rgb(0, 179, 149); */
/*             display: inline-block; */
/*             height: 40px; */
        }
        
         .divblog22111{
           width: 150px;
			text-align: center;
			font-family: 'Noto Sans TC';
            color: white;
            font-size: 110%;
            background-color: #0d2335;
            border-radius: 10px;
			border-top-right-radius: 100px;
			border-bottom-left-radius: 100px;
        }
		.divblog2222{margin-left:auto}
		
        .divblog222 {
/*             border: 1px solid red; */
/*             display: inline-block; */
            padding-left:5px;
            position: relative;
            top: 2px;
            
            /* width: 90px; */
            /* height: 40px; */
        }

        .divblog2202 {
            /* padding-top: 10px;
            padding-bottom: 0px; */
        }

        .divblog223 {
/*             border: 1px solid red;  */
/*             display: inline-block; */
            	width: 750px;
            	float:right;
            	padding-left:100px;
/*             margin: auto; */
/*             text-align: center; */
        }
        .divblog22333 {
/*             border: 1px solid red;  */
/*             display: inline-block; */
            width: 550px;
            float:right;
            margin-top: 10px;
            margin-right: 100px;
            text-align: center;
			font-family: 'Noto Sans TC';
            color: white;
            font-size: 350%;
            background-color: #0d2335;
            opacity: 0.8;
            border-radius: 100px;
			border-top-right-radius: 10px;
			border-bottom-left-radius: 10px;
        }

        .pp {
            font-size: 100%;
            display: inline-block;
        }

        .x {
            width: 100px;
            -webkit-filter: grayscale(1)
        }

        .y {
            width: 100px;
            -webkit-filter: grayscale(0)
        }

        .divblog23 {
            border: 1px solid red;
        }

        .divAS11 {
            text-align: center; 
            margin: auto;
            margin-top: 5px;
            margin-bottom:15px;
            width: 800px;
        }
        .divAS11 img{
            width: 600px;
            height:400px;
            margin: auto;
            border: 5px solid rgb(0, 179, 149);
        }

        .divAS1 {
        	
            border: 15px inset rgb(0, 179, 149);
            width: 95%;
            margin:auto;
        }

        .divAS12 {
            margin: auto;
            margin-top: 5px;
            width: 900px;
            text-align: center;
            font-size: 80%;
        }

        .distance {
            padding-right: 15px;
            padding-left: 10px;
        }

        .border1 {
/*             border-right: 1px solid grey; */
            padding-right: 15px;
            padding-left: 10px;
        }

        .divAS13 {
            margin-top: 5px;
            width: 900px;
            text-align: center;
            font-size: 120%;
            margin: auto;   
        }

        .divAS14 {
            margin-top: 15px;
            margin-bottom: 15px;
            width: 900px;
            text-align: center;
            font-size: 80%;
            margin: auto; 
        }

        .divAS15 {
            width: 900px;
            text-align: center;
            font-size: 120%;
            margin: auto;
        }
        
       	#changeCityContent img{
        max-width:600px;
        }
        .comment {
            border: 10px rgb(0, 160, 54) solid;
            width: 800px;
            margin: auto;
            margin-top: 10px;
            margin-bottom: 100px;
            padding-top: 10px;
        }

        .comment h1 {
/*             border: 1px rgb(152, 29, 163) solid; */
            text-align: center;
        }

        .comment2 {
/*             border: 1px solid red; */
            margin: auto;
            text-align: center;
        }

        .comment1 {
            display: none;
            margin: auto;
            text-align: center;
        }

        .comment1 h3 {
            padding-left: 40px;
            text-align: left;
        }

        .comment3 {
            display: none;
            /* margin: auto; */
            text-align: right;
            padding-right: 15px;
        }

        .comment00 {
/*             border: 3px rgb(255, 0, 212) dashed; */
            overflow: auto;
            margin-bottom: 10px;
        }

        .comment01 {
/*             border: 1px solid red; */
            display: inline-block;
            margin-top: 10px;
            margin-left: 10px;
            float: left;
        }

        .comment011 {
/*             border: 1px solid rgb(146, 58, 58); */
            border-radius: 50%;
            width: 120px;
        }

        .comment02 {
/*             border: 1px solid red; */
            display: inline-block;
            width: 80%;
            float: right;
            margin-top: 10px;
            margin-right: 5px;
            overflow: auto;
        }

        .comment020 {
/*             border: 1px solid red; */
        }

        .comment021 {
/*             border: 1px solid red; */
            display: inline-block;
            width: 250px;
            margin: auto;
        }

        .comment021 img {
/*             border: 1px solid red; */
            width: 40px;
        }

        .divblog229 {
/*             border: 1px solid red; */
            display: inline-block;
            width: 80%;
            float: right;
            margin-top: 10px;
            margin-right: 5px;

            /* overflow:auto; */
        }

        .divblog2230 {
/*             display: inline-block; */
            /* padding-top: 8px; */
            padding-left: 5px; 
            padding-right: 5px; 
            position: relative;
            top: -8px;
        }
        
        .divblog22300 {
            padding-left: 5px; 
            padding-right: 5px; 
            position: relative;
            top: -1px;
            color:red;
        }
        

        .divblog2209 {
/*             border: 1px solid red; */
            font-size: 120%;
            display: inline-block;
            width: 100px;
            height: 40px;
            text-align: center;
        }

        .divblog2239 {
/*             border: 1px solid red; */
            display: inline-block;
            margin-left: auto;
        }

        .divblog2239 img {
/*             border: 1px solid red; */
            width: 40px;
        }

        .divblog239 {
/*             border: 1px solid red; */
            font-size: 110%;
        }

        .XXXXX {
            margin: auto;
/*             border: 3px solid rgb(39, 228, 22); */
            overflow: auto;
            margin-top: 10px;
            margin-bottom: 10px;
        }

        .login1 {
            margin-top: 10px;
            margin-bottom: 10px;
            font-size: 180%;
        }

        .borderA {
            border: 15px outset rgb(0, 179, 149);
            overflow: auto;
            margin: auto;
            width: 95%;
            margin-bottom: 10px;
            padding-bottom: 10px;
            padding-top: 10px;
        }
        .input-group-prepend{
            display: inline-block;
        }
        .borderB{
/*             border: 1px solid blue; */
            /* display: inline-block; */
            /* float: right; */
            padding-right: 20px;
            margin-left: auto;
        }
        .comment000{
            display:flex;
        align-items: center;
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
	padding-right: 100px;
}

.form-inline input {
	border-radius: 20px;
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
	width: 35%;
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

.edit{
 position: relative;
        top: 7px;
}
.edit:hover {
	opacity: 0.5;
}
.edit1 {
	size:3x
}
.edit1:hover {
	opacity: 0.5;
}
</style>
</head>

<body>

	<nav id="n1">
		<ul class="nav justify-content-center">
			<li class="nav-item"><a  class="nav-link" href="#" >台灣</a>

				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA1" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/taipei1.jpg"
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB1" href="#" class="a1 urlC1">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a  class="urlC2" href="#"><img id="navA2" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/taipei1.jpg"
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB2" href="#" class="a1 urlC2">親子旅遊週末就出發！特色親子行程、住宿，看這篇就對了！</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA3" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/taipei3.jpg"
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB3" href="#" class="a1 urlC3">不一樣的台北之旅 台北公共單車一日遊攻略</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA4" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/taipei4.jpg"
									alt="taipei1"></a>
							</div>
							<div class="div4">
								<a id="navB4" href="#" class="a1 urlC4">【台灣】台北實用基本資訊，交通、必去、WIFI、電壓、旅遊須知一次搞定</a>
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
							<li class="nav-item "><a class="nav-link link1" href="#" name="台北">台北</a></li>
							<li class="nav-item "><a class="nav-link link2" href="#" name="台中">台中</a></li>
							<li class="nav-item "><a class="nav-link link3" href="#" name="台南">台南</a></li>
							<li class="nav-item "><a class="nav-link link4" href="#" name="高雄">高雄</a></li>
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
			<li class="nav-item"><a class="nav-link" href="#">日本</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA5" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/japan1.jpg"
									alt="japan1">
							</div>
							<div class="div4">
								<a id="navB5" href="#" class="a1 urlC1"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC2" href="#"><img id="navA6" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/japan2.jpg"
									alt="japan2">
							</div>
							<div class="div4">
								<a id="navB6" href="#" class="a1 urlC2"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA7" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/japan3.jpg"
									alt="japan3">
							</div>
							<div class="div4">
								<a id="navB7" href="#" class="a1 urlC3"></a>
							</div>
						</div>
						<div class="div2">
							<div class="urlC4" class="div3">
								<a href="#"><img id="navA8" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/japan4.jpg"
									alt="japan4">
							</div>
							<div class="div4">
								<a id="navB8" href="#" class="a1 urlC4"></a>
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
							<li class="nav-item "><a class="nav-link link5" href="#" name="東京">東京</a></li>
							<li class="nav-item "><a class="nav-link link6" href="#" name="大阪">大阪</a></li>
							<li class="nav-item "><a class="nav-link link7" href="#" name="沖繩">沖繩</a></li>
							<li class="nav-item "><a class="nav-link link8" href="#" name="北海道">北海道</a></li>
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
			<li class="nav-item"><a class="nav-link" href="#">韓國</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA9" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/korea1.jpg"
									alt="korea1">
							</div>
							<div class="div4">
								<a id="navB9" href="#" class="a1 urlC1"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC2" href="#"><img id="navA10" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/korea2.jpg"
									alt="korea2">
							</div>
							<div class="div4">
								<a id="navB10" href="#" class="a1 urlC2" ></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA11" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/korea3.jpg"
									alt="korea3">
							</div>
							<div class="div4">
								<a id="navB11" href="#" class="a1 urlC3"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA12" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/korea4.jpg"
									alt="korea4">
							</div>
							<div class="div4">
								<a id="navB12" href="#" class="a1 urlC4 "></a>
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
							<li class="nav-item "><a class="nav-link link9" href="#" name="首爾">首爾</a></li>
							<li class="nav-item "><a class="nav-link link10" href="#" name="釜山">釜山</a></li>
							<li class="nav-item "><a class="nav-link link11" href="#" name="大邱">大邱</a></li>
							<li class="nav-item "><a class="nav-link link12" href="#" name="濟州島">濟州島</a></li>
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
			<li class="nav-item"><a class="nav-link" href="#">美國</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA13" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/us1.jpg"
									alt="us1">
							</div>
							<div class="div4">
								<a id="navB13" href="#" class="a1 urlC1"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a  class="urlC2" href="#"><img id="navA14" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/us2.jpg"
									alt="us2">
							</div>
							<div class="div4">
								<a id="navB14" href="#" class="a1 urlC2"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA15" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/us3.jpg"
									alt="us3">
							</div>
							<div class="div4">
								<a id="navB15" href="#" class="a1 urlC3"></a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA16" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/us4.jpg"
									alt="us4">
							</div>
							<div class="div4">
								<a id="navB16" href="#" class="a1 urlC4"></a>
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
							<li class="nav-item "><a class="nav-link link13" href="#" name="紐約">紐約</a></li>
							<li class="nav-item "><a class="nav-link link14" href="#" name="洛杉磯">洛杉磯</a></li>
							<li class="nav-item "><a class="nav-link link15" href="#" name="舊金山">舊金山</a></li>
							<li class="nav-item "><a class="nav-link link16" href="#" name="邁阿密">邁阿密</a></li>
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
			<li class="nav-item"><a class="nav-link " href="#">德國</a>
				<div class="x2">
					<div class="div1">
						<div class="div2">
							<div class="div3">
								<a class="urlC1" href="#"><img id="navA17" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/germany1.jpg"
									alt="germany1">
							</div>
							<div class="div4">
								<a id="navB17" href="#" class="a1 url1">【德國】迪士尼城堡的原型！慕尼黑郊區必去新天鵝堡攻略：交通、周邊景點整理推薦</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="url2" href="#"><img id="navA18" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/germany2.jpg"
									alt="germany2">
							</div>
							<div class="div4">
								<a id="navB18" href="#" class="a1 urlC2">【德國】慕尼黑自由行全攻略，啤酒節、新天鵝堡、國王湖，四天三夜行程安排、交通、景點整理</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC3" href="#"><img id="navA19" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/germany3.jpg"
									alt="germany3">
							</div>
							<div class="div4">
								<a id="navB19" href="#" class="a1 urlC3">【愛爾蘭】都柏林購物指南，必逛平價超市、特色市集、獨立書店整理</a>
							</div>
						</div>
						<div class="div2">
							<div class="div3">
								<a class="urlC4" href="#"><img id="navA20" class="div3"
									src="${pageContext.request.contextPath}/Images/Blog/germany4.jpg"
									alt="germany4">
							</div>
							<div class="div4">
								<a id="navB20" href="#" class="a1 urlC4">【法國】巴黎藝術之旅，教你怎麼參觀三大美術館：羅浮宮、奧塞美術館、龐畢度藝術中心（附上票券整理和鎮店之寶）</a>
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
							<li class="nav-item "><a class="nav-link link17" href="#" name="柏林">柏林</a></li>
							<li class="nav-item "><a class="nav-link link18" href="#" name="漢堡">漢堡</a></li>
							<li class="nav-item "><a class="nav-link link19" href="#" name="慕尼黑">慕尼黑</a></li>
							<li class="nav-item "><a class="nav-link link20" href="#" name="法蘭克福">法蘭克福</a></li>
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


	<div id="d4">
		<article>
		
				<h5 class="title-text">
					<span><button id="changeKeyword" type="button" class="btn btn-info fa-2x hot2">
					Blog
					</span>
				</h5>
		
			  <div class="divblog20">
            <div class="borderA">
                <div class="divblog21">
                    <a href="#">
                        <img id="changeMemberPic" class="divblog210" src="${pageContext.request.contextPath}/Images/Blog/member1.jpg" alt="member">
                    </a>
                </div>

                <div class="divblog22">
                    <div class="divblog220">
                        <a id="changeMemberName" class="divblog2200 a1" href="#">Kobe</a>
                    </div>

                    
					<div class="divblog22111" style="display:none" id="hidelike2">
                       	 登入即可收藏
                    </div>
                    <div class="divblog221" id="hidelike1">
                        <a id="likeA" href="#"><button id="likebutton" type="button" class="btn btn-secondary divblog2201 ">未收藏</button></a> 
                        <span class="a11">總收藏數(<a><span class="a11" id="likepoint"></span></a>)</span>
                    </div>
                    
                   
                    
<!--                     <div class="borderB"> -->
                    <div class="input-group-prepend divblog2222">
                            <label class="input-group-text a1" name="blogNation">分享</label>
                    </div>
                    <div class="divblog222">
                        <!-- <iframe class="divblog2202" src="https://www.facebook.com/plugins/share_button.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&layout=button&size=large&mobile_iframe=false&width=65&height=28&appId" width="65" height="28" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true" allow="encrypted-media"></iframe> -->
                        <div class="addthis_inline_share_toolbox"></div>
                    </div>

					

					
					<div class="input-group-prepend hiddeninfo1">
                            <label class="input-group-text a1" name="blogNation">檢舉</label>
                    </div>
                    <div class="divblog2230 hiddeninfo1">
							<a id="" href="#">
							<i class="edit fas fa-bug fa-3x" style="color:green"></i>
<!-- 							<i class="edit fas fa-pen-square fa-3x" ></i> -->
                            </a>
                    </div>
                    
                    
					
                    <div class="input-group-prepend hiddeninfo2">
                            <label class="input-group-text a1" name="blogNation">編輯</label>
                    </div>
                    <div class="divblog2230 hiddeninfo2">
							<a id="blogUpdate" href="#">
							<i class="edit fas fa-pen-square fa-3x" ></i>
                            </a>
                    </div>
                    
                    <div class="input-group-prepend hiddeninfo2">
                            <label class="input-group-text a1" name="blogNation">刪除</label>
                    </div>
                    <div class="divblog22300 hiddeninfo2" >
							<a id="blogDelete" href="#">
<!-- 							<i class="edit1 fas fa-trash fa-3x" style="color: #F00;"></i> -->
							<i class="edit1 fas fa-trash-alt fa-3x" style="color: #F00;"></i>
                            </a>
                    </div>
                   
                    </div>
                    
                    
                    
                    	<div class="divblog22333" style="display:none" id="hide2">
                    	登入即可評分
                    	</div>
                    	
                     	<div class="divblog223" id="hide1">
                    
                        <div class="rating-stars block" id="rating">

						<div class="rating-stars-container">
						<div class="rating-star" id="starOne">
						<i class="fa fa-star"></i>
						</div>
						<div class="rating-star" id="starTwo">
						<i class="fa fa-star"></i>
						</div>
						<div class="rating-star" id="starThree">
						<i class="fa fa-star"></i>
						</div>
						<div class="rating-star" id="starFour">
						<i class="fa fa-star"></i>
						</div>
						<div class="rating-star" id="starFive">
						<i class="fa fa-star"></i>
						</div>
						</div>
						<input  placeholder="請評分..."  type="number" readonly class=" rating-value" name="rating-stars-value" id="rating-stars-value">
						<span class="a11">總分:(<a><span class="a11" id="starpoint"></span></a>)</span>
						</div>
                    	</div>
                    
                    
                    
                    
                </div>
            </div>



            <div class="divAS1">
                <div class="divAS12">
                    <a id="changeNation" href="#" class="a1 border1 distance">亞洲</a>
                    <span class="a1 border1 distance">瀏覽次數(<span
                        id="changeBlogViews" href="#">999</span>)
                    </span> <a id="changeBlogCity" href="#" class="a1 distance">香港</a>

                </div>
                <div class="divAS13">
                    <span id="changeBlogTitle" class="a3">【香港】2018香港迪士尼終極攻略，交通、門票、事前準備、攻園須知整理，照著這篇玩就對了！</span>
                </div>
                <div class="divAS11">
                    <a href="#">
                        <img id="changeBlogPic" class="divAS11" src="${pageContext.request.contextPath}/Images/Blog/articla1.jpg" alt="article">
                    </a>
                </div>
                <div class="divAS14">
                    <span id="changeBlogDate" class="border1 distance a1">2018-08-08</span>
                    <span class="distance a1">by</span>
                    <a id="changeMemberName2" href="#" class="a1 ">Kobe</a>
                </div>
				
				<h2 class="title-text">
					<span><button id="changeKeyword" type="button" class="btn btn-info fa-1x hot2">
					Article
					</span>
				</h2>
                <div class="divAS15">
                    <div id="changeCityContent">一、奧蘭多迪士尼簡介 Source：KKday 奧蘭多迪士尼是全球最大的迪士尼度假區，總共有魔幻王國（Magic Kingdom）、未來世界（Epcot）、好萊塢影城（Hollywood studios）和動物王國（Animal
                        Kingdom）四大主題樂園，因此也被稱為Disney World。而這次編輯會以魔幻王國為主來介紹唷～ 二、怎麼前往奧蘭多迪士尼？ 美國大眾交通工具並不發達，一般以自駕或搭計程車為主，如果你預計在奧蘭多住宿，奧蘭多的飯店幾乎都有往返奧蘭多各大遊樂園的接駁車服務。
                        a. Magical Express 第一種方式適合選擇住在Disney Resort的人，只要住迪士尼飯店就可以享有免費接駁車的服務，在行前會收到一封訂房確認以及Magical Express搭乘的說明書裡面會有詳細指示。重點來說，下飛機後，前往B
                        side搭乘Magical Express就對了。 b. 巴士 Lynx 第二種則是適合沒有開車但想要自行前往迪士尼的朋友。Lynx以熊掌為標誌，是奧蘭多居民主要使用的大眾交通工具，往環球影城可搭乘Links
                        50 或56，單程2$。 官網路線圖 如果要轉乘其他巴士，可以跟司機要轉乘卡，一個小時內轉車免費。 三、什麼時候開園 迪士尼開放時間會隨季節有所不同，以魔幻王國（Magic Kingdom）為例，旺季假日大約會從早上9點到晚上11點，平日或淡季時段則大多是早上9點到晚上6點或8點，迪士尼的官網會公布營業時間，建議可以事先上網查詢（迪士尼會提早2-3個月前公告開園時間），迪士尼官網上的行事曆會詳細列出每個日期的開園時間以及是否有
                        Extra Magic Hour。 一般來說，迪士尼的淡旺季並不是以月份區分，因為一個月之中可能也會好幾個尖峰（Peak)時段，大多是落在假日或是連假（像是萬聖節、感恩節、聖誕節等），如果想一路玩到半夜，就要避掉平日等時段，但票價會貴一些，人潮也會比較多。
                        奧蘭多迪士尼開園時間 四、最好幾點去排隊？入園前需注意什麼？ Source：KKday 建議要比開園時間提早至少一個半小時到園區，因為需要先停車或搭園內專車到樂園門口、入園前還要先安檢，更何況先排隊就能愈快排到想玩的設施。
                        還有入園前，強烈建議要先讀過遊玩攻略或是先熟悉迪士尼地圖，不然到入園後才研究就太慢了！而且許多時間都浪費掉了~ 入園前的小撇步：在等待入園的時間，可先將迪士尼的官方app下載到手機裡，這個app可以告訴你遊樂設施的地點、廁所、飲水機、餐廳等位置資訊、設施的排隊等候時間、迪士尼人物會在幾點在哪裡出現、煙火幾點施放等各種強大資訊！
                        iTunes 載點 Android載點 五、奧蘭多迪士尼怎麼玩？哪些一定要玩到？ 善用Fast Pass排熱門設施 奧蘭多迪士尼的門票一次可以預約3個快速通關，現在的FP不用抽票了，則是用以下兩種方式來登記Fast
                        Pass： 1. 手機APP登記 Source：KKday 奧蘭多迪士尼的門票的背面有QR code，須先開啟APP掃描QR code將票卡與APP綁定才行。預約完成的FP就會顯示在APP裡，想取消或更改只要在APP的主選單重新預約就可以，非常便利！
                        2. 在設施附近的FastPass Kiosk 登記</div>
                </div>

                <h3 class="title-text">
                    <span>
                        <input type="button" value=" END " id="" class="btn btn-info fa-1x btn-lg">
                    </span>
                </h3>
            </div>

            <div id="" class="comment">
                <h3 class="title-text">
                    <span>
                        <input type="button" value=" 留言板 " id="buttonFade0" class="btn btn-info fa-1x btn-lg">
                    </span>
                </h3>
                <div class="XXXXX">
                    <!-- ----- -->
                    <div class="comment00">
                        <div>
                            <div class="comment01">
                                <a href="#">
                                    <img class="comment011" src="${pageContext.request.contextPath}/Images/Blog/member1.jpg" alt="member">
                                </a>
                            </div>
                            <div class="divblog229">
                                <div class="comment000">
                                <div class="divblog2209">
                                    <a class="divblog22009" href="#">Kobe</a>
                                </div>
                                <div class="divblog2239">
                                        <button type="button" class="btn btn-outline-info divblog2201">檢舉</button>
                                </div>
                            </div>
                                <div class="divblog239">
                                    <p>千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- ----- -->
                    <div class="comment00">
                        <div>
                            <div class="comment01">
                                <a href="#">
                                    <img class="comment011" src="${pageContext.request.contextPath}/Images/Blog/member1.jpg" alt="member">
                                </a>
                            </div>
                            <div class="divblog229">
                                <div class="comment000">
                                <div class="divblog2209">
                                    <a class="divblog22009" href="#">Kobe</a>
                                </div>
                                <div class="divblog2239">
                                        <button type="button" class="btn btn-outline-info divblog2201">檢舉</button>
                                </div>
                            </div>
                                <div class="divblog239">
                                    <p>千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="comment00">
                        <div>
                            <div class="comment01">
                                <a href="#">
                                    <img class="comment011" src="${pageContext.request.contextPath}/Images/Blog/member1.jpg" alt="member">
                                </a>
                            </div>
                            <div class="divblog229">
                                <div class="comment000">
                                <div class="divblog2209">
                                    <a class="divblog22009" href="#">Kobe</a>
                                </div>
                                <div class="divblog2239">
                                        <button type="button" class="btn btn-outline-info divblog2201">檢舉</button>
                                </div>
                            </div>
                                <div class="divblog239">
                                    <p>千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！千萬別錯過這篇啊！</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="comment1">
                    <h3>留言:</h3>
                    <textarea name="" id="" cols="100" rows="5"></textarea>
                </div>
                <div id="login1" class="login1">
                    <div class="comment2">撰寫留言前，請先
                        <a id="" href="#" title="登入" class="badge badge-warning fa-1x">登入</a>
                    </div>
                </div>
                <div class="comment3">
                    <button type="button" class="btn btn-outline-warning fa-2x ">送出留言</button>
                </div>
            </div>
		</article>
		<aside>
					<div class="d2">
				<div class="title">
					<h5 class="title-text">
						<span><input type="button" value="搜尋" id="buttonFade0"
							class="btn btn-info"></span>
					</h5>

					<div id="toggle0">
						<div class="divborder">
							<div>
								<nav class="nav justify-content-end navbar navbar-dark bg-white"
									style="background-color: #5ea0cf">
									
									<form class="form-inline" method="get"
										action="<c:url value="/Blog/BlogIndex.controller"/>">
										<input name="blogSNum" type="hidden" value="">
										<input id="member" name="memberID" type="hidden" value="">
										<input id="keyword" name="search" class="form-control mr-sm-2 transition1 " type="search"
											placeholder="國家，城市及關鍵字" aria-label="Search" required>
										<button id="keyword1" class="btn btn-outline-success my-2 my-sm-0 btnt1 "
											type="submit">Search</button>
									</form>
								</nav>
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
										src="${pageContext.request.contextPath}/Images/Blog/asideP1.jpg"
										alt="taipei1">
									</a>
								</div>
							</div>
							<div class="divT4">
								<a id="changeAsideTitleDate1" href="#" class="a1 urlA1">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
								<a id="changeAsideTitleDate2" href="#" class="a1 urlA2">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
								<a id="changeAsideTitleDate3" href="#" class="a1 urlA3">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
							
								<a id="changeAsideTitleDate4" href="#" class="a1 urlA4">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
								<a id="changeAsideTitle1" href="#" class="a1 urlB1">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
								<a id="changeAsideTitle2" href="#" class="a1 urlB2">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
								<a id="changeAsideTitle3" href="#" class="a1 urlB3">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
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
								<a  id="changeAsideTitle4" href="#" class="a1 urlB4">2018 跨年哪兒過？ 六個台灣跨年景點大盤點</a>
								<span class="divText a1">瀏覽次數(<span	id="changeAsideViews4">999</span>)
							</div>
						</div>
					</div>
				</div>
			</div>


		</aside>

		<i id="top1" class="fas fa-chevron-circle-up fa-2x btn btn-info"></i>

	</div>

	<script>
	        
			var member = "${user.memberID}"; 
// 			var member="2";
			var url = new URL(location.href);
			var URL=url.searchParams.get('blogSNum');
// 			alert(URL);
			alert('memberID = '+member);
		$(document).ready(function() {
			var flagjumppage=true;
			
			$('body').on('click','#confirmB',function(){
				
// 				alert(flagjumppage);
				if(flagjumppage == true){
					window.location.href = "BlogIndex.jsp";
				}
				flagjumppage = !flagjumppage;
				
			})
			//delete------------------------------------------------
			swal.setDefaults({
            confirmButtonText: "確定",
            cancelButtonText: "取消"
        	});
			$('#blogDelete').click(function(){

// 				if (window.confirm('您確定要刪除嗎？') == true) {
// 					var pathDelete= "<c:url value='../Blog/BlogDelete.controller'><c:param name='blogSNum' value=""/></c:url>";
// 					$('#blogDelete').attr("href",pathDelete+"${BeanSNum[0][0].blogSNum}");
// 			    } 
				
				swal({
                    title: "確定刪除？",
                    html: "按下確定後網誌會永久刪除",
                    type: "question",
                    showCancelButton: true//顯示取消按鈕
                    
                    
                }).then(
                    function (result) {
                     if (result.value) {
                            //使用者按下「確定」要做的事
							 $.getJSON('../Blog/BlogDelete.controller',{'blogSNum':"${BeanSNum[0][0].blogSNum}"},function(jsonNav){
// 								 alert(JSON.stringify(jsonNav));
// 								 swal("完成!",jsonNav.result, "success");
								 swal({
					                    title: "完成",
					                    html: "將導向首頁",
					                    type: "success",
						    			confirmButtonText:"<span id='confirmB'>GO<span>"

					                })
								 
// 								 window.location.href = "BlogIndex.jsp";
								 
							 }).fail(function(){
								 swal("完成!",jsonNav.result, "success");
							 });
                            
							
                            
                        } else if (result.dismiss === "cancel")
                        {
                             //使用者按下「取消」要做的事
                            swal("取消", "網誌未被刪除", "error");
                        }//end else  
                    });//end then 
			});
			//like star-----------------------------------------------------------------------
				 $.getJSON('../Blog/MemberBloglike.controller',{'blogSNum':URL},function(json){
// 					 alert(JSON.stringify(json));
// 					 $.each(json,function(i,product){
// 						 alert(product);
						$('#likepoint').html(json[0]);
						$('#starpoint').html(json[1]);						
						if(json[1]==null){
							$('#starpoint').text("尚未有人評分");
						}
					 })
// 				 })//可能有錯
			//like star-----------------------------------------------------------------------
// 				 var member = 2;
			     
				 $.getJSON('../Blog/MemberBloglikeONload.controller',{'memberID':member,'blogSNum':URL},function(json){
// 					 alert(JSON.stringify(json));
					if(json==true){
						$('#likebutton').removeClass('btn-secondary');
						$('#likebutton').addClass('btn-primary').text("已收藏");
					}
				 })
				 
				 //slect SCORE ONLOAD-----------------------------------------------------------------------
// 				 var member = 2;
// 				 var member = ${user.memberID}; 
					if(member!=""){
				 $.getJSON('../Blog/MemberBlogselectScoreONload.controller',{'memberID':member,'blogSNum':URL},function(json){
// 					 alert(JSON.stringify(json));
						alert("評分回填")
						$('#rating-stars-value').attr("placeholder","您上次評了("+json+")分");
						
						if(json==1){
							$("#starOne").css("color","#f1c40f");
						}
						if(json==2){
							$("#starOne").css("color","#f1c40f");
							$("#starTwo").css("color","#f1c40f");
						}
						if(json==3){
							$("#starOne").css("color","#f1c40f");
							$("#starTwo").css("color","#f1c40f");
							$("#starThree").css("color","#f1c40f");
						}
						if(json==4){
							$("#starOne").css("color","#f1c40f");
							$("#starTwo").css("color","#f1c40f");
							$("#starThree").css("color","#f1c40f");
							$("#starFour").css("color","#f1c40f");
						}
						if(json==5){
							$("#starOne").css("color","#f1c40f");
							$("#starTwo").css("color","#f1c40f");
							$("#starThree").css("color","#f1c40f");
							$("#starFour").css("color","#f1c40f");
							$("#starFive").css("color","#f1c40f");
						}
				 })}
			 
				 //STAR--------------------------------------------------------------

		            var ratingOptions = {
		                selectors: {
		                    starsSelector: '.rating-stars',
		                    starSelector: '.rating-star',
		                    starActiveClass: 'is--active',
		                    starHoverClass: 'is--hover',
		                    starNoHoverClass: 'is--no-hover',
		                    targetFormElementSelector: '.rating-value'
		                }
		            };

		            $(".rating-stars").ratingStars(ratingOptions);
		            $(".rating-stars").on("ratingChanged", function (ev, data) {
		                 alert($('#rating-stars-value').val());
		            	 var score = $('#rating-stars-value').val();
// 		            	 var member = 2;
// 		            	 var member = ${user.memberID}; 
							if(member!=""){
								alert("blogSNum = "+URL);
								alert('member不是空字串');//有讀道這行-------------------------------
// 								parseInt(member);
// 								alert('member轉int');
								//沒進Controller-----------------------------------------------------
				            $.getJSON('../Blog/MemberBlogScoreUpdate.controller',{'memberID':member,'blogSNum':URL,'score':score},function(json){
// 								 alert(JSON.stringify(json));
								 alert("評分成功");
								 $('#rating-stars-value').attr("placeholder","您給了("+$('#rating-stars-value').val()+")分");
								 $.getJSON('../Blog/MemberBloglike.controller',{'blogSNum':URL},function(json){
									 $.each(json,function(i,product){
										$('#starpoint').html(json[1]);
									 })
								 })
							 })
							}else{
								$(".rating-stars .rating-stars-container .rating-star").css("color","#555555");
								$('#rating-stars-value').attr("placeholder","評分中...");
								$('#memberNav button').click();
							}
								
				         })
				            $(".rating-stars").on("ratingOnEnter", function (ev, data) {
				                $('#rating-stars-value').attr("placeholder","評分中...");
				            });	
				            $(".rating-stars").on("ratingOnLeave", function (ev, data) {
				                $('#rating-stars-value').attr("placeholder","請評分...");
				            });
		            
//            TOP---------------------------------------------------------------------			 
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
							
					
							// Blog/BlogMember.controller    BeanSNum
// 							alert('${BeanSNum}');
// 							alert('${BeanSNum[0][1].nation}');

							var pathUpdate = "<c:url value='../Blog/BlogUpdate.controller'><c:param name='blogSNum' value=""/></c:url>";
							$('#blogUpdate').attr("href",pathUpdate+"${BeanSNum[0][0].blogSNum}");
// 							alert('${BeanSNum[0][0].blogSNum}');
							var path2 = "<c:url value='../Blog/BlogIndex.controller'><c:param name='search' value=""/></c:url>"; 
							var path = "<c:url value='../Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
// 							 $('.url${i+1}')..attr("href",path2+"${result[i][1].nation}");
							 $('#changeMemberPic').attr("src","data:image/png;base64,${BeanSNum[0][2].memberPicToBase64}");
							 $('#changeMemberName').html('${BeanSNum[0][2].memberNickName}');
							 $('#changeNation').html('${BeanSNum[0][1].nation}').attr("href",path2+"${BeanSNum[0][1].nation}");
							 $('#changeBlogViews').html('${BeanSNum[0][0].blogView}');
							 $('#changeBlogCity').html('${BeanSNum[0][0].blogCity}').attr("href",path2+"${BeanSNum[0][0].blogCity}");
							 $('#changeBlogTitle').html('${BeanSNum[0][0].blogTitle}');
							 $('#changeBlogPic').attr("src","data:image/png;base64,${BeanSNum[0][0].blogCoverToBase64}");
							 $('#changeBlogDate').html('${BeanSNum[0][0].updateTime}'.substring(0, 10));
							 $('#changeMemberName2').html('${BeanSNum[0][2].memberNickName}');
							 $('#changeCityContent').html('${BeanSNum[0][0].blogContext}');
		
							
							
							//NAV 	
							var nav = ["台北","台中","台南","高雄","東京","大阪","沖繩","北海道","首爾","釜山","大邱","濟州島","紐約","洛杉磯","舊金山","邁阿密","柏林","漢堡","慕尼黑","法蘭克福"]; 
							var path2 = "<c:url value='../Blog/BlogIndex.controller'><c:param name='search' value=""/></c:url>"; 
							var path = "<c:url value='../Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
							 $.getJSON('../Blog/BlogIndexNav.controller',function(jsonNav){
									 $.each(jsonNav,function(idx,navProduct){
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
								var path2 = "<c:url value='../Blog/BlogIndex.controller'><c:param name='search' value=""/></c:url>"; 
								var path = "<c:url value='../Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
// 								 alert(path);
								//FIRST
								<c:forEach var="i" begin="0" end="5" step="1">
// 								alert(${result[i][0].blogSNum});
								 $('.url${i+1}').attr("href",path+"${result[i][0].blogSNum}");
// 								 $('.urlA${i+1}').attr("href",path+"${result[i][0].blogSNum}");
// 								 $('.urlB${i+1}').attr("href",path+"${result[i][0].blogSNum}");
						         $('#changePic${i+1}').attr("src","data:image/png;base64,${result[i][0].blogCoverToBase64}");
						         $('#changeNation${i+1}').html('${result[i][1].nation}').attr("href",path2+"${result[i][1].nation}");
						         $('#changeViews${i+1}').html('${result[i][0].blogView}');
						         $('#changeCity${i+1}').html('${result[i][0].blogCity}').attr("href",path2+"${result[i][0].blogCity}");
						         $('#changeTitle${i+1}').html('${result[i][0].blogTitle}');
						         $('#changeDate${i+1}').html('${result[i][0].updateTime}'.substring(0, 10));
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
// 						         $('.urlB${i+1}').attr("href",path+"${result3[i][0].blogSNum}");
						         $('#changeAsidePicDate${i+1}').attr("src","data:image/png;base64,${result3[i][0].blogCoverToBase64}");
						         $('#changeAsideTitleDate${i+1}').html('${result3[i][0].blogTitle}');
						         $('#changeAsideViewsDate${i+1}').html('${result3[i][0].updateTime}'.substring(0, 10));
						         </c:forEach>
						        
								}
							else if ('${result}' == ""){
								 $.getJSON('../Blog/BlogIndexFirstOnload2.controller',function(json){
// 									 alert(JSON.stringify(json));
									 var path = "<c:url value='../Blog/BlogMember.controller'><c:param name='blogSNum' value=""/></c:url>";
									 $.each(json,function(i,product){
										
										if(i < 6){
// 										alert(product[0].memberID);
										$('.url'+(i+1)).attr("href",path+product[0].blogSNum);
// 										$('.urlA'+(i+1)).attr("href",path+product[0].blogSNum);
// 										$('.urlB'+(i+1)).attr("href",path+product[0].blogSNum);
										$('#changePic'+(i+1)).attr("src","data:image/png;base64,"+product[0].blogCover);
										$('#changeNation'+(i+1)).html(product[1].nation);
										$('#changeViews'+(i+1)).html(product[0].blogView);
										$('#changeCity'+(i+1)).html(product[0].blogCity);
										$('#changeTitle'+(i+1)).html(product[0].blogTitle);
										$('#changeDate'+(i+1)).html(new Date(product[0].updateTime).toISOString().split('T')[0]);
										$('#changeMember'+(i+1)).html(product[2].memberNickName);
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
// 										$('.urlA'+((i+1)-10)).attr("href",path+product[0].blogSNum);
										$('.urlB'+((i+1)-10)).attr("href",path+product[0].blogSNum);
										$("#changeAsidePic"+((i+1)-10)).attr("src","data:image/png;base64,"+product[0].blogCover);
										$("#changeAsideTitle"+((i+1)-10)).html(product[0].blogTitle);
										$("#changeAsideViews"+((i+1)-10)).html(product[0].blogView);
										}
										
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
					          var page = 1;
					          var search = "";
					       if(url.indexOf('?')!=-1){      
					           var temp = url.split('?')[1].split('&')[0].substring(5);
					           if(parseInt(temp)){
					            page=parseInt(temp);
					           }
					       }
					       

							$('#buttonFade0').click(function() {
								$('#toggle0').toggle(1000);
							})
							$('#buttonFade1').click(function() {
								$('#toggle1').toggle(1000);
							})
							$('#buttonFade2').click(function() {
								$('#toggle2').toggle(1000);
							})
						//like------------------------------------------------------------
						$('#likebutton').click(function(){ 
							if(member==""){
// 								alert('aaa')
								$('#memberNav button').click();
							}else{
// 								alert("memberID = "+member)
								if($('#likebutton').hasClass('btn-secondary')){
				                $(this).text("已收藏").attr("value",0);
// 				                alert($(this).attr("value"));
				                }
					            else if($('#likebutton').hasClass('btn-primary')){
					                $(this).text("未收藏").attr("value",1);
					            }
					            $(this).toggleClass('btn-secondary').toggleClass('btn-primary');
	// 				            alert($('#likebutton').attr("value"));
					            var like = $('#likebutton').attr("value");
	// 				            var member = 2;
	// 				            var member = ${user.memberID}; 
					            $.getJSON('../Blog/MemberBloglikeUpdate.controller',{'memberID':member,'blogSNum':URL,'like':like},function(json){
	// 								 alert(JSON.stringify(json));
	// 								 alert(json.isLike);
									if(json.isLike==true){
	// 									alert("true");
										$('#likepoint').text((parseInt($('#likepoint').text())+1));
									}
									else if(json.isLike==false){
											$('#likepoint').text((parseInt($('#likepoint').text())-1));
										}
									 
	// 								 $('#starpoint').html(json[1]);
								 })
							}
				         })

				        
				         
				         
				         
				         				         //hiddeninfo----------------------------------------------------
// 				         alert('user before if = ' + ${user.memberID});	
							
							<c:if test="${empty user}">
// 							alert('訪客 = ' + ${user.memberID});
	 				         $(".hiddeninfo1").css("display","none");
					         $(".hiddeninfo2").css("display","none");
					         </c:if>
							
							
				         <c:if test="${!empty user}">
				         alert('user = ' + ${user.memberID});
				         $(".hiddeninfo2").css("display","none");
				         </c:if>
				         
				         <c:if test="${!empty user && user.memberID == BeanSNum[0][2].memberID}">
				         alert('owner = ' + ${user.memberID});
				         $(".hiddeninfo1").css("display","none");
				         $(".hiddeninfo2").css("display","block");
				         </c:if>
				         
				         
		 })  //ready end
	</script>

</body>
</html>