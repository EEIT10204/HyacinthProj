<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>ProfileMember</title>
<%@ include file="/Index/NewHeader.jsp"%>

<%-- <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>"> --%>
<link rel="stylesheet" href="<c:url value="/css/all.css"/>">

<%-- <script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<%-- <script src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>

<link rel="stylesheet" href="<c:url value="/css/profileSelf.css"/>">
<link rel="stylesheet" href="<c:url value="/css/newsFeed.css"/>">
<link rel="stylesheet" href="<c:url value="/css/profileActBlog.css"/>">
<script src='<c:url value="/js/memberDetail.js"/>'></script>
<script src='<c:url value="/js/profileShared.js"/>'></script>
<c:import url="/js/profileHist_js.jsp"/>
<c:import url="/js/profileActBlog_js.jsp"/>


</head>
<body>
    <div id="idTop" class="container">
		<img id="idCover" src="<c:url value="data:image/png;base64,${subUserInfo.memberCoverToBase64}"/>" alt="Cover">
        <img id="idProPic" class="img-thumbnail" src='data:image/png;base64,${userInfo.memberPicToBase64}' alt="Profile image"/>
        <div id="idFollow">
            <button id="FriendButton" class="btn-o"><i class="fa fa-user-plus"></i>   加入好友 </button> 
<!--             <button class="btn-o"><i class="fa fa-plus"></i> Follow </button> -->
        </div>
        <div id="idUserBasic">
                <h2><i>${userInfo.memberName}&nbsp;&nbsp;&nbsp;&nbsp;<small>${userInfo.memberNickName}</small></i></h2>
                <h3><small><i class="fas fa-map-marker-alt"></i> ${subUserInfo.memberLocation}</small></h3>
                <h3><small><i class="fas fa-briefcase"></i>${subUserInfo.memberJob}</small></h3>
        </div>
    </div>

    <div id="idMid" class="container">
        <div class="row">
            <div id="asideLeft" class="col-md-3">
                <div class="row">
                   <ul id="accordion" class="accordion">
                    <li>
                      <div id="idSocialBar" class="col col_4">
                         <div class="edit-pic">
                              <a href="${subUserInfo.memberFB}" target="_blank" class="fab fa-facebook" style="color: #3b5998; border: 1px solid #3b5998;"></a>
                              <a href="${subUserInfo.memberIG}" target="_blank" class="fab fa-instagram"  style="color: #833ab4;border: 1px solid #833ab4;"></a>
                              <a href="${subUserInfo.memberTwitter}" target="_blank" class="fab fa-twitter"  style="color: #1da1f2;border: 1px solid #1da1f2;"></a>
                              <a href="${subUserInfo.memberGooglePlus}" target="_blank" class="fab fa-google"  style="color: #dd4b39; border: 1px solid #dd4b39;"></a>
                              <a href="${subUserInfo.memberYT}" target="_blank" class="fab fa-youtube"  style="color: #ff0000; border: 1px solid #ff0000;"></a>
                         </div>
                     	
                      </div>
                     </li>
                    </ul>
                    <div class="nav flex-column nav-pills list-group" >
                     	<a class="nav-link text-right list-group-item clickMe"  style="cursor: pointer;" role="tab" aria-controls="" aria-selected="true">
                            <span class="float-left"><i class="fa fa-globe"></i>&nbsp;&nbsp;<strong >About Me</strong></span><i id="up" class="fa fa-chevron-down" style="margin-top:5px"></i>
                        </a>
                         <div id="aboutMe" class="panel" >
							  <ul style="text-align: left;">
							  	<li><i class="fa fa-calendar left-none" style="margin-right: 10px"></i> ${userInfo.memberBirthdayToString}</li>
							  	<hr>
	                            <li><i class="fa fa-envelope" style="margin-right: 10px"></i> ${userInfo.memberMail}</li>
	                            <hr>
	                            <li><i class="fa fa-phone" style="margin-right: 10px"></i> ${userInfo.memberTel} </li>
                        		</ul>
                        </div>
                        <a class="nav-link active text-right list-group-item" id="v-pills-history-tab" data-toggle="pill" href="#v-pills-history" role="tab" aria-controls="v-pills-history" aria-selected="true">
                            <span class="float-left"><i class="far fa-newspaper"></i>&nbsp;&nbsp;<strong>News Feed</strong></span>  
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-records-tab" data-toggle="pill" href="#v-pills-records" role="tab" aria-controls="v-pills-posts" aria-selected="false">
                            <span class="float-left"><i class="fas fa-pen-square"></i>&nbsp;&nbsp;<strong>Records</strong></span> 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-social-tab" data-toggle="pill" href="#v-pills-social" role="tab" aria-controls="v-pills-social" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-friends"></i>&nbsp;&nbsp;<strong>Social</strong></span> ${friendCount}
                        </a>           
                    </div>
               </div>
            </div>
            <div id="asideRight" class="col-md-8 tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-history" role="tabpanel" aria-labelledby="v-pills-history-tab">
                    <div class="row">
                    <h1>News Feed</h1>
                    </div>
                    <div id="showHist">
                    <!-- History generated here-->
                    </div>
                    <div id="loaderHist"></div>
                    <div id="histEnd" style="margin:50px 0;color:#1DA1F2; text-align:center; font-size:30px; font-weight:bolder;">
					</div>
					<div class="modal" id="listModalCenter" tabindex="-1" role="dialog" aria-labelledby="listModalCenterTitle" aria-hidden="true">
				        <div class="modal-dialog modal-dialog-centered modal-sm" role="document">
				            <div class="modal-content" style="border-radius: 15px;">
				                <div class="modal-header">
				                    <h5 class="modal-title" id="listModalLongTitle">Modal List</h5>
				                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
				                        <span aria-hidden="true">&times;</span>
				                    </button>
				                </div>
				                <div class="modal-body" id="myModalBody">
				                	<!-- modal-list generated here-->
				                </div>
				            </div>
				        </div>
				    </div> <!--  modal list end -->
                </div> <!--v-pills-history end--> 
				<div class="tab-pane fade" id="v-pills-records" role="tabpanel" aria-labelledby="v-pills-records-tab">
 						<h1 class="text-center mb-3">Records</h1>
 						<h2 class="text-center mb-3 actType">Hosted Activities&nbsp;(&nbsp;<span id="sumHosted">0</span>&nbsp;)</h2>
						<div id="actHosted" class="carousel slide" data-ride="carousel" data-interval="false">
				            <ol class="carousel-indicators">
								<!-- carousel-indicators generated here -->
				            </ol>
				            <div class="carousel-inner">
								<!-- Hosted Activities cards generated here -->
				                <a class="carousel-control-prev" href="#actHosted" role="button" data-slide="prev">
					                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                <span class="sr-only">Previous</span>
				                </a>
				                <a class="carousel-control-next" href="#actHosted" role="button" data-slide="next">
					                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                <span class="sr-only">Next</span>
				                </a>
				            </div> <!-- carousel-inner end -->
					    </div> <!--  actHosted end -->
					  	<h2 class="text-center mb-3 actType">Posted Blogs&nbsp;(&nbsp;<span id="sumPosted">0</span>&nbsp;)</h2>
						<div id="bgPosted" class="carousel slide" data-ride="carousel" data-interval="false">
				            <ol class="carousel-indicators">
								<!-- carousel-indicators generated here -->
				            </ol>
				            <div class="carousel-inner">
								<!-- Posted Blogs cards generated here -->
				                <a class="carousel-control-prev" href="#bgPosted" role="button" data-slide="prev">
					                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                <span class="sr-only">Previous</span>
				                </a>
				                <a class="carousel-control-next" href="#bgPosted" role="button" data-slide="next">
					                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                <span class="sr-only">Next</span>
				                </a>
				            </div> <!-- carousel-inner end -->
					    </div> <!--  bgPosted end -->
               	</div> <!--v-pills-activities end-->
                <div class="tab-pane fade" id="v-pills-social" role="tabpanel" aria-labelledby="v-pills-social-tab">
                    <div class="row">
                        <h1>Social 好友</h1>
                        <hr>
                    </div>
                    <div class="row socialRow">
                        <div class="col">
                            <div class="content" style="background-color: white;border-radius:5px;">
	                             <div class="iconList">
		                             <c:forEach var="friend" items="${friendList}">
		                             <div class="iconList_Icon">
			                             <a href="<c:url value="/ProfilePageGet?memberID=${friend.memberID}&lmi=${user.memberID}&page=main" />">
			                              <img src="data:image/png;base64,${friend.memberPicToBase64}" style="width:150px;height: 150px;border-radius:50%">
			                              <p>${friend.memberName}</p>
			                             </a>
		                             </div>
	                             </c:forEach>
	             				</div>
                            </div><!--content-->
                        </div> <!--col-->
                    </div><!--socialRow end-->
                </div> <!--v-pills-social end-->
               
               
            </div><!--asideRight end-->
        </div>
    </div> 
	<a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="back-to-top" data-toggle="tooltip" data-placement="left"><i class="fas fa-chevron-up"></i></a>


<script > //判斷好友狀況
    $( document ).ready(function() {   
     function GetQueryString(name){
          var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
          var r = window.location.search.substr(1).match(reg);
          if(r!=null){
           return  unescape(r[2]);
          }else{
           return null;
          }
     }
     var memberID = GetQueryString("memberID");
     var lmi = GetQueryString("lmi");
     alert(memberID)
     alert(lmi)
        $.getJSON("${pageContext.request.contextPath}/checkFriendShipController",{"memberID":memberID,"lmi":lmi},function(data){
         alert(data.status)
         if(data.status=="好友"){
          $('#FriendButton').html("<i class='fa fa-user-times'></i>&nbsp;&nbsp;刪除好友 ")
         }else if(data.status=="已傳送邀請"){
          $('#FriendButton').html("<i class='fa fa-user-clock'></i>&nbsp;&nbsp;已傳送邀請 ")
          $('#FriendButton').prop("disabled")
         }else if(data.status=="是否接受好友邀請"){
          $('#FriendButton').html("<i class='fa fa-user-clock'></i>&nbsp;&nbsp;等待接受邀請")
          $('#FriendButton').prop("disabled")
         }
        }).fail(function(){
         alert("無資料")
          
        })
    })
    </script>
    <script type="text/javascript">//好友動作
    if('${user}'!=""){
    $('#FriendButton').click(function(){
//      alert("run 好友按鈕")
	     function GetQueryString(name){
	         var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
	         var r = window.location.search.substr(1).match(reg);
	         if(r!=null)return  unescape(r[2]); return null;
	     }
	     var memberID = GetQueryString("memberID");
	     var lmi = GetQueryString("lmi");
	     var content = $('#FriendButton').text();
			alert(content);
	     if(content=="  刪除好友 "){
	//        alert("run 刪除好友")
			    $.getJSON("${pageContext.request.contextPath}/deleteFriendController",{"memberID":memberID,"lmi":lmi},function(data){
				     alert(data.status);
				     if(data.status=="刪除成功"){
				      location.reload();
			     	}
	    	})
	     }
	     else if(content=="   加入好友 "){
	      	alert("run 加入好友");
		       $.getJSON("${pageContext.request.contextPath}/sendFriendReqController",{"memberID":memberID,"lmi":lmi},function(data){
		     	alert(data.status);
		     	if(data.status=="寄送邀請成功"){
			      location.reload();
			     }
   		    })
  		 }
  
 	})
    }
    </script>
    <script>
     $('.clickMe').on("click",function() {
        /* Toggle between adding and removing the "active" class,
        to highlight the button that controls the panel */
       var orginalDisplay=$('#aboutMe').css('display');
       if(orginalDisplay=="none"){
    	   $('#aboutMe').slideToggle(500);
    	   $("#up").attr("class", "fa fa-chevron-up");
    	   $('#aboutMe').css("display","block");
       }else{
    	   $("#up").attr("class", "fa fa-chevron-down");
    	   $('#aboutMe').css("display","none");
       }
     
     })
    </script>
</body>
</html>