
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
  
  
<title>Insert title here</title>
<style>

#bodyContent{
	width:100%;
	height:790px;
	border:1px solid red;
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
            /* border: 2px solid rgb(37, 37, 37); */
            margin-left: 100px;
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
   /* border: 1px solid green; */
}

/* 留言板 */
/* ActComment */
	.form-group textarea{
      width: 700px;
      height: 150px;
      margin-left: 20px;
  
    }
    .messOut{
      border: 1px solid rgb(119, 119, 119) ;
      width: 770px;
      margin: auto;
      margin-top: 50px;
    }
    .form-control{
      width: 450px;
      margin: auto;
      margin-top: 10px;
      display: inline-block;
    }
    .mess2{
      border: 1px solid rgb(119, 119, 119) ; 
      background-color: rgb(197, 197, 197);
    }
    .mess3{
      /* border: 1px solid rgb(95, 2, 133) ; */
    }
    .mess4{
      /* border: 1px solid rgb(192, 189, 0) ; */
    }
    .mess1{
      /* border: 1px solid rgb(2, 0, 136) ; */
      background-color: rgb(223, 223, 223);
      height: 50px;
    }
    .mess1 img{
      width: 35px;
      height: 35px;
      margin-left: 10px;
    }
    .messUser{
      /* border: 1px solid rgb(255, 208, 0); */
      display: inline-block;
      margin-top: 7px;
    }
    .messName{
      /* border: 1px solid rgb(56, 255, 82); */
      display: inline-block;
      margin-left: 20px;
      margin-top: 7px;
    }
    .buttonT{
      /* border: 1px solid rgb(234, 0, 255); */
    }
    .btn-primary{
/*     margin-left: 540px; */
/*     margin-bottom: 20px; */
    }
    .selectUser{
      /* border: 1px solid red; */
    }
    #messA img{
     width: 30px;
     height: 30px;
     display: inline-block;
     margin-top: 6px;
     /* border: 1px solid red; */
     margin-left: 20px;
    }
    #messA h6{
    margin-left: 8px;
    margin-top: 15px;
/*     border: 1px solid red; */
    display: inline-block;
    }
    .messB{
    display: inline-block;
    margin-left: 20px;
/*     border: 1px solid purple; */
    }	
    .uuu{
/*     border:1px solid green; */
    }
    
    
      .flip{
  margin:0px;
padding:5px;
text-align:center;
background:#e5eecc;
/* border:solid 1px #c3c3c3; */
margin-top:10px;
}
 .update{ 
 background-color:e5eecc; 
/*  width:35px;  */
/*  height:25px;  */
 margin-left:5px; 
/*   border:solid 1px red;  */
  display: inline-block;  
 } 
.updatebutton {
   display: inline-block; 
/*   padding: 15px 25px; */
  font-size: 15px;
  cursor: pointer; 
  text-align: center;
  text-decoration: none;
  outline: none;
  color: #fff;
  background-color: #808080;
  border: none;
  border-radius: 15px;
  box-shadow: 0 9px #999;
}

.updatebutton:hover {background-color: #575757}

.updatebutton:active {
  background-color: #494949;
  box-shadow: 0 5px #666;
  transform: translateY(4px);
}

  }

</style>

<title>Insert title here</title>
</head>

<script>
$( function() {
    $( "#tabs" ).tabs();
  } ); 
</script>

<body>
<div id = "bodyContent">
<div id="tabs">
  <ul class="ulcolor">
    <li><a href="#tabs-1">Newest</a></li>
    <li><a href="#tabs-2">Popular</a></li>
  </ul>

<!--1-->

   <div id="tabs-1"  style="height: 100%; border:1px;">
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
		
					<div style="width:1100px; height: 5px;" class="boxlong"></div>
		
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
</div>

<!--2-->

<div id="tabs-2">
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
		
					<div style="width:1100px; height: 5px;" class="boxlong"></div>
		
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
</div>
</div>
</div>


 <script src="${pageContext.request.contextPath}/js/zoomify.min.js"></script>
 <script type="text/javascript">
	 $('.A1').zoomify({scale:0.8});
 </script>


</body>
<%--  <jsp:include page="${pageContext.request.contextPath}/Index/Footer.jsp"></jsp:include> --%>
<jsp:include page="../Index/Footer.jsp" />
</html>