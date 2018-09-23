<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>

<html>
	<head>
		<title>hyacinth by TEMPLATED</title>
		<jsp:include page="../Index/NewHeader.jsp" />
		<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<!-- 		<meta name="description" content="" /> -->
<!-- 		<meta name="keywords" content="" /> -->
<%-- 			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css"> --%>
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/zoomify.min.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/css/main1.css">
<%--     <script src="${pageContext.request.contextPath}/js/jquery-3.3.1.min.js"></script> --%>
<%--     <script src="${pageContext.request.contextPath}/js/bootstrap.bundle.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/IndexOnload.js"></script>

	
<%-- 	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script> --%>
	<script src="${pageContext.request.contextPath}/js/jquery.poptrox.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.scrolly.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/skel.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/util.js"></script>
	<script src="${pageContext.request.contextPath}/js/main.js"></script>
	<script src="${pageContext.request.contextPath}/js/zoomify.min.js"></script>

	<script async defer
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKem0vApPHBwQOr2Zft7YrT_AeGbnNNO0&callback=initMap">
</script>

<!-- <!-- <script type="text/javascript" language="javascript"> -->
<!-- // $(document).ready(function(){ -->
<!-- //     $("#frm").submit(); -->
<!-- // }); -->
<!-- <!--  </script> -->

<script>
    var map;
    function initMap() {
      map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 0, lng: 0 },
        zoom: 2
      });
 
    }

    var map;
    function myTrip() {
      map = new google.maps.Map(document.getElementById("map"), {
        center: { lat: 0, lng: 0 },
        zoom: 2
      });
      var data = [
        {
          position : { lat: 25.00000000, lng: 121.563998 },
          map:map,
          title:"stroke1",
          href:"https://dotblogs.com.tw/jeff-yeh/2010/03/28/14259"
          
      },
      {
          position : { lat: 52.034385, lng: 121.566047 },
          map:map,
          title:"stroke2",
          href:"https://www.google.com.tw/search?q=google+map+marker+link&oq=google+map+marker+link&aqs=chrome..69i57j0l5.8637j0j7&sourceid=chrome&ie=UTF-8"
      }
      ];
      
      for (var i= 0; data.length >i ; i++) {
        var marker = new google.maps.Marker(data[i]);
        google.maps.event.addListener(marker, 'click', function() {
    window.location.href = this.href;
});
      }
 
    }
  </script>
  
  
  <script>
    var map;
    function hotPoint() {
      map = new google.maps.Map(document.getElementById('map'), {
        center: { lat: 0, lng: 0 },
        zoom: 2
      });
      var data = [
        {
          position : { lat: 23.00000000, lng: 124.563998 },
          map:map,
          title:"stroke1",
          href:"https://dotblogs.com.tw/jeff-yeh/2010/03/28/14259"
          
      },
      {
          position : { lat: 22.034385, lng: 133.5655 },
          map:map,
          title:"stroke2",
          href:"https://www.google.com.tw/search?q=google+map+marker+link&oq=google+map+marker+link&aqs=chrome..69i57j0l5.8637j0j7&sourceid=chrome&ie=UTF-8"
      }
      ];
      
      for (var i= 0; data.length >i ; i++) {
        var marker = new google.maps.Marker(data[i]);
        google.maps.event.addListener(marker, 'click', function() {
    window.location.href = this.href;
});
      }
 
    }

function enlarge(){
var imageP = document.getElementById("P1");
imageP.width="500px";
imageP.height="400px";
}
	
	</script>

	<style>
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
            margin-top: 20px;
            float: left;
            background-color: rgb(235, 235, 235);
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
            margin-left:5px;
        }
        .A4{
            width: 360px;
            height: 40px;
            /* border: 1px solid rgb(112, 4, 4); */
        }
        .A3 img{
            width: 360px;
            height: 230px;
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
.a{
background-color: rgb(235, 235, 235);
}

</style>
	</head>

		<article>
		
<%-- <a href="${pageContext.request.contextPath}/ACCommentController?actSNum=2&memberID=2">123123123564568</a>	 --%>
<%-- <a href="${pageContext.request.contextPath}/Index/ACCommentController">123123123564568</a> --%>
		    <!-- Banner -->
    <section id="banner">
        <div class="inner">
            <h1>Hey, We are Hyacinth</h1>
            <p>Best and the most dedicated travel agency</p>
            <ul class="actions">
                <li>Try your best travel!</li>
            </ul>
        </div>
    </section>
    
    
		<br>
		<br>
		<br>	
		<div id="articleDown">
		<div>
		 <!-- <img src="image/world-map.png" width="1380px" height="600px"> -->
	
		 <form action="">
			<button type="button" class="btn btn-primary" style="background-color:rgb(100, 100, 100);" onclick="myTrip()">myTrip</button>
			<button type="button" class="btn btn-primary" style="background-color:rgb(100, 100, 100);" onclick="hotPoint()" >hotPoint</button>
			</form>
				<div id="map" ></div>
		</div>
	    </div>

      <div class="testC">
				<br>
			<div class="inner">
					<div class="align-center">
						<h6 style="color: rgb(255, 255, 255)">Don't stop and get ready for your best trip.</h6>
						<h2 style="color: rgb(255, 255, 255)">Welcome to visit the excellent BLOG!</h2>
					</div>
				</div>
			

		<div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
			<ol class="carousel-indicators">
			  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
			  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
			</ol>
			
			<div class="carousel-inner" id="loopBlogMax">
			  <div class="carousel-item active" id="loopBlog1">
			  <div class="city" id="cities1" style="white-space: nowrap" "width: 300px" "height: 100px"></div>
              <div class="words" id="textTile1"></div>
				<a href=""><img class="d-block w-100" src="${pageContext.request.contextPath}/Images/Index/Japan-Travel.jpg" alt="First slide"></a>
			  </div>
			  
			  <div class="carousel-item" id="loopBlog2">
			  <div class="city" id="cities2"></div>
              <div class="words" id="textTile2"></div>
				<a href=""><img class="d-block w-100" src="${pageContext.request.contextPath}/Images/Index/london2.jpg" alt="Second slide"></a>
			  </div>
			  
			  <div class="carousel-item" id="loopBlog3">
			  <div class="city" id="cities3"></div>
              <div class="words" id="textTile3"></div>
				<a href=""><img class="d-block w-100" src="${pageContext.request.contextPath}/Images/Index/london3.jpg" alt="Third slide"></a>
			  </div>
			  
			  <div class="carousel-item" id="loopBlog4">
			  <div class="city" id="cities4"></div>
              <div class="words" id="textTile4"></div>
					<a href=""><img class="d-block w-100" src="${pageContext.request.contextPath}/Images/Index/Japan-Travel.jpg" alt="Fourth slide"></a>
				  </div>
				  
			  <div class="carousel-item" id="loopBlog5">
			  <div class="city" id="cities5"></div>
              <div class="words" id="textTile5"></div>
					<a href=""><img class="d-block w-100" src="${pageContext.request.contextPath}/Images/Index/Tokyo_Travel.jpg" alt="Fifth slide"></a>
			  </div>
			  
			   <div class="carousel-item" id="loopBlog6">
			   <div class="city" id="cities6"></div>
              <div class="words" id="textTile6"></div>
					<a href=""><img class="d-block w-100" src="${pageContext.request.contextPath}/Images/Index/Japan-Travel.jpg" alt="Sixth slide"></a>
			  </div>
			</div>
			<a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
			  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			  <span class="sr-only">Previous</span>
			</a>
			<a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
			  <span class="carousel-control-next-icon" aria-hidden="true"></span>
			  <span class="sr-only">Next</span>
			</a>
			</div>
			<br>
		</div>  
			
			<br>
			<br>
		<br>
		<div class="inner">
				<div class="align-center">
					<p>Don't stop and get ready for your best trip.</p>
					<h2>Welcome to join the wonderful EVENT!</h2>
				</div>
			</div>

        <div class="a" id="sixBlockOut">
		<div id="tabs-1"  style="height: 100%;">
		<div class="A1" id="Titleout1">
				<div class="A2" id="ActTpu1">【捷運遊台北】四天三夜台北旅遊</div>
				<div class="A3" id="ActPpu1"><img src=""></div>
				<div class="A4" id="ActBpu1">
				<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 30px;height: 30px;"></div>
				<div class="aa2" id="views1">129</div> 
				<div class="aa3"><a id="ActMpu1" href=""><button type="button" class="btn btn-primary btn-sm" style="margin-top:3px;background-color:rgb(70, 70, 70);">More</button></a></div>    
				</div>
			</div>
			<div class="A1" id="Titleout2">
					<div class="A2" id="ActTpu2">【捷運遊台北】四天三夜台北旅遊</div>
					<div class="A3" id="ActPpu2"><img src=""></div>
					<div class="A4" id="ActBpu2">
					<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 30px;height: 30px;"></div>
					<div class="aa2" id="views2">129</div> 
					<div class="aa3"><a id="ActMpu2" href=""><button type="button" class="btn btn-primary btn-sm" style="margin-top:3px;background-color:rgb(70, 70, 70);">More</button></a></div>     
					</div>
				</div>
				<div class="A1" id="Titleout3">
						<div class="A2" id="ActTpu3">【捷運遊台北】四天三夜台北旅遊</div>
						<div class="A3" id="ActPpu3"><img src=""></div>
						<div class="A4" id="ActBpu3">
						<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 30px;height: 30px;"></div>
						<div class="aa2" id="views3">129</div> 
						<div class="aa3"><a id="ActMpu3" href=""><button type="button" class="btn btn-primary btn-sm" style="margin-top:3px;background-color:rgb(70, 70, 70);">More</button></a></div>     
						</div>
					</div>
		
					<div style="width:1100px; height: 5px;" class="boxlong"></div>
		
					<div class="A1" id="Titleout4">
							<div class="A2" id="ActTpu4">【捷運遊台北】四天三夜台北旅遊</div>
							<div class="A3" id="ActPpu4"><img src=""></div>
							<div class="A4" id="ActBpu4">
							<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 30px;height: 30px;"></div>
							<div class="aa2" id="views4">129</div> 
							<div class="aa3"><a id="ActMpu4" href=""><button type="button" class="btn btn-primary btn-sm" style="margin-top:3px;background-color:rgb(70, 70, 70);">More</button></a></div>    
							</div>
						</div>
						<div class="A1" id="Titleout5">
								<div class="A2" id="ActTpu5">【捷運遊台北】四天三夜台北旅遊</div>
								<div class="A3" id="ActPpu5"><img src=""></div>
								<div class="A4" id="ActBpu5">
								<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 30px;height: 30px;"></div>
								<div class="aa2" id="views5">129</div> 
								<div class="aa3"><a id="ActMpu5" href=""><button type="button" class="btn btn-primary btn-sm" style="margin-top:3px;background-color:rgb(70, 70, 70);">More</button></a></div>     
								</div>
							</div>
							<div class="A1" id="Titleout6">
									<div class="A2" id="ActTpu6">【捷運遊台北】四天三夜台北旅遊</div>
									<div class="A3" id="ActPpu6"><img src=""></div>
									<div class="A4" id="ActBpu6">
									<div class="aa1"><img src="${pageContext.request.contextPath}/Images/Act/viewpoint.png" style="width: 30px;height: 30px;"></div>
									<div class="aa2" id="views6">129</div> 
									<div class="aa3"><a id="ActMpu6" href=""><button type="button" class="btn btn-primary btn-sm" style="margin-top:3px;background-color:rgb(70, 70, 70);">More</button></a></div>    
									</div>
								</div>
 </div>
 </div>
		


	 <script type="text/javascript">
		 $('.A1').zoomify({scale:0.7});
	 </script>
	 
			</article>		
	</body>
<jsp:include page="../Index/Footer.jsp" />
</html>
