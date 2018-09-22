<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  
<jsp:include page="../Index/NewHeader.jsp" />

    
     <link rel="stylesheet" href="${pageContext.request.contextPath}/css/jquery-ui.css">
     <link rel="stylesheet" href="/resources/demos/style.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-ui.js"></script> 
 

<title>TripManager</title>

</head>
 <style>
      *{
        padding:0%;
        margin:0%;
      }
/*        .left-panel { */
/*           font-family: 'Roboto','sans-serif'; */
/*           line-height: 30px; */
/*           padding-left: 20px; */
/*           width: 500px; */
/*           float: left; */
/*           height: 400px; */
/*           padding-top: 0; */
/*           padding-left: 0; */
/*           margin-top: 5%; */
/*           margin-right: 10%; */
/*           margin-left: 3%; */
                
       }
       
        .right-panel {
          font-family: 'Roboto','sans-serif';
          line-height: 30px;
          padding-left: 20px;
          border-width: 2px;
          width: 30%;
          float: right;
          height: 400px;
          padding-top: 0;
          margin-top: 5%;
          margin-right: 10%;
          margin-left: 3%;
        }
        
       
        .right-panel select, .right-panel input {
          font-size: 15px;
        }
  
        .right-panel select {
          width: 100%;
        }
  
        .right-panel i {
          font-size: 12px;
        }
        html, body {
          height: 100%;
          margin: 0;
          padding: 0;
        }
      #map {
	height: 400px;
	float: right;
	width: 400px;
	
}
      
     
 </style>
  </head>
  <body>
  
 
  <div class="container">
  <h3 style="text-align: center">活動建立</h3>
  <div style="display:flex">
   
<div style="margin-left: 80px">

<form style="width: 500px; margin-right:0px;" action="<c:url value="/create.act.controller"/>" method="post">
	<table >
	 
	 
<!-- 	 hidden  -->
	 <tr><input type="hidden" name="actSNum" value="${newEvent.actSNum}" id="actSNum" ></tr>
	 <tr><input type="hidden" name="memberID" value="${newEvent.memberID}" id="memberID"></tr>
	  <tr><input type="hidden" name="actCreateDate" value="${newEvent.actCreateDate}" id="memberID"></tr>
	 <tr><input type="hidden" name="actView" value="3" id="actView"></tr>
	 <tr><input type="hidden" name="actVisibility" value="1" id="actVisibility"></tr>
	 <tr><input type="hidden" name="participantsNow" value="2" id="participantsNow"></tr>


<!-- 	 hidden  -->
	     <tr>
		     <td>活動預覽圖(揪團封面):</td>
             <td><input type="file" name="actPhoto" id="" value="${param.homepage}"></td>
             <td>${errorMsgs["homepage"]}</td>
		</tr>
		<tr>
			<td>活動主題:</td>
			<td><input type="text" name="actTitle" value="${param.eventname}"></td>
			<td>${errors.eventname}</td>
		</tr>
		
		<tr>
			<td>選取城市:</td>
			<td><input type="text" name="actCity" value="${param.actCity}"></td>
			<td>${errors.actCity}</td>
		</tr>
		<tr>
			<td>活動開始日期:</td>
			<td><input type="datetime-local" name="actSTime" id="actStartTime" value="${param.actStartTime}"></td>
			<td>${errors.actStartTime}</td>

		</tr>

		<tr>
		     <td>活動結束日期:</td>
             <td><input type="datetime-local" name="EndTime" id="actEndTime" value="${param.actEndTime}"></td>
             <td>${errors.actEndTime}</td>
		</tr>
		<tr>
		     <td>活動成團人數:</td>
             <td><input  type="text" name="minParticipants" value="${param.minParticipants}" ></td>
              <td>${errors.minParticipants}</td>
        </tr> 
        <tr>
             <td>活動最大成團人數:</td>
             <td><input  type="text" name="maxParticipants" value="${param.maxParticipants}" ></td>
              <td>${errors.maxParticipants}</td>
		
		</tr>
		<tr>
		     <td>預算:</td>
             <td><input type="text" name="budget" value="${param.budget}"></td>
             <td>${errors.budget}</td>
		</tr>
		<tr>
		     <td>付款方式:</td>
             <td>
             <select name="payment">
              <option>VISA</option>
      		  <option>Transfer</option>
      		   <option>Cash</option>
             </select>
             </td>
		</tr>
		
		<tr>
			<td>活動截止日期:</td>
			<td><input type="datetime-local" name="DeadLine" id="actJoinDeadLine" value="${param.actJoinDeadLine}"></td>
			<td>${errors.actJoinDeadLine}</td>
		</tr>
		<tr>
		   <td>詳細內容</td>
		   <td><textarea rows="4" cols="50" name="actintro" value="${param.actintro}"></textarea></td>
		   <td>${errors.eventinfo}</td>
		</tr>
	
	
			<tr><td><input type="submit" value="build" id="build"></td></tr>
			</table>
</form>
</div>
   
   
<div class="card" style="width: 18rem;">
   <div  id="map"></div>
  <div class="card-body">
    <p class="card-text">
    <div class = "right-panel">         
         <input id ="find-viewpoint" type="text" name="find-viewpoint" placeholder="景點">
         <select id ="find-city" name="city">
  				<option></option>
  				<option value="台北">台北</option>
  				<option value="台中">台中</option>
  				<option value="宜蘭">宜蘭</option>
 				<option value="中壢">中壢</option>
 			    <option value="拉死為狗斯">拉死為狗斯</option>
 				<option value="三凡希死狗">三凡希死狗</option>
		</select>
         <select id ="find-type" name="type">
  				<option></option>
  				<option value="美食">美食</option>
  				<option value="景點">景點</option>
  				<option value="購物">購物</option>
		</select>
		 <input type="button" id="search" value="search" >
</p>
   
  </div>
</div>
    
    <div class="left-panel"> 
          <div>
          <input type="button" class="btn btn-danger" id="route" value="route">
          <input type="button" class="btn btn-warning" id="btn" value="addItem">
          </div>
      
      
     
<!--       <input type="button" id="save" class="btn btn-dark" value="save" name="insert"> -->
<!--       <span id="actSNum"></span> -->
      
     <div id="select"><div>
<!--       <div class = "right-panel"> -->
         
<!--          <input id ="find-viewpoint" type="text" name="find-viewpoint" placeholder="景點"> -->
<!--          <select id ="find-city" name="city"> -->
<!--   				<option></option> -->
<!--   				<option value="台北">台北</option> -->
<!--   				<option value="台中">台中</option> -->
<!--   				<option value="宜蘭">宜蘭</option> -->
<!--  				<option value="中壢">中壢</option> -->
<!--  			    <option value="拉死為狗斯">拉死為狗斯</option> -->
<!--  				<option value="三凡希死狗">三凡希死狗</option> -->
<!-- 		</select> -->
<!--          <select id ="find-type" name="type"> -->
<!--   				<option></option> -->
<!--   				<option value="美食">美食</option> -->
<!--   				<option value="景點">景點</option> -->
<!--   				<option value="購物">購物</option> -->
<!-- 		</select> -->
<!-- 		 <input type="button" id="search" value="search" > -->
	   
	    <ul id="sortable1" class="connectedSortable"></ul> 
	   
	   
	   
       
	    </div>
	     
  </div>

         <script>
//          connection DataBase by Ajax
         $("#search").on('click',function () {
        	
         $.ajax({
        	    type : "post",
        	    url : "${pageContext.request.contextPath}/searchViewPoint.Controller",
        	    data:JSON.stringify(
        	    		{
        	    		 "viewPointName":document.getElementById("find-viewpoint").value, 
        	    	     "viewPointCity":document.getElementById("find-city").value, 
        	    	     "viewPointType":document.getElementById("find-type").value
        	    	    }
        	    		           ) ,
        	    		
        	    contentType: "application/json; charset=utf-8",
        	    dataType: "json",
        	    success: function (data) {
                         for(var i =0; i< data.length; i++){
                     $("#sortable1").append('<li class="ui-state-default" id="'+ data[i].viewPointID + '" view ="'+ data[i].viewPointAddress + '">' + data[i].viewPointName + '</li>');                      
                         }   
                      },
        	    error: function (response) {
                    alert("error");
                    },
        	    
        	});
        	  });
         </script>
        
         <script>
         
         $("#build").on('click',function () {
     	 
        	 var array =$("#select li");

        	
        	 var data = [];
        	 var count = 1;
                for(i=0; i< array.length; i++){
        		 data.push
        		 ({
    				 "actSNum":document.getElementById("actSNum").value,
        			 "startTime":document.getElementById("startTime"+count).value,
    				 "endTime":document.getElementById("endTime"+count).value,
    				 "viewPointID":array[i].getAttribute("id"),
    				 "markerID":count
        		 });
        		 count++;
//         		 alert(data);
        		 alert(data[0].actSNum)
        	 } 
              $.ajax({
                     type : "post",
 	                 url : "${pageContext.request.contextPath}/trip.Controller",
 	                 data:JSON.stringify(data) ,
 	                 contentType: "application/json; charset=utf-8",
 	                 dataType: "json",
 	                 success: function (data) {
                     alert("success");
                     	
                     },
                     error: function (response) {
                     alert("error");
                     },
           
});
        	  
  });
         </script>
         
        </div>
        </div>
        
<script>

    var txtId = 1;
    var testId =1;
    // add draggable DIV 
    $("#btn").on('click',function () {
        $("#select").append('<div id="select'+ testId +'" class="connectedSortable" ><input type="datetime-local" id="startTime'+ testId +'"><input type="datetime-local" id="endTime'+ testId +'"><input type="button" value="del" onclick="deltest('+testId+')"></div>'
        		);
        testId++;

    $( "#sortable1, #sortable2, .connectedSortable" ).sortable({
        connectWith: ".connectedSortable"
        }).disableSelection();
});
       // #select scoll
//              $("#select").on("mouseenter mouseleave", function (event) { 
//           if (event.type == "mouseenter") {
//             $(this).css({"overflow-y": "scroll"}); 
//           } else {
//             $(this).scrollTop(0).css({"overflow-y": "hidden"}); 
//           }
//     });
         // #sortable1 scoll
         $("#sortable1").on("mouseenter mouseleave", function (event) { 
          if (event.type == "mouseenter") {
            $(this).css({"overflow-y": "scroll"}); 
          } else {
            $(this).scrollTop(0).css({"overflow-y": "hidden"}); 
          }
    });

//delete added div
    function deltxt(id) {
        $("#div"+id).remove();
    } 
    function deltest(testId) {
        $("#select"+ testId ).remove();
    }
  </script> 

<script>
//google api
//  $("#route").on('click',function () {
//    });
      function initMap() {
        var directionsService = new google.maps.DirectionsService;
        var directionsDisplay = new google.maps.DirectionsRenderer;
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 1,
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
  var array =$("#select>div>li");
   

  for(i=0; i<array.length; i++){
    if(i==0){
      var start =(array[0].getAttribute("view"));
    }else if(i==((array.length)-1)){
      var end = (array[(array.length)-1].getAttribute("view"));
    }else{
      waypts.push({
            location: array[i].getAttribute("view"),
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
  
</script>

     </body>
</html>