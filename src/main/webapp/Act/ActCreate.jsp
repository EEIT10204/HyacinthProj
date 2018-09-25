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
 <!-------------------------------------------------------------------------------->
 .visible-scrollbar, .sortable1, .mostly-customized-scrollbar {
  display: block;
  width: 10em;
  overflow: auto;
  height: 2em;
}
.sortable1::-webkit-scrollbar {
  display: none;
}

/* Demonstrate a "mostly customized" scrollbar
 * (won't be visible otherwise if width/height is specified) */
.mostly-customized-scrollbar::-webkit-scrollbar {
  width: 5px;
  height: 8px;
  background-color: #aaa; /* or add it to the track */
}
/* Add a thumb */
.mostly-customized-scrollbar::-webkit-scrollbar-thumb {
    background: #000; 
}
 
 
 <!-------------------------------------------------------------------------------->
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
	width:400px;
	
}
      
     
 </style>
  </head>
  <body>
  
 
  <div class="container">
  <h3 style="text-align: center">活動建立</h3>
  <div style="display:flex">
   
<div style="margin-left: 80px">

<form style="width: 500px; margin-right:0px;" name ="createActBean" action="<c:url value="/create.act.controller"/>" method="post" enctype="multipart/form-data">
	<table >
	  <tr>
		     <td>活動預覽圖(揪團封面):</td>
             <td><input type="file" name="actPhoto" id="actPhoto" ></td>
             </tr>
	 
<!-- 	 hidden  -->
	 <tr><input type="hidden" name="actSNum" value="${newEvent.actSNum}" id="actSNum" ></tr>
	 <tr><input type="hidden" name="memberID" value="${newEvent.memberID}" id="memberID"></tr>
	  <tr><input type="hidden" name="actCreateDate" value="${newEvent.actCreateDate}" id="memberID"></tr>
	 <tr><input type="hidden" name="actView" value="0" id="actView"></tr>
	 <tr><input type="hidden" name="actVisibility" value="1" id="actVisibility"></tr>
	 <tr><input type="hidden" name="participantsNow" value="0" id="participantsNow"></tr>
<!-- 	 hidden  -->
	
		<tr>
			<td>活動主題:</td>
			<td><input type="text" name="actTitle" id="actTitle" value="${param.eventname}"></td>
			<td>${errors.eventname}</td>
		</tr>
		
		<tr>
			<td>選取城市:</td>
			
			<td><select id ="actCity"  name="actCity" value="${param.actCity}">
  				<option></option>
  				<option value="台北">台北</option>
  				<option value="台中">台中</option>
  				<option value="宜蘭">宜蘭</option>
 				<option value="中壢">中壢</option>
 			    <option value="拉斯維加斯">拉斯維加斯</option>
 				<option value="大阪">大阪</option>
 				<option value="大邱">大邱</option>
 				<option value="仁川">仁川</option>
 				<option value="北海道">北海道</option>
 				<option value="克隆">克隆</option>
 				<option value="沖繩">沖繩</option>
 				<option value="京都">京都</option>
 				<option value="拉斯維加斯">拉斯維加斯</option>
 				<option value="東京">東京</option>
 				<option value="法蘭克福">法蘭克福</option>
 				<option value="花蓮">花蓮</option>
 				<option value="柏林">柏林</option>
 				<option value="洛杉磯">洛杉磯</option>
 				<option value="首爾">首爾</option>
 				<option value="紐約">紐約</option>
 				<option value="釜山">釜山</option>
 				<option value="漢堡">漢堡</option>
 				<option value="高雄">高雄</option>
 				<option value="釜山">釜山</option>
 				<option value="廣島">廣島</option>
 				<option value="慕尼黑">慕尼黑</option>
 				<option value="濟州島">濟州島</option>
 				<option value="邁阿密">邁阿密</option>
 				<option value="舊金山">舊金山</option>
 				
		    </select></td>
		</tr>
		<tr>
			<td>活動開始日期:</td>
			<td><input type="datetime-local" name="actSTime" id="actStartTime" value="${param.actStartTime}"></td>
			<td>${errors.actStartTime}</td>

		</tr>

		<tr>
		     <td>活動結束日期:</td>
             <td><input type="datetime-local" name="EndTime" id="actEndTime" value="${param.actEndTime}" ></td>
             <td>${errors.actEndTime}</td>
		</tr>
		<tr>
		     <td>活動成團人數:</td>
             <td><input  type="text" id="minParticipants" name="minParticipants" value="${param.minParticipants}" ></td>
              <td>${errors.minParticipants}</td>
        </tr> 
        <tr>
             <td>活動最大成團人數:</td>
             <td><input  type="text" id="maxParticipants" name="maxParticipants" value="${param.maxParticipants}" ></td>
              <td>${errors.maxParticipants}</td>
		
		</tr>
		<tr>
		     <td>預算:</td>
             <td><input type="text" id="budget" value="${param.budget}"></td>
             <td>${errors.budget}</td>
		</tr>
		<tr>
		     <td>付款方式:</td>
             <td>
             <select id="payment">
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
		   <td><textarea style="width: 250px" rows="4" cols="50" name="actIntro" id="actIntro" value="${param.actintro}"></textarea></td>
		   <td>${errors.eventinfo}</td>
		</tr>
	
	
			<tr><td><input type="submit" class="btn btn-primary" value="build" id="build"></td></tr>
			</table>
</form>
</div>
   
   
<div class="card" style="width: 400px;  padding-right: 40px; height: 360px ">

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
 			    <option value="拉斯維加斯">拉斯維加斯</option>
 				<option value="舊金山">舊金山</option>
		</select>
         <select id ="find-type" name="type">
  				<option></option>
  				<option value="美食">美食</option>
  				<option value="觀光">觀光</option>
  				<option value="購物">購物</option>
		</select>
		 
         <input type="button" id="save"  class="btn btn-primary" value="save" name="save">
		 <input type="button" id="search" class="btn btn-primary" value="search" >
		 <input type="button" class="btn btn-warning" id="btn" value="addItem"> 
		 <input type="button" id="hehe" class="btn btn-primary" value="addData">
		 <div style="padding-top: 25px" id="select"></div>
		 <div style="height: 100px; padding-top: 50px; display: none" id="sortable1" class="connectedSortable" ></div>
		 
		     
</p>
   
  </div>
</div>
      <a style="width: 400px;" class="btn btn-dark" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">How to go</a>
    
     <div p class="collapse" id="collapseExample" style="height: 100px;  float:right; width: 400px; "><div  id="map"></div><input style="margin: 0 ,auto;" type="button" class="btn btn-danger" id="route" value="route"></div>

	    </div>
	      
  </div>
<script>

    var txtId = 1;
    var testId =1;
    // add draggable DIV 
    $("#btn").on('click',function () {
    	 document.getElementById('select').style.display='';
        $("#select").append('<div style=" border:solid black 1px;" id="select'+ testId +'" class="connectedSortable" ><input type="datetime-local" id="startTime'+ testId +'"><input type="datetime-local" id="endTime'+ testId +'"><input type="button"  class="btn btn-outline-danger"  value="del" onclick="deltest('+testId+')"></div>'
        		);
        testId++;

    $( "#sortable1, #sortable2, .connectedSortable" ).sortable({
        connectWith: ".connectedSortable"
        }).disableSelection();
});
      
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
//          connection DataBase by Ajax
         $("#search").on('click',function () {
        	 document.getElementById('sortable1').style.display='';
        	
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
        	    	$("#sortable1").html('<div></div>');
                         for(var i =0; i< data.length; i++){
                     $("#sortable1").append('<li style="list-style:none" class="ui-state-default" id="'+ data[i].viewPointID + '" view ="'+ data[i].viewPointAddress + '">' + data[i].viewPointName + '</li>');                      
                         }   
                      },
        	    error: function (response) {
//                     alert("error");
                    },
        	    
        	});
        	  });
        
         </script>
      
         <script>
         
         $("#save").on('click',function () {
     	 
        	 var array =$("#select>div>li");

        	
        	 var data = [];
        	 var count = 1;
//         	    alert(document.getElementById("startTime"+count).value)
                for(i=0; i< array.length; i++){
//                 	alert(count);
                	var startedTime = document.getElementById("startTime"+count).value;
//                 	alert(document.getElementById("startTime1").value)
                	var endedTime = document.getElementById("endTime"+count).value
                	
                	
        		 data.push
        		 ({
    				 "actSNum":document.getElementById("actSNum").value,
        			 "startTime":startedTime,
    				 "endTime":endedTime,
    				 "viewPointID":array[i].getAttribute("id"),
    				 "markerID":count
        		 });
        		 count++;
//    
        	 } 
              $.ajax({
                     type : "post",
 	                 url : "${pageContext.request.contextPath}/trip.Controller",
 	                 data:JSON.stringify(data) ,
 	                 contentType: "application/json; charset=utf-8",
 	                 dataType: "json",
 	                 success: function (data) {
//                      alert("儲存成功");
                     	
                     },
                     error: function (response) {
//                      alert("error");
                     },
           
});
        	  
  });
         </script>
         
        </div>
        </div>
<script>
$(document).ready(function(){
	 $("#hehe").click(function(){
	        $("#actTitle").val("台北好玩");
	        $("#actCity").val("台北");
	        $('#actStartTime').val("2018-09-25T12:59");
	        $('#actEndTime').val("2018-09-30T12:59");
	        
	        $('#minParticipants').val("10");
	        $('#maxParticipants').val("120");
	        $('#budget').val("10100000");
	        $('#payment').val("VISA");
	       
	        $('#actJoinDeadLine').val("2018-09-10T12:59");
	        $('#actIntro').val("台北天龍國好玩好玩好好玩");
	        
	        $('#startTime1').val("2018-09-26T00:00");
	        $('#endTime1').val("2018-09-27T00:00");
	        $('#startTime2').val("2018-09-28T00:00");
	        $('#endTime2').val("2018-09-29T00:00");
	        $('#startTime3').val("2018-09-29T00:00");
	        $('#endTime3').val("2018-09-30T11:59");
	        
     
	    });
	


})

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