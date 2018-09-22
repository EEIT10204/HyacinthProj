<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<jsp:include page="../Index/NewHeader.jsp" />
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">


<style>
#left-panel {
	font-family: 'Roboto', 'sans-serif';
	line-height: 30px;
	padding-left: 10px;
}

#right-panel i {
	font-size: 12px;
}

html, body {
	height: 100%;
	margin: 0;
	padding: 0;
}
 li{
 list-style-type:none;
 } 

#map {
	height: 420px;
	float: right;
	width: 420px;
	align: center;
}
#ActDetail{

}
.actCover{
vertical-align: middle;
    border-style: none;
    height: 526px;
    width:1110px;
}
</style>
</head>
<body>


	
<!---------------------------------------------------------------------------------------------------------------------------------------------- -->
	
	
	<body>
    <div class="container">
    

<!-- -------------------------------------------------------------------------------------------- -->
        <div class="event_box">
            <img class="actCover" style=" padding-bottom: 30px;" src="data:image/png;base64,${event.actPhotoToBase64}" name="actPhoto" id="actPhoto" alt="event">
<!-- -------------------------------------------------------------------------------------------- --> 

            <div id="map"></div>
    <div class="card" style="width: 600px;">
   <div class="card-body" style="background-color: gray;">
    <h5 class="card-title"> ${event.actTitle}</h5>
    <p class="card-text"> <div class="host">
                        <strong>${event.actCity}</strong>
                    </div>
                <div class="speakers">
                    <strong>舉辦人</strong>
                    <span><a href="XXXXXXXXXXXXX">${member.memberName}</a></span>
                </div>
                <div class="event_date">
                <td>
                   <tr>活動時間:${event.actStartTime} ~ ${event.actEndTime}</tr><br>
                   <tr> 活動報名截止日期:${event.actJoinDeadLine}</tr>
                   </td>
                </div>
                <div class="event_word">
                                                         付款方式:${event.payment}                        
                </div>
                <div class="event_word">
                                                         費用:${event.budget}                        
                </div>
                <div class="event_word">
                        ${event.actIntro}
            </div>
            </div>
            
            </p>
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">Go somewhere</a>
  </div>
</div>
<!-- -------------------------------------------------------------------------------------------- -->
<div class="collapse" id="collapseExample">
  <div class="card card-body" style="padding-right: 5rem";>
      <table>
	  <c:forEach var ="trip" items="${ trip }" varStatus="status">
	  <tr><td>${trip.startTime} ~ ${trip.endTime} </td><td>${beanbean[status.count-1].viewPointName}</td></tr>
	  <td><input class="address" type="hidden" value="${beanbean[status.count-1].viewPointAddress}"></td>
	  </c:forEach>
	  </table>	  
	 <input type="button" id="route" value="Check Route">
  </div>
</div>

    <div style="background-color: #f5f5f5; margin:auto; text-align: center; margin-right: ">
			<button type="button" id="LikeOrDisLike"class="btn btn-primary"  value="${likebottuntype}">${likebottuntype}</button>
		<button type="button" class="btn btn-success" id="AttendOrNot"  value="${attendbottuntype}">${attendbottuntype}</button> <!-- ${attendStatus} -->
		<button type="button" class="btn btn-danger"  id="sendReport" value="sendReport">Report</button>
		<button type="button" class="btn btn-warning" id="invite" value="invite">Invite</button>
		<input type="hidden" id= "num" value="${useractSNum}">
		<input type="hidden" id= "mem" value="${userid}">
		

		
	
 
     </div>
		<div id = "friends"></div>
	</div>
		
		
		

<script>
$( document ).ready(function() {
	
 $('#LikeOrDisLike').on('click',this.value ,function () {
	 
	 alert(this.value);
	 if(this.value == 'Like'){
		 var process = true;
	    	$('#LikeOrDisLike').text("disLike").attr("value","disLike");
	 } else if (this.value == 'disLike'){
		 var process = false;
	    	$('#LikeOrDisLike').text("Like").attr("value","Like");
	  }else if (this.value == 'none'){
		 var process = 'none';
	    	$('#allButton').html("<h3>please login !<h3>");
	 }
	 
    $.ajax({
	    type : "post",
	    url : "${pageContext.request.contextPath}/memberact.Controller",
	    data:JSON.stringify({
	    	"actSNum":document.getElementById("num").value,
	    	"memberID":document.getElementById("mem").value,
	    	"isLike":process,    	
	    }),
	    
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function (data) {
	    	alert("sucess"); 	    	
	    	
              },
	    error: function (response) {
            alert("error");
            },
	    
	});
 }); 
 
 	 $('#AttendOrNot').on('click',this.value ,function () {
	 
	 alert(this.value);
	 if(this.value == 'Attend'){
		 var process = true;
	    	$('#AttendOrNot').text("disAttend").attr("value","disAttend");
	 }
	 else{
		 var process = false;
	    	$('#AttendOrNot').text("Attend").attr("value","Attend");
	 }
	 
    $.ajax({
	    type : "post",
	    url : "${pageContext.request.contextPath}/memberact.Controller",
	    data:JSON.stringify({
	    	"actSNum":document.getElementById("num").value,
	    	"memberID":document.getElementById("mem").value,
	    	"isAttend":process,    	
	    }),
	    
	    contentType: "application/json; charset=utf-8",
	    dataType: "json",
	    success: function (data) {
	    	alert("sucess"); 	    	
	    	
              },
	    error: function (response) {
            alert("error");
            },
	    
	});
 }); 
 })

</script>

			
			
<script> 
			 function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 2,
          center: {lat: 0, lng: 0}
        });
        directionsDisplay.setMap(map);

        document.getElementById('route').addEventListener('click', function() {
          calculateAndDisplayRoute(directionsService, directionsDisplay);
        });
      }

      function calculateAndDisplayRoute(directionsService, directionsDisplay) {
        
  var array = [];
  var waypts = [];
  var array =document.getElementsByClassName("address");

   

  for(i=0; i<array.length; i++){
    if(i==0){
      var start =(array[0].value);
    }else if(i==((array.length)-1)){
      var end = (array[(array.length)-1].value);
    }else{
      waypts.push({
            location: array[i].value,
             stopover: true             
      });
     
    } 
    }
         directionsService.route({
          origin: start,
          destination: end,
          waypoints: waypts,
          optimizeWaypoints: true,
          travelMode: 'DRIVING'
        }, function(response, status) {
          if (status === 'OK') {
            directionsDisplay.setDirections(response);
            var route = response.routes[0];
           
           
          } else {
            window.alert('Directions request failed due to ' + status);
          }
        });
      }
</script>
<script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBKem0vApPHBwQOr2Zft7YrT_AeGbnNNO0&callback=initMap">
</script>
<script>
$( document ).ready(function() { 
	
	 $('#invite').click(function () {
		
		 
	    $.ajax({
		    type : "post",
		    url : "${pageContext.request.contextPath}/invitefriends.controller",
		    data:JSON.stringify({
		    	"memberID":document.getElementById("mem").value,
		    }),
		    
		    contentType: "application/json; charset=utf-8",
		    dataType: "json",
		    success: function (data) {
		    	 for(var i =0; i< data.length; i++){
		    	  $("#friends").append( data[i].memberName +' <input type="button" value = "sendInvite" onclick="function()"><br>' );    
	              }
		    },
		    error: function (response) {
	            alert("error");
	            },
		    
		});
	 }); 
	 
})
</script>
</body>
<jsp:include page="../Index/Footer.jsp" />
</html>