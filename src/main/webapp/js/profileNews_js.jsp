<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<script>
$(document).ready(function() {	
	
	//Follows,Joins,Saves按鈕點選出現Modal List
	 $('#showNews').on("click",".postButton button:nth-child(2)",function(){
//			alert(this.name+" is page!");
//			alert($(this).parents(".content").attr("name")+" is ID");
		var newsId=$(this).parents(".content").attr("name");
       if(this.name=="follows"){	
//        	alert("showdo1");
          showModalList(newsId,"follows");
       }else if(this.name=="saves"){
//        	alert("showdo2");
          showModalList(newsId,"saves");
       }
	});
	$('#showNews').on("click",".postButton button:nth-child(3)",function(){
//		alert(this.name+" is page!");
//		alert($(this).parents(".content").attr("name")+" is ID");
		var newsId=$(this).parents(".content").attr("name");
  		if(this.name=="joins"){		
//   			alert("showdo3");
       	showModalList(newsId,"joins");
    	}
	});	

   //按留言按鈕長出留言
  $('#showNews').on("click",".postButton button:nth-child(1)",function(){
//			alert(this.name+" is page!");
//			alert($(this).parents(".content").attr("name")+" is ID");
           if(this.name==1){			 
// 				alert(this.name+" is page!");
// 				alert(userPic);
              var divCommBox=$(this).parent().next();
              if(userPic!=""){
           		  var userAvatar = $("<img>").addClass("avatar").attr("src","data:image/png;base64,"+userPic);
              }else{
            	  var userAvatar = $("<img>").addClass("avatar").attr("src","data:image/png;base64,"+fbPic);
              }
              var userCommentsPic=$('<div class="commentsPic"></div>').append(userAvatar);
              var userNewComment = $('<div class="newComment"></div>').append(userCommentsPic,'<div class="commentsText"><textarea rows="2" cols="65" class="commentsArea" name="userNewComment" placeholder="&nbsp;回應"></textarea><button>留言</button></div>');
              divCommBox.append("<hr>",userNewComment);
//				divCommBox.slideDown(500);
              reqComms(this);
//				divCommBox.slideUp(0);
           }else{
              $(this).parent().next().slideToggle(1000);
           }
  });
  
   //按看更多獲取更多留言
  $('#showNews').on("click",".viewMore button",function(){
//		 alert($(this).parents(".content").find(".postButton button:nth-child(1)").attr("name")+" is page!");
//		 alert($(this).parents(".content").attr("name")+" is ID");
       var commBut = $(this).parents(".content").find(".postButton button:nth-child(1)");
       $($(this).parent(".viewMore")).after('<div id="loadersmall"></div>');
       $($(this).parent(".viewMore")).remove();
      setTimeout(function(){
          reqComms(commBut);
      },500); //timeoutEnd	
  });

  //留言輸入框動態增加高度
  $('#showNews').on("keyup",".commentsArea",function(){
      //  alert(this.rows);
      var lineNow=this.value.split('\n').length;
       if(lineNow>2){
          this.rows=lineNow;
       }
  });
  
  //新增一筆留言
  $('#showNews').on("click",".commentsText button",function(){
//      alert('我來留言了');
       var textC = $(this).prev().val();
       var articleTypeId = $(this).parents(".content").attr("name");
       var newComm = $(this).parents(".newComment");
       
       //for 留言數字變化用
       var butComm = $(this).parents(".commBox").prev().children("button:nth-child(1)");
       var butCommSpaceIdx = butComm.text().indexOf(' ');
       var butCommNum = butComm.text().substring(0,butCommSpaceIdx);
       var butCommNew = "<i class='far fa-comment'></i>"+(parseInt(butCommNum)+1)+" Comments";
  
//        alert(butCommNum);
//		 alert(textC);
       if(textC==""){
           alert('請輸入留言');
       }else{
//			 alert(articleTypeId +" is ID");
//			 alert(articleTypeId.split('_')[0]);
           var articleType = articleTypeId.split('_')[0];
           var articleNum = articleTypeId.split('_')[1];
//			 alert('articleNum='+articleNum);
           if(articleType=='act'){
               $.post('${pageContext.request.contextPath}/news_act_comments',{"actSNum":articleNum,"memberID":userId,"commentContent":textC},function(datas){
//					 alert(datas);
//					 alert(JSON.stringify(datas));
                   addComm(newComm,datas);
 				   butComm.html(butCommNew);   //留言數字加1
               },"json").fail(function(){
//					 alert('act_no~~why??');
               });
           }else if(articleType=='blog'){
               $.post('${pageContext.request.contextPath}/news_blog_comments',{"blogSNum":articleNum,"memberID":userId,"commentContent":textC},function(datas){
//					 alert(datas);
//					 alert(JSON.stringify(datas));
                   addComm(newComm,datas);
                   butComm.html(butCommNew);   //留言數字加1
               },"json").fail(function(){
//					 alert('blog_no~~why??');
               });
           }
       }
       $(this).prev().val("");
  });
  
  if($('#v-pills-news').hasClass('active')){
  	$('#loader').css("display","block");
  	reqNews();
  }
  $("#v-pills-news-tab").click(function(){
	   $('#showNews').empty();
	   isFetch=true;
	   scrollPage=1;
	   $('#loader').css("display","block");
	   reqNews();
  });
})

  var fbPic="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";	

  var userId = ${user.memberID};
  var userName= "${user.memberName}";
  var userPic = "${user.memberPicToBase64}";
  
  var isFetch=true;
  var scrollPage=1;
  
  //讀取動態牆
  function reqNews(){

       $.getJSON('${pageContext.request.contextPath}/readFriendsNews.do',{"page":scrollPage},function(datas){
//			 alert(scrollPage+"--"+JSON.stringify(datas));

           //外殼
           var fragment = $(document.createDocumentFragment());
           
           $.each(datas,function(idx,getObj){
               
               //頭
               if(getObj.posterPic && getObj.posterPic.length!=0){
                   var posterAvatar = $("<img>").addClass("avatar").attr("src","data:image/png;base64,"+getObj.posterPic);
               }else{
                   var posterAvatar = $("<img>").addClass("avatar").attr("src","data:image/jpeg;base64,"+fbPic);
               }
               var posterName= $("<span></span>").text(getObj.posterName);
               var posterHref= $("<a></a>").attr('href',memberPath+getObj.posterID+userPath).append(posterAvatar,posterName);
               var posterAction= $("<span></span>").text(" "+getObj.posterAction+",");
               var postTime=$("<span></span>").text(" 在"+new Date(getObj.postTime).toLocaleString());
               var divPoster=$("<div></div>").addClass("poster").append(posterHref,posterAction,postTime);
               
               
               //中
               if(getObj.articlePhoto && getObj.articlePhoto.length!=0){//alert("1");
                  var imgPostPhoto=$("<img>").addClass("postPhoto").attr("src","data:image/png;base64,"+getObj.articlePhoto);
               }else{//alert("2");
                  var imgPostPhoto=$("<img>").addClass("postPhoto").attr("src","http://www.india.com/wp-content/uploads/2018/08/world.jpg");
               }
               
//             alert(getObj.authorName+","+getObj.authorPic);
               if(getObj.authorPic && getObj.authorPic.length!=0){
                   var authorPic=$("<img>").addClass("avatar").attr("src","data:image/png;base64,"+getObj.authorPic);
                   var authorName=$("<span></span>").text(getObj.authorName);
                   var authorHref=$("<a></a>").attr('href',memberPath+getObj.authorID+userPath).append(authorPic,authorName);
               }
       
               var authorTime=$("<span></span>").text(" "+new Date(getObj.articleTime).toDateString());
               var spanLocation=$("<span></span>").text(", @"+getObj.articleLocation);
               
               if(getObj.blogSNum){
            	   var spanRating=$("<span></span>").addClass("starRating");
                   for(var i=0;i<getObj.rating;i++){
                       spanRating.append('<i class="fas fa-star checked"></i>');
                   }
                   if(getObj.ratingPoints>=0.5){spanRating.append('<i class="fas fa-star-half-alt checked"></i>');}
                   else{spanRating.append('<i class="fas fa-star"></i>');}	
                   for(var i=0;i<(5-getObj.rating-1);i++){
                       spanRating.append('<i class="fas fa-star"></i>');
                   }
                   
               }
               
                   
               var h6TheAuthor=$("<h6></h6>").addClass("theAuthor").append(authorHref,"&nbsp;&nbsp;",authorTime,spanLocation,spanRating);
               var divPostPhotoDiv=$("<div></div>").addClass("postPhotoDiv").append(imgPostPhoto,h6TheAuthor);
               
               
               var h3Title=$("<h3 style='font-weight:normal;'></h3>").text(getObj.articleTitle);
//                var pContext=$("<p></p>").html(getObj.articleContent.substr(0,300)+"  ...");
			   var pContext=$("<p></p>").html("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"+getObj.articleContent);
               var divPostText=$("<div></div>").addClass("postText").append(h3Title,pContext);
               
               var divPostAll=$("<div></div>").addClass("postAll").append(divPostPhotoDiv,divPostText);
               
               if(getObj.actSNum){    //是活動
            	   var postHref= $("<a></a>").attr('href',actPath+getObj.actSNum).append(divPostAll);
               }else if(getObj.blogSNum){                    //是網誌
                   var postHref= $("<a></a>").attr('href',blogPath+getObj.blogSNum).append(divPostAll);
               }
               
               var butA=$('<button><i class="far fa-comment"></i></button>').append(getObj.commentsNum," Comments");
               
               if(getObj.actSNum){//是活動
                   butA.attr("name","1");
                   var butB=$('<button name="follows" style="margin-left:5px;margin-right:5px;"><i class="far fa-heart"></i></button>').append(getObj.followsNum," Follows");
                   var butC=$('<button name="joins"><i class="far fa-plus-square"></i></button>').append(getObj.joinsNum," Joins");
               }else if(getObj.blogSNum){   			//是網誌
                   butA.attr("name","1");
                   var butB=$('<button name="saves" style="margin-left:5px;margin-right:5px;"><i class="far fa-heart"></i></button>').append(getObj.savesNum," Saves");
                   var butC=$('<button><i class="far fa-eye"></i></button>').append(getObj.viewsNum," Views");
               }
               
               var divPostButton=$("<div></div>").addClass("postButton").append(butA,butB,butC);
       
               var divContent=$("<div></div>").addClass("content").append(divPoster,postHref,divPostButton,"<div class='commBox'></div>");
              
               if(getObj.actSNum){    //是活動
                   divContent.attr("name","act_"+getObj.actSNum);
               }else if(getObj.blogSNum){                    //是網誌
                   divContent.attr("name","blog_"+getObj.blogSNum);
               }
               
               var divCol=$("<div></div>").addClass("col").append(divContent);
               var divNewsRow=$("<div></div>").addClass("row newsRow").append(divCol);
               fragment.append(divNewsRow);
           });
          
           $('#showNews').append(fragment);

           scrollPage=scrollPage+1;
           isFetch=true;
      }).fail(function(){
//			alert("已無更舊資料!!");
          $('#newsEnd').text("There are no more posts to show right now!");
      }).always(function(){
          $('#loader').css("display","none");
      });


  }
  
  //讀取留言
  function reqComms(input){
      var myArticleId = $(input).parents(".content").attr("name");
// 		var myPage = input.name;
      var myPage = $(input).attr("name");
// 		alert(myArticleId+"-"+myPage);
      $.getJSON('${pageContext.request.contextPath}/readCommsById.do',{"articleId":myArticleId,"first":myPage},function(datas){
// 			alert(JSON.stringify(datas));
// 			alert(datas.length);
          var fragment = $(document.createDocumentFragment());

          $.each(datas,function(idx,getObj){
// 				alert(getObj[1].memberID+"-"+getObj[1].memberName+"-"+getObj[0].commentContent+"-"+getObj[0].replyTime);
				    
              if(getObj[1].memberPic){
                  var imgAvatar=$('<img>').addClass("avatar").attr("src","data:image/png;base64,"+getObj[1].memberPic);
              }
              else{
                  var imgAvatar=$('<img>').addClass("avatar").attr("src","data:image/jpeg;base64,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");
              }
              var divCommentsPic=$('<div class="commentsPic"></div>').append(imgAvatar);
              
              var spanCommName=$('<span style="font-size:20px; font-weight:bold;"></span>').text(getObj[1].memberName);
              var aCommHref=$('<a></a>').attr('href',memberPath+getObj[1].memberID+userPath).append(spanCommName);
              var spanCommTime=$('<span style="color:#657786;"></span>').text(new Date(getObj[0].replyTime).toLocaleString());
              var spanCommCont=$('<p></p>').html(getObj[0].commentContent);
              var divCommentsText=$('<div class="commentsText"></div>').append(aCommHref,"&nbsp;",spanCommTime,spanCommCont);
          
              var divComment= $('<div class="comments"></div>').append(divCommentsPic,divCommentsText);
              fragment.append(divComment);
          });

          fragment.append('<div class="viewMore"><button>View more</button></div>');
//			$(input).parents(".content").append(fragment);
          fragment.appendTo($(input).parents(".content").find(".commBox"));
//			input.name = parseInt(myPage) + 1;
          $(input).attr("name",parseInt(myPage)+5);
      
//			$(input).parent().next().hide();
//			$(input).parent().next().slideDown(1000);
      }).fail(function(){
// 		  alert("已無更舊留言!!");
          $(input).parent().next().append('<div style="color:#D12C84; text-align:center; font-size:16px;">No other comments.</div>');
          $(input).attr("name",1001);
      }).always(function(){
          $('#loadersmall').remove();
      });
  }
  
  //新增留言
  function addComm(input,datas){
//		    var fragment = $(document.createDocumentFragment());
          if(userPic){
              var imgAvatar=$('<img>').addClass("avatar").attr("src","data:image/png;base64,"+userPic);
          }
          else{
              var imgAvatar=$('<img>').addClass("avatar").attr("src","data:image/jpeg;base64,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");
          }
          var divCommentsPic=$('<div class="commentsPic"></div>').append(imgAvatar);
          var spanCommName=$('<span style="font-size:20px; font-weight:bold;"></span>').text(userName);
          var aCommHref=$('<a></a>').attr('href',memberPath+userID+userPath).append(spanCommName);
          var spanCommTime=$('<span style="color:#657786;"></span>').text(new Date(datas.replyTime).toLocaleString());
          var spanCommCont=$('<p></p>').html(datas.commentContent);
          var divCommentsText=$('<div class="commentsText"></div>').append(aCommHref,"&nbsp;",spanCommTime,spanCommCont);
      
           var divComment= $('<div class="comments"></div>').append(divCommentsPic,divCommentsText);
//			fragment.append(divComment);
          input.after(divComment);
          
//           if($(input).parents(".content").find(".fa-comment").parent().attr('name')!=1001){
//               $(input).parents(".content").find(".viewMore").prev().remove();
//           }
		  var oldIdx = $(input).parents(".content").find(".fa-comment").parent().attr('name');
		  $(input).parents(".content").find(".fa-comment").parent().attr('name',parseInt(oldIdx)+1);
  }
  
  //產生Modal List 內容
  function showModalList(newsId,type){
// 	  alert("newsId="+newsId);
	  $('#myModalBody').empty();
	  $('#listModalLongTitle').text(type+" list");
	  $.getJSON('${pageContext.request.contextPath}/readBelongList.do',{"news":newsId,"type":type},function(datas){
// 		  alert(JSON.stringify(datas));
// 		  alert(datas.length);
		  var fragment = $(document.createDocumentFragment());
          $.each(datas,function(idx,getObj){
        	 var imgModalAvatar = $('<img>').addClass("modalAvatar").attr("src","data:image/png;base64,"+getObj[2]);
        	 var spanModalName = $('<span></span>').addClass("modalName").text(getObj[1]);
        	 var divMemberList = $('<div></div>').addClass("memberList").append(imgModalAvatar,spanModalName);
        	 var aListHref = $('<a></a>').attr('href',memberPath+getObj[0]+userPath).attr('target','_blank').append(divMemberList);
        	 fragment.append(aListHref);
          });
          $('#myModalBody').append(fragment);
          $('#listModalCenter').modal('show')
	  }).fail(function(){
		  alert("no one present");
      });
  }
  
  $(window).scroll(function(){
       //最後一頁scrollTop=body-window，50是預留空間
	   	if($('#v-pills-news').hasClass('active')){
//	   		alert('現在News');
	        last=$("#showNews").height()-$(window).height()
//	 	      $("#text").text(last);
	        if($(window).scrollTop()>=last && isFetch==true){
//	 	        alert(isFetch);
	           isFetch=false;
	           $('#loader').css("display","block");
	           setTimeout(function(){
	                reqNews();
	           },1000); //timeoutEnd	
	        }
	   	}
  })
</script>