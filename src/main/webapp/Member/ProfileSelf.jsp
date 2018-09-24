<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MyProfilePage</title>
<%@ include file="/Index/NewHeader.jsp"%>
<%-- <link rel="stylesheet" href="<c:url value="/css/bootstrap.min.css"/>"> --%>
<link rel="stylesheet" href="<c:url value="/css/all.css"/>">

<%-- <script src="<c:url value="/js/jquery-3.3.1.min.js"/>"></script> --%>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script> -->
<%-- <script src="<c:url value="/js/bootstrap.min.js"/>"></script> --%>

<link rel="stylesheet" href="<c:url value="/css/profileSelf.css"/>">
<link rel="stylesheet" href="<c:url value="/css/newsFeed.css"/>">
<link rel="stylesheet" href="<c:url value="/css/proInfo.css"/>">
<link rel="stylesheet" href="<c:url value="/css/profileActBlog.css"/>">
<script src='<c:url value="/js/profileShared.js"/>'></script>
<c:import url="/js/profileNews_js.jsp"/>
<c:import url="/js/profileActBlog_js.jsp"/>
<c:import url="/js/profileSelf_js.jsp"/>
</head>
<body onload="reloadOnce()">

    <div id="idTop" class="container">
		<img id="idCover" src="<c:url value="data:image/png;base64,${subInfo.memberCoverToBase64}"/>" alt="Cover">  
        <img id="idProPic" class="img-thumbnail" src="data:image/png;base64,${user.memberPicToBase64}" alt="Profile image"/>       
        <div id="idUserBasic">
                <h2><i>${user.memberName}</i></h2>
                <h3><small><i class="fas fa-map-marker-alt"></i>${subInfo.memberLocation}</small></h3>
                <h3><small><i class="fas fa-briefcase"></i>${subInfo.memberJob}</small></h3>
        </div>
    </div>

    <div id="idMid" class="container">
        <div class="row">
            <div id="asideLeft" class="col-md-3">
                <div class="row">
                    <div class="nav flex-column nav-pills list-group" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link text-right list-group-item <c:if test="${page eq 'main'}"> <c:out value="active"/> </c:if>" id="v-pills-news-tab" data-toggle="pill" href="#v-pills-news" role="tab" aria-controls="v-pills-news" aria-selected="true">
                            <span class="float-left"><i class="far fa-newspaper"></i>&nbsp;&nbsp;<strong>News Feed</strong></span>  
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-activities-tab" data-toggle="pill" href="#v-pills-activities" role="tab" aria-controls="v-pills-activities" aria-selected="false">
                            <span class="float-left"><i class="fas fa-map-marker-alt"></i>&nbsp;&nbsp;<strong>My Activities</strong></span> 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-blogs-tab" data-toggle="pill" href="#v-pills-blogs" role="tab" aria-controls="v-pills-blogs" aria-selected="false">
                            <span class="float-left"><i class="fas fa-edit"></i>&nbsp;&nbsp;<strong>My Blogs</strong></span> 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-circle"></i>&nbsp;&nbsp;<strong>Profile</strong></span> 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-privacy-tab" data-toggle="pill" href="#v-pills-privacy" role="tab" aria-controls="v-pills-privacy" aria-selected="false">
                            <span class="float-left"><i class="fas fa-key"></i>&nbsp;&nbsp;<strong>Privacy</strong></span> 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-social-tab" data-toggle="pill" href="#v-pills-social" role="tab" aria-controls="v-pills-social" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-friends"></i>&nbsp;&nbsp;<strong>Social</strong></span> ${friendCount}
                        </a>
                        <a class="nav-link text-right list-group-item <c:if test="${page eq 'notice'}"> <c:out value="active"/>  </c:if>" id="v-pills-notification-tab" data-toggle="pill" href="#v-pills-notification" role="tab" aria-controls="v-pills-notification" aria-selected="false">
                            <span class="float-left"><i class="far fa-envelope"></i>&nbsp;&nbsp;<strong>Notification</strong></span> <span id="spanNoticeCount1"></span>
                        </a>
<!--                         <a class="nav-link text-right list-group-item" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false"> -->
<!--                             <span class="float-left"><i class="fab fa-facebook-messenger"></i>&nbsp;&nbsp;<strong>Messages</strong></span> (暫無) -->
<!--                         </a> -->
                    </div>
               </div>
            </div>
            <div id="asideRight" class="col-md-8 tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade <c:if test="${page eq 'main'}"><c:out value="show active"/>  </c:if>" id="v-pills-news" role="tabpanel" aria-labelledby="v-pills-news-tab">
                    <div class="row">
                        <h1>News Feed</h1>
                    </div>
                    <div id="showNews">
                    <!-- newsFeed generated here-->
                    </div>
                    <div id="loader"></div>
                    <div id="newsEnd" style="margin:50px 0;color:#1DA1F2; text-align:center; font-size:30px; font-weight:bolder;">
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
                </div> <!--v-pills-news end-->
                <div class="tab-pane fade" id="v-pills-profile" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                    <div class="row">
                        <h1>Profile</h1>
                    </div>
                    <div class="row profileRow">
                        <div class="col">
                            <div class="content">
                                <ul class="nav nav-tabs">
                                    <li class="nav-item">
                                        <a class="nav-link active" data-toggle="tab"  href="#basic">Basic</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" data-toggle="tab" href="#advance">Advanced</a>
                                    </li>
                                </ul>
                                <div class="tab-content">
                                        <div class="tab-pane active" id="basic">
                                            <form class="form" action="<c:url value="/updateMemberBasic.controller"/>" method="POST" enctype="multipart/form-data" id="registrationForm">
                                                <hr>
                                                <div class="text-center">
                                                	    <c:if test="${empty user.memberPicToBase64}">
                                                        <img class="avatarP img-circle img-thumbnail" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="avatar">
                                                       	</c:if>
                                                       	<c:if test="${not empty user.memberPicToBase64}">
	               										<img class="avatarP img-circle img-thumbnail" src="data:image/png;base64,${user.memberPicToBase64}" >
	          										  	</c:if>  
                                                        <h6>Upload a different photo...</h6>
                                                        <input type="file" name="memberPic" accept="image/*" class="text-center center-block file-upload">
                                                </div>
                                                <hr>
                                                <input type="hidden" id="memberID" name="memberID" value="${user.memberID}">
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberAccount"><h4>Account</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control-plaintext" name="memberAccount" id="memberAccount" value="${user.memberAccount}" readonly></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberHierarchy"><h4>Hierarchy</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control-plaintext" name="memberHierachy" id="memberHierachy" value="${user.memberHierachy}" readonly></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberName"><h4>Name</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control" name="memberName" id="memberName" value="${user.memberName}" required></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberNickName"><h4>NickName</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control" name="memberNickName" id="memberNickName" value="${user.memberNickName}"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberGender"><h4>Sex</h4></label></div>
                                                    <div class="col-sm-8">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="memberGender" value="M" id="m1" <c:if test="${user.memberGender=='M'}"> <c:out value="checked"/></c:if>>
                                                            <label class="form-check-label" for="m1">Male</label> 
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="memberGender" value="F" id="f1" <c:if test="${user.memberGender=='F'}"> <c:out value="checked"/></c:if>>
                                                            <label class="form-check-label" for="f1">Female</label> 
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="memberGender" value="S" id="k1" <c:if test="${user.memberGender=='S'}"> <c:out value="checked"/></c:if>>
                                                            <label class="form-check-label" for="k1">Keep Secret</label>
                                                        </div> 
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                        <div class="col-sm-3"><label for="memberTel"><h4>Phone</h4></label></div>
                                                        <div class="col-sm-8"><input type="text" class="form-control" name="memberTel" id="memberTel" value="${user.memberTel}" pattern="\d{8,12}"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberBirthday"><h4>Birthday</h4></label></div>
                                                    <div class="col-sm-8"><input type="date" class="form-control" name="memberBirthDay" id="memberBirthDay" value="${user.memberBirthdayToString}"></div>
                                                </div>

                                                <div class="form-group"><div class="col-xs-12 text-center">
                                                	<button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                	<button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                                </div>
                                                </div>
                                            </form>
                                            <hr>
                                        </div><!--/tab-pane-->
                                        <div class="tab-pane" id="advance">
                                                <form class="form" action="<c:url value="/updateSubMember.controller"/>" method="post" enctype="multipart/form-data" id="advancedForm">
                                                    <hr>
                                                    <div class="text-center">
                                                    	<c:if test="${empty subInfo.memberCoverToBase64}">
                                                        	<img class="img-thumbnail avatarC" src="<c:url value="/Images/Member/nature-design.jpg"/>" alt="avatar">
                                                       	</c:if>
                                                       	<c:if test="${not empty subInfo.memberCoverToBase64}">
	               											<img class="img-thumbnail avatarC" src="<c:url value="data:image/png;base64,${subInfo.memberCoverToBase64}"/>" alt="avatar">
	          										  	</c:if>    
                                                        <h6>Upload a different Cover...</h6>
                                                        <input type="file" name="memberCover" accept="image/*" class="text-center center-block file-upload">
                                                    </div>
                                                    <hr>
                                                    <input type="hidden" id="memberID" name="memberID" value="${user.memberID}">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                                <label for="job"><h4>Job</h4></label>
                                                                <input type="text" class="form-control" name="memberJob" id="memberJob" value="${subInfo.memberJob}" placeholder="works for" >
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                                <label for="location"><h4>Location</h4></label>
                                                                <input type="text" class="form-control" name="memberLocation" id="memberLocation" value="${subInfo.memberLocation}" placeholder="somewhere" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="facebook"><h4>Facebook</h4></label>
                                                        <input type="text" class="form-control" name="memberFB" id="memberFB" value="${subInfo.memberFB}" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="instagram"><h4>Instagram</h4></label>
                                                            <input type="text" class="form-control" name="memberIG" id="memberIG" value="${subInfo.memberIG}" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="twitter"><h4>Twitter</h4></label>
                                                            <input type="text" class="form-control" name="memberTwitter" id="memberTwitter" value="${subInfo.memberTwitter}" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="googleplus"><h4>Google+</h4></label>
                                                            <input type="text" class="form-control" name="memberGooglePlus" id="memberGooglePlus" value="${subInfo.memberGooglePlus}" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="youtube"><h4>Youtube</h4></label>
                                                            <input type="text" class="form-control" name="memberYT" id="memberYT" value="${subInfo.memberYT}" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                        <div class="col-xs-12 text-center">
                                                            <br>
                                                                <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                                <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            
                                        </div><!--tab-pane-->
                                </div><!--tab-Content-->
                            </div><!--content-->
                        </div> <!--rol-->
                    </div><!--profileRow end-->
                </div> <!--v-pills-profile end-->
                <div class="tab-pane fade" id="v-pills-privacy" role="tabpanel" aria-labelledby="v-pills-privacy-tab">
                        <div class="row">
                            <h1>Privacy</h1>
                        </div>
                        <div class="row privacyRow">
                            <div class="col">
                                <div class="content">
                                        <form class="form" action="<c:url value="/updateMemberPrivacy.controller"/>" method="POST" id="privacyForm">
                                                <hr>
                                                <input type="hidden" id="memberID" name="memberID" value="sss">
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                            <label for="memberPwd"><h4>Password</h4></label>
                                                            <input type="password" class="form-control" name="memberPwd" id="memberPwd" placeholder="New Password" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                            <label for="password"><h4>Verify</h4></label>
                                                            <input type="password" class="form-control" name="verifyPwd" id="verifyPwd" placeholder="Verify" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-2"><label for="memberMail"><h4>Email</h4></label></div>
                                                    <div class="col-sm-8"><input type="email" class="form-control" name="memberMail" id="memberMail" value="${user.memberMail}" placeholder="Email"></div>
                                               		<div class="col-sm-2"><span id="sendMail">發送驗證信</sapn></div>
                                                </div>
                                                <div id="privacyMsg" style="text-align:center; margin-bottom:15px;" >&nbsp;</div>
                                                <div class="form-group"><div class="col-xs-12 text-center">
                                                <button class="btn btn-lg btn-success" type="submit"><i class="glyphicon glyphicon-ok-sign"></i> Save</button>
                                                <button class="btn btn-lg" type="reset"><i class="glyphicon glyphicon-repeat"></i> Reset</button>
                                                </div>
                                                </div>
                                            </form>
                                            <hr>
                                </div><!--content-->
                            </div> <!--rol-->
                        </div><!--profileRow end-->
                    </div> <!--v-pills-privacy end-->
                    <div class="tab-pane fade" id="v-pills-activities" role="tabpanel" aria-labelledby="v-pills-activities-tab">
 						<h1 class="text-center mb-3">My Activities</h1>
 						<h2 class="text-center mb-3 actType">Hosted&nbsp;(&nbsp;<span id="sumHosted">0</span>&nbsp;)</h2>
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
					    <h2 class="text-center mb-3 actType">Joined&nbsp;(&nbsp;<span id="sumJoined">0</span>&nbsp;)</h2>
        				<div id="actJoined" class="carousel slide" data-ride="carousel" data-interval="false">
	           				<ol class="carousel-indicators">
								<!-- carousel-indicators generated here -->
		   			        </ol>
	           				<div class="carousel-inner">
	          					<!-- Joined Activities cards generated here -->
				                <a class="carousel-control-prev" href="#actJoined" role="button" data-slide="prev">
					                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                <span class="sr-only">Previous</span>
				                </a>
				                <a class="carousel-control-next" href="#actJoined" role="button" data-slide="next">
					                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                <span class="sr-only">Next</span>
				                </a>
				            </div> <!-- carousel-inner end -->
			       		</div> <!--  actJoined end -->
			       		<h2 class="text-center mb-3 actType">Followed&nbsp;(&nbsp;<span id="sumFollowed">0</span>&nbsp;)</h2>
        				<div id="actFollowed" class="carousel slide" data-ride="carousel" data-interval="false">
	           				<ol class="carousel-indicators">
								<!-- carousel-indicators generated here -->
		   			        </ol>
	           				<div class="carousel-inner">
	          					<!-- Followed Activities cards generated here -->
				                <a class="carousel-control-prev" href="#actFollowed" role="button" data-slide="prev">
					                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                <span class="sr-only">Previous</span>
				                </a>
				                <a class="carousel-control-next" href="#actFollowed" role="button" data-slide="next">
					                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                <span class="sr-only">Next</span>
				                </a>
				            </div> <!-- carousel-inner end -->
			       		</div> <!--  actFollowed end -->
               		</div> <!--v-pills-activities end-->
               		
               		<div class="tab-pane fade" id="v-pills-blogs" role="tabpanel" aria-labelledby="v-pills-blogs-tab">
 						<h1 class="text-center mb-3">My Blogs</h1>
 						<h2 class="text-center mb-3 actType">Posted&nbsp;(&nbsp;<span id="sumPosted">0</span>&nbsp;)</h2>
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
					    <h2 class="text-center mb-3 actType">Saved&nbsp;(&nbsp;<span id="sumSaved">0</span>&nbsp;)</h2>
        				<div id="bgSaved" class="carousel slide" data-ride="carousel" data-interval="false">
	           				<ol class="carousel-indicators">
								<!-- carousel-indicators generated here -->
		   			        </ol>
	           				<div class="carousel-inner">
	          					<!-- Joined Activities cards generated here -->
				                <a class="carousel-control-prev" href="#bgSaved" role="button" data-slide="prev">
					                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
					                <span class="sr-only">Previous</span>
				                </a>
				                <a class="carousel-control-next" href="#bgSaved" role="button" data-slide="next">
					                <span class="carousel-control-next-icon" aria-hidden="true"></span>
					                <span class="sr-only">Next</span>
				                </a>
				            </div> <!-- carousel-inner end -->
			       		</div> <!--  bgSaved end -->				
               		</div> <!--v-pills-blogs end-->
                	<div class="tab-pane fade  <c:if test="${page eq 'notice'}"> <c:out value="show active"/>  </c:if>" id="v-pills-notification" role="tabpanel" aria-labelledby="v-pills-notification-tab">
	                    <div class="row">
	                        <h1>Notification</h1>
	                    </div>
	                    <div class="row notificationRow">
	                        <div class="col">
	                            <div class="content">
	                                <c:forEach var="noticeFirst" items="${noticeListFirst}" varStatus="loop">
	                              		<div class="alert alert-info fade in alert-dismissible show">
	           								<button id="closeButton${loop.count}" type="button" onclick="isRead(${noticeFirst.noticeID})" class="close" data-dismiss="alert" aria-label="Close" >
	              							<span aria-hidden="true" style="font-size:20px">&times;</span>
	            							</button><a href="<c:url value="/ProfilePageGet?memberID=${noticeFirst.memberID_Sender}&lmi=${user.memberID}" />">${noticeFirst.messegeContent}</a>
	            							<c:if test="${noticeFirst.actSNum=='0'and noticeFirst.caseID=='0'}">
									        	<div style="float: right">
										            <span id="timeshow">${noticeFirst.noticeTime}</span>
										            <div id="buttonStatus${loop.count}" style="display: inline-block;">
										            <button id="confirmButton${loop.count}" type="button" onclick="friendAccept(${noticeFirst.memberID_Sender},${noticeFirst.memberID_Receiver})" class="btn btn-success btn-sm">接受</button>
										            <button id="rejectButton${loop.count}" type="button" class="btn btn-danger btn-sm ">拒絕</button>
	             								</div>
	             							</div>
	            							</c:if>
	            							<c:if test="${noticeFirst.actSNum!='0'and noticeFirst.caseID=='0'}">
									        	<div style="float: right">
										            <span id="timeshow">${noticeFirst.noticeTime}</span>
										            <div id="buttonStatus${loop.count}" style="display: inline-block;">
										            <button id="confirmButton${loop.count}" type="button" onclick="ActAccept(${noticeFirst.memberID_Sender},${noticeFirst.memberID_Receiver},${noticeFirst.actSNum})" class="btn btn-success btn-sm">接受</button>
										            <button id="rejectButton${loop.count}" type="button" class="btn btn-danger btn-sm ">拒絕</button>
	             								</div>
	             							</div>
	            							</c:if>
	         						</div>
                              </c:forEach>
                            </div><!--content-->
                        </div> <!--rol-->
                    </div><!-- notificationRow end-->
                </div> <!--v-pills- notification end-->
                <div class=" tab-pane fade " id="v-pills-social" role="tabpanel" aria-labelledby="v-pills-social-tab">
                        <div class="row">
                            <h1>Social</h1>
                        </div>
                        <div class="row friendRow">
                            <div class="col">
                                <div class="content" style="background-color: white;border-radius:5px;">
		                             <div class="iconList">
			                             <c:forEach var="friend" items="${friendList}">
			                             <div class="iconList_Icon">
				                             <a href="<c:url value="/ProfilePageGet?memberID=${friend.memberID }&lmi=${user.memberID}" />">
				                              <img src="data:image/png;base64,${friend.memberPicToBase64}" style="width:150px;height: 150px;border-radius:50%">
				                              <p>${friend.memberName}</p>
			                             </a>
			                             </div>
			                             </c:forEach>
		              				</div>
                            	</div><!--content-->
                            </div> <!--rol-->
                        </div><!--socialRow end-->
                    </div> <!--v-pills-social end-->               
            </div><!--asideRight end-->
        </div>
    </div>
    <a id="back-to-top" href="#" class="btn btn-primary btn-lg back-to-top" role="button" title="back-to-top" data-toggle="tooltip" data-placement="left"><i class="fas fa-chevron-up"></i></a>
<script type="text/javascript">
function reloadOnce() {
    if(!window.location.hash) {
        window.location = window.location + '#loaded';
        window.location.reload();
    }
}
 
   function friendAccept(senderID, receiverID){
    alert(senderID + ' - ' +receiverID);
    var buttonId = event.target.id; //當下按鈕ID
    var str = buttonId
    var laststr =str.substring(str.length-1,str.length)
    closeButtonId = 'closeButton' + laststr
    $.getJSON("${pageContext.request.contextPath}/answerFriendReqController",{"memberID":senderID,"lmi":receiverID},function(data){
     alert(data.status)
     if(data.status=="回覆交友邀請成功"){
   var c = document.getElementById(buttonId).parentNode.id //當下按鈕找父層ID
   $("#"+c).html("<button type='button' class='btn btn-success btn-sm ' disabled>已接受</button>");
   setTimeout('clickClose(closeButtonId)',1000);
   
  }
    }).fail(function(){
     alert("回覆失敗")
    })
   }
function ActAccept(senderID, receiverID , actSNum){
	    alert(senderID + ' - ' +receiverID);
	    var buttonId = event.target.id; //當下按鈕ID
	    var str = buttonId
	    var laststr =str.substring(str.length-1,str.length)
	    closeButtonId = 'closeButton' + laststr
	    $.getJSON("${pageContext.request.contextPath}/answerActReqController",{"memberID":senderID,"lmi":receiverID,"actSNum":actSNum},function(data){
	     alert(data.status)
	     if(data.status=="回覆活動邀請成功"){
	   var c = document.getElementById(buttonId).parentNode.id //當下按鈕找父層ID
	   $("#"+c).html("<button type='button' class='btn btn-success btn-sm ' disabled>已接受</button>");
	   setTimeout('clickClose(closeButtonId)',1000);
	   
	  }
	    }).fail(function(){
	     alert("回覆失敗")
	    })
	   }
function clickClose(id){
 document.getElementById(id).click();
}
  
   function isRead( noticeID ){
    $.getJSON("${pageContext.request.contextPath}/updateNotice",{"noticeID":noticeID},function(data){
     var count = $('#spanNoticeCount').html();
     if(data.status=="已讀"){
      $('#spanNoticeCount').html(count-1);
      $('#spanNoticeCount1').html(count-1);
  }
    })
   }
</script>
</body>
</html>