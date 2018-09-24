<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<jsp:include page="../Index/NewHeader.jsp" />
<title>${event.actTitle}</title>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no">
<meta charset="utf-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/actcomment.css">
<script src="${pageContext.request.contextPath}/js/actInsertMessage.js"></script>
<script src="${pageContext.request.contextPath}/js/actUpdateMessage.js"></script>

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

            <div style="width: 400px; height: 400px" id="map"></div>
    <div class="card" style="width: 600px;">
   <div class="card-body" style="background-color: gray;">
    <h5 class="card-title"> ${event.actTitle}</h5>
    <p class="card-text"> <div class="host">
                        <strong>${event.actCity}</strong>
                    </div>
                <div class="speakers">
                    <strong>舉辦人</strong>
<%--                     <span><a href="${pageContext.request.contextPath}/ProfilePageGet?memberID=${member.memberID}">${member.memberName}</a></span> --%>
                    <span><a href='${pageContext.request.contextPath}/ProfilePageGet?memberID=${user.memberID }&lmi=${user.memberID }&page=main' >${member.memberName}</a></span>
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
                                                         多少人參加囉:${event.participantsNow}位
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
  <div class="card card-body" style="padding-right: 5rem">
      <table>
	  <c:forEach var ="trip" items="${ trip }" varStatus="status">
	  <tr><td>${trip.startTime} ~ ${trip.endTime} </td><td>${beanbean[status.count-1].viewPointName}</td></tr>
	  <td><input class="address" type="hidden" value="${beanbean[status.count-1].viewPointAddress}"></td>
	  </c:forEach>
	  </table>	  
	 <input type="button" id="route" value="Check Route">
  </div>
</div>

    <div id="btns" style="background-color:white; margin:auto; text-align: center;">
   
		<button type="button" id="LikeOrDisLike"class="btn btn-primary"  value="${likebottuntype}">${likebottuntype}</button>
		<button type="button" class="btn btn-success" id="AttendOrNot"  value="${attendbottuntype}">${attendbottuntype}</button> <!-- ${attendStatus} -->

		<button type="button" class="btn btn-danger"  id="sendReport" value="sendReport" data-toggle="modal" data-target="#reportModal">Report</button>

		<button type="button" class="btn btn-warning" id="invite" value="invite">Invite</button>
		
		<input type="hidden" id= "num" value="${useractSNum}">
		<input type="hidden" id= "mem" value="${userid}">
	</div>
		<div id = "friends"></div>
	</div>
	

<div class="textboadrss">	
<button class="button button4">
<h2>留言板</h2>
</button>
</div>
	<!-- 留言板 -->
<div class="messOuts">
      <div class="mess1s">
        <div class="messUsers"><img src="data:image/png;base64,${user.memberPicToBase64}"/></div>
        <div class="messNames">${user.memberName}</div>
      </div>
      <form action="<c:url value="/Act/ActDisplay.comment"/>" method="get">
<%--         <form action="<c:url value="/Act/ACCommentInsertController?actSNum=?" />" method="get"> --%>
                  <div class="form-group">
                    <label for="exampleFormControlTextarea1">Leave Message</label>
                    <textarea class="form-control" id="exampleFormControlTextarea1" rows="3" name="commentContent"></textarea>
                  </div>
                  <div class="buttonTs">
                      <button type="submit" class="btn-primary" style="margin-left: 650px; margin-bottom: 20px;" id="sendbuttom">Send out</button>
<!--                           <input type="hidden" name="commentContent" value="1"> -->
                          <input type="hidden" name="memberID" value="${user.memberID}">
                          <input type="hidden" name="actSNum" value="${param.actSNum}">
                          
                          
                  </div>
                  </form>
                  <div class="mess2s">
                    <!-- <div class="mess3"></div>
                    <div class="mess4"></div> -->
                  <div class="form-group">
                      <label for="exampleFormControlInput1">All Message</label>
                      
                      <div class="uuus">
                      <c:forEach var="obj" items="${ACComment}">
                      <form action="<c:url value="/ACCommentUpdate.Controller"/>" method="get">
                      <div id="messAs">
                          <img src="data:image/png;base64,${obj[1].memberPicToBase64}"/>
                          <h6>${obj[1].memberName} </h6>
<%--                           <h6>${obj[0].ACCommentID}</h6> --%>

                          <div class="messBs">
                          <input type="text" class="form-control" disabled value="${obj[0].commentContent}"
                          name="commentContent">
                        </div>
                        
                        <c:if test= "${user.memberID == obj[1].memberID}"> 
                        <div class="updates"> 
                        <span class="updatebuttons" style="width:70px;height:25px">修改</span>            
                        <input class="updatebuttons" style="width:70px;height:25px" type="hidden" value="送出">
                        <input type="hidden" name="ACCommentID" value="${obj[0].ACCommentID}">
                        <input type="hidden" name="actSNum" value="${param.actSNum}">
                         <input type="hidden" name="memberID" value="${user.memberID}">
                        </div>
                        </c:if>
<%--                           <input type="text" name="testmember" value="${param.actSNum}"> --%>    
                      </div>
                        </form>    
                      </c:forEach>
                      </div>
                      <div >
                          <p class="flips">顯示更多留言</p>
                          </div>
                      </div>
                    </div>
                  </div>

		<!-- Report Model Start -->
  <div class="modal fade" id="reportModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
        <img src="${pageContext.request.contextPath}/Images/Index/warning.png" style="height:20px;margin-top:10px;">
        <h4 class="modal-title" style="margin-left:12px;">檢舉</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>          
        </div>
        <div class="modal-body">
        	<form>
       		<span style="margin-left:5px;font-size:16px;">理由:</span> <br>
       		<textArea style="vertical-align:top; width:400px;margin-left:55px;margin-top:10px;height:200px;" id="reportReason" ></textArea>
       		<input type="text" id="reportMember" value="<c:if test="${user != null}">${user.memberID}</c:if>" style="display:""/> <input type="text" id="reportReferID" style="display:"" value="${event.actID}"/>
       		</form>
        </div>
        <div class="modal-footer">
        	<button onclick="sendReport()" type="button" class="btn btn-primary " data-dismiss="modal" style="color:white;">送出</button>
          <button type="button" class="btn btn-primary" data-dismiss="modal" style="color:white;">取消</button>
        </div>
      </div>   
    </div>
  </div> <!-- Report Modal end -->

		
<script>
$( document ).ready(function() {
// 	<c:if test = "${user==null}"></c:if>
// 	alert("memberID=" + ${user.memberID});
// 	alert("eventMemberID=" + ${event.memberID});
	
	
//     var user = <c:choose><c:when test="${user != null}">${user};</c:when><c:otherwise>null;</c:otherwise></c:choose>
    var memID = '${user.memberID}';
    
    var eventMemID=${event.memberID}
    if(memID != ""){
    	
    	if( memID == eventMemID ){
    		
        	$('#LikeOrDisLike').attr('style', 'display:none');
    		$('#AttendOrNot').attr('style', 'display:none');
    		
    	}
    }
    else{
    	$('#btns').attr('style', 'display:none');
    }
	
	
// 	<c:if test = " ${user.memberID == event.memberID}">$('#btns2').empty();</c:if>

// if (memID== null){
// 	$('#btns').attr('style', 'display:none');
// }

	
	
	
 $('#LikeOrDisLike').on('click',this.value ,function () {
	 
// 	 alert(this.value);
// if( ${ user != null })
// 		  var loginMemberID = ${user.memberID};
	


	 if(this.value == 'Like'){
		 var process = true;
	    	$('#LikeOrDisLike').text("disLike").attr("value","disLike");
	 } else if (this.value == 'disLike'){
		 var process = false;
	    	$('#LikeOrDisLike').text("Like").attr("value","Like");
	  }
// 	 else if (this.value == 'none'){
// 		 var process = 'none';
// 	    	$('#LikeOrDisLike').html("<h3>please login !<h3>");
// 	 }
	 
    $.ajax({
	    type : "post",
	    url : "${pageContext.request.contextPath}/memberact.Controller",
	    data:JSON.stringify({
	    	"actSNum":document.getElementById("num").value,
	    	"memberID":document.getElementById("mem").value,
	    	"isLike":process    	
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
	 else if (this.value == 'disLike'){
		 var process = false;
	    	$('#AttendOrNot').text("Attend").attr("value","Attend");
	  } 
// 	 else if (this.value == 'none'){
// 		 var process = 'none';
// 	    	$('#AttendOrNot').html("<h3>please login !<h3>");
// 	 }
	 
	 
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

<script type="text/javascript">
$(document).ready(function(){
	alert("run button check");
if('${user.memberID}'==""){
$("#sendbuttom").html("<button type='submit' class='btn-secondary style='margin-left: 650px; margin-bottom: 20px; border-radius:20px' id='sendbuttom' disabled='disabled'>請先登入</button>")
$(".messUsers").html("<div class='messUsers'><img src='${pageContext.request.contextPath}/Images/Index/user.png'/></div>")
};
});

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

    <c:forEach var='beanbean' items='${beanbean}'>
	
	var lat = parseFloat(${beanbean.latitue});
	var lng = parseFloat(${beanbean.longtitue});			

	var positon = {}; 
	var data = {};
	positon.lat = lat;
	positon.lng = lng;
	
				var marker = new google.maps.Marker({
				
					position: {lat: lat, lng: lng},
					map: map, 
				
				});
				var content =  '<span style="color:#003377;font-weight:bold"></span><br>';
				var contentString ='<span style="font-weight:bold;font-size:15px;">${beanbean.viewPointName}</span><br>'+
				'<span style="font-weight:bold;font-size:15px;">${beanbean.viewPointAddress}</span><br>';
				
				attachSecretMessage(marker,content,contentString) ;
	</c:forEach>
// 	 var infowindow = new google.maps.InfoWindow({
//          content: contentString
//        });
	 
// 	 marker.addListener('click', function() {
//          infowindow.open(map, marker);
//        });
	
		function attachSecretMessage(marker, content,contentString) {
			var infowindow = new google.maps.InfoWindow({
				content:contentString ,

			});
			 var a = -1;
			infowindow.open(marker.get('map'), marker);
			google.maps.event.addListener(marker, 'click', function() {
				a= a*-1;
				if (a > 0) {
					infowindow.setContent(content);
					infowindow.open(marker.get('map'), marker);
				}else {
					 
					 infowindow.setContent(contentString);
					 infowindow.open(marker.get('map'), marker);
				}
			
			});
			
			
			
		
		}
				

    
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
		
// 		 if( ${ user != null })
		  var loginMemberID = '${user.memberID}';
		 
	    $.ajax({
		    type : "post",
		    url : "${pageContext.request.contextPath}/invitefriends.controller",
		    data:JSON.stringify({
		    	"memberID": loginMemberID//document.getElementById("mem").value,
		    }),
		    
		    contentType: "application/json; charset=utf-8",
		    dataType: "json",
		    success: function (data) {
		    	$("#friends").html('<div></div>');
		    if(data.length==0){
		    	$("#friends").append("<div>你沒有朋友不要再按了</h3>");
		    }else{
		    	for(var i =0; i< data.length; i++){
		    	  $("#friends").append( data[i].memberName +' <input type="button" value = "sendInvite" onclick="function()"><br>' );    
	              }
		    }
		    },
		    error: function (response) {
	            alert("error");
	            },
		    
		});
	 }); 
	 
})

	//-----------Report Ajax --------
		function sendReport(){
		var reportReason = $('#reportReason').val();
		var reportMember = $('#reportMember').val();
		var referID = $('#reportReferID').val();
// 		alert(reportReason + '-' + reportMember + '-' + referID);
		
		$.ajax({
			type : "get",
			url : "${pageContext.request.contextPath}/report.Send",
			data: {"reportMember":reportMember, "referID":referID,"reportReason":reportReason},
			contentType: "application/json; charset=utf-8",
			dataType: "text",
			success: function (data) {
// 					alert(data);
			swal({
			  type: 'success',
			  title: '檢舉成功',
			  showConfirmButton: false,
			  timer: 1500
			})
				},
			error: function (response) {
				$('#detailReason').empty();
				alert("detail error");
				
				swal({
					  type: 'error',
					  title: '檢舉有誤',
					  text: '請重新發送檢舉',
					})
				},				
		});	
	}
</script>
</body>
<jsp:include page="../Index/Footer.jsp" />
</html>