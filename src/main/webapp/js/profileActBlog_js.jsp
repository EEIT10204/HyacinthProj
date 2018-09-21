<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<script>
$(document).ready(function(){

	$('#v-pills-activities-tab').click(function(){
// 		alert("AAA");
		$('.carousel-item').remove();
		$('.carousel-indicators').empty();
		getHosts(userID);
		getJoins();
		getFollows();
	});
	
	$('#v-pills-blogs-tab').click(function(){
// 		alert("BBB");
		$('.carousel-item').remove();
		$('.carousel-indicators').empty();
		getPosts(userID);
		getSaves();
	});
	
	$('#v-pills-records-tab').click(function(){
		alert("CCC");
		$('.carousel-item').remove();
		$('.carousel-indicators').empty();
		getHosts(memberId);
		getPosts(memberId);
	});
// 	$('#actHosted .carousel-control-next').click(function(){
// 		var pc = parseInt($('#actHosted .carousel-indicators .active').attr('data-slide-to'))+1;
// // 		alert(pc);
// // 		alert((pageHostsController-1)*3);
// 		if(pc==(pageHostsController-1)*3){
// 			alert("AAA");
// 	 		getHosts();
// 		}
// 	});
	
});

	var userPath ="&lmi="+"${user.memberID}";
	var memberPath = "${pageContext.request.contextPath}/ProfilePageGet?memberID=";
	var actPath    = "${pageContext.request.contextPath}/actdisplay.controller?actSNum=";
	var blogPath   = "${pageContext.request.contextPath}/Blog/BlogMember.controller?blogSNum=";

	var userID = "${user.memberID}";
	var pageHostsController = 1;
	var pageHostsCarousel = 0;
	
function getHosts(personId){
	 
	 $.getJSON('${pageContext.request.contextPath}/showHosts.do',{"memberID":personId,"page":pageHostsController},function(datas){
// 		 alert(JSON.stringify(datas));
//          alert(datas.length);
		 $('#sumHosted').text(datas.length);
		
		 //建立li
		 var liFragment = $(document.createDocumentFragment());
		 var start = pageHostsCarousel;
		 var end = pageHostsCarousel+(datas.length/3);
		 for(var i=start;i<end;i++){
			 var liIndicator = $('<li data-target="#actHosted"></li>').attr('data-slide-to',i);
			 if(i==pageHostsCarousel){ liIndicator = liIndicator.addClass('active');}
			 liFragment.append(liIndicator);
		 }
		 $('#actHosted .carousel-indicators').append(liFragment);

		 var fragmentB = $(document.createDocumentFragment());
		 var fragmentS = $(document.createDocumentFragment());
         $.each(datas,function(idx,getObj){
        	 
//         	 var imgAuthPic=$('<img>').addClass('avatar').attr('src','');
//         	 var spanAuth=$('<span></span>').text();
//         	 var h6TheAuth2=$('<h6></h6>').addClass('theAuthor2').append(imgAuthPic,spanAuth);
//         	 var aAuth = $('<a></a>').attr('href',memberPath+getObj.memberID).append(h6TheAuth2);
        	 var imgActCov=$('<img>').addClass('card-img-top img-fluid').attr('src',"data:image/png;base64,"+getObj.actPhoto);
        	 
         	 var h4Title = $('<h4></h4>').addClass('card-title').text(getObj.actTitle);
        	 var spanLocation = $('<span></span>').text('@'+getObj.actCity);
//         	 alert(idx+"-"+getObj.actStatus);
        	 if(getObj.actStatus=='inProgress'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusOn').text('進行中'); 
            	 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj.actEndTime).toLocaleString()+'<br/>結束');
        	 }else if(getObj.actStatus=='finished'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusOff').text('已結束'); 
        		 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj.actEndTime).toLocaleString()+'<br/>結束');
        	 }else if(getObj.actStatus=='prepare'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusPre').text('籌備中'); 
        		 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj.actStartTime).toLocaleString()+'<br/>開始');
        	 }
        	 
        	 var pText1=$('<p></p>').addClass('card-text').append(spanLocation,spanActStatus);

        	 var pText2=$('<p style="text-align:right; font-size:16px;"></p>').addClass('card-text').append(smallTime);
        	 var divCardBody=$('<div></div>').addClass('card-body').append(h4Title,pText1,pText2);
        	 var divCard=$('<div></div>').addClass('card').append(imgActCov,divCardBody);
        	 var aLink=$('<a></a>').attr('href',actPath+getObj.actSNum).append(divCard);
        	 var divCardCol =$('<div></div>').addClass('col-md-4 cardCol').append(aLink);
        	 
        	 fragmentS.append(divCardCol);
        	 if((idx+1)%3==0 || idx==(datas.length-1)){
        		 var divCardCol =$('<div></div>').addClass('row cardRow').append(fragmentS);
        		 var divCarouselItem = $('<div></div>').addClass('carousel-item').append(divCardCol);
        		 if(idx==2 || ( idx<3 && (idx==datas.length-1))){divCarouselItem= divCarouselItem.addClass('active');}
        		 fragmentB.append(divCarouselItem);
        		 pageHostsCarousel=pageHostsCarousel+1;
        	 } 	 
         });
         
         $('#actHosted .carousel-control-prev').before(fragmentB);
//          pageHostsController=pageHostsController+1;
                 
	 }).fail(function(){
		 alert('已是最末筆資料');
	 });
	
}

	var pageJoinsController = 1;
	var pageJoinsCarousel = 0;

function getJoins(){
	 $.getJSON('${pageContext.request.contextPath}/showJoins.do',{"memberID":userID,"page":pageJoinsController},function(datas){ 
// 		 alert(JSON.stringify(datas));
//      	 alert(datas.length);
     	 $('#sumJoined').text(datas.length);
     	 
     	 //建立li
		 var liFragment = $(document.createDocumentFragment());
		 var start = pageJoinsCarousel;
		 var end = pageJoinsCarousel+(datas.length/3);
		 for(var i=start;i<end;i++){
			 var liIndicator = $('<li data-target="#actJoined"></li>').attr('data-slide-to',i);
			 if(i==pageJoinsCarousel){ liIndicator = liIndicator.addClass('active');}
			 liFragment.append(liIndicator);
		 }
		 $('#actJoined .carousel-indicators').append(liFragment);

		 var fragmentB = $(document.createDocumentFragment());
		 var fragmentS = $(document.createDocumentFragment());
         $.each(datas,function(idx,getObj){
        	 
        	 if(getObj[2].memberPic){
        	 	var imgAuthPic=$('<img>').addClass('avatar').attr('src',"data:image/png;base64,"+getObj[2].memberPic);
        	 }else{
        		var imgAuthPic=$('<img>').addClass('avatar').attr('src',"data:image/png;base64,"+fbPic);
        	 }
        	 var spanAuth=$('<span></span>').text(getObj[2].memberName);
        	 var h6TheAuth2=$('<h6></h6>').addClass('theAuthor2').append(imgAuthPic,spanAuth);
        	 var aAuth = $('<a></a>').attr('href',memberPath+getObj[1].memberID).append(h6TheAuth2);
        	 
        	 var imgActCov=$('<img>').addClass('card-img-top img-fluid').attr('src',"data:image/png;base64,"+getObj[1].actPhoto);
        	 
        	 var h4Title = $('<h4></h4>').addClass('card-title').text(getObj[1].actTitle);
        	 var spanLocation = $('<span></span>').text('@'+getObj[1].actCity);
//         	 alert(idx+"-"+getObj.actStatus);
        	 if(getObj[1].actStatus=='inProgress'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusOn').text('進行中'); 
            	 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].actEndTime).toLocaleString()+'<br/>結束');
        	 }else if(getObj[1].actStatus=='finished'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusOff').text('已結束'); 
        		 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].actEndTime).toLocaleString()+'<br/>結束');
        	 }else if(getObj[1].actStatus=='prepare'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusPre').text('籌備中'); 
        		 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].actStartTime).toLocaleString()+'<br/>開始');
        	 }
        	 
        	 var pText1=$('<p></p>').addClass('card-text').append(spanLocation,spanActStatus);

        	 var pText2=$('<p style="text-align:right; font-size:16px;"></p>').addClass('card-text').append(smallTime);
        	 var divCardBody=$('<div></div>').addClass('card-body').append(h4Title,pText1,pText2);
        	 var divCard=$('<div></div>').addClass('card').append(aAuth,imgActCov,divCardBody);
        	 var aLink=$('<a></a>').attr('href',actPath+getObj[1].actSNum).append(divCard);
        	 var divCardCol =$('<div></div>').addClass('col-md-4 cardCol').append(aLink);
        	 
        	 fragmentS.append(divCardCol);
        	 if((idx+1)%3==0 || idx==(datas.length-1)){
        		 var divCardCol =$('<div></div>').addClass('row cardRow').append(fragmentS);
        		 var divCarouselItem = $('<div></div>').addClass('carousel-item').append(divCardCol);
        		 if(idx==2 || ( idx<3 && (idx==datas.length-1))){divCarouselItem= divCarouselItem.addClass('active');}
        		 fragmentB.append(divCarouselItem);
        		 pageJoinsCarousel=pageJoinsCarousel+1;
        	 } 	 
         });
         
         $('#actJoined .carousel-control-prev').before(fragmentB);
         
	 }).fail(function(){
		 alert('已是最末筆資料');
	 });
}

var pageFollowsController = 1;
var pageFollowsCarousel = 0;

function getFollows(){
	 $.getJSON('${pageContext.request.contextPath}/showFollows.do',{"memberID":userID,"page":pageFollowsController},function(datas){ 
// 		 alert(JSON.stringify(datas));
//      	 alert(datas.length);
     	 $('#sumFollowed').text(datas.length);
     	 
     	 //建立li
		 var liFragment = $(document.createDocumentFragment());
		 var start = pageFollowsCarousel;
		 var end = pageFollowsCarousel+(datas.length/3);
		 for(var i=start;i<end;i++){
			 var liIndicator = $('<li data-target="#actFollowed"></li>').attr('data-slide-to',i);
			 if(i==pageFollowsCarousel){ liIndicator = liIndicator.addClass('active');}
			 liFragment.append(liIndicator);
		 }
		 $('#actFollowed .carousel-indicators').append(liFragment);

		 var fragmentB = $(document.createDocumentFragment());
		 var fragmentS = $(document.createDocumentFragment());
         $.each(datas,function(idx,getObj){
        	 
        	 if(getObj[2].memberPic){
         	 	var imgAuthPic=$('<img>').addClass('avatar').attr('src',"data:image/png;base64,"+getObj[2].memberPic);
         	 }else{
         		var imgAuthPic=$('<img>').addClass('avatar').attr('src',"data:image/png;base64,"+fbPic);
         	 }
        	 var spanAuth=$('<span></span>').text(getObj[2].memberName);
        	 var h6TheAuth2=$('<h6></h6>').addClass('theAuthor2').append(imgAuthPic,spanAuth);
        	 var aAuth = $('<a></a>').attr('href',memberPath+getObj[1].memberID).append(h6TheAuth2);
        	 var imgActCov=$('<img>').addClass('card-img-top img-fluid').attr('src',"data:image/png;base64,"+getObj[1].actPhoto);
        	 
        	 var h4Title = $('<h4></h4>').addClass('card-title').text(getObj[1].actTitle);
        	 var spanLocation = $('<span></span>').text('@'+getObj[1].actCity);
//         	 alert(idx+"-"+getObj.actStatus);
        	 if(getObj[1].actStatus=='inProgress'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusOn').text('進行中'); 
            	 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].actEndTime).toLocaleString()+'<br/>結束');
        	 }else if(getObj[1].actStatus=='finished'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusOff').text('已結束'); 
        		 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].actEndTime).toLocaleString()+'<br/>結束');
        	 }else if(getObj[1].actStatus=='prepare'){
        		 var spanActStatus = $('<span></span>').addClass('actStatusPre').text('籌備中'); 
        		 var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].actStartTime).toLocaleString()+'<br/>開始');
        	 }
        	 
        	 var pText1=$('<p></p>').addClass('card-text').append(spanLocation,spanActStatus);

        	 var pText2=$('<p style="text-align:right; font-size:16px;"></p>').addClass('card-text').append(smallTime);
        	 var divCardBody=$('<div></div>').addClass('card-body').append(h4Title,pText1,pText2);
        	 var divCard=$('<div></div>').addClass('card').append(aAuth,imgActCov,divCardBody);
        	 var aLink=$('<a></a>').attr('href',actPath+getObj[1].actSNum).append(divCard);
        	 var divCardCol =$('<div></div>').addClass('col-md-4 cardCol').append(aLink);
        	 
        	 fragmentS.append(divCardCol);
        	 if((idx+1)%3==0 || idx==(datas.length-1)){
        		 var divCardCol =$('<div></div>').addClass('row cardRow').append(fragmentS);
        		 var divCarouselItem = $('<div></div>').addClass('carousel-item').append(divCardCol);
        		 if(idx==2 || ( idx<3 && (idx==datas.length-1))){divCarouselItem= divCarouselItem.addClass('active');}
        		 fragmentB.append(divCarouselItem);
        		 pageFollowsCarousel=pageFollowsCarousel+1;
        	 } 	 
         });
         
         $('#actFollowed .carousel-control-prev').before(fragmentB);
         
	 }).fail(function(){
		 alert('已是最末筆資料');
	 });
}

/*----------------------BLOG-------------------------*/

var pagePostsController = 1;
var pagePostsCarousel = 0;

function getPosts(personId){
 
 $.getJSON('${pageContext.request.contextPath}/showPosts.do',{"memberID":personId,"page":pagePostsController},function(datas){
//		 alert(JSON.stringify(datas));
//      alert(datas.length);
	 $('#sumPosted').text(datas.length);
	
	 //建立li
	 var liFragment = $(document.createDocumentFragment());
	 var start = pagePostsCarousel;
	 var end = pagePostsCarousel+(datas.length/3);
	 for(var i=start;i<end;i++){
		 var liIndicator = $('<li data-target="#bgPosted"></li>').attr('data-slide-to',i);
		 if(i==pagePostsCarousel){ liIndicator = liIndicator.addClass('active');}
		 liFragment.append(liIndicator);
	 }
	 $('#bgPosted .carousel-indicators').append(liFragment);

	 var fragmentB = $(document.createDocumentFragment());
	 var fragmentS = $(document.createDocumentFragment());
     $.each(datas,function(idx,getObj){
    	 
//     	 var imgAuthPic=$('<img>').addClass('avatar').attr('src','');
//     	 var spanAuth=$('<span></span>').text();
//     	 var h6TheAuth2=$('<h6></h6>').addClass('theAuthor2').append(imgAuthPic,spanAuth);
//     	 var aAuth = $('<a></a>').attr('href',memberPath+getObj.memberID).append(h6TheAuth2);
    	 var imgActCov=$('<img>').addClass('card-img-top img-fluid').attr('src',"data:image/png;base64,"+getObj.blogCover);
    	 
     	 var h4Title = $('<h4></h4>').addClass('card-title').text(getObj.blogTitle);
    	 var spanLocation = $('<span></span>').text('@'+getObj.blogCity);
//     	 alert(idx+"-"+getObj.actStatus);

    	 var spanActStatus = $('<span></span>').addClass('blogViews').text(getObj.blogView+' views'); 
    	 if(getObj.updateTime){
         	var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj.updateTime).toLocaleString()+'<br/>編輯');
    	 }else{
    	    var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj.blogReleaseTime).toLocaleString()+'<br/>發佈');
    	 }
    	 
    	 var pText1=$('<p></p>').addClass('card-text').append(spanLocation,spanActStatus);

    	 var pText2=$('<p style="text-align:right; font-size:16px;"></p>').addClass('card-text').append(smallTime);
    	 var divCardBody=$('<div></div>').addClass('card-body').append(h4Title,pText1,pText2);
    	 var divCard=$('<div></div>').addClass('card').append(imgActCov,divCardBody);
    	 var aLink=$('<a></a>').attr('href',blogPath+getObj.blogSNum).append(divCard);
    	 var divCardCol =$('<div></div>').addClass('col-md-4 cardCol').append(aLink);
    	 
    	 fragmentS.append(divCardCol);
    	 if((idx+1)%3==0 || idx==(datas.length-1)){
    		 var divCardCol =$('<div></div>').addClass('row cardRow').append(fragmentS);
    		 var divCarouselItem = $('<div></div>').addClass('carousel-item').append(divCardCol);
    		 if(idx==2 || ( idx<3 && (idx==datas.length-1))){divCarouselItem= divCarouselItem.addClass('active');}
    		 fragmentB.append(divCarouselItem);
    		 pagePostsCarousel=pagePostsCarousel+1;
    	 } 	 
     });
     
     $('#bgPosted .carousel-control-prev').before(fragmentB);
             
 }).fail(function(){
	 alert('已是最末筆資料');
 });

}


var pageSavesController = 1;
var pageSavesCarousel = 0;

function getSaves(){
	 $.getJSON('${pageContext.request.contextPath}/showSaves.do',{"memberID":userID,"page":pageSavesController},function(datas){ 
// 		 alert(JSON.stringify(datas));
//      	 alert(datas.length);
     	 $('#sumSaved').text(datas.length);
     	 
     	 //建立li
		 var liFragment = $(document.createDocumentFragment());
		 var start = pageSavesCarousel;
		 var end = pageSavesCarousel+(datas.length/3);
		 for(var i=start;i<end;i++){
			 var liIndicator = $('<li data-target="#bgSaved"></li>').attr('data-slide-to',i);
			 if(i==pageSavesCarousel){ liIndicator = liIndicator.addClass('active');}
			 liFragment.append(liIndicator);
		 }
		 $('#bgSaved .carousel-indicators').append(liFragment);

		 var fragmentB = $(document.createDocumentFragment());
		 var fragmentS = $(document.createDocumentFragment());
         $.each(datas,function(idx,getObj){
        	 
        	 if(getObj[2].memberPic){
         	 	var imgAuthPic=$('<img>').addClass('avatar').attr('src',"data:image/png;base64,"+getObj[2].memberPic);
         	 }else{
         		var imgAuthPic=$('<img>').addClass('avatar').attr('src',"data:image/png;base64,"+fbPic);
         	 }
        	 var spanAuth=$('<span></span>').text(getObj[2].memberName);
        	 var h6TheAuth2=$('<h6></h6>').addClass('theAuthor2').append(imgAuthPic,spanAuth);
        	 var aAuth = $('<a></a>').attr('href',memberPath+getObj[1].memberID).append(h6TheAuth2);
        	 var imgActCov=$('<img>').addClass('card-img-top img-fluid').attr('src',"data:image/png;base64,"+getObj[1].blogCover);
        	 
        	 var h4Title = $('<h4></h4>').addClass('card-title').text(getObj[1].blogTitle);
        	 var spanLocation = $('<span></span>').text('@'+getObj[1].blogCity);
//         	 alert(idx+"-"+getObj.actStatus);
        	 var spanActStatus = $('<span></span>').addClass('blogViews').text(getObj[1].blogView+' views'); 
        	 if(getObj[1].updateTime){
             	var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].updateTime).toLocaleString()+'<br/>編輯');
        	 }else{
        	    var smallTime = $('<span></span>').addClass('text-muted').html('於'+new Date(getObj[1].blogReleaseTime).toLocaleString()+'<br/>發佈');
        	 }
        	 var pText1=$('<p></p>').addClass('card-text').append(spanLocation,spanActStatus);

        	 var pText2=$('<p style="text-align:right; font-size:16px;"></p>').addClass('card-text').append(smallTime);
        	 var divCardBody=$('<div></div>').addClass('card-body').append(h4Title,pText1,pText2);
        	 var divCard=$('<div></div>').addClass('card').append(aAuth,imgActCov,divCardBody);
        	 var aLink=$('<a></a>').attr('href',blogPath+getObj[1].blogSNum).append(divCard);
        	 var divCardCol =$('<div></div>').addClass('col-md-4 cardCol').append(aLink);
        	 
        	 fragmentS.append(divCardCol);
        	 if((idx+1)%3==0 || idx==(datas.length-1)){
        		 var divCardCol =$('<div></div>').addClass('row cardRow').append(fragmentS);
        		 var divCarouselItem = $('<div></div>').addClass('carousel-item').append(divCardCol);
        		 if(idx==2 || ( idx<3 && (idx==datas.length-1))){divCarouselItem= divCarouselItem.addClass('active');}
        		 fragmentB.append(divCarouselItem);
        		 pageSavesCarousel=pageSavesCarousel+1;
        	 } 	 
         });
         
         $('#bgSaved .carousel-control-prev').before(fragmentB);
         
	 }).fail(function(){
		 alert('已是最末筆資料');
	 });
}

</script>