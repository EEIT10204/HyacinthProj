<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<<<<<<< HEAD
<title>${userInfo.memberName}個人首頁</title>
	<%@ include file="/Index/NewHeader.jsp"%>
    <!-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script> -->
    <script src='<c:url value="/js/memberDetail.js"/>'></script>

    <link rel="stylesheet" href='<c:url value="/css/profileMember.css"/>' >
    <link rel="stylesheet" href='<c:url value="/css/newsFeed.css"/>'>
=======
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
<c:import url="/js/profileHist_js.jsp"/>
<c:import url="/js/profileActBlog_js.jsp"/>

>>>>>>> 5e9c1901954e65d5053af8c3ed94f3bd2d2b9ef9
</head>
<body>
    <div id="idTop" class="container">
        <!-- <img id="idCover" src="nature-design.jpg" alt="Cover"> -->
        <img id="idCover" src='<c:url value="/Images/Member/nature-design.jpg"/>' alt="Cover">
        <img id="idProPic" class="img-thumbnail" src='data:image/png;base64,${userInfo.memberPicToBase64}' alt="Profile image"/>
        <div id="idFollow">
            <button id="FriendButton" class="btn-o"><i class="fa fa-user-plus"></i> &nbsp;&nbsp;加入好友 </button> 
<!--             <button class="btn-o"><i class="fa fa-plus"></i> Follow </button> -->
        </div>
        <div id="idUserBasic">
                <h2><i>${userInfo.memberName}&nbsp;&nbsp;&nbsp;&nbsp;<small>${userInfo.memberNickName}</small></i></h2>
                <h3><small><i class="fas fa-map-marker-alt"></i> California, USA</small></h3>
                <h3><small><i class="fas fa-briefcase"></i> Actress</small></h3>
        </div>
    </div>

    <div id="idMid" class="container">
        <div class="row">
            <div id="asideLeft" class="col-md-3">
                <div class="row">
                   <ul id="accordion" class="accordion">
<<<<<<< HEAD
                       <li>
                           <div id="idSocialBar" class="col col_4">
                               <div class="edit-pic">
                                   <a href="https://web.facebook.com/" target="_blank" class="fab fa-facebook" style="color: #3b5998; border: 1px solid #3b5998;"></a>
                                   <a href="https://www.instagram.com/elizabetholsenofficial/" target="_blank" class="fab fa-instagram"  style="color: #833ab4;border: 1px solid #833ab4;"></a>
                                   <a href="https://twitter.com/elizabetholsenn" target="_blank" class="fab fa-twitter"  style="color: #1da1f2;border: 1px solid #1da1f2;"></a>
                                   <a href="https://plus.google.com/" target="_blank" class="fab fa-google"  style="color: #dd4b39; border: 1px solid #dd4b39;"></a>
                                   <a href="https://www.youtube.com/" target="_blank" class="fab fa-youtube"  style="color: #ff0000; border: 1px solid #ff0000;"></a>
                               </div>
                           </div>
                       </li>
                       <li>
                        <div class="nav flex-column nav-pills list-group" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                         <a class="nav-link text-right list-group-item" id="v-pills-profile-tab" data-toggle="pill" href="#v-pills-profile" role="tab" aria-controls="v-pills-profile" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-circle"></i>&nbsp;&nbsp;<strong>About</strong></span> 13
                        </a>
                        <a class="nav-link active text-right list-group-item" id="v-pills-news-tab" data-toggle="pill" href="#v-pills-news" role="tab" aria-controls="v-pills-news" aria-selected="true">
                            <span class="float-left"><i class="far fa-newspaper"></i>&nbsp;&nbsp;<strong>News Feed</strong></span> 125 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-social-tab" data-toggle="pill" href="#v-pills-social" role="tab" aria-controls="v-pills-social" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-friends"></i>&nbsp;&nbsp;<strong>Social</strong></span> 125
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-favorite-tab" data-toggle="pill" href="#v-pills-favorite" role="tab" aria-controls="v-pills-favorite" aria-selected="false">
                            <span class="float-left"><i class="fas fa-heart"></i>&nbsp;&nbsp;<strong>Favorite</strong></span> 37
                        </a>
=======
                    <li>
                      <div id="idSocialBar" class="col col_4">
                         <div class="edit-pic">
                              <a href="https://web.facebook.com/" target="_blank" class="fab fa-facebook" style="color: #3b5998; border: 1px solid #3b5998;"></a>
                              <a href="https://www.instagram.com/elizabetholsenofficial/" target="_blank" class="fab fa-instagram"  style="color: #833ab4;border: 1px solid #833ab4;"></a>
                              <a href="https://twitter.com/elizabetholsenn" target="_blank" class="fab fa-twitter"  style="color: #1da1f2;border: 1px solid #1da1f2;"></a>
                              <a href="https://plus.google.com/" target="_blank" class="fab fa-google"  style="color: #dd4b39; border: 1px solid #dd4b39;"></a>
                              <a href="https://www.youtube.com/" target="_blank" class="fab fa-youtube"  style="color: #ff0000; border: 1px solid #ff0000;"></a>
                         </div>
                      </div>
                     </li>
                    </ul>
                    <div class="nav flex-column nav-pills list-group" id="v-pills-tab" role="tablist" aria-orientation="vertical">
                        <a class="nav-link active text-right list-group-item" id="v-pills-history-tab" data-toggle="pill" href="#v-pills-history" role="tab" aria-controls="v-pills-history" aria-selected="true">
                            <span class="float-left"><i class="far fa-newspaper"></i>&nbsp;&nbsp;<strong>News Feed</strong></span> 125 
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-records-tab" data-toggle="pill" href="#v-pills-records" role="tab" aria-controls="v-pills-posts" aria-selected="false">
                            <span class="float-left"><i class="fas fa-pen-square"></i>&nbsp;&nbsp;<strong>Records</strong></span> 37
                        </a>
                        <a class="nav-link text-right list-group-item" id="v-pills-social-tab" data-toggle="pill" href="#v-pills-social" role="tab" aria-controls="v-pills-social" aria-selected="false">
                            <span class="float-left"><i class="fas fa-user-friends"></i>&nbsp;&nbsp;<strong>Social</strong></span> 125
                        </a>           
>>>>>>> 5e9c1901954e65d5053af8c3ed94f3bd2d2b9ef9
                    </div>
                    <li>
                   </ul>
               </div>
            </div>
            <div id="asideRight" class="col-md-8 tab-content" id="v-pills-tabContent">
                <div class="tab-pane fade show active" id="v-pills-news" role="tabpanel" aria-labelledby="v-pills-news-tab">
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
                <div class="tab-pane fade" id="v-pills-social" role="tabpanel" aria-labelledby="v-pills-profile-tab">
                    <div class="row">
                        <h1>Social 好友</h1>
                        <hr>
                    </div>
                    <div class="row socialRow">
                        <div class="col">
                            <div class="content" style="background-color: white;border-radius:5px;">
<<<<<<< HEAD
                            	<div class="iconList">
                            	<c:forEach var="friend" items="${friendList}">
                            	<div class="iconList_Icon">
                            	<a href="<c:url value="/ProfilePageGet?memberID=${friend.memberID}&lmi=${user.memberID}" />">
                            		<img src="data:image/png;base64,${friend.memberPicToBase64}" style="width:150px;height: 150px;border-radius:50%">
                            		<p>${friend.memberName}</p>
                            	</a>
                            	</div>
                            	</c:forEach>
        					</div>
                        
=======
	                             <div class="iconList">
		                             <c:forEach var="friend" items="${friendList}">
		                             <div class="iconList_Icon">
			                             <a href="<c:url value="/ProfilePageGet?memberID=${friend.memberID}&lmi=${user.memberID}" />">
			                              <img src="data:image/png;base64,${friend.memberPicToBase64}" style="width:150px;height: 150px;border-radius:50%">
			                              <p>${friend.memberName}</p>
			                             </a>
		                             </div>
	                             </c:forEach>
	             				</div>
>>>>>>> 5e9c1901954e65d5053af8c3ed94f3bd2d2b9ef9
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
                                        
                                            
                                </div><!--content-->
                            </div> <!--rol-->
                        </div><!--profileRow end-->
                    </div> <!--v-pills-profile end-->
            </div><!--asideRight end-->
        </div>
    </div> 
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
    	//alert("run 好友按鈕")
    	function GetQueryString(name){
   	     var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
   	     var r = window.location.search.substr(1).match(reg);
   	     if(r!=null)return  unescape(r[2]); return null;
   		}
    	var memberID = GetQueryString("memberID");
    	var lmi = GetQueryString("lmi");
    	var content = $('#FriendButton').text();
    	if(content=="  刪除好友 "){
    			//alert("run 刪除好友")
				$.getJSON("${pageContext.request.contextPath}/deleteFriendController",{"memberID":memberID,"lmi":lmi},function(data){
					//alert(data.status);
					if(data.status=="刪除成功"){
						location.reload();
					}
				})
    	}else if(content=="   加入好友 "){
    		alert("run 加入好友")
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
</body>
</html>