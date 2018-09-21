<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>${user.memberName}個人首頁</title>
<%@ include file="../Index/NewHeader.jsp"%>
<link rel="stylesheet" href="<c:url value="/css/profileSelf.css"/>">
<link rel="stylesheet" href="<c:url value="/css/newsFeed.css"/>">
<link rel="stylesheet" href="<c:url value="/css/proInfo.css"/>">
<script src="<c:url value="../js/porfileSelf.js"/>"></script>
</head>
<body>
    <div id="idTop" class="container">
        <!-- <img id="idCover" src="nature-design.jpg" alt="Cover"> -->
        <img id="idCover" src="<c:url value="/Images/Member/nature-design.jpg"/>" alt="Cover">
        <img id="idProPic" class="img-thumbnail" src="data:image/png;base64,${user.memberPicToBase64}" alt="Profile image" style="height: 16em;"/>
        <!-- <div id="idFollow">
            <button class="btn-o"><i class="fa fa-user-plus"></i> Friend </button> 
            <button class="btn-o"><i class="fa fa-plus"></i> Follow </button>
        </div> -->
        <div id="idUserBasic">
                <h2><i>${user.memberName}</i></h2>
                <h3><small><i class="fas fa-map-marker-alt"></i> California, USA</small></h3>
                <h3><small><i class="fas fa-briefcase"></i> Actress</small></h3>
        </div>
    </div>

    <div id="idMid" class="container">
        <div class="row">
            <div id="asideLeft" class="col-md-3">
                <div class="row">
                    <div class="nav flex-column nav-pills list-group" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link <c:if test="${noticeCount=='0'}"> <c:out value="active"/></c:if> text-right list-group-item" id="v-pills-news-tab" data-toggle="pill" href="#v-pills-news" role="tab" aria-controls="v-pills-news" aria-selected="true">
                            <span class="float-left"><i class="far fa-newspaper"></i>&nbsp;&nbsp;<strong>News Feed</strong></span> 125 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-social-tab" data-toggle="pill" href="#v-pills-social" role="tab" aria-controls="v-pills-social" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-friends"></i>&nbsp;&nbsp;<strong>Social</strong></span> 125
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-favorite-tab" data-toggle="pill" href="#v-pills-favorite" role="tab" aria-controls="v-pills-favorite" aria-selected="false">
                            <span class="float-left"><i class="fas fa-heart"></i>&nbsp;&nbsp;<strong>Favorite</strong></span> 37
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-circle"></i>&nbsp;&nbsp;<strong>Profile</strong></span> 13
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-privacy-tab" data-toggle="pill" href="#v-pills-privacy" role="tab" aria-controls="v-pills-privacy" aria-selected="false">
                            <span class="float-left"><i class="fas fa-key"></i>&nbsp;&nbsp;<strong>Privacy</strong></span> 37
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-messages-tab" data-toggle="pill" href="#v-pills-messages" role="tab" aria-controls="v-pills-messages" aria-selected="false">
                            <span class="float-left"><i class="fab fa-facebook-messenger"></i>&nbsp;&nbsp;<strong>Messages</strong></span> 78
                        </a>
                        <a class="nav-link text-right   <c:if test="${noticeCount!='0'}"> <c:out value="active"/>  </c:if>list-group-item" id="v-pills-notification-tab" data-toggle="pill" href="#v-pills-notification" role="tab" aria-controls="v-pills-notification" aria-selected="false">
                            <span class="float-left"><i class="far fa-envelope"></i>&nbsp;&nbsp;<strong>Notification</strong></span> <span id="spanNoticeCount1">${noticeCountFirst}</span>
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-friend-tab" data-toggle="pill" href="#v-pills-friend" role="tab" aria-controls="v-pills-friend" aria-selected="false">
                            <span class="float-left"><i class="fas fa-history"></i>&nbsp;&nbsp;<strong>Friends</strong></span> 78
                        </a>
                    </div>
               </div>
            </div>
            <div id="asideRight" class="col-md-8 tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade <c:if test="${noticeCount=='0'}"> <c:out value="show active"/>  </c:if>" id="v-pills-news" role="tabpanel" aria-labelledby="v-pills-news-tab">
                    <div class="row">
                        <h1>News Feed</h1>
                    </div>
                    <div class="row newsRow">
                            <div class="col">
                                <div class="content">
                                    <div class="poster">
                                        <img class="avatar"src="beauty-2014-05-elizabeth-olsen-makeup-main.jpg" alt="">
                                        <span>Elizabeth Olsen</span> <span> post a blog,</span> <span>at 2018/09/01 13:11:25</span>
                                    </div>
        
                                    <div class="postPhotoDiv">
                                            <img class="postPhoto" src="https://pbs.twimg.com/media/DQ6BIUCXkAI2Wwz.jpg" alt="Mountains">
                                            <h6 class="theAuthor">
                                                    <span>at New York City</span> 
                                                    <span class="starRating">
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star-half-alt checked"></i>
                                                    </span>
                                            </h6>
                                    </div>
                                    <div class="postText">
                                            <h3>ELIZABETH OLSEN WEARS ON-TREND LOOKS FOR GLAMOUR MEXICO</h3>
                                            <p>Actress Elizabeth Olsen lands the October 2017 cover of Glamour Mexico. Photographed by Rachell Smith, the blonde wears a teal striped dress from Valentino with Fendi red leather boots. Stylist Anna Katsanis (Atelier Management) chooses standout fashions from the fall collections for Elizabeth to wear. The ‘Ingrid Goes West’ star poses in designs from the likes of Miu Miu, Emilio Pucci and Prada. Gita Bass worked on hair for the shoot with Mark Townsend on makeup. / Manicure by Etsuko Shimatani</p>         
                                    </div>
                                    <div class="postButton">
                                        <button><i class="far fa-comment"></i>25 Comments</button>
                                        <button><i class="far fa-heart"></i>16 Saves</button>
                                        <button><i class="far fa-eye"></i>97 Views</button>
                                    </div>
                                    <hr>
                                    <div class="newComment">
                                        <div class="commentsPic">
                                            <img class="avatar"src="https://upload.wikimedia.org/wikipedia/commons/thumb/1/19/Elizabeth_Olsen_by_Gage_Skidmore.jpg/255px-Elizabeth_Olsen_by_Gage_Skidmore.jpg" alt="">
                                        </div>
                                        <div class="commentsText">
                                            <textarea rows="2" cols="65" class="commentsArea" name="userNewComment" placeholder="&nbsp;回應"></textarea>
                                            <button>留言</button>    
                                        </div> 
                                    </div>
                                    <div class="comments">
                                        <div class="commentsPic">
                                            <img class="avatar"src="https://d27o7y1r7mnbwc.cloudfront.net/media/uploads/clients/vanessa-kirby/images/2017-06-28_144040_kirby_vanessa_headshot_2.jpg" alt="">
                                        </div>
                                        <div class="commentsText">
                                            <span>Vanessa Kirby</span> <span>2018/09/03 13:30:06</span>
                                            <p>Vanessa Kirby is an English stage, television and film actress. She starred as Estella in the BBC adaptation of Great Expectations in 2011 and as Joanna in Richard Curtis' romantic comedy About Time in 2013.</p> 
                                        </div>    
                                    </div>
                                    <div class="comments">
                                            <div class="commentsPic">
                                                <img class="avatar"src="https://specials-images.forbesimg.com/imageserve/593b2e4b31358e03e55a0e8c/416x416.jpg" alt="">
                                            </div>
                                            <div class="commentsText">
                                                <span>Tom Cruise</span> <span>2018/09/02 19:10:06</span>
                                                <p>In 1976, if you had told fourteen year-old Franciscan seminary student Thomas Cruise Mapother IV that one day in the not too distant future he would be Tom Cruise, one of the top 100 movie stars of all time, he would have probably grinned and told you that his ambition was to join the priesthood.</p> 
                                            </div>    
                                    
                                    </div>
                                    <div class="viewMore">
                                        <button>View more</button>    
                                    </div>
                                </div>
                            </div>
                    </div>
                    <div class="row newsRow">
                            <div class="col">
                                <div class="content" id="myid">
                                    <div class="poster">
                                        <img class="avatar"src="beauty-2014-05-elizabeth-olsen-makeup-main.jpg" alt="">
                                        <span>Elizabeth Olsen</span> <span> join an event,</span> <span>at 2018/09/01 13:11:25</span>
                                    </div>
        
                                    <div class="postPhotoDiv">
                                            <img class="postPhoto" src="https://media.npr.org/assets/img/2017/12/01/wind-river-still-3_wide-5237b99cc312d612be06085784e03a1ecbb7a7c2-s1600-c85.jpg" alt="Mountains">
                                            <h6 class="theAuthor">
                                                    <img class="avatar"src="https://m.media-amazon.com/images/M/MV5BMTU2NTg1OTQzMF5BMl5BanBnXkFtZTcwNjIyMjkyMg@@._V1_UY317_CR6,0,214,317_AL_.jpg" alt="">
                                                    <span>Chris Evans</span> starts <span>ON SEPTEMBER 28, 2017</span> 
                                                    <span>at New York City</span> 
                                                    <span class="starRating">
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star checked"></i>
                                                            <i class="fas fa-star"></i>
                                                            <i class="fas fa-star"></i>
                                                    </span>
                                            </h6>
                                    </div>
                                    <div class="postText">
                                            <h3>Elizabeth Olsen On A 'Wind River' Oscar Campaign Without Weinstein</h3>
                                            <p>The campaign season has begun for Hollywood awards. Wind River is a widely-praised film that hinges on a murder mystery, but it's also a pointed and poignant story about the violence endured by many Native American women. The Weinstein Company had the rights to distribute Wind River, but following efforts by the filmmakers and the film's stars, the Weinstein name has been removed.</p>         
                                    </div>
                                    <div class="postButton">
                                        <button><i class="far fa-comment"></i>32 Comments</button>
                                        <button><i class="far fa-heart"></i>19 Follows</button>
                                        <button><i class="far fa-plus-square"></i>9 Jions</button>
                                    </div>
                                </div>
                            </div>
                    </div>
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
                                        <div class="tab-pane " id="basic">
                                            <form class="form" action="##" method="post" id="registrationForm">
                                                <hr>
                                                <div class="text-center">
                                                        <img class="avatarP img-circle img-thumbnail" src="http://ssl.gstatic.com/accounts/ui/avatar_2x.png" alt="avatar">
                                                        <h6>Upload a different photo...</h6>
                                                        <input type="file" class="text-center center-block file-upload">
                                                </div>
                                                <hr>
                                                <input type="hidden" id="memberID" name="memberID" value="sss">
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberAccount"><h4>Account</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control-plaintext" name="memberAccount" id="memberAccount" value="elizabetholsen1989" readonly></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberHierarchy"><h4>Hierarchy</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control-plaintext" name="memberHierarchy" id="memberHierarchy" value="unverified" readonly></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberName"><h4>Name</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control" name="memberName" id="memberName"  value="Elizabeth Olsen"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberNickName"><h4>NickName</h4></label></div>
                                                    <div class="col-sm-8"><input type="text" class="form-control" name="memberNickName" id="memberNickName" value="Scarlet Witch"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberGender"><h4>Sex</h4></label></div>
                                                    <div class="col-sm-8">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="memberGender" value="male" id="m1">
                                                            <label class="form-check-label" for="m1">Male</label> 
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="memberGender" value="female" id="f1">
                                                            <label class="form-check-label" for="f1">Female</label> 
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="memberGender" value="secret" id="k1">
                                                            <label class="form-check-label" for="k1">Keep Secret</label>
                                                        </div> 
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                        <div class="col-sm-3"><label for="memberTel"><h4>Phone</h4></label></div>
                                                        <div class="col-sm-8"><input type="text" class="form-control" name="memberTel" id="memberTel" value="0912345678"></div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-3"><label for="memberBirthday"><h4>Birthday</h4></label></div>
                                                    <div class="col-sm-8"><input type="date" class="form-control" name="memberBirthday" id="memberBirthday" value="1989-02-16"></div>
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
                                                <form class="form" action="##" method="post" id="advancedForm">
                                                    <hr>
                                                    <div class="text-center">
                                                        <img class="img-thumbnail avatarC" src="nature-design.jpg" alt="avatar">
                                                        <h6>Upload a different Cover...</h6>
                                                        <input type="file" class="text-center center-block file-upload">
                                                    </div>
                                                    <hr>
                                                    <input type="hidden" id="memberID" name="memberID" value="sss">
                                                    <div class="form-row">
                                                        <div class="form-group col-md-6">
                                                                <label for="job"><h4>Job</h4></label>
                                                                <input type="text" class="form-control" name="job" id="job" placeholder="works for" >
                                                        </div>
                                                        <div class="form-group col-md-6">
                                                                <label for="location"><h4>Location</h4></label>
                                                                <input type="text" class="form-control" name="location" id="location" placeholder="somewhere" >
                                                        </div>
                                                    </div>
                                                    <div class="form-group">
                                                        <label for="facebook"><h4>Facebook</h4></label>
                                                        <input type="text" class="form-control" id="facebook" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="instagram"><h4>Instagram</h4></label>
                                                            <input type="text" class="form-control" id="instagram" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="twitter"><h4>Twitter</h4></label>
                                                            <input type="text" class="form-control" id="twitter" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="googleplus"><h4>Google+</h4></label>
                                                            <input type="text" class="form-control" id="googleplus" placeholder="">
                                                    </div>
                                                    <div class="form-group">
                                                            <label for="youtube"><h4>Youtube</h4></label>
                                                            <input type="text" class="form-control" id="youtube" placeholder="">
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
                                        <form class="form" action="##" method="post" id="registrationForm">
                                                <hr>
                                                <input type="hidden" id="memberID" name="memberID" value="sss">
                                                <div class="form-row">
                                                    <div class="form-group col-md-6">
                                                            <label for="memberPwd"><h4>Password</h4></label>
                                                            <input type="text" class="form-control" name="memberPwd" id="memberPwd" placeholder="New Password" >
                                                    </div>
                                                    <div class="form-group col-md-6">
                                                            <label for="verifyPwd"><h4>Verify</h4></label>
                                                            <input type="text" class="form-control" name="verifyPwd" id="verifyPwd" placeholder="Verify" >
                                                    </div>
                                                </div>
                                                <div class="form-group row">
                                                    <div class="col-sm-2"><label for="memberMail"><h4>Email</h4></label></div>
                                                    <div class="col-sm-8"><input type="email" class="form-control" name="memberMail" id="memberMail" placeholder="Email"></div>
                                                    <div class="col-sm-2"><span id="sendMail">發送驗證信</sapn></div>
                                                </div>
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
                    </div> <!--v-pills-profile end-->
                    <div class=" tab-pane fade " id="v-pills-friend" role="tabpanel" aria-labelledby="v-pills-friend-tab">
                        <div class="row">
                            <h1>Friends</h1>
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
                        </div><!--friendsRow end-->
                    </div> <!--v-pills-friends end-->
                     <div class="tab-pane fade  <c:if test="${noticeCount!='0'}"> <c:out value="show active"/>  </c:if>" id="v-pills-notification" role="tabpanel" aria-labelledby="v-pills-notification-tab">
                        <div class="row">
                            <h1>Notification</h1>
                        </div>
                        <div class="row notificationRow">
                            <div class="col">
                                <div class="content">
                                <c:forEach var="notice" items="${noticeListFirst}" varStatus="loop">
	                            	<div class="alert alert-info fade in alert-dismissible show">
										 <button id="closeButton${loop.count}" type="button" onclick="isRead(${notice.noticeID})" class="close" data-dismiss="alert" aria-label="Close" >
										    <span aria-hidden="true" style="font-size:20px">&times;</span>
										  </button><a href="<c:url value="/ProfilePageGet?memberID=${notice.memberID_Sender}&lmi=${user.memberID}" />">${notice.messegeContent}</a>
										  <c:if test="${notice.actSNum=='0'and notice.caseID=='0'}">
										   	<div style="float: right">
										   	<span id="timeshow">${notice.noticeTime}</span>
										   	<div id="buttonStatus${loop.count}" style="display: inline-block;">
										  	<button id="confirmButton${loop.count}" type="button" onclick="friendAccept(${notice.memberID_Sender},${notice.memberID_Receiver})" class="btn btn-success btn-sm">接受</button>
										  	<button id="rejectButton${loop.count}" type="button" class="btn btn-danger btn-sm ">拒絕</button>
										  	</div>
										  	</div>
										  </c:if>
									</div>
                            	</c:forEach>
<!--                                 	<div class="alert alert-info fade in alert-dismissible show"> -->
<!-- 										 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										    <span aria-hidden="true" style="font-size:20px">&times;</span> -->
<!-- 										  </button>    <strong>Info!</strong> This alert box indicates a neutral informative change or action. -->
<!-- 									</div> -->
<!-- 									<div class="alert alert-info fade in alert-dismissible show"> -->
<!-- 										 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										    <span aria-hidden="true" style="font-size:20px">&times;</span> -->
<!-- 										  </button>    <strong>Info!</strong> This alert box indicates a neutral informative change or action. -->
<!-- 									</div> -->
<!-- 									<div class="alert alert-info fade in alert-dismissible show"> -->
<!-- 										 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										    <span aria-hidden="true" style="font-size:20px">&times;</span> -->
<!-- 										  </button>    <strong>Info!</strong> This alert box indicates a neutral informative change or action. -->
<!-- 									</div> -->
<!-- 									<div class="alert alert-info fade in alert-dismissible show"> -->
<!-- 										 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										    <span aria-hidden="true" style="font-size:20px">&times;</span> -->
<!-- 										  </button>    <strong>Info!</strong> This alert box indicates a neutral informative change or action. -->
<!-- 									</div> -->
<!-- 									<div class="alert alert-info fade in alert-dismissible show"> -->
<!-- 										 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										    <span aria-hidden="true" style="font-size:20px">&times;</span> -->
<!-- 										  </button>    <strong>Info!</strong> This alert box indicates a neutral informative change or action. -->
<!-- 									</div> -->
<!-- 									<div class="alert alert-info fade in alert-dismissible show"> -->
<!-- 										 <button type="button" class="close" data-dismiss="alert" aria-label="Close"> -->
<!-- 										    <span aria-hidden="true" style="font-size:20px">&times;</span> -->
<!-- 										  </button>    <strong>Info!</strong> This alert box indicates a neutral informative change or action. -->
<!-- 									</div> -->
									
                                </div><!--content-->
                            </div> <!--rol-->
                        </div><!-- notificationRow end-->
                    </div> <!--v-pills- notification end-->
            </div><!--asideRight end-->
        </div>
    </div> 
    
    <script>  
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
				setTimeout('clickClose(closeButtonId)',1500);
				
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
// $(window).scroll(function(){
//      //最後一頁scrollTop=body-window，50是預留空間
//      last=$("body").height()-$(window).height()-50
//      if($(window).scrollTop()>=last){
//         // alert('here');
//         $.get('test.txt', function(data) {
//             // alert(data);
//             $('#asideRight').append(data);

//         });
        
//      }
// })
$(document).ready(function() {
	 $('.fa-comment').parent().click(function(){
        $.get('testC.txt', function(data) {
            // alert(data);
            // $(this).parents(".content").append("hihihi");
              $('#myid').append(data);
        });
	 });

      $('#sendMail').click(function(){
         alert("驗證信已寄出，請至您的信箱查看");
        // $.get('testC.txt', function(data) {

        // });
	 });

     $('.commentsArea').keyup(function(){
        //  alert(this.rows);
        var lineNow=this.value.split('\n').length;
         if(lineNow>2){
            this.rows=lineNow;
         }
     });

})

    </script>

</body>
</html>